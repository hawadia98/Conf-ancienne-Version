/* Duration of all the server tasks */
SELECT 'TaskInstances_Duration', SUM(DATEDIFF(s,startdate,enddate))
FROM uj_taskinstances ti
JOIN uj_tasks t ON t.id=ti.task_id AND t.tasktype IN (10,20,22,7,1,3,5,8,9,21,24,29,48,63,25,26,27,51,40,41,42,44,4,47,49,2000,52,66,1000)
WHERE DATEDIFF(s,startdate,enddate)<3*60*60
AND ti.startdate>DATEADD(day, -1, CURRENT_TIMESTAMP);

/* Duration of all the role reviews */
/*
SELECT 'SingleRoles_ReviewDuration', COALESCE(AVG(DATEDIFF(s,whencreated,whenreviewed1)),0)
FROM up_assignedsingleroles
WHERE "validto"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND whenreviewed1 IS NOT NULL
AND whenreviewed1>DATEADD(day, -1, CURRENT_TIMESTAMP);
*/
