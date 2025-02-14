IF COL_LENGTH('dbo.UP_CompositeRoleRules', 'BaseRule_Id') IS NULL
BEGIN
    ALTER TABLE UP_CompositeRoleRules
    ADD BaseRule_Id BIGINT DEFAULT ((0)) NULL;
END

GO

IF COL_LENGTH('dbo.UP_SingleRoleRules', 'BaseRule_Id') IS NULL
BEGIN
    ALTER TABLE UP_SingleRoleRules
    ADD BaseRule_Id BIGINT DEFAULT ((0)) NULL;
END

GO

IF COL_LENGTH('dbo.UP_ResourceTypeRules', 'BaseRule_Id') IS NULL
BEGIN
    ALTER TABLE UP_ResourceTypeRules
    ADD BaseRule_Id BIGINT DEFAULT ((0)) NULL;
END

GO

IF COL_LENGTH('dbo.UP_ResourceNavigationRules', 'BaseRule_Id') IS NULL
BEGIN
    ALTER TABLE UP_ResourceNavigationRules
    ADD BaseRule_Id BIGINT DEFAULT ((0)) NULL;
END

GO

CREATE TABLE #tmp_ua_accesscontrolpermissions(id BIGINT NOT NULL PRIMARY KEY, identifier NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS  NOT NULL);
INSERT INTO #tmp_UA_AccessControlPermissions(id, identifier) VALUES
(4611686018427515903,'/ProvisioningPolicy/PendingApprovalRule'),
(4611686018427515905,'/ProvisioningPolicy/PendingApprovalRule/Create'),
(4611686018427388461,'/ProvisioningPolicy/PendingApprovalRule/CreateSimulation'),
(4611686018427515907,'/ProvisioningPolicy/PendingApprovalRule/Delete'),
(4611686018427388463,'/ProvisioningPolicy/PendingApprovalRule/DeleteSimulation'),
(4611686018427515904,'/ProvisioningPolicy/PendingApprovalRule/Query'),
(4611686018427388460,'/ProvisioningPolicy/PendingApprovalRule/Simulation'),
(4611686018427515906,'/ProvisioningPolicy/PendingApprovalRule/Update'),
(4611686018427388462,'/ProvisioningPolicy/PendingApprovalRule/UpdateSimulation');

INSERT INTO "#tmp_ua_accesscontrolpermissions"("id","identifier") VALUES
(4611686018427388476, '/ProvisioningPolicy/CompositeRole/RevertSimulation')
,(4611686018427388466, '/ProvisioningPolicy/CompositeRoleRule/RevertSimulation')
,(4611686018427388467, '/ProvisioningPolicy/ContextRule/RevertSimulation')
,(4611686018427388478, '/ProvisioningPolicy/PendingApprovalRule/RevertSimulation')
,(4611686018427388464, '/ProvisioningPolicy/Policy/RevertSimulation')
,(4611686018427388468, '/ProvisioningPolicy/ResourceBinaryRule/RevertSimulation')
,(4611686018427388469, '/ProvisioningPolicy/ResourceClassificationRule/RevertSimulation')
,(4611686018427388470, '/ProvisioningPolicy/ResourceCorrelationRule/RevertSimulation')
,(4611686018427388471, '/ProvisioningPolicy/ResourceNavigationRule/RevertSimulation')
,(4611686018427388472, '/ProvisioningPolicy/ResourceQueryRule/RevertSimulation')
,(4611686018427388473, '/ProvisioningPolicy/ResourceScalarRule/RevertSimulation')
,(4611686018427388477, '/ProvisioningPolicy/ResourceType/RevertSimulation')
,(4611686018427388474, '/ProvisioningPolicy/ResourceTypeRule/RevertSimulation')
,(4611686018427388475, '/ProvisioningPolicy/SingleRole/RevertSimulation')
,(4611686018427388465, '/ProvisioningPolicy/SingleRoleRule/RevertSimulation');

INSERT INTO ua_accesscontrolpermissions(id,identifier) SELECT id,identifier FROM #tmp_ua_accesscontrolpermissions WHERE id NOT IN (select id from ua_accesscontrolpermissions);
DROP TABLE #tmp_ua_accesscontrolpermissions;
GO
