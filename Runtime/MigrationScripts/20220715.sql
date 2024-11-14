/* 0 is a forbidden id */
DELETE FROM UR_ResourceLinks WHERE r1_id=0;
GO
DELETE FROM UR_ResourceLinks WHERE r2_id=0;
GO

/* duplicate lines in ur_resourelinks */
SELECT DISTINCT type,R1_Id,R2_Id INTO #linksdup
FROM UR_ResourceLinks
WHERE "validto"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
GROUP BY type,R1_Id,R2_Id
HAVING count(*)>1;

DELETE l FROM UR_ResourceLinks l
JOIN #linksdup d ON d.Type=l.Type AND d.R1_Id=l.R1_Id AND d.R2_Id=l.R2_Id AND l."validto"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)

INSERT INTO UR_ResourceLinks ([type],R1_Id,R2_Id) SELECT DISTINCT * from #linksdup
DROP TABLE #linksdup
GO

/* wrong links */

DELETE
FROM UR_ResourceLinks
WHERE "validto"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND R1_Id NOT IN (SELECT id FROM ur_resources WHERE "validto"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121))

DELETE
FROM UR_ResourceLinks
WHERE "validto"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND R2_Id NOT IN (SELECT id FROM ur_resources WHERE "validto"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121))
GO
