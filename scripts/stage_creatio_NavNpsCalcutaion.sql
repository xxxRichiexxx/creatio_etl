SELECT *
FROM dbo.NavNpsCalcutaion
WHERE DATE_TRUNC('MONTH', ModifiedOn) = '{0}';