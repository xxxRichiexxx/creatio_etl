
import sqlalchemy as sa
from urllib.parse import quote
import datetime as dt

from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.task_group import TaskGroup
from airflow.hooks.base import BaseHook
from airflow.operators.dummy import DummyOperator
from airflow.contrib.operators.vertica_operator import VerticaOperator
from airflow.operators.python import BranchPythonOperator

from creatio_etl.scripts.collable import etl


source_con = BaseHook.get_connection('creatio')
source_username = source_con.login
source_password = quote(source_con.password)
source_host = source_con.host
source_db = source_con.schema
eng_str = fr'mssql://{source_username}:{source_password}@{source_host}/{source_db}?driver=ODBC Driver 18 for SQL Server&TrustServerCertificate=yes'
source_engine = sa.create_engine(eng_str)

dwh_con = BaseHook.get_connection('vertica')
ps = quote(dwh_con.password)
dwh_engine = sa.create_engine(
    f'vertica+vertica_python://{dwh_con.login}:{ps}@{dwh_con.host}:{dwh_con.port}/sttgaz'
)


default_args = {
    'owner': 'Швейников Андрей',
    'email': ['xxxRichiexxx@yandex.ru'],
    'retries': 3,
    'retry_delay': dt.timedelta(minutes=30),
}
with DAG(
        'creatio',
        default_args=default_args,
        description='Получение данных из УОС (creatio).',
        start_date=dt.datetime(2021, 1, 1),
        schedule_interval='@daily',
        catchup=True,
        max_active_runs=1
) as dag:

    data_types = [
            'stage_creatio_NavNpsCalcutaion',
            'stage_creatio_TsiPoll',
            'stage_creatio_NavNpsCalculationType',
            'stage_creatio_Account',
            'stage_creatio_NavGeoRegion',
            'stage_creatio_NavYesNo',
            'stage_creatio_NavConversationScriptType',
            'stage_creatio_TsiPollType',
            'stage_creatio_ConversationScript',
            'stage_creatio_NavPollStatus',
            'stage_creatio_NavQuotaType',
            'stage_creatio_Period',
            'stage_creatio_Country',
            'stage_creatio_NavPollDirection',
            'stage_creatio_AccountType',
        ]

    start = DummyOperator(task_id='Начало')

    with TaskGroup('Загрузка_данных_в_stage_слой') as data_to_stage:

        daily_tasks = []

        for data_type in data_types:
            daily_tasks.append(
                PythonOperator(
                    task_id=f'get_{data_type}',
                    python_callable=etl,
                    op_kwargs={
                        'data_type': data_type,
                        'source_engine': source_engine,
                        'dwh_engine': dwh_engine,                    },
                )
            )

    with TaskGroup('Загрузка_данных_в_dds_слой') as data_to_dds:

        pass

    with TaskGroup('Загрузка_данных_в_dm_слой') as data_to_dm:

        pass

    with TaskGroup('Проверки') as data_checks:

        pass

    end = DummyOperator(task_id='Конец')

    start >> data_to_stage >> data_to_dds >> data_to_dm >> data_checks >> end
