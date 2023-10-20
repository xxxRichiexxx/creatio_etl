SELECT *
FROM dbo.TsiPollType
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn < '{1}';