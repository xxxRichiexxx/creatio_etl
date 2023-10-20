SELECT *
FROM dbo.TsiPoll
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn <= '{1}';