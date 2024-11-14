INSERT INTO "ua_accesscontrolpermissions"("id","identifier") VALUES (4611686018427388253, '/Custom/ResourceFiles');
GO

DECLARE @ID BIGINT;
SELECT @ID=COALESCE(MAX("id"),1) FROM "ua_accesscontrolpermissions" WHERE "id"<2611686018427387903;
INSERT INTO "ua_accesscontrolpermissions"("id","identifier")
SELECT @ID+ROW_NUMBER() OVER (ORDER BY rid)+1,* 
FROM (
    SELECT '/Custom/ResourceFiles/'+"identifier" COLLATE SQL_Latin1_General_CP1_CS_AS rid
    FROM "um_entitytypes"
    WHERE "id"<2147483653
    UNION ALL
    SELECT '/Custom/ResourceFiles/'+et."identifier"+'/'+ep."identifier" COLLATE SQL_Latin1_General_CP1_CS_AS rid
    FROM "um_entitytypes" et
    JOIN "um_entityproperties" ep on ep."entitytype_id"=et."id" AND ep."type"=8
    WHERE et."id"<2147483653
    UNION ALL
    SELECT '/Custom/ResourceFiles/'+et."identifier"+'/'+ep."identifier"+'/View' COLLATE SQL_Latin1_General_CP1_CS_AS rid
    FROM "um_entitytypes" et
    JOIN "um_entityproperties" ep on ep."entitytype_id"=et."id" AND ep."type"=8
    WHERE et."id"<2147483653
    EXCEPT
    SELECT "identifier" FROM "ua_accesscontrolpermissions"
) aa
GO

DECLARE @CustomResourceFilesPermissionID BIGINT = (SELECT "id" FROM "ua_accesscontrolpermissions" WHERE "identifier" LIKE '/Custom/ResourceFiles')
INSERT INTO "ua_accesscontrolentries"("id","permission_id","canexecute","rule_id")
SELECT (SELECT COALESCE(MIN("id"),0)-1 FROM "ua_accesscontrolentries")-ROW_NUMBER() OVER(ORDER BY aa."ruleid" ASC), aa.*
FROM (
    SELECT @CustomResourceFilesPermissionID permissionId, 1 canExecute, acr."id" ruleId
    FROM "ua_accesscontrolrules" acr
	WHERE acr."id" IN (
		SELECT DISTINCT "rule_id"
		FROM "ua_accesscontrolentries" ae 
		join "ua_accesscontrolpermissions" ap on ap."id" = ae."permission_id"
		WHERE ap."identifier" like '/Custom/Resources%'
		EXCEPT
		SELECT DISTINCT "rule_id"
		FROM "ua_accesscontrolentries" ae 
		WHERE ae."permission_id" = @CustomResourceFilesPermissionID
	)
) aa
GO

DROP INDEX "IX_AssignedCompositeRoles_RoleReview" ON "UP_AssignedCompositeRoles"
GO
CREATE INDEX "IX_AssignedCompositeRoles_RoleReview" ON "UP_AssignedCompositeRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","Comment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25)
GO

DROP INDEX "IX_AssignedSingleRoles_RoleReview" ON "UP_AssignedSingleRoles"
GO
CREATE INDEX "IX_AssignedSingleRoles_RoleReview" ON "UP_AssignedSingleRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","Comment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25)
GO

DECLARE @SQL varchar(max)=''
Select @SQL = @SQL + 'EXEC sp_rename N''' + t.name + '.' + i.name + ''',N''' + 'ZZ_' + i.name + ''',' + 'N''INDEX'';'
FROM "sys"."indexes" i 
JOIN "sys"."tables" t ON t."object_id"=i."object_id"
WHERE i."name" LIKE 'IX_%' AND i."name" NOT IN
('IX_AssignedProfiles_UserInfos','IX_ProfileContexts_CompositeRole','IX_ProfileContexts_SingleRole','IX_ProfileContexts_ResourceType','IX_ProfileContexts_Category','IX_JobInstances_CancelRequested','IX_TaskInstances_JobInstance','IX_EntityAssociations','IX_EntityProperties','IX_EntityProperties_EntityType','IX_EntityTypes','IX_AssignedCompositeRoles_RoleReview','IX_AssignedCompositeRoles_RoleReconciliation','IX_AssignedCompositeRoles_DashboardCounter_ReviewRoles_V1','IX_AssignedCompositeRoles_DashboardCounter_ReconciliateRoles_V1','IX_AssignedCompositeRoles_History','IX_AssignedResourceNavigations_History','IX_AssignedResourceTypes_Resource','IX_AssignedResourceTypes_NeedsPolicyApplication','IX_AssignedResourceTypes_HasPendingOrders','IX_AssignedResourceTypes_ProvisioningReview','IX_AssignedResourceTypes_ResourceReconciliation','IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred','IX_AssignedResourceTypes_DashboardCounter_ReviewProvisioning_V1','IX_AssignedResourceTypes_DashboardCounter_PerformManualProvisioning_V1','IX_AssignedResourceTypes_DashboardCounter_ReconciliateResources_V1','IX_AssignedResourceTypes_History','IX_AssignedSingleRoles_RoleReview','IX_AssignedSingleRoles_RoleReconciliation','IX_AssignedSingleRoles_DashboardCounter_ReviewRoles_V1','IX_AssignedSingleRoles_DashboardCounter_ReconciliateRoles_V1','IX_AssignedSingleRoles_History','IX_CompositeRoleRules','IX_CompositeRoles','IX_CompositeRoles_View_L1','IX_IndirectResourceRules','IX_MiningRules','IX_Policies','IX_ResourceBinaryRules','IX_ResourceClassificationRules','IX_ResourceCorrelationKeys','IX_ResourceCorrelationRules','IX_ResourceNavigationRules','IX_ResourceQueryRules','IX_ResourceScalarRules','IX_ResourceTypeRules','IX_ResourceTypes','IX_ResourceTypes_View_L1','IX_Risks','IX_SingleRoleRules','IX_SingleRoles','IX_SingleRoles_View_L1','IX_ResourceChanges','IX_ResourceFileChanges','IX_ResourceFiles','IX_ResourceFiles2','IX_ResourceLinkChanges','IX_ResourceLinks_2','IX_ResourceLinks_1','IX_Resources','IX_Resources_DisplayName_L1','IX_Resources_Dirty','IX_Resources_PrimaryKey','IX_Resources_U0','IX_Resources_U1','IX_Resources_U2','IX_Resources_R0','IX_Resources_History','IX_ActivityInstancesActors_ActivityInstance','IX_ActivityInstancesPerformers_Performer')
EXEC (@SQL)
GO

DECLARE @SQL varchar(max)=''
Select @SQL = @SQL + 'EXEC sp_rename N''' + t.name + '.' + i.name + ''',N''' + 'ZZ_' + i.name + ''',' + 'N''STATISTICS'';'
FROM "sys"."stats" i 
JOIN "sys"."tables" t ON t."object_id"=i."object_id"
WHERE i."name" LIKE 'S_%' AND i."name" NOT IN
('S_AssignedCompositeRoles_Type','S_AssignedResourceBinaries_Type','S_AssignedResourceNavigations_Type','S_AssignedResourceScalars_Type','S_AssignedResourceTypes_Type','S_AssignedSingleRoles_Type','S_CompositeRoles_Type','S_IdentifiedRisks_Type','S_ResourceCorrelationKeys_BindingExpressionHash','S_ResourceRiskScores_Type','S_ResourceTypes_Type','S_SingleRoles_Type','S_ResourceLinks_TypeR1','S_ResourceLinks_TypeR2','S_Resources_Type')
EXEC (@SQL)
GO

DECLARE @admin bigint
select @admin = Id from UA_Profiles	where Identifier = 'Administrator'

-- Missing permissions on Resource Reconciliation property mode
CREATE TABLE #reconciliationEntityTypes (
	EntityTypeIdentifier VARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CS_AS,
	PermissionId bigint,
	Scaffolding_Id BIGINT,
	File_Id BIGINT
);

INSERT INTO #reconciliationEntityTypes
select SUBSTRING(acp.Identifier, 50, LEN(acp.Identifier) - 49), Permission_Id, cfi.Scaffolding_Id, min(cfi.File_Id)
	from UA_AccessControlRules acr 
	JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id
	JOIN UA_AccessControlPermissions acp on acp.Id=ace.Permission_Id
	JOIN UD_ConfigurationFileItems cfi ON cfi.Item_Id = acr.Id and cfi.TableName='ua_accesscontrolrules'
	where acp.Identifier like '/Custom/ProvisioningPolicy/ReconciliateResources/%' and Profile_Id = @admin
    group by SUBSTRING(acp.Identifier, 50, LEN(acp.Identifier) - 49), Permission_Id, cfi.Scaffolding_Id;

INSERT INTO UA_AccessControlRules
select 
	(SELECT COALESCE(MIN("Id"),0)-1 FROM UA_AccessControlRules acr)-ROW_NUMBER() OVER(ORDER BY e.EntityTypeIdentifier ASC),
	@admin, 
	2147483676,
	'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier,
	'Administrator - Reconciliate for EntityProperty', 
	'Administrateur - Réconciliation de EntityProperty',
	null,null,null,null,null,null,null,null,null,null,null,null,null,null
from #reconciliationEntityTypes e
left JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier
where acr.Id is null;

INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id)
SELECT distinct e.File_Id, acr.Id, 'ua_accesscontrolrules', e.Scaffolding_Id
from #reconciliationEntityTypes e
JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier
left JOIN UD_ConfigurationFileItems cfi  ON cfi.File_Id=e.File_Id and cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and cfi.Scaffolding_Id=e.Scaffolding_Id
where cfi.File_Id is null

INSERT INTO UA_AccessControlEntries
select 
	(SELECT COALESCE(MIN("id"),0)-1 FROM UA_AccessControlEntries ace)-ROW_NUMBER() OVER(ORDER BY EntityTypeIdentifier ASC), 
	acr.Id, 
	e.PermissionId,
	NULL,0,1,1,0,1,0,0
from UA_AccessControlRules acr
JOIN #reconciliationEntityTypes e ON acr.Identifier = 'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier
left JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id and ace.Permission_Id = e.PermissionId
where ace.Id is null;

INSERT INTO UA_AccessControlRules
select 
	(SELECT COALESCE(MIN("Id"),0)-1 FROM UA_AccessControlRules acr)-ROW_NUMBER() OVER(ORDER BY e.EntityTypeIdentifier ASC),
	@admin, 
	2147483869,
	'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier,
	'Administrator - Reconciliate for EntityProperty', 
	'Administrateur - Réconciliation de EntityProperty',
	null,null,null,null,null,null,null,null,null,null,null,null,null,null
from #reconciliationEntityTypes e
left JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier
where acr.Id is null;

INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id)
SELECT distinct e.File_Id, acr.Id, 'ua_accesscontrolrules', e.Scaffolding_Id
from #reconciliationEntityTypes e
JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier
left JOIN UD_ConfigurationFileItems cfi  ON cfi.File_Id=e.File_Id and cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and cfi.Scaffolding_Id=e.Scaffolding_Id
where cfi.File_Id is null

INSERT INTO UA_AccessControlEntries
select 
	(SELECT COALESCE(MIN("id"),0)-1 FROM UA_AccessControlEntries ace)-ROW_NUMBER() OVER(ORDER BY EntityTypeIdentifier ASC), 
	acr.Id, 
	e.PermissionId,
	NULL,0,1,1,0,1,0,0
from UA_AccessControlRules acr
JOIN #reconciliationEntityTypes e ON acr.Identifier = 'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReconciliateResources_' + e.EntityTypeIdentifier
left JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id and ace.Permission_Id = e.PermissionId
where ace.Id is null;

DROP TABLE #reconciliationEntityTypes;

-- Missing permissions on Provisioning Review property mode
CREATE TABLE #provisioningEntityTypes (
	EntityTypeIdentifier VARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CS_AS,
	PermissionId bigint,
	Scaffolding_Id BIGINT,
	File_Id BIGINT
);

INSERT INTO #provisioningEntityTypes
select SUBSTRING(acp.Identifier, 47, LEN(acp.Identifier) - 46), Permission_Id, cfi.Scaffolding_Id, min(cfi.File_Id)
	from UA_AccessControlRules acr 
	JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id
	JOIN UA_AccessControlPermissions acp on acp.Id=ace.Permission_Id
	JOIN UD_ConfigurationFileItems cfi ON cfi.Item_Id = acr.Id and cfi.TableName='ua_accesscontrolrules'
	where acp.Identifier like '/Custom/ProvisioningPolicy/ReviewProvisioning/%' and Profile_Id = @admin
    group by SUBSTRING(acp.Identifier, 47, LEN(acp.Identifier) - 46), Permission_Id, cfi.Scaffolding_Id;

INSERT INTO UA_AccessControlRules
select  
	(SELECT COALESCE(MIN("Id"),0)-1 FROM UA_AccessControlRules acr)-ROW_NUMBER() OVER(ORDER BY e.EntityTypeIdentifier ASC),
	@admin, 
	2147483668,
	'Administrator_Category_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier,
	'Administrator - Review Provisioning', 
	'Administrateur - Revue du Provisioning',
	null,null,null,null,null,null,null,null,null,null,null,null,null,null
from #provisioningEntityTypes e
left JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_Category_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
where acr.Id is null;

INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id)
SELECT distinct e.File_Id, acr.Id, 'ua_accesscontrolrules', e.Scaffolding_Id
from #provisioningEntityTypes e
JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_Category_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UD_ConfigurationFileItems cfi  ON cfi.File_Id=e.File_Id and cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and cfi.Scaffolding_Id=e.Scaffolding_Id
where cfi.File_Id is null

INSERT INTO UA_AccessControlEntries
select 
	(SELECT COALESCE(MIN("id"),0)-1 FROM UA_AccessControlEntries ace)-ROW_NUMBER() OVER(ORDER BY EntityTypeIdentifier ASC), 
	acr.Id, 
	e.PermissionId,
	NULL,0,1,1,0,1,0,0
from UA_AccessControlRules acr
JOIN #provisioningEntityTypes e ON acr.Identifier = 'Administrator_Category_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id and ace.Permission_Id = e.PermissionId
where ace.Id is null;

INSERT INTO UA_AccessControlRules
select 
	(SELECT COALESCE(MIN("Id"),0)-1 FROM UA_AccessControlRules acr)-ROW_NUMBER() OVER(ORDER BY e.EntityTypeIdentifier ASC),
	@admin, 
	2147483671,
	'Administrator_ResourceType_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier,
	'Administrator - Review Provisioning', 
	'Administrateur - Revue du Provisioning',
	null,null,null,null,null,null,null,null,null,null,null,null,null,null
from #provisioningEntityTypes e
left JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_ResourceType_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
where acr.Id is null;

INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id)
SELECT distinct e.File_Id, acr.Id, 'ua_accesscontrolrules', e.Scaffolding_Id
from #provisioningEntityTypes e
JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_ResourceType_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UD_ConfigurationFileItems cfi  ON cfi.File_Id=e.File_Id and cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and cfi.Scaffolding_Id=e.Scaffolding_Id
where cfi.File_Id is null

INSERT INTO UA_AccessControlEntries
select 
	(SELECT COALESCE(MIN("id"),0)-1 FROM UA_AccessControlEntries ace)-ROW_NUMBER() OVER(ORDER BY EntityTypeIdentifier ASC), 
	acr.Id, 
	e.PermissionId,
	NULL,0,1,1,0,1,0,0
from UA_AccessControlRules acr
JOIN #provisioningEntityTypes e ON acr.Identifier = 'Administrator_ResourceType_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id and ace.Permission_Id = e.PermissionId
where ace.Id is null;

INSERT INTO UA_AccessControlRules
select 
	(SELECT COALESCE(MIN("Id"),0)-1 FROM UA_AccessControlRules acr)-ROW_NUMBER() OVER(ORDER BY e.EntityTypeIdentifier ASC),
	@admin, 
	2147483869,
	'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier,
	'Administrator - Review Provisioning', 
	'Administrateur - Revue du Provisioning',
	null,null,null,null,null,null,null,null,null,null,null,null,null,null
from #provisioningEntityTypes e
left JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
where acr.Id is null;

INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id)
SELECT distinct e.File_Id, acr.Id, 'ua_accesscontrolrules', e.Scaffolding_Id
from #provisioningEntityTypes e
JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UD_ConfigurationFileItems cfi  ON cfi.File_Id=e.File_Id and cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and cfi.Scaffolding_Id=e.Scaffolding_Id
where cfi.File_Id is null

INSERT INTO UA_AccessControlEntries
select 
	(SELECT COALESCE(MIN("id"),0)-1 FROM UA_AccessControlEntries ace)-ROW_NUMBER() OVER(ORDER BY EntityTypeIdentifier ASC), 
	acr.Id, 
	e.PermissionId,
	NULL,0,1,1,0,1,0,0
from UA_AccessControlRules acr
JOIN #provisioningEntityTypes e ON acr.Identifier = 'Administrator_AssignedResourceBinary_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id and ace.Permission_Id = e.PermissionId
where ace.Id is null;

INSERT INTO UA_AccessControlRules
select 
	(SELECT COALESCE(MIN("Id"),0)-1 FROM UA_AccessControlRules acr)-ROW_NUMBER() OVER(ORDER BY e.EntityTypeIdentifier ASC),
	@admin, 
	2147483676,
	'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier,
	'Administrator - Review Provisioning', 
	'Administrateur - Revue du Provisioning',
	null,null,null,null,null,null,null,null,null,null,null,null,null,null
from #provisioningEntityTypes e
left JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
where acr.Id is null;

INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id)
SELECT distinct e.File_Id, acr.Id, 'ua_accesscontrolrules', e.Scaffolding_Id
from #provisioningEntityTypes e
JOIN UA_AccessControlRules acr on acr.Identifier = 'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UD_ConfigurationFileItems cfi  ON cfi.File_Id=e.File_Id and cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and cfi.Scaffolding_Id=e.Scaffolding_Id
where cfi.File_Id is null

INSERT INTO UA_AccessControlEntries
select 
	(SELECT COALESCE(MIN("id"),0)-1 FROM UA_AccessControlEntries ace)-ROW_NUMBER() OVER(ORDER BY EntityTypeIdentifier ASC), 
	acr.Id, 
	e.PermissionId,
	NULL,0,1,1,0,1,0,0
from UA_AccessControlRules acr
JOIN #provisioningEntityTypes e ON acr.Identifier = 'Administrator_EntityProperty_Custom_ProvisioningPolicy_ReviewRoles_' + e.EntityTypeIdentifier
left JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id and ace.Permission_Id = e.PermissionId
where ace.Id is null;

DROP TABLE #provisioningEntityTypes;

-- Missing permissions on Entity Type management page
INSERT INTO UA_AccessControlRules
select top 1
	(SELECT COALESCE(MIN("Id"),0)-1 FROM UA_AccessControlRules acr)-1,
	@admin, 
	2147483928,
	'ConnectorEntityType_Administrator_ConnectionColumn',
	'Administrator - Entity Type Configuration - ConnectionColumn', 
	'Administrateur - Configuration d''un entity type - ConnectionColumn',
	null,null,null,null,null,null,null,null,null,null,null,null,null,null
from UA_AccessControlRules acr
where (select distinct count(*)
from UA_AccessControlRules acr 
JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id
JOIN UA_AccessControlPermissions acp on acp.Id=ace.Permission_Id
where acp.Identifier = '/Connectors/EntityTypeMapping/Update' and Profile_Id = @admin  and acr.Identifier='ConnectorEntityType_Administrator_ConnectionColumn') = 0

INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id)
SELECT distinct cfi.File_Id, (select top 1 id from UA_AccessControlRules where Identifier='ConnectorEntityType_Administrator_ConnectionColumn'), 'ua_accesscontrolrules', cfi.Scaffolding_Id
from UA_AccessControlRules acr
JOIN UD_ConfigurationFileItems cfi  ON cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and acr.Identifier='ConnectorEntityType_Administrator_ConnectionTable'
where (select distinct count(*)
from UA_AccessControlRules acr 
JOIN UD_ConfigurationFileItems cfi on cfi.Item_Id=acr.Id and cfi.TableName = 'ua_accesscontrolrules' and acr.Identifier='ConnectorEntityType_Administrator_ConnectionColumn'
) = 0


INSERT INTO UA_AccessControlEntries
select 
	(SELECT COALESCE(MIN("id"),0)-1 FROM UA_AccessControlEntries ace)-1, 
	acr.Id, 
	4611686018427403306,
	NULL,0,1,1,1,1,0,0
from UA_AccessControlRules acr
left JOIN UA_AccessControlEntries ace on ace.Rule_Id = acr.Id and ace.Permission_Id = 4611686018427403306
where ace.Id is null AND acr.Identifier = 'ConnectorEntityType_Administrator_ConnectionColumn';
