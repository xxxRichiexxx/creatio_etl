SELECT *
FROM dbo.Period
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn <= '{1}';