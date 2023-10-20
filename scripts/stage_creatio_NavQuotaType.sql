SELECT *
FROM dbo.NavQuotaType
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn < '{1}';