/* Number of job instances */
SELECT 'JobInstances_Count', COUNT(*) FROM uj_jobinstances;
SELECT 'TaskInstances_Count', COUNT(*) FROM uj_taskinstances;

/* Number of job instances in the last week */
SELECT 'JobInstances_WeekCount', COUNT(*) FROM uj_jobinstances WHERE startdate>DATEADD(day, -7, current_timestamp);

/* Number of job instances in the last day */
SELECT 'JobInstances_DayCount', COUNT(*) FROM uj_jobinstances WHERE startdate>DATEADD(day, -1, current_timestamp);

/* Number of job instances in the last day */
SELECT 'JobInstances_DayCount_Error', COUNT(*) FROM uj_jobinstances WHERE startdate>DATEADD(day, -1, current_timestamp) AND state=3;
SELECT 'JobInstances_DayCount_Blocked', COUNT(*) FROM uj_jobinstances WHERE startdate>DATEADD(day, -1, current_timestamp) AND state IN (5,6);
SELECT 'JobInstances_DayCount_Warning', COUNT(*) FROM uj_jobinstances WHERE startdate>DATEADD(day, -1, current_timestamp) AND state IN (7,10);

