SELECT *
FROM dbo.NavGeoRegion
WHERE ModifiedOn >= '{0}'
    AND ModifiedOn < '{1}';