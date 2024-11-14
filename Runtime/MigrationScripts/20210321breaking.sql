
DROP INDEX "IX_ResourceFileChanges" ON "UR_ResourceFileChanges";
ALTER TABLE [dbo].[UR_ResourceFileChanges] ALTER COLUMN [Resource_PK] NVARCHAR (4000) COLLATE Latin1_General_BIN2 NULL;
CREATE CLUSTERED INDEX [IX_ResourceFileChanges]
    ON [dbo].[UR_ResourceFileChanges]([JobInstanceId] ASC, [Property_Id] ASC, [Resource_PK] ASC);


GO

ALTER TABLE [dbo].[UR_ResourceLinkChanges] ALTER COLUMN [R1_PK] NVARCHAR (4000) COLLATE Latin1_General_BIN2 NULL;

ALTER TABLE [dbo].[UR_ResourceLinkChanges] ALTER COLUMN [R2_PK] NVARCHAR (4000) COLLATE Latin1_General_BIN2 NULL;

GO
ALTER TABLE [dbo].[UT_InsertResourceLinks] ALTER COLUMN [R1_Identifier] NVARCHAR (4000) COLLATE Latin1_General_BIN2 NOT NULL;

ALTER TABLE [dbo].[UT_InsertResourceLinks] ALTER COLUMN [R2_Identifier] NVARCHAR (4000) COLLATE Latin1_General_BIN2 NOT NULL;

GO
ALTER TABLE [dbo].[UT_OnlyNVarchar] ALTER COLUMN [Value] NVARCHAR (4000) COLLATE Latin1_General_BIN2 NOT NULL;


GO
ALTER TABLE [dbo].[UT_ResourceFiles] ALTER COLUMN [Identifier] NVARCHAR (4000) COLLATE Latin1_General_BIN2 NOT NULL;


/*** end script from compared predefined files ****/

EXEC sp_rename 'US_AccessCertificationDataFilters.TargettedRisk_Id', 'TargetedRisk_Id', 'COLUMN';
GO
EXEC sp_rename 'US_AccessCertificationOwnerFilters.TargettedRisk_Id', 'TargetedRisk_Id', 'COLUMN';
GO
DROP INDEX [IX_AssignedResourceTypes_ResourceReconciliation] ON [dbo].[UP_AssignedResourceTypes]
GO
CREATE INDEX "IX_AssignedResourceTypes_ResourceReconciliation" ON "UP_AssignedResourceTypes" ("OwnerType","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","ProvisioningState","ParametersContext_Id","ResourceType_Id","Resource_Id","ConsolidatedWorkflowFoundState","ConsolidatedWorkflowFoundCount","ConsolidatedProvisioningState") WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "ProvisioningReviewFilter"<>2 AND "ProvisioningReviewFilter"<>16 AND "ConsolidatedWorkflowFoundState" IN (1,2,3)
GO
DROP INDEX [IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred] ON [dbo].[UP_AssignedResourceTypes]
GO
CREATE INDEX "IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred" ON "UP_AssignedResourceTypes" ("OwnerType","IsInferred","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","ProvisioningState","ParametersContext_Id","ResourceType_Id","Resource_Id","ConsolidatedWorkflowFoundState","ConsolidatedWorkflowFoundCount","ConsolidatedProvisioningState") WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "ProvisioningReviewFilter"<>2 AND "ProvisioningReviewFilter"<>16 AND "ConsolidatedWorkflowFoundState" IN (1,2,3)
GO
