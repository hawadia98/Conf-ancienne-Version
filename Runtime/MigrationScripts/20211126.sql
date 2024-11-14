UPDATE uj_jobs
SET loglevel = 6
WHERE identifier LIKE '%_VirtualJob' OR isconnectorjob = 1;

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorExport';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorPrepareSynchronization';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorSynchronization';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorExpression';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorCorrelation';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorPolicy';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorGenerateOrders';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorFulfillment';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorClassification';

UPDATE uj_tasks
SET loglevel = 6
WHERE identifier LIKE '%_ConnectorBuildRoleModel';
GO

INSERT INTO uj_jobsteps(id,task_id,job_id,launchOrder,level)
SELECT (SELECT MIN(id) FROM uj_jobsteps) - ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), t.id, j.id, 0, 0
FROM uj_jobs j
JOIN uj_tasks t ON SUBSTRING(j.identifier, 0, LEN(j.identifier)-LEN('_VirtualJob')+1) = SUBSTRING(t.identifier, 0, LEN(SUBSTRING(j.identifier, 0, LEN(j.identifier)-LEN('_VirtualJob')+1))+1)
WHERE j.identifier LIKE '%_VirtualJob'
AND
(
 t.identifier LIKE '%_ConnectorExport' OR
 t.identifier LIKE '%_ConnectorPrepareSynchronization' OR
 t.identifier LIKE '%_ConnectorSynchronization' OR
 t.identifier LIKE '%_ConnectorExpression' OR
 t.identifier LIKE '%_ConnectorCorrelation' OR
 t.identifier LIKE '%_ConnectorPolicy' OR
 t.identifier LIKE '%_ConnectorGenerateOrders' OR
 t.identifier LIKE '%_ConnectorFulfillment' OR
 t.identifier LIKE '%_ConnectorClassification' OR
 t.identifier LIKE '%_ConnectorBuildRoleModel'
)
GO

UPDATE t SET t.connector_id = co.Id
FROM uj_tasks t
JOIN uj_jobs j ON SUBSTRING(j.identifier, 0, LEN(j.identifier)-LEN('_VirtualJob')+1) = SUBSTRING(t.identifier, 0, LEN(SUBSTRING(j.identifier, 0, LEN(j.identifier)-LEN('_VirtualJob')+1))+1)
JOIN uc_connectors co ON co.identifier = SUBSTRING(j.identifier, 0, LEN(j.identifier)-LEN('_VirtualJob')+1)
WHERE j.identifier LIKE '%_VirtualJob'
AND
(
 t.identifier LIKE '%_ConnectorPrepareSynchronization' OR
 t.identifier LIKE '%_ConnectorSynchronization' OR
 t.identifier LIKE '%_ConnectorExpression' OR
 t.identifier LIKE '%_ConnectorCorrelation' OR
 t.identifier LIKE '%_ConnectorPolicy' OR
 t.identifier LIKE '%_ConnectorGenerateOrders' OR
 t.identifier LIKE '%_ConnectorFulfillment' OR
 t.identifier LIKE '%_ConnectorBuildRoleModel'
)
GO
