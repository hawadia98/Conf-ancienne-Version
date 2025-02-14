/* Number of changed lines during the day */
SELECT 'Resources_CreatedCount', SUM(c) FROM (
SELECT COUNT(*) c FROM ur_resources WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM ur_resourcelinks WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM ur_resourcefiles WHERE validfrom>DATEADD(day, -1,  current_timestamp)
) aa;

SELECT 'Resources_DeletedCount', SUM(c) FROM (
SELECT COUNT(*) c FROM ur_resources WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM ur_resourcelinks WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM ur_resourcefiles WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
) aa;

SELECT 'Assigned_CreatedCount', SUM(c) FROM (
SELECT COUNT(*) c FROM up_assignedcompositeroles WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM up_assignedsingleroles WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcetypes WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcenavigations WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcescalars WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcebinaries WHERE validfrom>DATEADD(day, -1,  current_timestamp)
UNION ALL
SELECT COUNT(*) FROM up_identifiedrisks WHERE validfrom>DATEADD(day, -1,  current_timestamp)
) aa;

SELECT 'Assigned_DeletedCount', SUM(c) FROM (
SELECT COUNT(*) c FROM up_assignedcompositeroles WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM up_assignedsingleroles WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcetypes WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcenavigations WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcescalars WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM up_assignedresourcebinaries WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
UNION ALL
SELECT COUNT(*) FROM up_identifiedrisks WHERE validto>DATEADD(day, -1,  current_timestamp) AND validto<current_timestamp
) aa;

