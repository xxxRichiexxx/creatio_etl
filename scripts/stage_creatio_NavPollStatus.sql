SELECT *
FROM dbo.NavPollStatus
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn <= '{1}';