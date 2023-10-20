SELECT *
FROM dbo.NavNpsCalculationType
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn < '{1}';