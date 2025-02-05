
ALTER TABLE [dbo].[UC_EntityTypeMappings] ADD [ConnectionTable] NVARCHAR(442) NULL;
ALTER TABLE [dbo].[UC_EntityPropertyMappings] ADD [ConnectionColumn] NVARCHAR(442) NULL;
ALTER TABLE [dbo].[UC_EntityAssociationMappings] ADD [ConnectionTable] NVARCHAR(442) NULL;

ALTER TABLE [dbo].[UC_ResourceTypeMappings] ADD "PasswordResetSetting_Id" BIGINT NULL;
ALTER TABLE [dbo].[UC_ResourceTypeMappings] ADD "Connection_Id" BIGINT NULL;

ALTER TABLE [dbo].[UJ_Tasks] ADD ConnectionIdentifier NVARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL;

GO

UPDATE [dbo].[UJ_Tasks] SET ConnectionIdentifier = InformationSystemIdentifier;
UPDATE [dbo].[UC_EntityPropertyMappings] SET ConnectionColumn = DataSourceColumnName;
GO
UPDATE [dbo].[UC_EntityTypeMappings] SET DataSource = REPLACE(DataSource, '\', '/');
UPDATE [dbo].[UC_EntityAssociationMappings] SET DataSource = REPLACE(DataSource, '\', '/');
GO

UPDATE UJ_TaskInstances SET C7 = 10 -- FulfillmentType.ServiceNowTicketUpdateFulfillmentState = 10
FROM UJ_TaskInstances ti JOIN UJ_Tasks t
ON ti.Task_Id=t.Id
WHERE t.TaskType = 64; -- TaskType517.ServiceNowTicketUpdateFulfillmentStateTask = 64
GO
