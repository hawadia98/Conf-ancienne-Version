DELETE FROM "UP_AssignedResourceErrors";
DELETE FROM "UJ_JobInstances";
GO
UPDATE "UC_Connectors" SET "CollectorType"=1 WHERE "CollectorType"='Ldap';
UPDATE "UC_Connectors" SET "CollectorType"=2 WHERE "CollectorType"='AzureAD';
UPDATE "UC_Connectors" SET "CollectorType"=3 WHERE "CollectorType"='ADDirSync';
UPDATE "UC_Connectors" SET "CollectorType"=4 WHERE "CollectorType"='Change';
UPDATE "UC_Connectors" SET "CollectorType"=5 WHERE "CollectorType"='Job';
UPDATE "UC_Connectors" SET "CollectorType"=6 WHERE "CollectorType"='SharePoint';
UPDATE "UC_Connectors" SET "CollectorType"=7 WHERE "CollectorType"='SAP';
UPDATE "UC_Connectors" SET "CollectorType"=8 WHERE "CollectorType"='TSS';
UPDATE "UC_Connectors" SET "CollectorType"=9 WHERE "CollectorType"='RACF';
UPDATE "UC_Connectors" SET "CollectorType"=0 WHERE "CollectorType" IS NULL;
GO

EXEC sp_rename 'UM_EntityProperties.TransformExpression', 'FlexibleComparisonExpression', 'COLUMN';
GO

EXEC sp_rename 'UP_Categories.Description', 'Description_L1', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoles.Description', 'Description_L1', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoles.Description', 'Description_L1', 'COLUMN';
GO

EXEC sp_rename 'UP_AssignedCompositeRoles.GroupByContext_Id', 'ParametersContext_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_AssignedSingleRoles.GroupByContext_Id', 'ParametersContext_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_AssignedResourceTypes.GroupByContext_Id', 'ParametersContext_Id', 'COLUMN';
GO

EXEC sp_rename 'UP_CompositeRoleRules.Dimension0Level', 'L0', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension0_Id', 'D0_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension1Level', 'L1', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension1_Id', 'D1_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension2Level', 'L2', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension2_Id', 'D2_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension3Level', 'L3', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension3_Id', 'D3_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension4Level', 'L4', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension4_Id', 'D4_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension5Level', 'L5', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension5_Id', 'D5_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension6Level', 'L6', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension6_Id', 'D6_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension7Level', 'L7', 'COLUMN';
GO
EXEC sp_rename 'UP_CompositeRoleRules.Dimension7_Id', 'D7_Id', 'COLUMN';
GO

EXEC sp_rename 'UP_Contexts.Dimension0_Id', 'D0_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Contexts.Dimension1_Id', 'D1_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Contexts.Dimension2_Id', 'D2_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Contexts.Dimension3_Id', 'D3_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Contexts.Dimension4_Id', 'D4_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Contexts.Dimension5_Id', 'D5_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Contexts.Dimension6_Id', 'D6_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Contexts.Dimension7_Id', 'D7_Id', 'COLUMN';
GO


EXEC sp_rename 'UP_Policies.Dimension0_Id', 'D0_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Policies.Dimension1_Id', 'D1_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Policies.Dimension2_Id', 'D2_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Policies.Dimension3_Id', 'D3_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Policies.Dimension4_Id', 'D4_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Policies.Dimension5_Id', 'D5_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Policies.Dimension6_Id', 'D6_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_Policies.Dimension7_Id', 'D7_Id', 'COLUMN';
GO


EXEC sp_rename 'UP_ResourceNavigationRules.Dimension0Level', 'L0', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension0_Id', 'D0_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension1Level', 'L1', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension1_Id', 'D1_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension2Level', 'L2', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension2_Id', 'D2_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension3Level', 'L3', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension3_Id', 'D3_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension4Level', 'L4', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension4_Id', 'D4_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension5Level', 'L5', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension5_Id', 'D5_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension6Level', 'L6', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension6_Id', 'D6_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension7Level', 'L7', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceNavigationRules.Dimension7_Id', 'D7_Id', 'COLUMN';
GO


EXEC sp_rename 'UP_ResourceTypeRules.Dimension0Level', 'L0', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension0_Id', 'D0_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension1Level', 'L1', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension1_Id', 'D1_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension2Level', 'L2', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension2_Id', 'D2_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension3Level', 'L3', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension3_Id', 'D3_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension4Level', 'L4', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension4_Id', 'D4_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension5Level', 'L5', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension5_Id', 'D5_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension6Level', 'L6', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension6_Id', 'D6_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension7Level', 'L7', 'COLUMN';
GO
EXEC sp_rename 'UP_ResourceTypeRules.Dimension7_Id', 'D7_Id', 'COLUMN';
GO

EXEC sp_rename 'UP_ResourceTypes.Description', 'Description_L1', 'COLUMN';
GO

EXEC sp_rename 'UP_SingleRoleRules.Dimension0Level', 'L0', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension0_Id', 'D0_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension1Level', 'L1', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension1_Id', 'D1_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension2Level', 'L2', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension2_Id', 'D2_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension3Level', 'L3', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension3_Id', 'D3_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension4Level', 'L4', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension4_Id', 'D4_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension5Level', 'L5', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension5_Id', 'D5_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension6Level', 'L6', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension6_Id', 'D6_Id', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension7Level', 'L7', 'COLUMN';
GO
EXEC sp_rename 'UP_SingleRoleRules.Dimension7_Id', 'D7_Id', 'COLUMN';
GO

/*
Deployment script for Usercube50

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;

GO
PRINT N'Dropping [dbo].[DF_AccessControlFilters_Category]...';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] DROP CONSTRAINT [DF_AccessControlFilters_Category];


GO
PRINT N'Dropping [dbo].[DF_ProfileContexts_IsAutomatic]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [DF_ProfileContexts_IsAutomatic];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaximumInsertedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumInsertedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaximumDeletedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumDeletedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaximumUpdatedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumUpdatedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaxPercentageInsertedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxPercentageInsertedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaxPercentageUpdatedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxPercentageUpdatedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaximumLinkInsertedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumLinkInsertedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaximumLinkDeletedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumLinkDeletedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaxPercentageDeletedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxPercentageDeletedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaxLinkPercentageInsertedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxLinkPercentageInsertedLines];


GO
PRINT N'Dropping [dbo].[DF_Connectors_MaxLinkPercentageDeletedLines]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxLinkPercentageDeletedLines];


GO
PRINT N'Dropping [dbo].[DF_EntityPropertyMappings_IsPrimaryKey]...';


GO
ALTER TABLE [dbo].[UC_EntityPropertyMappings] DROP CONSTRAINT [DF_EntityPropertyMappings_IsPrimaryKey];


GO
PRINT N'Dropping [dbo].[DF_EntityPropertyMappings_IsMultiValuedProperty]...';


GO
ALTER TABLE [dbo].[UC_EntityPropertyMappings] DROP CONSTRAINT [DF_EntityPropertyMappings_IsMultiValuedProperty];


GO
PRINT N'Dropping [dbo].[DF_JobInstances_CancelRequested]...';


GO
ALTER TABLE [dbo].[UJ_JobInstances] DROP CONSTRAINT [DF_JobInstances_CancelRequested];


GO
PRINT N'Dropping [dbo].[DF_JobInstances_State]...';


GO
ALTER TABLE [dbo].[UJ_JobInstances] DROP CONSTRAINT [DF_JobInstances_State];


GO
PRINT N'Dropping [dbo].[DF_Jobs_StartDisabled]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [DF_Jobs_StartDisabled];


GO
PRINT N'Dropping [dbo].[DF_Job_State]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [DF_Job_State];


GO
PRINT N'Dropping [dbo].[DF_Job_JobType]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [DF_Job_JobType];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_IsProperty1Required]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_IsProperty1Required];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_IsProperty2Required]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_IsProperty2Required];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_IsProperty2Collection]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_IsProperty2Collection];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_IsProperty1Collection]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_IsProperty1Collection];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_Type]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_Type];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_TargetColumnIndex]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_TargetColumnIndex];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_IsKey]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_IsKey];


GO
PRINT N'Dropping [dbo].[DF_Categories_CurrentNodeIndex]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_CurrentNodeIndex];


GO
PRINT N'Dropping [dbo].[DF_Categories_NextNodeIndex]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_NextNodeIndex];


GO
PRINT N'Dropping [dbo].[DF_Categories_SingleRoleCounter]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_SingleRoleCounter];


GO
PRINT N'Dropping [dbo].[DF_Categories_CompositeRoleCounter]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_CompositeRoleCounter];


GO
PRINT N'Dropping [dbo].[DF_Categories_ResourceTypeCounter]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_ResourceTypeCounter];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension4Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension4Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension5Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension5Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension6Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension6Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension7Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension7Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension3Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension3Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension0Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension0Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension1Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension1Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Dimension2Level]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Dimension2Level];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_UseDimension7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_UseDimension7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_GroupByDimension7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_GroupByDimension7];


GO
PRINT N'Dropping [dbo].[DF_Contexts_Automatic]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [DF_Contexts_Automatic];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsSimumationEnabled]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsSimumationEnabled];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension0Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension0Level];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension1Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension1Level];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsProvisioningEnabled]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsProvisioningEnabled];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension2Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension2Level];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension3Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension3Level];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension4Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension4Level];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension5Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension5Level];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension6Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension6Level];


GO
PRINT N'Dropping [dbo].[DF_Policies_Dimension7Level]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_Dimension7Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension1Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension1Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension0Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension0Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension7Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension7Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension6Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension6Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension5Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension5Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension4Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension4Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension3Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension3Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Dimension2Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Dimension2Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TargetMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TargetMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension0Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension0Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension1Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension1Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension2Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension2Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension3Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension3Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension7Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension7Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension4Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension4Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension5Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension5Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Dimension6Level]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Dimension6Level];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumUpdatePercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumUpdatePercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumInsertPercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumInsertPercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumDeletePercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumDeletePercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumInsert]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumInsert];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumDelete]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumDelete];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumUpdate]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumUpdate];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_BlockProvisioning]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_BlockProvisioning];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_AllowRemove]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_AllowRemove];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_AllowAdd]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_AllowAdd];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_GroupByDimension6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_GroupByDimension6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension5Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension5Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension7Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension7Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension6Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension6Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension2Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension2Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension4Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension4Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension3Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension3Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension1Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension1Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Dimension0Level]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Dimension0Level];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_UseDimension7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_UseDimension7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_GroupByDimension7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_GroupByDimension7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_Resources_Dirty]...';


GO
ALTER TABLE [dbo].[UR_Resources] DROP CONSTRAINT [DF_Resources_Dirty];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_IsInduced]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_IsInduced];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_IsInduced]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_IsInduced];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_ConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_ConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_ProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_ProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_ProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_ProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_IsInduced]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_IsInduced];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_SourceMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_SourceMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ResourceTypeIdentificationConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ResourceTypeIdentificationConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_NeedsPolicyApplication]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_NeedsPolicyApplication];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedCount]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedCount];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowFoundState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowFoundCount]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundCount];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowReviewState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowReviewCount]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewCount];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeCountError]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeCountError];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ManualProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ManualProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_HasPendingOrders]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_HasPendingOrders];


GO
PRINT N'Dropping [dbo].[DF_RecertificationCampaigns_State]...';


GO
ALTER TABLE [dbo].[US_RecertificationCampaigns] DROP CONSTRAINT [DF_RecertificationCampaigns_State];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeSingleRoles]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeSingleRoles];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeResourceTypes]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeResourceTypes];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeResourceNavigations]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeResourceNavigations];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeCompositeRoles]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeCompositeRoles];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeCResourceScalars]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeCResourceScalars];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeWorkflowStatePolicyApproved]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeWorkflowStatePolicyApproved];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeWorkflowStateApproved]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeWorkflowStateApproved];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeWorkflowStateFound]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeWorkflowStateFound];


GO
PRINT N'Dropping [dbo].[DF_RecertificationDataFilters_IncludeWorkflowStateHistory]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [DF_RecertificationDataFilters_IncludeWorkflowStateHistory];


GO
PRINT N'Dropping [dbo].[DF_RecertificationItems_ReviewerDecision]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [DF_RecertificationItems_ReviewerDecision];


GO
PRINT N'Dropping [dbo].[DF_RecertificationItems_AdministratorDecision]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [DF_RecertificationItems_AdministratorDecision];


GO
PRINT N'Dropping [dbo].[FK_AccessControlFilters_Rule]...';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] DROP CONSTRAINT [FK_AccessControlFilters_Rule];


GO
PRINT N'Dropping [dbo].[FK_AccessControlFilters_Binding]...';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] DROP CONSTRAINT [FK_AccessControlFilters_Binding];


GO
PRINT N'Dropping [dbo].[FK_AccessControlFilters_Dimension]...';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] DROP CONSTRAINT [FK_AccessControlFilters_Dimension];


GO
PRINT N'Dropping [dbo].[FK_AssignedProfiles_Context]...';


GO
ALTER TABLE [dbo].[UA_AssignedProfiles] DROP CONSTRAINT [FK_AssignedProfiles_Context];


GO
PRINT N'Dropping [dbo].[FK_OpenIdClients_ProfileContext]...';


GO
ALTER TABLE [dbo].[UA_OpenIdClients] DROP CONSTRAINT [FK_OpenIdClients_ProfileContext];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Category]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Category];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension0]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension1]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension2]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension3]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension4]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension5]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension6]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_Dimension7]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_Connectors_Agent]...';


GO
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [FK_Connectors_Agent];


GO
PRINT N'Dropping [dbo].[FK_EntityTypeMappings_Connector]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [FK_EntityTypeMappings_Connector];


GO
PRINT N'Dropping [dbo].[FK_EntityAssociationMappings_Connector]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] DROP CONSTRAINT [FK_EntityAssociationMappings_Connector];


GO
PRINT N'Dropping [dbo].[FK_ScaffoldingArguments_Connector]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_ScaffoldingArguments_Connector];


GO
PRINT N'Dropping [dbo].[FK_Jobs_Connector]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_Connector];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyMappings_EntityProperty]...';


GO
ALTER TABLE [dbo].[UC_EntityPropertyMappings] DROP CONSTRAINT [FK_EntityPropertyMappings_EntityProperty];


GO
PRINT N'Dropping [dbo].[FK_EntityAssociationMappings_EntityPropertyMapping1]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] DROP CONSTRAINT [FK_EntityAssociationMappings_EntityPropertyMapping1];


GO
PRINT N'Dropping [dbo].[FK_EntityAssociationMappings_EntityPropertyMapping2]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] DROP CONSTRAINT [FK_EntityAssociationMappings_EntityPropertyMapping2];


GO
PRINT N'Dropping [dbo].[FK_Jobs]...';


GO
ALTER TABLE [dbo].[UJ_JobInstances] DROP CONSTRAINT [FK_Jobs];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceErrors_JobInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors] DROP CONSTRAINT [FK_AssignedResourceErrors_JobInstance];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType18]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType18];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType19]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType19];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType20]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType20];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType21]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType21];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType22]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType22];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType23]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType23];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType24]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType24];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType25]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType25];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType26]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType26];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType27]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType27];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType28]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType28];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType29]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType29];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType30]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType30];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType31]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType31];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType32]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType32];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType33]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType33];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType34]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType34];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType35]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType35];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType36]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType36];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType37]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType37];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType38]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType38];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType39]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType39];


GO
PRINT N'Dropping [dbo].[FK_Jobs_Agent]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_Agent];


GO
PRINT N'Dropping [dbo].[FK_Jobs_OpenIdClient]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_OpenIdClient];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType0]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType0];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType1]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType1];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType2]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType2];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType3]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType3];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType4]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType4];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType5]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType5];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType6]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType6];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType7]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType7];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType8]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType8];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType9]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType9];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType10]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType10];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType11]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType11];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType12]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType12];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType13]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType13];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType14]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType14];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType15]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType15];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType16]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType16];


GO
PRINT N'Dropping [dbo].[FK_Jobs_EntityType17]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Jobs_EntityType17];


GO
PRINT N'Dropping [dbo].[FK_Dimension_EntityType]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] DROP CONSTRAINT [FK_Dimension_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceLinks_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] DROP CONSTRAINT [FK_ResourceLinks_Type];


GO
PRINT N'Dropping [dbo].[FK_DisplayEntityAssociations_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] DROP CONSTRAINT [FK_DisplayEntityAssociations_EntityAssociation];


GO
PRINT N'Dropping [dbo].[FK_EntityAssociationMappings_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] DROP CONSTRAINT [FK_EntityAssociationMappings_EntityAssociation];


GO
PRINT N'Dropping [dbo].[FK_EntityAssociations_Property1]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [FK_EntityAssociations_Property1];


GO
PRINT N'Dropping [dbo].[FK_EntityAssociations_Property2]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [FK_EntityAssociations_Property2];


GO
PRINT N'Dropping [dbo].[FK_Nodes_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UU_Nodes] DROP CONSTRAINT [FK_Nodes_EntityAssociation];


GO
PRINT N'Dropping [dbo].[FK_DisplayEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityProperties] DROP CONSTRAINT [FK_DisplayEntityProperties_EntityProperty];


GO
PRINT N'Dropping [dbo].[FK_AccessControlEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UA_AccessControlEntityProperties] DROP CONSTRAINT [FK_AccessControlEntityProperties_EntityProperty];


GO
PRINT N'Dropping [dbo].[FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] DROP CONSTRAINT [FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Property];


GO
PRINT N'Dropping [dbo].[FK_Forms_MainProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] DROP CONSTRAINT [FK_Forms_MainProperty];


GO
PRINT N'Dropping [dbo].[FK_Forms_RecordProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] DROP CONSTRAINT [FK_Forms_RecordProperty];


GO
PRINT N'Dropping [dbo].[FK_Forms_RecordStartProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] DROP CONSTRAINT [FK_Forms_RecordStartProperty];


GO
PRINT N'Dropping [dbo].[FK_Forms_RecordEndProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] DROP CONSTRAINT [FK_Forms_RecordEndProperty];


GO
PRINT N'Dropping [dbo].[FK_Forms_RecordSortProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] DROP CONSTRAINT [FK_Forms_RecordSortProperty];


GO
PRINT N'Dropping [dbo].[FK_Changes_Property]...';


GO
ALTER TABLE [dbo].[UW_Changes] DROP CONSTRAINT [FK_Changes_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Property];


GO
PRINT N'Dropping [dbo].[FK_BindingItems_Property]...';


GO
ALTER TABLE [dbo].[UM_BindingItems] DROP CONSTRAINT [FK_BindingItems_Property];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceNavigations_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [FK_AssignedResourceNavigations_Property];


GO
PRINT N'Dropping [dbo].[FK_ScaffoldingArguments_Property]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_ScaffoldingArguments_Property];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceScalars_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [FK_AssignedResourceScalars_Property];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_StartProperty_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_StartProperty_Id];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_EndProperty_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_EndProperty_Id];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyExpressions_Property]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] DROP CONSTRAINT [FK_EntityPropertyExpressions_Property];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyExpressions_PropertyCriteria]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] DROP CONSTRAINT [FK_EntityPropertyExpressions_PropertyCriteria];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Property];


GO
PRINT N'Dropping [dbo].[FK_RecordProperties_Property_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordProperties] DROP CONSTRAINT [FK_RecordProperties_Property_Id];


GO
PRINT N'Dropping [dbo].[FK_EntityProperties_EntityType]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [FK_EntityProperties_EntityType];


GO
PRINT N'Dropping [dbo].[FK_EntityProperties_Language]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [FK_EntityProperties_Language];


GO
PRINT N'Dropping [dbo].[FK_EntityProperties_NeutralProperty]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [FK_EntityProperties_NeutralProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceFiles_Property]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [FK_ResourceFiles_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_ObjectClasseProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_ObjectClasseProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_DNProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_DNProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_ParentProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_ParentProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_UserAcountControlProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_UserAcountControlProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_RDNProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_RDNProperty];


GO
PRINT N'Dropping [dbo].[FK_DisplayEntityTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityTypes] DROP CONSTRAINT [FK_DisplayEntityTypes_EntityType];


GO
PRINT N'Dropping [dbo].[FK_EntityTypeMappings_EntityType]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [FK_EntityTypeMappings_EntityType];


GO
PRINT N'Dropping [dbo].[FK_Workflows_VariablesType]...';


GO
ALTER TABLE [dbo].[UW_Workflows] DROP CONSTRAINT [FK_Workflows_VariablesType];


GO
PRINT N'Dropping [dbo].[FK_RoleCounters_EntityType]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] DROP CONSTRAINT [FK_RoleCounters_EntityType];


GO
PRINT N'Dropping [dbo].[FK_Resources_Type]...';


GO
ALTER TABLE [dbo].[UR_Resources] DROP CONSTRAINT [FK_Resources_Type];


GO
PRINT N'Dropping [dbo].[FK_MenuItems_EntityType]...';


GO
ALTER TABLE [dbo].[UI_MenuItems] DROP CONSTRAINT [FK_MenuItems_EntityType];


GO
PRINT N'Dropping [dbo].[FK_DisplayTables_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayTables] DROP CONSTRAINT [FK_DisplayTables_EntityType];


GO
PRINT N'Dropping [dbo].[FK_HomonymWorkflowLinks_FormEntityType]...';


GO
ALTER TABLE [dbo].[UW_HomonymEntityLinks] DROP CONSTRAINT [FK_HomonymWorkflowLinks_FormEntityType];


GO
PRINT N'Dropping [dbo].[FK_AccessControlRules_EntityType]...';


GO
ALTER TABLE [dbo].[UA_AccessControlRules] DROP CONSTRAINT [FK_AccessControlRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_FormControls_EntityType]...';


GO
ALTER TABLE [dbo].[UI_FormControls] DROP CONSTRAINT [FK_FormControls_EntityType];


GO
PRINT N'Dropping [dbo].[FK_Forms_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Forms] DROP CONSTRAINT [FK_Forms_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceChanges_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceChanges] DROP CONSTRAINT [FK_ResourceChanges_Type];


GO
PRINT N'Dropping [dbo].[FK_RecertificationCampaigns_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[US_RecertificationCampaigns] DROP CONSTRAINT [FK_RecertificationCampaigns_OwnerEntityType];


GO
PRINT N'Dropping [dbo].[FK_ReportQueries_EntityType]...';


GO
ALTER TABLE [dbo].[UQ_ReportQueries] DROP CONSTRAINT [FK_ReportQueries_EntityType];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_WorkflowInstances_Type]...';


GO
ALTER TABLE [dbo].[UW_WorkflowInstances] DROP CONSTRAINT [FK_WorkflowInstances_Type];


GO
PRINT N'Dropping [dbo].[FK_ScaffoldingArguments_EntityType]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_ScaffoldingArguments_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SearchBars_EntityType]...';


GO
ALTER TABLE [dbo].[UI_SearchBars] DROP CONSTRAINT [FK_SearchBars_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SearchBars_SearchedEntityType]...';


GO
ALTER TABLE [dbo].[UI_SearchBars] DROP CONSTRAINT [FK_SearchBars_SearchedEntityType];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_SourceEntityType_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_SourceEntityType_Id];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_ResourceEntityType_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_ResourceEntityType_Id];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyExpressions_EntityType]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] DROP CONSTRAINT [FK_EntityPropertyExpressions_EntityType];


GO
PRINT N'Dropping [dbo].[FK_Nodes_EntityType]...';


GO
ALTER TABLE [dbo].[UU_Nodes] DROP CONSTRAINT [FK_Nodes_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_SourceEntityTypes]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_SourceEntityTypes];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_SourceEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_SourceEntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_TargetEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_TargetEntityType];


GO
PRINT N'Dropping [dbo].[FK_Notifications_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[UN_Notifications] DROP CONSTRAINT [FK_Notifications_OwnerEntityType];


GO
PRINT N'Dropping [dbo].[FK_Tiles_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Tiles] DROP CONSTRAINT [FK_Tiles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypesCategories_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] DROP CONSTRAINT [FK_ResourceTypesCategories_Category];


GO
PRINT N'Dropping [dbo].[FK_CompositeRolesCategories_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] DROP CONSTRAINT [FK_CompositeRolesCategories_Category];


GO
PRINT N'Dropping [dbo].[FK_RoleCounters_Category]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] DROP CONSTRAINT [FK_RoleCounters_Category];


GO
PRINT N'Dropping [dbo].[FK_SingleRolesCategories_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRolesCategories] DROP CONSTRAINT [FK_SingleRolesCategories_Category];


GO
PRINT N'Dropping [dbo].[FK_Categories_Category]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [FK_Categories_Category];


GO
PRINT N'Dropping [dbo].[FK_Categories_Policy]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [FK_Categories_Policy];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_Category];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_Category];


GO
PRINT N'Dropping [dbo].[FK_RecertificationDataFilters_Category]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [FK_RecertificationDataFilters_Category];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_Category];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Dimension7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_CompositeRolesCategories_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] DROP CONSTRAINT [FK_CompositeRolesCategories_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_Policy];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_Role];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoleUsageContexts_Context]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoleUsageContexts] DROP CONSTRAINT [FK_AssignedSingleRoleUsageContexts_Context];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_GroupByContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_GroupByContext];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_GroupByContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_GroupByContext];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoleUsageContexts_Context]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoleUsageContexts] DROP CONSTRAINT [FK_AssignedCompositeRoleUsageContexts_Context];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_GroupByContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_GroupByContext];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension1]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension2]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension3]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension4]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension5]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension6]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension7]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_Contexts_Dimension0]...';


GO
ALTER TABLE [dbo].[UP_Contexts] DROP CONSTRAINT [FK_Contexts_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_RoleCounters_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] DROP CONSTRAINT [FK_RoleCounters_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension0]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension1]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension2]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension3]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension4]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension5]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension6]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_Policies_Dimension7]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [FK_Policies_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Resource]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Resource];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension0]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension1]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension2]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension3]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension4]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension5]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension6]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Dimension7]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_TargetBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_SourceBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_SourceBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Dimension7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_SingleRole0];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypesCategories_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] DROP CONSTRAINT [FK_ResourceTypesCategories_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ProfileRuleContexts_ResourceType_Id]...';


GO
ALTER TABLE [dbo].[UA_ProfileRuleContexts] DROP CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id];


GO
PRINT N'Dropping [dbo].[FK_RecertificationDataFilters_ResourceType]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [FK_RecertificationDataFilters_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_ContextRule]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_ContextRule];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Dimension7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Role];


GO
PRINT N'Dropping [dbo].[FK_SingleRolesCategories_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRolesCategories] DROP CONSTRAINT [FK_SingleRolesCategories_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_Role];


GO
PRINT N'Dropping [dbo].[FK_AssignedProfiles_Resource]...';


GO
ALTER TABLE [dbo].[UA_AssignedProfiles] DROP CONSTRAINT [FK_AssignedProfiles_Resource];


GO
PRINT N'Dropping [dbo].[FK_ResourceLinks_R1]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] DROP CONSTRAINT [FK_ResourceLinks_R1];


GO
PRINT N'Dropping [dbo].[FK_ResourceLinks_R2]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] DROP CONSTRAINT [FK_ResourceLinks_R2];


GO
PRINT N'Dropping [dbo].[FK_ActivityInstances_Performer]...';


GO
ALTER TABLE [dbo].[UW_ActivityInstances] DROP CONSTRAINT [FK_ActivityInstances_Performer];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_Owner]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_Owner];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_Resource]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_Resource];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_Reviewer]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_Reviewer];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_Administrator]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_Administrator];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_Owner]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_Owner];


GO
PRINT N'Dropping [dbo].[FK_ActivityInstanceCCs_Resource]...';


GO
ALTER TABLE [dbo].[UW_ActivityInstanceCCs] DROP CONSTRAINT [FK_ActivityInstanceCCs_Resource];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_Owner]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_Owner];


GO
PRINT N'Dropping [dbo].[FK_ActivityInstancesPerformers_Actor]...';


GO
ALTER TABLE [dbo].[UW_ActivityInstancesActors] DROP CONSTRAINT [FK_ActivityInstancesPerformers_Actor];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceNavigations_Resource]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [FK_AssignedResourceNavigations_Resource];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_Owner]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_Owner];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension0]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension0];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension1]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension1];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension2]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension2];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension3]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension3];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension4]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension4];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension5]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension5];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension6]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension6];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Dimension7]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Dimension7];


GO
PRINT N'Dropping [dbo].[FK_NotificationInstances_OwnerResource]...';


GO
ALTER TABLE [dbo].[UN_NotificationInstances] DROP CONSTRAINT [FK_NotificationInstances_OwnerResource];


GO
PRINT N'Dropping [dbo].[FK_ResourceFiles_Resource]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [FK_ResourceFiles_Resource];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_AssignedCompositeRole]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_AssignedCompositeRole];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoleUsageContexts_AssignedCompositeRole]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoleUsageContexts] DROP CONSTRAINT [FK_AssignedCompositeRoleUsageContexts_AssignedCompositeRole];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_AssignedResourceNavigation]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_AssignedResourceNavigation];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_AssignedResourceScalar]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_AssignedResourceScalar];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_AssignedResourceType]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_AssignedResourceType];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceErrors_AssignedResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors] DROP CONSTRAINT [FK_AssignedResourceErrors_AssignedResourceType];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceNavigations_AssignedResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [FK_AssignedResourceNavigations_AssignedResourceType];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceScalars_AssignedResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [FK_AssignedResourceScalars_AssignedResourceType];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoleUsageContexts_AssignedSingleRole]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoleUsageContexts] DROP CONSTRAINT [FK_AssignedSingleRoleUsageContexts_AssignedSingleRole];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_AssignedSingleRole]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_AssignedSingleRole];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceNavigations_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [FK_AssignedResourceNavigations_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceScalars_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [FK_AssignedResourceScalars_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_RecertificationItem_Campaign]...';


GO
ALTER TABLE [dbo].[US_RecertificationItems] DROP CONSTRAINT [FK_RecertificationItem_Campaign];


GO
PRINT N'Dropping [dbo].[FK_RecertificationOwnerFilters_Campaign]...';


GO
ALTER TABLE [dbo].[US_RecertificationOwnerFilters] DROP CONSTRAINT [FK_RecertificationOwnerFilters_Campaign];


GO
PRINT N'Dropping [dbo].[FK_RecertificationDataFilters_Campaign]...';


GO
ALTER TABLE [dbo].[US_RecertificationDataFilters] DROP CONSTRAINT [FK_RecertificationDataFilters_Campaign];


GO
PRINT N'Dropping [dbo].[FK_ScaffoldingArguments_Profile]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_ScaffoldingArguments_Profile];


GO
PRINT N'Dropping [dbo].[U_ScaffoldingArguments_Identifier]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [U_ScaffoldingArguments_Identifier];


GO
PRINT N'Dropping [dbo].[U_Jobs_Identifier]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [U_Jobs_Identifier];


GO
PRINT N'Dropping [dbo].[PK_AssignedResourceErrors]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors] DROP CONSTRAINT [PK_AssignedResourceErrors];


GO
PRINT N'Dropping [dbo].[PK_AssignedResourceNavigations]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [PK_AssignedResourceNavigations];


GO
PRINT N'Dropping [dbo].[PK_AssignedResourceScalar]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [PK_AssignedResourceScalar];


GO
PRINT N'Dropping [dbo].[PK_AssignedResourceTypes]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [PK_AssignedResourceTypes];


GO
PRINT N'Dropping [dbo].[PK_ResourceFiles]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [PK_ResourceFiles];


GO
PRINT N'Dropping [dbo].[UP_AssignedCompositeRoleUsageContexts]...';


GO
DROP TABLE [dbo].[UP_AssignedCompositeRoleUsageContexts];


GO
PRINT N'Dropping [dbo].[UP_AssignedSingleRoleUsageContexts]...';


GO
DROP TABLE [dbo].[UP_AssignedSingleRoleUsageContexts];


GO
PRINT N'Dropping [dbo].[US_RecertificationCampaigns]...';


GO
DROP TABLE [dbo].[US_RecertificationCampaigns];


GO
PRINT N'Dropping [dbo].[US_RecertificationDataFilters]...';


GO
DROP TABLE [dbo].[US_RecertificationDataFilters];


GO
PRINT N'Dropping [dbo].[US_RecertificationItems]...';


GO
DROP TABLE [dbo].[US_RecertificationItems];


GO
PRINT N'Dropping [dbo].[US_RecertificationOwnerFilters]...';


GO
DROP TABLE [dbo].[US_RecertificationOwnerFilters];


GO
PRINT N'Starting rebuilding table [dbo].[UA_AccessControlFilters]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UA_AccessControlFilters] (
    [Id]            BIGINT         NOT NULL,
    [Rule_Id]       BIGINT         NOT NULL,
    [Binding_Id]    BIGINT         NOT NULL,
    [CompositeRole] BIT            CONSTRAINT [DF_AccessControlFilters_CompositeRole] DEFAULT ((0)) NOT NULL,
    [SingleRole]    BIT            CONSTRAINT [DF_AccessControlFilters_SingleRole] DEFAULT ((0)) NOT NULL,
    [ResourceType]  BIT            CONSTRAINT [DF_AccessControlFilters_ResourceType] DEFAULT ((0)) NOT NULL,
    [Category]      BIT            CONSTRAINT [DF_AccessControlFilters_Category] DEFAULT ((0)) NOT NULL,
    [Dimension_Id]  BIGINT         NULL,
    [Value]         NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AccessControlFilters1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UA_AccessControlFilters])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UA_AccessControlFilters] ([Id], [Rule_Id], [Binding_Id], [Category], [Dimension_Id], [Value])
        SELECT   [Id],
                 [Rule_Id],
                 [Binding_Id],
                 [Category],
                 [Dimension_Id],
                 [Value]
        FROM     [dbo].[UA_AccessControlFilters]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UA_AccessControlFilters];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UA_AccessControlFilters]', N'UA_AccessControlFilters';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AccessControlFilters1]', N'PK_AccessControlFilters', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UA_ProfileContexts]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UA_ProfileContexts] (
    [Id]               BIGINT NOT NULL,
    [IsAutomatic]      BIT    CONSTRAINT [DF_ProfileContexts_IsAutomatic] DEFAULT ((0)) NOT NULL,
    [CompositeRole_Id] BIGINT NULL,
    [SingleRole_Id]    BIGINT NULL,
    [ResourceType_Id]  BIGINT NULL,
    [Category_Id]      BIGINT NULL,
    [Dimension0_Id]    BIGINT NULL,
    [Dimension1_Id]    BIGINT NULL,
    [Dimension2_Id]    BIGINT NULL,
    [Dimension3_Id]    BIGINT NULL,
    [Dimension4_Id]    BIGINT NULL,
    [Dimension5_Id]    BIGINT NULL,
    [Dimension6_Id]    BIGINT NULL,
    [Dimension7_Id]    BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ProfileContexts1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UA_ProfileContexts])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UA_ProfileContexts] ([Id], [IsAutomatic], [Category_Id], [Dimension0_Id], [Dimension1_Id], [Dimension2_Id], [Dimension3_Id], [Dimension4_Id], [Dimension5_Id], [Dimension6_Id], [Dimension7_Id])
        SELECT   [Id],
                 [IsAutomatic],
                 [Category_Id],
                 [Dimension0_Id],
                 [Dimension1_Id],
                 [Dimension2_Id],
                 [Dimension3_Id],
                 [Dimension4_Id],
                 [Dimension5_Id],
                 [Dimension6_Id],
                 [Dimension7_Id]
        FROM     [dbo].[UA_ProfileContexts]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UA_ProfileContexts];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UA_ProfileContexts]', N'UA_ProfileContexts';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ProfileContexts1]', N'PK_ProfileContexts', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column [dbo].[UC_Connectors].[ProvisionerType] is being dropped, data loss could occur.

The column CollectorType on table [dbo].[UC_Connectors] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The type for column CollectorType in table [dbo].[UC_Connectors] is currently  NVARCHAR (442) NULL but is being changed to  INT NOT NULL. Data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UC_Connectors]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UC_Connectors] (
    [Id]                             BIGINT         NOT NULL,
    [Identifier]                     VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]                 NVARCHAR (442) NOT NULL,
    [DisplayName_L2]                 NVARCHAR (442) NULL,
    [DisplayName_L3]                 NVARCHAR (442) NULL,
    [DisplayName_L4]                 NVARCHAR (442) NULL,
    [DisplayName_L5]                 NVARCHAR (442) NULL,
    [DisplayName_L6]                 NVARCHAR (442) NULL,
    [DisplayName_L7]                 NVARCHAR (442) NULL,
    [DisplayName_L8]                 NVARCHAR (442) NULL,
    [Agent_Id]                       BIGINT         NULL,
    [IsWorkflowProvisioning]         BIT            CONSTRAINT [DF_Connector_IsWorkflowProvisioning] DEFAULT ((0)) NOT NULL,
    [IsManualProvisioning]           BIT            CONSTRAINT [DF_Connector_IsManualProvisioning] DEFAULT ((0)) NOT NULL,
    [CollectorType]                  INT            CONSTRAINT [DF_Connector_CollectorType] DEFAULT ((0)) NOT NULL,
    [SynchronizationType]            NVARCHAR (442) NULL,
    [ProvisioningType]               NVARCHAR (442) NULL,
    [MaximumInsertedLines]           INT            CONSTRAINT [DF_Connectors_MaximumInsertedLines] DEFAULT ((0)) NOT NULL,
    [MaximumDeletedLines]            INT            CONSTRAINT [DF_Connectors_MaximumDeletedLines] DEFAULT ((0)) NOT NULL,
    [MaximumUpdatedLines]            INT            CONSTRAINT [DF_Connectors_MaximumUpdatedLines] DEFAULT ((0)) NOT NULL,
    [MaxPercentageInsertedLines]     INT            CONSTRAINT [DF_Connectors_MaxPercentageInsertedLines] DEFAULT ((30)) NOT NULL,
    [MaxPercentageDeletedLines]      INT            CONSTRAINT [DF_Connectors_MaxPercentageDeletedLines] DEFAULT ((30)) NOT NULL,
    [MaxPercentageUpdatedLines]      INT            CONSTRAINT [DF_Connectors_MaxPercentageUpdatedLines] DEFAULT ((30)) NOT NULL,
    [MaximumLinkInsertedLines]       INT            CONSTRAINT [DF_Connectors_MaximumLinkInsertedLines] DEFAULT ((0)) NOT NULL,
    [MaximumLinkDeletedLines]        INT            CONSTRAINT [DF_Connectors_MaximumLinkDeletedLines] DEFAULT ((0)) NOT NULL,
    [MaxLinkPercentageInsertedLines] INT            CONSTRAINT [DF_Connectors_MaxLinkPercentageInsertedLines] DEFAULT ((30)) NOT NULL,
    [MaxLinkPercentageDeletedLines]  INT            CONSTRAINT [DF_Connectors_MaxLinkPercentageDeletedLines] DEFAULT ((30)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Connectors1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Connectors_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UC_Connectors])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UC_Connectors] ([Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [Agent_Id], [CollectorType], [SynchronizationType], [ProvisioningType], [MaximumInsertedLines], [MaximumDeletedLines], [MaximumUpdatedLines], [MaxPercentageInsertedLines], [MaxPercentageDeletedLines], [MaxPercentageUpdatedLines], [MaximumLinkInsertedLines], [MaximumLinkDeletedLines], [MaxLinkPercentageInsertedLines], [MaxLinkPercentageDeletedLines])
        SELECT   [Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [Agent_Id],
                 [CollectorType],
                 [SynchronizationType],
                 [ProvisioningType],
                 [MaximumInsertedLines],
                 [MaximumDeletedLines],
                 [MaximumUpdatedLines],
                 [MaxPercentageInsertedLines],
                 [MaxPercentageDeletedLines],
                 [MaxPercentageUpdatedLines],
                 [MaximumLinkInsertedLines],
                 [MaximumLinkDeletedLines],
                 [MaxLinkPercentageInsertedLines],
                 [MaxLinkPercentageDeletedLines]
        FROM     [dbo].[UC_Connectors]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UC_Connectors];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UC_Connectors]', N'UC_Connectors';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Connectors1]', N'PK_Connectors', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Connectors_Identifier1]', N'U_Connectors_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UC_EntityPropertyMappings]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UC_EntityPropertyMappings] (
    [Id]                           BIGINT         NOT NULL,
    [IsPrimaryKey]                 BIT            CONSTRAINT [DF_EntityPropertyMappings_IsPrimaryKey] DEFAULT ((0)) NOT NULL,
    [IsUniqueKey]                  BIT            CONSTRAINT [DF_EntityPropertyMappings_IsUniqueKey] DEFAULT ((0)) NOT NULL,
    [IsMultiValuedProperty]        BIT            CONSTRAINT [DF_EntityPropertyMappings_IsMultiValuedProperty] DEFAULT ((0)) NOT NULL,
    [DataSourceColumnName]         NVARCHAR (442) NULL,
    [DataSourceBacklinkColumnName] NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_EntityPropertyMappings1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UC_EntityPropertyMappings])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UC_EntityPropertyMappings] ([Id], [IsPrimaryKey], [IsMultiValuedProperty], [DataSourceColumnName], [DataSourceBacklinkColumnName])
        SELECT   [Id],
                 [IsPrimaryKey],
                 [IsMultiValuedProperty],
                 [DataSourceColumnName],
                 [DataSourceBacklinkColumnName]
        FROM     [dbo].[UC_EntityPropertyMappings]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UC_EntityPropertyMappings];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UC_EntityPropertyMappings]', N'UC_EntityPropertyMappings';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_EntityPropertyMappings1]', N'PK_EntityPropertyMappings', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UD_ScaffoldingArguments]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] ALTER COLUMN [Identifier] VARCHAR (442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL;


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments]
    ADD [Order]                   INT            NULL,
        [ConnectorIdentifier]     NVARCHAR (442) NULL,
        [TaskIdentifier]          NVARCHAR (442) NULL,
        [ScaffoldingArgumentType] NVARCHAR (442) NOT NULL,
        [Before]                  BIT            NULL,
        [After]                   BIT            NULL,
        [CopyOccurence]           INT            NULL,
        [SearchBarPage]           INT            NULL;


GO
PRINT N'Creating [dbo].[U_ScaffoldingArguments_Identifier]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments]
    ADD CONSTRAINT [U_ScaffoldingArguments_Identifier] UNIQUE NONCLUSTERED ([Identifier] ASC);


GO
PRINT N'Altering [dbo].[UD_Scaffoldings]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings]
    ADD [Workflow_Id]    BIGINT         NULL,
        [Agent_Id]       BIGINT         NULL,
        [JobIdentifier]  NVARCHAR (442) NULL,
        [DisplayName_L1] NVARCHAR (442) NULL,
        [DisplayName_L2] NVARCHAR (442) NULL,
        [DisplayName_L3] NVARCHAR (442) NULL,
        [DisplayName_L4] NVARCHAR (442) NULL,
        [DisplayName_L5] NVARCHAR (442) NULL,
        [DisplayName_L6] NVARCHAR (442) NULL,
        [DisplayName_L7] NVARCHAR (442) NULL,
        [DisplayName_L8] NVARCHAR (442) NULL;


GO
/*
The column [dbo].[UJ_JobInstances].[C0] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[C1] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[C2] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[C3] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[C4] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[C5] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[C6] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[C7] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L1] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L2] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L3] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L4] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L5] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L6] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L7] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[DisplayName_L8] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[LastExecutionDate] is being dropped, data loss could occur.

The column [dbo].[UJ_JobInstances].[CurrentLaunch] on table [dbo].[UJ_JobInstances] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[UJ_JobInstances].[TotalLaunch] on table [dbo].[UJ_JobInstances] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The type for column State in table [dbo].[UJ_JobInstances] is currently  INT NOT NULL but is being changed to  SMALLINT NOT NULL. Data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UJ_JobInstances]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UJ_JobInstances] (
    [Id]              BIGINT   NOT NULL,
    [Job_Id]          BIGINT   NOT NULL,
    [StartDate]       DATETIME NOT NULL,
    [EndDate]         DATETIME NULL,
    [CurrentLaunch]   INT      NOT NULL,
    [TotalLaunch]     INT      NOT NULL,
    [State]           SMALLINT NOT NULL,
    [User_Id]         BIGINT   NULL,
    [CancelRequested] BIT      CONSTRAINT [DF_JobInstances_CancelRequested] DEFAULT (0) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_JobInstances1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UJ_JobInstances])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UJ_JobInstances] ([Id], [Job_Id], [StartDate], [EndDate], [CancelRequested], [State])
        SELECT   [Id],
                 [Job_Id],
                 [StartDate],
                 [EndDate],
                 [CancelRequested],
                 [State]
        FROM     [dbo].[UJ_JobInstances]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UJ_JobInstances];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UJ_JobInstances]', N'UJ_JobInstances';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_JobInstances1]', N'PK_JobInstances', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column [dbo].[UJ_Jobs].[AllEntityType] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[BatchInsertSize] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[BatchSelectSize] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[BatchSize] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[BatchUpdateSize] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[BlockProvisioning] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[Check] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[ClientIdentifier] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[Connector_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[Dirty] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[DoNotDeleteChanges] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType0_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType1_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType10_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType11_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType12_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType13_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType14_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType15_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType16_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType17_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType18_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType19_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType2_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType20_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType21_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType22_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType23_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType24_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType25_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType26_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType27_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType28_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType29_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType3_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType30_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType31_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType32_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType33_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType34_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType35_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType36_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType37_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType38_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType39_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType4_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType5_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType6_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType7_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType8_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[EntityType9_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[InputPath] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[InstanceIdentifier] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[JobInstanceId] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[JobType] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[Mode] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[OpenIdClient_Id] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[OutputPath] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[ProvisioningJobIdentifier] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[SessionOff] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[SplitSize] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[State] is being dropped, data loss could occur.

The column [dbo].[UJ_Jobs].[SynchronizationJobIdentifier] is being dropped, data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UJ_Jobs]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UJ_Jobs] (
    [Id]                 BIGINT         NOT NULL,
    [Identifier]         NVARCHAR (442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]     NVARCHAR (442) NOT NULL,
    [DisplayName_L2]     NVARCHAR (442) NULL,
    [DisplayName_L3]     NVARCHAR (442) NULL,
    [DisplayName_L4]     NVARCHAR (442) NULL,
    [DisplayName_L5]     NVARCHAR (442) NULL,
    [DisplayName_L6]     NVARCHAR (442) NULL,
    [DisplayName_L7]     NVARCHAR (442) NULL,
    [DisplayName_L8]     NVARCHAR (442) NULL,
    [CronTabExpression]  NVARCHAR (442) NULL,
    [Agent_Id]           BIGINT         NULL,
    [UserStartDenied]    BIT            CONSTRAINT [DF_Jobs_StartDisabled] DEFAULT ((0)) NOT NULL,
    [LastJobInstance_Id] BIGINT         NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Jobs1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Jobs1] UNIQUE NONCLUSTERED ([Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UJ_Jobs])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UJ_Jobs] ([Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [UserStartDenied], [Agent_Id], [CrontabExpression])
        SELECT   [Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [UserStartDenied],
                 [Agent_Id],
                 [CrontabExpression]
        FROM     [dbo].[UJ_Jobs]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UJ_Jobs];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UJ_Jobs]', N'UJ_Jobs';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Jobs1]', N'PK_Jobs', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Jobs1]', N'U_Jobs', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UM_Dimensions]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UM_Dimensions] (
    [Id]                BIGINT         NOT NULL,
    [EntityType_Id]     BIGINT         NOT NULL,
    [ColumnMapping]     INT            NOT NULL,
    [Identifier]        VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [IsHierarchical]    BIT            CONSTRAINT [DF_Dimensions_IsHierarchical] DEFAULT ((0)) NOT NULL,
    [ParentProperty_Id] BIGINT         NULL,
    [PathProperty_Id]   BIGINT         NULL,
    [DisplayName_L1]    NVARCHAR (442) NULL,
    [DisplayName_L2]    NVARCHAR (442) NULL,
    [DisplayName_L3]    NVARCHAR (442) NULL,
    [DisplayName_L4]    NVARCHAR (442) NULL,
    [DisplayName_L5]    NVARCHAR (442) NULL,
    [DisplayName_L6]    NVARCHAR (442) NULL,
    [DisplayName_L7]    NVARCHAR (442) NULL,
    [DisplayName_L8]    NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Dimensions1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Dimensions_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UM_Dimensions])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UM_Dimensions] ([Id], [EntityType_Id], [ColumnMapping], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8])
        SELECT   [Id],
                 [EntityType_Id],
                 [ColumnMapping],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8]
        FROM     [dbo].[UM_Dimensions]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UM_Dimensions];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UM_Dimensions]', N'UM_Dimensions';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Dimensions1]', N'PK_Dimensions', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Dimensions_Identifier1]', N'U_Dimensions_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UM_EntityAssociations]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UM_EntityAssociations] (
    [Id]                    BIGINT         NOT NULL,
    [Identifier]            VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [Property1_Id]          BIGINT         NOT NULL,
    [Property2_Id]          BIGINT         NOT NULL,
    [IsProperty1Collection] BIT            CONSTRAINT [DF_EntityAssociations_IsProperty1Collection] DEFAULT ((0)) NOT NULL,
    [IsProperty2Collection] BIT            CONSTRAINT [DF_EntityAssociations_IsProperty2Collection] DEFAULT ((0)) NOT NULL,
    [IsProperty1Required]   BIT            CONSTRAINT [DF_EntityAssociations_IsProperty1Required] DEFAULT ((0)) NOT NULL,
    [IsProperty2Required]   BIT            CONSTRAINT [DF_EntityAssociations_IsProperty2Required] DEFAULT ((0)) NOT NULL,
    [ValidFrom]             DATETIME2 (2)  CONSTRAINT [DF_EntityAssociations_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]               DATETIME2 (2)  CONSTRAINT [DF_EntityAssociations_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [DisplayName_L1]        NVARCHAR (442) NULL,
    [DisplayName_L2]        NVARCHAR (442) NULL,
    [DisplayName_L3]        NVARCHAR (442) NULL,
    [DisplayName_L4]        NVARCHAR (442) NULL,
    [DisplayName_L5]        NVARCHAR (442) NULL,
    [DisplayName_L6]        NVARCHAR (442) NULL,
    [DisplayName_L7]        NVARCHAR (442) NULL,
    [DisplayName_L8]        NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_EntityAssociations1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_EntityAssociations_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_EntityAssociations1]
    ON [dbo].[tmp_ms_xx_UM_EntityAssociations]([Id] ASC, [ValidTo] DESC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UM_EntityAssociations])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UM_EntityAssociations] ([Id], [Identifier], [Property1_Id], [Property2_Id], [IsProperty1Collection], [IsProperty2Collection], [IsProperty1Required], [IsProperty2Required], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8])
        SELECT   [Id],
                 [Identifier],
                 [Property1_Id],
                 [Property2_Id],
                 [IsProperty1Collection],
                 [IsProperty2Collection],
                 [IsProperty1Required],
                 [IsProperty2Required],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8]
        FROM     [dbo].[UM_EntityAssociations]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UM_EntityAssociations];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UM_EntityAssociations]', N'UM_EntityAssociations';

EXECUTE sp_rename N'[dbo].[UM_EntityAssociations].[tmp_ms_xx_index_IX_EntityAssociations1]', N'IX_EntityAssociations', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_EntityAssociations1]', N'PK_EntityAssociations', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_EntityAssociations_Identifier1]', N'U_EntityAssociations_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UM_EntityProperties]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UM_EntityProperties] (
    [Id]                           BIGINT         NOT NULL,
    [EntityType_Id]                BIGINT         NOT NULL,
    [Identifier]                   VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [Type]                         INT            CONSTRAINT [DF_EntityProperties_Type] DEFAULT ((0)) NOT NULL,
    [TargetColumnIndex]            INT            CONSTRAINT [DF_EntityProperties_TargetColumnIndex] DEFAULT ((-1)) NOT NULL,
    [IsKey]                        BIT            CONSTRAINT [DF_EntityProperties_IsKey] DEFAULT ((0)) NOT NULL,
    [HistoryPrecision]             INT            CONSTRAINT [DF_EntityProperties_HistoryPrecision] DEFAULT ((0)) NOT NULL,
    [ValidFrom]                    DATETIME2 (2)  CONSTRAINT [DF_EntityProperties_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                      DATETIME2 (2)  CONSTRAINT [DF_EntityProperties_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [DisplayName_L1]               NVARCHAR (442) NULL,
    [DisplayName_L2]               NVARCHAR (442) NULL,
    [DisplayName_L3]               NVARCHAR (442) NULL,
    [DisplayName_L4]               NVARCHAR (442) NULL,
    [DisplayName_L5]               NVARCHAR (442) NULL,
    [DisplayName_L6]               NVARCHAR (442) NULL,
    [DisplayName_L7]               NVARCHAR (442) NULL,
    [DisplayName_L8]               NVARCHAR (442) NULL,
    [Language_Id]                  BIGINT         NULL,
    [NeutralProperty_Id]           BIGINT         NULL,
    [FlexibleComparisonExpression] VARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_EntityProperties1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_EntityProperties_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [EntityType_Id] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_EntityProperties1]
    ON [dbo].[tmp_ms_xx_UM_EntityProperties]([Id] ASC, [ValidTo] DESC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UM_EntityProperties])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UM_EntityProperties] ([Id], [EntityType_Id], [Identifier], [Type], [TargetColumnIndex], [IsKey], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [Language_Id], [NeutralProperty_Id], [FlexibleComparisonExpression])
        SELECT   [Id],
                 [EntityType_Id],
                 [Identifier],
                 [Type],
                 [TargetColumnIndex],
                 [IsKey],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [Language_Id],
                 [NeutralProperty_Id],
                 [FlexibleComparisonExpression]
        FROM     [dbo].[UM_EntityProperties]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UM_EntityProperties];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UM_EntityProperties]', N'UM_EntityProperties';

EXECUTE sp_rename N'[dbo].[UM_EntityProperties].[tmp_ms_xx_index_IX_EntityProperties1]', N'IX_EntityProperties', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_EntityProperties1]', N'PK_EntityProperties', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_EntityProperties_Identifier1]', N'U_EntityProperties_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UM_EntityTypes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UM_EntityTypes] (
    [Id]             BIGINT         NOT NULL,
    [Identifier]     VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ValidFrom]      DATETIME2 (2)  CONSTRAINT [DF_EntityTypes_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]        DATETIME2 (2)  CONSTRAINT [DF_EntityTypes_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [DisplayName_L1] NVARCHAR (442) NULL,
    [DisplayName_L2] NVARCHAR (442) NULL,
    [DisplayName_L3] NVARCHAR (442) NULL,
    [DisplayName_L4] NVARCHAR (442) NULL,
    [DisplayName_L5] NVARCHAR (442) NULL,
    [DisplayName_L6] NVARCHAR (442) NULL,
    [DisplayName_L7] NVARCHAR (442) NULL,
    [DisplayName_L8] NVARCHAR (442) NULL,
    [TableName]      NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_EntityTypes1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_EntityTypes_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_EntityTypes1]
    ON [dbo].[tmp_ms_xx_UM_EntityTypes]([Id] ASC, [ValidTo] DESC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UM_EntityTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UM_EntityTypes] ([Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [TableName])
        SELECT   [Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [TableName]
        FROM     [dbo].[UM_EntityTypes]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UM_EntityTypes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UM_EntityTypes]', N'UM_EntityTypes';

EXECUTE sp_rename N'[dbo].[UM_EntityTypes].[tmp_ms_xx_index_IX_EntityTypes1]', N'IX_EntityTypes', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_EntityTypes1]', N'PK_EntityTypes', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_EntityTypes_Identifier1]', N'U_EntityTypes_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedCompositeRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedCompositeRoles] (
    [Id]                   BIGINT         NOT NULL,
    [Role_Id]              BIGINT         NOT NULL,
    [Owner_Id]             BIGINT         NOT NULL,
    [ParametersContext_Id] BIGINT         NOT NULL,
    [IsDenied]             BIT            CONSTRAINT [DF_AssignedCompositeRoles_IsDenied] DEFAULT ((0)) NOT NULL,
    [IsInduced]            BIT            CONSTRAINT [DF_AssignedCompositeRoles_IsInduced] DEFAULT ((0)) NOT NULL,
    [WorkflowState]        TINYINT        CONSTRAINT [DF_AssignedCompositeRoles_WorkflowState] DEFAULT ((0)) NOT NULL,
    [StartDate]            SMALLDATETIME  CONSTRAINT [DF_AssignedCompositeRoles_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]              SMALLDATETIME  CONSTRAINT [DF_AssignedCompositeRoles_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [WhenCreated]          SMALLDATETIME  CONSTRAINT [DF_AssignedCompositeRoles_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WhenPerformed]        SMALLDATETIME  NULL,
    [Performer_Id]         BIGINT         NULL,
    [WorkflowInstance_Id]  BIGINT         NULL,
    [Comment]              NVARCHAR (442) NULL,
    [ValidFrom]            DATETIME2 (2)  CONSTRAINT [DF_AssignedCompositeRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]              DATETIME2 (2)  CONSTRAINT [DF_AssignedCompositeRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedCompositeRoles1] PRIMARY KEY CLUSTERED ([Owner_Id] ASC, [ValidTo] DESC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_UK_AssignedCompositeRoles1] UNIQUE NONCLUSTERED ([Id] ASC, [ValidTo] DESC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedCompositeRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedCompositeRoles] ([Owner_Id], [Role_Id], [ParametersContext_Id], [StartDate], [Id], [IsDenied], [IsInduced], [WorkflowState], [EndDate], [WhenCreated], [WhenPerformed], [Performer_Id], [WorkflowInstance_Id])
        SELECT   [Owner_Id],
                 [Role_Id],
                 [ParametersContext_Id],
                 [StartDate],
                 [Id],
                 [IsDenied],
                 [IsInduced],
                 [WorkflowState],
                 [EndDate],
                 [WhenCreated],
                 [WhenPerformed],
                 [Performer_Id],
                 [WorkflowInstance_Id]
        FROM     [dbo].[UP_AssignedCompositeRoles]
        ORDER BY [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedCompositeRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedCompositeRoles]', N'UP_AssignedCompositeRoles';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedCompositeRoles1]', N'PK_AssignedCompositeRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_UK_AssignedCompositeRoles1]', N'UK_AssignedCompositeRoles', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedResourceNavigations]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedResourceNavigations] (
    [Id]                      BIGINT        NOT NULL,
    [AssignedResourceType_Id] BIGINT        NOT NULL,
    [Property_Id]             BIGINT        NOT NULL,
    [Resource_Id]             BIGINT        NOT NULL,
    [IsDenied]                BIT           CONSTRAINT [DF_AssignedResourceNavigations_IsDenied] DEFAULT ((0)) NOT NULL,
    [WorkflowState]           TINYINT       CONSTRAINT [DF_AssignedResourceNavigations_WorkflowState] DEFAULT ((0)) NOT NULL,
    [ProvisioningState]       TINYINT       CONSTRAINT [DF_AssignedResourceNavigations_ProvisioningState] DEFAULT ((0)) NOT NULL,
    [ConfidenceLevel]         TINYINT       CONSTRAINT [DF_AssignedResourceNavigations_ConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [StartDate]               SMALLDATETIME CONSTRAINT [DF_AssignedResourceNavigations_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]                 SMALLDATETIME CONSTRAINT [DF_AssignedResourceNavigations_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [WhenCreated]             SMALLDATETIME CONSTRAINT [DF_AssignedResourceNavigations_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WhenPerformed]           SMALLDATETIME NULL,
    [Performer_Id]            BIGINT        NULL,
    [WorkflowInstance_Id]     BIGINT        NULL,
    [PolicyResource_Id]       BIGINT        NULL,
    [ValidFrom]               DATETIME2 (2) CONSTRAINT [DF_AssignedResourceNavigations_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                 DATETIME2 (2) CONSTRAINT [DF_AssignedResourceNavigations_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_CK_AssignedResourceNavigations1] UNIQUE CLUSTERED ([AssignedResourceType_Id] ASC, [ValidTo] DESC, [Property_Id] ASC, [Resource_Id] ASC, [StartDate] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedResourceNavigations1] PRIMARY KEY NONCLUSTERED ([ValidTo] DESC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedResourceNavigations])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedResourceNavigations] ([AssignedResourceType_Id], [Property_Id], [Resource_Id], [StartDate], [Id], [IsDenied], [WorkflowState], [ProvisioningState], [ConfidenceLevel], [EndDate], [WhenCreated], [WhenPerformed], [Performer_Id], [WorkflowInstance_Id])
        SELECT   [AssignedResourceType_Id],
                 [Property_Id],
                 [Resource_Id],
                 [StartDate],
                 [Id],
                 [IsDenied],
                 [WorkflowState],
                 [ProvisioningState],
                 [ConfidenceLevel],
                 [EndDate],
                 [WhenCreated],
                 [WhenPerformed],
                 [Performer_Id],
                 [WorkflowInstance_Id]
        FROM     [dbo].[UP_AssignedResourceNavigations]
        ORDER BY [AssignedResourceType_Id] ASC, [Property_Id] ASC, [Resource_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedResourceNavigations];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedResourceNavigations]', N'UP_AssignedResourceNavigations';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_CK_AssignedResourceNavigations1]', N'CK_AssignedResourceNavigations', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedResourceNavigations1]', N'PK_AssignedResourceNavigations', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedResourceScalars]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedResourceScalars] (
    [Id]                      BIGINT          NOT NULL,
    [AssignedResourceType_Id] BIGINT          NOT NULL,
    [Property_Id]             BIGINT          NOT NULL,
    [WorkflowState]           TINYINT         CONSTRAINT [DF_AssignedResourceScalars_WorkflowState] DEFAULT ((0)) NOT NULL,
    [ProvisioningState]       TINYINT         CONSTRAINT [DF_AssignedResourceScalars_ProvisioningState] DEFAULT ((0)) NOT NULL,
    [StartDate]               SMALLDATETIME   CONSTRAINT [DF_AssignedResourceScalars_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]                 SMALLDATETIME   CONSTRAINT [DF_AssignedResourceScalars_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [WhenCreated]             SMALLDATETIME   CONSTRAINT [DF_AssignedResourceScalars_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WhenPerformed]           SMALLDATETIME   NULL,
    [Performer_Id]            BIGINT          NULL,
    [WorkflowInstance_Id]     BIGINT          NULL,
    [Value]                   NVARCHAR (4000) NULL,
    [PolicyValue]             NVARCHAR (4000) NULL,
    [ValidFrom]               DATETIME2 (2)   CONSTRAINT [DF_AssignedResourceScalars_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                 DATETIME2 (2)   CONSTRAINT [DF_AssignedResourceScalars_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_CK_AssignedResourceScalar1] UNIQUE CLUSTERED ([AssignedResourceType_Id] ASC, [ValidTo] DESC, [Property_Id] ASC, [StartDate] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedResourceScalar1] PRIMARY KEY NONCLUSTERED ([ValidTo] DESC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedResourceScalars])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedResourceScalars] ([AssignedResourceType_Id], [Property_Id], [StartDate], [Id], [WorkflowState], [ProvisioningState], [EndDate], [WhenCreated], [WhenPerformed], [Performer_Id], [WorkflowInstance_Id], [Value])
        SELECT   [AssignedResourceType_Id],
                 [Property_Id],
                 [StartDate],
                 [Id],
                 [WorkflowState],
                 [ProvisioningState],
                 [EndDate],
                 [WhenCreated],
                 [WhenPerformed],
                 [Performer_Id],
                 [WorkflowInstance_Id],
                 [Value]
        FROM     [dbo].[UP_AssignedResourceScalars]
        ORDER BY [AssignedResourceType_Id] ASC, [Property_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedResourceScalars];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedResourceScalars]', N'UP_AssignedResourceScalars';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_CK_AssignedResourceScalar1]', N'CK_AssignedResourceScalar', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedResourceScalar1]', N'PK_AssignedResourceScalar', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedResourceTypes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedResourceTypes] (
    [Id]                                         BIGINT         NOT NULL,
    [ResourceType_Id]                            BIGINT         NOT NULL,
    [Owner_Id]                                   BIGINT         NULL,
    [Resource_Id]                                BIGINT         NULL,
    [ParametersContext_Id]                       BIGINT         NOT NULL,
    [IsDenied]                                   BIT            CONSTRAINT [DF_AssignedResourceTypes_IsDenied] DEFAULT ((0)) NOT NULL,
    [IsInduced]                                  BIT            CONSTRAINT [DF_AssignedResourceTypes_IsInduced] DEFAULT ((0)) NOT NULL,
    [WorkflowState]                              TINYINT        CONSTRAINT [DF_AssignedResourceTypes_WorkflowState] DEFAULT ((0)) NOT NULL,
    [ProvisioningState]                          TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ProvisioningState] DEFAULT ((0)) NOT NULL,
    [SourceMatchedConfidenceLevel]               TINYINT        CONSTRAINT [DF_AssignedResourceTypes_SourceMatchedConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [ResourceTypeIdentificationConfidenceLevel]  TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ResourceTypeIdentificationConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [StartDate]                                  SMALLDATETIME  CONSTRAINT [DF_AssignedResourceTypes_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]                                    SMALLDATETIME  CONSTRAINT [DF_AssignedResourceTypes_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [NeedsPolicyApplication]                     BIT            CONSTRAINT [DF_AssignedResourceTypes_NeedsPolicyApplication] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowBlockedState]           TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowBlockedCount]           SMALLINT       CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedCount] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowFoundState]             TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowFoundCount]             SMALLINT       CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundCount] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowReviewState]            TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowReviewCount]            SMALLINT       CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewCount] DEFAULT ((0)) NOT NULL,
    [ConsolidatedProvisioningState]              TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedAssignedResourceTypeCountError] SMALLINT       CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeCountError] DEFAULT ((0)) NOT NULL,
    [WhenCreated]                                SMALLDATETIME  CONSTRAINT [DF_AssignedResourceTypes_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WhenPerformed]                              SMALLDATETIME  NULL,
    [Performer_Id]                               BIGINT         NULL,
    [WorkflowInstance_Id]                        BIGINT         NULL,
    [ManualProvisioningState]                    TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ManualProvisioningState] DEFAULT ((0)) NOT NULL,
    [HasPendingOrders]                           BIT            CONSTRAINT [DF_AssignedResourceTypes_HasPendingOrders] DEFAULT ((0)) NOT NULL,
    [Comment]                                    NVARCHAR (442) NULL,
    [ValidFrom]                                  DATETIME2 (2)  CONSTRAINT [DF_AssignedResourceTypes_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                    DATETIME2 (2)  CONSTRAINT [DF_AssignedResourceTypes_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedResourceTypes1] PRIMARY KEY NONCLUSTERED ([ValidTo] DESC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_CK_AssignedResourceTypes1] UNIQUE CLUSTERED ([Owner_Id] ASC, [ValidTo] DESC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedResourceTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedResourceTypes] ([Owner_Id], [Id], [ResourceType_Id], [Resource_Id], [ParametersContext_Id], [IsDenied], [IsInduced], [WorkflowState], [ProvisioningState], [SourceMatchedConfidenceLevel], [ResourceTypeIdentificationConfidenceLevel], [StartDate], [EndDate], [NeedsPolicyApplication], [ConsolidatedWorkflowBlockedState], [ConsolidatedWorkflowBlockedCount], [ConsolidatedWorkflowFoundState], [ConsolidatedWorkflowFoundCount], [ConsolidatedWorkflowReviewState], [ConsolidatedWorkflowReviewCount], [ConsolidatedProvisioningState], [ConsolidatedAssignedResourceTypeCountError], [WhenCreated], [WhenPerformed], [Performer_Id], [WorkflowInstance_Id], [ManualProvisioningState], [HasPendingOrders])
        SELECT   [Owner_Id],
                 [Id],
                 [ResourceType_Id],
                 [Resource_Id],
                 [ParametersContext_Id],
                 [IsDenied],
                 [IsInduced],
                 [WorkflowState],
                 [ProvisioningState],
                 [SourceMatchedConfidenceLevel],
                 [ResourceTypeIdentificationConfidenceLevel],
                 [StartDate],
                 [EndDate],
                 [NeedsPolicyApplication],
                 [ConsolidatedWorkflowBlockedState],
                 [ConsolidatedWorkflowBlockedCount],
                 [ConsolidatedWorkflowFoundState],
                 [ConsolidatedWorkflowFoundCount],
                 [ConsolidatedWorkflowReviewState],
                 [ConsolidatedWorkflowReviewCount],
                 [ConsolidatedProvisioningState],
                 [ConsolidatedAssignedResourceTypeCountError],
                 [WhenCreated],
                 [WhenPerformed],
                 [Performer_Id],
                 [WorkflowInstance_Id],
                 [ManualProvisioningState],
                 [HasPendingOrders]
        FROM     [dbo].[UP_AssignedResourceTypes]
        ORDER BY [Owner_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedResourceTypes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedResourceTypes]', N'UP_AssignedResourceTypes';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedResourceTypes1]', N'PK_AssignedResourceTypes', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_CK_AssignedResourceTypes1]', N'CK_AssignedResourceTypes', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_Resource]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_Resource]
    ON [dbo].[UP_AssignedResourceTypes]([Resource_Id] ASC);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_NeedsPolicyApplication]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_NeedsPolicyApplication]
    ON [dbo].[UP_AssignedResourceTypes]([NeedsPolicyApplication] ASC) WHERE "NeedsPolicyApplication"=1;


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_HasPendingOrders]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_HasPendingOrders]
    ON [dbo].[UP_AssignedResourceTypes]([HasPendingOrders] ASC) WHERE "HasPendingOrders"=1 AND "ValidTo"=CONVERT("datetime2"(2),'9999-12-31 23:59:59.9999999');


GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedSingleRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedSingleRoles] (
    [Id]                   BIGINT         NOT NULL,
    [Role_Id]              BIGINT         NOT NULL,
    [Owner_Id]             BIGINT         NOT NULL,
    [ParametersContext_Id] BIGINT         NOT NULL,
    [IsDenied]             BIT            CONSTRAINT [DF_AssignedSingleRoles_IsDenied] DEFAULT ((0)) NOT NULL,
    [IsInduced]            BIT            CONSTRAINT [DF_AssignedSingleRoles_IsInduced] DEFAULT ((0)) NOT NULL,
    [WorkflowState]        TINYINT        CONSTRAINT [DF_AssignedSingleRoles_WorkflowState] DEFAULT ((0)) NOT NULL,
    [StartDate]            SMALLDATETIME  CONSTRAINT [DF_AssignedSingleRoles_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]              SMALLDATETIME  CONSTRAINT [DF_AssignedSingleRoles_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [WhenCreated]          SMALLDATETIME  CONSTRAINT [DF_AssignedSingleRoles_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WhenPerformed]        SMALLDATETIME  NULL,
    [Performer_Id]         BIGINT         NULL,
    [WorkflowInstance_Id]  BIGINT         NULL,
    [Comment]              NVARCHAR (442) NULL,
    [ValidFrom]            DATETIME2 (2)  CONSTRAINT "DF_AssignedSingleRoles_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]              DATETIME2 (2)  CONSTRAINT "DF_AssignedSingleRoles_ValidTo" DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedSingleRoles1] PRIMARY KEY CLUSTERED ([Owner_Id] ASC, [ValidTo] DESC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_UK_AssignedSingleRoles1] UNIQUE NONCLUSTERED ([Id] ASC, [ValidTo] DESC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedSingleRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedSingleRoles] ([Owner_Id], [Role_Id], [ParametersContext_Id], [StartDate], [Id], [IsDenied], [IsInduced], [WorkflowState], [EndDate], [WhenCreated], [WhenPerformed], [Performer_Id], [WorkflowInstance_Id])
        SELECT   [Owner_Id],
                 [Role_Id],
                 [ParametersContext_Id],
                 [StartDate],
                 [Id],
                 [IsDenied],
                 [IsInduced],
                 [WorkflowState],
                 [EndDate],
                 [WhenCreated],
                 [WhenPerformed],
                 [Performer_Id],
                 [WorkflowInstance_Id]
        FROM     [dbo].[UP_AssignedSingleRoles]
        ORDER BY [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedSingleRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedSingleRoles]', N'UP_AssignedSingleRoles';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedSingleRoles1]', N'PK_AssignedSingleRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_UK_AssignedSingleRoles1]', N'UK_AssignedSingleRoles', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_Categories]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_Categories] (
    [Id]                   BIGINT           NOT NULL,
    [Policy_Id]            BIGINT           NOT NULL,
    [Parent_Id]            BIGINT           NULL,
    [CurrentNodeIndex]     UNIQUEIDENTIFIER CONSTRAINT [DF_Categories_CurrentNodeIndex] DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    [NextNodeIndex]        UNIQUEIDENTIFIER CONSTRAINT [DF_Categories_NextNodeIndex] DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    [Identifier]           VARCHAR (442)    COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]       NVARCHAR (442)   NOT NULL,
    [DisplayName_L2]       NVARCHAR (442)   NULL,
    [DisplayName_L3]       NVARCHAR (442)   NULL,
    [DisplayName_L4]       NVARCHAR (442)   NULL,
    [DisplayName_L5]       NVARCHAR (442)   NULL,
    [DisplayName_L6]       NVARCHAR (442)   NULL,
    [DisplayName_L7]       NVARCHAR (442)   NULL,
    [DisplayName_L8]       NVARCHAR (442)   NULL,
    [Description_L1]       NVARCHAR (1024)  NULL,
    [Description_L2]       NVARCHAR (1024)  NULL,
    [Description_L3]       NVARCHAR (1024)  NULL,
    [Description_L4]       NVARCHAR (1024)  NULL,
    [Description_L5]       NVARCHAR (1024)  NULL,
    [Description_L6]       NVARCHAR (1024)  NULL,
    [Description_L7]       NVARCHAR (1024)  NULL,
    [Description_L8]       NVARCHAR (1024)  NULL,
    [IsCollapsed]          BIT              CONSTRAINT [DF_Categories_IsCollapsed] DEFAULT ((0)) NOT NULL,
    [SingleRoleCounter]    INT              CONSTRAINT [DF_Categories_SingleRoleCounter] DEFAULT ((0)) NOT NULL,
    [CompositeRoleCounter] INT              CONSTRAINT [DF_Categories_CompositeRoleCounter] DEFAULT ((0)) NOT NULL,
    [ResourceTypeCounter]  INT              CONSTRAINT [DF_Categories_ResourceTypeCounter] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Categories1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Categories_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_Categories])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_Categories] ([Id], [Policy_Id], [Parent_Id], [CurrentNodeIndex], [NextNodeIndex], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [Description_L1], [SingleRoleCounter], [CompositeRoleCounter], [ResourceTypeCounter])
        SELECT   [Id],
                 [Policy_Id],
                 [Parent_Id],
                 [CurrentNodeIndex],
                 [NextNodeIndex],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [Description_L1],
                 [SingleRoleCounter],
                 [CompositeRoleCounter],
                 [ResourceTypeCounter]
        FROM     [dbo].[UP_Categories]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_Categories];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_Categories]', N'UP_Categories';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Categories1]', N'PK_Categories', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Categories_Identifier1]', N'U_Categories_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_CompositeRoleRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_CompositeRoleRules] (
    [Id]        BIGINT NOT NULL,
    [Policy_Id] BIGINT NOT NULL,
    [Type]      INT    CONSTRAINT [DF_CompositeRoleRules_Type] DEFAULT ((0)) NOT NULL,
    [Role_Id]   BIGINT NOT NULL,
    [IsDenied]  BIT    CONSTRAINT [DF_CompositeRoleRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [L0]        BIT    CONSTRAINT [DF_CompositeRoleRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]        BIT    CONSTRAINT [DF_CompositeRoleRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]        BIT    CONSTRAINT [DF_CompositeRoleRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]        BIT    CONSTRAINT [DF_CompositeRoleRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]        BIT    CONSTRAINT [DF_CompositeRoleRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]        BIT    CONSTRAINT [DF_CompositeRoleRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]        BIT    CONSTRAINT [DF_CompositeRoleRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]        BIT    CONSTRAINT [DF_CompositeRoleRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]        BIT    CONSTRAINT [DF_CompositeRoleRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]        BIT    CONSTRAINT [DF_CompositeRoleRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]        BIT    CONSTRAINT [DF_CompositeRoleRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]        BIT    CONSTRAINT [DF_CompositeRoleRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]        BIT    CONSTRAINT [DF_CompositeRoleRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]        BIT    CONSTRAINT [DF_CompositeRoleRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]        BIT    CONSTRAINT [DF_CompositeRoleRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]        BIT    CONSTRAINT [DF_CompositeRoleRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]        BIT    CONSTRAINT [DF_CompositeRoleRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]        BIT    CONSTRAINT [DF_CompositeRoleRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]        BIT    CONSTRAINT [DF_CompositeRoleRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]        BIT    CONSTRAINT [DF_CompositeRoleRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]        BIT    CONSTRAINT [DF_CompositeRoleRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]        BIT    CONSTRAINT [DF_CompositeRoleRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]        BIT    CONSTRAINT [DF_CompositeRoleRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]        BIT    CONSTRAINT [DF_CompositeRoleRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]        BIT    CONSTRAINT [DF_CompositeRoleRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]        BIT    CONSTRAINT [DF_CompositeRoleRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]        BIT    CONSTRAINT [DF_CompositeRoleRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]        BIT    CONSTRAINT [DF_CompositeRoleRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]        BIT    CONSTRAINT [DF_CompositeRoleRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]        BIT    CONSTRAINT [DF_CompositeRoleRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]        BIT    CONSTRAINT [DF_CompositeRoleRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]        BIT    CONSTRAINT [DF_CompositeRoleRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]       BIT    CONSTRAINT [DF_CompositeRoleRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]       BIT    CONSTRAINT [DF_CompositeRoleRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]       BIT    CONSTRAINT [DF_CompositeRoleRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]       BIT    CONSTRAINT [DF_CompositeRoleRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]       BIT    CONSTRAINT [DF_CompositeRoleRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]       BIT    CONSTRAINT [DF_CompositeRoleRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]       BIT    CONSTRAINT [DF_CompositeRoleRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]       BIT    CONSTRAINT [DF_CompositeRoleRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]       BIT    CONSTRAINT [DF_CompositeRoleRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]       BIT    CONSTRAINT [DF_CompositeRoleRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]       BIT    CONSTRAINT [DF_CompositeRoleRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]       BIT    CONSTRAINT [DF_CompositeRoleRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]       BIT    CONSTRAINT [DF_CompositeRoleRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]       BIT    CONSTRAINT [DF_CompositeRoleRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]       BIT    CONSTRAINT [DF_CompositeRoleRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]       BIT    CONSTRAINT [DF_CompositeRoleRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]       BIT    CONSTRAINT [DF_CompositeRoleRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]       BIT    CONSTRAINT [DF_CompositeRoleRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]       BIT    CONSTRAINT [DF_CompositeRoleRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]       BIT    CONSTRAINT [DF_CompositeRoleRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]       BIT    CONSTRAINT [DF_CompositeRoleRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]       BIT    CONSTRAINT [DF_CompositeRoleRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]       BIT    CONSTRAINT [DF_CompositeRoleRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]       BIT    CONSTRAINT [DF_CompositeRoleRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]       BIT    CONSTRAINT [DF_CompositeRoleRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]       BIT    CONSTRAINT [DF_CompositeRoleRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]       BIT    CONSTRAINT [DF_CompositeRoleRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]       BIT    CONSTRAINT [DF_CompositeRoleRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]       BIT    CONSTRAINT [DF_CompositeRoleRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]       BIT    CONSTRAINT [DF_CompositeRoleRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]       BIT    CONSTRAINT [DF_CompositeRoleRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]       BIT    CONSTRAINT [DF_CompositeRoleRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]       BIT    CONSTRAINT [DF_CompositeRoleRules_L3V] DEFAULT ((0)) NOT NULL,
    [D0_Id]     BIGINT NULL,
    [D1_Id]     BIGINT NULL,
    [D2_Id]     BIGINT NULL,
    [D3_Id]     BIGINT NULL,
    [D4_Id]     BIGINT NULL,
    [D5_Id]     BIGINT NULL,
    [D6_Id]     BIGINT NULL,
    [D7_Id]     BIGINT NULL,
    [D8_Id]     BIGINT NULL,
    [D9_Id]     BIGINT NULL,
    [DA_Id]     BIGINT NULL,
    [DB_Id]     BIGINT NULL,
    [DC_Id]     BIGINT NULL,
    [DD_Id]     BIGINT NULL,
    [DE_Id]     BIGINT NULL,
    [DF_Id]     BIGINT NULL,
    [DG_Id]     BIGINT NULL,
    [DH_Id]     BIGINT NULL,
    [DI_Id]     BIGINT NULL,
    [DJ_Id]     BIGINT NULL,
    [DK_Id]     BIGINT NULL,
    [DL_Id]     BIGINT NULL,
    [DM_Id]     BIGINT NULL,
    [DN_Id]     BIGINT NULL,
    [DO_Id]     BIGINT NULL,
    [DP_Id]     BIGINT NULL,
    [DQ_Id]     BIGINT NULL,
    [DR_Id]     BIGINT NULL,
    [DS_Id]     BIGINT NULL,
    [DT_Id]     BIGINT NULL,
    [DU_Id]     BIGINT NULL,
    [DV_Id]     BIGINT NULL,
    [D10_Id]    BIGINT NULL,
    [D11_Id]    BIGINT NULL,
    [D12_Id]    BIGINT NULL,
    [D13_Id]    BIGINT NULL,
    [D14_Id]    BIGINT NULL,
    [D15_Id]    BIGINT NULL,
    [D16_Id]    BIGINT NULL,
    [D17_Id]    BIGINT NULL,
    [D18_Id]    BIGINT NULL,
    [D19_Id]    BIGINT NULL,
    [D1A_Id]    BIGINT NULL,
    [D1B_Id]    BIGINT NULL,
    [D1C_Id]    BIGINT NULL,
    [D1D_Id]    BIGINT NULL,
    [D1E_Id]    BIGINT NULL,
    [D1F_Id]    BIGINT NULL,
    [D1G_Id]    BIGINT NULL,
    [D1H_Id]    BIGINT NULL,
    [D1I_Id]    BIGINT NULL,
    [D1J_Id]    BIGINT NULL,
    [D1K_Id]    BIGINT NULL,
    [D1L_Id]    BIGINT NULL,
    [D1M_Id]    BIGINT NULL,
    [D1N_Id]    BIGINT NULL,
    [D1O_Id]    BIGINT NULL,
    [D1P_Id]    BIGINT NULL,
    [D1Q_Id]    BIGINT NULL,
    [D1R_Id]    BIGINT NULL,
    [D1S_Id]    BIGINT NULL,
    [D1T_Id]    BIGINT NULL,
    [D1U_Id]    BIGINT NULL,
    [D1V_Id]    BIGINT NULL,
    [D20_Id]    BIGINT NULL,
    [D21_Id]    BIGINT NULL,
    [D22_Id]    BIGINT NULL,
    [D23_Id]    BIGINT NULL,
    [D24_Id]    BIGINT NULL,
    [D25_Id]    BIGINT NULL,
    [D26_Id]    BIGINT NULL,
    [D27_Id]    BIGINT NULL,
    [D28_Id]    BIGINT NULL,
    [D29_Id]    BIGINT NULL,
    [D2A_Id]    BIGINT NULL,
    [D2B_Id]    BIGINT NULL,
    [D2C_Id]    BIGINT NULL,
    [D2D_Id]    BIGINT NULL,
    [D2E_Id]    BIGINT NULL,
    [D2F_Id]    BIGINT NULL,
    [D2G_Id]    BIGINT NULL,
    [D2H_Id]    BIGINT NULL,
    [D2I_Id]    BIGINT NULL,
    [D2J_Id]    BIGINT NULL,
    [D2K_Id]    BIGINT NULL,
    [D2L_Id]    BIGINT NULL,
    [D2M_Id]    BIGINT NULL,
    [D2N_Id]    BIGINT NULL,
    [D2O_Id]    BIGINT NULL,
    [D2P_Id]    BIGINT NULL,
    [D2Q_Id]    BIGINT NULL,
    [D2R_Id]    BIGINT NULL,
    [D2S_Id]    BIGINT NULL,
    [D2T_Id]    BIGINT NULL,
    [D2U_Id]    BIGINT NULL,
    [D2V_Id]    BIGINT NULL,
    [D30_Id]    BIGINT NULL,
    [D31_Id]    BIGINT NULL,
    [D32_Id]    BIGINT NULL,
    [D33_Id]    BIGINT NULL,
    [D34_Id]    BIGINT NULL,
    [D35_Id]    BIGINT NULL,
    [D36_Id]    BIGINT NULL,
    [D37_Id]    BIGINT NULL,
    [D38_Id]    BIGINT NULL,
    [D39_Id]    BIGINT NULL,
    [D3A_Id]    BIGINT NULL,
    [D3B_Id]    BIGINT NULL,
    [D3C_Id]    BIGINT NULL,
    [D3D_Id]    BIGINT NULL,
    [D3E_Id]    BIGINT NULL,
    [D3F_Id]    BIGINT NULL,
    [D3G_Id]    BIGINT NULL,
    [D3H_Id]    BIGINT NULL,
    [D3I_Id]    BIGINT NULL,
    [D3J_Id]    BIGINT NULL,
    [D3K_Id]    BIGINT NULL,
    [D3L_Id]    BIGINT NULL,
    [D3M_Id]    BIGINT NULL,
    [D3N_Id]    BIGINT NULL,
    [D3O_Id]    BIGINT NULL,
    [D3P_Id]    BIGINT NULL,
    [D3Q_Id]    BIGINT NULL,
    [D3R_Id]    BIGINT NULL,
    [D3S_Id]    BIGINT NULL,
    [D3T_Id]    BIGINT NULL,
    [D3U_Id]    BIGINT NULL,
    [D3V_Id]    BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_CompositeRoleRules1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_CompositeRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_CompositeRoleRules] ([Id], [Policy_Id], [Type], [Role_Id], [IsDenied], [D0_Id], [L0], [D1_Id], [L1], [D2_Id], [L2], [D3_Id], [L3], [D4_Id], [L4], [D5_Id], [L5], [D6_Id], [L6], [D7_Id], [L7])
        SELECT   [Id],
                 [Policy_Id],
                 [Type],
                 [Role_Id],
                 [IsDenied],
                 [D0_Id],
                 [L0],
                 [D1_Id],
                 [L1],
                 [D2_Id],
                 [L2],
                 [D3_Id],
                 [L3],
                 [D4_Id],
                 [L4],
                 [D5_Id],
                 [L5],
                 [D6_Id],
                 [L6],
                 [D7_Id],
                 [L7]
        FROM     [dbo].[UP_CompositeRoleRules]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_CompositeRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_CompositeRoleRules]', N'UP_CompositeRoleRules';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_CompositeRoleRules1]', N'PK_CompositeRoleRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column [dbo].[UP_CompositeRoles].[GroupByDimension0] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[GroupByDimension1] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[GroupByDimension2] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[GroupByDimension3] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[GroupByDimension4] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[GroupByDimension5] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[GroupByDimension6] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[GroupByDimension7] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension0] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension1] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension2] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension3] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension4] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension5] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension6] is being dropped, data loss could occur.

The column [dbo].[UP_CompositeRoles].[UseDimension7] is being dropped, data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_CompositeRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_CompositeRoles] (
    [Id]                   BIGINT          NOT NULL,
    [Policy_Id]            BIGINT          NOT NULL,
    [EntityType_Id]        BIGINT          NOT NULL,
    [Category_Id]          BIGINT          NULL,
    [ValidFrom]            DATETIME2 (2)   CONSTRAINT [DF_CompositeRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]              DATETIME2 (2)   CONSTRAINT [DF_CompositeRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [P0]                   BIT             CONSTRAINT [DF_CompositeRoles_P0] DEFAULT ((0)) NOT NULL,
    [P1]                   BIT             CONSTRAINT [DF_CompositeRoles_P1] DEFAULT ((0)) NOT NULL,
    [P2]                   BIT             CONSTRAINT [DF_CompositeRoles_P2] DEFAULT ((0)) NOT NULL,
    [P3]                   BIT             CONSTRAINT [DF_CompositeRoles_P3] DEFAULT ((0)) NOT NULL,
    [P4]                   BIT             CONSTRAINT [DF_CompositeRoles_P4] DEFAULT ((0)) NOT NULL,
    [P5]                   BIT             CONSTRAINT [DF_CompositeRoles_P5] DEFAULT ((0)) NOT NULL,
    [P6]                   BIT             CONSTRAINT [DF_CompositeRoles_P6] DEFAULT ((0)) NOT NULL,
    [P7]                   BIT             CONSTRAINT [DF_CompositeRoles_P7] DEFAULT ((0)) NOT NULL,
    [P8]                   BIT             CONSTRAINT [DF_CompositeRoles_P8] DEFAULT ((0)) NOT NULL,
    [P9]                   BIT             CONSTRAINT [DF_CompositeRoles_P9] DEFAULT ((0)) NOT NULL,
    [PA]                   BIT             CONSTRAINT [DF_CompositeRoles_PA] DEFAULT ((0)) NOT NULL,
    [PB]                   BIT             CONSTRAINT [DF_CompositeRoles_PB] DEFAULT ((0)) NOT NULL,
    [PC]                   BIT             CONSTRAINT [DF_CompositeRoles_PC] DEFAULT ((0)) NOT NULL,
    [PD]                   BIT             CONSTRAINT [DF_CompositeRoles_PD] DEFAULT ((0)) NOT NULL,
    [PE]                   BIT             CONSTRAINT [DF_CompositeRoles_PE] DEFAULT ((0)) NOT NULL,
    [PF]                   BIT             CONSTRAINT [DF_CompositeRoles_PF] DEFAULT ((0)) NOT NULL,
    [PG]                   BIT             CONSTRAINT [DF_CompositeRoles_PG] DEFAULT ((0)) NOT NULL,
    [PH]                   BIT             CONSTRAINT [DF_CompositeRoles_PH] DEFAULT ((0)) NOT NULL,
    [PI]                   BIT             CONSTRAINT [DF_CompositeRoles_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                   BIT             CONSTRAINT [DF_CompositeRoles_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                   BIT             CONSTRAINT [DF_CompositeRoles_PK] DEFAULT ((0)) NOT NULL,
    [PL]                   BIT             CONSTRAINT [DF_CompositeRoles_PL] DEFAULT ((0)) NOT NULL,
    [PM]                   BIT             CONSTRAINT [DF_CompositeRoles_PM] DEFAULT ((0)) NOT NULL,
    [PN]                   BIT             CONSTRAINT [DF_CompositeRoles_PN] DEFAULT ((0)) NOT NULL,
    [PO]                   BIT             CONSTRAINT [DF_CompositeRoles_PO] DEFAULT ((0)) NOT NULL,
    [PP]                   BIT             CONSTRAINT [DF_CompositeRoles_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                   BIT             CONSTRAINT [DF_CompositeRoles_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                   BIT             CONSTRAINT [DF_CompositeRoles_PR] DEFAULT ((0)) NOT NULL,
    [PS]                   BIT             CONSTRAINT [DF_CompositeRoles_PS] DEFAULT ((0)) NOT NULL,
    [PT]                   BIT             CONSTRAINT [DF_CompositeRoles_PT] DEFAULT ((0)) NOT NULL,
    [PU]                   BIT             CONSTRAINT [DF_CompositeRoles_PU] DEFAULT ((0)) NOT NULL,
    [PV]                   BIT             CONSTRAINT [DF_CompositeRoles_PV] DEFAULT ((0)) NOT NULL,
    [P10]                  BIT             CONSTRAINT [DF_CompositeRoles_P10] DEFAULT ((0)) NOT NULL,
    [P11]                  BIT             CONSTRAINT [DF_CompositeRoles_P11] DEFAULT ((0)) NOT NULL,
    [P12]                  BIT             CONSTRAINT [DF_CompositeRoles_P12] DEFAULT ((0)) NOT NULL,
    [P13]                  BIT             CONSTRAINT [DF_CompositeRoles_P13] DEFAULT ((0)) NOT NULL,
    [P14]                  BIT             CONSTRAINT [DF_CompositeRoles_P14] DEFAULT ((0)) NOT NULL,
    [P15]                  BIT             CONSTRAINT [DF_CompositeRoles_P15] DEFAULT ((0)) NOT NULL,
    [P16]                  BIT             CONSTRAINT [DF_CompositeRoles_P16] DEFAULT ((0)) NOT NULL,
    [P17]                  BIT             CONSTRAINT [DF_CompositeRoles_P17] DEFAULT ((0)) NOT NULL,
    [P18]                  BIT             CONSTRAINT [DF_CompositeRoles_P18] DEFAULT ((0)) NOT NULL,
    [P19]                  BIT             CONSTRAINT [DF_CompositeRoles_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                  BIT             CONSTRAINT [DF_CompositeRoles_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                  BIT             CONSTRAINT [DF_CompositeRoles_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                  BIT             CONSTRAINT [DF_CompositeRoles_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                  BIT             CONSTRAINT [DF_CompositeRoles_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                  BIT             CONSTRAINT [DF_CompositeRoles_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                  BIT             CONSTRAINT [DF_CompositeRoles_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                  BIT             CONSTRAINT [DF_CompositeRoles_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                  BIT             CONSTRAINT [DF_CompositeRoles_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                  BIT             CONSTRAINT [DF_CompositeRoles_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                  BIT             CONSTRAINT [DF_CompositeRoles_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                  BIT             CONSTRAINT [DF_CompositeRoles_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                  BIT             CONSTRAINT [DF_CompositeRoles_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                  BIT             CONSTRAINT [DF_CompositeRoles_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                  BIT             CONSTRAINT [DF_CompositeRoles_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                  BIT             CONSTRAINT [DF_CompositeRoles_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                  BIT             CONSTRAINT [DF_CompositeRoles_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                  BIT             CONSTRAINT [DF_CompositeRoles_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                  BIT             CONSTRAINT [DF_CompositeRoles_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                  BIT             CONSTRAINT [DF_CompositeRoles_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                  BIT             CONSTRAINT [DF_CompositeRoles_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                  BIT             CONSTRAINT [DF_CompositeRoles_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                  BIT             CONSTRAINT [DF_CompositeRoles_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                  BIT             CONSTRAINT [DF_CompositeRoles_P20] DEFAULT ((0)) NOT NULL,
    [P21]                  BIT             CONSTRAINT [DF_CompositeRoles_P21] DEFAULT ((0)) NOT NULL,
    [P22]                  BIT             CONSTRAINT [DF_CompositeRoles_P22] DEFAULT ((0)) NOT NULL,
    [P23]                  BIT             CONSTRAINT [DF_CompositeRoles_P23] DEFAULT ((0)) NOT NULL,
    [P24]                  BIT             CONSTRAINT [DF_CompositeRoles_P24] DEFAULT ((0)) NOT NULL,
    [P25]                  BIT             CONSTRAINT [DF_CompositeRoles_P25] DEFAULT ((0)) NOT NULL,
    [P26]                  BIT             CONSTRAINT [DF_CompositeRoles_P26] DEFAULT ((0)) NOT NULL,
    [P27]                  BIT             CONSTRAINT [DF_CompositeRoles_P27] DEFAULT ((0)) NOT NULL,
    [P28]                  BIT             CONSTRAINT [DF_CompositeRoles_P28] DEFAULT ((0)) NOT NULL,
    [P29]                  BIT             CONSTRAINT [DF_CompositeRoles_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                  BIT             CONSTRAINT [DF_CompositeRoles_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                  BIT             CONSTRAINT [DF_CompositeRoles_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                  BIT             CONSTRAINT [DF_CompositeRoles_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                  BIT             CONSTRAINT [DF_CompositeRoles_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                  BIT             CONSTRAINT [DF_CompositeRoles_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                  BIT             CONSTRAINT [DF_CompositeRoles_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                  BIT             CONSTRAINT [DF_CompositeRoles_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                  BIT             CONSTRAINT [DF_CompositeRoles_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                  BIT             CONSTRAINT [DF_CompositeRoles_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                  BIT             CONSTRAINT [DF_CompositeRoles_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                  BIT             CONSTRAINT [DF_CompositeRoles_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                  BIT             CONSTRAINT [DF_CompositeRoles_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                  BIT             CONSTRAINT [DF_CompositeRoles_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                  BIT             CONSTRAINT [DF_CompositeRoles_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                  BIT             CONSTRAINT [DF_CompositeRoles_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                  BIT             CONSTRAINT [DF_CompositeRoles_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                  BIT             CONSTRAINT [DF_CompositeRoles_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                  BIT             CONSTRAINT [DF_CompositeRoles_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                  BIT             CONSTRAINT [DF_CompositeRoles_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                  BIT             CONSTRAINT [DF_CompositeRoles_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                  BIT             CONSTRAINT [DF_CompositeRoles_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                  BIT             CONSTRAINT [DF_CompositeRoles_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                  BIT             CONSTRAINT [DF_CompositeRoles_P30] DEFAULT ((0)) NOT NULL,
    [P31]                  BIT             CONSTRAINT [DF_CompositeRoles_P31] DEFAULT ((0)) NOT NULL,
    [P32]                  BIT             CONSTRAINT [DF_CompositeRoles_P32] DEFAULT ((0)) NOT NULL,
    [P33]                  BIT             CONSTRAINT [DF_CompositeRoles_P33] DEFAULT ((0)) NOT NULL,
    [P34]                  BIT             CONSTRAINT [DF_CompositeRoles_P34] DEFAULT ((0)) NOT NULL,
    [P35]                  BIT             CONSTRAINT [DF_CompositeRoles_P35] DEFAULT ((0)) NOT NULL,
    [P36]                  BIT             CONSTRAINT [DF_CompositeRoles_P36] DEFAULT ((0)) NOT NULL,
    [P37]                  BIT             CONSTRAINT [DF_CompositeRoles_P37] DEFAULT ((0)) NOT NULL,
    [P38]                  BIT             CONSTRAINT [DF_CompositeRoles_P38] DEFAULT ((0)) NOT NULL,
    [P39]                  BIT             CONSTRAINT [DF_CompositeRoles_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                  BIT             CONSTRAINT [DF_CompositeRoles_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                  BIT             CONSTRAINT [DF_CompositeRoles_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                  BIT             CONSTRAINT [DF_CompositeRoles_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                  BIT             CONSTRAINT [DF_CompositeRoles_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                  BIT             CONSTRAINT [DF_CompositeRoles_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                  BIT             CONSTRAINT [DF_CompositeRoles_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                  BIT             CONSTRAINT [DF_CompositeRoles_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                  BIT             CONSTRAINT [DF_CompositeRoles_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                  BIT             CONSTRAINT [DF_CompositeRoles_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                  BIT             CONSTRAINT [DF_CompositeRoles_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                  BIT             CONSTRAINT [DF_CompositeRoles_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                  BIT             CONSTRAINT [DF_CompositeRoles_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                  BIT             CONSTRAINT [DF_CompositeRoles_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                  BIT             CONSTRAINT [DF_CompositeRoles_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                  BIT             CONSTRAINT [DF_CompositeRoles_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                  BIT             CONSTRAINT [DF_CompositeRoles_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                  BIT             CONSTRAINT [DF_CompositeRoles_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                  BIT             CONSTRAINT [DF_CompositeRoles_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                  BIT             CONSTRAINT [DF_CompositeRoles_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                  BIT             CONSTRAINT [DF_CompositeRoles_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                  BIT             CONSTRAINT [DF_CompositeRoles_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                  BIT             CONSTRAINT [DF_CompositeRoles_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                   BIT             CONSTRAINT [DF_CompositeRoles_R0] DEFAULT ((0)) NOT NULL,
    [R1]                   BIT             CONSTRAINT [DF_CompositeRoles_R1] DEFAULT ((0)) NOT NULL,
    [R2]                   BIT             CONSTRAINT [DF_CompositeRoles_R2] DEFAULT ((0)) NOT NULL,
    [R3]                   BIT             CONSTRAINT [DF_CompositeRoles_R3] DEFAULT ((0)) NOT NULL,
    [R4]                   BIT             CONSTRAINT [DF_CompositeRoles_R4] DEFAULT ((0)) NOT NULL,
    [R5]                   BIT             CONSTRAINT [DF_CompositeRoles_R5] DEFAULT ((0)) NOT NULL,
    [R6]                   BIT             CONSTRAINT [DF_CompositeRoles_R6] DEFAULT ((0)) NOT NULL,
    [R7]                   BIT             CONSTRAINT [DF_CompositeRoles_R7] DEFAULT ((0)) NOT NULL,
    [R8]                   BIT             CONSTRAINT [DF_CompositeRoles_R8] DEFAULT ((0)) NOT NULL,
    [R9]                   BIT             CONSTRAINT [DF_CompositeRoles_R9] DEFAULT ((0)) NOT NULL,
    [RA]                   BIT             CONSTRAINT [DF_CompositeRoles_RA] DEFAULT ((0)) NOT NULL,
    [RB]                   BIT             CONSTRAINT [DF_CompositeRoles_RB] DEFAULT ((0)) NOT NULL,
    [RC]                   BIT             CONSTRAINT [DF_CompositeRoles_RC] DEFAULT ((0)) NOT NULL,
    [RD]                   BIT             CONSTRAINT [DF_CompositeRoles_RD] DEFAULT ((0)) NOT NULL,
    [RE]                   BIT             CONSTRAINT [DF_CompositeRoles_RE] DEFAULT ((0)) NOT NULL,
    [RF]                   BIT             CONSTRAINT [DF_CompositeRoles_RF] DEFAULT ((0)) NOT NULL,
    [RG]                   BIT             CONSTRAINT [DF_CompositeRoles_RG] DEFAULT ((0)) NOT NULL,
    [RH]                   BIT             CONSTRAINT [DF_CompositeRoles_RH] DEFAULT ((0)) NOT NULL,
    [RI]                   BIT             CONSTRAINT [DF_CompositeRoles_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                   BIT             CONSTRAINT [DF_CompositeRoles_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                   BIT             CONSTRAINT [DF_CompositeRoles_RK] DEFAULT ((0)) NOT NULL,
    [RL]                   BIT             CONSTRAINT [DF_CompositeRoles_RL] DEFAULT ((0)) NOT NULL,
    [RM]                   BIT             CONSTRAINT [DF_CompositeRoles_RM] DEFAULT ((0)) NOT NULL,
    [RN]                   BIT             CONSTRAINT [DF_CompositeRoles_RN] DEFAULT ((0)) NOT NULL,
    [RO]                   BIT             CONSTRAINT [DF_CompositeRoles_RO] DEFAULT ((0)) NOT NULL,
    [RP]                   BIT             CONSTRAINT [DF_CompositeRoles_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                   BIT             CONSTRAINT [DF_CompositeRoles_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                   BIT             CONSTRAINT [DF_CompositeRoles_RR] DEFAULT ((0)) NOT NULL,
    [RS]                   BIT             CONSTRAINT [DF_CompositeRoles_RS] DEFAULT ((0)) NOT NULL,
    [RT]                   BIT             CONSTRAINT [DF_CompositeRoles_RT] DEFAULT ((0)) NOT NULL,
    [RU]                   BIT             CONSTRAINT [DF_CompositeRoles_RU] DEFAULT ((0)) NOT NULL,
    [RV]                   BIT             CONSTRAINT [DF_CompositeRoles_RV] DEFAULT ((0)) NOT NULL,
    [R10]                  BIT             CONSTRAINT [DF_CompositeRoles_R10] DEFAULT ((0)) NOT NULL,
    [R11]                  BIT             CONSTRAINT [DF_CompositeRoles_R11] DEFAULT ((0)) NOT NULL,
    [R12]                  BIT             CONSTRAINT [DF_CompositeRoles_R12] DEFAULT ((0)) NOT NULL,
    [R13]                  BIT             CONSTRAINT [DF_CompositeRoles_R13] DEFAULT ((0)) NOT NULL,
    [R14]                  BIT             CONSTRAINT [DF_CompositeRoles_R14] DEFAULT ((0)) NOT NULL,
    [R15]                  BIT             CONSTRAINT [DF_CompositeRoles_R15] DEFAULT ((0)) NOT NULL,
    [R16]                  BIT             CONSTRAINT [DF_CompositeRoles_R16] DEFAULT ((0)) NOT NULL,
    [R17]                  BIT             CONSTRAINT [DF_CompositeRoles_R17] DEFAULT ((0)) NOT NULL,
    [R18]                  BIT             CONSTRAINT [DF_CompositeRoles_R18] DEFAULT ((0)) NOT NULL,
    [R19]                  BIT             CONSTRAINT [DF_CompositeRoles_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                  BIT             CONSTRAINT [DF_CompositeRoles_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                  BIT             CONSTRAINT [DF_CompositeRoles_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                  BIT             CONSTRAINT [DF_CompositeRoles_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                  BIT             CONSTRAINT [DF_CompositeRoles_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                  BIT             CONSTRAINT [DF_CompositeRoles_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                  BIT             CONSTRAINT [DF_CompositeRoles_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                  BIT             CONSTRAINT [DF_CompositeRoles_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                  BIT             CONSTRAINT [DF_CompositeRoles_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                  BIT             CONSTRAINT [DF_CompositeRoles_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                  BIT             CONSTRAINT [DF_CompositeRoles_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                  BIT             CONSTRAINT [DF_CompositeRoles_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                  BIT             CONSTRAINT [DF_CompositeRoles_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                  BIT             CONSTRAINT [DF_CompositeRoles_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                  BIT             CONSTRAINT [DF_CompositeRoles_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                  BIT             CONSTRAINT [DF_CompositeRoles_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                  BIT             CONSTRAINT [DF_CompositeRoles_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                  BIT             CONSTRAINT [DF_CompositeRoles_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                  BIT             CONSTRAINT [DF_CompositeRoles_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                  BIT             CONSTRAINT [DF_CompositeRoles_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                  BIT             CONSTRAINT [DF_CompositeRoles_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                  BIT             CONSTRAINT [DF_CompositeRoles_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                  BIT             CONSTRAINT [DF_CompositeRoles_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                  BIT             CONSTRAINT [DF_CompositeRoles_R20] DEFAULT ((0)) NOT NULL,
    [R21]                  BIT             CONSTRAINT [DF_CompositeRoles_R21] DEFAULT ((0)) NOT NULL,
    [R22]                  BIT             CONSTRAINT [DF_CompositeRoles_R22] DEFAULT ((0)) NOT NULL,
    [R23]                  BIT             CONSTRAINT [DF_CompositeRoles_R23] DEFAULT ((0)) NOT NULL,
    [R24]                  BIT             CONSTRAINT [DF_CompositeRoles_R24] DEFAULT ((0)) NOT NULL,
    [R25]                  BIT             CONSTRAINT [DF_CompositeRoles_R25] DEFAULT ((0)) NOT NULL,
    [R26]                  BIT             CONSTRAINT [DF_CompositeRoles_R26] DEFAULT ((0)) NOT NULL,
    [R27]                  BIT             CONSTRAINT [DF_CompositeRoles_R27] DEFAULT ((0)) NOT NULL,
    [R28]                  BIT             CONSTRAINT [DF_CompositeRoles_R28] DEFAULT ((0)) NOT NULL,
    [R29]                  BIT             CONSTRAINT [DF_CompositeRoles_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                  BIT             CONSTRAINT [DF_CompositeRoles_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                  BIT             CONSTRAINT [DF_CompositeRoles_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                  BIT             CONSTRAINT [DF_CompositeRoles_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                  BIT             CONSTRAINT [DF_CompositeRoles_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                  BIT             CONSTRAINT [DF_CompositeRoles_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                  BIT             CONSTRAINT [DF_CompositeRoles_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                  BIT             CONSTRAINT [DF_CompositeRoles_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                  BIT             CONSTRAINT [DF_CompositeRoles_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                  BIT             CONSTRAINT [DF_CompositeRoles_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                  BIT             CONSTRAINT [DF_CompositeRoles_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                  BIT             CONSTRAINT [DF_CompositeRoles_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                  BIT             CONSTRAINT [DF_CompositeRoles_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                  BIT             CONSTRAINT [DF_CompositeRoles_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                  BIT             CONSTRAINT [DF_CompositeRoles_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                  BIT             CONSTRAINT [DF_CompositeRoles_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                  BIT             CONSTRAINT [DF_CompositeRoles_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                  BIT             CONSTRAINT [DF_CompositeRoles_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                  BIT             CONSTRAINT [DF_CompositeRoles_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                  BIT             CONSTRAINT [DF_CompositeRoles_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                  BIT             CONSTRAINT [DF_CompositeRoles_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                  BIT             CONSTRAINT [DF_CompositeRoles_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                  BIT             CONSTRAINT [DF_CompositeRoles_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                  BIT             CONSTRAINT [DF_CompositeRoles_R30] DEFAULT ((0)) NOT NULL,
    [R31]                  BIT             CONSTRAINT [DF_CompositeRoles_R31] DEFAULT ((0)) NOT NULL,
    [R32]                  BIT             CONSTRAINT [DF_CompositeRoles_R32] DEFAULT ((0)) NOT NULL,
    [R33]                  BIT             CONSTRAINT [DF_CompositeRoles_R33] DEFAULT ((0)) NOT NULL,
    [R34]                  BIT             CONSTRAINT [DF_CompositeRoles_R34] DEFAULT ((0)) NOT NULL,
    [R35]                  BIT             CONSTRAINT [DF_CompositeRoles_R35] DEFAULT ((0)) NOT NULL,
    [R36]                  BIT             CONSTRAINT [DF_CompositeRoles_R36] DEFAULT ((0)) NOT NULL,
    [R37]                  BIT             CONSTRAINT [DF_CompositeRoles_R37] DEFAULT ((0)) NOT NULL,
    [R38]                  BIT             CONSTRAINT [DF_CompositeRoles_R38] DEFAULT ((0)) NOT NULL,
    [R39]                  BIT             CONSTRAINT [DF_CompositeRoles_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                  BIT             CONSTRAINT [DF_CompositeRoles_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                  BIT             CONSTRAINT [DF_CompositeRoles_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                  BIT             CONSTRAINT [DF_CompositeRoles_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                  BIT             CONSTRAINT [DF_CompositeRoles_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                  BIT             CONSTRAINT [DF_CompositeRoles_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                  BIT             CONSTRAINT [DF_CompositeRoles_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                  BIT             CONSTRAINT [DF_CompositeRoles_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                  BIT             CONSTRAINT [DF_CompositeRoles_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                  BIT             CONSTRAINT [DF_CompositeRoles_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                  BIT             CONSTRAINT [DF_CompositeRoles_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                  BIT             CONSTRAINT [DF_CompositeRoles_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                  BIT             CONSTRAINT [DF_CompositeRoles_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                  BIT             CONSTRAINT [DF_CompositeRoles_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                  BIT             CONSTRAINT [DF_CompositeRoles_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                  BIT             CONSTRAINT [DF_CompositeRoles_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                  BIT             CONSTRAINT [DF_CompositeRoles_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                  BIT             CONSTRAINT [DF_CompositeRoles_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                  BIT             CONSTRAINT [DF_CompositeRoles_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                  BIT             CONSTRAINT [DF_CompositeRoles_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                  BIT             CONSTRAINT [DF_CompositeRoles_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                  BIT             CONSTRAINT [DF_CompositeRoles_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                  BIT             CONSTRAINT [DF_CompositeRoles_R3V] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType] INT             CONSTRAINT [DF_CompositeRoles_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [Identifier]           VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]       NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]       NVARCHAR (442)  NULL,
    [DisplayName_L3]       NVARCHAR (442)  NULL,
    [DisplayName_L4]       NVARCHAR (442)  NULL,
    [DisplayName_L5]       NVARCHAR (442)  NULL,
    [DisplayName_L6]       NVARCHAR (442)  NULL,
    [DisplayName_L7]       NVARCHAR (442)  NULL,
    [DisplayName_L8]       NVARCHAR (442)  NULL,
    [Description_L1]       NVARCHAR (1024) NULL,
    [Description_L2]       NVARCHAR (1024) NULL,
    [Description_L3]       NVARCHAR (1024) NULL,
    [Description_L4]       NVARCHAR (1024) NULL,
    [Description_L5]       NVARCHAR (1024) NULL,
    [Description_L6]       NVARCHAR (1024) NULL,
    [Description_L7]       NVARCHAR (1024) NULL,
    [Description_L8]       NVARCHAR (1024) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_CompositeRoles1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_CompositeRoles_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_CompositeRoles1]
    ON [dbo].[tmp_ms_xx_UP_CompositeRoles]([Id] ASC, [ValidTo] DESC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_CompositeRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_CompositeRoles] ([Id], [Policy_Id], [EntityType_Id], [Category_Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [ApprovalWorkflowType], [Description_L1])
        SELECT   [Id],
                 [Policy_Id],
                 [EntityType_Id],
                 [Category_Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [ApprovalWorkflowType],
                 [Description_L1]
        FROM     [dbo].[UP_CompositeRoles]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_CompositeRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_CompositeRoles]', N'UP_CompositeRoles';

EXECUTE sp_rename N'[dbo].[UP_CompositeRoles].[tmp_ms_xx_index_IX_CompositeRoles1]', N'IX_CompositeRoles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_CompositeRoles1]', N'PK_CompositeRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_CompositeRoles_Identifier1]', N'U_CompositeRoles_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_Contexts]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_Contexts] (
    [Id]        BIGINT NOT NULL,
    [Automatic] BIT    CONSTRAINT [DF_Contexts_Automatic] DEFAULT ((0)) NOT NULL,
    [D0_Id]     BIGINT NULL,
    [D1_Id]     BIGINT NULL,
    [D2_Id]     BIGINT NULL,
    [D3_Id]     BIGINT NULL,
    [D4_Id]     BIGINT NULL,
    [D5_Id]     BIGINT NULL,
    [D6_Id]     BIGINT NULL,
    [D7_Id]     BIGINT NULL,
    [D8_Id]     BIGINT NULL,
    [D9_Id]     BIGINT NULL,
    [DA_Id]     BIGINT NULL,
    [DB_Id]     BIGINT NULL,
    [DC_Id]     BIGINT NULL,
    [DD_Id]     BIGINT NULL,
    [DE_Id]     BIGINT NULL,
    [DF_Id]     BIGINT NULL,
    [DG_Id]     BIGINT NULL,
    [DH_Id]     BIGINT NULL,
    [DI_Id]     BIGINT NULL,
    [DJ_Id]     BIGINT NULL,
    [DK_Id]     BIGINT NULL,
    [DL_Id]     BIGINT NULL,
    [DM_Id]     BIGINT NULL,
    [DN_Id]     BIGINT NULL,
    [DO_Id]     BIGINT NULL,
    [DP_Id]     BIGINT NULL,
    [DQ_Id]     BIGINT NULL,
    [DR_Id]     BIGINT NULL,
    [DS_Id]     BIGINT NULL,
    [DT_Id]     BIGINT NULL,
    [DU_Id]     BIGINT NULL,
    [DV_Id]     BIGINT NULL,
    [D10_Id]    BIGINT NULL,
    [D11_Id]    BIGINT NULL,
    [D12_Id]    BIGINT NULL,
    [D13_Id]    BIGINT NULL,
    [D14_Id]    BIGINT NULL,
    [D15_Id]    BIGINT NULL,
    [D16_Id]    BIGINT NULL,
    [D17_Id]    BIGINT NULL,
    [D18_Id]    BIGINT NULL,
    [D19_Id]    BIGINT NULL,
    [D1A_Id]    BIGINT NULL,
    [D1B_Id]    BIGINT NULL,
    [D1C_Id]    BIGINT NULL,
    [D1D_Id]    BIGINT NULL,
    [D1E_Id]    BIGINT NULL,
    [D1F_Id]    BIGINT NULL,
    [D1G_Id]    BIGINT NULL,
    [D1H_Id]    BIGINT NULL,
    [D1I_Id]    BIGINT NULL,
    [D1J_Id]    BIGINT NULL,
    [D1K_Id]    BIGINT NULL,
    [D1L_Id]    BIGINT NULL,
    [D1M_Id]    BIGINT NULL,
    [D1N_Id]    BIGINT NULL,
    [D1O_Id]    BIGINT NULL,
    [D1P_Id]    BIGINT NULL,
    [D1Q_Id]    BIGINT NULL,
    [D1R_Id]    BIGINT NULL,
    [D1S_Id]    BIGINT NULL,
    [D1T_Id]    BIGINT NULL,
    [D1U_Id]    BIGINT NULL,
    [D1V_Id]    BIGINT NULL,
    [D20_Id]    BIGINT NULL,
    [D21_Id]    BIGINT NULL,
    [D22_Id]    BIGINT NULL,
    [D23_Id]    BIGINT NULL,
    [D24_Id]    BIGINT NULL,
    [D25_Id]    BIGINT NULL,
    [D26_Id]    BIGINT NULL,
    [D27_Id]    BIGINT NULL,
    [D28_Id]    BIGINT NULL,
    [D29_Id]    BIGINT NULL,
    [D2A_Id]    BIGINT NULL,
    [D2B_Id]    BIGINT NULL,
    [D2C_Id]    BIGINT NULL,
    [D2D_Id]    BIGINT NULL,
    [D2E_Id]    BIGINT NULL,
    [D2F_Id]    BIGINT NULL,
    [D2G_Id]    BIGINT NULL,
    [D2H_Id]    BIGINT NULL,
    [D2I_Id]    BIGINT NULL,
    [D2J_Id]    BIGINT NULL,
    [D2K_Id]    BIGINT NULL,
    [D2L_Id]    BIGINT NULL,
    [D2M_Id]    BIGINT NULL,
    [D2N_Id]    BIGINT NULL,
    [D2O_Id]    BIGINT NULL,
    [D2P_Id]    BIGINT NULL,
    [D2Q_Id]    BIGINT NULL,
    [D2R_Id]    BIGINT NULL,
    [D2S_Id]    BIGINT NULL,
    [D2T_Id]    BIGINT NULL,
    [D2U_Id]    BIGINT NULL,
    [D2V_Id]    BIGINT NULL,
    [D30_Id]    BIGINT NULL,
    [D31_Id]    BIGINT NULL,
    [D32_Id]    BIGINT NULL,
    [D33_Id]    BIGINT NULL,
    [D34_Id]    BIGINT NULL,
    [D35_Id]    BIGINT NULL,
    [D36_Id]    BIGINT NULL,
    [D37_Id]    BIGINT NULL,
    [D38_Id]    BIGINT NULL,
    [D39_Id]    BIGINT NULL,
    [D3A_Id]    BIGINT NULL,
    [D3B_Id]    BIGINT NULL,
    [D3C_Id]    BIGINT NULL,
    [D3D_Id]    BIGINT NULL,
    [D3E_Id]    BIGINT NULL,
    [D3F_Id]    BIGINT NULL,
    [D3G_Id]    BIGINT NULL,
    [D3H_Id]    BIGINT NULL,
    [D3I_Id]    BIGINT NULL,
    [D3J_Id]    BIGINT NULL,
    [D3K_Id]    BIGINT NULL,
    [D3L_Id]    BIGINT NULL,
    [D3M_Id]    BIGINT NULL,
    [D3N_Id]    BIGINT NULL,
    [D3O_Id]    BIGINT NULL,
    [D3P_Id]    BIGINT NULL,
    [D3Q_Id]    BIGINT NULL,
    [D3R_Id]    BIGINT NULL,
    [D3S_Id]    BIGINT NULL,
    [D3T_Id]    BIGINT NULL,
    [D3U_Id]    BIGINT NULL,
    [D3V_Id]    BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Contexts1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_Contexts])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_Contexts] ([Id], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [Automatic])
        SELECT   [Id],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [Automatic]
        FROM     [dbo].[UP_Contexts]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_Contexts];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_Contexts]', N'UP_Contexts';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Contexts1]', N'PK_Contexts', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column [dbo].[UP_Policies].[Dimension0Level] is being dropped, data loss could occur.

The column [dbo].[UP_Policies].[Dimension1Level] is being dropped, data loss could occur.

The column [dbo].[UP_Policies].[Dimension2Level] is being dropped, data loss could occur.

The column [dbo].[UP_Policies].[Dimension3Level] is being dropped, data loss could occur.

The column [dbo].[UP_Policies].[Dimension4Level] is being dropped, data loss could occur.

The column [dbo].[UP_Policies].[Dimension5Level] is being dropped, data loss could occur.

The column [dbo].[UP_Policies].[Dimension6Level] is being dropped, data loss could occur.

The column [dbo].[UP_Policies].[Dimension7Level] is being dropped, data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_Policies]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_Policies] (
    [Id]                    BIGINT         NOT NULL,
    [IsProvisioningEnabled] BIT            CONSTRAINT [DF_Policies_IsProvisioningEnabled] DEFAULT ((0)) NOT NULL,
    [IsSimulationEnabled]   BIT            CONSTRAINT [DF_Policies_IsSimumationEnabled] DEFAULT ((0)) NOT NULL,
    [Identifier]            VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ValidFrom]             DATETIME2 (2)  CONSTRAINT [DF_Policies_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]               DATETIME2 (2)  CONSTRAINT [DF_Policies_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [DisplayName_L1]        NVARCHAR (442) NOT NULL,
    [DisplayName_L2]        NVARCHAR (442) NULL,
    [DisplayName_L3]        NVARCHAR (442) NULL,
    [DisplayName_L4]        NVARCHAR (442) NULL,
    [DisplayName_L5]        NVARCHAR (442) NULL,
    [DisplayName_L6]        NVARCHAR (442) NULL,
    [DisplayName_L7]        NVARCHAR (442) NULL,
    [DisplayName_L8]        NVARCHAR (442) NULL,
    [D0_Id]                 BIGINT         NULL,
    [D1_Id]                 BIGINT         NULL,
    [D2_Id]                 BIGINT         NULL,
    [D3_Id]                 BIGINT         NULL,
    [D4_Id]                 BIGINT         NULL,
    [D5_Id]                 BIGINT         NULL,
    [D6_Id]                 BIGINT         NULL,
    [D7_Id]                 BIGINT         NULL,
    [D8_Id]                 BIGINT         NULL,
    [D9_Id]                 BIGINT         NULL,
    [DA_Id]                 BIGINT         NULL,
    [DB_Id]                 BIGINT         NULL,
    [DC_Id]                 BIGINT         NULL,
    [DD_Id]                 BIGINT         NULL,
    [DE_Id]                 BIGINT         NULL,
    [DF_Id]                 BIGINT         NULL,
    [DG_Id]                 BIGINT         NULL,
    [DH_Id]                 BIGINT         NULL,
    [DI_Id]                 BIGINT         NULL,
    [DJ_Id]                 BIGINT         NULL,
    [DK_Id]                 BIGINT         NULL,
    [DL_Id]                 BIGINT         NULL,
    [DM_Id]                 BIGINT         NULL,
    [DN_Id]                 BIGINT         NULL,
    [DO_Id]                 BIGINT         NULL,
    [DP_Id]                 BIGINT         NULL,
    [DQ_Id]                 BIGINT         NULL,
    [DR_Id]                 BIGINT         NULL,
    [DS_Id]                 BIGINT         NULL,
    [DT_Id]                 BIGINT         NULL,
    [DU_Id]                 BIGINT         NULL,
    [DV_Id]                 BIGINT         NULL,
    [D10_Id]                BIGINT         NULL,
    [D11_Id]                BIGINT         NULL,
    [D12_Id]                BIGINT         NULL,
    [D13_Id]                BIGINT         NULL,
    [D14_Id]                BIGINT         NULL,
    [D15_Id]                BIGINT         NULL,
    [D16_Id]                BIGINT         NULL,
    [D17_Id]                BIGINT         NULL,
    [D18_Id]                BIGINT         NULL,
    [D19_Id]                BIGINT         NULL,
    [D1A_Id]                BIGINT         NULL,
    [D1B_Id]                BIGINT         NULL,
    [D1C_Id]                BIGINT         NULL,
    [D1D_Id]                BIGINT         NULL,
    [D1E_Id]                BIGINT         NULL,
    [D1F_Id]                BIGINT         NULL,
    [D1G_Id]                BIGINT         NULL,
    [D1H_Id]                BIGINT         NULL,
    [D1I_Id]                BIGINT         NULL,
    [D1J_Id]                BIGINT         NULL,
    [D1K_Id]                BIGINT         NULL,
    [D1L_Id]                BIGINT         NULL,
    [D1M_Id]                BIGINT         NULL,
    [D1N_Id]                BIGINT         NULL,
    [D1O_Id]                BIGINT         NULL,
    [D1P_Id]                BIGINT         NULL,
    [D1Q_Id]                BIGINT         NULL,
    [D1R_Id]                BIGINT         NULL,
    [D1S_Id]                BIGINT         NULL,
    [D1T_Id]                BIGINT         NULL,
    [D1U_Id]                BIGINT         NULL,
    [D1V_Id]                BIGINT         NULL,
    [D20_Id]                BIGINT         NULL,
    [D21_Id]                BIGINT         NULL,
    [D22_Id]                BIGINT         NULL,
    [D23_Id]                BIGINT         NULL,
    [D24_Id]                BIGINT         NULL,
    [D25_Id]                BIGINT         NULL,
    [D26_Id]                BIGINT         NULL,
    [D27_Id]                BIGINT         NULL,
    [D28_Id]                BIGINT         NULL,
    [D29_Id]                BIGINT         NULL,
    [D2A_Id]                BIGINT         NULL,
    [D2B_Id]                BIGINT         NULL,
    [D2C_Id]                BIGINT         NULL,
    [D2D_Id]                BIGINT         NULL,
    [D2E_Id]                BIGINT         NULL,
    [D2F_Id]                BIGINT         NULL,
    [D2G_Id]                BIGINT         NULL,
    [D2H_Id]                BIGINT         NULL,
    [D2I_Id]                BIGINT         NULL,
    [D2J_Id]                BIGINT         NULL,
    [D2K_Id]                BIGINT         NULL,
    [D2L_Id]                BIGINT         NULL,
    [D2M_Id]                BIGINT         NULL,
    [D2N_Id]                BIGINT         NULL,
    [D2O_Id]                BIGINT         NULL,
    [D2P_Id]                BIGINT         NULL,
    [D2Q_Id]                BIGINT         NULL,
    [D2R_Id]                BIGINT         NULL,
    [D2S_Id]                BIGINT         NULL,
    [D2T_Id]                BIGINT         NULL,
    [D2U_Id]                BIGINT         NULL,
    [D2V_Id]                BIGINT         NULL,
    [D30_Id]                BIGINT         NULL,
    [D31_Id]                BIGINT         NULL,
    [D32_Id]                BIGINT         NULL,
    [D33_Id]                BIGINT         NULL,
    [D34_Id]                BIGINT         NULL,
    [D35_Id]                BIGINT         NULL,
    [D36_Id]                BIGINT         NULL,
    [D37_Id]                BIGINT         NULL,
    [D38_Id]                BIGINT         NULL,
    [D39_Id]                BIGINT         NULL,
    [D3A_Id]                BIGINT         NULL,
    [D3B_Id]                BIGINT         NULL,
    [D3C_Id]                BIGINT         NULL,
    [D3D_Id]                BIGINT         NULL,
    [D3E_Id]                BIGINT         NULL,
    [D3F_Id]                BIGINT         NULL,
    [D3G_Id]                BIGINT         NULL,
    [D3H_Id]                BIGINT         NULL,
    [D3I_Id]                BIGINT         NULL,
    [D3J_Id]                BIGINT         NULL,
    [D3K_Id]                BIGINT         NULL,
    [D3L_Id]                BIGINT         NULL,
    [D3M_Id]                BIGINT         NULL,
    [D3N_Id]                BIGINT         NULL,
    [D3O_Id]                BIGINT         NULL,
    [D3P_Id]                BIGINT         NULL,
    [D3Q_Id]                BIGINT         NULL,
    [D3R_Id]                BIGINT         NULL,
    [D3S_Id]                BIGINT         NULL,
    [D3T_Id]                BIGINT         NULL,
    [D3U_Id]                BIGINT         NULL,
    [D3V_Id]                BIGINT         NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Policies1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Policies_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_Policies1]
    ON [dbo].[tmp_ms_xx_UP_Policies]([Id] ASC, [ValidTo] DESC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_Policies])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_Policies] ([Id], [IsProvisioningEnabled], [IsSimulationEnabled], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id])
        SELECT   [Id],
                 [IsProvisioningEnabled],
                 [IsSimulationEnabled],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id]
        FROM     [dbo].[UP_Policies]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_Policies];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_Policies]', N'UP_Policies';

EXECUTE sp_rename N'[dbo].[UP_Policies].[tmp_ms_xx_index_IX_Policies1]', N'IX_Policies', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Policies1]', N'PK_Policies', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Policies_Identifier1]', N'U_Policies_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceNavigationRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceNavigationRules] (
    [Id]                        BIGINT NOT NULL,
    [Policy_Id]                 BIGINT NOT NULL,
    [Type]                      INT    CONSTRAINT [DF_ResourceNavigationRules_Type] DEFAULT ((0)) NOT NULL,
    [Resource_Id]               BIGINT NOT NULL,
    [ResourceType_Id]           BIGINT NOT NULL,
    [Property_Id]               BIGINT NOT NULL,
    [IsDenied]                  BIT    CONSTRAINT [DF_ResourceNavigationRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [TimeOffsetReference]       INT    CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetBeforeReference] INT    CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetBeforeReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetAfterReference]  INT    CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetAfterReference] DEFAULT ((0)) NOT NULL,
    [SingleRole_Id]             BIGINT NULL,
    [L0]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]                        BIT    CONSTRAINT [DF_ResourceNavigationRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]                       BIT    CONSTRAINT [DF_ResourceNavigationRules_L3V] DEFAULT ((0)) NOT NULL,
    [D0_Id]                     BIGINT NULL,
    [D1_Id]                     BIGINT NULL,
    [D2_Id]                     BIGINT NULL,
    [D3_Id]                     BIGINT NULL,
    [D4_Id]                     BIGINT NULL,
    [D5_Id]                     BIGINT NULL,
    [D6_Id]                     BIGINT NULL,
    [D7_Id]                     BIGINT NULL,
    [D8_Id]                     BIGINT NULL,
    [D9_Id]                     BIGINT NULL,
    [DA_Id]                     BIGINT NULL,
    [DB_Id]                     BIGINT NULL,
    [DC_Id]                     BIGINT NULL,
    [DD_Id]                     BIGINT NULL,
    [DE_Id]                     BIGINT NULL,
    [DF_Id]                     BIGINT NULL,
    [DG_Id]                     BIGINT NULL,
    [DH_Id]                     BIGINT NULL,
    [DI_Id]                     BIGINT NULL,
    [DJ_Id]                     BIGINT NULL,
    [DK_Id]                     BIGINT NULL,
    [DL_Id]                     BIGINT NULL,
    [DM_Id]                     BIGINT NULL,
    [DN_Id]                     BIGINT NULL,
    [DO_Id]                     BIGINT NULL,
    [DP_Id]                     BIGINT NULL,
    [DQ_Id]                     BIGINT NULL,
    [DR_Id]                     BIGINT NULL,
    [DS_Id]                     BIGINT NULL,
    [DT_Id]                     BIGINT NULL,
    [DU_Id]                     BIGINT NULL,
    [DV_Id]                     BIGINT NULL,
    [D10_Id]                    BIGINT NULL,
    [D11_Id]                    BIGINT NULL,
    [D12_Id]                    BIGINT NULL,
    [D13_Id]                    BIGINT NULL,
    [D14_Id]                    BIGINT NULL,
    [D15_Id]                    BIGINT NULL,
    [D16_Id]                    BIGINT NULL,
    [D17_Id]                    BIGINT NULL,
    [D18_Id]                    BIGINT NULL,
    [D19_Id]                    BIGINT NULL,
    [D1A_Id]                    BIGINT NULL,
    [D1B_Id]                    BIGINT NULL,
    [D1C_Id]                    BIGINT NULL,
    [D1D_Id]                    BIGINT NULL,
    [D1E_Id]                    BIGINT NULL,
    [D1F_Id]                    BIGINT NULL,
    [D1G_Id]                    BIGINT NULL,
    [D1H_Id]                    BIGINT NULL,
    [D1I_Id]                    BIGINT NULL,
    [D1J_Id]                    BIGINT NULL,
    [D1K_Id]                    BIGINT NULL,
    [D1L_Id]                    BIGINT NULL,
    [D1M_Id]                    BIGINT NULL,
    [D1N_Id]                    BIGINT NULL,
    [D1O_Id]                    BIGINT NULL,
    [D1P_Id]                    BIGINT NULL,
    [D1Q_Id]                    BIGINT NULL,
    [D1R_Id]                    BIGINT NULL,
    [D1S_Id]                    BIGINT NULL,
    [D1T_Id]                    BIGINT NULL,
    [D1U_Id]                    BIGINT NULL,
    [D1V_Id]                    BIGINT NULL,
    [D20_Id]                    BIGINT NULL,
    [D21_Id]                    BIGINT NULL,
    [D22_Id]                    BIGINT NULL,
    [D23_Id]                    BIGINT NULL,
    [D24_Id]                    BIGINT NULL,
    [D25_Id]                    BIGINT NULL,
    [D26_Id]                    BIGINT NULL,
    [D27_Id]                    BIGINT NULL,
    [D28_Id]                    BIGINT NULL,
    [D29_Id]                    BIGINT NULL,
    [D2A_Id]                    BIGINT NULL,
    [D2B_Id]                    BIGINT NULL,
    [D2C_Id]                    BIGINT NULL,
    [D2D_Id]                    BIGINT NULL,
    [D2E_Id]                    BIGINT NULL,
    [D2F_Id]                    BIGINT NULL,
    [D2G_Id]                    BIGINT NULL,
    [D2H_Id]                    BIGINT NULL,
    [D2I_Id]                    BIGINT NULL,
    [D2J_Id]                    BIGINT NULL,
    [D2K_Id]                    BIGINT NULL,
    [D2L_Id]                    BIGINT NULL,
    [D2M_Id]                    BIGINT NULL,
    [D2N_Id]                    BIGINT NULL,
    [D2O_Id]                    BIGINT NULL,
    [D2P_Id]                    BIGINT NULL,
    [D2Q_Id]                    BIGINT NULL,
    [D2R_Id]                    BIGINT NULL,
    [D2S_Id]                    BIGINT NULL,
    [D2T_Id]                    BIGINT NULL,
    [D2U_Id]                    BIGINT NULL,
    [D2V_Id]                    BIGINT NULL,
    [D30_Id]                    BIGINT NULL,
    [D31_Id]                    BIGINT NULL,
    [D32_Id]                    BIGINT NULL,
    [D33_Id]                    BIGINT NULL,
    [D34_Id]                    BIGINT NULL,
    [D35_Id]                    BIGINT NULL,
    [D36_Id]                    BIGINT NULL,
    [D37_Id]                    BIGINT NULL,
    [D38_Id]                    BIGINT NULL,
    [D39_Id]                    BIGINT NULL,
    [D3A_Id]                    BIGINT NULL,
    [D3B_Id]                    BIGINT NULL,
    [D3C_Id]                    BIGINT NULL,
    [D3D_Id]                    BIGINT NULL,
    [D3E_Id]                    BIGINT NULL,
    [D3F_Id]                    BIGINT NULL,
    [D3G_Id]                    BIGINT NULL,
    [D3H_Id]                    BIGINT NULL,
    [D3I_Id]                    BIGINT NULL,
    [D3J_Id]                    BIGINT NULL,
    [D3K_Id]                    BIGINT NULL,
    [D3L_Id]                    BIGINT NULL,
    [D3M_Id]                    BIGINT NULL,
    [D3N_Id]                    BIGINT NULL,
    [D3O_Id]                    BIGINT NULL,
    [D3P_Id]                    BIGINT NULL,
    [D3Q_Id]                    BIGINT NULL,
    [D3R_Id]                    BIGINT NULL,
    [D3S_Id]                    BIGINT NULL,
    [D3T_Id]                    BIGINT NULL,
    [D3U_Id]                    BIGINT NULL,
    [D3V_Id]                    BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceNavigationRules1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceNavigationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceNavigationRules] ([Id], [Policy_Id], [Type], [Resource_Id], [ResourceType_Id], [Property_Id], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [D0_Id], [L0], [D1_Id], [L1], [D2_Id], [L2], [D3_Id], [L3], [D4_Id], [L4], [D5_Id], [L5], [D6_Id], [L6], [D7_Id], [L7])
        SELECT   [Id],
                 [Policy_Id],
                 [Type],
                 [Resource_Id],
                 [ResourceType_Id],
                 [Property_Id],
                 [IsDenied],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SingleRole_Id],
                 [D0_Id],
                 [L0],
                 [D1_Id],
                 [L1],
                 [D2_Id],
                 [L2],
                 [D3_Id],
                 [L3],
                 [D4_Id],
                 [L4],
                 [D5_Id],
                 [L5],
                 [D6_Id],
                 [L6],
                 [D7_Id],
                 [L7]
        FROM     [dbo].[UP_ResourceNavigationRules]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceNavigationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceNavigationRules]', N'UP_ResourceNavigationRules';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceNavigationRules1]', N'PK_ResourceNavigationRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceQueryRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceQueryRules] (
    [Id]                           BIGINT         NOT NULL,
    [Policy_Id]                    BIGINT         NOT NULL,
    [ResourceType_Id]              BIGINT         NOT NULL,
    [Property_Id]                  BIGINT         NOT NULL,
    [TargetMatchedConfidenceLevel] INT            CONSTRAINT [DF_ResourceQueryRules_TargetMatchedConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [TimeOffsetReference]          INT            CONSTRAINT [DF_ResourceQueryRules_TimeOffsetReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetBeforeReference]    INT            CONSTRAINT [DF_ResourceQueryRules_TimeOffsetBeforeReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetAfterReference]     INT            CONSTRAINT [DF_ResourceQueryRules_TimeOffsetAfterReference] DEFAULT ((0)) NOT NULL,
    [SourceBinding_Id]             BIGINT         NULL,
    [SourceExpression]             VARCHAR (4000) NULL,
    [TargetBinding_Id]             BIGINT         NULL,
    [TargetExpression]             VARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceQueryRules1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceQueryRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceQueryRules] ([Id], [Policy_Id], [ResourceType_Id], [Property_Id], [TargetBinding_Id], [TargetMatchedConfidenceLevel], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SourceBinding_Id], [SourceExpression])
        SELECT   [Id],
                 [Policy_Id],
                 [ResourceType_Id],
                 [Property_Id],
                 [TargetBinding_Id],
                 [TargetMatchedConfidenceLevel],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SourceBinding_Id],
                 [SourceExpression]
        FROM     [dbo].[UP_ResourceQueryRules]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceQueryRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceQueryRules]', N'UP_ResourceQueryRules';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceQueryRules1]', N'PK_ResourceQueryRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceTypeRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceTypeRules] (
    [Id]                        BIGINT NOT NULL,
    [Policy_Id]                 BIGINT NOT NULL,
    [Type]                      INT    CONSTRAINT [DF_ResourceTypeRules_Type] DEFAULT ((0)) NOT NULL,
    [ResourceType_Id]           BIGINT NOT NULL,
    [IsDenied]                  BIT    CONSTRAINT [DF_ResourceTypeRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [TimeOffsetReference]       INT    CONSTRAINT [DF_ResourceTypeRules_TimeOffsetReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetBeforeReference] INT    CONSTRAINT [DF_ResourceTypeRules_TimeOffsetBeforeReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetAfterReference]  INT    CONSTRAINT [DF_ResourceTypeRules_TimeOffsetAfterReference] DEFAULT ((0)) NOT NULL,
    [SingleRole_Id]             BIGINT NULL,
    [L0]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]                        BIT    CONSTRAINT [DF_ResourceTypeRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]                        BIT    CONSTRAINT [DF_ResourceTypeRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]                       BIT    CONSTRAINT [DF_ResourceTypeRules_L3V] DEFAULT ((0)) NOT NULL,
    [D0_Id]                     BIGINT NULL,
    [D1_Id]                     BIGINT NULL,
    [D2_Id]                     BIGINT NULL,
    [D3_Id]                     BIGINT NULL,
    [D4_Id]                     BIGINT NULL,
    [D5_Id]                     BIGINT NULL,
    [D6_Id]                     BIGINT NULL,
    [D7_Id]                     BIGINT NULL,
    [D8_Id]                     BIGINT NULL,
    [D9_Id]                     BIGINT NULL,
    [DA_Id]                     BIGINT NULL,
    [DB_Id]                     BIGINT NULL,
    [DC_Id]                     BIGINT NULL,
    [DD_Id]                     BIGINT NULL,
    [DE_Id]                     BIGINT NULL,
    [DF_Id]                     BIGINT NULL,
    [DG_Id]                     BIGINT NULL,
    [DH_Id]                     BIGINT NULL,
    [DI_Id]                     BIGINT NULL,
    [DJ_Id]                     BIGINT NULL,
    [DK_Id]                     BIGINT NULL,
    [DL_Id]                     BIGINT NULL,
    [DM_Id]                     BIGINT NULL,
    [DN_Id]                     BIGINT NULL,
    [DO_Id]                     BIGINT NULL,
    [DP_Id]                     BIGINT NULL,
    [DQ_Id]                     BIGINT NULL,
    [DR_Id]                     BIGINT NULL,
    [DS_Id]                     BIGINT NULL,
    [DT_Id]                     BIGINT NULL,
    [DU_Id]                     BIGINT NULL,
    [DV_Id]                     BIGINT NULL,
    [D10_Id]                    BIGINT NULL,
    [D11_Id]                    BIGINT NULL,
    [D12_Id]                    BIGINT NULL,
    [D13_Id]                    BIGINT NULL,
    [D14_Id]                    BIGINT NULL,
    [D15_Id]                    BIGINT NULL,
    [D16_Id]                    BIGINT NULL,
    [D17_Id]                    BIGINT NULL,
    [D18_Id]                    BIGINT NULL,
    [D19_Id]                    BIGINT NULL,
    [D1A_Id]                    BIGINT NULL,
    [D1B_Id]                    BIGINT NULL,
    [D1C_Id]                    BIGINT NULL,
    [D1D_Id]                    BIGINT NULL,
    [D1E_Id]                    BIGINT NULL,
    [D1F_Id]                    BIGINT NULL,
    [D1G_Id]                    BIGINT NULL,
    [D1H_Id]                    BIGINT NULL,
    [D1I_Id]                    BIGINT NULL,
    [D1J_Id]                    BIGINT NULL,
    [D1K_Id]                    BIGINT NULL,
    [D1L_Id]                    BIGINT NULL,
    [D1M_Id]                    BIGINT NULL,
    [D1N_Id]                    BIGINT NULL,
    [D1O_Id]                    BIGINT NULL,
    [D1P_Id]                    BIGINT NULL,
    [D1Q_Id]                    BIGINT NULL,
    [D1R_Id]                    BIGINT NULL,
    [D1S_Id]                    BIGINT NULL,
    [D1T_Id]                    BIGINT NULL,
    [D1U_Id]                    BIGINT NULL,
    [D1V_Id]                    BIGINT NULL,
    [D20_Id]                    BIGINT NULL,
    [D21_Id]                    BIGINT NULL,
    [D22_Id]                    BIGINT NULL,
    [D23_Id]                    BIGINT NULL,
    [D24_Id]                    BIGINT NULL,
    [D25_Id]                    BIGINT NULL,
    [D26_Id]                    BIGINT NULL,
    [D27_Id]                    BIGINT NULL,
    [D28_Id]                    BIGINT NULL,
    [D29_Id]                    BIGINT NULL,
    [D2A_Id]                    BIGINT NULL,
    [D2B_Id]                    BIGINT NULL,
    [D2C_Id]                    BIGINT NULL,
    [D2D_Id]                    BIGINT NULL,
    [D2E_Id]                    BIGINT NULL,
    [D2F_Id]                    BIGINT NULL,
    [D2G_Id]                    BIGINT NULL,
    [D2H_Id]                    BIGINT NULL,
    [D2I_Id]                    BIGINT NULL,
    [D2J_Id]                    BIGINT NULL,
    [D2K_Id]                    BIGINT NULL,
    [D2L_Id]                    BIGINT NULL,
    [D2M_Id]                    BIGINT NULL,
    [D2N_Id]                    BIGINT NULL,
    [D2O_Id]                    BIGINT NULL,
    [D2P_Id]                    BIGINT NULL,
    [D2Q_Id]                    BIGINT NULL,
    [D2R_Id]                    BIGINT NULL,
    [D2S_Id]                    BIGINT NULL,
    [D2T_Id]                    BIGINT NULL,
    [D2U_Id]                    BIGINT NULL,
    [D2V_Id]                    BIGINT NULL,
    [D30_Id]                    BIGINT NULL,
    [D31_Id]                    BIGINT NULL,
    [D32_Id]                    BIGINT NULL,
    [D33_Id]                    BIGINT NULL,
    [D34_Id]                    BIGINT NULL,
    [D35_Id]                    BIGINT NULL,
    [D36_Id]                    BIGINT NULL,
    [D37_Id]                    BIGINT NULL,
    [D38_Id]                    BIGINT NULL,
    [D39_Id]                    BIGINT NULL,
    [D3A_Id]                    BIGINT NULL,
    [D3B_Id]                    BIGINT NULL,
    [D3C_Id]                    BIGINT NULL,
    [D3D_Id]                    BIGINT NULL,
    [D3E_Id]                    BIGINT NULL,
    [D3F_Id]                    BIGINT NULL,
    [D3G_Id]                    BIGINT NULL,
    [D3H_Id]                    BIGINT NULL,
    [D3I_Id]                    BIGINT NULL,
    [D3J_Id]                    BIGINT NULL,
    [D3K_Id]                    BIGINT NULL,
    [D3L_Id]                    BIGINT NULL,
    [D3M_Id]                    BIGINT NULL,
    [D3N_Id]                    BIGINT NULL,
    [D3O_Id]                    BIGINT NULL,
    [D3P_Id]                    BIGINT NULL,
    [D3Q_Id]                    BIGINT NULL,
    [D3R_Id]                    BIGINT NULL,
    [D3S_Id]                    BIGINT NULL,
    [D3T_Id]                    BIGINT NULL,
    [D3U_Id]                    BIGINT NULL,
    [D3V_Id]                    BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypeRules1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceTypeRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceTypeRules] ([Id], [Policy_Id], [Type], [ResourceType_Id], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [D0_Id], [L0], [D1_Id], [L1], [D2_Id], [L2], [D3_Id], [L3], [D4_Id], [L4], [D5_Id], [L5], [D6_Id], [L6], [D7_Id], [L7])
        SELECT   [Id],
                 [Policy_Id],
                 [Type],
                 [ResourceType_Id],
                 [IsDenied],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SingleRole_Id],
                 [D0_Id],
                 [L0],
                 [D1_Id],
                 [L1],
                 [D2_Id],
                 [L2],
                 [D3_Id],
                 [L3],
                 [D4_Id],
                 [L4],
                 [D5_Id],
                 [L5],
                 [D6_Id],
                 [L6],
                 [D7_Id],
                 [L7]
        FROM     [dbo].[UP_ResourceTypeRules]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceTypeRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceTypeRules]', N'UP_ResourceTypeRules';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypeRules1]', N'PK_ResourceTypeRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column [dbo].[UP_ResourceTypes].[GroupByDimension0] is being dropped, data loss could occur.

The column [dbo].[UP_ResourceTypes].[GroupByDimension1] is being dropped, data loss could occur.

The column [dbo].[UP_ResourceTypes].[GroupByDimension2] is being dropped, data loss could occur.

The column [dbo].[UP_ResourceTypes].[GroupByDimension3] is being dropped, data loss could occur.

The column [dbo].[UP_ResourceTypes].[GroupByDimension4] is being dropped, data loss could occur.

The column [dbo].[UP_ResourceTypes].[GroupByDimension5] is being dropped, data loss could occur.

The column [dbo].[UP_ResourceTypes].[GroupByDimension6] is being dropped, data loss could occur.

The column [dbo].[UP_ResourceTypes].[GroupByDimension7] is being dropped, data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceTypes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceTypes] (
    [Id]                       BIGINT          NOT NULL,
    [Policy_Id]                BIGINT          NOT NULL,
    [Category_Id]              BIGINT          NULL,
    [SourceEntityType_Id]      BIGINT          NULL,
    [TargetEntityType_Id]      BIGINT          NOT NULL,
    [ContextRule_Id]           BIGINT          NULL,
    [ValidFrom]                DATETIME2 (2)   CONSTRAINT [DF_ResourceTypes_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                  DATETIME2 (2)   CONSTRAINT [DF_ResourceTypes_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [P0]                       BIT             CONSTRAINT [DF_ResourceTypes_P0] DEFAULT ((0)) NOT NULL,
    [P1]                       BIT             CONSTRAINT [DF_ResourceTypes_P1] DEFAULT ((0)) NOT NULL,
    [P2]                       BIT             CONSTRAINT [DF_ResourceTypes_P2] DEFAULT ((0)) NOT NULL,
    [P3]                       BIT             CONSTRAINT [DF_ResourceTypes_P3] DEFAULT ((0)) NOT NULL,
    [P4]                       BIT             CONSTRAINT [DF_ResourceTypes_P4] DEFAULT ((0)) NOT NULL,
    [P5]                       BIT             CONSTRAINT [DF_ResourceTypes_P5] DEFAULT ((0)) NOT NULL,
    [P6]                       BIT             CONSTRAINT [DF_ResourceTypes_P6] DEFAULT ((0)) NOT NULL,
    [P7]                       BIT             CONSTRAINT [DF_ResourceTypes_P7] DEFAULT ((0)) NOT NULL,
    [P8]                       BIT             CONSTRAINT [DF_ResourceTypes_P8] DEFAULT ((0)) NOT NULL,
    [P9]                       BIT             CONSTRAINT [DF_ResourceTypes_P9] DEFAULT ((0)) NOT NULL,
    [PA]                       BIT             CONSTRAINT [DF_ResourceTypes_PA] DEFAULT ((0)) NOT NULL,
    [PB]                       BIT             CONSTRAINT [DF_ResourceTypes_PB] DEFAULT ((0)) NOT NULL,
    [PC]                       BIT             CONSTRAINT [DF_ResourceTypes_PC] DEFAULT ((0)) NOT NULL,
    [PD]                       BIT             CONSTRAINT [DF_ResourceTypes_PD] DEFAULT ((0)) NOT NULL,
    [PE]                       BIT             CONSTRAINT [DF_ResourceTypes_PE] DEFAULT ((0)) NOT NULL,
    [PF]                       BIT             CONSTRAINT [DF_ResourceTypes_PF] DEFAULT ((0)) NOT NULL,
    [PG]                       BIT             CONSTRAINT [DF_ResourceTypes_PG] DEFAULT ((0)) NOT NULL,
    [PH]                       BIT             CONSTRAINT [DF_ResourceTypes_PH] DEFAULT ((0)) NOT NULL,
    [PI]                       BIT             CONSTRAINT [DF_ResourceTypes_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                       BIT             CONSTRAINT [DF_ResourceTypes_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                       BIT             CONSTRAINT [DF_ResourceTypes_PK] DEFAULT ((0)) NOT NULL,
    [PL]                       BIT             CONSTRAINT [DF_ResourceTypes_PL] DEFAULT ((0)) NOT NULL,
    [PM]                       BIT             CONSTRAINT [DF_ResourceTypes_PM] DEFAULT ((0)) NOT NULL,
    [PN]                       BIT             CONSTRAINT [DF_ResourceTypes_PN] DEFAULT ((0)) NOT NULL,
    [PO]                       BIT             CONSTRAINT [DF_ResourceTypes_PO] DEFAULT ((0)) NOT NULL,
    [PP]                       BIT             CONSTRAINT [DF_ResourceTypes_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                       BIT             CONSTRAINT [DF_ResourceTypes_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                       BIT             CONSTRAINT [DF_ResourceTypes_PR] DEFAULT ((0)) NOT NULL,
    [PS]                       BIT             CONSTRAINT [DF_ResourceTypes_PS] DEFAULT ((0)) NOT NULL,
    [PT]                       BIT             CONSTRAINT [DF_ResourceTypes_PT] DEFAULT ((0)) NOT NULL,
    [PU]                       BIT             CONSTRAINT [DF_ResourceTypes_PU] DEFAULT ((0)) NOT NULL,
    [PV]                       BIT             CONSTRAINT [DF_ResourceTypes_PV] DEFAULT ((0)) NOT NULL,
    [P10]                      BIT             CONSTRAINT [DF_ResourceTypes_P10] DEFAULT ((0)) NOT NULL,
    [P11]                      BIT             CONSTRAINT [DF_ResourceTypes_P11] DEFAULT ((0)) NOT NULL,
    [P12]                      BIT             CONSTRAINT [DF_ResourceTypes_P12] DEFAULT ((0)) NOT NULL,
    [P13]                      BIT             CONSTRAINT [DF_ResourceTypes_P13] DEFAULT ((0)) NOT NULL,
    [P14]                      BIT             CONSTRAINT [DF_ResourceTypes_P14] DEFAULT ((0)) NOT NULL,
    [P15]                      BIT             CONSTRAINT [DF_ResourceTypes_P15] DEFAULT ((0)) NOT NULL,
    [P16]                      BIT             CONSTRAINT [DF_ResourceTypes_P16] DEFAULT ((0)) NOT NULL,
    [P17]                      BIT             CONSTRAINT [DF_ResourceTypes_P17] DEFAULT ((0)) NOT NULL,
    [P18]                      BIT             CONSTRAINT [DF_ResourceTypes_P18] DEFAULT ((0)) NOT NULL,
    [P19]                      BIT             CONSTRAINT [DF_ResourceTypes_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                      BIT             CONSTRAINT [DF_ResourceTypes_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                      BIT             CONSTRAINT [DF_ResourceTypes_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                      BIT             CONSTRAINT [DF_ResourceTypes_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                      BIT             CONSTRAINT [DF_ResourceTypes_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                      BIT             CONSTRAINT [DF_ResourceTypes_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                      BIT             CONSTRAINT [DF_ResourceTypes_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                      BIT             CONSTRAINT [DF_ResourceTypes_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                      BIT             CONSTRAINT [DF_ResourceTypes_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                      BIT             CONSTRAINT [DF_ResourceTypes_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                      BIT             CONSTRAINT [DF_ResourceTypes_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                      BIT             CONSTRAINT [DF_ResourceTypes_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                      BIT             CONSTRAINT [DF_ResourceTypes_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                      BIT             CONSTRAINT [DF_ResourceTypes_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                      BIT             CONSTRAINT [DF_ResourceTypes_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                      BIT             CONSTRAINT [DF_ResourceTypes_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                      BIT             CONSTRAINT [DF_ResourceTypes_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                      BIT             CONSTRAINT [DF_ResourceTypes_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                      BIT             CONSTRAINT [DF_ResourceTypes_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                      BIT             CONSTRAINT [DF_ResourceTypes_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                      BIT             CONSTRAINT [DF_ResourceTypes_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                      BIT             CONSTRAINT [DF_ResourceTypes_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                      BIT             CONSTRAINT [DF_ResourceTypes_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                      BIT             CONSTRAINT [DF_ResourceTypes_P20] DEFAULT ((0)) NOT NULL,
    [P21]                      BIT             CONSTRAINT [DF_ResourceTypes_P21] DEFAULT ((0)) NOT NULL,
    [P22]                      BIT             CONSTRAINT [DF_ResourceTypes_P22] DEFAULT ((0)) NOT NULL,
    [P23]                      BIT             CONSTRAINT [DF_ResourceTypes_P23] DEFAULT ((0)) NOT NULL,
    [P24]                      BIT             CONSTRAINT [DF_ResourceTypes_P24] DEFAULT ((0)) NOT NULL,
    [P25]                      BIT             CONSTRAINT [DF_ResourceTypes_P25] DEFAULT ((0)) NOT NULL,
    [P26]                      BIT             CONSTRAINT [DF_ResourceTypes_P26] DEFAULT ((0)) NOT NULL,
    [P27]                      BIT             CONSTRAINT [DF_ResourceTypes_P27] DEFAULT ((0)) NOT NULL,
    [P28]                      BIT             CONSTRAINT [DF_ResourceTypes_P28] DEFAULT ((0)) NOT NULL,
    [P29]                      BIT             CONSTRAINT [DF_ResourceTypes_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                      BIT             CONSTRAINT [DF_ResourceTypes_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                      BIT             CONSTRAINT [DF_ResourceTypes_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                      BIT             CONSTRAINT [DF_ResourceTypes_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                      BIT             CONSTRAINT [DF_ResourceTypes_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                      BIT             CONSTRAINT [DF_ResourceTypes_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                      BIT             CONSTRAINT [DF_ResourceTypes_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                      BIT             CONSTRAINT [DF_ResourceTypes_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                      BIT             CONSTRAINT [DF_ResourceTypes_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                      BIT             CONSTRAINT [DF_ResourceTypes_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                      BIT             CONSTRAINT [DF_ResourceTypes_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                      BIT             CONSTRAINT [DF_ResourceTypes_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                      BIT             CONSTRAINT [DF_ResourceTypes_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                      BIT             CONSTRAINT [DF_ResourceTypes_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                      BIT             CONSTRAINT [DF_ResourceTypes_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                      BIT             CONSTRAINT [DF_ResourceTypes_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                      BIT             CONSTRAINT [DF_ResourceTypes_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                      BIT             CONSTRAINT [DF_ResourceTypes_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                      BIT             CONSTRAINT [DF_ResourceTypes_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                      BIT             CONSTRAINT [DF_ResourceTypes_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                      BIT             CONSTRAINT [DF_ResourceTypes_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                      BIT             CONSTRAINT [DF_ResourceTypes_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                      BIT             CONSTRAINT [DF_ResourceTypes_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                      BIT             CONSTRAINT [DF_ResourceTypes_P30] DEFAULT ((0)) NOT NULL,
    [P31]                      BIT             CONSTRAINT [DF_ResourceTypes_P31] DEFAULT ((0)) NOT NULL,
    [P32]                      BIT             CONSTRAINT [DF_ResourceTypes_P32] DEFAULT ((0)) NOT NULL,
    [P33]                      BIT             CONSTRAINT [DF_ResourceTypes_P33] DEFAULT ((0)) NOT NULL,
    [P34]                      BIT             CONSTRAINT [DF_ResourceTypes_P34] DEFAULT ((0)) NOT NULL,
    [P35]                      BIT             CONSTRAINT [DF_ResourceTypes_P35] DEFAULT ((0)) NOT NULL,
    [P36]                      BIT             CONSTRAINT [DF_ResourceTypes_P36] DEFAULT ((0)) NOT NULL,
    [P37]                      BIT             CONSTRAINT [DF_ResourceTypes_P37] DEFAULT ((0)) NOT NULL,
    [P38]                      BIT             CONSTRAINT [DF_ResourceTypes_P38] DEFAULT ((0)) NOT NULL,
    [P39]                      BIT             CONSTRAINT [DF_ResourceTypes_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                      BIT             CONSTRAINT [DF_ResourceTypes_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                      BIT             CONSTRAINT [DF_ResourceTypes_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                      BIT             CONSTRAINT [DF_ResourceTypes_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                      BIT             CONSTRAINT [DF_ResourceTypes_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                      BIT             CONSTRAINT [DF_ResourceTypes_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                      BIT             CONSTRAINT [DF_ResourceTypes_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                      BIT             CONSTRAINT [DF_ResourceTypes_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                      BIT             CONSTRAINT [DF_ResourceTypes_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                      BIT             CONSTRAINT [DF_ResourceTypes_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                      BIT             CONSTRAINT [DF_ResourceTypes_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                      BIT             CONSTRAINT [DF_ResourceTypes_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                      BIT             CONSTRAINT [DF_ResourceTypes_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                      BIT             CONSTRAINT [DF_ResourceTypes_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                      BIT             CONSTRAINT [DF_ResourceTypes_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                      BIT             CONSTRAINT [DF_ResourceTypes_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                      BIT             CONSTRAINT [DF_ResourceTypes_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                      BIT             CONSTRAINT [DF_ResourceTypes_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                      BIT             CONSTRAINT [DF_ResourceTypes_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                      BIT             CONSTRAINT [DF_ResourceTypes_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                      BIT             CONSTRAINT [DF_ResourceTypes_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                      BIT             CONSTRAINT [DF_ResourceTypes_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                      BIT             CONSTRAINT [DF_ResourceTypes_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                       BIT             CONSTRAINT [DF_ResourceTypes_R0] DEFAULT ((0)) NOT NULL,
    [R1]                       BIT             CONSTRAINT [DF_ResourceTypes_R1] DEFAULT ((0)) NOT NULL,
    [R2]                       BIT             CONSTRAINT [DF_ResourceTypes_R2] DEFAULT ((0)) NOT NULL,
    [R3]                       BIT             CONSTRAINT [DF_ResourceTypes_R3] DEFAULT ((0)) NOT NULL,
    [R4]                       BIT             CONSTRAINT [DF_ResourceTypes_R4] DEFAULT ((0)) NOT NULL,
    [R5]                       BIT             CONSTRAINT [DF_ResourceTypes_R5] DEFAULT ((0)) NOT NULL,
    [R6]                       BIT             CONSTRAINT [DF_ResourceTypes_R6] DEFAULT ((0)) NOT NULL,
    [R7]                       BIT             CONSTRAINT [DF_ResourceTypes_R7] DEFAULT ((0)) NOT NULL,
    [R8]                       BIT             CONSTRAINT [DF_ResourceTypes_R8] DEFAULT ((0)) NOT NULL,
    [R9]                       BIT             CONSTRAINT [DF_ResourceTypes_R9] DEFAULT ((0)) NOT NULL,
    [RA]                       BIT             CONSTRAINT [DF_ResourceTypes_RA] DEFAULT ((0)) NOT NULL,
    [RB]                       BIT             CONSTRAINT [DF_ResourceTypes_RB] DEFAULT ((0)) NOT NULL,
    [RC]                       BIT             CONSTRAINT [DF_ResourceTypes_RC] DEFAULT ((0)) NOT NULL,
    [RD]                       BIT             CONSTRAINT [DF_ResourceTypes_RD] DEFAULT ((0)) NOT NULL,
    [RE]                       BIT             CONSTRAINT [DF_ResourceTypes_RE] DEFAULT ((0)) NOT NULL,
    [RF]                       BIT             CONSTRAINT [DF_ResourceTypes_RF] DEFAULT ((0)) NOT NULL,
    [RG]                       BIT             CONSTRAINT [DF_ResourceTypes_RG] DEFAULT ((0)) NOT NULL,
    [RH]                       BIT             CONSTRAINT [DF_ResourceTypes_RH] DEFAULT ((0)) NOT NULL,
    [RI]                       BIT             CONSTRAINT [DF_ResourceTypes_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                       BIT             CONSTRAINT [DF_ResourceTypes_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                       BIT             CONSTRAINT [DF_ResourceTypes_RK] DEFAULT ((0)) NOT NULL,
    [RL]                       BIT             CONSTRAINT [DF_ResourceTypes_RL] DEFAULT ((0)) NOT NULL,
    [RM]                       BIT             CONSTRAINT [DF_ResourceTypes_RM] DEFAULT ((0)) NOT NULL,
    [RN]                       BIT             CONSTRAINT [DF_ResourceTypes_RN] DEFAULT ((0)) NOT NULL,
    [RO]                       BIT             CONSTRAINT [DF_ResourceTypes_RO] DEFAULT ((0)) NOT NULL,
    [RP]                       BIT             CONSTRAINT [DF_ResourceTypes_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                       BIT             CONSTRAINT [DF_ResourceTypes_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                       BIT             CONSTRAINT [DF_ResourceTypes_RR] DEFAULT ((0)) NOT NULL,
    [RS]                       BIT             CONSTRAINT [DF_ResourceTypes_RS] DEFAULT ((0)) NOT NULL,
    [RT]                       BIT             CONSTRAINT [DF_ResourceTypes_RT] DEFAULT ((0)) NOT NULL,
    [RU]                       BIT             CONSTRAINT [DF_ResourceTypes_RU] DEFAULT ((0)) NOT NULL,
    [RV]                       BIT             CONSTRAINT [DF_ResourceTypes_RV] DEFAULT ((0)) NOT NULL,
    [R10]                      BIT             CONSTRAINT [DF_ResourceTypes_R10] DEFAULT ((0)) NOT NULL,
    [R11]                      BIT             CONSTRAINT [DF_ResourceTypes_R11] DEFAULT ((0)) NOT NULL,
    [R12]                      BIT             CONSTRAINT [DF_ResourceTypes_R12] DEFAULT ((0)) NOT NULL,
    [R13]                      BIT             CONSTRAINT [DF_ResourceTypes_R13] DEFAULT ((0)) NOT NULL,
    [R14]                      BIT             CONSTRAINT [DF_ResourceTypes_R14] DEFAULT ((0)) NOT NULL,
    [R15]                      BIT             CONSTRAINT [DF_ResourceTypes_R15] DEFAULT ((0)) NOT NULL,
    [R16]                      BIT             CONSTRAINT [DF_ResourceTypes_R16] DEFAULT ((0)) NOT NULL,
    [R17]                      BIT             CONSTRAINT [DF_ResourceTypes_R17] DEFAULT ((0)) NOT NULL,
    [R18]                      BIT             CONSTRAINT [DF_ResourceTypes_R18] DEFAULT ((0)) NOT NULL,
    [R19]                      BIT             CONSTRAINT [DF_ResourceTypes_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                      BIT             CONSTRAINT [DF_ResourceTypes_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                      BIT             CONSTRAINT [DF_ResourceTypes_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                      BIT             CONSTRAINT [DF_ResourceTypes_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                      BIT             CONSTRAINT [DF_ResourceTypes_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                      BIT             CONSTRAINT [DF_ResourceTypes_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                      BIT             CONSTRAINT [DF_ResourceTypes_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                      BIT             CONSTRAINT [DF_ResourceTypes_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                      BIT             CONSTRAINT [DF_ResourceTypes_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                      BIT             CONSTRAINT [DF_ResourceTypes_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                      BIT             CONSTRAINT [DF_ResourceTypes_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                      BIT             CONSTRAINT [DF_ResourceTypes_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                      BIT             CONSTRAINT [DF_ResourceTypes_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                      BIT             CONSTRAINT [DF_ResourceTypes_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                      BIT             CONSTRAINT [DF_ResourceTypes_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                      BIT             CONSTRAINT [DF_ResourceTypes_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                      BIT             CONSTRAINT [DF_ResourceTypes_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                      BIT             CONSTRAINT [DF_ResourceTypes_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                      BIT             CONSTRAINT [DF_ResourceTypes_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                      BIT             CONSTRAINT [DF_ResourceTypes_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                      BIT             CONSTRAINT [DF_ResourceTypes_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                      BIT             CONSTRAINT [DF_ResourceTypes_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                      BIT             CONSTRAINT [DF_ResourceTypes_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                      BIT             CONSTRAINT [DF_ResourceTypes_R20] DEFAULT ((0)) NOT NULL,
    [R21]                      BIT             CONSTRAINT [DF_ResourceTypes_R21] DEFAULT ((0)) NOT NULL,
    [R22]                      BIT             CONSTRAINT [DF_ResourceTypes_R22] DEFAULT ((0)) NOT NULL,
    [R23]                      BIT             CONSTRAINT [DF_ResourceTypes_R23] DEFAULT ((0)) NOT NULL,
    [R24]                      BIT             CONSTRAINT [DF_ResourceTypes_R24] DEFAULT ((0)) NOT NULL,
    [R25]                      BIT             CONSTRAINT [DF_ResourceTypes_R25] DEFAULT ((0)) NOT NULL,
    [R26]                      BIT             CONSTRAINT [DF_ResourceTypes_R26] DEFAULT ((0)) NOT NULL,
    [R27]                      BIT             CONSTRAINT [DF_ResourceTypes_R27] DEFAULT ((0)) NOT NULL,
    [R28]                      BIT             CONSTRAINT [DF_ResourceTypes_R28] DEFAULT ((0)) NOT NULL,
    [R29]                      BIT             CONSTRAINT [DF_ResourceTypes_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                      BIT             CONSTRAINT [DF_ResourceTypes_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                      BIT             CONSTRAINT [DF_ResourceTypes_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                      BIT             CONSTRAINT [DF_ResourceTypes_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                      BIT             CONSTRAINT [DF_ResourceTypes_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                      BIT             CONSTRAINT [DF_ResourceTypes_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                      BIT             CONSTRAINT [DF_ResourceTypes_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                      BIT             CONSTRAINT [DF_ResourceTypes_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                      BIT             CONSTRAINT [DF_ResourceTypes_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                      BIT             CONSTRAINT [DF_ResourceTypes_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                      BIT             CONSTRAINT [DF_ResourceTypes_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                      BIT             CONSTRAINT [DF_ResourceTypes_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                      BIT             CONSTRAINT [DF_ResourceTypes_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                      BIT             CONSTRAINT [DF_ResourceTypes_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                      BIT             CONSTRAINT [DF_ResourceTypes_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                      BIT             CONSTRAINT [DF_ResourceTypes_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                      BIT             CONSTRAINT [DF_ResourceTypes_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                      BIT             CONSTRAINT [DF_ResourceTypes_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                      BIT             CONSTRAINT [DF_ResourceTypes_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                      BIT             CONSTRAINT [DF_ResourceTypes_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                      BIT             CONSTRAINT [DF_ResourceTypes_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                      BIT             CONSTRAINT [DF_ResourceTypes_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                      BIT             CONSTRAINT [DF_ResourceTypes_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                      BIT             CONSTRAINT [DF_ResourceTypes_R30] DEFAULT ((0)) NOT NULL,
    [R31]                      BIT             CONSTRAINT [DF_ResourceTypes_R31] DEFAULT ((0)) NOT NULL,
    [R32]                      BIT             CONSTRAINT [DF_ResourceTypes_R32] DEFAULT ((0)) NOT NULL,
    [R33]                      BIT             CONSTRAINT [DF_ResourceTypes_R33] DEFAULT ((0)) NOT NULL,
    [R34]                      BIT             CONSTRAINT [DF_ResourceTypes_R34] DEFAULT ((0)) NOT NULL,
    [R35]                      BIT             CONSTRAINT [DF_ResourceTypes_R35] DEFAULT ((0)) NOT NULL,
    [R36]                      BIT             CONSTRAINT [DF_ResourceTypes_R36] DEFAULT ((0)) NOT NULL,
    [R37]                      BIT             CONSTRAINT [DF_ResourceTypes_R37] DEFAULT ((0)) NOT NULL,
    [R38]                      BIT             CONSTRAINT [DF_ResourceTypes_R38] DEFAULT ((0)) NOT NULL,
    [R39]                      BIT             CONSTRAINT [DF_ResourceTypes_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                      BIT             CONSTRAINT [DF_ResourceTypes_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                      BIT             CONSTRAINT [DF_ResourceTypes_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                      BIT             CONSTRAINT [DF_ResourceTypes_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                      BIT             CONSTRAINT [DF_ResourceTypes_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                      BIT             CONSTRAINT [DF_ResourceTypes_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                      BIT             CONSTRAINT [DF_ResourceTypes_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                      BIT             CONSTRAINT [DF_ResourceTypes_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                      BIT             CONSTRAINT [DF_ResourceTypes_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                      BIT             CONSTRAINT [DF_ResourceTypes_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                      BIT             CONSTRAINT [DF_ResourceTypes_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                      BIT             CONSTRAINT [DF_ResourceTypes_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                      BIT             CONSTRAINT [DF_ResourceTypes_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                      BIT             CONSTRAINT [DF_ResourceTypes_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                      BIT             CONSTRAINT [DF_ResourceTypes_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                      BIT             CONSTRAINT [DF_ResourceTypes_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                      BIT             CONSTRAINT [DF_ResourceTypes_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                      BIT             CONSTRAINT [DF_ResourceTypes_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                      BIT             CONSTRAINT [DF_ResourceTypes_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                      BIT             CONSTRAINT [DF_ResourceTypes_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                      BIT             CONSTRAINT [DF_ResourceTypes_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                      BIT             CONSTRAINT [DF_ResourceTypes_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                      BIT             CONSTRAINT [DF_ResourceTypes_R3V] DEFAULT ((0)) NOT NULL,
    [AllowAdd]                 BIT             CONSTRAINT [DF_ResourceTypes_AllowAdd] DEFAULT ((1)) NOT NULL,
    [AllowRemove]              BIT             CONSTRAINT [DF_ResourceTypes_AllowRemove] DEFAULT ((1)) NOT NULL,
    [BlockProvisioning]        BIT             CONSTRAINT [DF_ResourceTypes_BlockProvisioning] DEFAULT ((1)) NOT NULL,
    [DiscardManualAssignments] BIT             CONSTRAINT [DF_ResourceTypes_DiscardManualAssignments] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType]     INT             CONSTRAINT [DF_ResourceTypes_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [Description_L1]           NVARCHAR (1024) NULL,
    [Description_L2]           NVARCHAR (1024) NULL,
    [Description_L3]           NVARCHAR (1024) NULL,
    [Description_L4]           NVARCHAR (1024) NULL,
    [Description_L5]           NVARCHAR (1024) NULL,
    [Description_L6]           NVARCHAR (1024) NULL,
    [Description_L7]           NVARCHAR (1024) NULL,
    [Description_L8]           NVARCHAR (1024) NULL,
    [MaximumInsert]            INT             CONSTRAINT [DF_ResourceTypes_MaximumInsert] DEFAULT ((0)) NOT NULL,
    [MaximumDelete]            INT             CONSTRAINT [DF_ResourceTypes_MaximumDelete] DEFAULT ((0)) NOT NULL,
    [MaximumUpdate]            INT             CONSTRAINT [DF_ResourceTypes_MaximumUpdate] DEFAULT ((0)) NOT NULL,
    [MaximumInsertPercent]     INT             CONSTRAINT [DF_ResourceTypes_MaximumInsertPercent] DEFAULT ((30)) NOT NULL,
    [MaximumDeletePercent]     INT             CONSTRAINT [DF_ResourceTypes_MaximumDeletePercent] DEFAULT ((30)) NOT NULL,
    [MaximumUpdatePercent]     INT             CONSTRAINT [DF_ResourceTypes_MaximumUpdatePercent] DEFAULT ((30)) NOT NULL,
    [Identifier]               VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]           NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]           NVARCHAR (442)  NULL,
    [DisplayName_L3]           NVARCHAR (442)  NULL,
    [DisplayName_L4]           NVARCHAR (442)  NULL,
    [DisplayName_L5]           NVARCHAR (442)  NULL,
    [DisplayName_L6]           NVARCHAR (442)  NULL,
    [DisplayName_L7]           NVARCHAR (442)  NULL,
    [DisplayName_L8]           NVARCHAR (442)  NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypes1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_ResourceTypes_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceTypes1]
    ON [dbo].[tmp_ms_xx_UP_ResourceTypes]([Id] ASC, [ValidTo] DESC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceTypes] ([Id], [Policy_Id], [Category_Id], [SourceEntityType_Id], [TargetEntityType_Id], [ContextRule_Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [AllowAdd], [AllowRemove], [BlockProvisioning], [ApprovalWorkflowType], [Description_L1], [MaximumInsert], [MaximumDelete], [MaximumUpdate], [MaximumInsertPercent], [MaximumDeletePercent], [MaximumUpdatePercent])
        SELECT   [Id],
                 [Policy_Id],
                 [Category_Id],
                 [SourceEntityType_Id],
                 [TargetEntityType_Id],
                 [ContextRule_Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [AllowAdd],
                 [AllowRemove],
                 [BlockProvisioning],
                 [ApprovalWorkflowType],
                 [Description_L1],
                 [MaximumInsert],
                 [MaximumDelete],
                 [MaximumUpdate],
                 [MaximumInsertPercent],
                 [MaximumDeletePercent],
                 [MaximumUpdatePercent]
        FROM     [dbo].[UP_ResourceTypes]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceTypes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceTypes]', N'UP_ResourceTypes';

EXECUTE sp_rename N'[dbo].[UP_ResourceTypes].[tmp_ms_xx_index_IX_ResourceTypes1]', N'IX_ResourceTypes', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypes1]', N'PK_ResourceTypes', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_ResourceTypes_Identifier1]', N'U_ResourceTypes_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_SingleRoleRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_SingleRoleRules] (
    [Id]               BIGINT NOT NULL,
    [Policy_Id]        BIGINT NOT NULL,
    [Type]             INT    CONSTRAINT [DF_SingleRoleRules_Type] DEFAULT ((0)) NOT NULL,
    [Role_Id]          BIGINT NOT NULL,
    [IsDenied]         BIT    CONSTRAINT [DF_SingleRoleRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [CompositeRole_Id] BIGINT NULL,
    [L0]               BIT    CONSTRAINT [DF_SingleRoleRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]               BIT    CONSTRAINT [DF_SingleRoleRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]               BIT    CONSTRAINT [DF_SingleRoleRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]               BIT    CONSTRAINT [DF_SingleRoleRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]               BIT    CONSTRAINT [DF_SingleRoleRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]               BIT    CONSTRAINT [DF_SingleRoleRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]               BIT    CONSTRAINT [DF_SingleRoleRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]               BIT    CONSTRAINT [DF_SingleRoleRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]               BIT    CONSTRAINT [DF_SingleRoleRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]               BIT    CONSTRAINT [DF_SingleRoleRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]               BIT    CONSTRAINT [DF_SingleRoleRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]               BIT    CONSTRAINT [DF_SingleRoleRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]               BIT    CONSTRAINT [DF_SingleRoleRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]               BIT    CONSTRAINT [DF_SingleRoleRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]               BIT    CONSTRAINT [DF_SingleRoleRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]               BIT    CONSTRAINT [DF_SingleRoleRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]               BIT    CONSTRAINT [DF_SingleRoleRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]               BIT    CONSTRAINT [DF_SingleRoleRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]               BIT    CONSTRAINT [DF_SingleRoleRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]               BIT    CONSTRAINT [DF_SingleRoleRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]               BIT    CONSTRAINT [DF_SingleRoleRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]               BIT    CONSTRAINT [DF_SingleRoleRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]               BIT    CONSTRAINT [DF_SingleRoleRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]               BIT    CONSTRAINT [DF_SingleRoleRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]               BIT    CONSTRAINT [DF_SingleRoleRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]               BIT    CONSTRAINT [DF_SingleRoleRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]               BIT    CONSTRAINT [DF_SingleRoleRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]               BIT    CONSTRAINT [DF_SingleRoleRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]               BIT    CONSTRAINT [DF_SingleRoleRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]               BIT    CONSTRAINT [DF_SingleRoleRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]               BIT    CONSTRAINT [DF_SingleRoleRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]               BIT    CONSTRAINT [DF_SingleRoleRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]              BIT    CONSTRAINT [DF_SingleRoleRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]              BIT    CONSTRAINT [DF_SingleRoleRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]              BIT    CONSTRAINT [DF_SingleRoleRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]              BIT    CONSTRAINT [DF_SingleRoleRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]              BIT    CONSTRAINT [DF_SingleRoleRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]              BIT    CONSTRAINT [DF_SingleRoleRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]              BIT    CONSTRAINT [DF_SingleRoleRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]              BIT    CONSTRAINT [DF_SingleRoleRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]              BIT    CONSTRAINT [DF_SingleRoleRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]              BIT    CONSTRAINT [DF_SingleRoleRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]              BIT    CONSTRAINT [DF_SingleRoleRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]              BIT    CONSTRAINT [DF_SingleRoleRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]              BIT    CONSTRAINT [DF_SingleRoleRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]              BIT    CONSTRAINT [DF_SingleRoleRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]              BIT    CONSTRAINT [DF_SingleRoleRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]              BIT    CONSTRAINT [DF_SingleRoleRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]              BIT    CONSTRAINT [DF_SingleRoleRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]              BIT    CONSTRAINT [DF_SingleRoleRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]              BIT    CONSTRAINT [DF_SingleRoleRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]              BIT    CONSTRAINT [DF_SingleRoleRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]              BIT    CONSTRAINT [DF_SingleRoleRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]              BIT    CONSTRAINT [DF_SingleRoleRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]              BIT    CONSTRAINT [DF_SingleRoleRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]              BIT    CONSTRAINT [DF_SingleRoleRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]              BIT    CONSTRAINT [DF_SingleRoleRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]              BIT    CONSTRAINT [DF_SingleRoleRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]              BIT    CONSTRAINT [DF_SingleRoleRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]              BIT    CONSTRAINT [DF_SingleRoleRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]              BIT    CONSTRAINT [DF_SingleRoleRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]              BIT    CONSTRAINT [DF_SingleRoleRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]              BIT    CONSTRAINT [DF_SingleRoleRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]              BIT    CONSTRAINT [DF_SingleRoleRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]              BIT    CONSTRAINT [DF_SingleRoleRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]              BIT    CONSTRAINT [DF_SingleRoleRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]              BIT    CONSTRAINT [DF_SingleRoleRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]              BIT    CONSTRAINT [DF_SingleRoleRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]              BIT    CONSTRAINT [DF_SingleRoleRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]              BIT    CONSTRAINT [DF_SingleRoleRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]              BIT    CONSTRAINT [DF_SingleRoleRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]              BIT    CONSTRAINT [DF_SingleRoleRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]              BIT    CONSTRAINT [DF_SingleRoleRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]              BIT    CONSTRAINT [DF_SingleRoleRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]              BIT    CONSTRAINT [DF_SingleRoleRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]              BIT    CONSTRAINT [DF_SingleRoleRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]              BIT    CONSTRAINT [DF_SingleRoleRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]              BIT    CONSTRAINT [DF_SingleRoleRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]              BIT    CONSTRAINT [DF_SingleRoleRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]              BIT    CONSTRAINT [DF_SingleRoleRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]              BIT    CONSTRAINT [DF_SingleRoleRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]              BIT    CONSTRAINT [DF_SingleRoleRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]              BIT    CONSTRAINT [DF_SingleRoleRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]              BIT    CONSTRAINT [DF_SingleRoleRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]              BIT    CONSTRAINT [DF_SingleRoleRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]              BIT    CONSTRAINT [DF_SingleRoleRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]              BIT    CONSTRAINT [DF_SingleRoleRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]              BIT    CONSTRAINT [DF_SingleRoleRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]              BIT    CONSTRAINT [DF_SingleRoleRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]              BIT    CONSTRAINT [DF_SingleRoleRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]              BIT    CONSTRAINT [DF_SingleRoleRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]              BIT    CONSTRAINT [DF_SingleRoleRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]              BIT    CONSTRAINT [DF_SingleRoleRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]              BIT    CONSTRAINT [DF_SingleRoleRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]              BIT    CONSTRAINT [DF_SingleRoleRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]              BIT    CONSTRAINT [DF_SingleRoleRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]              BIT    CONSTRAINT [DF_SingleRoleRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]              BIT    CONSTRAINT [DF_SingleRoleRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]              BIT    CONSTRAINT [DF_SingleRoleRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]              BIT    CONSTRAINT [DF_SingleRoleRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]              BIT    CONSTRAINT [DF_SingleRoleRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]              BIT    CONSTRAINT [DF_SingleRoleRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]              BIT    CONSTRAINT [DF_SingleRoleRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]              BIT    CONSTRAINT [DF_SingleRoleRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]              BIT    CONSTRAINT [DF_SingleRoleRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]              BIT    CONSTRAINT [DF_SingleRoleRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]              BIT    CONSTRAINT [DF_SingleRoleRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]              BIT    CONSTRAINT [DF_SingleRoleRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]              BIT    CONSTRAINT [DF_SingleRoleRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]              BIT    CONSTRAINT [DF_SingleRoleRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]              BIT    CONSTRAINT [DF_SingleRoleRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]              BIT    CONSTRAINT [DF_SingleRoleRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]              BIT    CONSTRAINT [DF_SingleRoleRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]              BIT    CONSTRAINT [DF_SingleRoleRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]              BIT    CONSTRAINT [DF_SingleRoleRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]              BIT    CONSTRAINT [DF_SingleRoleRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]              BIT    CONSTRAINT [DF_SingleRoleRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]              BIT    CONSTRAINT [DF_SingleRoleRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]              BIT    CONSTRAINT [DF_SingleRoleRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]              BIT    CONSTRAINT [DF_SingleRoleRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]              BIT    CONSTRAINT [DF_SingleRoleRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]              BIT    CONSTRAINT [DF_SingleRoleRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]              BIT    CONSTRAINT [DF_SingleRoleRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]              BIT    CONSTRAINT [DF_SingleRoleRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]              BIT    CONSTRAINT [DF_SingleRoleRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]              BIT    CONSTRAINT [DF_SingleRoleRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]              BIT    CONSTRAINT [DF_SingleRoleRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]              BIT    CONSTRAINT [DF_SingleRoleRules_L3V] DEFAULT ((0)) NOT NULL,
    [D0_Id]            BIGINT NULL,
    [D1_Id]            BIGINT NULL,
    [D2_Id]            BIGINT NULL,
    [D3_Id]            BIGINT NULL,
    [D4_Id]            BIGINT NULL,
    [D5_Id]            BIGINT NULL,
    [D6_Id]            BIGINT NULL,
    [D7_Id]            BIGINT NULL,
    [D8_Id]            BIGINT NULL,
    [D9_Id]            BIGINT NULL,
    [DA_Id]            BIGINT NULL,
    [DB_Id]            BIGINT NULL,
    [DC_Id]            BIGINT NULL,
    [DD_Id]            BIGINT NULL,
    [DE_Id]            BIGINT NULL,
    [DF_Id]            BIGINT NULL,
    [DG_Id]            BIGINT NULL,
    [DH_Id]            BIGINT NULL,
    [DI_Id]            BIGINT NULL,
    [DJ_Id]            BIGINT NULL,
    [DK_Id]            BIGINT NULL,
    [DL_Id]            BIGINT NULL,
    [DM_Id]            BIGINT NULL,
    [DN_Id]            BIGINT NULL,
    [DO_Id]            BIGINT NULL,
    [DP_Id]            BIGINT NULL,
    [DQ_Id]            BIGINT NULL,
    [DR_Id]            BIGINT NULL,
    [DS_Id]            BIGINT NULL,
    [DT_Id]            BIGINT NULL,
    [DU_Id]            BIGINT NULL,
    [DV_Id]            BIGINT NULL,
    [D10_Id]           BIGINT NULL,
    [D11_Id]           BIGINT NULL,
    [D12_Id]           BIGINT NULL,
    [D13_Id]           BIGINT NULL,
    [D14_Id]           BIGINT NULL,
    [D15_Id]           BIGINT NULL,
    [D16_Id]           BIGINT NULL,
    [D17_Id]           BIGINT NULL,
    [D18_Id]           BIGINT NULL,
    [D19_Id]           BIGINT NULL,
    [D1A_Id]           BIGINT NULL,
    [D1B_Id]           BIGINT NULL,
    [D1C_Id]           BIGINT NULL,
    [D1D_Id]           BIGINT NULL,
    [D1E_Id]           BIGINT NULL,
    [D1F_Id]           BIGINT NULL,
    [D1G_Id]           BIGINT NULL,
    [D1H_Id]           BIGINT NULL,
    [D1I_Id]           BIGINT NULL,
    [D1J_Id]           BIGINT NULL,
    [D1K_Id]           BIGINT NULL,
    [D1L_Id]           BIGINT NULL,
    [D1M_Id]           BIGINT NULL,
    [D1N_Id]           BIGINT NULL,
    [D1O_Id]           BIGINT NULL,
    [D1P_Id]           BIGINT NULL,
    [D1Q_Id]           BIGINT NULL,
    [D1R_Id]           BIGINT NULL,
    [D1S_Id]           BIGINT NULL,
    [D1T_Id]           BIGINT NULL,
    [D1U_Id]           BIGINT NULL,
    [D1V_Id]           BIGINT NULL,
    [D20_Id]           BIGINT NULL,
    [D21_Id]           BIGINT NULL,
    [D22_Id]           BIGINT NULL,
    [D23_Id]           BIGINT NULL,
    [D24_Id]           BIGINT NULL,
    [D25_Id]           BIGINT NULL,
    [D26_Id]           BIGINT NULL,
    [D27_Id]           BIGINT NULL,
    [D28_Id]           BIGINT NULL,
    [D29_Id]           BIGINT NULL,
    [D2A_Id]           BIGINT NULL,
    [D2B_Id]           BIGINT NULL,
    [D2C_Id]           BIGINT NULL,
    [D2D_Id]           BIGINT NULL,
    [D2E_Id]           BIGINT NULL,
    [D2F_Id]           BIGINT NULL,
    [D2G_Id]           BIGINT NULL,
    [D2H_Id]           BIGINT NULL,
    [D2I_Id]           BIGINT NULL,
    [D2J_Id]           BIGINT NULL,
    [D2K_Id]           BIGINT NULL,
    [D2L_Id]           BIGINT NULL,
    [D2M_Id]           BIGINT NULL,
    [D2N_Id]           BIGINT NULL,
    [D2O_Id]           BIGINT NULL,
    [D2P_Id]           BIGINT NULL,
    [D2Q_Id]           BIGINT NULL,
    [D2R_Id]           BIGINT NULL,
    [D2S_Id]           BIGINT NULL,
    [D2T_Id]           BIGINT NULL,
    [D2U_Id]           BIGINT NULL,
    [D2V_Id]           BIGINT NULL,
    [D30_Id]           BIGINT NULL,
    [D31_Id]           BIGINT NULL,
    [D32_Id]           BIGINT NULL,
    [D33_Id]           BIGINT NULL,
    [D34_Id]           BIGINT NULL,
    [D35_Id]           BIGINT NULL,
    [D36_Id]           BIGINT NULL,
    [D37_Id]           BIGINT NULL,
    [D38_Id]           BIGINT NULL,
    [D39_Id]           BIGINT NULL,
    [D3A_Id]           BIGINT NULL,
    [D3B_Id]           BIGINT NULL,
    [D3C_Id]           BIGINT NULL,
    [D3D_Id]           BIGINT NULL,
    [D3E_Id]           BIGINT NULL,
    [D3F_Id]           BIGINT NULL,
    [D3G_Id]           BIGINT NULL,
    [D3H_Id]           BIGINT NULL,
    [D3I_Id]           BIGINT NULL,
    [D3J_Id]           BIGINT NULL,
    [D3K_Id]           BIGINT NULL,
    [D3L_Id]           BIGINT NULL,
    [D3M_Id]           BIGINT NULL,
    [D3N_Id]           BIGINT NULL,
    [D3O_Id]           BIGINT NULL,
    [D3P_Id]           BIGINT NULL,
    [D3Q_Id]           BIGINT NULL,
    [D3R_Id]           BIGINT NULL,
    [D3S_Id]           BIGINT NULL,
    [D3T_Id]           BIGINT NULL,
    [D3U_Id]           BIGINT NULL,
    [D3V_Id]           BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_SingleRoleRules1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_SingleRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_SingleRoleRules] ([Id], [Policy_Id], [Type], [Role_Id], [IsDenied], [CompositeRole_Id], [D0_Id], [L0], [D1_Id], [L1], [D2_Id], [L2], [D3_Id], [L3], [D4_Id], [L4], [D5_Id], [L5], [D6_Id], [L6], [D7_Id], [L7])
        SELECT   [Id],
                 [Policy_Id],
                 [Type],
                 [Role_Id],
                 [IsDenied],
                 [CompositeRole_Id],
                 [D0_Id],
                 [L0],
                 [D1_Id],
                 [L1],
                 [D2_Id],
                 [L2],
                 [D3_Id],
                 [L3],
                 [D4_Id],
                 [L4],
                 [D5_Id],
                 [L5],
                 [D6_Id],
                 [L6],
                 [D7_Id],
                 [L7]
        FROM     [dbo].[UP_SingleRoleRules]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_SingleRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_SingleRoleRules]', N'UP_SingleRoleRules';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SingleRoleRules1]', N'PK_SingleRoleRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column [dbo].[UP_SingleRoles].[GroupByDimension0] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[GroupByDimension1] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[GroupByDimension2] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[GroupByDimension3] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[GroupByDimension4] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[GroupByDimension5] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[GroupByDimension6] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[GroupByDimension7] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension0] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension1] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension2] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension3] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension4] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension5] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension6] is being dropped, data loss could occur.

The column [dbo].[UP_SingleRoles].[UseDimension7] is being dropped, data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_SingleRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_SingleRoles] (
    [Id]                   BIGINT          NOT NULL,
    [Policy_Id]            BIGINT          NOT NULL,
    [EntityType_Id]        BIGINT          NOT NULL,
    [Category_Id]          BIGINT          NULL,
    [ValidFrom]            DATETIME2 (2)   CONSTRAINT [DF_SingleRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]              DATETIME2 (2)   CONSTRAINT [DF_SingleRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [P0]                   BIT             CONSTRAINT [DF_SingleRoles_P0] DEFAULT ((0)) NOT NULL,
    [P1]                   BIT             CONSTRAINT [DF_SingleRoles_P1] DEFAULT ((0)) NOT NULL,
    [P2]                   BIT             CONSTRAINT [DF_SingleRoles_P2] DEFAULT ((0)) NOT NULL,
    [P3]                   BIT             CONSTRAINT [DF_SingleRoles_P3] DEFAULT ((0)) NOT NULL,
    [P4]                   BIT             CONSTRAINT [DF_SingleRoles_P4] DEFAULT ((0)) NOT NULL,
    [P5]                   BIT             CONSTRAINT [DF_SingleRoles_P5] DEFAULT ((0)) NOT NULL,
    [P6]                   BIT             CONSTRAINT [DF_SingleRoles_P6] DEFAULT ((0)) NOT NULL,
    [P7]                   BIT             CONSTRAINT [DF_SingleRoles_P7] DEFAULT ((0)) NOT NULL,
    [P8]                   BIT             CONSTRAINT [DF_SingleRoles_P8] DEFAULT ((0)) NOT NULL,
    [P9]                   BIT             CONSTRAINT [DF_SingleRoles_P9] DEFAULT ((0)) NOT NULL,
    [PA]                   BIT             CONSTRAINT [DF_SingleRoles_PA] DEFAULT ((0)) NOT NULL,
    [PB]                   BIT             CONSTRAINT [DF_SingleRoles_PB] DEFAULT ((0)) NOT NULL,
    [PC]                   BIT             CONSTRAINT [DF_SingleRoles_PC] DEFAULT ((0)) NOT NULL,
    [PD]                   BIT             CONSTRAINT [DF_SingleRoles_PD] DEFAULT ((0)) NOT NULL,
    [PE]                   BIT             CONSTRAINT [DF_SingleRoles_PE] DEFAULT ((0)) NOT NULL,
    [PF]                   BIT             CONSTRAINT [DF_SingleRoles_PF] DEFAULT ((0)) NOT NULL,
    [PG]                   BIT             CONSTRAINT [DF_SingleRoles_PG] DEFAULT ((0)) NOT NULL,
    [PH]                   BIT             CONSTRAINT [DF_SingleRoles_PH] DEFAULT ((0)) NOT NULL,
    [PI]                   BIT             CONSTRAINT [DF_SingleRoles_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                   BIT             CONSTRAINT [DF_SingleRoles_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                   BIT             CONSTRAINT [DF_SingleRoles_PK] DEFAULT ((0)) NOT NULL,
    [PL]                   BIT             CONSTRAINT [DF_SingleRoles_PL] DEFAULT ((0)) NOT NULL,
    [PM]                   BIT             CONSTRAINT [DF_SingleRoles_PM] DEFAULT ((0)) NOT NULL,
    [PN]                   BIT             CONSTRAINT [DF_SingleRoles_PN] DEFAULT ((0)) NOT NULL,
    [PO]                   BIT             CONSTRAINT [DF_SingleRoles_PO] DEFAULT ((0)) NOT NULL,
    [PP]                   BIT             CONSTRAINT [DF_SingleRoles_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                   BIT             CONSTRAINT [DF_SingleRoles_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                   BIT             CONSTRAINT [DF_SingleRoles_PR] DEFAULT ((0)) NOT NULL,
    [PS]                   BIT             CONSTRAINT [DF_SingleRoles_PS] DEFAULT ((0)) NOT NULL,
    [PT]                   BIT             CONSTRAINT [DF_SingleRoles_PT] DEFAULT ((0)) NOT NULL,
    [PU]                   BIT             CONSTRAINT [DF_SingleRoles_PU] DEFAULT ((0)) NOT NULL,
    [PV]                   BIT             CONSTRAINT [DF_SingleRoles_PV] DEFAULT ((0)) NOT NULL,
    [P10]                  BIT             CONSTRAINT [DF_SingleRoles_P10] DEFAULT ((0)) NOT NULL,
    [P11]                  BIT             CONSTRAINT [DF_SingleRoles_P11] DEFAULT ((0)) NOT NULL,
    [P12]                  BIT             CONSTRAINT [DF_SingleRoles_P12] DEFAULT ((0)) NOT NULL,
    [P13]                  BIT             CONSTRAINT [DF_SingleRoles_P13] DEFAULT ((0)) NOT NULL,
    [P14]                  BIT             CONSTRAINT [DF_SingleRoles_P14] DEFAULT ((0)) NOT NULL,
    [P15]                  BIT             CONSTRAINT [DF_SingleRoles_P15] DEFAULT ((0)) NOT NULL,
    [P16]                  BIT             CONSTRAINT [DF_SingleRoles_P16] DEFAULT ((0)) NOT NULL,
    [P17]                  BIT             CONSTRAINT [DF_SingleRoles_P17] DEFAULT ((0)) NOT NULL,
    [P18]                  BIT             CONSTRAINT [DF_SingleRoles_P18] DEFAULT ((0)) NOT NULL,
    [P19]                  BIT             CONSTRAINT [DF_SingleRoles_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                  BIT             CONSTRAINT [DF_SingleRoles_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                  BIT             CONSTRAINT [DF_SingleRoles_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                  BIT             CONSTRAINT [DF_SingleRoles_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                  BIT             CONSTRAINT [DF_SingleRoles_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                  BIT             CONSTRAINT [DF_SingleRoles_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                  BIT             CONSTRAINT [DF_SingleRoles_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                  BIT             CONSTRAINT [DF_SingleRoles_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                  BIT             CONSTRAINT [DF_SingleRoles_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                  BIT             CONSTRAINT [DF_SingleRoles_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                  BIT             CONSTRAINT [DF_SingleRoles_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                  BIT             CONSTRAINT [DF_SingleRoles_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                  BIT             CONSTRAINT [DF_SingleRoles_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                  BIT             CONSTRAINT [DF_SingleRoles_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                  BIT             CONSTRAINT [DF_SingleRoles_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                  BIT             CONSTRAINT [DF_SingleRoles_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                  BIT             CONSTRAINT [DF_SingleRoles_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                  BIT             CONSTRAINT [DF_SingleRoles_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                  BIT             CONSTRAINT [DF_SingleRoles_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                  BIT             CONSTRAINT [DF_SingleRoles_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                  BIT             CONSTRAINT [DF_SingleRoles_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                  BIT             CONSTRAINT [DF_SingleRoles_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                  BIT             CONSTRAINT [DF_SingleRoles_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                  BIT             CONSTRAINT [DF_SingleRoles_P20] DEFAULT ((0)) NOT NULL,
    [P21]                  BIT             CONSTRAINT [DF_SingleRoles_P21] DEFAULT ((0)) NOT NULL,
    [P22]                  BIT             CONSTRAINT [DF_SingleRoles_P22] DEFAULT ((0)) NOT NULL,
    [P23]                  BIT             CONSTRAINT [DF_SingleRoles_P23] DEFAULT ((0)) NOT NULL,
    [P24]                  BIT             CONSTRAINT [DF_SingleRoles_P24] DEFAULT ((0)) NOT NULL,
    [P25]                  BIT             CONSTRAINT [DF_SingleRoles_P25] DEFAULT ((0)) NOT NULL,
    [P26]                  BIT             CONSTRAINT [DF_SingleRoles_P26] DEFAULT ((0)) NOT NULL,
    [P27]                  BIT             CONSTRAINT [DF_SingleRoles_P27] DEFAULT ((0)) NOT NULL,
    [P28]                  BIT             CONSTRAINT [DF_SingleRoles_P28] DEFAULT ((0)) NOT NULL,
    [P29]                  BIT             CONSTRAINT [DF_SingleRoles_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                  BIT             CONSTRAINT [DF_SingleRoles_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                  BIT             CONSTRAINT [DF_SingleRoles_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                  BIT             CONSTRAINT [DF_SingleRoles_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                  BIT             CONSTRAINT [DF_SingleRoles_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                  BIT             CONSTRAINT [DF_SingleRoles_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                  BIT             CONSTRAINT [DF_SingleRoles_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                  BIT             CONSTRAINT [DF_SingleRoles_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                  BIT             CONSTRAINT [DF_SingleRoles_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                  BIT             CONSTRAINT [DF_SingleRoles_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                  BIT             CONSTRAINT [DF_SingleRoles_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                  BIT             CONSTRAINT [DF_SingleRoles_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                  BIT             CONSTRAINT [DF_SingleRoles_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                  BIT             CONSTRAINT [DF_SingleRoles_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                  BIT             CONSTRAINT [DF_SingleRoles_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                  BIT             CONSTRAINT [DF_SingleRoles_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                  BIT             CONSTRAINT [DF_SingleRoles_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                  BIT             CONSTRAINT [DF_SingleRoles_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                  BIT             CONSTRAINT [DF_SingleRoles_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                  BIT             CONSTRAINT [DF_SingleRoles_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                  BIT             CONSTRAINT [DF_SingleRoles_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                  BIT             CONSTRAINT [DF_SingleRoles_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                  BIT             CONSTRAINT [DF_SingleRoles_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                  BIT             CONSTRAINT [DF_SingleRoles_P30] DEFAULT ((0)) NOT NULL,
    [P31]                  BIT             CONSTRAINT [DF_SingleRoles_P31] DEFAULT ((0)) NOT NULL,
    [P32]                  BIT             CONSTRAINT [DF_SingleRoles_P32] DEFAULT ((0)) NOT NULL,
    [P33]                  BIT             CONSTRAINT [DF_SingleRoles_P33] DEFAULT ((0)) NOT NULL,
    [P34]                  BIT             CONSTRAINT [DF_SingleRoles_P34] DEFAULT ((0)) NOT NULL,
    [P35]                  BIT             CONSTRAINT [DF_SingleRoles_P35] DEFAULT ((0)) NOT NULL,
    [P36]                  BIT             CONSTRAINT [DF_SingleRoles_P36] DEFAULT ((0)) NOT NULL,
    [P37]                  BIT             CONSTRAINT [DF_SingleRoles_P37] DEFAULT ((0)) NOT NULL,
    [P38]                  BIT             CONSTRAINT [DF_SingleRoles_P38] DEFAULT ((0)) NOT NULL,
    [P39]                  BIT             CONSTRAINT [DF_SingleRoles_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                  BIT             CONSTRAINT [DF_SingleRoles_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                  BIT             CONSTRAINT [DF_SingleRoles_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                  BIT             CONSTRAINT [DF_SingleRoles_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                  BIT             CONSTRAINT [DF_SingleRoles_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                  BIT             CONSTRAINT [DF_SingleRoles_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                  BIT             CONSTRAINT [DF_SingleRoles_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                  BIT             CONSTRAINT [DF_SingleRoles_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                  BIT             CONSTRAINT [DF_SingleRoles_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                  BIT             CONSTRAINT [DF_SingleRoles_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                  BIT             CONSTRAINT [DF_SingleRoles_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                  BIT             CONSTRAINT [DF_SingleRoles_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                  BIT             CONSTRAINT [DF_SingleRoles_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                  BIT             CONSTRAINT [DF_SingleRoles_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                  BIT             CONSTRAINT [DF_SingleRoles_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                  BIT             CONSTRAINT [DF_SingleRoles_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                  BIT             CONSTRAINT [DF_SingleRoles_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                  BIT             CONSTRAINT [DF_SingleRoles_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                  BIT             CONSTRAINT [DF_SingleRoles_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                  BIT             CONSTRAINT [DF_SingleRoles_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                  BIT             CONSTRAINT [DF_SingleRoles_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                  BIT             CONSTRAINT [DF_SingleRoles_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                  BIT             CONSTRAINT [DF_SingleRoles_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                   BIT             CONSTRAINT [DF_SingleRoles_R0] DEFAULT ((0)) NOT NULL,
    [R1]                   BIT             CONSTRAINT [DF_SingleRoles_R1] DEFAULT ((0)) NOT NULL,
    [R2]                   BIT             CONSTRAINT [DF_SingleRoles_R2] DEFAULT ((0)) NOT NULL,
    [R3]                   BIT             CONSTRAINT [DF_SingleRoles_R3] DEFAULT ((0)) NOT NULL,
    [R4]                   BIT             CONSTRAINT [DF_SingleRoles_R4] DEFAULT ((0)) NOT NULL,
    [R5]                   BIT             CONSTRAINT [DF_SingleRoles_R5] DEFAULT ((0)) NOT NULL,
    [R6]                   BIT             CONSTRAINT [DF_SingleRoles_R6] DEFAULT ((0)) NOT NULL,
    [R7]                   BIT             CONSTRAINT [DF_SingleRoles_R7] DEFAULT ((0)) NOT NULL,
    [R8]                   BIT             CONSTRAINT [DF_SingleRoles_R8] DEFAULT ((0)) NOT NULL,
    [R9]                   BIT             CONSTRAINT [DF_SingleRoles_R9] DEFAULT ((0)) NOT NULL,
    [RA]                   BIT             CONSTRAINT [DF_SingleRoles_RA] DEFAULT ((0)) NOT NULL,
    [RB]                   BIT             CONSTRAINT [DF_SingleRoles_RB] DEFAULT ((0)) NOT NULL,
    [RC]                   BIT             CONSTRAINT [DF_SingleRoles_RC] DEFAULT ((0)) NOT NULL,
    [RD]                   BIT             CONSTRAINT [DF_SingleRoles_RD] DEFAULT ((0)) NOT NULL,
    [RE]                   BIT             CONSTRAINT [DF_SingleRoles_RE] DEFAULT ((0)) NOT NULL,
    [RF]                   BIT             CONSTRAINT [DF_SingleRoles_RF] DEFAULT ((0)) NOT NULL,
    [RG]                   BIT             CONSTRAINT [DF_SingleRoles_RG] DEFAULT ((0)) NOT NULL,
    [RH]                   BIT             CONSTRAINT [DF_SingleRoles_RH] DEFAULT ((0)) NOT NULL,
    [RI]                   BIT             CONSTRAINT [DF_SingleRoles_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                   BIT             CONSTRAINT [DF_SingleRoles_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                   BIT             CONSTRAINT [DF_SingleRoles_RK] DEFAULT ((0)) NOT NULL,
    [RL]                   BIT             CONSTRAINT [DF_SingleRoles_RL] DEFAULT ((0)) NOT NULL,
    [RM]                   BIT             CONSTRAINT [DF_SingleRoles_RM] DEFAULT ((0)) NOT NULL,
    [RN]                   BIT             CONSTRAINT [DF_SingleRoles_RN] DEFAULT ((0)) NOT NULL,
    [RO]                   BIT             CONSTRAINT [DF_SingleRoles_RO] DEFAULT ((0)) NOT NULL,
    [RP]                   BIT             CONSTRAINT [DF_SingleRoles_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                   BIT             CONSTRAINT [DF_SingleRoles_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                   BIT             CONSTRAINT [DF_SingleRoles_RR] DEFAULT ((0)) NOT NULL,
    [RS]                   BIT             CONSTRAINT [DF_SingleRoles_RS] DEFAULT ((0)) NOT NULL,
    [RT]                   BIT             CONSTRAINT [DF_SingleRoles_RT] DEFAULT ((0)) NOT NULL,
    [RU]                   BIT             CONSTRAINT [DF_SingleRoles_RU] DEFAULT ((0)) NOT NULL,
    [RV]                   BIT             CONSTRAINT [DF_SingleRoles_RV] DEFAULT ((0)) NOT NULL,
    [R10]                  BIT             CONSTRAINT [DF_SingleRoles_R10] DEFAULT ((0)) NOT NULL,
    [R11]                  BIT             CONSTRAINT [DF_SingleRoles_R11] DEFAULT ((0)) NOT NULL,
    [R12]                  BIT             CONSTRAINT [DF_SingleRoles_R12] DEFAULT ((0)) NOT NULL,
    [R13]                  BIT             CONSTRAINT [DF_SingleRoles_R13] DEFAULT ((0)) NOT NULL,
    [R14]                  BIT             CONSTRAINT [DF_SingleRoles_R14] DEFAULT ((0)) NOT NULL,
    [R15]                  BIT             CONSTRAINT [DF_SingleRoles_R15] DEFAULT ((0)) NOT NULL,
    [R16]                  BIT             CONSTRAINT [DF_SingleRoles_R16] DEFAULT ((0)) NOT NULL,
    [R17]                  BIT             CONSTRAINT [DF_SingleRoles_R17] DEFAULT ((0)) NOT NULL,
    [R18]                  BIT             CONSTRAINT [DF_SingleRoles_R18] DEFAULT ((0)) NOT NULL,
    [R19]                  BIT             CONSTRAINT [DF_SingleRoles_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                  BIT             CONSTRAINT [DF_SingleRoles_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                  BIT             CONSTRAINT [DF_SingleRoles_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                  BIT             CONSTRAINT [DF_SingleRoles_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                  BIT             CONSTRAINT [DF_SingleRoles_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                  BIT             CONSTRAINT [DF_SingleRoles_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                  BIT             CONSTRAINT [DF_SingleRoles_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                  BIT             CONSTRAINT [DF_SingleRoles_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                  BIT             CONSTRAINT [DF_SingleRoles_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                  BIT             CONSTRAINT [DF_SingleRoles_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                  BIT             CONSTRAINT [DF_SingleRoles_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                  BIT             CONSTRAINT [DF_SingleRoles_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                  BIT             CONSTRAINT [DF_SingleRoles_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                  BIT             CONSTRAINT [DF_SingleRoles_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                  BIT             CONSTRAINT [DF_SingleRoles_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                  BIT             CONSTRAINT [DF_SingleRoles_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                  BIT             CONSTRAINT [DF_SingleRoles_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                  BIT             CONSTRAINT [DF_SingleRoles_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                  BIT             CONSTRAINT [DF_SingleRoles_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                  BIT             CONSTRAINT [DF_SingleRoles_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                  BIT             CONSTRAINT [DF_SingleRoles_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                  BIT             CONSTRAINT [DF_SingleRoles_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                  BIT             CONSTRAINT [DF_SingleRoles_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                  BIT             CONSTRAINT [DF_SingleRoles_R20] DEFAULT ((0)) NOT NULL,
    [R21]                  BIT             CONSTRAINT [DF_SingleRoles_R21] DEFAULT ((0)) NOT NULL,
    [R22]                  BIT             CONSTRAINT [DF_SingleRoles_R22] DEFAULT ((0)) NOT NULL,
    [R23]                  BIT             CONSTRAINT [DF_SingleRoles_R23] DEFAULT ((0)) NOT NULL,
    [R24]                  BIT             CONSTRAINT [DF_SingleRoles_R24] DEFAULT ((0)) NOT NULL,
    [R25]                  BIT             CONSTRAINT [DF_SingleRoles_R25] DEFAULT ((0)) NOT NULL,
    [R26]                  BIT             CONSTRAINT [DF_SingleRoles_R26] DEFAULT ((0)) NOT NULL,
    [R27]                  BIT             CONSTRAINT [DF_SingleRoles_R27] DEFAULT ((0)) NOT NULL,
    [R28]                  BIT             CONSTRAINT [DF_SingleRoles_R28] DEFAULT ((0)) NOT NULL,
    [R29]                  BIT             CONSTRAINT [DF_SingleRoles_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                  BIT             CONSTRAINT [DF_SingleRoles_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                  BIT             CONSTRAINT [DF_SingleRoles_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                  BIT             CONSTRAINT [DF_SingleRoles_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                  BIT             CONSTRAINT [DF_SingleRoles_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                  BIT             CONSTRAINT [DF_SingleRoles_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                  BIT             CONSTRAINT [DF_SingleRoles_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                  BIT             CONSTRAINT [DF_SingleRoles_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                  BIT             CONSTRAINT [DF_SingleRoles_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                  BIT             CONSTRAINT [DF_SingleRoles_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                  BIT             CONSTRAINT [DF_SingleRoles_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                  BIT             CONSTRAINT [DF_SingleRoles_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                  BIT             CONSTRAINT [DF_SingleRoles_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                  BIT             CONSTRAINT [DF_SingleRoles_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                  BIT             CONSTRAINT [DF_SingleRoles_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                  BIT             CONSTRAINT [DF_SingleRoles_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                  BIT             CONSTRAINT [DF_SingleRoles_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                  BIT             CONSTRAINT [DF_SingleRoles_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                  BIT             CONSTRAINT [DF_SingleRoles_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                  BIT             CONSTRAINT [DF_SingleRoles_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                  BIT             CONSTRAINT [DF_SingleRoles_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                  BIT             CONSTRAINT [DF_SingleRoles_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                  BIT             CONSTRAINT [DF_SingleRoles_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                  BIT             CONSTRAINT [DF_SingleRoles_R30] DEFAULT ((0)) NOT NULL,
    [R31]                  BIT             CONSTRAINT [DF_SingleRoles_R31] DEFAULT ((0)) NOT NULL,
    [R32]                  BIT             CONSTRAINT [DF_SingleRoles_R32] DEFAULT ((0)) NOT NULL,
    [R33]                  BIT             CONSTRAINT [DF_SingleRoles_R33] DEFAULT ((0)) NOT NULL,
    [R34]                  BIT             CONSTRAINT [DF_SingleRoles_R34] DEFAULT ((0)) NOT NULL,
    [R35]                  BIT             CONSTRAINT [DF_SingleRoles_R35] DEFAULT ((0)) NOT NULL,
    [R36]                  BIT             CONSTRAINT [DF_SingleRoles_R36] DEFAULT ((0)) NOT NULL,
    [R37]                  BIT             CONSTRAINT [DF_SingleRoles_R37] DEFAULT ((0)) NOT NULL,
    [R38]                  BIT             CONSTRAINT [DF_SingleRoles_R38] DEFAULT ((0)) NOT NULL,
    [R39]                  BIT             CONSTRAINT [DF_SingleRoles_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                  BIT             CONSTRAINT [DF_SingleRoles_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                  BIT             CONSTRAINT [DF_SingleRoles_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                  BIT             CONSTRAINT [DF_SingleRoles_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                  BIT             CONSTRAINT [DF_SingleRoles_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                  BIT             CONSTRAINT [DF_SingleRoles_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                  BIT             CONSTRAINT [DF_SingleRoles_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                  BIT             CONSTRAINT [DF_SingleRoles_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                  BIT             CONSTRAINT [DF_SingleRoles_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                  BIT             CONSTRAINT [DF_SingleRoles_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                  BIT             CONSTRAINT [DF_SingleRoles_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                  BIT             CONSTRAINT [DF_SingleRoles_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                  BIT             CONSTRAINT [DF_SingleRoles_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                  BIT             CONSTRAINT [DF_SingleRoles_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                  BIT             CONSTRAINT [DF_SingleRoles_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                  BIT             CONSTRAINT [DF_SingleRoles_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                  BIT             CONSTRAINT [DF_SingleRoles_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                  BIT             CONSTRAINT [DF_SingleRoles_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                  BIT             CONSTRAINT [DF_SingleRoles_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                  BIT             CONSTRAINT [DF_SingleRoles_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                  BIT             CONSTRAINT [DF_SingleRoles_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                  BIT             CONSTRAINT [DF_SingleRoles_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                  BIT             CONSTRAINT [DF_SingleRoles_R3V] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType] INT             CONSTRAINT [DF_SingleRoles_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [Identifier]           VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]       NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]       NVARCHAR (442)  NULL,
    [DisplayName_L3]       NVARCHAR (442)  NULL,
    [DisplayName_L4]       NVARCHAR (442)  NULL,
    [DisplayName_L5]       NVARCHAR (442)  NULL,
    [DisplayName_L6]       NVARCHAR (442)  NULL,
    [DisplayName_L7]       NVARCHAR (442)  NULL,
    [DisplayName_L8]       NVARCHAR (442)  NULL,
    [Description_L1]       NVARCHAR (1024) NULL,
    [Description_L2]       NVARCHAR (1024) NULL,
    [Description_L3]       NVARCHAR (1024) NULL,
    [Description_L4]       NVARCHAR (1024) NULL,
    [Description_L5]       NVARCHAR (1024) NULL,
    [Description_L6]       NVARCHAR (1024) NULL,
    [Description_L7]       NVARCHAR (1024) NULL,
    [Description_L8]       NVARCHAR (1024) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_SingleRoles1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_SingleRoles_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_SingleRoles1]
    ON [dbo].[tmp_ms_xx_UP_SingleRoles]([Id] ASC, [ValidTo] DESC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_SingleRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_SingleRoles] ([Id], [Policy_Id], [EntityType_Id], [Category_Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [ApprovalWorkflowType], [Description_L1])
        SELECT   [Id],
                 [Policy_Id],
                 [EntityType_Id],
                 [Category_Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [ApprovalWorkflowType],
                 [Description_L1]
        FROM     [dbo].[UP_SingleRoles]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_SingleRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_SingleRoles]', N'UP_SingleRoles';

EXECUTE sp_rename N'[dbo].[UP_SingleRoles].[tmp_ms_xx_index_IX_SingleRoles1]', N'IX_SingleRoles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SingleRoles1]', N'PK_SingleRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_SingleRoles_Identifier1]', N'U_SingleRoles_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UR_ResourceChanges]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UR_ResourceChanges] (
    [JobInstanceId]   BIGINT          NOT NULL,
    [ChangeOperation] INT             NOT NULL,
    [Resource_Id]     BIGINT          NOT NULL,
    [Type]            BIGINT          NOT NULL,
    [ValidFrom]       DATETIME2 (2)   NULL,
    [ValidTo]         DATETIME2 (2)   NULL,
    [DisplayName_L1]  NVARCHAR (442)  NULL,
    [C0]              NVARCHAR (4000) NULL,
    [C1]              NVARCHAR (4000) NULL,
    [C2]              NVARCHAR (4000) NULL,
    [C3]              NVARCHAR (4000) NULL,
    [C4]              NVARCHAR (442)  NULL,
    [C5]              NVARCHAR (442)  NULL,
    [C6]              NVARCHAR (442)  NULL,
    [C7]              NVARCHAR (442)  NULL,
    [C8]              NVARCHAR (442)  NULL,
    [C9]              NVARCHAR (442)  NULL,
    [CA]              NVARCHAR (442)  NULL,
    [CB]              NVARCHAR (442)  NULL,
    [CC]              NVARCHAR (442)  NULL,
    [CD]              NVARCHAR (442)  NULL,
    [CE]              NVARCHAR (442)  NULL,
    [I40]             BIGINT          NULL,
    [I41]             BIGINT          NULL,
    [CF]              NVARCHAR (442)  NULL,
    [CG]              NVARCHAR (442)  NULL,
    [CH]              NVARCHAR (442)  NULL,
    [CI]              NVARCHAR (442)  NULL,
    [CJ]              NVARCHAR (442)  NULL,
    [CK]              NVARCHAR (442)  NULL,
    [CL]              NVARCHAR (442)  NULL,
    [CM]              NVARCHAR (442)  NULL,
    [CN]              NVARCHAR (442)  NULL,
    [CO]              NVARCHAR (442)  NULL,
    [CP]              NVARCHAR (442)  NULL,
    [CQ]              NVARCHAR (442)  NULL,
    [CR]              NVARCHAR (442)  NULL,
    [CS]              NVARCHAR (442)  NULL,
    [CT]              NVARCHAR (442)  NULL,
    [I42]             BIGINT          NULL,
    [I43]             BIGINT          NULL,
    [CU]              NVARCHAR (442)  NULL,
    [CV]              NVARCHAR (442)  NULL,
    [C10]             NVARCHAR (442)  NULL,
    [C11]             NVARCHAR (442)  NULL,
    [C12]             NVARCHAR (442)  NULL,
    [C13]             NVARCHAR (442)  NULL,
    [C14]             NVARCHAR (442)  NULL,
    [C15]             NVARCHAR (442)  NULL,
    [C16]             NVARCHAR (442)  NULL,
    [C17]             NVARCHAR (442)  NULL,
    [C18]             NVARCHAR (442)  NULL,
    [C19]             NVARCHAR (442)  NULL,
    [C1A]             NVARCHAR (442)  NULL,
    [C1B]             NVARCHAR (442)  NULL,
    [C1C]             NVARCHAR (442)  NULL,
    [I44]             BIGINT          NULL,
    [I45]             BIGINT          NULL,
    [C1D]             NVARCHAR (442)  NULL,
    [C1E]             NVARCHAR (442)  NULL,
    [C1F]             NVARCHAR (442)  NULL,
    [C1G]             NVARCHAR (442)  NULL,
    [C1H]             NVARCHAR (442)  NULL,
    [C1I]             NVARCHAR (442)  NULL,
    [C1J]             NVARCHAR (442)  NULL,
    [C1K]             NVARCHAR (442)  NULL,
    [C1L]             NVARCHAR (442)  NULL,
    [C1M]             NVARCHAR (442)  NULL,
    [C1N]             NVARCHAR (442)  NULL,
    [C1O]             NVARCHAR (442)  NULL,
    [C1P]             NVARCHAR (442)  NULL,
    [C1Q]             NVARCHAR (442)  NULL,
    [C1R]             NVARCHAR (442)  NULL,
    [I46]             BIGINT          NULL,
    [I47]             BIGINT          NULL,
    [C1S]             NVARCHAR (442)  NULL,
    [C1T]             NVARCHAR (442)  NULL,
    [C1U]             NVARCHAR (442)  NULL,
    [C1V]             NVARCHAR (442)  NULL,
    [C20]             NVARCHAR (442)  NULL,
    [C21]             NVARCHAR (442)  NULL,
    [C22]             NVARCHAR (442)  NULL,
    [C23]             NVARCHAR (442)  NULL,
    [C24]             NVARCHAR (442)  NULL,
    [C25]             NVARCHAR (442)  NULL,
    [C26]             NVARCHAR (442)  NULL,
    [C27]             NVARCHAR (442)  NULL,
    [C28]             NVARCHAR (442)  NULL,
    [C29]             NVARCHAR (442)  NULL,
    [C2A]             NVARCHAR (442)  NULL,
    [I48]             BIGINT          NULL,
    [I49]             BIGINT          NULL,
    [C2B]             NVARCHAR (442)  NULL,
    [C2C]             NVARCHAR (442)  NULL,
    [C2D]             NVARCHAR (442)  NULL,
    [C2E]             NVARCHAR (442)  NULL,
    [C2F]             NVARCHAR (442)  NULL,
    [C2G]             NVARCHAR (442)  NULL,
    [C2H]             NVARCHAR (442)  NULL,
    [C2I]             NVARCHAR (442)  NULL,
    [C2J]             NVARCHAR (442)  NULL,
    [C2K]             NVARCHAR (442)  NULL,
    [C2L]             NVARCHAR (442)  NULL,
    [C2M]             NVARCHAR (442)  NULL,
    [C2N]             NVARCHAR (442)  NULL,
    [C2O]             NVARCHAR (442)  NULL,
    [C2P]             NVARCHAR (442)  NULL,
    [C2Q]             NVARCHAR (442)  NULL,
    [C2R]             NVARCHAR (442)  NULL,
    [C2S]             NVARCHAR (442)  NULL,
    [C2T]             NVARCHAR (442)  NULL,
    [C2U]             NVARCHAR (442)  NULL,
    [C2V]             NVARCHAR (442)  NULL,
    [C30]             NVARCHAR (442)  NULL,
    [C31]             NVARCHAR (442)  NULL,
    [C32]             NVARCHAR (442)  NULL,
    [C33]             NVARCHAR (442)  NULL,
    [C34]             NVARCHAR (442)  NULL,
    [C35]             NVARCHAR (442)  NULL,
    [C36]             NVARCHAR (442)  NULL,
    [C37]             NVARCHAR (442)  NULL,
    [C38]             NVARCHAR (442)  NULL,
    [C39]             NVARCHAR (442)  NULL,
    [C3A]             NVARCHAR (442)  NULL,
    [C3B]             NVARCHAR (442)  NULL,
    [C3C]             NVARCHAR (442)  NULL,
    [C3D]             NVARCHAR (442)  NULL,
    [C3E]             NVARCHAR (442)  NULL,
    [C3F]             NVARCHAR (442)  NULL,
    [C3G]             NVARCHAR (442)  NULL,
    [C3H]             NVARCHAR (442)  NULL,
    [C3I]             NVARCHAR (442)  NULL,
    [C3J]             NVARCHAR (442)  NULL,
    [C3K]             NVARCHAR (442)  NULL,
    [C3L]             NVARCHAR (442)  NULL,
    [C3M]             NVARCHAR (442)  NULL,
    [C3N]             NVARCHAR (442)  NULL,
    [C3O]             NVARCHAR (442)  NULL,
    [C3P]             NVARCHAR (442)  NULL,
    [C3Q]             NVARCHAR (442)  NULL,
    [C3R]             NVARCHAR (442)  NULL,
    [C3S]             NVARCHAR (442)  NULL,
    [C3T]             NVARCHAR (442)  NULL,
    [C3U]             NVARCHAR (442)  NULL,
    [C3V]             NVARCHAR (442)  NULL
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceChanges1]
    ON [dbo].[tmp_ms_xx_UR_ResourceChanges]([JobInstanceId] ASC, [Type] ASC, [Resource_Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_ResourceChanges])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceChanges] ([JobInstanceId], [Type], [Resource_Id], [ChangeOperation], [C0], [C1], [C2], [C3], [C4], [C5], [C6], [C7], [C8], [C9], [CA], [CB], [CC], [CD], [CE], [CF], [CG], [CH], [CI], [CJ], [CK], [CL], [CM], [CN], [CO], [CP], [CQ], [CR], [CS], [CT], [CU], [CV], [C10], [C11], [C12], [C13], [C14], [C15], [C16], [C17], [C18], [C19], [C1A], [C1B], [C1C], [C1D], [C1E], [C1F], [C1G], [C1H], [C1I], [C1J], [C1K], [C1L], [C1M], [C1N], [C1O], [C1P], [C1Q], [C1R], [C1S], [C1T], [C1U], [C1V], [C20], [C21], [C22], [C23], [C24], [C25], [C26], [C27], [C28], [C29], [C2A], [C2B], [C2C], [C2D], [C2E], [C2F], [C2G], [C2H], [C2I], [C2J], [C2K], [C2L], [C2M], [C2N], [C2O], [C2P], [C2Q], [C2R], [C2S], [C2T], [C2U], [C2V], [C30], [C31], [C32], [C33], [C34], [C35], [C36], [C37], [C38], [C39], [C3A], [C3B], [C3C], [C3D], [C3E], [C3F], [C3G], [C3H], [C3I], [C3J], [C3K], [C3L], [C3M], [C3N], [C3O], [C3P], [C3Q], [C3R], [C3S], [C3T], [C3U], [C3V])
        SELECT   [JobInstanceId],
                 [Type],
                 [Resource_Id],
                 [ChangeOperation],
                 [C0],
                 [C1],
                 [C2],
                 [C3],
                 [C4],
                 [C5],
                 [C6],
                 [C7],
                 [C8],
                 [C9],
                 [CA],
                 [CB],
                 [CC],
                 [CD],
                 [CE],
                 [CF],
                 [CG],
                 [CH],
                 [CI],
                 [CJ],
                 [CK],
                 [CL],
                 [CM],
                 [CN],
                 [CO],
                 [CP],
                 [CQ],
                 [CR],
                 [CS],
                 [CT],
                 [CU],
                 [CV],
                 [C10],
                 [C11],
                 [C12],
                 [C13],
                 [C14],
                 [C15],
                 [C16],
                 [C17],
                 [C18],
                 [C19],
                 [C1A],
                 [C1B],
                 [C1C],
                 [C1D],
                 [C1E],
                 [C1F],
                 [C1G],
                 [C1H],
                 [C1I],
                 [C1J],
                 [C1K],
                 [C1L],
                 [C1M],
                 [C1N],
                 [C1O],
                 [C1P],
                 [C1Q],
                 [C1R],
                 [C1S],
                 [C1T],
                 [C1U],
                 [C1V],
                 [C20],
                 [C21],
                 [C22],
                 [C23],
                 [C24],
                 [C25],
                 [C26],
                 [C27],
                 [C28],
                 [C29],
                 [C2A],
                 [C2B],
                 [C2C],
                 [C2D],
                 [C2E],
                 [C2F],
                 [C2G],
                 [C2H],
                 [C2I],
                 [C2J],
                 [C2K],
                 [C2L],
                 [C2M],
                 [C2N],
                 [C2O],
                 [C2P],
                 [C2Q],
                 [C2R],
                 [C2S],
                 [C2T],
                 [C2U],
                 [C2V],
                 [C30],
                 [C31],
                 [C32],
                 [C33],
                 [C34],
                 [C35],
                 [C36],
                 [C37],
                 [C38],
                 [C39],
                 [C3A],
                 [C3B],
                 [C3C],
                 [C3D],
                 [C3E],
                 [C3F],
                 [C3G],
                 [C3H],
                 [C3I],
                 [C3J],
                 [C3K],
                 [C3L],
                 [C3M],
                 [C3N],
                 [C3O],
                 [C3P],
                 [C3Q],
                 [C3R],
                 [C3S],
                 [C3T],
                 [C3U],
                 [C3V]
        FROM     [dbo].[UR_ResourceChanges]
        ORDER BY [JobInstanceId] ASC, [Type] ASC, [Resource_Id] ASC;
    END

DROP TABLE [dbo].[UR_ResourceChanges];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceChanges]', N'UR_ResourceChanges';

EXECUTE sp_rename N'[dbo].[UR_ResourceChanges].[tmp_ms_xx_index_IX_ResourceChanges1]', N'IX_ResourceChanges', N'INDEX';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UR_ResourceFileChanges]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UR_ResourceFileChanges] (
    [JobInstanceId]   BIGINT          NOT NULL,
    [ChangeOperation] INT             NOT NULL,
    [ResourceFile_Id] BIGINT          NOT NULL,
    [Resource_Id]     BIGINT          NULL,
    [Resource_PK]     NVARCHAR (4000) NULL,
    [Property_Id]     BIGINT          NOT NULL,
    [Data]            VARBINARY (MAX) NULL,
    [ValidFrom]       DATETIME2 (2)   NULL,
    [ValidTo]         DATETIME2 (2)   NULL
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceFileChanges1]
    ON [dbo].[tmp_ms_xx_UR_ResourceFileChanges]([JobInstanceId] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_ResourceFileChanges])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceFileChanges] ([JobInstanceId], [ChangeOperation], [ResourceFile_Id], [Resource_Id], [Property_Id], [Data])
        SELECT   [JobInstanceId],
                 [ChangeOperation],
                 [ResourceFile_Id],
                 [Resource_Id],
                 [Property_Id],
                 [Data]
        FROM     [dbo].[UR_ResourceFileChanges]
        ORDER BY [JobInstanceId] ASC;
    END

DROP TABLE [dbo].[UR_ResourceFileChanges];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceFileChanges]', N'UR_ResourceFileChanges';

EXECUTE sp_rename N'[dbo].[UR_ResourceFileChanges].[tmp_ms_xx_index_IX_ResourceFileChanges1]', N'IX_ResourceFileChanges', N'INDEX';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UR_ResourceFiles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UR_ResourceFiles] (
    [Id]          BIGINT          NOT NULL,
    [Resource_Id] BIGINT          NOT NULL,
    [Property_Id] BIGINT          NOT NULL,
    [FileName]    NVARCHAR (442)  NULL,
    [MimeType]    VARCHAR (442)   NULL,
    [Data]        VARBINARY (MAX) NOT NULL,
    [ValidFrom]   DATETIME2 (2)   CONSTRAINT [DF_ResourceFiles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]     DATETIME2 (2)   CONSTRAINT [DF_ResourceFiles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceFiles1] PRIMARY KEY NONCLUSTERED ([ValidTo] DESC, [Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceFiles1]
    ON [dbo].[tmp_ms_xx_UR_ResourceFiles]([Resource_Id] ASC, [ValidTo] DESC, [Property_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_ResourceFiles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceFiles] ([Resource_Id], [Property_Id], [Id], [FileName], [MimeType], [Data])
        SELECT   [Resource_Id],
                 [Property_Id],
                 [Id],
                 [FileName],
                 [MimeType],
                 [Data]
        FROM     [dbo].[UR_ResourceFiles]
        ORDER BY [Resource_Id] ASC, [Property_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UR_ResourceFiles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceFiles]', N'UR_ResourceFiles';

EXECUTE sp_rename N'[dbo].[UR_ResourceFiles].[tmp_ms_xx_index_IX_ResourceFiles1]', N'IX_ResourceFiles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceFiles1]', N'PK_ResourceFiles', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column [dbo].[UR_ResourceLinkChanges].[New_R1_Id] is being dropped, data loss could occur.

The column [dbo].[UR_ResourceLinkChanges].[New_R2_Id] is being dropped, data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UR_ResourceLinkChanges]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UR_ResourceLinkChanges] (
    [JobInstanceId]   BIGINT          NOT NULL,
    [ChangeOperation] INT             NOT NULL,
    [R1_Id]           BIGINT          NULL,
    [R2_Id]           BIGINT          NULL,
    [Type]            BIGINT          NOT NULL,
    [ValidFrom]       DATETIME2 (2)   NULL,
    [ValidTo]         DATETIME2 (2)   NULL,
    [R1_PK]           NVARCHAR (4000) NULL,
    [R2_PK]           NVARCHAR (4000) NULL
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceLinkChanges1]
    ON [dbo].[tmp_ms_xx_UR_ResourceLinkChanges]([JobInstanceId] ASC, [Type] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_ResourceLinkChanges])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceLinkChanges] ([JobInstanceId], [Type], [ChangeOperation], [R1_Id], [R2_Id], [R1_PK], [R2_PK])
        SELECT   [JobInstanceId],
                 [Type],
                 [ChangeOperation],
                 [R1_Id],
                 [R2_Id],
                 [R1_PK],
                 [R2_PK]
        FROM     [dbo].[UR_ResourceLinkChanges]
        ORDER BY [JobInstanceId] ASC, [Type] ASC;
    END

DROP TABLE [dbo].[UR_ResourceLinkChanges];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceLinkChanges]', N'UR_ResourceLinkChanges';

EXECUTE sp_rename N'[dbo].[UR_ResourceLinkChanges].[tmp_ms_xx_index_IX_ResourceLinkChanges1]', N'IX_ResourceLinkChanges', N'INDEX';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UR_ResourceLinks]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UR_ResourceLinks] (
    [R1_Id]     BIGINT        NOT NULL,
    [R2_Id]     BIGINT        NOT NULL,
    [Type]      BIGINT        NOT NULL,
    [ValidFrom] DATETIME2 (2) CONSTRAINT [DF_ResourceLinks_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]   DATETIME2 (2) CONSTRAINT [DF_ResourceLinks_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceLinks_11]
    ON [dbo].[tmp_ms_xx_UR_ResourceLinks]([Type] ASC, [ValidTo] DESC, [ValidFrom] ASC, [R1_Id] ASC, [R2_Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_ResourceLinks])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceLinks] ([Type], [R1_Id], [R2_Id])
        SELECT   [Type],
                 [R1_Id],
                 [R2_Id]
        FROM     [dbo].[UR_ResourceLinks]
        ORDER BY [Type] ASC, [R1_Id] ASC, [R2_Id] ASC;
    END

DROP TABLE [dbo].[UR_ResourceLinks];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceLinks]', N'UR_ResourceLinks';

EXECUTE sp_rename N'[dbo].[UR_ResourceLinks].[tmp_ms_xx_index_IX_ResourceLinks_11]', N'IX_ResourceLinks_1', N'INDEX';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UR_ResourceLinks].[IX_ResourceLinks_2]...';


GO
CREATE NONCLUSTERED INDEX [IX_ResourceLinks_2]
    ON [dbo].[UR_ResourceLinks]([Type] ASC, [ValidTo] DESC, [ValidFrom] ASC, [R2_Id] ASC, [R1_Id] ASC);


GO
PRINT N'Starting rebuilding table [dbo].[UR_Resources]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UR_Resources] (
    [Id]             BIGINT          NOT NULL,
    [Type]           BIGINT          NOT NULL,
    [ValidFrom]      DATETIME2 (2)   CONSTRAINT [DF_Resources_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]        DATETIME2 (2)   CONSTRAINT [DF_Resources_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [Dirty]          BIT             CONSTRAINT [DF_Resources_Dirty] DEFAULT ((0)) NOT NULL,
    [DisplayName_L1] NVARCHAR (442)  NULL,
    [C0]             NVARCHAR (4000) NULL,
    [C1]             NVARCHAR (4000) NULL,
    [C2]             NVARCHAR (4000) NULL,
    [C3]             NVARCHAR (4000) NULL,
    [C4]             NVARCHAR (442)  NULL,
    [C5]             NVARCHAR (442)  NULL,
    [C6]             NVARCHAR (442)  NULL,
    [C7]             NVARCHAR (442)  NULL,
    [C8]             NVARCHAR (442)  NULL,
    [C9]             NVARCHAR (442)  NULL,
    [CA]             NVARCHAR (442)  NULL,
    [CB]             NVARCHAR (442)  NULL,
    [CC]             NVARCHAR (442)  NULL,
    [CD]             NVARCHAR (442)  NULL,
    [CE]             NVARCHAR (442)  NULL,
    [DisplayName_L2] NVARCHAR (442)  NULL,
    [I40]            BIGINT          NULL,
    [I41]            BIGINT          NULL,
    [CF]             NVARCHAR (442)  NULL,
    [CG]             NVARCHAR (442)  NULL,
    [CH]             NVARCHAR (442)  NULL,
    [CI]             NVARCHAR (442)  NULL,
    [CJ]             NVARCHAR (442)  NULL,
    [CK]             NVARCHAR (442)  NULL,
    [CL]             NVARCHAR (442)  NULL,
    [CM]             NVARCHAR (442)  NULL,
    [CN]             NVARCHAR (442)  NULL,
    [CO]             NVARCHAR (442)  NULL,
    [CP]             NVARCHAR (442)  NULL,
    [CQ]             NVARCHAR (442)  NULL,
    [CR]             NVARCHAR (442)  NULL,
    [CS]             NVARCHAR (442)  NULL,
    [CT]             NVARCHAR (442)  NULL,
    [DisplayName_L3] NVARCHAR (442)  NULL,
    [I42]            BIGINT          NULL,
    [I43]            BIGINT          NULL,
    [CU]             NVARCHAR (442)  NULL,
    [CV]             NVARCHAR (442)  NULL,
    [C10]            NVARCHAR (442)  NULL,
    [C11]            NVARCHAR (442)  NULL,
    [C12]            NVARCHAR (442)  NULL,
    [C13]            NVARCHAR (442)  NULL,
    [C14]            NVARCHAR (442)  NULL,
    [C15]            NVARCHAR (442)  NULL,
    [C16]            NVARCHAR (442)  NULL,
    [C17]            NVARCHAR (442)  NULL,
    [C18]            NVARCHAR (442)  NULL,
    [C19]            NVARCHAR (442)  NULL,
    [C1A]            NVARCHAR (442)  NULL,
    [C1B]            NVARCHAR (442)  NULL,
    [C1C]            NVARCHAR (442)  NULL,
    [DisplayName_L4] NVARCHAR (442)  NULL,
    [I44]            BIGINT          NULL,
    [I45]            BIGINT          NULL,
    [C1D]            NVARCHAR (442)  NULL,
    [C1E]            NVARCHAR (442)  NULL,
    [C1F]            NVARCHAR (442)  NULL,
    [C1G]            NVARCHAR (442)  NULL,
    [C1H]            NVARCHAR (442)  NULL,
    [C1I]            NVARCHAR (442)  NULL,
    [C1J]            NVARCHAR (442)  NULL,
    [C1K]            NVARCHAR (442)  NULL,
    [C1L]            NVARCHAR (442)  NULL,
    [C1M]            NVARCHAR (442)  NULL,
    [C1N]            NVARCHAR (442)  NULL,
    [C1O]            NVARCHAR (442)  NULL,
    [C1P]            NVARCHAR (442)  NULL,
    [C1Q]            NVARCHAR (442)  NULL,
    [C1R]            NVARCHAR (442)  NULL,
    [DisplayName_L5] NVARCHAR (442)  NULL,
    [I46]            BIGINT          NULL,
    [I47]            BIGINT          NULL,
    [C1S]            NVARCHAR (442)  NULL,
    [C1T]            NVARCHAR (442)  NULL,
    [C1U]            NVARCHAR (442)  NULL,
    [C1V]            NVARCHAR (442)  NULL,
    [C20]            NVARCHAR (442)  NULL,
    [C21]            NVARCHAR (442)  NULL,
    [C22]            NVARCHAR (442)  NULL,
    [C23]            NVARCHAR (442)  NULL,
    [C24]            NVARCHAR (442)  NULL,
    [C25]            NVARCHAR (442)  NULL,
    [C26]            NVARCHAR (442)  NULL,
    [C27]            NVARCHAR (442)  NULL,
    [C28]            NVARCHAR (442)  NULL,
    [C29]            NVARCHAR (442)  NULL,
    [C2A]            NVARCHAR (442)  NULL,
    [DisplayName_L6] NVARCHAR (442)  NULL,
    [I48]            BIGINT          NULL,
    [I49]            BIGINT          NULL,
    [C2B]            NVARCHAR (442)  NULL,
    [C2C]            NVARCHAR (442)  NULL,
    [C2D]            NVARCHAR (442)  NULL,
    [C2E]            NVARCHAR (442)  NULL,
    [C2F]            NVARCHAR (442)  NULL,
    [C2G]            NVARCHAR (442)  NULL,
    [C2H]            NVARCHAR (442)  NULL,
    [C2I]            NVARCHAR (442)  NULL,
    [C2J]            NVARCHAR (442)  NULL,
    [C2K]            NVARCHAR (442)  NULL,
    [C2L]            NVARCHAR (442)  NULL,
    [C2M]            NVARCHAR (442)  NULL,
    [C2N]            NVARCHAR (442)  NULL,
    [DisplayName_L7] NVARCHAR (442)  NULL,
    [C2O]            NVARCHAR (442)  NULL,
    [C2P]            NVARCHAR (442)  NULL,
    [C2Q]            NVARCHAR (442)  NULL,
    [C2R]            NVARCHAR (442)  NULL,
    [C2S]            NVARCHAR (442)  NULL,
    [C2T]            NVARCHAR (442)  NULL,
    [C2U]            NVARCHAR (442)  NULL,
    [C2V]            NVARCHAR (442)  NULL,
    [C30]            NVARCHAR (442)  NULL,
    [C31]            NVARCHAR (442)  NULL,
    [C32]            NVARCHAR (442)  NULL,
    [C33]            NVARCHAR (442)  NULL,
    [C34]            NVARCHAR (442)  NULL,
    [C35]            NVARCHAR (442)  NULL,
    [C36]            NVARCHAR (442)  NULL,
    [DisplayName_L8] NVARCHAR (442)  NULL,
    [C37]            NVARCHAR (442)  NULL,
    [C38]            NVARCHAR (442)  NULL,
    [C39]            NVARCHAR (442)  NULL,
    [C3A]            NVARCHAR (442)  NULL,
    [C3B]            NVARCHAR (442)  NULL,
    [C3C]            NVARCHAR (442)  NULL,
    [C3D]            NVARCHAR (442)  NULL,
    [C3E]            NVARCHAR (442)  NULL,
    [C3F]            NVARCHAR (442)  NULL,
    [C3G]            NVARCHAR (442)  NULL,
    [C3H]            NVARCHAR (442)  NULL,
    [C3I]            NVARCHAR (442)  NULL,
    [C3J]            NVARCHAR (442)  NULL,
    [C3K]            NVARCHAR (442)  NULL,
    [C3L]            NVARCHAR (442)  NULL,
    [C3M]            NVARCHAR (442)  NULL,
    [C3N]            NVARCHAR (442)  NULL,
    [C3O]            NVARCHAR (442)  NULL,
    [C3P]            NVARCHAR (442)  NULL,
    [C3Q]            NVARCHAR (442)  NULL,
    [C3R]            NVARCHAR (442)  NULL,
    [C3S]            NVARCHAR (442)  NULL,
    [C3T]            NVARCHAR (442)  NULL,
    [C3U]            NVARCHAR (442)  NULL,
    [C3V]            NVARCHAR (442)  NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Resources1] PRIMARY KEY NONCLUSTERED ([ValidTo] DESC, [Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_Resources1]
    ON [dbo].[tmp_ms_xx_UR_Resources]([Type] ASC, [ValidTo] DESC, [Id] ASC, [ValidFrom] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_Resources])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_Resources] ([Type], [Id], [Dirty], [DisplayName_L1], [C0], [C1], [C2], [C3], [C4], [C5], [C6], [C7], [C8], [C9], [CA], [CB], [CC], [CD], [CE], [CF], [CG], [CH], [CI], [CJ], [CK], [CL], [CM], [CN], [CO], [CP], [CQ], [CR], [CS], [CT], [CU], [CV], [C10], [C11], [C12], [C13], [C14], [C15], [C16], [C17], [C18], [C19], [C1A], [C1B], [C1C], [C1D], [C1E], [C1F], [C1G], [C1H], [C1I], [C1J], [C1K], [C1L], [C1M], [C1N], [C1O], [C1P], [C1Q], [C1R], [C1S], [C1T], [C1U], [C1V], [C20], [C21], [C22], [C23], [C24], [C25], [C26], [C27], [C28], [C29], [C2A], [C2B], [C2C], [C2D], [C2E], [C2F], [C2G], [C2H], [C2I], [C2J], [C2K], [C2L], [C2M], [C2N], [C2O], [C2P], [C2Q], [C2R], [C2S], [C2T], [C2U], [C2V], [C30], [C31], [C32], [C33], [C34], [C35], [C36], [C37], [C38], [C39], [C3A], [C3B], [C3C], [C3D], [C3E], [C3F], [C3G], [C3H], [C3I], [C3J], [C3K], [C3L], [C3M], [C3N], [C3O], [C3P], [C3Q], [C3R], [C3S], [C3T], [C3U], [C3V], [I40], [I41], [I42], [I43], [I44], [I45], [I46], [I47], [I48], [I49], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8])
        SELECT   [Type],
                 [Id],
                 [Dirty],
                 [DisplayName_L1],
                 [C0],
                 [C1],
                 [C2],
                 [C3],
                 [C4],
                 [C5],
                 [C6],
                 [C7],
                 [C8],
                 [C9],
                 [CA],
                 [CB],
                 [CC],
                 [CD],
                 [CE],
                 [CF],
                 [CG],
                 [CH],
                 [CI],
                 [CJ],
                 [CK],
                 [CL],
                 [CM],
                 [CN],
                 [CO],
                 [CP],
                 [CQ],
                 [CR],
                 [CS],
                 [CT],
                 [CU],
                 [CV],
                 [C10],
                 [C11],
                 [C12],
                 [C13],
                 [C14],
                 [C15],
                 [C16],
                 [C17],
                 [C18],
                 [C19],
                 [C1A],
                 [C1B],
                 [C1C],
                 [C1D],
                 [C1E],
                 [C1F],
                 [C1G],
                 [C1H],
                 [C1I],
                 [C1J],
                 [C1K],
                 [C1L],
                 [C1M],
                 [C1N],
                 [C1O],
                 [C1P],
                 [C1Q],
                 [C1R],
                 [C1S],
                 [C1T],
                 [C1U],
                 [C1V],
                 [C20],
                 [C21],
                 [C22],
                 [C23],
                 [C24],
                 [C25],
                 [C26],
                 [C27],
                 [C28],
                 [C29],
                 [C2A],
                 [C2B],
                 [C2C],
                 [C2D],
                 [C2E],
                 [C2F],
                 [C2G],
                 [C2H],
                 [C2I],
                 [C2J],
                 [C2K],
                 [C2L],
                 [C2M],
                 [C2N],
                 [C2O],
                 [C2P],
                 [C2Q],
                 [C2R],
                 [C2S],
                 [C2T],
                 [C2U],
                 [C2V],
                 [C30],
                 [C31],
                 [C32],
                 [C33],
                 [C34],
                 [C35],
                 [C36],
                 [C37],
                 [C38],
                 [C39],
                 [C3A],
                 [C3B],
                 [C3C],
                 [C3D],
                 [C3E],
                 [C3F],
                 [C3G],
                 [C3H],
                 [C3I],
                 [C3J],
                 [C3K],
                 [C3L],
                 [C3M],
                 [C3N],
                 [C3O],
                 [C3P],
                 [C3Q],
                 [C3R],
                 [C3S],
                 [C3T],
                 [C3U],
                 [C3V],
                 [I40],
                 [I41],
                 [I42],
                 [I43],
                 [I44],
                 [I45],
                 [I46],
                 [I47],
                 [I48],
                 [I49],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8]
        FROM     [dbo].[UR_Resources]
        ORDER BY [Type] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UR_Resources];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_Resources]', N'UR_Resources';

EXECUTE sp_rename N'[dbo].[UR_Resources].[tmp_ms_xx_index_IX_Resources1]', N'IX_Resources', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Resources1]', N'PK_Resources', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UR_Resources].[IX_Resources_DisplayName]...';


GO
CREATE NONCLUSTERED INDEX [IX_Resources_DisplayName]
    ON [dbo].[UR_Resources]([DisplayName_L1] ASC);


GO
PRINT N'Creating [dbo].[UR_Resources].[IX_Resources_Dirty]...';


GO
CREATE NONCLUSTERED INDEX [IX_Resources_Dirty]
    ON [dbo].[UR_Resources]([Dirty] ASC) WHERE "Dirty"=1 AND "ValidTo"=CONVERT("datetime2"(2),'9999-12-31 23:59:59.9999999');


GO
PRINT N'Creating [dbo].[UC_SynchronizationHistory]...';


GO
CREATE TABLE [dbo].[UC_SynchronizationHistory] (
    [Connector_Id]      BIGINT        NOT NULL,
    [TaskInstance_Id]   BIGINT        NOT NULL,
    [HistorizationDate] DATETIME2 (2) NOT NULL,
    [ExecutionDate]     DATETIME2 (2) NOT NULL,
    [State]             TINYINT       NOT NULL,
    CONSTRAINT [PK_SynchronizationHistory] PRIMARY KEY NONCLUSTERED ([Connector_Id] ASC, [HistorizationDate] ASC),
    CONSTRAINT [UK_SynchronizationHistory] UNIQUE CLUSTERED ([TaskInstance_Id] ASC)
);


GO
PRINT N'Creating [dbo].[UJ_JobSteps]...';


GO
CREATE TABLE [dbo].[UJ_JobSteps] (
    [Id]          BIGINT NOT NULL,
    [Task_Id]     BIGINT NOT NULL,
    [Job_Id]      BIGINT NOT NULL,
    [LaunchOrder] INT    NOT NULL,
    CONSTRAINT [PK_JobSteps] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UJ_TaskDimensions]...';


GO
CREATE TABLE [dbo].[UJ_TaskDimensions] (
    [Id]           BIGINT NOT NULL,
    [Task_Id]      BIGINT NOT NULL,
    [Dimension_Id] BIGINT NOT NULL,
    CONSTRAINT [PK_TaskDimensions] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UJ_TaskEntityTypes]...';


GO
CREATE TABLE [dbo].[UJ_TaskEntityTypes] (
    [Id]            BIGINT NOT NULL,
    [Task_Id]       BIGINT NOT NULL,
    [EntityType_Id] BIGINT NOT NULL,
    CONSTRAINT [PK_TaskEntityTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UJ_TaskInstances]...';


GO
CREATE TABLE [dbo].[UJ_TaskInstances] (
    [Id]             BIGINT   NOT NULL,
    [Task_Id]        BIGINT   NOT NULL,
    [JobInstance_Id] BIGINT   NULL,
    [StartDate]      DATETIME NOT NULL,
    [EndDate]        DATETIME NULL,
    [State]          SMALLINT NOT NULL,
    [IsChild]        BIT      NOT NULL,
    [IsValidation]   BIT      NOT NULL,
    [C0]             INT      NULL,
    [C1]             INT      NULL,
    [C2]             INT      NULL,
    [C3]             INT      NULL,
    [C4]             INT      NULL,
    [C5]             INT      NULL,
    [C6]             INT      NULL,
    [C7]             INT      NULL,
    CONSTRAINT [PK_TaskInstances_JobTaskInstances] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UJ_TaskResourceTypes]...';


GO
CREATE TABLE [dbo].[UJ_TaskResourceTypes] (
    [Id]              BIGINT NOT NULL,
    [Task_Id]         BIGINT NOT NULL,
    [ResourceType_Id] BIGINT NOT NULL,
    CONSTRAINT [PK_TaskResourceTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UJ_Tasks]...';


GO
CREATE TABLE [dbo].[UJ_Tasks] (
    [Id]                            BIGINT          NOT NULL,
    [Identifier]                    VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]                NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]                NVARCHAR (442)  NULL,
    [DisplayName_L3]                NVARCHAR (442)  NULL,
    [DisplayName_L4]                NVARCHAR (442)  NULL,
    [DisplayName_L5]                NVARCHAR (442)  NULL,
    [DisplayName_L6]                NVARCHAR (442)  NULL,
    [DisplayName_L7]                NVARCHAR (442)  NULL,
    [DisplayName_L8]                NVARCHAR (442)  NULL,
    [State]                         INT             NOT NULL,
    [TaskType]                      INT             NOT NULL,
    [JobSubCommand]                 SMALLINT        NOT NULL,
    [HttpCommand]                   SMALLINT        NOT NULL,
    [Agent_Id]                      BIGINT          NULL,
    [OpenIdClient_Id]               BIGINT          NULL,
    [SessionOff]                    BIT             NULL,
    [IgnoreCookieFile]              BIT             NULL,
    [BatchSize]                     INT             NULL,
    [Mode]                          INT             NULL,
    [Connector_Id]                  BIGINT          NULL,
    [Check]                         BIT             NULL,
    [SplitSize]                     INT             NULL,
    [InputPath]                     NVARCHAR (442)  NULL,
    [OutputPath]                    NVARCHAR (442)  NULL,
    [SynchronizationJobIdentifier]  NVARCHAR (442)  NULL,
    [ProvisioningJobIdentifier]     NVARCHAR (442)  NULL,
    [Dirty]                         BIT             NULL,
    [BlockProvisioning]             BIT             NULL,
    [DoNotDeleteChanges]            BIT             NULL,
    [IgnoreHistorization]           BIT             NULL,
    [AllEntityType]                 BIT             NULL,
    [BatchSelectSize]               INT             NULL,
    [BatchUpdateSize]               INT             NULL,
    [BatchInsertSize]               INT             NULL,
    [InformationSystemIdentifier]   NVARCHAR (442)  NULL,
    [GeneratedFile]                 NVARCHAR (442)  NULL,
    [GeneratedCodePath]             NVARCHAR (442)  NULL,
    [GeneratedCodeNamespace]        NVARCHAR (442)  NULL,
    [AssignedResourceTypeSQL]       NVARCHAR (4000) NULL,
    [AssignedResourceScalarSQL]     NVARCHAR (4000) NULL,
    [AssignedResourceNavigationSQL] NVARCHAR (4000) NULL,
    [ApiUrl]                        NVARCHAR (442)  NULL,
    [IsWarning]                     BIT             NOT NULL,
    CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_Tasks_Identifier] UNIQUE NONCLUSTERED ([Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[UN_NotificationTemplates]...';


GO
CREATE TABLE [dbo].[UN_NotificationTemplates] (
    [Id]                 BIGINT          NOT NULL,
    [Identifier]         VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [SubjectTemplate_L1] NVARCHAR (1024) NULL,
    [HeaderTemplate_L1]  NVARCHAR (MAX)  NULL,
    [BodyTemplate_L1]    NVARCHAR (MAX)  NULL,
    [SubjectTemplate_L2] NVARCHAR (1024) NULL,
    [HeaderTemplate_L2]  NVARCHAR (MAX)  NULL,
    [BodyTemplate_L2]    NVARCHAR (MAX)  NULL,
    [SubjectTemplate_L3] NVARCHAR (1024) NULL,
    [HeaderTemplate_L3]  NVARCHAR (MAX)  NULL,
    [BodyTemplate_L3]    NVARCHAR (MAX)  NULL,
    [SubjectTemplate_L4] NVARCHAR (1024) NULL,
    [HeaderTemplate_L4]  NVARCHAR (MAX)  NULL,
    [BodyTemplate_L4]    NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_NotificationTemplates] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_NotificationTemplates_Identifier] UNIQUE NONCLUSTERED ([Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[UP_IdentifiedRisks]...';


GO
CREATE TABLE [dbo].[UP_IdentifiedRisks] (
    [Id]                        BIGINT        NOT NULL,
    [Owner_Id]                  BIGINT        NOT NULL,
    [Risk_Id]                   BIGINT        NOT NULL,
    [StartDate]                 SMALLDATETIME NOT NULL,
    [EndDate]                   SMALLDATETIME NOT NULL,
    [WorkflowInstance_Id]       BIGINT        NULL,
    [AssignedSingleRole1_Id]    BIGINT        NULL,
    [AssignedSingleRole2_Id]    BIGINT        NULL,
    [AssignedCompositeRole1_Id] BIGINT        NULL,
    [AssignedCompositeRole2_Id] BIGINT        NULL,
    [ValidFrom]                 DATETIME2 (2) NOT NULL,
    [ValidTo]                   DATETIME2 (2) NOT NULL,
    CONSTRAINT [PK_IdentifiedRisks] PRIMARY KEY NONCLUSTERED ([ValidTo] DESC, [Id] ASC),
    CONSTRAINT [CK_IdentifiedRisks] UNIQUE CLUSTERED ([Owner_Id] ASC, [ValidTo] DESC, [Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_IndirectResourceRules]...';


GO
CREATE TABLE [dbo].[UP_IndirectResourceRules] (
    [Id]                                   BIGINT NOT NULL,
    [ResourceType_Id]                      BIGINT NOT NULL,
    [TargetEntityTypeProperty_Id]          BIGINT NOT NULL,
    [IndirectResourceBinding_Id]           BIGINT NOT NULL,
    [TargetEntityTypeReflexiveProperty_Id] BIGINT NULL,
    [IndirectResourceReflexiveProperty_Id] BIGINT NULL,
    [DenialProperty_Id]                    BIGINT NULL,
    CONSTRAINT [PK_IndirectResourceRules] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_ResourceCorrelationKeys]...';


GO
CREATE TABLE [dbo].[UP_ResourceCorrelationKeys] (
    [Id]                    BIGINT          NOT NULL,
    [BindingExpressionHash] INT             NOT NULL,
    [Resource_Id]           BIGINT          NOT NULL,
    [Value]                 NVARCHAR (4000) NOT NULL,
    CONSTRAINT [PK_ResourceCorrelationKeys] PRIMARY KEY CLUSTERED ([BindingExpressionHash] ASC, [Resource_Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_RiskRuleItems]...';


GO
CREATE TABLE [dbo].[UP_RiskRuleItems] (
    [Id]              BIGINT          NOT NULL,
    [Risk_Id]         BIGINT          NOT NULL,
    [Rule_Id]         BIGINT          NOT NULL,
    [ResourceType_Id] BIGINT          NOT NULL,
    [Property_Id]     BIGINT          NOT NULL,
    [Resource_Id]     BIGINT          NULL,
    [Value]           NVARCHAR (4000) NULL,
    CONSTRAINT [PK_RiskRuleItems] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [CK_RiskRuleItems] UNIQUE CLUSTERED ([Risk_Id] ASC, [Rule_Id] ASC, [Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_RiskRules]...';


GO
CREATE TABLE [dbo].[UP_RiskRules] (
    [Id]        BIGINT NOT NULL,
    [Policy_Id] BIGINT NOT NULL,
    [Risk_Id]   BIGINT NOT NULL,
    CONSTRAINT [PK_RiskRules] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [CK_RiskRules] UNIQUE CLUSTERED ([Risk_Id] ASC, [Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_Risks]...';


GO
CREATE TABLE [dbo].[UP_Risks] (
    [Id]             BIGINT          NOT NULL,
    [Policy_Id]      BIGINT          NOT NULL,
    [Identifier]     VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ValidFrom]      DATETIME2 (2)   NOT NULL,
    [ValidTo]        DATETIME2 (2)   NOT NULL,
    [DisplayName_L1] NVARCHAR (442)  NOT NULL,
    [DisplayName_L2] NVARCHAR (442)  NULL,
    [DisplayName_L3] NVARCHAR (442)  NULL,
    [DisplayName_L4] NVARCHAR (442)  NULL,
    [DisplayName_L5] NVARCHAR (442)  NULL,
    [DisplayName_L6] NVARCHAR (442)  NULL,
    [DisplayName_L7] NVARCHAR (442)  NULL,
    [DisplayName_L8] NVARCHAR (442)  NULL,
    [Description_L1] NVARCHAR (1024) NULL,
    [Description_L2] NVARCHAR (1024) NULL,
    [Description_L3] NVARCHAR (1024) NULL,
    [Description_L4] NVARCHAR (1024) NULL,
    [Description_L5] NVARCHAR (1024) NULL,
    [Description_L6] NVARCHAR (1024) NULL,
    [Description_L7] NVARCHAR (1024) NULL,
    [Description_L8] NVARCHAR (1024) NULL,
    [Level]          TINYINT         NOT NULL,
    CONSTRAINT [PK_Risks] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_Risks].[IX_Risks]...';


GO
CREATE CLUSTERED INDEX [IX_Risks]
    ON [dbo].[UP_Risks]([Id] ASC, [ValidTo] DESC);


GO
PRINT N'Creating [dbo].[US_AccessCertificationCampaigns]...';


GO
CREATE TABLE [dbo].[US_AccessCertificationCampaigns] (
    [Id]                   BIGINT         NOT NULL,
    [Identifier]           VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]       NVARCHAR (442) NOT NULL,
    [DisplayName_L2]       NVARCHAR (442) NULL,
    [DisplayName_L3]       NVARCHAR (442) NULL,
    [DisplayName_L4]       NVARCHAR (442) NULL,
    [DisplayName_L5]       NVARCHAR (442) NULL,
    [DisplayName_L6]       NVARCHAR (442) NULL,
    [DisplayName_L7]       NVARCHAR (442) NULL,
    [DisplayName_L8]       NVARCHAR (442) NULL,
    [StartDate]            SMALLDATETIME  NOT NULL,
    [EndDate]              SMALLDATETIME  NOT NULL,
    [OwnerEntityType_Id]   BIGINT         NOT NULL,
    [State]                TINYINT        NOT NULL,
    [ItemsCount]           INT            NOT NULL,
    [CompletedItemsCount]  INT            NOT NULL,
    [LastNotificationDate] SMALLDATETIME  NULL,
    [NotificationNeeded]   BIT            NOT NULL,
    CONSTRAINT [PK_AccessCertificationCampaigns] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[US_AccessCertificationDataFilters]...';


GO
CREATE TABLE [dbo].[US_AccessCertificationDataFilters] (
    [Id]                                 BIGINT NOT NULL,
    [Campaign_Id]                        BIGINT NOT NULL,
    [IncludeCompositeRoles]              BIT    NOT NULL,
    [IncludeSingleRoles]                 BIT    NOT NULL,
    [IncludeResourceTypes]               BIT    NOT NULL,
    [IncludeResourceNavigations]         BIT    NOT NULL,
    [IncludeResourceScalars]             BIT    NOT NULL,
    [IncludeWorkflowStatePolicyApproved] BIT    NOT NULL,
    [IncludeWorkflowStateApproved]       BIT    NOT NULL,
    [IncludeWorkflowStateFound]          BIT    NOT NULL,
    [IncludeWorkflowStateHistory]        BIT    NOT NULL,
    [Category_Id]                        BIGINT NULL,
    [ResourceType_Id]                    BIGINT NULL,
    CONSTRAINT [PK_AccessCertificationDataFilters] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[US_AccessCertificationItems]...';


GO
CREATE TABLE [dbo].[US_AccessCertificationItems] (
    [Id]                            BIGINT         NOT NULL,
    [Campaign_Id]                   BIGINT         NOT NULL,
    [Owner_Id]                      BIGINT         NOT NULL,
    [ReviewDecision]                TINYINT        NOT NULL,
    [AdministratorDecision]         TINYINT        NOT NULL,
    [Reviewer_Id]                   BIGINT         NULL,
    [SetReviewerDate]               SMALLDATETIME  NULL,
    [ReviewDate]                    SMALLDATETIME  NULL,
    [Administrator_Id]              BIGINT         NULL,
    [AdministratorDate]             SMALLDATETIME  NULL,
    [AssignedCompositeRole_Id]      BIGINT         NULL,
    [AssignedSingleRole_Id]         BIGINT         NULL,
    [AssignedResourceType_Id]       BIGINT         NULL,
    [AssignedResourceNavigation_Id] BIGINT         NULL,
    [AssignedResourceScalar_Id]     BIGINT         NULL,
    [ReviewComment]                 NVARCHAR (442) NULL,
    [AdministratorComment]          NVARCHAR (442) NULL,
    [IsCompleted]                   BIT            NOT NULL,
    [IsTransferred]                 BIT            NOT NULL,
    CONSTRAINT [PK_AccessCertificationItem] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [CK_AccessCertificationItem] UNIQUE CLUSTERED ([Campaign_Id] ASC, [Owner_Id] ASC, [Id] ASC)
);


GO
PRINT N'Creating [dbo].[US_AccessCertificationOwnerFilters]...';


GO
CREATE TABLE [dbo].[US_AccessCertificationOwnerFilters] (
    [Id]            BIGINT NOT NULL,
    [Campaign_Id]   BIGINT NOT NULL,
    [Dimension0_Id] BIGINT NULL,
    [Dimension1_Id] BIGINT NULL,
    [Dimension2_Id] BIGINT NULL,
    [Dimension3_Id] BIGINT NULL,
    [Dimension4_Id] BIGINT NULL,
    [Dimension5_Id] BIGINT NULL,
    [Dimension6_Id] BIGINT NULL,
    [Dimension7_Id] BIGINT NULL,
    CONSTRAINT [PK_AccessCertificationOwnerFilters] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[US_ForwardedAccessCertificationItems]...';


GO
CREATE TABLE [dbo].[US_ForwardedAccessCertificationItems] (
    [Id]          BIGINT         NOT NULL,
    [Item_Id]     BIGINT         NOT NULL,
    [Date]        SMALLDATETIME  NOT NULL,
    [From_Id]     BIGINT         NOT NULL,
    [To_Id]       BIGINT         NOT NULL,
    [Comment]     NVARCHAR (442) NULL,
    [IsConfirmed] BIT            NOT NULL,
    CONSTRAINT [PK_ForwardedAccessCertificationItem] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UT_BigInts]...';


GO
CREATE TABLE [dbo].[UT_BigInts] (
    [Id]    BIGINT NOT NULL,
    [Value] BIGINT NULL
);


GO
PRINT N'Creating [dbo].[UT_Bits]...';


GO
CREATE TABLE [dbo].[UT_Bits] (
    [Id]    BIGINT NOT NULL,
    [Value] BIT    NULL
);


GO
PRINT N'Creating [dbo].[UT_ConsolidateProvisioningState]...';


GO
CREATE TABLE [dbo].[UT_ConsolidateProvisioningState] (
    [Id]    BIGINT  NOT NULL,
    [Value] TINYINT NOT NULL
);


GO
PRINT N'Creating [dbo].[UT_InsertResourceLinks]...';


GO
CREATE TABLE [dbo].[UT_InsertResourceLinks] (
    [ChangeOperation] INT             NULL,
    [R1_Identifier]   NVARCHAR (4000) NOT NULL,
    [R2_Identifier]   NVARCHAR (4000) NOT NULL
);


GO
PRINT N'Creating [dbo].[UT_Ints]...';


GO
CREATE TABLE [dbo].[UT_Ints] (
    [Id]    BIGINT NOT NULL,
    [Value] INT    NULL
);


GO
PRINT N'Creating [dbo].[UT_NotificationInstances]...';


GO
CREATE TABLE [dbo].[UT_NotificationInstances] (
    [Notification_Id]   BIGINT   NOT NULL,
    [OwnerResource_Id]  BIGINT   NOT NULL,
    [LastExecutionDate] DATETIME NULL
);


GO
PRINT N'Creating [dbo].[UT_NvarChar]...';


GO
CREATE TABLE [dbo].[UT_NvarChar] (
    [Id]    BIGINT          NOT NULL,
    [Value] NVARCHAR (4000) NULL
);


GO
PRINT N'Creating [dbo].[UT_OnlyId]...';


GO
CREATE TABLE [dbo].[UT_OnlyId] (
    [Id] BIGINT NOT NULL
);


GO
PRINT N'Creating [dbo].[UT_ResourceFiles]...';


GO
CREATE TABLE [dbo].[UT_ResourceFiles] (
    [ChangeOperation] INT             NULL,
    [Id]              BIGINT          NOT NULL,
    [Identifier]      NVARCHAR (4000) NOT NULL,
    [Data]            VARBINARY (MAX) NULL
);


GO
PRINT N'Creating [dbo].[UT_ResourceLinks]...';


GO
CREATE TABLE [dbo].[UT_ResourceLinks] (
    [R1_Id] BIGINT NOT NULL,
    [R2_Id] BIGINT NOT NULL,
    [Type]  BIGINT NULL
);


GO
PRINT N'Creating [dbo].[UT_ResourceOrphans]...';


GO
CREATE TABLE [dbo].[UT_ResourceOrphans] (
    [Type]          BIGINT          NULL,
    [R1_Identifier] NVARCHAR (4000) NOT NULL,
    [R2_Identifier] NVARCHAR (4000) NOT NULL
);


GO
PRINT N'Creating [dbo].[UT_Resources]...';


GO
CREATE TABLE [dbo].[UT_Resources] (
    [Id]             BIGINT          NOT NULL,
    [Type]           BIGINT          NOT NULL,
    [DisplayName_L1] NVARCHAR (442)  NULL,
    [C0]             NVARCHAR (4000) NULL,
    [C1]             NVARCHAR (4000) NULL,
    [C2]             NVARCHAR (4000) NULL,
    [C3]             NVARCHAR (4000) NULL,
    [C4]             NVARCHAR (442)  NULL,
    [C5]             NVARCHAR (442)  NULL,
    [C6]             NVARCHAR (442)  NULL,
    [C7]             NVARCHAR (442)  NULL,
    [C8]             NVARCHAR (442)  NULL,
    [C9]             NVARCHAR (442)  NULL,
    [CA]             NVARCHAR (442)  NULL,
    [CB]             NVARCHAR (442)  NULL,
    [CC]             NVARCHAR (442)  NULL,
    [CD]             NVARCHAR (442)  NULL,
    [CE]             NVARCHAR (442)  NULL,
    [DisplayName_L2] NVARCHAR (442)  NULL,
    [I40]            BIGINT          NULL,
    [I41]            BIGINT          NULL,
    [CF]             NVARCHAR (442)  NULL,
    [CG]             NVARCHAR (442)  NULL,
    [CH]             NVARCHAR (442)  NULL,
    [CI]             NVARCHAR (442)  NULL,
    [CJ]             NVARCHAR (442)  NULL,
    [CK]             NVARCHAR (442)  NULL,
    [CL]             NVARCHAR (442)  NULL,
    [CM]             NVARCHAR (442)  NULL,
    [CN]             NVARCHAR (442)  NULL,
    [CO]             NVARCHAR (442)  NULL,
    [CP]             NVARCHAR (442)  NULL,
    [CQ]             NVARCHAR (442)  NULL,
    [CR]             NVARCHAR (442)  NULL,
    [CS]             NVARCHAR (442)  NULL,
    [CT]             NVARCHAR (442)  NULL,
    [DisplayName_L3] NVARCHAR (442)  NULL,
    [I42]            BIGINT          NULL,
    [I43]            BIGINT          NULL,
    [CU]             NVARCHAR (442)  NULL,
    [CV]             NVARCHAR (442)  NULL,
    [C10]            NVARCHAR (442)  NULL,
    [C11]            NVARCHAR (442)  NULL,
    [C12]            NVARCHAR (442)  NULL,
    [C13]            NVARCHAR (442)  NULL,
    [C14]            NVARCHAR (442)  NULL,
    [C15]            NVARCHAR (442)  NULL,
    [C16]            NVARCHAR (442)  NULL,
    [C17]            NVARCHAR (442)  NULL,
    [C18]            NVARCHAR (442)  NULL,
    [C19]            NVARCHAR (442)  NULL,
    [C1A]            NVARCHAR (442)  NULL,
    [C1B]            NVARCHAR (442)  NULL,
    [C1C]            NVARCHAR (442)  NULL,
    [DisplayName_L4] NVARCHAR (442)  NULL,
    [I44]            BIGINT          NULL,
    [I45]            BIGINT          NULL,
    [C1D]            NVARCHAR (442)  NULL,
    [C1E]            NVARCHAR (442)  NULL,
    [C1F]            NVARCHAR (442)  NULL,
    [C1G]            NVARCHAR (442)  NULL,
    [C1H]            NVARCHAR (442)  NULL,
    [C1I]            NVARCHAR (442)  NULL,
    [C1J]            NVARCHAR (442)  NULL,
    [C1K]            NVARCHAR (442)  NULL,
    [C1L]            NVARCHAR (442)  NULL,
    [C1M]            NVARCHAR (442)  NULL,
    [C1N]            NVARCHAR (442)  NULL,
    [C1O]            NVARCHAR (442)  NULL,
    [C1P]            NVARCHAR (442)  NULL,
    [C1Q]            NVARCHAR (442)  NULL,
    [C1R]            NVARCHAR (442)  NULL,
    [DisplayName_L5] NVARCHAR (442)  NULL,
    [I46]            BIGINT          NULL,
    [I47]            BIGINT          NULL,
    [C1S]            NVARCHAR (442)  NULL,
    [C1T]            NVARCHAR (442)  NULL,
    [C1U]            NVARCHAR (442)  NULL,
    [C1V]            NVARCHAR (442)  NULL,
    [C20]            NVARCHAR (442)  NULL,
    [C21]            NVARCHAR (442)  NULL,
    [C22]            NVARCHAR (442)  NULL,
    [C23]            NVARCHAR (442)  NULL,
    [C24]            NVARCHAR (442)  NULL,
    [C25]            NVARCHAR (442)  NULL,
    [C26]            NVARCHAR (442)  NULL,
    [C27]            NVARCHAR (442)  NULL,
    [C28]            NVARCHAR (442)  NULL,
    [C29]            NVARCHAR (442)  NULL,
    [C2A]            NVARCHAR (442)  NULL,
    [DisplayName_L6] NVARCHAR (442)  NULL,
    [I48]            BIGINT          NULL,
    [I49]            BIGINT          NULL,
    [C2B]            NVARCHAR (442)  NULL,
    [C2C]            NVARCHAR (442)  NULL,
    [C2D]            NVARCHAR (442)  NULL,
    [C2E]            NVARCHAR (442)  NULL,
    [C2F]            NVARCHAR (442)  NULL,
    [C2G]            NVARCHAR (442)  NULL,
    [C2H]            NVARCHAR (442)  NULL,
    [C2I]            NVARCHAR (442)  NULL,
    [C2J]            NVARCHAR (442)  NULL,
    [C2K]            NVARCHAR (442)  NULL,
    [C2L]            NVARCHAR (442)  NULL,
    [C2M]            NVARCHAR (442)  NULL,
    [C2N]            NVARCHAR (442)  NULL,
    [DisplayName_L7] NVARCHAR (442)  NULL,
    [C2O]            NVARCHAR (442)  NULL,
    [C2P]            NVARCHAR (442)  NULL,
    [C2Q]            NVARCHAR (442)  NULL,
    [C2R]            NVARCHAR (442)  NULL,
    [C2S]            NVARCHAR (442)  NULL,
    [C2T]            NVARCHAR (442)  NULL,
    [C2U]            NVARCHAR (442)  NULL,
    [C2V]            NVARCHAR (442)  NULL,
    [C30]            NVARCHAR (442)  NULL,
    [C31]            NVARCHAR (442)  NULL,
    [C32]            NVARCHAR (442)  NULL,
    [C33]            NVARCHAR (442)  NULL,
    [C34]            NVARCHAR (442)  NULL,
    [C35]            NVARCHAR (442)  NULL,
    [C36]            NVARCHAR (442)  NULL,
    [DisplayName_L8] NVARCHAR (442)  NULL,
    [C37]            NVARCHAR (442)  NULL,
    [C38]            NVARCHAR (442)  NULL,
    [C39]            NVARCHAR (442)  NULL,
    [C3A]            NVARCHAR (442)  NULL,
    [C3B]            NVARCHAR (442)  NULL,
    [C3C]            NVARCHAR (442)  NULL,
    [C3D]            NVARCHAR (442)  NULL,
    [C3E]            NVARCHAR (442)  NULL,
    [C3F]            NVARCHAR (442)  NULL,
    [C3G]            NVARCHAR (442)  NULL,
    [C3H]            NVARCHAR (442)  NULL,
    [C3I]            NVARCHAR (442)  NULL,
    [C3J]            NVARCHAR (442)  NULL,
    [C3K]            NVARCHAR (442)  NULL,
    [C3L]            NVARCHAR (442)  NULL,
    [C3M]            NVARCHAR (442)  NULL,
    [C3N]            NVARCHAR (442)  NULL,
    [C3O]            NVARCHAR (442)  NULL,
    [C3P]            NVARCHAR (442)  NULL,
    [C3Q]            NVARCHAR (442)  NULL,
    [C3R]            NVARCHAR (442)  NULL,
    [C3S]            NVARCHAR (442)  NULL,
    [C3T]            NVARCHAR (442)  NULL,
    [C3U]            NVARCHAR (442)  NULL,
    [C3V]            NVARCHAR (442)  NULL
);


GO
PRINT N'Creating [dbo].[UT_SmallDateTimes]...';


GO
CREATE TABLE [dbo].[UT_SmallDateTimes] (
    [Id]    BIGINT        NOT NULL,
    [Value] SMALLDATETIME NULL
);


GO
PRINT N'Creating [dbo].[UT_SmallInts]...';


GO
CREATE TABLE [dbo].[UT_SmallInts] (
    [Id]    BIGINT   NOT NULL,
    [Value] SMALLINT NULL
);


GO
PRINT N'Creating [dbo].[UT_TempNavigations]...';


GO
CREATE TABLE [dbo].[UT_TempNavigations] (
    [Id] BIGINT NULL
);


GO
PRINT N'Creating [dbo].[UT_TempOwner]...';


GO
CREATE TABLE [dbo].[UT_TempOwner] (
    [Owner_Id] BIGINT NULL
);


GO
PRINT N'Creating [dbo].[UT_TempSacalars]...';


GO
CREATE TABLE [dbo].[UT_TempSacalars] (
    [Id] BIGINT NULL
);


GO
PRINT N'Creating [dbo].[UT_TempTypes]...';


GO
CREATE TABLE [dbo].[UT_TempTypes] (
    [Id] BIGINT NULL
);


GO
PRINT N'Creating [dbo].[UT_TinyInts]...';


GO
CREATE TABLE [dbo].[UT_TinyInts] (
    [Id]    BIGINT  NOT NULL,
    [Value] TINYINT NULL
);


GO
PRINT N'Creating [dbo].[PK_AssignedResourceErrors]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors]
    ADD CONSTRAINT [PK_AssignedResourceErrors] PRIMARY KEY CLUSTERED ([Id] ASC);


GO
PRINT N'Creating [dbo].[DF_TaskInstance_State]...';


GO
ALTER TABLE [dbo].[UJ_TaskInstances]
    ADD CONSTRAINT [DF_TaskInstance_State] DEFAULT ((0)) FOR [State];


GO
PRINT N'Creating [dbo].[DF_TaskInstance_IsChild]...';


GO
ALTER TABLE [dbo].[UJ_TaskInstances]
    ADD CONSTRAINT [DF_TaskInstance_IsChild] DEFAULT ((0)) FOR [IsChild];


GO
PRINT N'Creating [dbo].[DF_TaskInstance_IsValidation]...';


GO
ALTER TABLE [dbo].[UJ_TaskInstances]
    ADD CONSTRAINT [DF_TaskInstance_IsValidation] DEFAULT ((0)) FOR [IsValidation];


GO
PRINT N'Creating [dbo].[DF_Job_State]...';


GO
ALTER TABLE [dbo].[UJ_Tasks]
    ADD CONSTRAINT [DF_Job_State] DEFAULT ((0)) FOR [State];


GO
PRINT N'Creating [dbo].[DF_Job_TaskType]...';


GO
ALTER TABLE [dbo].[UJ_Tasks]
    ADD CONSTRAINT [DF_Job_TaskType] DEFAULT ((0)) FOR [TaskType];


GO
PRINT N'Creating [dbo].[DF_Job_SubCommand]...';


GO
ALTER TABLE [dbo].[UJ_Tasks]
    ADD CONSTRAINT [DF_Job_SubCommand] DEFAULT ((0)) FOR [JobSubCommand];


GO
PRINT N'Creating [dbo].[DF_Job_HttpCommand]...';


GO
ALTER TABLE [dbo].[UJ_Tasks]
    ADD CONSTRAINT [DF_Job_HttpCommand] DEFAULT ((0)) FOR [HttpCommand];


GO
PRINT N'Creating [dbo].[DF_Task_IsWarning]...';


GO
ALTER TABLE [dbo].[UJ_Tasks]
    ADD CONSTRAINT [DF_Task_IsWarning] DEFAULT ((0)) FOR [IsWarning];


GO
PRINT N'Creating [dbo].[DF_IdentifiedRisks_StartDate]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks]
    ADD CONSTRAINT [DF_IdentifiedRisks_StartDate] DEFAULT CONVERT(SMALLDATETIME,'19000101',112) FOR [StartDate];


GO
PRINT N'Creating [dbo].[DF_IdentifiedRisks_EndDate]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks]
    ADD CONSTRAINT [DF_IdentifiedRisks_EndDate] DEFAULT CONVERT(SMALLDATETIME,'20790606',112) FOR [EndDate];


GO
PRINT N'Creating [dbo].[DF_IdentifiedRisks_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks]
    ADD CONSTRAINT [DF_IdentifiedRisks_ValidFrom] DEFAULT GETUTCDATE() FOR [ValidFrom];


GO
PRINT N'Creating [dbo].[DF_IdentifiedRisks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks]
    ADD CONSTRAINT [DF_IdentifiedRisks_ValidTo] DEFAULT (CONVERT("datetime2"(2),'9999-12-31 23:59:59.9999999')) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_Risks_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_Risks]
    ADD CONSTRAINT [DF_Risks_ValidFrom] DEFAULT GETUTCDATE() FOR [ValidFrom];


GO
PRINT N'Creating [dbo].[DF_Risks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Risks]
    ADD CONSTRAINT [DF_Risks_ValidTo] DEFAULT (CONVERT("datetime2"(2),'9999-12-31 23:59:59.9999999')) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_Risks_Level]...';


GO
ALTER TABLE [dbo].[UP_Risks]
    ADD CONSTRAINT [DF_Risks_Level] DEFAULT ((0)) FOR [Level];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationCampaigns_State]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationCampaigns]
    ADD CONSTRAINT [DF_AccessCertificationCampaigns_State] DEFAULT ((0)) FOR [State];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationCampaigns_ItemsCount]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationCampaigns]
    ADD CONSTRAINT [DF_AccessCertificationCampaigns_ItemsCount] DEFAULT ((0)) FOR [ItemsCount];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationCampaigns_CompletedItemsCount]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationCampaigns]
    ADD CONSTRAINT [DF_AccessCertificationCampaigns_CompletedItemsCount] DEFAULT ((0)) FOR [CompletedItemsCount];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationCampaigns_NotificationNeeded]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationCampaigns]
    ADD CONSTRAINT [DF_AccessCertificationCampaigns_NotificationNeeded] DEFAULT ((1)) FOR [NotificationNeeded];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeCompositeRoles]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeCompositeRoles] DEFAULT ((0)) FOR [IncludeCompositeRoles];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeSingleRoles]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeSingleRoles] DEFAULT ((0)) FOR [IncludeSingleRoles];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeResourceTypes]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeResourceTypes] DEFAULT ((0)) FOR [IncludeResourceTypes];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeResourceNavigations]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeResourceNavigations] DEFAULT ((0)) FOR [IncludeResourceNavigations];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeCResourceScalars]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeCResourceScalars] DEFAULT ((0)) FOR [IncludeResourceScalars];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeWorkflowStatePolicyApproved]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeWorkflowStatePolicyApproved] DEFAULT ((1)) FOR [IncludeWorkflowStatePolicyApproved];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeWorkflowStateApproved]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeWorkflowStateApproved] DEFAULT ((1)) FOR [IncludeWorkflowStateApproved];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeWorkflowStateFound]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeWorkflowStateFound] DEFAULT ((1)) FOR [IncludeWorkflowStateFound];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationDataFilters_IncludeWorkflowStateHistory]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters]
    ADD CONSTRAINT [DF_AccessCertificationDataFilters_IncludeWorkflowStateHistory] DEFAULT ((1)) FOR [IncludeWorkflowStateHistory];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationItems_ReviewerDecision]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationItems]
    ADD CONSTRAINT [DF_AccessCertificationItems_ReviewerDecision] DEFAULT ((0)) FOR [ReviewDecision];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationItems_AdministratorDecision]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationItems]
    ADD CONSTRAINT [DF_AccessCertificationItems_AdministratorDecision] DEFAULT ((0)) FOR [AdministratorDecision];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationItems_IsCompleted]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationItems]
    ADD CONSTRAINT [DF_AccessCertificationItems_IsCompleted] DEFAULT ((0)) FOR [IsCompleted];


GO
PRINT N'Creating [dbo].[DF_AccessCertificationItems_IsTransferred]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationItems]
    ADD CONSTRAINT [DF_AccessCertificationItems_IsTransferred] DEFAULT ((0)) FOR [IsTransferred];


GO
PRINT N'Creating [dbo].[DF_ForwardedAccessCertificationItems_IsConfirmed]...';


GO
ALTER TABLE [dbo].[US_ForwardedAccessCertificationItems]
    ADD CONSTRAINT [DF_ForwardedAccessCertificationItems_IsConfirmed] DEFAULT ((0)) FOR [IsConfirmed];


GO
PRINT N'Creating [dbo].[FK_AccessControlFilters_Rule]...';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessControlFilters_Rule] FOREIGN KEY ([Rule_Id]) REFERENCES [dbo].[UA_AccessControlRules] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessControlFilters_Binding]...';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessControlFilters_Binding] FOREIGN KEY ([Binding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessControlFilters_Dimension]...';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessControlFilters_Dimension] FOREIGN KEY ([Dimension_Id]) REFERENCES [dbo].[UM_Dimensions] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedProfiles_Context]...';


GO
ALTER TABLE [dbo].[UA_AssignedProfiles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedProfiles_Context] FOREIGN KEY ([Context_Id]) REFERENCES [dbo].[UA_ProfileContexts] ([Id]);


GO
PRINT N'Creating [dbo].[FK_OpenIdClients_ProfileContext]...';


GO
ALTER TABLE [dbo].[UA_OpenIdClients] WITH NOCHECK
    ADD CONSTRAINT [FK_OpenIdClients_ProfileContext] FOREIGN KEY ([Context_Id]) REFERENCES [dbo].[UA_ProfileContexts] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_Category]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_CompositeRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_SingleRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_ResourceType]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Connectors_Agent]...';


GO
ALTER TABLE [dbo].[UC_Connectors] WITH NOCHECK
    ADD CONSTRAINT [FK_Connectors_Agent] FOREIGN KEY ([Agent_Id]) REFERENCES [dbo].[UC_Agents] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityTypeMappings_Connector]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityTypeMappings_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityAssociationMappings_Connector]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityAssociationMappings_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityPropertyMappings_EntityProperty]...';


GO
ALTER TABLE [dbo].[UC_EntityPropertyMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityPropertyMappings_EntityProperty] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityAssociationMappings_EntityPropertyMapping1]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityAssociationMappings_EntityPropertyMapping1] FOREIGN KEY ([EntityPropertyMapping1_Id]) REFERENCES [dbo].[UC_EntityPropertyMappings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityAssociationMappings_EntityPropertyMapping2]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityAssociationMappings_EntityPropertyMapping2] FOREIGN KEY ([EntityPropertyMapping2_Id]) REFERENCES [dbo].[UC_EntityPropertyMappings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Jobs]...';


GO
ALTER TABLE [dbo].[UJ_JobInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_Jobs] FOREIGN KEY ([Job_Id]) REFERENCES [dbo].[UJ_Jobs] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedResourceErrors_JobInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceErrors_JobInstance] FOREIGN KEY ([JobInstance_Id]) REFERENCES [dbo].[UJ_TaskInstances] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Agent]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] WITH NOCHECK
    ADD CONSTRAINT [FK_Agent] FOREIGN KEY ([Agent_Id]) REFERENCES [dbo].[UC_Agents] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Dimensions_EntityType]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] WITH NOCHECK
    ADD CONSTRAINT [FK_Dimensions_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Dimensions_ParentProperty]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] WITH NOCHECK
    ADD CONSTRAINT [FK_Dimensions_ParentProperty] FOREIGN KEY ([ParentProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Dimensions_PathProperty]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] WITH NOCHECK
    ADD CONSTRAINT [FK_Dimensions_PathProperty] FOREIGN KEY ([PathProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceLinks_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceLinks_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[UM_EntityAssociations] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayEntityAssociations_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityAssociations_EntityAssociation] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityAssociations] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityAssociationMappings_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityAssociationMappings_EntityAssociation] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityAssociations] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityAssociations_Property1]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityAssociations_Property1] FOREIGN KEY ([Property1_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityAssociations_Property2]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityAssociations_Property2] FOREIGN KEY ([Property2_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Nodes_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UU_Nodes] WITH NOCHECK
    ADD CONSTRAINT [FK_Nodes_EntityAssociation] FOREIGN KEY ([EntityAssociation_Id]) REFERENCES [dbo].[UM_EntityAssociations] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityProperties_EntityProperty] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessControlEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UA_AccessControlEntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessControlEntityProperties_EntityProperty] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty] FOREIGN KEY ([ParentTreeNavDisplayProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Forms_MainProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] WITH NOCHECK
    ADD CONSTRAINT [FK_Forms_MainProperty] FOREIGN KEY ([MainProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Forms_RecordProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] WITH NOCHECK
    ADD CONSTRAINT [FK_Forms_RecordProperty] FOREIGN KEY ([RecordProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Forms_RecordStartProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] WITH NOCHECK
    ADD CONSTRAINT [FK_Forms_RecordStartProperty] FOREIGN KEY ([RecordStartProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Forms_RecordEndProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] WITH NOCHECK
    ADD CONSTRAINT [FK_Forms_RecordEndProperty] FOREIGN KEY ([RecordEndProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Forms_RecordSortProperty]...';


GO
ALTER TABLE [dbo].[UI_Forms] WITH NOCHECK
    ADD CONSTRAINT [FK_Forms_RecordSortProperty] FOREIGN KEY ([RecordSortProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Changes_Property]...';


GO
ALTER TABLE [dbo].[UW_Changes] WITH NOCHECK
    ADD CONSTRAINT [FK_Changes_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_BindingItems_Property]...';


GO
ALTER TABLE [dbo].[UM_BindingItems] WITH NOCHECK
    ADD CONSTRAINT [FK_BindingItems_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedResourceNavigations_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceNavigations_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedResourceScalars_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceScalars_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RecordSections_StartProperty_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] WITH NOCHECK
    ADD CONSTRAINT [FK_RecordSections_StartProperty_Id] FOREIGN KEY ([StartProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RecordSections_EndProperty_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] WITH NOCHECK
    ADD CONSTRAINT [FK_RecordSections_EndProperty_Id] FOREIGN KEY ([EndProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityPropertyExpressions_Property]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityPropertyExpressions_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityPropertyExpressions_PropertyCriteria]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityPropertyExpressions_PropertyCriteria] FOREIGN KEY ([PropertyCriteria_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RecordProperties_Property_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_RecordProperties_Property_Id] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityProperties_EntityType]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityProperties_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityProperties_Language]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityProperties_Language] FOREIGN KEY ([Language_Id]) REFERENCES [dbo].[UM_Languages] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityProperties_NeutralProperty]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityProperties_NeutralProperty] FOREIGN KEY ([NeutralProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceFiles_Property]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceFiles_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_ObjectClasseProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_ObjectClasseProperty] FOREIGN KEY ([ObjectClassProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_DNProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_DNProperty] FOREIGN KEY ([DNProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_ParentProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_ParentProperty] FOREIGN KEY ([ParentProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_UserAcountControlProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_UserAcountControlProperty] FOREIGN KEY ([UserAccountControlProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_RDNProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_RDNProperty] FOREIGN KEY ([RDNProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayEntityTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityTypes_EntityType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityTypeMappings_EntityType]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityTypeMappings_EntityType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Workflows_VariablesType]...';


GO
ALTER TABLE [dbo].[UW_Workflows] WITH NOCHECK
    ADD CONSTRAINT [FK_Workflows_VariablesType] FOREIGN KEY ([VariablesType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleCounters_EntityType]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleCounters_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Resources_Type]...';


GO
ALTER TABLE [dbo].[UR_Resources] WITH NOCHECK
    ADD CONSTRAINT [FK_Resources_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_MenuItems_EntityType]...';


GO
ALTER TABLE [dbo].[UI_MenuItems] WITH NOCHECK
    ADD CONSTRAINT [FK_MenuItems_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayTables_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayTables] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayTables_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_HomonymWorkflowLinks_FormEntityType]...';


GO
ALTER TABLE [dbo].[UW_HomonymEntityLinks] WITH NOCHECK
    ADD CONSTRAINT [FK_HomonymWorkflowLinks_FormEntityType] FOREIGN KEY ([FormEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessControlRules_EntityType]...';


GO
ALTER TABLE [dbo].[UA_AccessControlRules] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessControlRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_FormControls_EntityType]...';


GO
ALTER TABLE [dbo].[UI_FormControls] WITH NOCHECK
    ADD CONSTRAINT [FK_FormControls_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Forms_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Forms] WITH NOCHECK
    ADD CONSTRAINT [FK_Forms_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceChanges_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceChanges] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceChanges_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ReportQueries_EntityType]...';


GO
ALTER TABLE [dbo].[UQ_ReportQueries] WITH NOCHECK
    ADD CONSTRAINT [FK_ReportQueries_EntityType] FOREIGN KEY ([ReturnedEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WorkflowInstances_Type]...';


GO
ALTER TABLE [dbo].[UW_WorkflowInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_WorkflowInstances_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SearchBars_EntityType]...';


GO
ALTER TABLE [dbo].[UI_SearchBars] WITH NOCHECK
    ADD CONSTRAINT [FK_SearchBars_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SearchBars_SearchedEntityType]...';


GO
ALTER TABLE [dbo].[UI_SearchBars] WITH NOCHECK
    ADD CONSTRAINT [FK_SearchBars_SearchedEntityType] FOREIGN KEY ([SearchedEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RecordSections_SourceEntityType_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] WITH NOCHECK
    ADD CONSTRAINT [FK_RecordSections_SourceEntityType_Id] FOREIGN KEY ([SourceEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RecordSections_ResourceEntityType_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] WITH NOCHECK
    ADD CONSTRAINT [FK_RecordSections_ResourceEntityType_Id] FOREIGN KEY ([ResourceEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityPropertyExpressions_EntityType]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityPropertyExpressions_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Nodes_EntityType]...';


GO
ALTER TABLE [dbo].[UU_Nodes] WITH NOCHECK
    ADD CONSTRAINT [FK_Nodes_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_SourceEntityTypes]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_SourceEntityTypes] FOREIGN KEY ([SourceEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_SourceEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_SourceEntityType] FOREIGN KEY ([SourceEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_TargetEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_TargetEntityType] FOREIGN KEY ([TargetEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Notifications_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[UN_Notifications] WITH NOCHECK
    ADD CONSTRAINT [FK_Notifications_OwnerEntityType] FOREIGN KEY ([OwnerEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Tiles_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Tiles] WITH NOCHECK
    ADD CONSTRAINT [FK_Tiles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypesCategories_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypesCategories_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRolesCategories_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRolesCategories_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleCounters_Category]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleCounters_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRolesCategories_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRolesCategories_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Categories_Category]...';


GO
ALTER TABLE [dbo].[UP_Categories] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Category] FOREIGN KEY ([Parent_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Categories_Policy]...';


GO
ALTER TABLE [dbo].[UP_Categories] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_CompositeRoles] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRolesCategories_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRolesCategories_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedCompositeRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedCompositeRoles_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleCounters_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleCounters_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_TargetBinding] FOREIGN KEY ([TargetBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_SourceBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_SourceBinding] FOREIGN KEY ([SourceBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_SingleRole0] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypesCategories_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypesCategories_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedResourceTypes_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceTypes_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileRuleContexts_ResourceType_Id]...';


GO
ALTER TABLE [dbo].[UA_ProfileRuleContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_ContextRule]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_ContextRule] FOREIGN KEY ([ContextRule_Id]) REFERENCES [dbo].[UP_ContextRules] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_ResourceType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRolesCategories_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRolesCategories_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedSingleRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedSingleRoles_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedCompositeRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedCompositeRoles_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] NOCHECK CONSTRAINT [FK_AssignedCompositeRoles_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_AssignedCompositeRoles_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedCompositeRoles_ParametersContext] FOREIGN KEY ([ParametersContext_Id]) REFERENCES [dbo].[UP_Contexts] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] NOCHECK CONSTRAINT [FK_AssignedCompositeRoles_ParametersContext];


GO
PRINT N'Creating [dbo].[FK_AssignedSingleRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedSingleRoles_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] NOCHECK CONSTRAINT [FK_AssignedSingleRoles_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_AssignedSingleRoles_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedSingleRoles_ParametersContext] FOREIGN KEY ([ParametersContext_Id]) REFERENCES [dbo].[UP_Contexts] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] NOCHECK CONSTRAINT [FK_AssignedSingleRoles_ParametersContext];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceNavigations_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceNavigations_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] NOCHECK CONSTRAINT [FK_AssignedResourceNavigations_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceScalars_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceScalars_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] NOCHECK CONSTRAINT [FK_AssignedResourceScalars_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceTypes_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceTypes_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] NOCHECK CONSTRAINT [FK_AssignedResourceTypes_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceTypes_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceTypes_ParametersContext] FOREIGN KEY ([ParametersContext_Id]) REFERENCES [dbo].[UP_Contexts] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] NOCHECK CONSTRAINT [FK_AssignedResourceTypes_ParametersContext];


GO
PRINT N'Creating [dbo].[FK_SynchronizationHistory_Connector]...';


GO
ALTER TABLE [dbo].[UC_SynchronizationHistory] WITH NOCHECK
    ADD CONSTRAINT [FK_SynchronizationHistory_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SynchronizationHistory_TaskInstance]...';


GO
ALTER TABLE [dbo].[UC_SynchronizationHistory] WITH NOCHECK
    ADD CONSTRAINT [FK_SynchronizationHistory_TaskInstance] FOREIGN KEY ([TaskInstance_Id]) REFERENCES [dbo].[UJ_TaskInstances] ([Id]);


GO
PRINT N'Creating [dbo].[FK_JobSteps_Task]...';


GO
ALTER TABLE [dbo].[UJ_JobSteps] WITH NOCHECK
    ADD CONSTRAINT [FK_JobSteps_Task] FOREIGN KEY ([Task_Id]) REFERENCES [dbo].[UJ_Tasks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_JobSteps_Job]...';


GO
ALTER TABLE [dbo].[UJ_JobSteps] WITH NOCHECK
    ADD CONSTRAINT [FK_JobSteps_Job] FOREIGN KEY ([Job_Id]) REFERENCES [dbo].[UJ_Jobs] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskDimensions_Job]...';


GO
ALTER TABLE [dbo].[UJ_TaskDimensions] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskDimensions_Job] FOREIGN KEY ([Task_Id]) REFERENCES [dbo].[UJ_Tasks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskDimensions_Dimension]...';


GO
ALTER TABLE [dbo].[UJ_TaskDimensions] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskDimensions_Dimension] FOREIGN KEY ([Dimension_Id]) REFERENCES [dbo].[UM_Dimensions] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskEntityTypes_Job]...';


GO
ALTER TABLE [dbo].[UJ_TaskEntityTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskEntityTypes_Job] FOREIGN KEY ([Task_Id]) REFERENCES [dbo].[UJ_Tasks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskEntityTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskEntityTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskEntityTypes_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskInstances_Jobs]...';


GO
ALTER TABLE [dbo].[UJ_TaskInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskInstances_Jobs] FOREIGN KEY ([Task_Id]) REFERENCES [dbo].[UJ_Tasks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskInstances_JobInstances]...';


GO
ALTER TABLE [dbo].[UJ_TaskInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskInstances_JobInstances] FOREIGN KEY ([JobInstance_Id]) REFERENCES [dbo].[UJ_JobInstances] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskResourceTypes_Job]...';


GO
ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskResourceTypes_Job] FOREIGN KEY ([Task_Id]) REFERENCES [dbo].[UJ_Tasks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskResourceTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskResourceTypes_EntityType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Tasks_Agent]...';


GO
ALTER TABLE [dbo].[UJ_Tasks] WITH NOCHECK
    ADD CONSTRAINT [FK_Tasks_Agent] FOREIGN KEY ([Agent_Id]) REFERENCES [dbo].[UC_Agents] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Tasks_OpenIdClient]...';


GO
ALTER TABLE [dbo].[UJ_Tasks] WITH NOCHECK
    ADD CONSTRAINT [FK_Tasks_OpenIdClient] FOREIGN KEY ([OpenIdClient_Id]) REFERENCES [dbo].[UA_OpenIdClients] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Tasks_Connector]...';


GO
ALTER TABLE [dbo].[UJ_Tasks] WITH NOCHECK
    ADD CONSTRAINT [FK_Tasks_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IdentifiedRisks_Risk]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] WITH NOCHECK
    ADD CONSTRAINT [FK_IdentifiedRisks_Risk] FOREIGN KEY ([Risk_Id]) REFERENCES [dbo].[UP_Risks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IdentifiedRisks_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] WITH NOCHECK
    ADD CONSTRAINT [FK_IdentifiedRisks_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] NOCHECK CONSTRAINT [FK_IdentifiedRisks_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_IndirectResourceBinding]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_IndirectResourceBinding] FOREIGN KEY ([IndirectResourceBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_EntityTypeReflexiveProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_EntityTypeReflexiveProperty] FOREIGN KEY ([TargetEntityTypeReflexiveProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_IndirectResourceReflexiveProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_IndirectResourceReflexiveProperty] FOREIGN KEY ([IndirectResourceReflexiveProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_ResourceProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_ResourceProperty] FOREIGN KEY ([TargetEntityTypeProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_DenialProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_DenialProperty] FOREIGN KEY ([DenialProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRuleItems_Risk]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_Risk] FOREIGN KEY ([Risk_Id]) REFERENCES [dbo].[UP_Risks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRuleItems_Rule]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_Rule] FOREIGN KEY ([Rule_Id]) REFERENCES [dbo].[UP_RiskRules] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRuleItems_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRuleItems_Property]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRules_Risk]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRules_Risk] FOREIGN KEY ([Risk_Id]) REFERENCES [dbo].[UP_Risks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Risks_Policy]...';


GO
ALTER TABLE [dbo].[UP_Risks] WITH NOCHECK
    ADD CONSTRAINT [FK_Risks_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationCampaigns_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationCampaigns] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationCampaigns_OwnerEntityType] FOREIGN KEY ([OwnerEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationDataFilters_Campaign]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationDataFilters_Campaign] FOREIGN KEY ([Campaign_Id]) REFERENCES [dbo].[US_AccessCertificationCampaigns] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationDataFilters_Category]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationDataFilters_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationDataFilters_ResourceType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationItem_Campaign]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationItems] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationItem_Campaign] FOREIGN KEY ([Campaign_Id]) REFERENCES [dbo].[US_AccessCertificationCampaigns] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationOwnerFilters_Campaign]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationOwnerFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationOwnerFilters_Campaign] FOREIGN KEY ([Campaign_Id]) REFERENCES [dbo].[US_AccessCertificationCampaigns] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ForwardedAccessCertificationItem_Item]...';


GO
ALTER TABLE [dbo].[US_ForwardedAccessCertificationItems] WITH NOCHECK
    ADD CONSTRAINT [FK_ForwardedAccessCertificationItem_Item] FOREIGN KEY ([Item_Id]) REFERENCES [dbo].[US_AccessCertificationItems] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Agent]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Agent] FOREIGN KEY ([Agent_Id]) REFERENCES [dbo].[UC_Agents] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Connector]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_EntityType]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Profile]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Profile] FOREIGN KEY ([Profile_Id]) REFERENCES [dbo].[UA_Profiles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Property]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Workflow]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Workflow] FOREIGN KEY ([Workflow_Id]) REFERENCES [dbo].[UW_Workflows] ([Id]);


GO
PRINT N'Creating [dbo].[CHK_CompositeRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_CompositeRoles_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));


GO
PRINT N'Creating [dbo].[CHK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_CompositeRoles_EntityType] CHECK ("ValidTo"!=(CONVERT("datetime2"(2),'9999-12-31 23:59:59.9999999')) OR "Policy_Id" IS NOT NULL);


GO
PRINT N'Creating [dbo].[CHK_ResourceTypes_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [CHK_ResourceTypes_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));


GO
PRINT N'Creating [dbo].[CHK_SingleRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_SingleRoles_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));

GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [dbo].[UA_AccessControlFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessControlFilters_Rule];

ALTER TABLE [dbo].[UA_AccessControlFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessControlFilters_Binding];

ALTER TABLE [dbo].[UA_AccessControlFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessControlFilters_Dimension];

ALTER TABLE [dbo].[UA_AssignedProfiles] WITH CHECK CHECK CONSTRAINT [FK_AssignedProfiles_Context];

ALTER TABLE [dbo].[UA_OpenIdClients] WITH CHECK CHECK CONSTRAINT [FK_OpenIdClients_ProfileContext];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_Category];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_CompositeRole];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_SingleRole];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_ResourceType];

ALTER TABLE [dbo].[UC_Connectors] WITH CHECK CHECK CONSTRAINT [FK_Connectors_Agent];

ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityTypeMappings_Connector];

ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociationMappings_Connector];

ALTER TABLE [dbo].[UC_EntityPropertyMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyMappings_EntityProperty];

ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociationMappings_EntityPropertyMapping1];

ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociationMappings_EntityPropertyMapping2];

ALTER TABLE [dbo].[UJ_JobInstances] WITH CHECK CHECK CONSTRAINT [FK_Jobs];

ALTER TABLE [dbo].[UP_AssignedResourceErrors] WITH CHECK CHECK CONSTRAINT [FK_AssignedResourceErrors_JobInstance];

ALTER TABLE [dbo].[UJ_Jobs] WITH CHECK CHECK CONSTRAINT [FK_Agent];

ALTER TABLE [dbo].[UM_Dimensions] WITH CHECK CHECK CONSTRAINT [FK_Dimensions_EntityType];

ALTER TABLE [dbo].[UM_Dimensions] WITH CHECK CHECK CONSTRAINT [FK_Dimensions_ParentProperty];

ALTER TABLE [dbo].[UM_Dimensions] WITH CHECK CHECK CONSTRAINT [FK_Dimensions_PathProperty];

ALTER TABLE [dbo].[UR_ResourceLinks] WITH CHECK CHECK CONSTRAINT [FK_ResourceLinks_Type];

ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityAssociations_EntityAssociation];

ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociationMappings_EntityAssociation];

ALTER TABLE [dbo].[UM_EntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociations_Property1];

ALTER TABLE [dbo].[UM_EntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociations_Property2];

ALTER TABLE [dbo].[UU_Nodes] WITH CHECK CHECK CONSTRAINT [FK_Nodes_EntityAssociation];

ALTER TABLE [dbo].[UI_DisplayEntityProperties] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityProperties_EntityProperty];

ALTER TABLE [dbo].[UA_AccessControlEntityProperties] WITH CHECK CHECK CONSTRAINT [FK_AccessControlEntityProperties_EntityProperty];

ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Property];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_MainProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordStartProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordEndProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordSortProperty];

ALTER TABLE [dbo].[UW_Changes] WITH CHECK CHECK CONSTRAINT [FK_Changes_Property];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Property];

ALTER TABLE [dbo].[UM_BindingItems] WITH CHECK CHECK CONSTRAINT [FK_BindingItems_Property];

ALTER TABLE [dbo].[UP_AssignedResourceNavigations] WITH CHECK CHECK CONSTRAINT [FK_AssignedResourceNavigations_Property];

ALTER TABLE [dbo].[UP_AssignedResourceScalars] WITH CHECK CHECK CONSTRAINT [FK_AssignedResourceScalars_Property];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_StartProperty_Id];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_EndProperty_Id];

ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyExpressions_Property];

ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyExpressions_PropertyCriteria];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Property];

ALTER TABLE [dbo].[UP_RecordProperties] WITH CHECK CHECK CONSTRAINT [FK_RecordProperties_Property_Id];

ALTER TABLE [dbo].[UM_EntityProperties] WITH CHECK CHECK CONSTRAINT [FK_EntityProperties_EntityType];

ALTER TABLE [dbo].[UM_EntityProperties] WITH CHECK CHECK CONSTRAINT [FK_EntityProperties_Language];

ALTER TABLE [dbo].[UM_EntityProperties] WITH CHECK CHECK CONSTRAINT [FK_EntityProperties_NeutralProperty];

ALTER TABLE [dbo].[UR_ResourceFiles] WITH CHECK CHECK CONSTRAINT [FK_ResourceFiles_Property];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ObjectClasseProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_DNProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ParentProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_UserAcountControlProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_RDNProperty];

ALTER TABLE [dbo].[UI_DisplayEntityTypes] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityTypes_EntityType];

ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityTypeMappings_EntityType];

ALTER TABLE [dbo].[UW_Workflows] WITH CHECK CHECK CONSTRAINT [FK_Workflows_VariablesType];

ALTER TABLE [dbo].[UP_RoleCounters] WITH CHECK CHECK CONSTRAINT [FK_RoleCounters_EntityType];

ALTER TABLE [dbo].[UR_Resources] WITH CHECK CHECK CONSTRAINT [FK_Resources_Type];

ALTER TABLE [dbo].[UI_MenuItems] WITH CHECK CHECK CONSTRAINT [FK_MenuItems_EntityType];

ALTER TABLE [dbo].[UI_DisplayTables] WITH CHECK CHECK CONSTRAINT [FK_DisplayTables_EntityType];

ALTER TABLE [dbo].[UW_HomonymEntityLinks] WITH CHECK CHECK CONSTRAINT [FK_HomonymWorkflowLinks_FormEntityType];

ALTER TABLE [dbo].[UA_AccessControlRules] WITH CHECK CHECK CONSTRAINT [FK_AccessControlRules_EntityType];

ALTER TABLE [dbo].[UI_FormControls] WITH CHECK CHECK CONSTRAINT [FK_FormControls_EntityType];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_EntityType];

ALTER TABLE [dbo].[UR_ResourceChanges] WITH CHECK CHECK CONSTRAINT [FK_ResourceChanges_Type];

ALTER TABLE [dbo].[UQ_ReportQueries] WITH CHECK CHECK CONSTRAINT [FK_ReportQueries_EntityType];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_EntityType];

ALTER TABLE [dbo].[UW_WorkflowInstances] WITH CHECK CHECK CONSTRAINT [FK_WorkflowInstances_Type];

ALTER TABLE [dbo].[UI_SearchBars] WITH CHECK CHECK CONSTRAINT [FK_SearchBars_EntityType];

ALTER TABLE [dbo].[UI_SearchBars] WITH CHECK CHECK CONSTRAINT [FK_SearchBars_SearchedEntityType];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_SourceEntityType_Id];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_ResourceEntityType_Id];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_EntityType];

ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyExpressions_EntityType];

ALTER TABLE [dbo].[UU_Nodes] WITH CHECK CHECK CONSTRAINT [FK_Nodes_EntityType];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_SourceEntityTypes];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_SourceEntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_TargetEntityType];

ALTER TABLE [dbo].[UN_Notifications] WITH CHECK CHECK CONSTRAINT [FK_Notifications_OwnerEntityType];

ALTER TABLE [dbo].[UI_Tiles] WITH CHECK CHECK CONSTRAINT [FK_Tiles_EntityType];

ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypesCategories_Category];

ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_CompositeRolesCategories_Category];

ALTER TABLE [dbo].[UP_RoleCounters] WITH CHECK CHECK CONSTRAINT [FK_RoleCounters_Category];

ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_SingleRolesCategories_Category];

ALTER TABLE [dbo].[UP_Categories] WITH CHECK CHECK CONSTRAINT [FK_Categories_Category];

ALTER TABLE [dbo].[UP_Categories] WITH CHECK CHECK CONSTRAINT [FK_Categories_Policy];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_Category];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_Category];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_Category];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_Policy];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];

ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_CompositeRolesCategories_CompositeRole];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_CompositeRole];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_Policy];

ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_AssignedCompositeRoles_Role];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_Policy];

ALTER TABLE [dbo].[UP_RoleCounters] WITH CHECK CHECK CONSTRAINT [FK_RoleCounters_Policy];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Policy];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_Policy];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Policy];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Policy];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_Policy];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Policy];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_Policy];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_Policy];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_SingleRole];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_TargetBinding];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_SourceBinding];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_SingleRole0];

ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypesCategories_ResourceType];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];

ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_AssignedResourceTypes_ResourceType];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_ResourceType];

ALTER TABLE [dbo].[UA_ProfileRuleContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_ContextRule];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ResourceType];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Role];

ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_SingleRolesCategories_SingleRole];

ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH CHECK CHECK CONSTRAINT [FK_AssignedSingleRoles_Role];

ALTER TABLE [dbo].[UC_SynchronizationHistory] WITH CHECK CHECK CONSTRAINT [FK_SynchronizationHistory_Connector];

ALTER TABLE [dbo].[UC_SynchronizationHistory] WITH CHECK CHECK CONSTRAINT [FK_SynchronizationHistory_TaskInstance];

ALTER TABLE [dbo].[UJ_JobSteps] WITH CHECK CHECK CONSTRAINT [FK_JobSteps_Task];

ALTER TABLE [dbo].[UJ_JobSteps] WITH CHECK CHECK CONSTRAINT [FK_JobSteps_Job];

ALTER TABLE [dbo].[UJ_TaskDimensions] WITH CHECK CHECK CONSTRAINT [FK_TaskDimensions_Job];

ALTER TABLE [dbo].[UJ_TaskDimensions] WITH CHECK CHECK CONSTRAINT [FK_TaskDimensions_Dimension];

ALTER TABLE [dbo].[UJ_TaskEntityTypes] WITH CHECK CHECK CONSTRAINT [FK_TaskEntityTypes_Job];

ALTER TABLE [dbo].[UJ_TaskEntityTypes] WITH CHECK CHECK CONSTRAINT [FK_TaskEntityTypes_EntityType];

ALTER TABLE [dbo].[UJ_TaskInstances] WITH CHECK CHECK CONSTRAINT [FK_TaskInstances_Jobs];

ALTER TABLE [dbo].[UJ_TaskInstances] WITH CHECK CHECK CONSTRAINT [FK_TaskInstances_JobInstances];

ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_TaskResourceTypes_Job];

ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_TaskResourceTypes_EntityType];

ALTER TABLE [dbo].[UJ_Tasks] WITH CHECK CHECK CONSTRAINT [FK_Tasks_Agent];

ALTER TABLE [dbo].[UJ_Tasks] WITH CHECK CHECK CONSTRAINT [FK_Tasks_OpenIdClient];

ALTER TABLE [dbo].[UJ_Tasks] WITH CHECK CHECK CONSTRAINT [FK_Tasks_Connector];

ALTER TABLE [dbo].[UP_IdentifiedRisks] WITH CHECK CHECK CONSTRAINT [FK_IdentifiedRisks_Risk];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_IndirectResourceBinding];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_EntityTypeReflexiveProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_IndirectResourceReflexiveProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_ResourceProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_ResourceType];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_DenialProperty];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Risk];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Rule];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_ResourceType];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Property];

ALTER TABLE [dbo].[UP_RiskRules] WITH CHECK CHECK CONSTRAINT [FK_RiskRules_Risk];

ALTER TABLE [dbo].[UP_RiskRules] WITH CHECK CHECK CONSTRAINT [FK_RiskRules_Policy];

ALTER TABLE [dbo].[UP_Risks] WITH CHECK CHECK CONSTRAINT [FK_Risks_Policy];

ALTER TABLE [dbo].[US_AccessCertificationCampaigns] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationCampaigns_OwnerEntityType];

ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationDataFilters_Campaign];

ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationDataFilters_Category];

ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType];

ALTER TABLE [dbo].[US_AccessCertificationItems] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationItem_Campaign];

ALTER TABLE [dbo].[US_AccessCertificationOwnerFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationOwnerFilters_Campaign];

ALTER TABLE [dbo].[US_ForwardedAccessCertificationItems] WITH CHECK CHECK CONSTRAINT [FK_ForwardedAccessCertificationItem_Item];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Agent];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Connector];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_EntityType];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Profile];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Property];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Workflow];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [CHK_CompositeRoles_ApprovalWorkflowType];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [CHK_CompositeRoles_EntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [CHK_ResourceTypes_ApprovalWorkflowType];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [CHK_SingleRoles_ApprovalWorkflowType];


GO
PRINT N'Update complete.';


GO
