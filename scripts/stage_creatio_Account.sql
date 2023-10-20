SELECT *
FROM dbo.Account
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn < '{1}';