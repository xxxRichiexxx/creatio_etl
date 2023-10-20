SELECT *
FROM dbo.Country
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn <= '{1}';