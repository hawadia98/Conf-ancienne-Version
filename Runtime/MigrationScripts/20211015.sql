
INSERT INTO UD_ConfigurationFileItems(File_Id, Item_Id, TableName)
select distinct cf.Id,t.id,'uj_tasks'
from UJ_Tasks t
JOIN UJ_JobSteps js on js.Task_Id=t.id
JOIN UJ_Jobs j on j.id=js.Job_Id
JOIN UD_ConfigurationFileItems cfi on cfi.Item_Id=j.id and cfi.TableName='uj_jobs'
join UD_ConfigurationFiles cf on cf.Id=cfi.File_Id
where t.id not in (select Item_Id from UD_ConfigurationFileItems where TableName = 'uj_tasks')

INSERT INTO UD_ConfigurationFileItems(File_Id, Item_Id, TableName)
select distinct cf.Id,js.Id,'uj_jobsteps'
from UJ_JobSteps js
JOIN UJ_Jobs j on j.id=js.Job_Id
JOIN UD_ConfigurationFileItems cfi on cfi.Item_Id=j.id and cfi.TableName='uj_jobs'
join UD_ConfigurationFiles cf on cf.Id=cfi.File_Id
where js.id not in (select Item_Id from UD_ConfigurationFileItems where TableName = 'uj_jobsteps')

INSERT INTO UD_ConfigurationFileItems(File_Id, Item_Id, TableName)
select distinct cf.id,trt.id,'uj_taskresourcetypes'
from UJ_TaskResourceTypes trt
join UJ_Tasks t on t.id=trt.task_id
JOIN UJ_JobSteps js on js.Task_Id=t.id
JOIN UJ_Jobs j on j.id=js.Job_Id
JOIN UD_ConfigurationFileItems cfi on cfi.Item_Id=j.id and cfi.TableName='uj_jobs'
join UD_ConfigurationFiles cf on cf.Id=cfi.File_Id
where trt.id not in (select Item_Id from UD_ConfigurationFileItems where TableName = 'uj_taskresourcetypes')

INSERT INTO UD_ConfigurationFileItems(File_Id, Item_Id, TableName)
select distinct cf.id,tet.id,'uj_taskentitytypes'
from UJ_TaskEntityTypes tet
join UJ_Tasks t on t.id=tet.task_id
JOIN UJ_JobSteps js on js.Task_Id=t.id
JOIN UJ_Jobs j on j.id=js.Job_Id
JOIN UD_ConfigurationFileItems cfi on cfi.Item_Id=j.id and cfi.TableName='uj_jobs'
join UD_ConfigurationFiles cf on cf.Id=cfi.File_Id
where tet.id not in (select Item_Id from UD_ConfigurationFileItems where TableName = 'uj_taskentitytypes')

INSERT INTO UD_ConfigurationFileItems(File_Id, Item_Id, TableName)
select distinct cf.id,tet.id,'uj_taskdependontasks'
from UJ_TaskDependOnTasks tet
join UJ_Tasks t on t.id=tet.ParentTask_Id
JOIN UJ_JobSteps js on js.Task_Id=t.id
JOIN UJ_Jobs j on j.id=js.Job_Id
JOIN UD_ConfigurationFileItems cfi on cfi.Item_Id=j.id and cfi.TableName='uj_jobs'
join UD_ConfigurationFiles cf on cf.Id=cfi.File_Id
where tet.id not in (select Item_Id from UD_ConfigurationFileItems where TableName = 'uj_taskdependontasks')


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_DenialProperty]...';


GO
IF (OBJECT_ID('dbo.FK_IndirectResourceRules_DenialProperty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_DenialProperty];
END


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_EntityTypeReflexiveProperty]...';


GO
IF (OBJECT_ID('dbo.FK_IndirectResourceRules_EntityTypeReflexiveProperty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_EntityTypeReflexiveProperty];
END


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_IndirectResourceBinding]...';


GO
IF (OBJECT_ID('dbo.FK_IndirectResourceRules_IndirectResourceBinding', 'F') IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_IndirectResourceBinding];
END


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_IndirectResourceReflexiveProperty]...';


GO
IF (OBJECT_ID('dbo.FK_IndirectResourceRules_IndirectResourceReflexiveProperty', 'F') IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_IndirectResourceReflexiveProperty];
END


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_ResourceProperty]...';


GO
IF (OBJECT_ID('dbo.FK_IndirectResourceRules_ResourceProperty', 'F') IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_ResourceProperty];
END


GO
PRINT N'Dropping [dbo].[U_ScaffoldingArguments_Identifier]...';


GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='U_ScaffoldingArguments_Identifier')
BEGIN
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [U_ScaffoldingArguments_Identifier];
END


GO
PRINT N'Altering [dbo].[UD_ScaffoldingArguments]...';


GO
UPDATE [dbo].[UD_ScaffoldingArguments] SET [Order]=0 WHERE [Order] IS NULL;


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] ALTER COLUMN [Order] INT NOT NULL;


GO
PRINT N'Altering [dbo].[UI_DisplayEntityProperties]...';


GO
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UI_DisplayEntityProperties' AND COLUMN_NAME='AddedMinutes')
BEGIN
ALTER TABLE [dbo].[UI_DisplayEntityProperties]
    ADD [AddedMinutes] INT NULL;
END


GO
PRINT N'Altering [dbo].[UI_DisplayEntityTypes]...';


GO
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UI_DisplayEntityTypes' AND COLUMN_NAME='Priority')
BEGIN
ALTER TABLE [dbo].[UI_DisplayEntityTypes]
    ADD [Priority] INT DEFAULT 2147483647 NOT NULL;
END


GO
PRINT N'Altering [dbo].[UI_DisplayTableColumns]...';


GO

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UI_DisplayTableColumns' AND COLUMN_NAME='AddedMinutes')
BEGIN
ALTER TABLE [dbo].[UI_DisplayTableColumns]
    ADD [AddedMinutes] INT NULL;
END


GO
PRINT N'Altering [dbo].[UI_FormControls]...';


GO

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UI_FormControls' AND COLUMN_NAME='DefaultValueBinding_Id')
BEGIN
ALTER TABLE [dbo].[UI_FormControls]
    ADD [DefaultValueBinding_Id] BIGINT NULL;
END


GO
PRINT N'Altering [dbo].[UI_TileItems]...';


GO

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UI_TileItems' AND COLUMN_NAME='AddedMinutes')
BEGIN
ALTER TABLE [dbo].[UI_TileItems]
    ADD [AddedMinutes] INT NULL;
END


GO
PRINT N'Altering [dbo].[UN_NotificationTemplates]...';


GO

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UN_NotificationTemplates' AND COLUMN_NAME='SubjectTemplate_L5')
BEGIN
ALTER TABLE [dbo].[UN_NotificationTemplates]
    ADD [SubjectTemplate_L5]  NVARCHAR (1024) NULL,
        [BodyTemplate_L5]     NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L6]  NVARCHAR (1024) NULL,
        [BodyTemplate_L6]     NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L7]  NVARCHAR (1024) NULL,
        [BodyTemplate_L7]     NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L8]  NVARCHAR (1024) NULL,
        [BodyTemplate_L8]     NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L9]  NVARCHAR (1024) NULL,
        [BodyTemplate_L9]     NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L10] NVARCHAR (1024) NULL,
        [BodyTemplate_L10]    NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L11] NVARCHAR (1024) NULL,
        [BodyTemplate_L11]    NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L12] NVARCHAR (1024) NULL,
        [BodyTemplate_L12]    NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L13] NVARCHAR (1024) NULL,
        [BodyTemplate_L13]    NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L14] NVARCHAR (1024) NULL,
        [BodyTemplate_L14]    NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L15] NVARCHAR (1024) NULL,
        [BodyTemplate_L15]    NVARCHAR (MAX)  NULL,
        [SubjectTemplate_L16] NVARCHAR (1024) NULL,
        [BodyTemplate_L16]    NVARCHAR (MAX)  NULL;
END


GO
PRINT N'Altering [dbo].[UP_AssignedCompositeRoles]...';


GO
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UP_AssignedCompositeRoles' AND COLUMN_NAME='IsIndirect')
BEGIN
ALTER TABLE [dbo].[UP_AssignedCompositeRoles]
    ADD [IsIndirect] BIT CONSTRAINT [DF_AssignedCompositeRoles_IsIndirect] DEFAULT ((0)) NOT NULL;
END


GO
PRINT N'Altering [dbo].[UP_AssignedResourceNavigations]...';


GO

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UP_AssignedResourceNavigations' AND COLUMN_NAME='IsIndirect')
BEGIN
ALTER TABLE [dbo].[UP_AssignedResourceNavigations]
    ADD [IsIndirect] BIT CONSTRAINT [DF_AssignedResourceNavigations_IsIndirect] DEFAULT ((0)) NOT NULL;
END


GO
PRINT N'Altering [dbo].[UP_AssignedSingleRoles]...';


GO
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UP_AssignedSingleRoles' AND COLUMN_NAME='IsIndirect')
BEGIN
ALTER TABLE [dbo].[UP_AssignedSingleRoles]
    ADD [IsIndirect] BIT CONSTRAINT [DF_AssignedSingleRoles_IsIndirect] DEFAULT ((0)) NOT NULL;
END


GO
PRINT N'Altering [dbo].[UP_IndirectResourceRules]...';


GO
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UP_IndirectResourceRules' AND COLUMN_NAME='Correspondence_Id')
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules]
    ADD [Property_Id]                         BIGINT NOT NULL,
        [Correspondence_Id]                   BIGINT NULL,
        [CorrespondenceMembershipProperty_Id] BIGINT NULL,
        [Entitlement_Id]                      BIGINT NULL;
END


GO
PRINT N'Altering [dbo].[UW_ActivityInstances]...';


GO
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UW_ActivityInstances' AND COLUMN_NAME='AssignedTo_Id')
BEGIN
ALTER TABLE [dbo].[UW_ActivityInstances]
    ADD [AssignedTo_Id] BIGINT        NULL,
        [ExpectedDate]  SMALLDATETIME NULL;
END


GO
PRINT N'Creating [dbo].[UA_AssignedProfiles].[IX_AssignedProfiles_UserInfos]...';


GO
If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedProfiles_UserInfos' AND object_id = OBJECT_ID('dbo.UA_AssignedProfiles')
)
BEGIN
CREATE NONCLUSTERED INDEX [IX_AssignedProfiles_UserInfos]
    ON [dbo].[UA_AssignedProfiles]([User_Id] ASC, [StartDate] ASC, [EndDate] ASC)
    INCLUDE([Profile_Id], [Context_Id]) WHERE "IsDenied"=0 AND "AccessState" IN (16,18);
END

GO
PRINT N'Creating [dbo].[FK_FormControls_DefaultValueBinding]...';


GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_FormControls_DefaultValueBinding')
BEGIN
ALTER TABLE [dbo].[UI_FormControls] WITH NOCHECK
    ADD CONSTRAINT [FK_FormControls_DefaultValueBinding] FOREIGN KEY ([DefaultValueBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);
END


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_Correspondence]...';


GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_IndirectResourceRules_Correspondence')
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_Correspondence] FOREIGN KEY ([Correspondence_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);
END


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_CorrespondenceMembershipProperty]...';


GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_IndirectResourceRules_CorrespondenceMembershipProperty')
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_CorrespondenceMembershipProperty] FOREIGN KEY ([CorrespondenceMembershipProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);
END


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_Entitlement]...';


GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_IndirectResourceRules_Entitlement')
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_Entitlement] FOREIGN KEY ([Entitlement_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);
END


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_Property]...';


GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_IndirectResourceRules_Property')
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);
END


GO
PRINT N'Checking existing data against newly created constraints';



GO
ALTER TABLE [dbo].[UI_FormControls] WITH CHECK CHECK CONSTRAINT [FK_FormControls_DefaultValueBinding];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_Correspondence];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_CorrespondenceMembershipProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_Entitlement];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_Property];


GO
UPDATE det SET [Priority]=0
FROM UP_ContextRules cr
JOIN UI_DisplayEntityTypes det ON det.Id = cr.SourceEntityType_Id
WHERE cr.ResourcesBinding_Id is not null


GO
PRINT N'Update complete.';


GO
IF NOT EXISTS (SELECT TOP 1 1 FROM "um_entityproperties" where id=-9223372015379939259)
BEGIN
INSERT INTO "um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES
(-9223372015379939259, 2147483653,'IsIndirect',5,-1,NULL)
,(-9223372011084971963, 2147483654,'IsIndirect',5,-1,NULL)
,(-9223371998200070075, 2147483657,'IsIndirect',5,-1,NULL)
,(-9223371942365495270, 2147483670,'AssignedToActivityInstances',12,-1,NULL)
,(-9223371938070527932, 2147483671,'RemoveOrphans',5,-1,NULL)
,(-9223371938070527931, 2147483671,'CorrelateMultipleResources',5,-1,NULL)
,(-9223371860761116645, 2147483689,'AddedMinutes',2,-1,NULL)
,(-9223371856466149355, 2147483690,'DefaultValueFormControls',12,-1,NULL)
,(-9223371817811443705, 2147483699,'AddedMinutes',2,-1,NULL)
,(-9223371774861770728, 2147483709,'AssignedToId',3,-1,NULL)
,(-9223371774861770727, 2147483709,'AssignedTo',12,-1,NULL)
,(-9223371774861770726, 2147483709,'ExpectedDate',4,-1,NULL)
,(-9223371749091966970, 2147483715,'Priority',2,-1,NULL)
,(-9223371740502032324, 2147483717,'AddedMinutes',2,-1,NULL)
,(-9223371366839877597, 2147483804,'DefaultValueBindingId',3,-1,NULL)
,(-9223371366839877596, 2147483804,'DefaultValueBinding',12,-1,NULL)
END



GO

IF NOT EXISTS (SELECT TOP 1 1 FROM "um_entityassociations" where id=-9223371774861770727)
BEGIN
INSERT INTO "um_entityassociations"("id","property1_id","property2_id","identifier","isproperty1collection","isproperty2collection") VALUES
(-9223371774861770727, -9223371774861770727,-9223371942365495270,'ActivityInstance.AssignedTo',0,1)
,(-9223371366839877596, -9223371366839877596,-9223371856466149355,'FormControl.DefaultValueBinding',0,1)
END



GO
IF NOT EXISTS (SELECT TOP 1 1 FROM "ua_accesscontrolpermissions" where id=4611686018427414703)
BEGIN
INSERT INTO "ua_accesscontrolpermissions"("id","identifier") VALUES
(4611686018427414703, '/Metadata/Language')
,(4611686018427414704, '/Metadata/Language/Query')
,(4611686018427388008, '/Workflows/UserActivityInstance/AssignedTo')
,(4611686018427388009, '/Workflows/UserActivityInstance/ExpectedDate')
END



GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceFileChanges' AND COLUMN_NAME='JobInstance_Id')
BEGIN
ALTER TABLE "UR_ResourceFileChanges" ADD "JobInstance_Id"  BIGINT NULL;
END
GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceChanges' AND COLUMN_NAME='JobInstance_Id')
BEGIN
ALTER TABLE "UR_ResourceChanges" ADD "JobInstance_Id"  BIGINT NULL;
END
GO
IF NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceLinkChanges' AND COLUMN_NAME='JobInstance_Id')
BEGIN
ALTER TABLE "UR_ResourceLinkChanges" ADD "JobInstance_Id"  BIGINT NULL;
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceFileChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
ALTER TABLE "UR_ResourceFileChanges" ALTER COLUMN "JobInstanceId"  BIGINT NULL;
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
ALTER TABLE "UR_ResourceChanges" ALTER COLUMN "JobInstanceId"  BIGINT NULL;
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceLinkChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
ALTER TABLE "UR_ResourceLinkChanges" ALTER COLUMN "JobInstanceId"  BIGINT NULL;
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceFileChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
EXEC sp_executesql N'UPDATE "UR_ResourceFileChanges" SET "JobInstance_Id" = "JobInstanceId"';
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
EXEC sp_executesql N'UPDATE "UR_ResourceChanges" SET "JobInstance_Id" = "JobInstanceId"';
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceLinkChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
EXEC sp_executesql N'UPDATE "UR_ResourceLinkChanges" SET "JobInstance_Id" = "JobInstanceId"';
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM "UA_AccessControlRules" where identifier like '%_UserActivityInstance_WorkflowInstance_Migration521')
BEGIN
/* Add missing permissions for user activity instance */
insert into UA_AccessControlRules(id,Identifier,DisplayName_L1,EntityType_Id,Profile_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlRules)-ROW_NUMBER() OVER(ORDER BY aa.identifier ASC), aa.* from (
select distinct p.Identifier+'_UserActivityInstance_WorkflowInstance_Migration521' identifier,p.Identifier+'_UserActivityInstance_WorkflowInstance_Migration521' dn,2147483706 eid,p.id pid
from UA_AccessControlRules acr
join UA_Profiles p on p.Id=acr.Profile_Id
join UA_AccessControlEntries ace on ace.Rule_Id=acr.Id
join UA_AccessControlPermissions acp on acp.Id=ace.Permission_Id
Where acp.Identifier='/Workflows/UserActivityInstance/Query'
) aa;

insert into UA_AccessControlEntries(id,Permission_Id,CanExecute,Rule_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlEntries)-ROW_NUMBER() OVER(ORDER BY aa.ruleid ASC), aa.* from (
select distinct ap.id apid,1 execu,acr.id ruleid
from UA_AccessControlRules acr
join UA_AccessControlPermissions ap on ap.Identifier='/Workflows/UserActivityInstance/Query'
Where acr.Identifier like '%_UserActivityInstance_WorkflowInstance_Migration521'
) aa;
END
GO
IF NOT EXISTS (SELECT TOP 1 1 FROM "UA_AccessControlRules" where identifier like '%_UserActivityInstance_ActivityInstance_Migration521')
BEGIN
insert into UA_AccessControlRules(id,Identifier,DisplayName_L1,EntityType_Id,Profile_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlRules)-ROW_NUMBER() OVER(ORDER BY aa.identifier ASC), aa.* from (
select distinct p.Identifier+'_UserActivityInstance_ActivityInstance_Migration521' identifier,p.Identifier+'_UserActivityInstance_ActivityInstance_Migration521' dn,2147483709 eid,p.id pid
from UA_AccessControlRules acr
join UA_Profiles p on p.Id=acr.Profile_Id
join UA_AccessControlEntries ace on ace.Rule_Id=acr.Id
join UA_AccessControlPermissions acp on acp.Id=ace.Permission_Id
Where acp.Identifier='/Workflows/UserActivityInstance/Query'
) aa;

insert into UA_AccessControlEntries(id,Permission_Id,CanExecute,Rule_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlEntries)-ROW_NUMBER() OVER(ORDER BY aa.ruleid ASC), aa.* from (
select distinct ap.id apid,1 execu,acr.id ruleid
from UA_AccessControlRules acr
join UA_AccessControlPermissions ap on ap.Identifier='/Workflows/UserActivityInstance/Query'
Where acr.Identifier like '%_UserActivityInstance_ActivityInstance_Migration521'
) aa;
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM "UA_AccessControlRules" where identifier like '%_UserActivityInstance_Resource_Migration521')
BEGIN
insert into UA_AccessControlRules(id,Identifier,DisplayName_L1,EntityType_Id,Profile_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlRules)-ROW_NUMBER() OVER(ORDER BY aa.identifier ASC), aa.* from (
select distinct p.Identifier+'_UserActivityInstance_Resource_Migration521' identifier,p.Identifier+'_UserActivityInstance_Resource_Migration521' dn,2147483670 eid,p.id pid
from UA_AccessControlRules acr
join UA_Profiles p on p.Id=acr.Profile_Id
join UA_AccessControlEntries ace on ace.Rule_Id=acr.Id
join UA_AccessControlPermissions acp on acp.Id=ace.Permission_Id
Where acp.Identifier='/Workflows/UserActivityInstance/Query'
) aa;

insert into UA_AccessControlEntries(id,Permission_Id,CanExecute,Rule_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlEntries)-ROW_NUMBER() OVER(ORDER BY aa.ruleid ASC), aa.* from (
select distinct ap.id apid,1 execu,acr.id ruleid
from UA_AccessControlRules acr
join UA_AccessControlPermissions ap on ap.Identifier='/Workflows/UserActivityInstance/Query'
Where acr.Identifier like '%_UserActivityInstance_Resource_Migration521'
) aa;
END
GO
