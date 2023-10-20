SELECT *
FROM dbo.NavYesNo
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn < '{1}';