import pandas as pd
import numpy as np
import datetime as dt
from pprint import pprint
import os


def extract(
        source_engine,
        data_type,
        start_date=None,
        end_date=None
):
    """Извлечение данных из источника."""

    print('Извлекаем данные из БД')

    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), f'{data_type}.sql')

    with open(path, 'r', encoding="utf-8") as f:
        command = f.read().format(start_date, end_date)

    print(command)

    data = pd.read_sql_query(
        command,
        source_engine,
        dtype_backend='pyarrow',
    )

    pprint(data)
    return data


def transform(data, column_names=None, execution_date=None):
    """Преобразование/трансформация данных."""

    print('ТРАНСФОРМАЦИЯ ДАННЫХ')
    print('Исходные поля:',  data.columns)

    if not data.empty:
        if column_names:
            data.columns = column_names

        if execution_date:
            data['load_date'] = execution_date.replace(day=1)
    else:
        print('Нет новых данных для загрузки.')
    return data


def load(data, dwh_engine, data_type, start_date, end_date):
    """Загрузка данных в хранилище."""

    print('ЗАГРУЗКА ДАННЫХ')
    if not data.empty:

        print(data)

        ids = ','.join(tuple(data['Id']))

        command = f"""
            DELETE FROM sttgaz.{data_type}
            WHERE Id IN ({ids});
        """
        print(command)

        dwh_engine.execute(command)

        data.to_sql(
            f'{data_type}',
            dwh_engine,
            schema='sttgaz',
            if_exists='append',
            index=False,
        )

        initial_rows_count = len(data)

        result_rows_count = pd.read_sql_query(
            f"""
            SELECT COUNT(*)
            FROM sttgaz.{data_type}
            WHERE ModifiedOn >= '{start_date}'
                AND ModifiedOn <= '{end_date}';
                        """,
            dwh_engine,
        ).values[0][0]

        if initial_rows_count != result_rows_count:
            raise Exception('Количество строк в источнике и хранилище не совпадают:', initial_rows_count, result_rows_count)
        
        print('Получено', initial_rows_count , 'Загружено', result_rows_count)
    else:
        print('Нет новых данных для загрузки.')


def etl(
    source_engine,
    dwh_engine,
    data_type,
    column_names=None,
    column_to_check=None,
    **context,
):
    """Запускаем ETL-процесс для заданного типа данных."""

    execution_date = context['execution_date'].date()

    start_date = execution_date.replace(day=1)
    end_date = (execution_date.replace(day=28) + dt.timedelta(days=4)) \
        .replace(day=1) - dt.timedelta(days=1)

    data = extract(
        source_engine,
        data_type,
        start_date,
        end_date,
    )
    data = transform(data, column_names)

    load(data, dwh_engine, data_type, start_date, end_date)

    if column_to_check:

        try:
            data[column_to_check] = data[column_to_check].str.strip()
            data = data.replace(r'^\s*$', np.nan, regex=True)
            data[column_to_check] = data[column_to_check].fillna(0).astype(np.int64)
            value = sum(data[column_to_check])
        except KeyError:
            value = 0

        context['ti'].xcom_push(
            key=data_type,
            value=value
        )
