SELECT *
FROM dbo.AccountType
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn <= '{1}';