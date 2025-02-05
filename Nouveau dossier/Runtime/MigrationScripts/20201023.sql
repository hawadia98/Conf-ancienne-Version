/* Migration script for 5.1.6 */
/* Assignments optimization to cluster everything to the owner */
ALTER TABLE "UP_AssignedCompositeRoles" ADD "OwnerType" BIGINT NULL;
ALTER TABLE "UP_AssignedSingleRoles" ADD "OwnerType" BIGINT NULL;
GO

update a
set OwnerType=r.EntityType_Id
from UP_AssignedCompositeRoles a join UP_CompositeRoles r on r.Id=a.Role_Id

update a
set OwnerType=r.EntityType_Id
from UP_AssignedSingleRoles a join UP_SingleRoles r on r.Id=a.Role_Id
GO

/* Rules optimization to cluster everything to the role */
ALTER TABLE "UP_CompositeRoleRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_CompositeRoleRules" ADD CONSTRAINT "FK_CompositeRoleRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_IndirectResourceRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_IndirectResourceRules" ADD CONSTRAINT "FK_IndirectResourceRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_ResourceClassificationRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_ResourceClassificationRules" ADD CONSTRAINT "FK_ResourceClassificationRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_ResourceCorrelationRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_ResourceCorrelationRules" ADD CONSTRAINT "FK_ResourceCorrelationRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_ResourceNavigationRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_ResourceNavigationRules" ADD CONSTRAINT "FK_ResourceNavigationRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_ResourceQueryRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_ResourceQueryRules" ADD CONSTRAINT "FK_ResourceQueryRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_ResourceScalarRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_ResourceScalarRules" ADD CONSTRAINT "FK_ResourceScalarRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_ResourceTypeRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_ResourceTypeRules" ADD CONSTRAINT "FK_ResourceTypeRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_RiskRuleItems" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_RiskRuleItems" ADD CONSTRAINT "FK_RiskRuleItems_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
ALTER TABLE "UP_SingleRoleRules" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UP_SingleRoleRules" ADD CONSTRAINT "FK_SingleRoleRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
GO

update a
set EntityType_Id=r.EntityType_Id
from UP_CompositeRoleRules a join UP_CompositeRoles r on r.Id=a.Role_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_IndirectResourceRules a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_ResourceClassificationRules a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_ResourceCorrelationRules a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_ResourceNavigationRules a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_ResourceQueryRules a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_ResourceScalarRules a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_ResourceTypeRules a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.SourceEntityType_Id
from UP_RiskRuleItems a join UP_ResourceTypes r on r.Id=a.ResourceType_Id

update a
set EntityType_Id=r.EntityType_Id
from UP_SingleRoleRules a join UP_SingleRoles r on r.Id=a.Role_Id
GO

/* Resource correlation keys optimization */
ALTER TABLE "UP_ResourceCorrelationKeys" ADD "EntityType_Id" BIGINT NULL;
ALTER TABLE "UT_ResourceCorrelationKeys" ADD "EntityType_Id" BIGINT NULL;
GO

update a
set EntityType_Id=r.Type
from UP_ResourceCorrelationKeys a join UR_Resources r on r.Id=a.Resource_Id
GO

/* TODO Add *rules and correlation keys indexes */

/* 32330 - Change default safety levels in UC_Connectors */
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxLinkPercentageInsertedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaxLinkPercentageInsertedLines] DEFAULT 5 FOR MaxLinkPercentageInsertedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxLinkPercentageDeletedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaxLinkPercentageDeletedLines] DEFAULT 5 FOR MaxLinkPercentageDeletedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxPercentageInsertedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaxPercentageInsertedLines] DEFAULT 5 FOR MaxPercentageInsertedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxPercentageDeletedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaxPercentageDeletedLines] DEFAULT 5 FOR MaxPercentageDeletedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaxPercentageUpdatedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaxPercentageUpdatedLines] DEFAULT 5 FOR MaxPercentageUpdatedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumInsertedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaximumInsertedLines] DEFAULT 100 FOR MaximumInsertedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumDeletedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaximumDeletedLines] DEFAULT 100 FOR MaximumDeletedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumUpdatedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaximumUpdatedLines] DEFAULT 100 FOR MaximumUpdatedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumLinkInsertedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaximumLinkInsertedLines] DEFAULT 1000 FOR MaximumLinkInsertedLines;
ALTER TABLE [dbo].[UC_Connectors] DROP CONSTRAINT [DF_Connectors_MaximumLinkDeletedLines];
ALTER TABLE [dbo].[UC_Connectors] ADD CONSTRAINT [DF_Connectors_MaximumLinkDeletedLines] DEFAULT 1000 FOR MaximumLinkDeletedLines;
GO



/**** generated script *****/

/*
Deployment script for Usercube515

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO


GO
PRINT N'Dropping [dbo].[DF_Job_LogLevel]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [DF_Job_LogLevel];


GO
PRINT N'Dropping [dbo].[DF_Jobs_StartDisabled]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [DF_Jobs_StartDisabled];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LP]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LP];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LR]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LR];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LU]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LU];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LV]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LV];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L10]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L10];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L18]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L18];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LL]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LL];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LK]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LK];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LM]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LM];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L19]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L19];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LF]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LF];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LG]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LG];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LH]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LH];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L9]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L9];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LA]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LA];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LB]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LB];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L13]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L13];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L14]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L14];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L15]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L15];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L34]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L34];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L31]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L31];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L30]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L30];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L35]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L35];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LI]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LI];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L17]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L17];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L16]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L16];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L38]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L38];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L37]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L37];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L36]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L36];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LC]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LC];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LD]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LD];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LE]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LE];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L27]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L27];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L26]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L26];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L8]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L8];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LS]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LS];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LT]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LT];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L33]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L33];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L32]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L32];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L23]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L23];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L24]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L24];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L25]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L25];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L39]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L39];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L20]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L20];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L21]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L21];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L22]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L22];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L11]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L11];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L29]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L29];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L28]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L28];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LN]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LN];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LO]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LO];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L12]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L12];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceClassificationRules_ResourceTypeIdentificationConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [DF_ResourceClassificationRules_ResourceTypeIdentificationConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceClassificationRules_SourceMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [DF_ResourceClassificationRules_SourceMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceCorrelationRules_SourceMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [DF_ResourceCorrelationRules_SourceMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L36]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L36];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L35]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L35];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L34]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L34];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L19]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L19];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L8]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L8];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L7]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L7];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LC]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LC];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L9]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L9];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LD]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LD];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LE]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LE];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L39]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L39];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L4]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L4];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LI]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LI];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LT]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LT];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LU]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LU];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L20]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L20];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L23]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L23];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L24]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L24];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L16]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L16];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L15]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L15];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LG]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LG];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LF]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LF];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LH]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LH];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L6]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L6];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L5]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L5];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L33]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L33];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L32]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L32];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LR]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LR];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LS]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LS];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L27]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L27];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L26]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L26];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L25]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L25];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L17]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L17];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L18]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L18];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LB]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LB];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LA]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LA];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LK]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LK];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LL]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LL];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LM]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LM];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LV]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LV];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L10]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L10];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L38]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L38];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L0]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L0];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L37]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L37];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L11]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L11];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L31]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L31];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L30]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L30];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L21]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L21];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L22]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L22];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L12]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L12];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L13]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L13];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L14]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L14];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L29]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L29];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L28]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L28];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LN]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LN];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LO]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LO];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LP]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LP];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TargetMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TargetMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceScalarRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [DF_ResourceScalarRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceScalarRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [DF_ResourceScalarRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceScalarRules_IsMapped]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [DF_ResourceScalarRules_IsMapped];


GO
PRINT N'Dropping [dbo].[DF_ResourceScalarRules_ComparisonType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [DF_ResourceScalarRules_ComparisonType];


GO
PRINT N'Dropping [dbo].[DF_ResourceScalarRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [DF_ResourceScalarRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L26]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L26];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L27]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L27];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LG]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LG];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LH]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LH];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LS]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LS];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LR]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LR];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L9]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L9];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LA]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LA];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LB]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LB];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L11]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L11];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L36]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L36];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L37]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L37];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L35]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L35];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L12]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L12];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L20]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L20];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L21]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L21];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L6];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LL]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LL];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LM]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LM];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L30]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L30];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L31]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L31];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LC]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LC];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L32]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L32];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L8]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L8];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L16]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L16];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L15]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L15];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LD]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LD];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L23]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L23];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L24]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L24];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L25]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L25];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L22]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L22];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LU]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LU];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LT]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LT];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LI]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LI];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LK]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LK];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LF]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LF];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L13]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L13];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LE]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LE];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L39]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L39];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L38]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L38];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L34]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L34];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L33]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L33];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LP]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LP];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LN]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LN];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LO]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LO];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L29]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L29];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L28]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L28];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LV]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LV];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L10]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L10];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L19]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L19];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L18]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L18];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L14]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L14];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L17]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LL]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LL];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L25]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L25];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L24]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L24];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L26]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L26];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L15]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L15];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L16]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L16];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LM]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LM];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L14]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L14];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L35]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L35];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LU]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LU];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LV]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LV];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LE]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LE];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L10]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L10];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LH]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LH];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LG]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LG];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LF]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LF];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L34]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L34];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LA]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LA];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L9]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L9];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L39]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L39];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L30]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L30];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L20]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L20];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L21]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L21];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LP]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LP];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L18]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L18];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L17]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LI]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LI];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L11]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L11];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L12]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L12];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LK]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LK];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L19]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L19];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LT]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LT];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LO]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LO];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LS]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LS];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LR]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LR];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L38]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L38];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L37]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L37];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LN]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LN];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L36]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L36];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LD]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LD];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LC]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LC];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L31]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L31];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L29]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L29];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L28]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L28];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L23]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L23];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L27]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L27];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L13]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L13];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L22]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L22];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L8]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L8];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LB]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LB];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L32]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L32];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L33]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L33];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_EntityTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityTypes] DROP CONSTRAINT [DF_EntityTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Policies_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Risks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [DF_Risks_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[FK_Agent]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] DROP CONSTRAINT [FK_Agent];


GO
PRINT N'Dropping [dbo].[FK_JobSteps_Job]...';


GO
ALTER TABLE [dbo].[UJ_JobSteps] DROP CONSTRAINT [FK_JobSteps_Job];


GO
PRINT N'Dropping [dbo].[FK_Jobs]...';


GO
ALTER TABLE [dbo].[UJ_JobInstances] DROP CONSTRAINT [FK_Jobs];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_IndirectResourceBinding]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_IndirectResourceBinding];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_EntityTypeReflexiveProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_EntityTypeReflexiveProperty];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_IndirectResourceReflexiveProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_IndirectResourceReflexiveProperty];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_ResourceProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_ResourceProperty];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_DenialProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_DenialProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_Binding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_Binding];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_TargetBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_TargetBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_SourceBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_SourceBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Binding]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Binding];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_SingleRole0];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_EntityType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_EntityType];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_Risk]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_Risk];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_Rule]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_Rule];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_Property]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_Property];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Role];


GO
PRINT N'Renaming [dbo].[DF_ScaffoldingArguments_FileAreEncrypted]...';


GO
IF EXISTS (SELECT * FROM sys.sysobjects WHERE id=object_Id('[DF_ScaffoldingArguments_FileAreEncrypted]'))
    EXEC sp_rename 'dbo.DF_ScaffoldingArguments_FileAreEncrypted', 'DF_ScaffoldingArguments_FileAreNotEncrypted';


GO
PRINT N'Altering [dbo].[UC_EntityPropertyMappings]...';


GO
ALTER TABLE [dbo].[UC_EntityPropertyMappings]
    ADD [ScimSchema] NVARCHAR (4000) NULL;


GO
PRINT N'Altering [dbo].[UJ_JobInstances]...';


GO
ALTER TABLE [dbo].[UJ_JobInstances]
    ADD [Retry] BIT CONSTRAINT [DF_JobInstances_Retry] DEFAULT (0) NOT NULL;


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
    [CronTimeZone]       INT            CONSTRAINT [DF_Job_CronTimeZone] DEFAULT ((0)) NOT NULL,
    [Agent_Id]           BIGINT         NULL,
    [UserStartDenied]    BIT            CONSTRAINT [DF_Jobs_StartDisabled] DEFAULT ((0)) NOT NULL,
    [LastJobInstance_Id] BIGINT         NULL,
    [LogLevel]           INT            CONSTRAINT [DF_Job_LogLevel] DEFAULT ((6)) NOT NULL,
    [IsIncremental]      BIT            CONSTRAINT [DF_Jobs_IsIncremental] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Jobs1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Jobs1] UNIQUE NONCLUSTERED ([Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UJ_Jobs])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UJ_Jobs] ([Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [CronTabExpression], [Agent_Id], [UserStartDenied], [LastJobInstance_Id], [LogLevel])
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
                 [CronTabExpression],
                 [Agent_Id],
                 [UserStartDenied],
                 [LastJobInstance_Id],
                 [LogLevel]
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
PRINT N'Altering [dbo].[UM_Bindings]...';


GO
ALTER TABLE [dbo].[UM_Bindings]
    ADD [Path] NVARCHAR (4000) NULL;


GO
PRINT N'Altering [dbo].[UN_NotificationTemplates]...';


GO
ALTER TABLE [dbo].[UN_NotificationTemplates] DROP COLUMN [HeaderTemplate_L1], COLUMN [HeaderTemplate_L2], COLUMN [HeaderTemplate_L3], COLUMN [HeaderTemplate_L4];


GO
/*
The column EntityType_Id on table [dbo].[UP_CompositeRoleRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_CompositeRoleRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_CompositeRoleRules] (
    [Id]            BIGINT NOT NULL,
    [Policy_Id]     BIGINT NOT NULL,
    [Type]          INT    CONSTRAINT [DF_CompositeRoleRules_Type] DEFAULT ((0)) NOT NULL,
    [EntityType_Id] BIGINT NOT NULL,
    [Role_Id]       BIGINT NOT NULL,
    [IsDenied]      BIT    CONSTRAINT [DF_CompositeRoleRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [L0]            BIT    CONSTRAINT [DF_CompositeRoleRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]            BIT    CONSTRAINT [DF_CompositeRoleRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]            BIT    CONSTRAINT [DF_CompositeRoleRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]            BIT    CONSTRAINT [DF_CompositeRoleRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]            BIT    CONSTRAINT [DF_CompositeRoleRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]            BIT    CONSTRAINT [DF_CompositeRoleRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]            BIT    CONSTRAINT [DF_CompositeRoleRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]            BIT    CONSTRAINT [DF_CompositeRoleRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]            BIT    CONSTRAINT [DF_CompositeRoleRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]            BIT    CONSTRAINT [DF_CompositeRoleRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]            BIT    CONSTRAINT [DF_CompositeRoleRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]            BIT    CONSTRAINT [DF_CompositeRoleRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]            BIT    CONSTRAINT [DF_CompositeRoleRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]            BIT    CONSTRAINT [DF_CompositeRoleRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]            BIT    CONSTRAINT [DF_CompositeRoleRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]            BIT    CONSTRAINT [DF_CompositeRoleRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]            BIT    CONSTRAINT [DF_CompositeRoleRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]            BIT    CONSTRAINT [DF_CompositeRoleRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]            BIT    CONSTRAINT [DF_CompositeRoleRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]            BIT    CONSTRAINT [DF_CompositeRoleRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]            BIT    CONSTRAINT [DF_CompositeRoleRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]            BIT    CONSTRAINT [DF_CompositeRoleRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]            BIT    CONSTRAINT [DF_CompositeRoleRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]            BIT    CONSTRAINT [DF_CompositeRoleRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]            BIT    CONSTRAINT [DF_CompositeRoleRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]            BIT    CONSTRAINT [DF_CompositeRoleRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]            BIT    CONSTRAINT [DF_CompositeRoleRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]            BIT    CONSTRAINT [DF_CompositeRoleRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]            BIT    CONSTRAINT [DF_CompositeRoleRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]            BIT    CONSTRAINT [DF_CompositeRoleRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]            BIT    CONSTRAINT [DF_CompositeRoleRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]            BIT    CONSTRAINT [DF_CompositeRoleRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]           BIT    CONSTRAINT [DF_CompositeRoleRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]           BIT    CONSTRAINT [DF_CompositeRoleRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]           BIT    CONSTRAINT [DF_CompositeRoleRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]           BIT    CONSTRAINT [DF_CompositeRoleRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]           BIT    CONSTRAINT [DF_CompositeRoleRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]           BIT    CONSTRAINT [DF_CompositeRoleRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]           BIT    CONSTRAINT [DF_CompositeRoleRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]           BIT    CONSTRAINT [DF_CompositeRoleRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]           BIT    CONSTRAINT [DF_CompositeRoleRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]           BIT    CONSTRAINT [DF_CompositeRoleRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]           BIT    CONSTRAINT [DF_CompositeRoleRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]           BIT    CONSTRAINT [DF_CompositeRoleRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]           BIT    CONSTRAINT [DF_CompositeRoleRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]           BIT    CONSTRAINT [DF_CompositeRoleRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]           BIT    CONSTRAINT [DF_CompositeRoleRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]           BIT    CONSTRAINT [DF_CompositeRoleRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]           BIT    CONSTRAINT [DF_CompositeRoleRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]           BIT    CONSTRAINT [DF_CompositeRoleRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]           BIT    CONSTRAINT [DF_CompositeRoleRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]           BIT    CONSTRAINT [DF_CompositeRoleRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]           BIT    CONSTRAINT [DF_CompositeRoleRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]           BIT    CONSTRAINT [DF_CompositeRoleRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]           BIT    CONSTRAINT [DF_CompositeRoleRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]           BIT    CONSTRAINT [DF_CompositeRoleRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]           BIT    CONSTRAINT [DF_CompositeRoleRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]           BIT    CONSTRAINT [DF_CompositeRoleRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]           BIT    CONSTRAINT [DF_CompositeRoleRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]           BIT    CONSTRAINT [DF_CompositeRoleRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]           BIT    CONSTRAINT [DF_CompositeRoleRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]           BIT    CONSTRAINT [DF_CompositeRoleRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3V] DEFAULT ((0)) NOT NULL,
    [D0_Id]         BIGINT NULL,
    [D1_Id]         BIGINT NULL,
    [D2_Id]         BIGINT NULL,
    [D3_Id]         BIGINT NULL,
    [D4_Id]         BIGINT NULL,
    [D5_Id]         BIGINT NULL,
    [D6_Id]         BIGINT NULL,
    [D7_Id]         BIGINT NULL,
    [D8_Id]         BIGINT NULL,
    [D9_Id]         BIGINT NULL,
    [DA_Id]         BIGINT NULL,
    [DB_Id]         BIGINT NULL,
    [DC_Id]         BIGINT NULL,
    [DD_Id]         BIGINT NULL,
    [DE_Id]         BIGINT NULL,
    [DF_Id]         BIGINT NULL,
    [DG_Id]         BIGINT NULL,
    [DH_Id]         BIGINT NULL,
    [DI_Id]         BIGINT NULL,
    [DJ_Id]         BIGINT NULL,
    [DK_Id]         BIGINT NULL,
    [DL_Id]         BIGINT NULL,
    [DM_Id]         BIGINT NULL,
    [DN_Id]         BIGINT NULL,
    [DO_Id]         BIGINT NULL,
    [DP_Id]         BIGINT NULL,
    [DQ_Id]         BIGINT NULL,
    [DR_Id]         BIGINT NULL,
    [DS_Id]         BIGINT NULL,
    [DT_Id]         BIGINT NULL,
    [DU_Id]         BIGINT NULL,
    [DV_Id]         BIGINT NULL,
    [D10_Id]        BIGINT NULL,
    [D11_Id]        BIGINT NULL,
    [D12_Id]        BIGINT NULL,
    [D13_Id]        BIGINT NULL,
    [D14_Id]        BIGINT NULL,
    [D15_Id]        BIGINT NULL,
    [D16_Id]        BIGINT NULL,
    [D17_Id]        BIGINT NULL,
    [D18_Id]        BIGINT NULL,
    [D19_Id]        BIGINT NULL,
    [D1A_Id]        BIGINT NULL,
    [D1B_Id]        BIGINT NULL,
    [D1C_Id]        BIGINT NULL,
    [D1D_Id]        BIGINT NULL,
    [D1E_Id]        BIGINT NULL,
    [D1F_Id]        BIGINT NULL,
    [D1G_Id]        BIGINT NULL,
    [D1H_Id]        BIGINT NULL,
    [D1I_Id]        BIGINT NULL,
    [D1J_Id]        BIGINT NULL,
    [D1K_Id]        BIGINT NULL,
    [D1L_Id]        BIGINT NULL,
    [D1M_Id]        BIGINT NULL,
    [D1N_Id]        BIGINT NULL,
    [D1O_Id]        BIGINT NULL,
    [D1P_Id]        BIGINT NULL,
    [D1Q_Id]        BIGINT NULL,
    [D1R_Id]        BIGINT NULL,
    [D1S_Id]        BIGINT NULL,
    [D1T_Id]        BIGINT NULL,
    [D1U_Id]        BIGINT NULL,
    [D1V_Id]        BIGINT NULL,
    [D20_Id]        BIGINT NULL,
    [D21_Id]        BIGINT NULL,
    [D22_Id]        BIGINT NULL,
    [D23_Id]        BIGINT NULL,
    [D24_Id]        BIGINT NULL,
    [D25_Id]        BIGINT NULL,
    [D26_Id]        BIGINT NULL,
    [D27_Id]        BIGINT NULL,
    [D28_Id]        BIGINT NULL,
    [D29_Id]        BIGINT NULL,
    [D2A_Id]        BIGINT NULL,
    [D2B_Id]        BIGINT NULL,
    [D2C_Id]        BIGINT NULL,
    [D2D_Id]        BIGINT NULL,
    [D2E_Id]        BIGINT NULL,
    [D2F_Id]        BIGINT NULL,
    [D2G_Id]        BIGINT NULL,
    [D2H_Id]        BIGINT NULL,
    [D2I_Id]        BIGINT NULL,
    [D2J_Id]        BIGINT NULL,
    [D2K_Id]        BIGINT NULL,
    [D2L_Id]        BIGINT NULL,
    [D2M_Id]        BIGINT NULL,
    [D2N_Id]        BIGINT NULL,
    [D2O_Id]        BIGINT NULL,
    [D2P_Id]        BIGINT NULL,
    [D2Q_Id]        BIGINT NULL,
    [D2R_Id]        BIGINT NULL,
    [D2S_Id]        BIGINT NULL,
    [D2T_Id]        BIGINT NULL,
    [D2U_Id]        BIGINT NULL,
    [D2V_Id]        BIGINT NULL,
    [D30_Id]        BIGINT NULL,
    [D31_Id]        BIGINT NULL,
    [D32_Id]        BIGINT NULL,
    [D33_Id]        BIGINT NULL,
    [D34_Id]        BIGINT NULL,
    [D35_Id]        BIGINT NULL,
    [D36_Id]        BIGINT NULL,
    [D37_Id]        BIGINT NULL,
    [D38_Id]        BIGINT NULL,
    [D39_Id]        BIGINT NULL,
    [D3A_Id]        BIGINT NULL,
    [D3B_Id]        BIGINT NULL,
    [D3C_Id]        BIGINT NULL,
    [D3D_Id]        BIGINT NULL,
    [D3E_Id]        BIGINT NULL,
    [D3F_Id]        BIGINT NULL,
    [D3G_Id]        BIGINT NULL,
    [D3H_Id]        BIGINT NULL,
    [D3I_Id]        BIGINT NULL,
    [D3J_Id]        BIGINT NULL,
    [D3K_Id]        BIGINT NULL,
    [D3L_Id]        BIGINT NULL,
    [D3M_Id]        BIGINT NULL,
    [D3N_Id]        BIGINT NULL,
    [D3O_Id]        BIGINT NULL,
    [D3P_Id]        BIGINT NULL,
    [D3Q_Id]        BIGINT NULL,
    [D3R_Id]        BIGINT NULL,
    [D3S_Id]        BIGINT NULL,
    [D3T_Id]        BIGINT NULL,
    [D3U_Id]        BIGINT NULL,
    [D3V_Id]        BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_CompositeRoleRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_CompositeRoleRules1]
    ON [dbo].[tmp_ms_xx_UP_CompositeRoleRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_CompositeRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_CompositeRoleRules] ([EntityType_Id], [Id], [Policy_Id], [Type], [Role_Id], [IsDenied], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [Role_Id],
                 [IsDenied],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_CompositeRoleRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_CompositeRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_CompositeRoleRules]', N'UP_CompositeRoleRules';

EXECUTE sp_rename N'[dbo].[UP_CompositeRoleRules].[tmp_ms_xx_index_IX_CompositeRoleRules1]', N'IX_CompositeRoleRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_CompositeRoleRules1]', N'PK_CompositeRoleRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_IndirectResourceRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_IndirectResourceRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_IndirectResourceRules] (
    [Id]                                   BIGINT NOT NULL,
    [EntityType_Id]                        BIGINT NOT NULL,
    [ResourceType_Id]                      BIGINT NOT NULL,
    [TargetEntityTypeProperty_Id]          BIGINT NOT NULL,
    [IndirectResourceBinding_Id]           BIGINT NOT NULL,
    [TargetEntityTypeReflexiveProperty_Id] BIGINT NULL,
    [IndirectResourceReflexiveProperty_Id] BIGINT NULL,
    [DenialProperty_Id]                    BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_IndirectResourceRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_IndirectResourceRules1]
    ON [dbo].[tmp_ms_xx_UP_IndirectResourceRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_IndirectResourceRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_IndirectResourceRules] ([EntityType_Id], [Id], [ResourceType_Id], [TargetEntityTypeProperty_Id], [IndirectResourceBinding_Id], [TargetEntityTypeReflexiveProperty_Id], [IndirectResourceReflexiveProperty_Id], [DenialProperty_Id])
        SELECT   [EntityType_Id],
                 [Id],
                 [ResourceType_Id],
                 [TargetEntityTypeProperty_Id],
                 [IndirectResourceBinding_Id],
                 [TargetEntityTypeReflexiveProperty_Id],
                 [IndirectResourceReflexiveProperty_Id],
                 [DenialProperty_Id]
        FROM     [dbo].[UP_IndirectResourceRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_IndirectResourceRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_IndirectResourceRules]', N'UP_IndirectResourceRules';

EXECUTE sp_rename N'[dbo].[UP_IndirectResourceRules].[tmp_ms_xx_index_IX_IndirectResourceRules1]', N'IX_IndirectResourceRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_IndirectResourceRules1]', N'PK_IndirectResourceRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_ResourceClassificationRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceClassificationRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceClassificationRules] (
    [Id]                                        BIGINT         NOT NULL,
    [Policy_Id]                                 BIGINT         NOT NULL,
    [EntityType_Id]                             BIGINT         NOT NULL,
    [ResourceType_Id]                           BIGINT         NOT NULL,
    [ResourceTypeIdentificationConfidenceLevel] INT            CONSTRAINT [DF_ResourceClassificationRules_ResourceTypeIdentificationConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [SourceMatchedConfidenceLevel]              BIT            CONSTRAINT [DF_ResourceClassificationRules_SourceMatchedConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [TargetExpression]                          VARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceClassificationRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceClassificationRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceClassificationRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceClassificationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceClassificationRules] ([EntityType_Id], [Id], [Policy_Id], [ResourceType_Id], [ResourceTypeIdentificationConfidenceLevel], [SourceMatchedConfidenceLevel], [TargetExpression])
        SELECT   [EntityType_Id],
                 [Id],
                 [Policy_Id],
                 [ResourceType_Id],
                 [ResourceTypeIdentificationConfidenceLevel],
                 [SourceMatchedConfidenceLevel],
                 [TargetExpression]
        FROM     [dbo].[UP_ResourceClassificationRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceClassificationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceClassificationRules]', N'UP_ResourceClassificationRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceClassificationRules].[tmp_ms_xx_index_IX_ResourceClassificationRules1]', N'IX_ResourceClassificationRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceClassificationRules1]', N'PK_ResourceClassificationRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_ResourceCorrelationKeys] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceCorrelationKeys]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceCorrelationKeys] (
    [Id]                    BIGINT         NOT NULL,
    [EntityType_Id]         BIGINT         NOT NULL,
    [BindingExpressionHash] INT            NOT NULL,
    [Resource_Id]           BIGINT         NOT NULL,
    [Value]                 NVARCHAR (442) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceCorrelationKeys1] PRIMARY KEY CLUSTERED ([EntityType_Id] ASC, [BindingExpressionHash] ASC, [Value] ASC, [Resource_Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceCorrelationKeys])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceCorrelationKeys] ([EntityType_Id], [BindingExpressionHash], [Value], [Resource_Id], [Id])
        SELECT   [EntityType_Id],
                 [BindingExpressionHash],
                 [Value],
                 [Resource_Id],
                 [Id]
        FROM     [dbo].[UP_ResourceCorrelationKeys]
        ORDER BY [EntityType_Id] ASC, [BindingExpressionHash] ASC, [Value] ASC, [Resource_Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceCorrelationKeys];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceCorrelationKeys]', N'UP_ResourceCorrelationKeys';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceCorrelationKeys1]', N'PK_ResourceCorrelationKeys', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UP_ResourceCorrelationKeys].[IX_ResourceCorrelationKeys]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ResourceCorrelationKeys]
    ON [dbo].[UP_ResourceCorrelationKeys]([Resource_Id] ASC, [EntityType_Id] ASC, [BindingExpressionHash] ASC, [Value] ASC)
    INCLUDE([Id]) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
/*
The column EntityType_Id on table [dbo].[UP_ResourceCorrelationRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceCorrelationRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceCorrelationRules] (
    [Id]                           BIGINT         NOT NULL,
    [Policy_Id]                    BIGINT         NOT NULL,
    [EntityType_Id]                BIGINT         NOT NULL,
    [ResourceType_Id]              BIGINT         NOT NULL,
    [SourceBinding_Id]             BIGINT         NULL,
    [SourceExpression]             VARCHAR (4000) NULL,
    [TargetBinding_Id]             BIGINT         NULL,
    [TargetExpression]             VARCHAR (4000) NULL,
    [SourceMatchedConfidenceLevel] INT            CONSTRAINT [DF_ResourceCorrelationRules_SourceMatchedConfidenceLevel] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceCorrelationRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceCorrelationRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceCorrelationRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceCorrelationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceCorrelationRules] ([EntityType_Id], [Id], [Policy_Id], [ResourceType_Id], [SourceBinding_Id], [SourceExpression], [TargetBinding_Id], [TargetExpression], [SourceMatchedConfidenceLevel])
        SELECT   [EntityType_Id],
                 [Id],
                 [Policy_Id],
                 [ResourceType_Id],
                 [SourceBinding_Id],
                 [SourceExpression],
                 [TargetBinding_Id],
                 [TargetExpression],
                 [SourceMatchedConfidenceLevel]
        FROM     [dbo].[UP_ResourceCorrelationRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceCorrelationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceCorrelationRules]', N'UP_ResourceCorrelationRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceCorrelationRules].[tmp_ms_xx_index_IX_ResourceCorrelationRules1]', N'IX_ResourceCorrelationRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceCorrelationRules1]', N'PK_ResourceCorrelationRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_ResourceNavigationRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
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
    [EntityType_Id]             BIGINT NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceNavigationRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceNavigationRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceNavigationRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceNavigationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceNavigationRules] ([EntityType_Id], [Id], [Policy_Id], [Type], [Resource_Id], [ResourceType_Id], [Property_Id], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Id],
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
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_ResourceNavigationRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceNavigationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceNavigationRules]', N'UP_ResourceNavigationRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceNavigationRules].[tmp_ms_xx_index_IX_ResourceNavigationRules1]', N'IX_ResourceNavigationRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceNavigationRules1]', N'PK_ResourceNavigationRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_ResourceQueryRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceQueryRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceQueryRules] (
    [Id]                           BIGINT         NOT NULL,
    [Policy_Id]                    BIGINT         NOT NULL,
    [EntityType_Id]                BIGINT         NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceQueryRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceQueryRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceQueryRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceQueryRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceQueryRules] ([EntityType_Id], [Id], [Policy_Id], [ResourceType_Id], [Property_Id], [TargetMatchedConfidenceLevel], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SourceBinding_Id], [SourceExpression], [TargetBinding_Id], [TargetExpression])
        SELECT   [EntityType_Id],
                 [Id],
                 [Policy_Id],
                 [ResourceType_Id],
                 [Property_Id],
                 [TargetMatchedConfidenceLevel],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SourceBinding_Id],
                 [SourceExpression],
                 [TargetBinding_Id],
                 [TargetExpression]
        FROM     [dbo].[UP_ResourceQueryRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceQueryRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceQueryRules]', N'UP_ResourceQueryRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceQueryRules].[tmp_ms_xx_index_IX_ResourceQueryRules1]', N'IX_ResourceQueryRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceQueryRules1]', N'PK_ResourceQueryRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_ResourceScalarRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceScalarRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceScalarRules] (
    [Id]                        BIGINT         NOT NULL,
    [Policy_Id]                 BIGINT         NOT NULL,
    [EntityType_Id]             BIGINT         NOT NULL,
    [ResourceType_Id]           BIGINT         NOT NULL,
    [Property_Id]               BIGINT         NOT NULL,
    [TimeOffsetReference]       INT            CONSTRAINT [DF_ResourceScalarRules_TimeOffsetReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetBeforeReference] INT            CONSTRAINT [DF_ResourceScalarRules_TimeOffsetBeforeReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetAfterReference]  INT            CONSTRAINT [DF_ResourceScalarRules_TimeOffsetAfterReference] DEFAULT ((0)) NOT NULL,
    [ComparisonType]            INT            CONSTRAINT [DF_ResourceScalarRules_ComparisonType] DEFAULT ((0)) NOT NULL,
    [IsMapped]                  BIT            CONSTRAINT [DF_ResourceScalarRules_IsMapped] DEFAULT ((1)) NOT NULL,
    [Binding_Id]                BIGINT         NULL,
    [Expression]                VARCHAR (4000) NULL,
    [SingleRole_Id]             BIGINT         NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceScalarRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceScalarRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceScalarRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceScalarRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceScalarRules] ([EntityType_Id], [Id], [Policy_Id], [ResourceType_Id], [Property_Id], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [ComparisonType], [IsMapped], [Binding_Id], [Expression], [SingleRole_Id])
        SELECT   [EntityType_Id],
                 [Id],
                 [Policy_Id],
                 [ResourceType_Id],
                 [Property_Id],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [ComparisonType],
                 [IsMapped],
                 [Binding_Id],
                 [Expression],
                 [SingleRole_Id]
        FROM     [dbo].[UP_ResourceScalarRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceScalarRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceScalarRules]', N'UP_ResourceScalarRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceScalarRules].[tmp_ms_xx_index_IX_ResourceScalarRules1]', N'IX_ResourceScalarRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceScalarRules1]', N'PK_ResourceScalarRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_ResourceTypeRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
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
    [EntityType_Id]             BIGINT NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypeRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceTypeRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceTypeRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceTypeRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceTypeRules] ([EntityType_Id], [Id], [Policy_Id], [Type], [ResourceType_Id], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [ResourceType_Id],
                 [IsDenied],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SingleRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_ResourceTypeRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceTypeRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceTypeRules]', N'UP_ResourceTypeRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceTypeRules].[tmp_ms_xx_index_IX_ResourceTypeRules1]', N'IX_ResourceTypeRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypeRules1]', N'PK_ResourceTypeRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_RiskRuleItems] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_RiskRuleItems]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_RiskRuleItems] (
    [Id]              BIGINT          NOT NULL,
    [Risk_Id]         BIGINT          NOT NULL,
    [Rule_Id]         BIGINT          NOT NULL,
    [EntityType_Id]   BIGINT          NOT NULL,
    [ResourceType_Id] BIGINT          NOT NULL,
    [Property_Id]     BIGINT          NOT NULL,
    [Resource_Id]     BIGINT          NULL,
    [Value]           NVARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_CK_RiskRuleItems1] UNIQUE CLUSTERED ([EntityType_Id] ASC, [Risk_Id] ASC, [Rule_Id] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_PK_RiskRuleItems1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_RiskRuleItems])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_RiskRuleItems] ([EntityType_Id], [Risk_Id], [Rule_Id], [Id], [ResourceType_Id], [Property_Id], [Resource_Id], [Value])
        SELECT   [EntityType_Id],
                 [Risk_Id],
                 [Rule_Id],
                 [Id],
                 [ResourceType_Id],
                 [Property_Id],
                 [Resource_Id],
                 [Value]
        FROM     [dbo].[UP_RiskRuleItems]
        ORDER BY [EntityType_Id] ASC, [Risk_Id] ASC, [Rule_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_RiskRuleItems];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_RiskRuleItems]', N'UP_RiskRuleItems';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_CK_RiskRuleItems1]', N'CK_RiskRuleItems', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_RiskRuleItems1]', N'PK_RiskRuleItems', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UP_SingleRoleRules] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
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
    [EntityType_Id]    BIGINT NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_SingleRoleRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_SingleRoleRules1]
    ON [dbo].[tmp_ms_xx_UP_SingleRoleRules]([EntityType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_SingleRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_SingleRoleRules] ([EntityType_Id], [Id], [Policy_Id], [Type], [Role_Id], [IsDenied], [CompositeRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [Role_Id],
                 [IsDenied],
                 [CompositeRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_SingleRoleRules]
        ORDER BY [EntityType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_SingleRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_SingleRoleRules]', N'UP_SingleRoleRules';

EXECUTE sp_rename N'[dbo].[UP_SingleRoleRules].[tmp_ms_xx_index_IX_SingleRoleRules1]', N'IX_SingleRoleRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SingleRoleRules1]', N'PK_SingleRoleRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column EntityType_Id on table [dbo].[UT_ResourceCorrelationKeys] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UT_ResourceCorrelationKeys]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UT_ResourceCorrelationKeys] (
    [EntityType_Id]         BIGINT         NOT NULL,
    [BindingExpressionHash] INT            NOT NULL,
    [Resource_Id]           BIGINT         NOT NULL,
    [Value]                 NVARCHAR (442) NOT NULL,
    [NewValue]              NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_TmpResourceCorrelationKeys1] PRIMARY KEY CLUSTERED ([EntityType_Id] ASC, [BindingExpressionHash] ASC, [Value] ASC, [Resource_Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UT_ResourceCorrelationKeys])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_ResourceCorrelationKeys] ([EntityType_Id], [BindingExpressionHash], [Value], [Resource_Id], [NewValue])
        SELECT   [EntityType_Id],
                 [BindingExpressionHash],
                 [Value],
                 [Resource_Id],
                 [NewValue]
        FROM     [dbo].[UT_ResourceCorrelationKeys]
        ORDER BY [EntityType_Id] ASC, [BindingExpressionHash] ASC, [Value] ASC, [Resource_Id] ASC;
    END

DROP TABLE [dbo].[UT_ResourceCorrelationKeys];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_ResourceCorrelationKeys]', N'UT_ResourceCorrelationKeys';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_TmpResourceCorrelationKeys1]', N'PK_TmpResourceCorrelationKeys', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UW_ActivityInstances]...';


GO
ALTER TABLE [dbo].[UW_ActivityInstances]
    ADD [ChangeSetSummary] NVARCHAR (442) NULL;


GO
PRINT N'Creating [dbo].[UC_ConnectionColumns]...';


GO
CREATE TABLE [dbo].[UC_ConnectionColumns] (
    [Id]               BIGINT         NOT NULL,
    [Table_Id]         BIGINT         NOT NULL,
    [Identifier]       VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [KeyType]          TINYINT        NOT NULL,
    [ValueType]        TINYINT        NOT NULL,
    [ValueLength]      INT            NOT NULL,
    [DisplayName]      NVARCHAR (442) NULL,
    [Path]             NVARCHAR (442) NULL,
    [UpdateDate]       DATETIME       NULL,
    [ForeignColumn_Id] BIGINT         NULL,
    CONSTRAINT [PK_ConnectionColumns] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_ConnectionColumns_Identifier] UNIQUE NONCLUSTERED ([Table_Id] ASC, [Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[UC_Connections]...';


GO
CREATE TABLE [dbo].[UC_Connections] (
    [Id]             BIGINT         NOT NULL,
    [Connector_Id]   BIGINT         NOT NULL,
    [Identifier]     VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1] NVARCHAR (442) NOT NULL,
    [DisplayName_L2] NVARCHAR (442) NULL,
    [DisplayName_L3] NVARCHAR (442) NULL,
    [DisplayName_L4] NVARCHAR (442) NULL,
    [DisplayName_L5] NVARCHAR (442) NULL,
    [DisplayName_L6] NVARCHAR (442) NULL,
    [DisplayName_L7] NVARCHAR (442) NULL,
    [DisplayName_L8] NVARCHAR (442) NULL,
    [RefreshDate]    DATETIME       NULL,
    CONSTRAINT [PK_Connections] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_Connections_Identifier] UNIQUE NONCLUSTERED ([Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[UC_ConnectionTables]...';


GO
CREATE TABLE [dbo].[UC_ConnectionTables] (
    [Id]            BIGINT         NOT NULL,
    [Connection_Id] BIGINT         NOT NULL,
    [Identifier]    VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName]   NVARCHAR (442) NULL,
    [Path]          NVARCHAR (442) NULL,
    [UpdateDate]    DATETIME       NULL,
    CONSTRAINT [PK_ConnectionTables] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_ConnectionTables_Identifier] UNIQUE NONCLUSTERED ([Connection_Id] ASC, [Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[DF_EntityAssociations_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations]
    ADD CONSTRAINT [DF_EntityAssociations_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_EntityProperties_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties]
    ADD CONSTRAINT [DF_EntityProperties_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_EntityTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityTypes]
    ADD CONSTRAINT [DF_EntityTypes_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_CompositeRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles]
    ADD CONSTRAINT [DF_CompositeRoles_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_Policies_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Policies]
    ADD CONSTRAINT [DF_Policies_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_ResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes]
    ADD CONSTRAINT [DF_ResourceTypes_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_Risks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Risks]
    ADD CONSTRAINT [DF_Risks_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_SingleRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles]
    ADD CONSTRAINT [DF_SingleRoles_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_ConnectionColumns_KeyType]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns]
    ADD CONSTRAINT [DF_ConnectionColumns_KeyType] DEFAULT ((0)) FOR [KeyType];


GO
PRINT N'Creating [dbo].[DF_ConnectionColumns_ValueType]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns]
    ADD CONSTRAINT [DF_ConnectionColumns_ValueType] DEFAULT ((0)) FOR [ValueType];


GO
PRINT N'Creating [dbo].[DF_ConnectionColumns_ValueLength]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns]
    ADD CONSTRAINT [DF_ConnectionColumns_ValueLength] DEFAULT ((0)) FOR [ValueLength];



GO
PRINT N'Creating [dbo].[FK_Agent]...';


GO
ALTER TABLE [dbo].[UJ_Jobs] WITH NOCHECK
    ADD CONSTRAINT [FK_Agent] FOREIGN KEY ([Agent_Id]) REFERENCES [dbo].[UC_Agents] ([Id]);


GO
PRINT N'Creating [dbo].[FK_JobSteps_Job]...';


GO
ALTER TABLE [dbo].[UJ_JobSteps] WITH NOCHECK
    ADD CONSTRAINT [FK_JobSteps_Job] FOREIGN KEY ([Job_Id]) REFERENCES [dbo].[UJ_Jobs] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Jobs]...';


GO
ALTER TABLE [dbo].[UJ_JobInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_Jobs] FOREIGN KEY ([Job_Id]) REFERENCES [dbo].[UJ_Jobs] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


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
PRINT N'Creating [dbo].[FK_IndirectResourceRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_Binding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_Binding] FOREIGN KEY ([SourceBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_TargetBinding] FOREIGN KEY ([TargetBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceScalarRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Binding]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Binding] FOREIGN KEY ([Binding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


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
PRINT N'Creating [dbo].[FK_RiskRuleItems_EntityType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


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
PRINT N'Creating [dbo].[FK_SingleRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ConnectionColumns_Table]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] WITH NOCHECK
    ADD CONSTRAINT [FK_ConnectionColumns_Table] FOREIGN KEY ([Table_Id]) REFERENCES [dbo].[UC_ConnectionTables] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ConnectionColumns_ForeignColumn]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] WITH NOCHECK
    ADD CONSTRAINT [FK_ConnectionColumns_ForeignColumn] FOREIGN KEY ([ForeignColumn_Id]) REFERENCES [dbo].[UC_ConnectionColumns] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Connections_Connector]...';


GO
ALTER TABLE [dbo].[UC_Connections] WITH NOCHECK
    ADD CONSTRAINT [FK_Connections_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ConnectionTables_Connection]...';


GO
ALTER TABLE [dbo].[UC_ConnectionTables] WITH NOCHECK
    ADD CONSTRAINT [FK_ConnectionTables_Connection] FOREIGN KEY ([Connection_Id]) REFERENCES [dbo].[UC_Connections] ([Id]);


GO
PRINT N'Creating [dbo].[UJ_Jobs].[UJ_Jobs]...';


GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [dbo].[UJ_Jobs] WITH CHECK CHECK CONSTRAINT [FK_Agent];

ALTER TABLE [dbo].[UJ_JobSteps] WITH CHECK CHECK CONSTRAINT [FK_JobSteps_Job];

ALTER TABLE [dbo].[UJ_JobInstances] WITH CHECK CHECK CONSTRAINT [FK_Jobs];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_EntityType];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_Policy];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_EntityType];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_IndirectResourceBinding];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_EntityTypeReflexiveProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_IndirectResourceReflexiveProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_ResourceProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_ResourceType];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_DenialProperty];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_Binding];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_TargetBinding];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Property];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_SingleRole];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Policy];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Property];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_TargetBinding];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_SourceBinding];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Policy];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Property];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Binding];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_SingleRole];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_Policy];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_SingleRole0];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_EntityType];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Risk];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Rule];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_ResourceType];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Property];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_EntityType];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Policy];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_CompositeRole];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Role];

ALTER TABLE [dbo].[UC_ConnectionColumns] WITH CHECK CHECK CONSTRAINT [FK_ConnectionColumns_Table];

ALTER TABLE [dbo].[UC_ConnectionColumns] WITH CHECK CHECK CONSTRAINT [FK_ConnectionColumns_ForeignColumn];

ALTER TABLE [dbo].[UC_Connections] WITH CHECK CHECK CONSTRAINT [FK_Connections_Connector];

ALTER TABLE [dbo].[UC_ConnectionTables] WITH CHECK CHECK CONSTRAINT [FK_ConnectionTables_Connection];


GO
PRINT N'Update complete.';


GO



GO
PRINT N'Dropping [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_HasPendingOrders]...';


GO
DROP INDEX [IX_AssignedResourceTypes_HasPendingOrders]
    ON [dbo].[UP_AssignedResourceTypes];


GO
PRINT N'Dropping [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_NeedsPolicyApplication]...';


GO
DROP INDEX [IX_AssignedResourceTypes_NeedsPolicyApplication]
    ON [dbo].[UP_AssignedResourceTypes];


GO
PRINT N'Dropping [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_Resource]...';


GO
DROP INDEX [IX_AssignedResourceTypes_Resource]
    ON [dbo].[UP_AssignedResourceTypes];


GO
PRINT N'Dropping [dbo].[UR_Resources].[IX_Resources_Dirty]...';


GO
DROP INDEX [IX_Resources_Dirty]
    ON [dbo].[UR_Resources];


GO
PRINT N'Dropping [dbo].[UR_Resources].[IX_Resources_DisplayName_L1]...';


GO
DROP INDEX [IX_Resources_DisplayName_L1]
    ON [dbo].[UR_Resources];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_IsInferred]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_IsInferred];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_IsInferred]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_IsInferred];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_IdentifiedRisks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [DF_IdentifiedRisks_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceRiskScores_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_ResourceRiskScores] DROP CONSTRAINT [DF_ResourceRiskScores_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceFiles_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [DF_ResourceFiles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceLinks_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] DROP CONSTRAINT [DF_ResourceLinks_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Resources_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_Resources] DROP CONSTRAINT [DF_Resources_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceFiles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [DF_ResourceFiles_ValidFrom];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_ParametersContext];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_Role];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_ParametersContext];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_Role];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_ResourceFiles_Property]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [FK_ResourceFiles_Property];


GO
/*
The column OwnerType on table [dbo].[UP_AssignedCompositeRoles] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedCompositeRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedCompositeRoles] (
    [Id]                   BIGINT         NOT NULL,
    [Role_Id]              BIGINT         NOT NULL,
    [OwnerType]            BIGINT         NOT NULL,
    [Owner_Id]             BIGINT         NOT NULL,
    [ParametersContext_Id] BIGINT         NOT NULL,
    [IsDenied]             BIT            CONSTRAINT [DF_AssignedCompositeRoles_IsDenied] DEFAULT ((0)) NOT NULL,
    [IsInferred]           BIT            CONSTRAINT [DF_AssignedCompositeRoles_IsInferred] DEFAULT ((0)) NOT NULL,
    [WorkflowState]        TINYINT        CONSTRAINT [DF_AssignedCompositeRoles_WorkflowState] DEFAULT ((0)) NOT NULL,
    [StartDate]            SMALLDATETIME  CONSTRAINT [DF_AssignedCompositeRoles_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]              SMALLDATETIME  CONSTRAINT [DF_AssignedCompositeRoles_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [ValidFrom]            DATETIME2 (2)  CONSTRAINT [DF_AssignedCompositeRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]              DATETIME2 (2)  CONSTRAINT [DF_AssignedCompositeRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [WhenCreated]          SMALLDATETIME  CONSTRAINT [DF_AssignedCompositeRoles_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WorkflowInstance_Id]  BIGINT         NULL,
    [WhenPerformed]        SMALLDATETIME  NULL,
    [Performer_Id]         BIGINT         NULL,
    [Requester_Id]         BIGINT         NULL,
    [WhenReviewed1]        SMALLDATETIME  NULL,
    [Reviewer1_Id]         BIGINT         NULL,
    [WhenReviewed2]        SMALLDATETIME  NULL,
    [Reviewer2_Id]         BIGINT         NULL,
    [WhenReviewed3]        SMALLDATETIME  NULL,
    [Reviewer3_Id]         BIGINT         NULL,
    [Comment]              NVARCHAR (442) NULL,
    [ReviewComment1]       NVARCHAR (442) NULL,
    [ReviewComment2]       NVARCHAR (442) NULL,
    [ReviewComment3]       NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedCompositeRoles1] PRIMARY KEY CLUSTERED ([ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON),
    CONSTRAINT [tmp_ms_xx_constraint_UK_AssignedCompositeRoles1] UNIQUE NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_AssignedCompositeRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedCompositeRoles] ([ValidTo], [OwnerType], [Owner_Id], [Role_Id], [ParametersContext_Id], [StartDate], [Id], [IsDenied], [IsInferred], [WorkflowState], [EndDate], [ValidFrom], [WhenCreated], [WorkflowInstance_Id], [WhenPerformed], [Performer_Id], [Requester_Id], [WhenReviewed1], [Reviewer1_Id], [WhenReviewed2], [Reviewer2_Id], [WhenReviewed3], [Reviewer3_Id], [Comment], [ReviewComment1], [ReviewComment2], [ReviewComment3])
        SELECT   [ValidTo],
                 [OwnerType],
                 [Owner_Id],
                 [Role_Id],
                 [ParametersContext_Id],
                 [StartDate],
                 [Id],
                 [IsDenied],
                 [IsInferred],
                 [WorkflowState],
                 [EndDate],
                 [ValidFrom],
                 [WhenCreated],
                 [WorkflowInstance_Id],
                 [WhenPerformed],
                 [Performer_Id],
                 [Requester_Id],
                 [WhenReviewed1],
                 [Reviewer1_Id],
                 [WhenReviewed2],
                 [Reviewer2_Id],
                 [WhenReviewed3],
                 [Reviewer3_Id],
                 [Comment],
                 [ReviewComment1],
                 [ReviewComment2],
                 [ReviewComment3]
        FROM     [dbo].[UP_AssignedCompositeRoles]
        ORDER BY [ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedCompositeRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedCompositeRoles]', N'UP_AssignedCompositeRoles';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedCompositeRoles1]', N'PK_AssignedCompositeRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_UK_AssignedCompositeRoles1]', N'UK_AssignedCompositeRoles', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UP_AssignedResourceTypes]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes]
    ADD [ProvisioningReviewFilter] TINYINT CONSTRAINT [DF_AssignedResourceTypes_ProvisioningReviewFilter] DEFAULT ((0)) NOT NULL;


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_HasPendingOrders]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_HasPendingOrders]
    ON [dbo].[UP_AssignedResourceTypes]([HasPendingOrders] ASC)
    INCLUDE([ValidTo], [OwnerType], [Owner_Id], [Id], [ResourceType_Id], [Resource_Id], [WorkflowInstance_Id], [IsDenied], [ProvisioningState]) WHERE "HasPendingOrders"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_NeedsPolicyApplication]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_NeedsPolicyApplication]
    ON [dbo].[UP_AssignedResourceTypes]([NeedsPolicyApplication] ASC)
    INCLUDE([ValidTo], [OwnerType], [Owner_Id], [Id]) WHERE "NeedsPolicyApplication"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_Resource]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_Resource]
    ON [dbo].[UP_AssignedResourceTypes]([Resource_Id] ASC) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ProvisioningReview]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_ProvisioningReview]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [ProvisioningReviewFilter] ASC, [WorkflowInstance_Id] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ProvisioningState], [StartDate], [EndDate], [ParametersContext_Id], [Resource_Id], [ConsolidatedWorkflowBlockedState], [ConsolidatedProvisioningState], [ResourceType_Id]) WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.99');


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ResourceReconciliation]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_ResourceReconciliation]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ProvisioningState], [ParametersContext_Id], [ResourceType_Id], [Resource_Id], [ConsolidatedWorkflowFoundState], [ConsolidatedWorkflowFoundCount], [ConsolidatedProvisioningState]) WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "resource_id" IS NOT NULL AND "consolidatedworkflowfoundstate" IN (1,2,3);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [IsInferred] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ProvisioningState], [ParametersContext_Id], [ResourceType_Id], [Resource_Id], [ConsolidatedWorkflowFoundState], [ConsolidatedWorkflowFoundCount], [ConsolidatedProvisioningState]) WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "resource_id" IS NOT NULL AND "consolidatedworkflowfoundstate" IN (1,2,3);


GO
/*
The column OwnerType on table [dbo].[UP_AssignedSingleRoles] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedSingleRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedSingleRoles] (
    [Id]                   BIGINT         NOT NULL,
    [Role_Id]              BIGINT         NOT NULL,
    [OwnerType]            BIGINT         NOT NULL,
    [Owner_Id]             BIGINT         NOT NULL,
    [ParametersContext_Id] BIGINT         NOT NULL,
    [IsDenied]             BIT            CONSTRAINT [DF_AssignedSingleRoles_IsDenied] DEFAULT ((0)) NOT NULL,
    [IsInferred]           BIT            CONSTRAINT [DF_AssignedSingleRoles_IsInferred] DEFAULT ((0)) NOT NULL,
    [WorkflowState]        TINYINT        CONSTRAINT [DF_AssignedSingleRoles_WorkflowState] DEFAULT ((0)) NOT NULL,
    [StartDate]            SMALLDATETIME  CONSTRAINT [DF_AssignedSingleRoles_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]              SMALLDATETIME  CONSTRAINT [DF_AssignedSingleRoles_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [ValidFrom]            DATETIME2 (2)  CONSTRAINT [DF_AssignedSingleRoles_ValidFrom] DEFAULT (GETUTCDATE()) NOT NULL,
    [ValidTo]              DATETIME2 (2)  CONSTRAINT [DF_AssignedSingleRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [WhenCreated]          SMALLDATETIME  CONSTRAINT [DF_AssignedSingleRoles_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WorkflowInstance_Id]  BIGINT         NULL,
    [WhenPerformed]        SMALLDATETIME  NULL,
    [Performer_Id]         BIGINT         NULL,
    [Requester_Id]         BIGINT         NULL,
    [WhenReviewed1]        SMALLDATETIME  NULL,
    [Reviewer1_Id]         BIGINT         NULL,
    [WhenReviewed2]        SMALLDATETIME  NULL,
    [Reviewer2_Id]         BIGINT         NULL,
    [WhenReviewed3]        SMALLDATETIME  NULL,
    [Reviewer3_Id]         BIGINT         NULL,
    [Comment]              NVARCHAR (442) NULL,
    [ReviewComment1]       NVARCHAR (442) NULL,
    [ReviewComment2]       NVARCHAR (442) NULL,
    [ReviewComment3]       NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedSingleRoles1] PRIMARY KEY CLUSTERED ([ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON),
    CONSTRAINT [tmp_ms_xx_constraint_UK_AssignedSingleRoles1] UNIQUE NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_AssignedSingleRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedSingleRoles] ([ValidTo], [OwnerType], [Owner_Id], [Role_Id], [ParametersContext_Id], [StartDate], [Id], [IsDenied], [IsInferred], [WorkflowState], [EndDate], [ValidFrom], [WhenCreated], [WorkflowInstance_Id], [WhenPerformed], [Performer_Id], [Requester_Id], [WhenReviewed1], [Reviewer1_Id], [WhenReviewed2], [Reviewer2_Id], [WhenReviewed3], [Reviewer3_Id], [Comment], [ReviewComment1], [ReviewComment2], [ReviewComment3])
        SELECT   [ValidTo],
                 [OwnerType],
                 [Owner_Id],
                 [Role_Id],
                 [ParametersContext_Id],
                 [StartDate],
                 [Id],
                 [IsDenied],
                 [IsInferred],
                 [WorkflowState],
                 [EndDate],
                 [ValidFrom],
                 [WhenCreated],
                 [WorkflowInstance_Id],
                 [WhenPerformed],
                 [Performer_Id],
                 [Requester_Id],
                 [WhenReviewed1],
                 [Reviewer1_Id],
                 [WhenReviewed2],
                 [Reviewer2_Id],
                 [WhenReviewed3],
                 [Reviewer3_Id],
                 [Comment],
                 [ReviewComment1],
                 [ReviewComment2],
                 [ReviewComment3]
        FROM     [dbo].[UP_AssignedSingleRoles]
        ORDER BY [ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedSingleRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedSingleRoles]', N'UP_AssignedSingleRoles';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedSingleRoles1]', N'PK_AssignedSingleRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_UK_AssignedSingleRoles1]', N'UK_AssignedSingleRoles', N'OBJECT';

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
    [ValidTo]     DATETIME2 (2)   CONSTRAINT [DF_ResourceFiles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceFiles1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceFiles1]
    ON [dbo].[tmp_ms_xx_UR_ResourceFiles]([ValidTo] ASC, [Property_Id] ASC, [Resource_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UR_ResourceFiles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceFiles] ([ValidTo], [Property_Id], [Resource_Id], [Id], [FileName], [MimeType], [Data], [ValidFrom])
        SELECT   [ValidTo],
                 [Property_Id],
                 [Resource_Id],
                 [Id],
                 [FileName],
                 [MimeType],
                 [Data],
                 [ValidFrom]
        FROM     [dbo].[UR_ResourceFiles]
        ORDER BY [ValidTo] ASC, [Property_Id] ASC, [Resource_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UR_ResourceFiles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceFiles]', N'UR_ResourceFiles';

EXECUTE sp_rename N'[dbo].[UR_ResourceFiles].[tmp_ms_xx_index_IX_ResourceFiles1]', N'IX_ResourceFiles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceFiles1]', N'PK_ResourceFiles', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UR_ResourceFiles].[IX_ResourceFiles2]...';


GO
CREATE NONCLUSTERED INDEX [IX_ResourceFiles2]
    ON [dbo].[UR_ResourceFiles]([Property_Id] ASC, [Resource_Id] ASC, [ValidFrom] DESC)
    INCLUDE([Id], [ValidTo], [MimeType], [FileName]);


GO
PRINT N'Creating [dbo].[UR_Resources].[IX_Resources_Dirty]...';


GO
CREATE NONCLUSTERED INDEX [IX_Resources_Dirty]
    ON [dbo].[UR_Resources]([Dirty] ASC) WHERE "Dirty"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UR_Resources].[IX_Resources_DisplayName_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_Resources_DisplayName_L1]
    ON [dbo].[UR_Resources]([DisplayName_L1] ASC, [Id] ASC) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[DF_AssignedResourceNavigations_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations]
    ADD CONSTRAINT [DF_AssignedResourceNavigations_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_AssignedResourceScalars_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars]
    ADD CONSTRAINT [DF_AssignedResourceScalars_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_AssignedResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes]
    ADD CONSTRAINT [DF_AssignedResourceTypes_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_IdentifiedRisks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks]
    ADD CONSTRAINT [DF_IdentifiedRisks_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_ResourceRiskScores_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_ResourceRiskScores]
    ADD CONSTRAINT [DF_ResourceRiskScores_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_ResourceLinks_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks]
    ADD CONSTRAINT [DF_ResourceLinks_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[DF_Resources_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_Resources]
    ADD CONSTRAINT [DF_Resources_ValidTo] DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) FOR [ValidTo];


GO
PRINT N'Creating [dbo].[UP_AssignedCompositeRoles].[S_AssignedCompositeRoles_Type]...';


GO
CREATE STATISTICS [S_AssignedCompositeRoles_Type]
    ON [dbo].[UP_AssignedCompositeRoles]([OwnerType]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[UP_AssignedSingleRoles].[S_AssignedSingleRoles_Type]...';


GO
CREATE STATISTICS [S_AssignedSingleRoles_Type]
    ON [dbo].[UP_AssignedSingleRoles]([OwnerType]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[FK_AssignedCompositeRoles_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedCompositeRoles_ParametersContext] FOREIGN KEY ([ParametersContext_Id]) REFERENCES [dbo].[UP_Contexts] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] NOCHECK CONSTRAINT [FK_AssignedCompositeRoles_ParametersContext];


GO
PRINT N'Creating [dbo].[FK_AssignedCompositeRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedCompositeRoles_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] NOCHECK CONSTRAINT [FK_AssignedCompositeRoles_Role];


GO
PRINT N'Creating [dbo].[FK_AssignedCompositeRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedCompositeRoles_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] NOCHECK CONSTRAINT [FK_AssignedCompositeRoles_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_AssignedSingleRoles_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedSingleRoles_ParametersContext] FOREIGN KEY ([ParametersContext_Id]) REFERENCES [dbo].[UP_Contexts] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] NOCHECK CONSTRAINT [FK_AssignedSingleRoles_ParametersContext];


GO
PRINT N'Creating [dbo].[FK_AssignedSingleRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedSingleRoles_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] NOCHECK CONSTRAINT [FK_AssignedSingleRoles_Role];


GO
PRINT N'Creating [dbo].[FK_AssignedSingleRoles_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedSingleRoles_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] NOCHECK CONSTRAINT [FK_AssignedSingleRoles_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_ResourceFiles_Property]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceFiles_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[UP_AssignedCompositeRoles].[UP_AssignedCompositeRoles]...';


GO
PRINT N'Checking existing data against newly created constraints';



GO
ALTER TABLE [dbo].[UR_ResourceFiles] WITH CHECK CHECK CONSTRAINT [FK_ResourceFiles_Property];


GO
PRINT N'Update complete.';



GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_IsInferred]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_IsInferred];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ProvisioningState];


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
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ProvisioningReviewFilter]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ProvisioningReviewFilter];


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
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ManualProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ManualProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_HasPendingOrders]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_HasPendingOrders];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_ParametersContext];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_WorkflowInstance];


GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedResourceTypes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedResourceTypes] (
    [Id]                                         BIGINT          NOT NULL,
    [ResourceType_Id]                            BIGINT          NOT NULL,
    [OwnerType]                                  BIGINT          NOT NULL,
    [Owner_Id]                                   BIGINT          NULL,
    [Resource_Id]                                BIGINT          NULL,
    [ParametersContext_Id]                       BIGINT          NOT NULL,
    [IsDenied]                                   BIT             CONSTRAINT [DF_AssignedResourceTypes_IsDenied] DEFAULT ((0)) NOT NULL,
    [IsInferred]                                 BIT             CONSTRAINT [DF_AssignedResourceTypes_IsInferred] DEFAULT ((0)) NOT NULL,
    [WorkflowState]                              TINYINT         CONSTRAINT [DF_AssignedResourceTypes_WorkflowState] DEFAULT ((0)) NOT NULL,
    [ProvisioningState]                          TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ProvisioningState] DEFAULT ((0)) NOT NULL,
    [SourceMatchedConfidenceLevel]               TINYINT         CONSTRAINT [DF_AssignedResourceTypes_SourceMatchedConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [ResourceTypeIdentificationConfidenceLevel]  TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ResourceTypeIdentificationConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [StartDate]                                  SMALLDATETIME   CONSTRAINT [DF_AssignedResourceTypes_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]                                    SMALLDATETIME   CONSTRAINT [DF_AssignedResourceTypes_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [NeedsPolicyApplication]                     BIT             CONSTRAINT [DF_AssignedResourceTypes_NeedsPolicyApplication] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowBlockedState]           TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowBlockedCount]           SMALLINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedCount] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowFoundState]             TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowFoundCount]             SMALLINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundCount] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowReviewState]            TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedWorkflowReviewCount]            SMALLINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewCount] DEFAULT ((0)) NOT NULL,
    [ConsolidatedProvisioningState]              TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeState] DEFAULT ((0)) NOT NULL,
    [ConsolidatedAssignedResourceTypeCountError] SMALLINT        CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeCountError] DEFAULT ((0)) NOT NULL,
    [ManualProvisioningState]                    TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ManualProvisioningState] DEFAULT ((0)) NOT NULL,
    [HasPendingOrders]                           BIT             CONSTRAINT [DF_AssignedResourceTypes_HasPendingOrders] DEFAULT ((0)) NOT NULL,
    [ValidFrom]                                  DATETIME2 (2)   CONSTRAINT [DF_AssignedResourceTypes_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                    DATETIME2 (2)   CONSTRAINT [DF_AssignedResourceTypes_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [WhenCreated]                                SMALLDATETIME   CONSTRAINT [DF_AssignedResourceTypes_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [ProvisioningReviewFilter]                   TINYINT         CONSTRAINT [DF_AssignedResourceTypes_ProvisioningReviewFilter] DEFAULT ((0)) NOT NULL,
    [WorkflowInstance_Id]                        BIGINT          NULL,
    [WhenPerformed]                              SMALLDATETIME   NULL,
    [Performer_Id]                               BIGINT          NULL,
    [Requester_Id]                               BIGINT          NULL,
    [WhenReviewed1]                              SMALLDATETIME   NULL,
    [Reviewer1_Id]                               BIGINT          NULL,
    [WhenReviewed2]                              SMALLDATETIME   NULL,
    [Reviewer2_Id]                               BIGINT          NULL,
    [WhenReviewed3]                              SMALLDATETIME   NULL,
    [Reviewer3_Id]                               BIGINT          NULL,
    [Comment]                                    NVARCHAR (442)  NULL,
    [ReviewComment1]                             NVARCHAR (442)  NULL,
    [ReviewComment2]                             NVARCHAR (442)  NULL,
    [ReviewComment3]                             NVARCHAR (442)  NULL,
    [WhenTransmitted]                            SMALLDATETIME   NULL,
    [Arguments]                                  NVARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedResourceTypes1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_CK_AssignedResourceTypes1] UNIQUE CLUSTERED ([ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_AssignedResourceTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedResourceTypes] ([ValidTo], [OwnerType], [Owner_Id], [Id], [ResourceType_Id], [Resource_Id], [ParametersContext_Id], [IsDenied], [IsInferred], [WorkflowState], [ProvisioningState], [SourceMatchedConfidenceLevel], [ResourceTypeIdentificationConfidenceLevel], [StartDate], [EndDate], [NeedsPolicyApplication], [ConsolidatedWorkflowBlockedState], [ConsolidatedWorkflowBlockedCount], [ConsolidatedWorkflowFoundState], [ConsolidatedWorkflowFoundCount], [ConsolidatedWorkflowReviewState], [ConsolidatedWorkflowReviewCount], [ConsolidatedProvisioningState], [ConsolidatedAssignedResourceTypeCountError], [ManualProvisioningState], [HasPendingOrders], [ValidFrom], [WhenCreated], [WorkflowInstance_Id], [WhenPerformed], [Performer_Id], [Requester_Id], [WhenReviewed1], [Reviewer1_Id], [WhenReviewed2], [Reviewer2_Id], [WhenReviewed3], [Reviewer3_Id], [Comment], [ReviewComment1], [ReviewComment2], [ReviewComment3], [WhenTransmitted], [Arguments], [ProvisioningReviewFilter])
        SELECT   [ValidTo],
                 [OwnerType],
                 [Owner_Id],
                 [Id],
                 [ResourceType_Id],
                 [Resource_Id],
                 [ParametersContext_Id],
                 [IsDenied],
                 [IsInferred],
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
                 [ManualProvisioningState],
                 [HasPendingOrders],
                 [ValidFrom],
                 [WhenCreated],
                 [WorkflowInstance_Id],
                 [WhenPerformed],
                 [Performer_Id],
                 [Requester_Id],
                 [WhenReviewed1],
                 [Reviewer1_Id],
                 [WhenReviewed2],
                 [Reviewer2_Id],
                 [WhenReviewed3],
                 [Reviewer3_Id],
                 [Comment],
                 [ReviewComment1],
                 [ReviewComment2],
                 [ReviewComment3],
                 [WhenTransmitted],
                 [Arguments],
                 [ProvisioningReviewFilter]
        FROM     [dbo].[UP_AssignedResourceTypes]
        ORDER BY [ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [Id] ASC;
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
    ON [dbo].[UP_AssignedResourceTypes]([Resource_Id] ASC) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_NeedsPolicyApplication]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_NeedsPolicyApplication]
    ON [dbo].[UP_AssignedResourceTypes]([NeedsPolicyApplication] ASC)
    INCLUDE([ValidTo], [OwnerType], [Owner_Id], [Id]) WHERE "NeedsPolicyApplication"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_HasPendingOrders]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_HasPendingOrders]
    ON [dbo].[UP_AssignedResourceTypes]([HasPendingOrders] ASC)
    INCLUDE([ValidTo], [OwnerType], [Owner_Id], [Id], [ResourceType_Id], [Resource_Id], [WorkflowInstance_Id], [IsDenied], [ProvisioningState]) WHERE "HasPendingOrders"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ProvisioningReview]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_ProvisioningReview]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [ProvisioningReviewFilter] ASC, [WorkflowInstance_Id] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ProvisioningState], [StartDate], [EndDate], [ParametersContext_Id], [Resource_Id], [ConsolidatedWorkflowBlockedState], [ConsolidatedProvisioningState], [ResourceType_Id]) WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.99');


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ResourceReconciliation]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_ResourceReconciliation]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ProvisioningState], [ParametersContext_Id], [ResourceType_Id], [Resource_Id], [ConsolidatedWorkflowFoundState], [ConsolidatedWorkflowFoundCount], [ConsolidatedProvisioningState]) WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "resource_id" IS NOT NULL AND "consolidatedworkflowfoundstate" IN (1,2,3);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [IsInferred] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ProvisioningState], [ParametersContext_Id], [ResourceType_Id], [Resource_Id], [ConsolidatedWorkflowFoundState], [ConsolidatedWorkflowFoundCount], [ConsolidatedProvisioningState]) WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "resource_id" IS NOT NULL AND "consolidatedworkflowfoundstate" IN (1,2,3);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[S_AssignedResourceTypes_Type]...';


GO
CREATE STATISTICS [S_AssignedResourceTypes_Type]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[FK_AssignedResourceTypes_ParametersContext]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceTypes_ParametersContext] FOREIGN KEY ([ParametersContext_Id]) REFERENCES [dbo].[UP_Contexts] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] NOCHECK CONSTRAINT [FK_AssignedResourceTypes_ParametersContext];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceTypes_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceTypes_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] NOCHECK CONSTRAINT [FK_AssignedResourceTypes_ResourceType];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceTypes_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceTypes_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] NOCHECK CONSTRAINT [FK_AssignedResourceTypes_WorkflowInstance];


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[UP_AssignedResourceTypes]...';


GO
PRINT N'Update complete.';


GO




GO
PRINT N'Dropping [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ProvisioningReview]...';


GO
DROP INDEX [IX_AssignedResourceTypes_ProvisioningReview]
    ON [dbo].[UP_AssignedResourceTypes];


GO
PRINT N'Dropping [dbo].[UP_ResourceCorrelationKeys].[IX_ResourceCorrelationKeys]...';


GO
DROP INDEX [IX_ResourceCorrelationKeys]
    ON [dbo].[UP_ResourceCorrelationKeys];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_PWRMode]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_PWRMode];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_TicketUrgency]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_TicketUrgency];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_TicketImpact]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_TicketImpact];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_PWRDisableNotifications]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_PWRDisableNotifications];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_PWRGeneratedLength]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_PWRGeneratedLength];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_TicketSynchroIsNotAvailable]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_TicketSynchroIsNotAvailable];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_FulfillmentType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_FulfillmentType];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_InvitationMode]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_InvitationMode];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_PWRMustChange]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_PWRMustChange];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_PWRAutoGenerate]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_PWRAutoGenerate];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeMappings_PWProtocol]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [DF_ResourceTypeMappings_PWProtocol];


GO
PRINT N'Dropping [dbo].[DF_ScaffoldingArguments_FileAreNotEncrypted]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [DF_ScaffoldingArguments_FileAreNotEncrypted];


GO
PRINT N'Dropping [dbo].[DF_ScaffoldingArguments_ScafolldingArgumentType]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [DF_ScaffoldingArguments_ScafolldingArgumentType];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LR]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LR];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L13]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L13];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L12]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L12];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LV]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LV];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LU]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LU];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L27]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L27];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L26]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L26];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L25]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L25];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L22]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L22];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L21]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L21];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L20]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L20];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L18]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L18];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L17]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L17];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L37]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L37];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L36]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L36];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LD]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LD];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LC]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LC];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L11]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L11];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L10]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L10];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L19]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L19];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L29]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L29];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L28]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L28];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L39]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L39];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L30]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L30];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L38]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L38];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LH]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LH];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L33]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L33];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L32]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L32];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L31]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L31];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LP]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LP];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LO]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LO];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LB]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LB];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LK]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LK];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LI]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LI];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LS]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LS];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LE]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LE];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LT]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LT];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LG]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LG];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LF]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LF];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L24]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L24];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L23]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L23];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LN]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LN];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LM]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LM];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LL]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LL];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LA]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LA];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L9]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L9];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L8]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L8];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L16]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L16];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L15]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L15];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L14]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L14];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L35]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L35];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L34]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L34];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceClassificationRules_SourceMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [DF_ResourceClassificationRules_SourceMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceClassificationRules_ResourceTypeIdentificationConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [DF_ResourceClassificationRules_ResourceTypeIdentificationConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceCorrelationRules_SourceMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [DF_ResourceCorrelationRules_SourceMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LF]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LF];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LN]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LN];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LO]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LO];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LK]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LK];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LG]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LG];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L0]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L0];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L15]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L15];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L16]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L16];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L17]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L17];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L20]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L20];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L29]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L29];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L37]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L37];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L38]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L38];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L24]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L24];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L25]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L25];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LR]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LR];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LS]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LS];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LT]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LT];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L10]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L10];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L11]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L11];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L12]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L12];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LB]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LB];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LA]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LA];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L9]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L9];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L23]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L23];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L21]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L21];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L22]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L22];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LP]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LP];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L39]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L39];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L4]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L4];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L5]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L5];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LH]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LH];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LI]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LI];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LC]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LC];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L13]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L13];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L14]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L14];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L33]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L33];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L34]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L34];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LD]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LD];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LE]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LE];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L36]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L36];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L35]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L35];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LM]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LM];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L32]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L32];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L31]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L31];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L30]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L30];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L8]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L8];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L7]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L7];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L6]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L6];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LL]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LL];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L26]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L26];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L27]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L27];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L28]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L28];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LV]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LV];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LU]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LU];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L18]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L18];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L19]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L19];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceQueryRules_TargetMatchedConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [DF_ResourceQueryRules_TargetMatchedConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L36]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L36];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L37]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L37];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L35]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L35];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LC]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LC];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LB]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LB];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L10]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L10];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L11]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L11];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L24]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L24];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L26]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L26];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L25]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L25];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LL]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LL];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LM]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LM];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L19]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L19];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L20]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L20];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L21]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L21];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L22]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L22];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L23]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L23];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L39]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L39];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L38]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L38];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L8]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L8];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L29]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L29];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L28]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L28];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L27]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L27];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L30]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L30];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L32]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L32];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L31]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L31];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LR]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LR];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LS]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LS];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L16]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L16];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L15]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L15];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LG]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LG];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LH]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LH];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L12]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L12];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L13]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L13];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L14]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L14];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LD]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LD];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LE]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LE];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LF]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LF];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LI]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LI];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LK]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LK];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L17]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L17];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L18]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L18];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LN]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LN];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LO]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LO];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LP]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LP];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LT]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LT];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LV]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LV];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LU]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LU];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L33]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L33];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L34]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L34];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LA]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LA];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L9]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L9];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L6];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LD]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LD];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LC]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LC];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LE]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LE];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LI]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LI];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L18]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L18];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L16]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L16];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L17]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L13]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L13];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L11]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L11];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L12]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L12];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L33]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L33];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L32]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L32];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LO]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LO];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LT]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LT];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LU]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LU];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LS]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LS];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LN]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LN];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L9]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L9];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L8]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L8];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LF]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LF];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LG]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LG];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L14]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L14];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LH]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LH];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L15]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L15];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LR]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LR];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LP]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LP];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L30]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L30];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L31]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L31];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L26]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L26];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L27]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L27];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L28]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L28];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L38]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L38];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L39]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L39];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L22]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L22];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L21]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L21];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L20]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L20];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LA]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LA];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L29]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L29];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LB]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LB];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L10]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L10];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LV]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LV];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L34]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L34];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L35]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L35];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L36]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L36];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L37]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L37];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L24]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L24];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L25]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L25];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L23]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L23];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LM]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LM];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L19]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L19];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LL]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LL];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LK]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LK];


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
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_MailProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_MailProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_DisplayNameProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_DisplayNameProperty];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_PWRNotifiedFullNameBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_PWRNotifiedFullNameBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_PWRNotifiedEmailBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_PWRNotifiedEmailBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_PWRBeneficiaryFullNameBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_PWRBeneficiaryFullNameBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_PWRBeneficiaryEmailBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_PWRBeneficiaryEmailBinding];


GO
PRINT N'Dropping [dbo].[FK_ScaffoldingArguments_Scaffolding]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [FK_ScaffoldingArguments_Scaffolding];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_Binding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_Binding];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_TargetBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_TargetBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_SourceBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_SourceBinding];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_SingleRole0];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Role];


GO
PRINT N'Starting rebuilding table [dbo].[UC_ResourceTypeMappings]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UC_ResourceTypeMappings] (
    [Id]                               BIGINT          NOT NULL,
    [RDNAttributeIdentifier]           NVARCHAR (442)  NULL,
    [RDNProperty_Id]                   BIGINT          NULL,
    [DefaultObjectClass]               NVARCHAR (442)  NULL,
    [UsePermissiveModify]              BIT             NULL,
    [UseTreeDelete]                    BIT             NULL,
    [ObjectClassProperty_Id]           BIGINT          NULL,
    [DNProperty_Id]                    BIGINT          NULL,
    [ParentProperty_Id]                BIGINT          NULL,
    [UserAccountControlProperty_Id]    BIGINT          NULL,
    [MailProperty_Id]                  BIGINT          NULL,
    [DisplayNameProperty_Id]           BIGINT          NULL,
    [PWRMode]                          BIGINT          CONSTRAINT [DF_ResourceTypeMappings_PWRMode] DEFAULT ((0)) NOT NULL,
    [PWRProtocol]                      BIGINT          CONSTRAINT [DF_ResourceTypeMappings_PWProtocol] DEFAULT ((0)) NOT NULL,
    [PWRNotifiedFullNameBinding_Id]    BIGINT          NULL,
    [PWRNotifiedEmailBinding_Id]       BIGINT          NULL,
    [PWRBeneficiaryFullNameBinding_Id] BIGINT          NULL,
    [PWRBeneficiaryEmailBinding_Id]    BIGINT          NULL,
    [PWRDefaultPassword]               NVARCHAR (32)   NULL,
    [PWRStrengthCheck]                 NVARCHAR (128)  NULL,
    [PWRMustChange]                    BIT             CONSTRAINT [DF_ResourceTypeMappings_PWRMustChange] DEFAULT ((0)) NOT NULL,
    [PWRAutoGenerate]                  BIT             CONSTRAINT [DF_ResourceTypeMappings_PWRAutoGenerate] DEFAULT ((0)) NOT NULL,
    [PWRDisableNotifications]          BIT             CONSTRAINT [DF_ResourceTypeMappings_PWRDisableNotifications] DEFAULT ((0)) NOT NULL,
    [PWRGeneratedLength]               INT             CONSTRAINT [DF_ResourceTypeMappings_PWRGeneratedLength] DEFAULT ((12)) NOT NULL,
    [PWRNotificationCC]                NVARCHAR (256)  NULL,
    [PWRInformationSystemIdentifier]   NVARCHAR (442)  NULL,
    [InvitationMode]                   TINYINT         CONSTRAINT [DF_ResourceTypeMappings_InvitationMode] DEFAULT ((0)) NOT NULL,
    [InvitationRedirectUrl]            NVARCHAR (442)  NULL,
    [InvitationCustomizedMessageBody]  NVARCHAR (4000) NULL,
    [InvitationMessageLanguage]        VARCHAR (16)    NULL,
    [FulfillmentType]                  INT             CONSTRAINT [DF_ResourceTypeMappings_FulfillmentType] DEFAULT ((0)) NOT NULL,
    [InformationSystemIdentifier]      NVARCHAR (442)  NULL,
    [TicketCallerIdIdentifier]         NVARCHAR (442)  NULL,
    [TicketCategory]                   NVARCHAR (442)  NULL,
    [TicketSubCategory]                NVARCHAR (442)  NULL,
    [TicketImpact]                     INT             CONSTRAINT [DF_ResourceTypeMappings_TicketImpact] DEFAULT ((3)) NOT NULL,
    [TicketUrgency]                    INT             CONSTRAINT [DF_ResourceTypeMappings_TicketUrgency] DEFAULT ((3)) NOT NULL,
    [TicketAdditionalInformation]      NVARCHAR (4000) NULL,
    [TicketSynchroIsNotAvailable]      BIT             CONSTRAINT [DF_ResourceTypeMappings_TicketSynchroIsNotAvailable] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypeMappings1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UC_ResourceTypeMappings])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UC_ResourceTypeMappings] ([Id], [RDNAttributeIdentifier], [RDNProperty_Id], [DefaultObjectClass], [UsePermissiveModify], [UseTreeDelete], [ObjectClassProperty_Id], [DNProperty_Id], [ParentProperty_Id], [UserAccountControlProperty_Id], [MailProperty_Id], [DisplayNameProperty_Id], [PWRMode], [PWRProtocol], [PWRNotifiedFullNameBinding_Id], [PWRNotifiedEmailBinding_Id], [PWRBeneficiaryFullNameBinding_Id], [PWRBeneficiaryEmailBinding_Id], [PWRDefaultPassword], [PWRStrengthCheck], [PWRMustChange], [PWRAutoGenerate], [PWRDisableNotifications], [PWRGeneratedLength], [PWRInformationSystemIdentifier], [InvitationMode], [InvitationRedirectUrl], [InvitationCustomizedMessageBody], [InvitationMessageLanguage], [FulfillmentType], [InformationSystemIdentifier], [TicketCallerIdIdentifier], [TicketCategory], [TicketSubCategory], [TicketImpact], [TicketUrgency], [TicketAdditionalInformation], [TicketSynchroIsNotAvailable])
        SELECT   [Id],
                 [RDNAttributeIdentifier],
                 [RDNProperty_Id],
                 [DefaultObjectClass],
                 [UsePermissiveModify],
                 [UseTreeDelete],
                 [ObjectClassProperty_Id],
                 [DNProperty_Id],
                 [ParentProperty_Id],
                 [UserAccountControlProperty_Id],
                 [MailProperty_Id],
                 [DisplayNameProperty_Id],
                 [PWRMode],
                 [PWRProtocol],
                 [PWRNotifiedFullNameBinding_Id],
                 [PWRNotifiedEmailBinding_Id],
                 [PWRBeneficiaryFullNameBinding_Id],
                 [PWRBeneficiaryEmailBinding_Id],
                 [PWRDefaultPassword],
                 [PWRStrengthCheck],
                 [PWRMustChange],
                 [PWRAutoGenerate],
                 [PWRDisableNotifications],
                 [PWRGeneratedLength],
                 [PWRInformationSystemIdentifier],
                 [InvitationMode],
                 [InvitationRedirectUrl],
                 [InvitationCustomizedMessageBody],
                 [InvitationMessageLanguage],
                 [FulfillmentType],
                 [InformationSystemIdentifier],
                 [TicketCallerIdIdentifier],
                 [TicketCategory],
                 [TicketSubCategory],
                 [TicketImpact],
                 [TicketUrgency],
                 [TicketAdditionalInformation],
                 [TicketSynchroIsNotAvailable]
        FROM     [dbo].[UC_ResourceTypeMappings]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UC_ResourceTypeMappings];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UC_ResourceTypeMappings]', N'UC_ResourceTypeMappings';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypeMappings1]', N'PK_ResourceTypeMappings', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column FilesAreNotEncrypted on table [dbo].[UD_ScaffoldingArguments] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UD_ScaffoldingArguments]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UD_ScaffoldingArguments] (
    [Id]                      BIGINT         NOT NULL,
    [Identifier]              VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    [Scaffolding_Id]          BIGINT         NOT NULL,
    [Value]                   NVARCHAR (442) NULL,
    [Order]                   INT            NULL,
    [ConnectorIdentifier]     NVARCHAR (442) NULL,
    [TaskIdentifier]          NVARCHAR (442) NULL,
    [ScaffoldingArgumentType] INT            CONSTRAINT [DF_ScaffoldingArguments_ScafolldingArgumentType] DEFAULT ((0)) NOT NULL,
    [Before]                  BIT            NULL,
    [After]                   BIT            NULL,
    [FilesAreNotEncrypted]    BIT            CONSTRAINT [DF_ScaffoldingArguments_FileAreNotEncrypted] DEFAULT ((0)) NOT NULL,
    [CopyOccurence]           INT            NULL,
    [SearchBarPage]           INT            NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ScaffoldingArguments1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_ScaffoldingArguments_Identifier1] UNIQUE NONCLUSTERED ([Scaffolding_Id] ASC, [Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UD_ScaffoldingArguments])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UD_ScaffoldingArguments] ([Id], [Identifier], [Scaffolding_Id], [Value], [Order], [ConnectorIdentifier], [TaskIdentifier], [ScaffoldingArgumentType], [Before], [After], [CopyOccurence], [SearchBarPage], [FilesAreNotEncrypted])
        SELECT   [Id],
                 [Identifier],
                 [Scaffolding_Id],
                 [Value],
                 [Order],
                 [ConnectorIdentifier],
                 [TaskIdentifier],
                 [ScaffoldingArgumentType],
                 [Before],
                 [After],
                 [CopyOccurence],
                 [SearchBarPage],
                 [FilesAreNotEncrypted]
        FROM     [dbo].[UD_ScaffoldingArguments]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UD_ScaffoldingArguments];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UD_ScaffoldingArguments]', N'UD_ScaffoldingArguments';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ScaffoldingArguments1]', N'PK_ScaffoldingArguments', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_ScaffoldingArguments_Identifier1]', N'U_ScaffoldingArguments_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_CompositeRoleRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_CompositeRoleRules] (
    [Id]            BIGINT NOT NULL,
    [Policy_Id]     BIGINT NOT NULL,
    [Type]          INT    CONSTRAINT [DF_CompositeRoleRules_Type] DEFAULT ((0)) NOT NULL,
    [EntityType_Id] BIGINT NOT NULL,
    [Role_Id]       BIGINT NOT NULL,
    [IsDenied]      BIT    CONSTRAINT [DF_CompositeRoleRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [L0]            BIT    CONSTRAINT [DF_CompositeRoleRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]            BIT    CONSTRAINT [DF_CompositeRoleRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]            BIT    CONSTRAINT [DF_CompositeRoleRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]            BIT    CONSTRAINT [DF_CompositeRoleRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]            BIT    CONSTRAINT [DF_CompositeRoleRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]            BIT    CONSTRAINT [DF_CompositeRoleRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]            BIT    CONSTRAINT [DF_CompositeRoleRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]            BIT    CONSTRAINT [DF_CompositeRoleRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]            BIT    CONSTRAINT [DF_CompositeRoleRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]            BIT    CONSTRAINT [DF_CompositeRoleRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]            BIT    CONSTRAINT [DF_CompositeRoleRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]            BIT    CONSTRAINT [DF_CompositeRoleRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]            BIT    CONSTRAINT [DF_CompositeRoleRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]            BIT    CONSTRAINT [DF_CompositeRoleRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]            BIT    CONSTRAINT [DF_CompositeRoleRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]            BIT    CONSTRAINT [DF_CompositeRoleRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]            BIT    CONSTRAINT [DF_CompositeRoleRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]            BIT    CONSTRAINT [DF_CompositeRoleRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]            BIT    CONSTRAINT [DF_CompositeRoleRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]            BIT    CONSTRAINT [DF_CompositeRoleRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]            BIT    CONSTRAINT [DF_CompositeRoleRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]            BIT    CONSTRAINT [DF_CompositeRoleRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]            BIT    CONSTRAINT [DF_CompositeRoleRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]            BIT    CONSTRAINT [DF_CompositeRoleRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]            BIT    CONSTRAINT [DF_CompositeRoleRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]            BIT    CONSTRAINT [DF_CompositeRoleRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]            BIT    CONSTRAINT [DF_CompositeRoleRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]            BIT    CONSTRAINT [DF_CompositeRoleRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]            BIT    CONSTRAINT [DF_CompositeRoleRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]            BIT    CONSTRAINT [DF_CompositeRoleRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]            BIT    CONSTRAINT [DF_CompositeRoleRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]            BIT    CONSTRAINT [DF_CompositeRoleRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]           BIT    CONSTRAINT [DF_CompositeRoleRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]           BIT    CONSTRAINT [DF_CompositeRoleRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]           BIT    CONSTRAINT [DF_CompositeRoleRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]           BIT    CONSTRAINT [DF_CompositeRoleRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]           BIT    CONSTRAINT [DF_CompositeRoleRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]           BIT    CONSTRAINT [DF_CompositeRoleRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]           BIT    CONSTRAINT [DF_CompositeRoleRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]           BIT    CONSTRAINT [DF_CompositeRoleRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]           BIT    CONSTRAINT [DF_CompositeRoleRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]           BIT    CONSTRAINT [DF_CompositeRoleRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]           BIT    CONSTRAINT [DF_CompositeRoleRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]           BIT    CONSTRAINT [DF_CompositeRoleRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]           BIT    CONSTRAINT [DF_CompositeRoleRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]           BIT    CONSTRAINT [DF_CompositeRoleRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]           BIT    CONSTRAINT [DF_CompositeRoleRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]           BIT    CONSTRAINT [DF_CompositeRoleRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]           BIT    CONSTRAINT [DF_CompositeRoleRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]           BIT    CONSTRAINT [DF_CompositeRoleRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]           BIT    CONSTRAINT [DF_CompositeRoleRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]           BIT    CONSTRAINT [DF_CompositeRoleRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]           BIT    CONSTRAINT [DF_CompositeRoleRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]           BIT    CONSTRAINT [DF_CompositeRoleRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]           BIT    CONSTRAINT [DF_CompositeRoleRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]           BIT    CONSTRAINT [DF_CompositeRoleRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]           BIT    CONSTRAINT [DF_CompositeRoleRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]           BIT    CONSTRAINT [DF_CompositeRoleRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]           BIT    CONSTRAINT [DF_CompositeRoleRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]           BIT    CONSTRAINT [DF_CompositeRoleRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]           BIT    CONSTRAINT [DF_CompositeRoleRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]           BIT    CONSTRAINT [DF_CompositeRoleRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]           BIT    CONSTRAINT [DF_CompositeRoleRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]           BIT    CONSTRAINT [DF_CompositeRoleRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]           BIT    CONSTRAINT [DF_CompositeRoleRules_L3V] DEFAULT ((0)) NOT NULL,
    [D0_Id]         BIGINT NULL,
    [D1_Id]         BIGINT NULL,
    [D2_Id]         BIGINT NULL,
    [D3_Id]         BIGINT NULL,
    [D4_Id]         BIGINT NULL,
    [D5_Id]         BIGINT NULL,
    [D6_Id]         BIGINT NULL,
    [D7_Id]         BIGINT NULL,
    [D8_Id]         BIGINT NULL,
    [D9_Id]         BIGINT NULL,
    [DA_Id]         BIGINT NULL,
    [DB_Id]         BIGINT NULL,
    [DC_Id]         BIGINT NULL,
    [DD_Id]         BIGINT NULL,
    [DE_Id]         BIGINT NULL,
    [DF_Id]         BIGINT NULL,
    [DG_Id]         BIGINT NULL,
    [DH_Id]         BIGINT NULL,
    [DI_Id]         BIGINT NULL,
    [DJ_Id]         BIGINT NULL,
    [DK_Id]         BIGINT NULL,
    [DL_Id]         BIGINT NULL,
    [DM_Id]         BIGINT NULL,
    [DN_Id]         BIGINT NULL,
    [DO_Id]         BIGINT NULL,
    [DP_Id]         BIGINT NULL,
    [DQ_Id]         BIGINT NULL,
    [DR_Id]         BIGINT NULL,
    [DS_Id]         BIGINT NULL,
    [DT_Id]         BIGINT NULL,
    [DU_Id]         BIGINT NULL,
    [DV_Id]         BIGINT NULL,
    [D10_Id]        BIGINT NULL,
    [D11_Id]        BIGINT NULL,
    [D12_Id]        BIGINT NULL,
    [D13_Id]        BIGINT NULL,
    [D14_Id]        BIGINT NULL,
    [D15_Id]        BIGINT NULL,
    [D16_Id]        BIGINT NULL,
    [D17_Id]        BIGINT NULL,
    [D18_Id]        BIGINT NULL,
    [D19_Id]        BIGINT NULL,
    [D1A_Id]        BIGINT NULL,
    [D1B_Id]        BIGINT NULL,
    [D1C_Id]        BIGINT NULL,
    [D1D_Id]        BIGINT NULL,
    [D1E_Id]        BIGINT NULL,
    [D1F_Id]        BIGINT NULL,
    [D1G_Id]        BIGINT NULL,
    [D1H_Id]        BIGINT NULL,
    [D1I_Id]        BIGINT NULL,
    [D1J_Id]        BIGINT NULL,
    [D1K_Id]        BIGINT NULL,
    [D1L_Id]        BIGINT NULL,
    [D1M_Id]        BIGINT NULL,
    [D1N_Id]        BIGINT NULL,
    [D1O_Id]        BIGINT NULL,
    [D1P_Id]        BIGINT NULL,
    [D1Q_Id]        BIGINT NULL,
    [D1R_Id]        BIGINT NULL,
    [D1S_Id]        BIGINT NULL,
    [D1T_Id]        BIGINT NULL,
    [D1U_Id]        BIGINT NULL,
    [D1V_Id]        BIGINT NULL,
    [D20_Id]        BIGINT NULL,
    [D21_Id]        BIGINT NULL,
    [D22_Id]        BIGINT NULL,
    [D23_Id]        BIGINT NULL,
    [D24_Id]        BIGINT NULL,
    [D25_Id]        BIGINT NULL,
    [D26_Id]        BIGINT NULL,
    [D27_Id]        BIGINT NULL,
    [D28_Id]        BIGINT NULL,
    [D29_Id]        BIGINT NULL,
    [D2A_Id]        BIGINT NULL,
    [D2B_Id]        BIGINT NULL,
    [D2C_Id]        BIGINT NULL,
    [D2D_Id]        BIGINT NULL,
    [D2E_Id]        BIGINT NULL,
    [D2F_Id]        BIGINT NULL,
    [D2G_Id]        BIGINT NULL,
    [D2H_Id]        BIGINT NULL,
    [D2I_Id]        BIGINT NULL,
    [D2J_Id]        BIGINT NULL,
    [D2K_Id]        BIGINT NULL,
    [D2L_Id]        BIGINT NULL,
    [D2M_Id]        BIGINT NULL,
    [D2N_Id]        BIGINT NULL,
    [D2O_Id]        BIGINT NULL,
    [D2P_Id]        BIGINT NULL,
    [D2Q_Id]        BIGINT NULL,
    [D2R_Id]        BIGINT NULL,
    [D2S_Id]        BIGINT NULL,
    [D2T_Id]        BIGINT NULL,
    [D2U_Id]        BIGINT NULL,
    [D2V_Id]        BIGINT NULL,
    [D30_Id]        BIGINT NULL,
    [D31_Id]        BIGINT NULL,
    [D32_Id]        BIGINT NULL,
    [D33_Id]        BIGINT NULL,
    [D34_Id]        BIGINT NULL,
    [D35_Id]        BIGINT NULL,
    [D36_Id]        BIGINT NULL,
    [D37_Id]        BIGINT NULL,
    [D38_Id]        BIGINT NULL,
    [D39_Id]        BIGINT NULL,
    [D3A_Id]        BIGINT NULL,
    [D3B_Id]        BIGINT NULL,
    [D3C_Id]        BIGINT NULL,
    [D3D_Id]        BIGINT NULL,
    [D3E_Id]        BIGINT NULL,
    [D3F_Id]        BIGINT NULL,
    [D3G_Id]        BIGINT NULL,
    [D3H_Id]        BIGINT NULL,
    [D3I_Id]        BIGINT NULL,
    [D3J_Id]        BIGINT NULL,
    [D3K_Id]        BIGINT NULL,
    [D3L_Id]        BIGINT NULL,
    [D3M_Id]        BIGINT NULL,
    [D3N_Id]        BIGINT NULL,
    [D3O_Id]        BIGINT NULL,
    [D3P_Id]        BIGINT NULL,
    [D3Q_Id]        BIGINT NULL,
    [D3R_Id]        BIGINT NULL,
    [D3S_Id]        BIGINT NULL,
    [D3T_Id]        BIGINT NULL,
    [D3U_Id]        BIGINT NULL,
    [D3V_Id]        BIGINT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_CompositeRoleRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_CompositeRoleRules1]
    ON [dbo].[tmp_ms_xx_UP_CompositeRoleRules]([EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_CompositeRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_CompositeRoleRules] ([EntityType_Id], [Role_Id], [Id], [Policy_Id], [Type], [IsDenied], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Role_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [IsDenied],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_CompositeRoleRules]
        ORDER BY [EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_CompositeRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_CompositeRoleRules]', N'UP_CompositeRoleRules';

EXECUTE sp_rename N'[dbo].[UP_CompositeRoleRules].[tmp_ms_xx_index_IX_CompositeRoleRules1]', N'IX_CompositeRoleRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_CompositeRoleRules1]', N'PK_CompositeRoleRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceClassificationRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceClassificationRules] (
    [Id]                                        BIGINT         NOT NULL,
    [Policy_Id]                                 BIGINT         NOT NULL,
    [EntityType_Id]                             BIGINT         NOT NULL,
    [ResourceType_Id]                           BIGINT         NOT NULL,
    [ResourceTypeIdentificationConfidenceLevel] INT            CONSTRAINT [DF_ResourceClassificationRules_ResourceTypeIdentificationConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [SourceMatchedConfidenceLevel]              BIT            CONSTRAINT [DF_ResourceClassificationRules_SourceMatchedConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [TargetExpression]                          VARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceClassificationRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceClassificationRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceClassificationRules]([EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceClassificationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceClassificationRules] ([EntityType_Id], [ResourceType_Id], [Id], [Policy_Id], [ResourceTypeIdentificationConfidenceLevel], [SourceMatchedConfidenceLevel], [TargetExpression])
        SELECT   [EntityType_Id],
                 [ResourceType_Id],
                 [Id],
                 [Policy_Id],
                 [ResourceTypeIdentificationConfidenceLevel],
                 [SourceMatchedConfidenceLevel],
                 [TargetExpression]
        FROM     [dbo].[UP_ResourceClassificationRules]
        ORDER BY [EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceClassificationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceClassificationRules]', N'UP_ResourceClassificationRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceClassificationRules].[tmp_ms_xx_index_IX_ResourceClassificationRules1]', N'IX_ResourceClassificationRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceClassificationRules1]', N'PK_ResourceClassificationRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceCorrelationRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceCorrelationRules] (
    [Id]                           BIGINT         NOT NULL,
    [Policy_Id]                    BIGINT         NOT NULL,
    [EntityType_Id]                BIGINT         NOT NULL,
    [ResourceType_Id]              BIGINT         NOT NULL,
    [SourceBinding_Id]             BIGINT         NULL,
    [SourceExpression]             VARCHAR (4000) NULL,
    [TargetBinding_Id]             BIGINT         NULL,
    [TargetExpression]             VARCHAR (4000) NULL,
    [SourceMatchedConfidenceLevel] INT            CONSTRAINT [DF_ResourceCorrelationRules_SourceMatchedConfidenceLevel] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceCorrelationRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceCorrelationRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceCorrelationRules]([EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceCorrelationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceCorrelationRules] ([EntityType_Id], [ResourceType_Id], [Id], [Policy_Id], [SourceBinding_Id], [SourceExpression], [TargetBinding_Id], [TargetExpression], [SourceMatchedConfidenceLevel])
        SELECT   [EntityType_Id],
                 [ResourceType_Id],
                 [Id],
                 [Policy_Id],
                 [SourceBinding_Id],
                 [SourceExpression],
                 [TargetBinding_Id],
                 [TargetExpression],
                 [SourceMatchedConfidenceLevel]
        FROM     [dbo].[UP_ResourceCorrelationRules]
        ORDER BY [EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceCorrelationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceCorrelationRules]', N'UP_ResourceCorrelationRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceCorrelationRules].[tmp_ms_xx_index_IX_ResourceCorrelationRules1]', N'IX_ResourceCorrelationRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceCorrelationRules1]', N'PK_ResourceCorrelationRules', N'OBJECT';

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
    [EntityType_Id]             BIGINT NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceNavigationRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceNavigationRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceNavigationRules]([EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceNavigationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceNavigationRules] ([EntityType_Id], [ResourceType_Id], [Id], [Policy_Id], [Type], [Resource_Id], [Property_Id], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [ResourceType_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [Resource_Id],
                 [Property_Id],
                 [IsDenied],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SingleRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_ResourceNavigationRules]
        ORDER BY [EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceNavigationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceNavigationRules]', N'UP_ResourceNavigationRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceNavigationRules].[tmp_ms_xx_index_IX_ResourceNavigationRules1]', N'IX_ResourceNavigationRules', N'INDEX';

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
    [EntityType_Id]                BIGINT         NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceQueryRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceQueryRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceQueryRules]([EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceQueryRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceQueryRules] ([EntityType_Id], [ResourceType_Id], [Id], [Policy_Id], [Property_Id], [TargetMatchedConfidenceLevel], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SourceBinding_Id], [SourceExpression], [TargetBinding_Id], [TargetExpression])
        SELECT   [EntityType_Id],
                 [ResourceType_Id],
                 [Id],
                 [Policy_Id],
                 [Property_Id],
                 [TargetMatchedConfidenceLevel],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SourceBinding_Id],
                 [SourceExpression],
                 [TargetBinding_Id],
                 [TargetExpression]
        FROM     [dbo].[UP_ResourceQueryRules]
        ORDER BY [EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceQueryRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceQueryRules]', N'UP_ResourceQueryRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceQueryRules].[tmp_ms_xx_index_IX_ResourceQueryRules1]', N'IX_ResourceQueryRules', N'INDEX';

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
    [EntityType_Id]             BIGINT NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypeRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceTypeRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceTypeRules]([EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_ResourceTypeRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceTypeRules] ([EntityType_Id], [ResourceType_Id], [Id], [Policy_Id], [Type], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [ResourceType_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [IsDenied],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SingleRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_ResourceTypeRules]
        ORDER BY [EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceTypeRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceTypeRules]', N'UP_ResourceTypeRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceTypeRules].[tmp_ms_xx_index_IX_ResourceTypeRules1]', N'IX_ResourceTypeRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypeRules1]', N'PK_ResourceTypeRules', N'OBJECT';

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
    [EntityType_Id]    BIGINT NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_SingleRoleRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_SingleRoleRules1]
    ON [dbo].[tmp_ms_xx_UP_SingleRoleRules]([EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_SingleRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_SingleRoleRules] ([EntityType_Id], [Role_Id], [Id], [Policy_Id], [Type], [IsDenied], [CompositeRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Role_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [IsDenied],
                 [CompositeRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_SingleRoleRules]
        ORDER BY [EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_SingleRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_SingleRoleRules]', N'UP_SingleRoleRules';

EXECUTE sp_rename N'[dbo].[UP_SingleRoleRules].[tmp_ms_xx_index_IX_SingleRoleRules1]', N'IX_SingleRoleRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SingleRoleRules1]', N'PK_SingleRoleRules', N'OBJECT';

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
    ON [dbo].[tmp_ms_xx_UR_ResourceFileChanges]([JobInstanceId] ASC, [Property_Id] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UR_ResourceFileChanges])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceFileChanges] ([JobInstanceId], [Property_Id], [ChangeOperation], [ResourceFile_Id], [Resource_Id], [Resource_PK], [Data], [ValidFrom], [ValidTo])
        SELECT   [JobInstanceId],
                 [Property_Id],
                 [ChangeOperation],
                 [ResourceFile_Id],
                 [Resource_Id],
                 [Resource_PK],
                 [Data],
                 [ValidFrom],
                 [ValidTo]
        FROM     [dbo].[UR_ResourceFileChanges]
        ORDER BY [JobInstanceId] ASC, [Property_Id] ASC;
    END

DROP TABLE [dbo].[UR_ResourceFileChanges];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceFileChanges]', N'UR_ResourceFileChanges';

EXECUTE sp_rename N'[dbo].[UR_ResourceFileChanges].[tmp_ms_xx_index_IX_ResourceFileChanges1]', N'IX_ResourceFileChanges', N'INDEX';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_ProvisioningReview]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_ProvisioningReview]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [ProvisioningReviewFilter] ASC, [WorkflowInstance_Id] DESC, [Owner_Id] DESC, [Id] DESC)
    INCLUDE([WorkflowState], [IsDenied], [ProvisioningState], [StartDate], [EndDate], [ParametersContext_Id], [Resource_Id], [ConsolidatedWorkflowBlockedState], [ConsolidatedProvisioningState], [ResourceType_Id]) WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121) AND "ProvisioningReviewFilter">0;


GO
PRINT N'Creating [dbo].[UP_ResourceCorrelationKeys].[IX_ResourceCorrelationKeys]...';


GO
CREATE NONCLUSTERED INDEX [IX_ResourceCorrelationKeys]
    ON [dbo].[UP_ResourceCorrelationKeys]([EntityType_Id] ASC, [Resource_Id] ASC)
    INCLUDE([BindingExpressionHash], [Value], [Id]) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedCompositeRoles].[IX_AssignedCompositeRoles_RoleReconciliation]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedCompositeRoles_RoleReconciliation]
    ON [dbo].[UP_AssignedCompositeRoles]([OwnerType] ASC, [WhenCreated] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ParametersContext_Id], [Role_Id]) WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "Role_Id" IS NOT NULL AND "WorkflowState" IN (1,3);


GO
PRINT N'Creating [dbo].[UP_AssignedCompositeRoles].[IX_AssignedCompositeRoles_RoleReview]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedCompositeRoles_RoleReview]
    ON [dbo].[UP_AssignedCompositeRoles]([OwnerType] ASC, [WorkflowInstance_Id] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [StartDate], [EndDate], [Role_Id], [ParametersContext_Id], [WhenCreated], [WhenPerformed], [Comment], [WhenReviewed1], [WhenReviewed2], [WhenReviewed3], [ReviewComment1], [ReviewComment2], [ReviewComment3]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "WorkflowState" IN (8,9,10,11,12,13);


GO
PRINT N'Creating [dbo].[UP_AssignedSingleRoles].[IX_AssignedSingleRoles_RoleReconciliation]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedSingleRoles_RoleReconciliation]
    ON [dbo].[UP_AssignedSingleRoles]([OwnerType] ASC, [WhenCreated] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [ParametersContext_Id], [Role_Id]) WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "Role_Id" IS NOT NULL AND "WorkflowState" IN (1,3);


GO
PRINT N'Creating [dbo].[UP_AssignedSingleRoles].[IX_AssignedSingleRoles_RoleReview]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedSingleRoles_RoleReview]
    ON [dbo].[UP_AssignedSingleRoles]([OwnerType] ASC, [WorkflowInstance_Id] ASC, [Owner_Id] ASC, [Id] ASC)
    INCLUDE([WorkflowState], [IsDenied], [StartDate], [EndDate], [Role_Id], [ParametersContext_Id], [WhenCreated], [WhenPerformed], [Comment], [WhenReviewed1], [WhenReviewed2], [WhenReviewed3], [ReviewComment1], [ReviewComment2], [ReviewComment3]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "WorkflowState" IN (8,9,10,11,12,13);


GO
PRINT N'Creating [dbo].[UP_CompositeRoles].[IX_CompositeRoles_View_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_CompositeRoles_View_L1]
    ON [dbo].[UP_CompositeRoles]([EntityType_Id] ASC, [FullName_L1] ASC, [Id] ASC)
    INCLUDE([DisplayName_L1], [Identifier], [ApprovalWorkflowType], [Policy_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);


GO
PRINT N'Creating [dbo].[UP_ResourceTypes].[IX_ResourceTypes_View_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_ResourceTypes_View_L1]
    ON [dbo].[UP_ResourceTypes]([SourceEntityType_Id] ASC, [FullName_L1] ASC, [Id] ASC)
    INCLUDE([DisplayName_L1], [Identifier], [ApprovalWorkflowType], [Policy_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);


GO
PRINT N'Creating [dbo].[UP_SingleRoles].[IX_SingleRoles_View_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_SingleRoles_View_L1]
    ON [dbo].[UP_SingleRoles]([EntityType_Id] ASC, [FullName_L1] ASC, [Id] ASC)
    INCLUDE([DisplayName_L1], [Identifier], [ApprovalWorkflowType], [Policy_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);


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
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_MailProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_MailProperty] FOREIGN KEY ([MailProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_DisplayNameProperty]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_DisplayNameProperty] FOREIGN KEY ([DisplayNameProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_PWRNotifiedFullNameBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_PWRNotifiedFullNameBinding] FOREIGN KEY ([PWRNotifiedFullNameBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_ResourceType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_PWRNotifiedEmailBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_PWRNotifiedEmailBinding] FOREIGN KEY ([PWRNotifiedEmailBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_PWRBeneficiaryFullNameBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_PWRBeneficiaryFullNameBinding] FOREIGN KEY ([PWRBeneficiaryFullNameBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_PWRBeneficiaryEmailBinding]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_PWRBeneficiaryEmailBinding] FOREIGN KEY ([PWRBeneficiaryEmailBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ScaffoldingArguments_Scaffolding]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] WITH NOCHECK
    ADD CONSTRAINT [FK_ScaffoldingArguments_Scaffolding] FOREIGN KEY ([Scaffolding_Id]) REFERENCES [dbo].[UD_Scaffoldings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_Binding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_Binding] FOREIGN KEY ([SourceBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_TargetBinding]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_TargetBinding] FOREIGN KEY ([TargetBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceTypeRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


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
PRINT N'Creating [dbo].[FK_SingleRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[UC_ResourceTypeMappings].[UC_ResourceTypeMappings]...';




GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ObjectClasseProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_DNProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ParentProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_UserAcountControlProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_RDNProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_MailProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_DisplayNameProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_PWRNotifiedFullNameBinding];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ResourceType];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_PWRNotifiedEmailBinding];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_PWRBeneficiaryFullNameBinding];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_PWRBeneficiaryEmailBinding];

ALTER TABLE [dbo].[UD_ScaffoldingArguments] WITH CHECK CHECK CONSTRAINT [FK_ScaffoldingArguments_Scaffolding];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_EntityType];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_Policy];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_Binding];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_TargetBinding];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Property];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_SingleRole];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Policy];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Property];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_TargetBinding];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_SourceBinding];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_Policy];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_SingleRole0];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_EntityType];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Policy];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_CompositeRole];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Role];


GO
PRINT N'Update complete.';


GO



/***  end of generated script ***/

IF CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'SQL Azure%'
    OR CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'Enterprise%'
    OR CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'Developer%'
    OR CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 4) AS int) > 13 --SQL 2017 and later
    OR (CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 4) AS int) = 13 --SQL 2016
    AND CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 2) AS int) >= 4001) --SP1 or greater
BEGIN

DROP INDEX "IX_Resources" ON "UR_Resources";
DROP INDEX "IX_ResourceLinks_1" ON "UR_ResourceLinks";
DROP INDEX "IX_ResourceLinks_2" ON "UR_ResourceLinks";
DROP INDEX "IX_ResourceFiles" ON "UR_ResourceFiles";
DROP INDEX "IX_ResourceFiles2" ON "UR_ResourceFiles";

ALTER TABLE "UR_Resources" DROP CONSTRAINT "PK_Resources";
ALTER TABLE "UR_ResourceFiles" DROP CONSTRAINT "PK_ResourceFiles";
ALTER TABLE "UP_AssignedCompositeRoles" DROP CONSTRAINT "PK_AssignedCompositeRoles";
ALTER TABLE "UP_AssignedCompositeRoles" DROP CONSTRAINT "UK_AssignedCompositeRoles";
ALTER TABLE "UP_AssignedSingleRoles" DROP CONSTRAINT "PK_AssignedSingleRoles";
ALTER TABLE "UP_AssignedSingleRoles" DROP CONSTRAINT "UK_AssignedSingleRoles";
ALTER TABLE "UP_AssignedResourceTypes" DROP CONSTRAINT "PK_AssignedResourceTypes";
ALTER TABLE "UP_AssignedResourceTypes" DROP CONSTRAINT "CK_AssignedResourceTypes";
ALTER TABLE "UP_AssignedResourceScalars" DROP CONSTRAINT "CK_AssignedResourceScalar" ;
ALTER TABLE "UP_AssignedResourceScalars" DROP CONSTRAINT "PK_AssignedResourceScalar";
ALTER TABLE "UP_AssignedResourceNavigations" DROP CONSTRAINT "CK_AssignedResourceNavigations";
ALTER TABLE "UP_AssignedResourceNavigations" DROP CONSTRAINT "PK_AssignedResourceNavigations";
ALTER TABLE "UP_IdentifiedRisks" DROP CONSTRAINT "CK_IdentifiedRisks";
ALTER TABLE "UP_IdentifiedRisks" DROP CONSTRAINT "PK_IdentifiedRisks";
ALTER TABLE "UP_ResourceRiskScores" DROP CONSTRAINT "CK_ResourceRiskScores";
ALTER TABLE "UP_ResourceRiskScores" DROP CONSTRAINT "PK_ResourceRiskScores";

IF NOT EXISTS (
    SELECT * FROM sys.partition_functions where name = 'HistoryFunction'
)
BEGIN
	EXEC sp_executesql N'CREATE PARTITION FUNCTION "HistoryFunction"(DateTime2(2)) AS RANGE RIGHT FOR VALUES (CONVERT(DATETIME2(2),''9999-12-31 23:59:59.999'',121));
	CREATE PARTITION SCHEME "HistoryScheme" AS PARTITION "HistoryFunction" TO ("PRIMARY", "PRIMARY");';
END


--- Start UR_Resources ---

CREATE UNIQUE CLUSTERED INDEX "IX_Resources" ON "UR_Resources"("ValidTo" ASC, "Type" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");


ALTER TABLE "UR_Resources" ADD CONSTRAINT "PK_Resources" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
--- Start UR_ResourceLinks ---
CREATE UNIQUE CLUSTERED INDEX "IX_ResourceLinks_1" ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R1_Id" ASC, "R2_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");


CREATE UNIQUE NONCLUSTERED INDEX "IX_ResourceLinks_2" ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R2_Id" ASC, "R1_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
--- Start UR_ResourceFiles ---

CREATE CLUSTERED INDEX "IX_ResourceFiles"
    ON "UR_ResourceFiles"("ValidTo" ASC, "Property_Id" ASC, "Resource_Id" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");

CREATE INDEX "IX_ResourceFiles2"
    ON "UR_ResourceFiles"("Property_Id" ASC,"Resource_Id" ASC, "ValidFrom" DESC)
	INCLUDE (Id, "validto","mimetype","filename") ON "HistoryScheme"("ValidTo");

ALTER TABLE "UR_ResourceFiles" ADD CONSTRAINT "PK_ResourceFiles" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
--- UP AssignedCompositeRoles---

ALTER TABLE "UP_AssignedCompositeRoles" ADD CONSTRAINT "PK_AssignedCompositeRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");

ALTER TABLE "UP_AssignedCompositeRoles" ADD CONSTRAINT "UK_AssignedCompositeRoles" UNIQUE ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
--- UP AssignedSingleRoles---

ALTER TABLE "UP_AssignedSingleRoles" ADD CONSTRAINT "PK_AssignedSingleRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");

ALTER TABLE "UP_AssignedSingleRoles" ADD CONSTRAINT "UK_AssignedSingleRoles" UNIQUE ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
--- UP AssignedResourceTypes ---

ALTER TABLE "UP_AssignedResourceTypes" ADD CONSTRAINT "PK_AssignedResourceTypes" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");

ALTER TABLE "UP_AssignedResourceTypes" ADD CONSTRAINT "CK_AssignedResourceTypes" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
--- UP AssignedResourceScalars ---

ALTER TABLE "UP_AssignedResourceScalars" ADD CONSTRAINT "CK_AssignedResourceScalar" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo")

ALTER TABLE "UP_AssignedResourceScalars" ADD CONSTRAINT "PK_AssignedResourceScalar" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
--- UP AssignedResourceNavigations ---

ALTER TABLE "UP_AssignedResourceNavigations" ADD CONSTRAINT "CK_AssignedResourceNavigations" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "Resource_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)  ON "HistoryScheme"("ValidTo");

ALTER TABLE "UP_AssignedResourceNavigations" ADD CONSTRAINT "PK_AssignedResourceNavigations" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC)  ON "HistoryScheme"("ValidTo");
--- UP IdentifiedRisks ---

ALTER TABLE "UP_IdentifiedRisks" ADD CONSTRAINT "CK_IdentifiedRisks" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
ALTER TABLE "UP_IdentifiedRisks" ADD CONSTRAINT "PK_IdentifiedRisks" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC,"Id" ASC) ON "HistoryScheme"("ValidTo");
--- UP ResourceRiskScores ---

ALTER TABLE "UP_ResourceRiskScores" ADD CONSTRAINT "CK_ResourceRiskScores" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");

ALTER TABLE "UP_ResourceRiskScores" ADD CONSTRAINT "PK_ResourceRiskScores" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;
GO

/** 32051 UI queries optimization **/
/* Initialize the binding paths */
UPDATE b
	set "path"=STUFF((SELECT '.'+pr."identifier" FROM "um_bindingitems" bi JOIN "um_entityproperties" pr ON pr."id"= bi."property_id" AND pr."validto"=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') WHERE b.Id=bi."binding_id" ORDER BY bi."order" FOR XML PATH ('')),1,1,'')
FROM "um_bindings" b
GO

/* Initialize the filter value of assigned resource type */
declare @CreationAwaitingVerification TINYINT = 1,
        @CorrelationAwaitingVerification TINYINT = 2,
        @UpdateAwaitingVerification TINYINT = 4,
        @DeleteAwaitingVerification TINYINT = 8,
        @FoundOrHistoryWithoutResource TINYINT = 16,
        @Error TINYINT = 32;

UPDATE "up_assignedresourcetypes"
    SET "provisioningreviewfilter"=
        CASE
            WHEN ("workflowstate"=1 OR "workflowstate"=3) AND "resource_id" IS NULL THEN @FoundOrHistoryWithoutResource
            WHEN "consolidatedworkflowblockedstate"=1
	            THEN
		            CASE
			            WHEN "resource_id" IS NULL THEN @CreationAwaitingVerification
			            WHEN "provisioningstate"=5 THEN @CorrelationAwaitingVerification
			            WHEN "isdenied"=1 THEN @DeleteAwaitingVerification
			            ELSE @UpdateAwaitingVerification
		            END
	        ELSE 0
        END
	    | CASE WHEN "consolidatedassignedresourcetypecounterror" > 0 THEN @Error ELSE 0 END
WHERE "validto"=CONVERT(datetime2(2),'9999-12-31 23:59:59.99')
GO

/* 32772 Set the current activity instance of the completed workflow instances */
UPDATE wi
	SET "currentactivityinstance_id"=lastActivityInstance."id"
FROM "uw_workflowinstances" wi
JOIN (
	SELECT "id", "workflowinstance_id", ROW_NUMBER() OVER (
		PARTITION BY workflowinstance_id
		ORDER BY id DESC) row_num
	FROM "uw_activityinstances"
) lastActivityInstance ON lastActivityInstance."workflowinstance_id" = wi."id" and lastActivityInstance.row_num=1
WHERE "currentactivityinstance_id" IS NULL
GO

DELETE "um_entityassociations" WHERE ("id" < 0 OR "id" >= 9223372032559808512) AND ("property1_id" NOT IN (-9223371950955429885,-9223371950955429878,-9223371950955429872,-9223371839286280190,-9223371839286280188,-9223371839286280183,-9223371985315168250,-9223371985315168247,-9223370860033736698,-9223370860033736700,-9223370855738769406,-9223370855738769397,-9223370855738769404,-9223370855738769402,-9223370855738769400,-9223370855738769398,-9223371989610135550,-9223371989610135548,-9223370847148834814,-9223371843581247485,-9223371843581247483,-9223371843581247462,-9223371843581247481,-9223371955250397181,-9223371955250397179,-9223371955250397156,-9223371955250397177,-9223371938070527997,-9223371938070527971,-9223371938070527995,-9223371938070527993,-9223371938070527991,-9223371899415822333,-9223371899415822331,-9223371895120855037,-9223371895120855035,-9223371895120855033,-9223371890825887741,-9223371890825887739,-9223371890825887737,-9223371886530920446,-9223371886530920444,-9223371886530920442,-9223371886530920440,-9223371886530920438,-9223371358249943039,-9223371358249943037,-9223371358249943035,-9223371358249943033,-9223371358249943024,-9223370907278376958,-9223370907278376956,-9223370907278376954,-9223370907278376951,-9223372015379939325,-9223372015379939327,-9223372015379939326,-9223372015379939309,-9223372015379939278,-9223372015379939275,-9223372015379939272,-9223372015379939269,-9223371998200070141,-9223371998200070143,-9223371998200070142,-9223371998200070126,-9223371998200070094,-9223371998200070091,-9223371998200070088,-9223371998200070085,-9223372002495037436,-9223372002495037437,-9223372002495037438,-9223372002495037414,-9223372002495037390,-9223372002495037387,-9223372002495037384,-9223372002495037381,-9223372002495037439,-9223372011084972031,-9223372011084972030,-9223372011084972029,-9223372011084972011,-9223372011084972013,-9223372006790004735,-9223372006790004717,-9223372006790004734,-9223371993905102843,-9223370890098507774,-9223370890098507772,-9223370890098507770,-9223370890098507768,-9223370890098507766,-9223370890098507764,-9223370890098507762,-9223370890098507760,-9223370890098507758,-9223370890098507756,-9223370890098507754,-9223370890098507751,-9223370890098507748,-9223370877213605886,-9223370877213605884,-9223370877213605882,-9223370877213605874,-9223370877213605880,-9223370902983409656,-9223370902983409655,-9223370902983409640,-9223371938070527961,-9223371950955429845,-9223371920890658798,-9223371942365495252,-9223371856466149331,-9223371985315168209,-9223370898688442366,-9223370898688442364,-9223370898688442360,-9223370898688442357,-9223370898688442355,-9223370898688442353,-9223370898688442351,-9223370898688442349,-9223370898688442347,-9223370872918638590,-9223370872918638587,-9223370872918638585,-9223370885803540415,-9223370885803540413,-9223370885803540411,-9223370885803540409,-9223370885803540407,-9223370885803540405,-9223370885803540403,-9223370885803540401,-9223370885803540399,-9223370885803540397,-9223370885803540395,-9223370885803540393,-9223370885803540391,-9223370885803540389,-9223370885803540387,-9223370885803540385,-9223370885803540383,-9223370885803540381,-9223370885803540379,-9223370885803540377,-9223370885803540375,-9223370885803540373,-9223370885803540371,-9223370885803540369,-9223370885803540367,-9223370885803540365,-9223370885803540363,-9223370885803540361,-9223370885803540359,-9223370885803540357,-9223370885803540355,-9223370885803540353,-9223370885803540351,-9223370885803540349,-9223370885803540347,-9223370885803540345,-9223370885803540343,-9223370885803540341,-9223370885803540339,-9223370885803540337,-9223370885803540335,-9223370885803540333,-9223370885803540331,-9223370885803540329,-9223370885803540327,-9223370885803540325,-9223370885803540323,-9223370885803540321,-9223370885803540319,-9223370885803540317,-9223370885803540315,-9223370885803540313,-9223370885803540311,-9223370885803540309,-9223370885803540307,-9223370885803540305,-9223370885803540303,-9223370885803540301,-9223370885803540299,-9223370885803540297,-9223370885803540295,-9223370885803540293,-9223370885803540291,-9223370885803540289,-9223370885803540287,-9223370885803540285,-9223370885803540283,-9223370885803540281,-9223370885803540279,-9223370885803540277,-9223370885803540275,-9223370885803540273,-9223370885803540271,-9223370885803540269,-9223370885803540267,-9223370885803540265,-9223370885803540263,-9223370885803540261,-9223370885803540259,-9223370885803540257,-9223370885803540255,-9223370885803540253,-9223370885803540251,-9223370885803540249,-9223370885803540247,-9223370885803540245,-9223370885803540243,-9223370885803540241,-9223370885803540239,-9223370885803540237,-9223370885803540235,-9223370885803540233,-9223370885803540231,-9223370885803540229,-9223370885803540227,-9223370885803540225,-9223370885803540223,-9223370885803540221,-9223370885803540219,-9223370885803540217,-9223370885803540215,-9223370885803540213,-9223370885803540211,-9223370885803540209,-9223370885803540207,-9223370885803540205,-9223370885803540203,-9223370885803540201,-9223370885803540199,-9223370885803540197,-9223370885803540195,-9223370885803540193,-9223370885803540191,-9223370885803540189,-9223370885803540187,-9223370885803540185,-9223370885803540183,-9223370885803540181,-9223370885803540179,-9223370885803540177,-9223370885803540175,-9223370885803540173,-9223370885803540171,-9223370885803540169,-9223370885803540167,-9223370885803540165,-9223370885803540163,-9223370885803540161,-9223371929480593377,-9223370842853867513,-9223370838558900216,-9223371332480139259,-9223371384019746812,-9223371384019746811,-9223371384019746803,-9223371379724779514,-9223371379724779513,-9223371379724779512,-9223371375429812203,-9223371375429812206,-9223371723322163194,-9223371723322163190,-9223371723322163188,-9223371723322163186,-9223371723322163184,-9223371723322163192,-9223371877940985852,-9223371877940985841,-9223371877940985839,-9223371916595691515,-9223371916595691513,-9223371916595691511,-9223371916595691497,-9223371916595691494,-9223371852171182078,-9223371852171182076,-9223370911573344235,-9223371929480593378,-9223371332480139258,-9223371336775106461,-9223371336775106458,-9223371336775106457,-9223371336775106456,-9223371160681447422,-9223371160681447420,-9223371164976414716,-9223371164976414718,-9223371332480139249,-9223371173566349292,-9223371173566349311,-9223371173566349309,-9223371169271382011,-9223371169271382009,-9223371336775106470,-9223371190746218476,-9223371182156283900,-9223371182156283902,-9223371177861316606,-9223371177861316604,-9223370864328703997,-9223370864328703986,-9223371770566803455,-9223371770566803451,-9223371787746672639,-9223371787746672636,-9223371787746672628,-9223371787746672632,-9223371787746672631,-9223371787746672630,-9223371774861770747,-9223371774861770744,-9223371774861770742,-9223371774861770740,-9223371774861770738,-9223371774861770737,-9223371774861770732,-9223371813516476413,-9223371813516476415,-9223371800631574526,-9223371796336607230,-9223371727617130493,-9223371349660008441,-9223371349660008440,-9223371349660008442,-9223371345365041147,-9223371345365041145,-9223371345365041143,-9223371345365041148,-9223371345365041051,-9223371345365041049,-9223371345365041047,-9223371345365041045,-9223371345365041043,-9223371345365041041,-9223371345365041039,-9223371345365041037,-9223371345365041035,-9223371345365041033,-9223371345365041031,-9223371345365041029,-9223371345365041027,-9223371345365041025,-9223371345365041023,-9223371345365041021,-9223371345365041019,-9223371345365041017,-9223371345365041015,-9223371345365041013,-9223371345365041011,-9223371345365041009,-9223371345365041007,-9223371345365041005,-9223371345365041003,-9223371345365041001,-9223371345365040999,-9223371345365040997,-9223371345365040995,-9223371345365040993,-9223371345365040991,-9223371345365040989,-9223371345365040987,-9223371345365040985,-9223371345365040983,-9223371345365040981,-9223371345365040979,-9223371345365040977,-9223371345365040975,-9223371345365040973,-9223371345365040971,-9223371345365040969,-9223371345365040967,-9223371345365040965,-9223371345365040963,-9223371345365040961,-9223371345365040959,-9223371345365040957,-9223371345365040955,-9223371345365040953,-9223371345365040951,-9223371345365040949,-9223371345365040947,-9223371345365040945,-9223371345365040943,-9223371345365040941,-9223371345365040939,-9223371345365040937,-9223371345365040935,-9223371345365040933,-9223371345365040931,-9223371345365040929,-9223371345365040927,-9223371345365040925,-9223371345365040923,-9223371345365040921,-9223371345365040919,-9223371345365040917,-9223371345365040915,-9223371345365040913,-9223371345365040911,-9223371345365040909,-9223371345365040907,-9223371345365040905,-9223371345365040903,-9223371345365040901,-9223371345365040899,-9223371345365040897,-9223371345365040895,-9223371345365040893,-9223371345365040891,-9223371345365040889,-9223371345365040887,-9223371345365040885,-9223371345365040883,-9223371345365040881,-9223371345365040879,-9223371345365040877,-9223371345365040875,-9223371345365040873,-9223371345365040871,-9223371345365040869,-9223371345365040867,-9223371345365040865,-9223371345365040863,-9223371345365040861,-9223371345365040859,-9223371345365040857,-9223371345365040855,-9223371345365040853,-9223371345365040851,-9223371345365040849,-9223371345365040847,-9223371345365040845,-9223371345365040843,-9223371345365040841,-9223371345365040839,-9223371345365040837,-9223371345365040835,-9223371345365040833,-9223371345365040831,-9223371345365040829,-9223371345365040827,-9223371345365040825,-9223371345365040823,-9223371345365040821,-9223371345365040819,-9223371345365040817,-9223371345365040815,-9223371345365040813,-9223371345365040811,-9223371345365040809,-9223371345365040807,-9223371345365040805,-9223371345365040803,-9223371345365040801,-9223371345365040799,-9223371345365040797,-9223371869351051262,-9223371869351051260,-9223371869351051249,-9223371860761116664,-9223371860761116662,-9223371860761116656,-9223371860761116660,-9223371822106411003,-9223371817811443708,-9223371817811443706,-9223371783451705340,-9223371783451705333,-9223371783451705335,-9223371779156738042,-9223371779156738046,-9223371779156738035,-9223371779156738033,-9223371779156738031,-9223371749091966974,-9223371749091966952,-9223371740502032382,-9223371740502032365,-9223371740502032376,-9223371740502032363,-9223371740502032326,-9223371744796999678,-9223371744796999676,-9223371298120400890,-9223371302415368185,-9223371302415368186,-9223371366839877627,-9223371366839877625,-9223371366839877622,-9223371366839877615,-9223371366839877613,-9223371366839877609,-9223371366839877605,-9223371366839877607,-9223371366839877603,-9223371366839877599,-9223371366839877601) OR "property2_id" NOT IN (-9223371950955429883,-9223371946660462589,-9223371950955429871,-9223371950955429867,-9223371920890658792,-9223371946660462569,-9223371946660462567,-9223371920890658769,-9223371946660462565,-9223371985315168245,-9223370860033736696,-9223371985315168210,-9223371938070527945,-9223371916595690519,-9223371942365495269,-9223371886530920418,-9223371985315168252,-9223371942365495274,-9223371942365495271,-9223371950955429876,-9223371946660462585,-9223371950955429854,-9223371920890658804,-9223371950955429881,-9223371946660462587,-9223371950955429855,-9223371920890658808,-9223371950955429874,-9223371950955429856,-9223371946660462583,-9223371920890658802,-9223371920890658800,-9223371843581247479,-9223371946660462581,-9223371955250397173,-9223371946660462579,-9223371843581247477,-9223371938070527988,-9223371946660462577,-9223371955250397171,-9223371946660462575,-9223371942365495285,-9223371938070527986,-9223371916595691509,-9223371955250397169,-9223371946660462572,-9223371938070527983,-9223371916595691488,-9223371856466149365,-9223371955250397146,-9223371946660462570,-9223371938070527980,-9223371856466149360,-9223371856466149359,-9223371976725233659,-9223371843581247474,-9223371942365495289,-9223371942365495279,-9223371942365495236,-9223371942365495233,-9223371942365495230,-9223371942365495227,-9223371976725233657,-9223371955250397175,-9223371942365495288,-9223371942365495278,-9223371942365495235,-9223371942365495232,-9223371942365495229,-9223371942365495226,-9223371976725233655,-9223371942365495291,-9223371942365495290,-9223371942365495277,-9223371942365495234,-9223371942365495231,-9223371942365495228,-9223371942365495225,-9223371938070527989,-9223372002495037430,-9223371916595691490,-9223371942365495286,-9223371942365495273,-9223371942365495276,-9223372002495037429,-9223371942365495275,-9223371916595691489,-9223372002495037407,-9223371946660462538,-9223371920890658776,-9223371856466149344,-9223371856466149343,-9223371856466149342,-9223371856466149341,-9223371856466149340,-9223371856466149339,-9223371856466149338,-9223371856466149337,-9223371856466149336,-9223371856466149335,-9223371856466149334,-9223371946660462537,-9223371938070527960,-9223371916595691486,-9223371856466149358,-9223371856466149357,-9223370881508573182,-9223370885803540478,-9223370851443802110,-9223370881508573169,-9223370881508573171,-9223370902983409644,-9223370885803540476,-9223370885803540473,-9223370881508573162,-9223370902983409661,-9223371942365495265,-9223371942365495264,-9223371942365495263,-9223372015379939306,-9223371998200070122,-9223372002495037406,-9223372011084972010,-9223372006790004714,-9223370898688442341,-9223371942365495254,-9223371942365495253,-9223371940218010881,-9223371940218010880,-9223371940218010879,-9223371940218010878,-9223371940218010877,-9223371940218010876,-9223371940218010875,-9223371940218010874,-9223371940218010873,-9223371940218010872,-9223371940218010871,-9223371940218010870,-9223371940218010869,-9223371940218010868,-9223371940218010867,-9223371940218010866,-9223371940218010865,-9223371940218010864,-9223371940218010863,-9223371940218010862,-9223371940218010861,-9223371940218010860,-9223371940218010859,-9223371940218010858,-9223371940218010857,-9223371940218010856,-9223371940218010855,-9223371940218010854,-9223371940218010853,-9223371940218010852,-9223371940218010851,-9223371940218010850,-9223371940218010849,-9223371940218010848,-9223371940218010847,-9223371940218010846,-9223371940218010845,-9223371940218010844,-9223371940218010843,-9223371940218010842,-9223371940218010841,-9223371940218010840,-9223371940218010839,-9223371940218010838,-9223371940218010837,-9223371940218010836,-9223371940218010835,-9223371940218010834,-9223371940218010833,-9223371940218010832,-9223371940218010831,-9223371940218010830,-9223371940218010829,-9223371940218010828,-9223371940218010827,-9223371940218010826,-9223371940218010825,-9223371940218010824,-9223371940218010823,-9223371940218010822,-9223371940218010821,-9223371940218010820,-9223371940218010819,-9223371940218010818,-9223371940218010817,-9223371940218010816,-9223371940218010815,-9223371940218010814,-9223371940218010813,-9223371940218010812,-9223371940218010811,-9223371940218010810,-9223371940218010809,-9223371940218010808,-9223371940218010807,-9223371940218010806,-9223371940218010805,-9223371940218010804,-9223371940218010803,-9223371940218010802,-9223371940218010801,-9223371940218010800,-9223371940218010799,-9223371940218010798,-9223371940218010797,-9223371940218010796,-9223371940218010795,-9223371940218010794,-9223371940218010793,-9223371940218010792,-9223371940218010791,-9223371940218010790,-9223371940218010789,-9223371940218010788,-9223371940218010787,-9223371940218010786,-9223371940218010785,-9223371940218010784,-9223371940218010783,-9223371940218010782,-9223371940218010781,-9223371940218010780,-9223371940218010779,-9223371940218010778,-9223371940218010777,-9223371940218010776,-9223371940218010775,-9223371940218010774,-9223371940218010773,-9223371940218010772,-9223371940218010771,-9223371940218010770,-9223371940218010769,-9223371940218010768,-9223371940218010767,-9223371940218010766,-9223371940218010765,-9223371940218010764,-9223371940218010763,-9223371940218010762,-9223371940218010761,-9223371940218010760,-9223371940218010759,-9223371940218010758,-9223371940218010757,-9223371940218010756,-9223371940218010755,-9223371940218010754,-9223370842853867515,-9223370838558900219,-9223370834263932923,-9223371929480593403,-9223371929480593388,-9223371379724779510,-9223371920890658785,-9223371916595691470,-9223371375429812215,-9223371375429812214,-9223371929480593387,-9223371912300724197,-9223371916595691430,-9223371916595691429,-9223371916595691428,-9223371916595691427,-9223371916595691426,-9223371938070527970,-9223371920890658809,-9223371916595691460,-9223371916595691459,-9223371920890658813,-9223371912300724221,-9223371912300724219,-9223371916595691496,-9223370894393475045,-9223371856466149374,-9223371916595691507,-9223371336775106550,-9223371336775106455,-9223371336775106553,-9223371336775106459,-9223371938070527930,-9223371920890658766,-9223371877940985776,-9223371336775106464,-9223371336775106463,-9223371877940985806,-9223371336775106466,-9223371190746218483,-9223371190746218480,-9223371190746218475,-9223371942365495246,-9223371336775106467,-9223371173566349301,-9223371186451251198,-9223371186451251199,-9223371920890658771,-9223371336775106469,-9223371336775106468,-9223371938070527955,-9223370868623671283,-9223371920890658770,-9223371813516476405,-9223371766271836156,-9223371809221509112,-9223371813516476407,-9223371796336607225,-9223372015379939313,-9223371998200070130,-9223372002495037420,-9223371787746672633,-9223371942365495281,-9223371942365495287,-9223371813516476406,-9223371942365495280,-9223371800631574521,-9223370911573344242,-9223371804926541822,-9223371809221509118,-9223371804926541821,-9223371800631574525,-9223371920890658746,-9223371345365041151,-9223371942365495266,-9223371353954975742,-9223371843581247453,-9223371955250397147,-9223371938070527957,-9223371950955429865,-9223371940218011009,-9223371940218011008,-9223371940218011007,-9223371940218011006,-9223371940218011005,-9223371940218011004,-9223371940218011003,-9223371940218011002,-9223371940218011001,-9223371940218011000,-9223371940218010999,-9223371940218010998,-9223371940218010997,-9223371940218010996,-9223371940218010995,-9223371940218010994,-9223371940218010993,-9223371940218010992,-9223371940218010991,-9223371940218010990,-9223371940218010989,-9223371940218010988,-9223371940218010987,-9223371940218010986,-9223371940218010985,-9223371940218010984,-9223371940218010983,-9223371940218010982,-9223371940218010981,-9223371940218010980,-9223371940218010979,-9223371940218010978,-9223371940218010977,-9223371940218010976,-9223371940218010975,-9223371940218010974,-9223371940218010973,-9223371940218010972,-9223371940218010971,-9223371940218010970,-9223371940218010969,-9223371940218010968,-9223371940218010967,-9223371940218010966,-9223371940218010965,-9223371940218010964,-9223371940218010963,-9223371940218010962,-9223371940218010961,-9223371940218010960,-9223371940218010959,-9223371940218010958,-9223371940218010957,-9223371940218010956,-9223371940218010955,-9223371940218010954,-9223371940218010953,-9223371940218010952,-9223371940218010951,-9223371940218010950,-9223371940218010949,-9223371940218010948,-9223371940218010947,-9223371940218010946,-9223371940218010945,-9223371940218010944,-9223371940218010943,-9223371940218010942,-9223371940218010941,-9223371940218010940,-9223371940218010939,-9223371940218010938,-9223371940218010937,-9223371940218010936,-9223371940218010935,-9223371940218010934,-9223371940218010933,-9223371940218010932,-9223371940218010931,-9223371940218010930,-9223371940218010929,-9223371940218010928,-9223371940218010927,-9223371940218010926,-9223371940218010925,-9223371940218010924,-9223371940218010923,-9223371940218010922,-9223371940218010921,-9223371940218010920,-9223371940218010919,-9223371940218010918,-9223371940218010917,-9223371940218010916,-9223371940218010915,-9223371940218010914,-9223371940218010913,-9223371940218010912,-9223371940218010911,-9223371940218010910,-9223371940218010909,-9223371940218010908,-9223371940218010907,-9223371940218010906,-9223371940218010905,-9223371940218010904,-9223371940218010903,-9223371940218010902,-9223371940218010901,-9223371940218010900,-9223371940218010899,-9223371940218010898,-9223371940218010897,-9223371940218010896,-9223371940218010895,-9223371940218010894,-9223371940218010893,-9223371940218010892,-9223371940218010891,-9223371940218010890,-9223371940218010889,-9223371940218010888,-9223371940218010887,-9223371940218010886,-9223371940218010885,-9223371940218010884,-9223371940218010883,-9223371940218010882,-9223371920890658806,-9223371792041639926,-9223371727617130480,-9223371869351051259,-9223371856466149373,-9223371822106411005,-9223371856466149372,-9223371826401378302,-9223371822106411002,-9223371856466149371,-9223371920890658788,-9223371920890658787,-9223371856466149347,-9223371783451705337,-9223371856466149370,-9223371856466149369,-9223371856466149368,-9223371856466149367,-9223371920890658786,-9223371856466149329,-9223371916595691469,-9223371749091966962,-9223371869351051251,-9223371856466149345,-9223371856466149330,-9223371912300724196,-9223371740502032354,-9223371302415368184,-9223371856466149288,-9223371920890658728,-9223371371134844925,-9223371366839877624,-9223371856466149375,-9223371822106411000,-9223371869351051257,-9223371856466149366,-9223371856466149361,-9223371856466149362,-9223371856466149363,-9223371856466149346,-9223371727617130464));
DELETE "um_bindingitems" WHERE "property_id" IN (SELECT "id" FROM "um_entityproperties" WHERE ("id" < 0 OR "id" >= 9223372032559808512) AND "id" NOT IN (-9223371946660462592,-9223371946660462591,-9223371946660462590,-9223371946660462568,-9223371946660462563,-9223371946660462562,-9223371946660462561,-9223371946660462560,-9223371946660462559,-9223371946660462589,-9223371946660462588,-9223371946660462569,-9223371946660462567,-9223371946660462566,-9223371946660462565,-9223371946660462564,-9223371946660462585,-9223371946660462584,-9223371946660462587,-9223371946660462586,-9223371946660462583,-9223371946660462582,-9223371946660462581,-9223371946660462580,-9223371946660462579,-9223371946660462578,-9223371946660462577,-9223371946660462576,-9223371946660462575,-9223371946660462574,-9223371946660462572,-9223371946660462571,-9223371946660462570,-9223371946660462538,-9223371946660462537,-9223371946660462573,-9223371946660462546,-9223371946660462545,-9223371946660462544,-9223371946660462543,-9223371946660462542,-9223371946660462541,-9223371946660462540,-9223371946660462539,-9223371946660462527,-9223371946660462528,-9223371946660462525,-9223371946660462526,-9223371946660462523,-9223371946660462524,-9223371946660462521,-9223371946660462522,-9223371946660462519,-9223371946660462520,-9223371946660462517,-9223371946660462518,-9223371946660462515,-9223371946660462516,-9223371946660462513,-9223371946660462514,-9223371946660462511,-9223371946660462512,-9223371946660462509,-9223371946660462510,-9223371946660462507,-9223371946660462508,-9223371946660462505,-9223371946660462506,-9223371946660462503,-9223371946660462504,-9223371946660462501,-9223371946660462502,-9223371946660462499,-9223371946660462500,-9223371946660462497,-9223371946660462498,-9223371946660462495,-9223371946660462496,-9223371946660462493,-9223371946660462494,-9223371946660462491,-9223371946660462492,-9223371946660462489,-9223371946660462490,-9223371946660462487,-9223371946660462488,-9223371946660462485,-9223371946660462486,-9223371946660462483,-9223371946660462484,-9223371946660462481,-9223371946660462482,-9223371946660462479,-9223371946660462480,-9223371946660462477,-9223371946660462478,-9223371946660462475,-9223371946660462476,-9223371946660462473,-9223371946660462474,-9223371946660462471,-9223371946660462472,-9223371946660462469,-9223371946660462470,-9223371946660462467,-9223371946660462468,-9223371946660462465,-9223371946660462466,-9223371946660462463,-9223371946660462464,-9223371946660462461,-9223371946660462462,-9223371946660462459,-9223371946660462460,-9223371946660462457,-9223371946660462458,-9223371946660462455,-9223371946660462456,-9223371946660462453,-9223371946660462454,-9223371946660462451,-9223371946660462452,-9223371946660462449,-9223371946660462450,-9223371946660462447,-9223371946660462448,-9223371946660462445,-9223371946660462446,-9223371946660462443,-9223371946660462444,-9223371946660462441,-9223371946660462442,-9223371946660462439,-9223371946660462440,-9223371946660462437,-9223371946660462438,-9223371946660462435,-9223371946660462436,-9223371946660462433,-9223371946660462434,-9223371946660462431,-9223371946660462432,-9223371946660462429,-9223371946660462430,-9223371946660462427,-9223371946660462428,-9223371946660462425,-9223371946660462426,-9223371946660462423,-9223371946660462424,-9223371946660462421,-9223371946660462422,-9223371946660462419,-9223371946660462420,-9223371946660462417,-9223371946660462418,-9223371946660462415,-9223371946660462416,-9223371946660462413,-9223371946660462414,-9223371946660462411,-9223371946660462412,-9223371946660462409,-9223371946660462410,-9223371946660462407,-9223371946660462408,-9223371946660462405,-9223371946660462406,-9223371946660462403,-9223371946660462404,-9223371946660462401,-9223371946660462402,-9223371946660462399,-9223371946660462400,-9223371946660462397,-9223371946660462398,-9223371946660462395,-9223371946660462396,-9223371946660462393,-9223371946660462394,-9223371946660462391,-9223371946660462392,-9223371946660462389,-9223371946660462390,-9223371946660462387,-9223371946660462388,-9223371946660462385,-9223371946660462386,-9223371946660462383,-9223371946660462384,-9223371946660462381,-9223371946660462382,-9223371946660462379,-9223371946660462380,-9223371946660462377,-9223371946660462378,-9223371946660462375,-9223371946660462376,-9223371946660462373,-9223371946660462374,-9223371946660462371,-9223371946660462372,-9223371946660462369,-9223371946660462370,-9223371946660462367,-9223371946660462368,-9223371946660462365,-9223371946660462366,-9223371946660462363,-9223371946660462364,-9223371946660462361,-9223371946660462362,-9223371946660462359,-9223371946660462360,-9223371946660462357,-9223371946660462358,-9223371946660462355,-9223371946660462356,-9223371946660462353,-9223371946660462354,-9223371946660462351,-9223371946660462352,-9223371946660462349,-9223371946660462350,-9223371946660462347,-9223371946660462348,-9223371946660462345,-9223371946660462346,-9223371946660462343,-9223371946660462344,-9223371946660462341,-9223371946660462342,-9223371946660462339,-9223371946660462340,-9223371946660462337,-9223371946660462338,-9223371946660462335,-9223371946660462336,-9223371946660462333,-9223371946660462334,-9223371946660462331,-9223371946660462332,-9223371946660462329,-9223371946660462330,-9223371946660462327,-9223371946660462328,-9223371946660462325,-9223371946660462326,-9223371946660462323,-9223371946660462324,-9223371946660462321,-9223371946660462322,-9223371946660462319,-9223371946660462320,-9223371946660462317,-9223371946660462318,-9223371946660462315,-9223371946660462316,-9223371946660462313,-9223371946660462314,-9223371946660462311,-9223371946660462312,-9223371946660462309,-9223371946660462310,-9223371946660462307,-9223371946660462308,-9223371946660462305,-9223371946660462306,-9223371946660462303,-9223371946660462304,-9223371946660462301,-9223371946660462302,-9223371946660462299,-9223371946660462300,-9223371946660462297,-9223371946660462298,-9223371946660462295,-9223371946660462296,-9223371946660462293,-9223371946660462294,-9223371946660462291,-9223371946660462292,-9223371946660462289,-9223371946660462290,-9223371946660462287,-9223371946660462288,-9223371946660462285,-9223371946660462286,-9223371946660462283,-9223371946660462284,-9223371946660462281,-9223371946660462282,-9223371946660462279,-9223371946660462280,-9223371946660462277,-9223371946660462278,-9223371946660462275,-9223371946660462276,-9223371946660462273,-9223371946660462274,-9223371950955429888,-9223371950955429866,-9223371950955429885,-9223371950955429884,-9223371950955429883,-9223371950955429882,-9223371950955429879,-9223371950955429878,-9223371950955429877,-9223371950955429872,-9223371950955429871,-9223371950955429870,-9223371950955429869,-9223371950955429868,-9223371950955429844,-9223371950955429867,-9223371950955429876,-9223371950955429875,-9223371950955429854,-9223371950955429881,-9223371950955429880,-9223371950955429855,-9223371950955429874,-9223371950955429873,-9223371950955429856,-9223371950955429887,-9223371950955429864,-9223371950955429863,-9223371950955429862,-9223371950955429861,-9223371950955429860,-9223371950955429859,-9223371950955429858,-9223371950955429857,-9223371950955429835,-9223371950955429843,-9223371950955429842,-9223371950955429841,-9223371950955429840,-9223371950955429839,-9223371950955429838,-9223371950955429837,-9223371950955429836,-9223371950955429886,-9223371950955429853,-9223371950955429852,-9223371950955429851,-9223371950955429850,-9223371950955429849,-9223371950955429848,-9223371950955429847,-9223371950955429846,-9223371950955429845,-9223371950955429865,-9223371839286280192,-9223371839286280191,-9223371839286280190,-9223371839286280189,-9223371839286280188,-9223371839286280184,-9223371839286280183,-9223371839286280187,-9223371839286280186,-9223371839286280185,-9223371920890658792,-9223371920890658769,-9223371920890658768,-9223371920890658804,-9223371920890658803,-9223371920890658808,-9223371920890658807,-9223371920890658802,-9223371920890658801,-9223371920890658800,-9223371920890658799,-9223371920890658776,-9223371920890658798,-9223371920890658785,-9223371920890658809,-9223371920890658816,-9223371920890658815,-9223371920890658771,-9223371920890658813,-9223371920890658812,-9223371920890658814,-9223371920890658784,-9223371920890658783,-9223371920890658782,-9223371920890658781,-9223371920890658780,-9223371920890658779,-9223371920890658778,-9223371920890658777,-9223371920890658766,-9223371920890658770,-9223371920890658746,-9223371920890658789,-9223371920890658806,-9223371920890658793,-9223371920890658788,-9223371920890658787,-9223371920890658786,-9223371920890658728,-9223371985315168256,-9223371985315168239,-9223371985315168253,-9223371985315168244,-9223371985315168250,-9223371985315168251,-9223371985315168249,-9223371985315168247,-9223371985315168248,-9223371985315168245,-9223371985315168246,-9223371985315168252,-9223371985315168255,-9223371985315168237,-9223371985315168236,-9223371985315168235,-9223371985315168234,-9223371985315168233,-9223371985315168232,-9223371985315168231,-9223371985315168230,-9223371985315168254,-9223371985315168227,-9223371985315168226,-9223371985315168225,-9223371985315168224,-9223371985315168223,-9223371985315168222,-9223371985315168221,-9223371985315168220,-9223371985315168219,-9223371985315168218,-9223371985315168217,-9223371985315168216,-9223371985315168215,-9223371985315168214,-9223371985315168213,-9223371985315168212,-9223371985315168211,-9223371985315168210,-9223371985315168209,-9223370860033736704,-9223370860033736698,-9223370860033736699,-9223370860033736700,-9223370860033736701,-9223370860033736696,-9223370860033736697,-9223370855738769408,-9223370855738769406,-9223370855738769407,-9223370855738769404,-9223370855738769405,-9223370855738769402,-9223370855738769403,-9223370855738769400,-9223370855738769401,-9223370855738769399,-9223370855738769398,-9223370855738769397,-9223370855738769395,-9223371916595690519,-9223371916595691509,-9223371916595691508,-9223371916595691488,-9223371916595691487,-9223371916595691490,-9223371916595691489,-9223371916595691486,-9223371916595691430,-9223371916595691429,-9223371916595691426,-9223371916595691428,-9223371916595691427,-9223371916595691460,-9223371916595691459,-9223371916595691520,-9223371916595691519,-9223371916595691518,-9223371916595691517,-9223371916595691515,-9223371916595691516,-9223371916595691513,-9223371916595691514,-9223371916595691511,-9223371916595691512,-9223371916595691470,-9223371916595691469,-9223371916595691498,-9223371916595691497,-9223371916595691496,-9223371916595691495,-9223371916595691494,-9223371916595691480,-9223371916595691507,-9223371916595691510,-9223371916595691506,-9223371916595691505,-9223371916595691504,-9223371916595691503,-9223371916595691502,-9223371916595691501,-9223371916595691500,-9223371916595691499,-9223371938070527945,-9223371938070528000,-9223371938070527984,-9223371938070527997,-9223371938070527996,-9223371938070527971,-9223371938070527995,-9223371938070527994,-9223371938070527993,-9223371938070527992,-9223371938070527991,-9223371938070527990,-9223371938070527981,-9223371938070527959,-9223371938070527958,-9223371938070527956,-9223371938070527944,-9223371938070527988,-9223371938070527987,-9223371938070527986,-9223371938070527985,-9223371938070527983,-9223371938070527982,-9223371938070527980,-9223371938070527989,-9223371938070527960,-9223371938070527999,-9223371938070527979,-9223371938070527978,-9223371938070527977,-9223371938070527976,-9223371938070527975,-9223371938070527974,-9223371938070527973,-9223371938070527972,-9223371938070527954,-9223371938070527953,-9223371938070527952,-9223371938070527951,-9223371938070527950,-9223371938070527949,-9223371938070527948,-9223371938070527947,-9223371938070527946,-9223371938070527998,-9223371938070527969,-9223371938070527968,-9223371938070527967,-9223371938070527966,-9223371938070527965,-9223371938070527964,-9223371938070527963,-9223371938070527962,-9223371938070527961,-9223371938070527970,-9223371938070527930,-9223371938070527955,-9223371938070527957,-9223371942365495269,-9223371942365495274,-9223371942365495271,-9223371942365495285,-9223371942365495284,-9223371942365495289,-9223371942365495279,-9223371942365495236,-9223371942365495233,-9223371942365495230,-9223371942365495227,-9223371942365495288,-9223371942365495278,-9223371942365495235,-9223371942365495232,-9223371942365495229,-9223371942365495226,-9223371942365495291,-9223371942365495290,-9223371942365495277,-9223371942365495234,-9223371942365495231,-9223371942365495228,-9223371942365495225,-9223371942365495286,-9223371942365495276,-9223371942365495273,-9223371942365495275,-9223371942365495252,-9223371942365495265,-9223371942365495264,-9223371942365495263,-9223371942365495254,-9223371942365495253,-9223371940218010881,-9223371940218010880,-9223371940218010879,-9223371940218010878,-9223371940218010877,-9223371940218010876,-9223371940218010875,-9223371940218010874,-9223371940218010873,-9223371940218010872,-9223371940218010871,-9223371940218010870,-9223371940218010869,-9223371940218010868,-9223371940218010867,-9223371940218010866,-9223371940218010865,-9223371940218010864,-9223371940218010863,-9223371940218010862,-9223371940218010861,-9223371940218010860,-9223371940218010859,-9223371940218010858,-9223371940218010857,-9223371940218010856,-9223371940218010855,-9223371940218010854,-9223371940218010853,-9223371940218010852,-9223371940218010851,-9223371940218010850,-9223371940218010849,-9223371940218010848,-9223371940218010847,-9223371940218010846,-9223371940218010845,-9223371940218010844,-9223371940218010843,-9223371940218010842,-9223371940218010841,-9223371940218010840,-9223371940218010839,-9223371940218010838,-9223371940218010837,-9223371940218010836,-9223371940218010835,-9223371940218010834,-9223371940218010833,-9223371940218010832,-9223371940218010831,-9223371940218010830,-9223371940218010829,-9223371940218010828,-9223371940218010827,-9223371940218010826,-9223371940218010825,-9223371940218010824,-9223371940218010823,-9223371940218010822,-9223371940218010821,-9223371940218010820,-9223371940218010819,-9223371940218010818,-9223371940218010817,-9223371940218010816,-9223371940218010815,-9223371940218010814,-9223371940218010813,-9223371940218010812,-9223371940218010811,-9223371940218010810,-9223371940218010809,-9223371940218010808,-9223371940218010807,-9223371940218010806,-9223371940218010805,-9223371940218010804,-9223371940218010803,-9223371940218010802,-9223371940218010801,-9223371940218010800,-9223371940218010799,-9223371940218010798,-9223371940218010797,-9223371940218010796,-9223371940218010795,-9223371940218010794,-9223371940218010793,-9223371940218010792,-9223371940218010791,-9223371940218010790,-9223371940218010789,-9223371940218010788,-9223371940218010787,-9223371940218010786,-9223371940218010785,-9223371940218010784,-9223371940218010783,-9223371940218010782,-9223371940218010781,-9223371940218010780,-9223371940218010779,-9223371940218010778,-9223371940218010777,-9223371940218010776,-9223371940218010775,-9223371940218010774,-9223371940218010773,-9223371940218010772,-9223371940218010771,-9223371940218010770,-9223371940218010769,-9223371940218010768,-9223371940218010767,-9223371940218010766,-9223371940218010765,-9223371940218010764,-9223371940218010763,-9223371940218010762,-9223371940218010761,-9223371940218010760,-9223371940218010759,-9223371940218010758,-9223371940218010757,-9223371940218010756,-9223371940218010755,-9223371940218010754,-9223371942365495246,-9223371942365495296,-9223371942365495295,-9223371942365495294,-9223371942365495262,-9223371942365495261,-9223371942365495260,-9223371942365495259,-9223371942365495258,-9223371942365495257,-9223371942365495256,-9223371942365495255,-9223371942365495293,-9223371942365495281,-9223371942365495287,-9223371942365495280,-9223371942365495266,-9223371940218011009,-9223371940218011008,-9223371940218011007,-9223371940218011006,-9223371940218011005,-9223371940218011004,-9223371940218011003,-9223371940218011002,-9223371940218011001,-9223371940218011000,-9223371940218010999,-9223371940218010998,-9223371940218010997,-9223371940218010996,-9223371940218010995,-9223371940218010994,-9223371940218010993,-9223371940218010992,-9223371940218010991,-9223371940218010990,-9223371940218010989,-9223371940218010988,-9223371940218010987,-9223371940218010986,-9223371940218010985,-9223371940218010984,-9223371940218010983,-9223371940218010982,-9223371940218010981,-9223371940218010980,-9223371940218010979,-9223371940218010978,-9223371940218010977,-9223371940218010976,-9223371940218010975,-9223371940218010974,-9223371940218010973,-9223371940218010972,-9223371940218010971,-9223371940218010970,-9223371940218010969,-9223371940218010968,-9223371940218010967,-9223371940218010966,-9223371940218010965,-9223371940218010964,-9223371940218010963,-9223371940218010962,-9223371940218010961,-9223371940218010960,-9223371940218010959,-9223371940218010958,-9223371940218010957,-9223371940218010956,-9223371940218010955,-9223371940218010954,-9223371940218010953,-9223371940218010952,-9223371940218010951,-9223371940218010950,-9223371940218010949,-9223371940218010948,-9223371940218010947,-9223371940218010946,-9223371940218010945,-9223371940218010944,-9223371940218010943,-9223371940218010942,-9223371940218010941,-9223371940218010940,-9223371940218010939,-9223371940218010938,-9223371940218010937,-9223371940218010936,-9223371940218010935,-9223371940218010934,-9223371940218010933,-9223371940218010932,-9223371940218010931,-9223371940218010930,-9223371940218010929,-9223371940218010928,-9223371940218010927,-9223371940218010926,-9223371940218010925,-9223371940218010924,-9223371940218010923,-9223371940218010922,-9223371940218010921,-9223371940218010920,-9223371940218010919,-9223371940218010918,-9223371940218010917,-9223371940218010916,-9223371940218010915,-9223371940218010914,-9223371940218010913,-9223371940218010912,-9223371940218010911,-9223371940218010910,-9223371940218010909,-9223371940218010908,-9223371940218010907,-9223371940218010906,-9223371940218010905,-9223371940218010904,-9223371940218010903,-9223371940218010902,-9223371940218010901,-9223371940218010900,-9223371940218010899,-9223371940218010898,-9223371940218010897,-9223371940218010896,-9223371940218010895,-9223371940218010894,-9223371940218010893,-9223371940218010892,-9223371940218010891,-9223371940218010890,-9223371940218010889,-9223371940218010888,-9223371940218010887,-9223371940218010886,-9223371940218010885,-9223371940218010884,-9223371940218010883,-9223371940218010882,-9223371886530920418,-9223371886530920448,-9223371886530920447,-9223371886530920446,-9223371886530920445,-9223371886530920444,-9223371886530920443,-9223371886530920442,-9223371886530920441,-9223371886530920440,-9223371886530920439,-9223371886530920438,-9223371886530920437,-9223371886530920436,-9223371886530920435,-9223371886530920434,-9223371886530920433,-9223371886530920417,-9223371989610135552,-9223371989610135548,-9223371989610135549,-9223371989610135543,-9223371989610135550,-9223371989610135551,-9223371989610135547,-9223371989610135546,-9223371989610135544,-9223371989610135545,-9223370847148834816,-9223370847148834814,-9223370847148834815,-9223370847148834813,-9223370847148834812,-9223370847148834811,-9223371843581247488,-9223371843581247475,-9223371843581247485,-9223371843581247484,-9223371843581247462,-9223371843581247483,-9223371843581247482,-9223371843581247481,-9223371843581247480,-9223371843581247473,-9223371843581247443,-9223371843581247442,-9223371843581247441,-9223371843581247440,-9223371843581247439,-9223371843581247479,-9223371843581247478,-9223371843581247477,-9223371843581247476,-9223371843581247474,-9223371843581247487,-9223371843581247472,-9223371843581247471,-9223371843581247470,-9223371843581247469,-9223371843581247468,-9223371843581247467,-9223371843581247466,-9223371843581247465,-9223371843581247452,-9223371843581247451,-9223371843581247450,-9223371843581247449,-9223371843581247448,-9223371843581247447,-9223371843581247446,-9223371843581247445,-9223371843581247444,-9223371843581247486,-9223371843581247461,-9223371843581247460,-9223371843581247459,-9223371843581247458,-9223371843581247457,-9223371843581247456,-9223371843581247455,-9223371843581247454,-9223371843581247453,-9223371955250397184,-9223371955250397167,-9223371955250397181,-9223371955250397180,-9223371955250397156,-9223371955250397179,-9223371955250397178,-9223371955250397177,-9223371955250397176,-9223371955250397166,-9223371955250397134,-9223371955250397133,-9223371955250397132,-9223371955250397131,-9223371955250397130,-9223371955250397173,-9223371955250397172,-9223371955250397171,-9223371955250397170,-9223371955250397169,-9223371955250397168,-9223371955250397146,-9223371955250397145,-9223371955250397175,-9223371955250397183,-9223371955250397165,-9223371955250397164,-9223371955250397163,-9223371955250397162,-9223371955250397161,-9223371955250397160,-9223371955250397159,-9223371955250397158,-9223371955250397144,-9223371955250397143,-9223371955250397142,-9223371955250397141,-9223371955250397140,-9223371955250397139,-9223371955250397138,-9223371955250397137,-9223371955250397136,-9223371955250397182,-9223371955250397155,-9223371955250397154,-9223371955250397153,-9223371955250397152,-9223371955250397151,-9223371955250397150,-9223371955250397149,-9223371955250397148,-9223371955250397147,-9223371899415822336,-9223371899415822335,-9223371899415822333,-9223371899415822332,-9223371899415822331,-9223371899415822330,-9223371899415822329,-9223371899415822328,-9223371895120855040,-9223371895120855039,-9223371895120855037,-9223371895120855036,-9223371895120855035,-9223371895120855034,-9223371895120855033,-9223371895120855032,-9223371895120855031,-9223371895120855030,-9223371890825887744,-9223371890825887743,-9223371890825887741,-9223371890825887740,-9223371890825887739,-9223371890825887738,-9223371890825887737,-9223371890825887736,-9223371890825887735,-9223371890825887734,-9223371890825887733,-9223371890825887732,-9223371890825887724,-9223371358249943040,-9223371358249943039,-9223371358249943038,-9223371358249943037,-9223371358249943036,-9223371358249943035,-9223371358249943034,-9223371358249943033,-9223371358249943032,-9223371358249943031,-9223371358249943030,-9223371358249943029,-9223371358249943028,-9223371358249943027,-9223371358249943026,-9223371358249943024,-9223371358249943025,-9223371358249943000,-9223371856466149365,-9223371856466149364,-9223371856466149360,-9223371856466149359,-9223371856466149344,-9223371856466149343,-9223371856466149342,-9223371856466149341,-9223371856466149340,-9223371856466149339,-9223371856466149338,-9223371856466149337,-9223371856466149336,-9223371856466149335,-9223371856466149334,-9223371856466149358,-9223371856466149357,-9223371856466149331,-9223371856466149376,-9223371856466149356,-9223371856466149374,-9223371856466149373,-9223371856466149372,-9223371856466149371,-9223371856466149347,-9223371856466149370,-9223371856466149369,-9223371856466149368,-9223371856466149367,-9223371856466149329,-9223371856466149345,-9223371856466149330,-9223371856466149375,-9223371856466149366,-9223371856466149361,-9223371856466149362,-9223371856466149363,-9223371856466149346,-9223371856466149288,-9223370907278376960,-9223370907278376959,-9223370907278376958,-9223370907278376948,-9223370907278376957,-9223370907278376956,-9223370907278376955,-9223370907278376954,-9223370907278376953,-9223370907278376952,-9223370907278376951,-9223370907278376950,-9223370907278376949,-9223371976725233664,-9223371976725233663,-9223371976725233659,-9223371976725233657,-9223371976725233655,-9223371976725233654,-9223371976725233653,-9223371976725233652,-9223371976725233651,-9223371976725233650,-9223371976725233649,-9223371976725233648,-9223371976725233647,-9223371976725233646,-9223371976725233599,-9223371976725233600,-9223371976725233597,-9223371976725233598,-9223371976725233595,-9223371976725233596,-9223371976725233593,-9223371976725233594,-9223371976725233591,-9223371976725233592,-9223371976725233589,-9223371976725233590,-9223371976725233587,-9223371976725233588,-9223371976725233585,-9223371976725233586,-9223371976725233583,-9223371976725233584,-9223371976725233581,-9223371976725233582,-9223371976725233579,-9223371976725233580,-9223371976725233577,-9223371976725233578,-9223371976725233575,-9223371976725233576,-9223371976725233573,-9223371976725233574,-9223371976725233571,-9223371976725233572,-9223371976725233569,-9223371976725233570,-9223371976725233567,-9223371976725233568,-9223371976725233565,-9223371976725233566,-9223371976725233563,-9223371976725233564,-9223371976725233561,-9223371976725233562,-9223371976725233559,-9223371976725233560,-9223371976725233557,-9223371976725233558,-9223371976725233555,-9223371976725233556,-9223371976725233553,-9223371976725233554,-9223371976725233551,-9223371976725233552,-9223371976725233549,-9223371976725233550,-9223371976725233547,-9223371976725233548,-9223371976725233545,-9223371976725233546,-9223371976725233543,-9223371976725233544,-9223371976725233541,-9223371976725233542,-9223371976725233539,-9223371976725233540,-9223371976725233537,-9223371976725233538,-9223371976725233535,-9223371976725233536,-9223371976725233533,-9223371976725233534,-9223371976725233531,-9223371976725233532,-9223371976725233529,-9223371976725233530,-9223371976725233527,-9223371976725233528,-9223371976725233525,-9223371976725233526,-9223371976725233523,-9223371976725233524,-9223371976725233521,-9223371976725233522,-9223371976725233519,-9223371976725233520,-9223371976725233517,-9223371976725233518,-9223371976725233515,-9223371976725233516,-9223371976725233513,-9223371976725233514,-9223371976725233511,-9223371976725233512,-9223371976725233509,-9223371976725233510,-9223371976725233507,-9223371976725233508,-9223371976725233505,-9223371976725233506,-9223371976725233503,-9223371976725233504,-9223371976725233501,-9223371976725233502,-9223371976725233499,-9223371976725233500,-9223371976725233497,-9223371976725233498,-9223371976725233495,-9223371976725233496,-9223371976725233493,-9223371976725233494,-9223371976725233491,-9223371976725233492,-9223371976725233489,-9223371976725233490,-9223371976725233487,-9223371976725233488,-9223371976725233485,-9223371976725233486,-9223371976725233483,-9223371976725233484,-9223371976725233481,-9223371976725233482,-9223371976725233479,-9223371976725233480,-9223371976725233477,-9223371976725233478,-9223371976725233475,-9223371976725233476,-9223371976725233473,-9223371976725233474,-9223371976725233471,-9223371976725233472,-9223371976725233469,-9223371976725233470,-9223371976725233467,-9223371976725233468,-9223371976725233465,-9223371976725233466,-9223371976725233463,-9223371976725233464,-9223371976725233461,-9223371976725233462,-9223371976725233459,-9223371976725233460,-9223371976725233457,-9223371976725233458,-9223371976725233455,-9223371976725233456,-9223371976725233453,-9223371976725233454,-9223371976725233451,-9223371976725233452,-9223371976725233449,-9223371976725233450,-9223371976725233447,-9223371976725233448,-9223371976725233445,-9223371976725233446,-9223371976725233443,-9223371976725233444,-9223371976725233441,-9223371976725233442,-9223371976725233439,-9223371976725233440,-9223371976725233437,-9223371976725233438,-9223371976725233435,-9223371976725233436,-9223371976725233433,-9223371976725233434,-9223371976725233431,-9223371976725233432,-9223371976725233429,-9223371976725233430,-9223371976725233427,-9223371976725233428,-9223371976725233425,-9223371976725233426,-9223371976725233423,-9223371976725233424,-9223371976725233421,-9223371976725233422,-9223371976725233419,-9223371976725233420,-9223371976725233417,-9223371976725233418,-9223371976725233415,-9223371976725233416,-9223371976725233413,-9223371976725233414,-9223371976725233411,-9223371976725233412,-9223371976725233409,-9223371976725233410,-9223371976725233407,-9223371976725233408,-9223371976725233405,-9223371976725233406,-9223371976725233403,-9223371976725233404,-9223371976725233401,-9223371976725233402,-9223371976725233399,-9223371976725233400,-9223371976725233397,-9223371976725233398,-9223371976725233395,-9223371976725233396,-9223371976725233393,-9223371976725233394,-9223371976725233391,-9223371976725233392,-9223371976725233389,-9223371976725233390,-9223371976725233387,-9223371976725233388,-9223371976725233385,-9223371976725233386,-9223371976725233383,-9223371976725233384,-9223371976725233381,-9223371976725233382,-9223371976725233379,-9223371976725233380,-9223371976725233377,-9223371976725233378,-9223371976725233375,-9223371976725233376,-9223371976725233373,-9223371976725233374,-9223371976725233371,-9223371976725233372,-9223371976725233369,-9223371976725233370,-9223371976725233367,-9223371976725233368,-9223371976725233365,-9223371976725233366,-9223371976725233363,-9223371976725233364,-9223371976725233361,-9223371976725233362,-9223371976725233359,-9223371976725233360,-9223371976725233357,-9223371976725233358,-9223371976725233355,-9223371976725233356,-9223371976725233353,-9223371976725233354,-9223371976725233351,-9223371976725233352,-9223371976725233349,-9223371976725233350,-9223371976725233347,-9223371976725233348,-9223371976725233345,-9223371976725233346,-9223372015379939328,-9223372015379939327,-9223372015379939326,-9223372015379939325,-9223372015379939324,-9223372015379939322,-9223372015379939307,-9223372015379939320,-9223372015379939319,-9223372015379939318,-9223372015379939317,-9223372015379939316,-9223372015379939313,-9223372015379939312,-9223372015379939311,-9223372015379939310,-9223372015379939309,-9223372015379939308,-9223372015379939278,-9223372015379939277,-9223372015379939276,-9223372015379939275,-9223372015379939274,-9223372015379939273,-9223372015379939272,-9223372015379939271,-9223372015379939270,-9223372015379939269,-9223372015379939268,-9223372015379939305,-9223372015379939267,-9223372015379939266,-9223372015379939265,-9223372015379939264,-9223372015379939306,-9223371998200070144,-9223371998200070143,-9223371998200070142,-9223371998200070141,-9223371998200070140,-9223371998200070138,-9223371998200070124,-9223371998200070136,-9223371998200070135,-9223371998200070134,-9223371998200070133,-9223371998200070132,-9223371998200070130,-9223371998200070129,-9223371998200070128,-9223371998200070127,-9223371998200070126,-9223371998200070125,-9223371998200070094,-9223371998200070093,-9223371998200070092,-9223371998200070091,-9223371998200070090,-9223371998200070089,-9223371998200070088,-9223371998200070087,-9223371998200070086,-9223371998200070085,-9223371998200070084,-9223371998200070123,-9223371998200070083,-9223371998200070082,-9223371998200070081,-9223371998200070080,-9223371998200070122,-9223372002495037440,-9223372002495037439,-9223372002495037428,-9223372002495037438,-9223372002495037437,-9223372002495037436,-9223372002495037435,-9223372002495037433,-9223372002495037434,-9223372002495037402,-9223372002495037432,-9223372002495037431,-9223372002495037426,-9223372002495037425,-9223372002495037427,-9223372002495037424,-9223372002495037423,-9223372002495037422,-9223372002495037420,-9223372002495037419,-9223372002495037417,-9223372002495037418,-9223372002495037410,-9223372002495037411,-9223372002495037408,-9223372002495037409,-9223372002495037404,-9223372002495037403,-9223372002495037416,-9223372002495037415,-9223372002495037414,-9223372002495037413,-9223372002495037412,-9223372002495037401,-9223372002495037390,-9223372002495037389,-9223372002495037388,-9223372002495037387,-9223372002495037386,-9223372002495037385,-9223372002495037384,-9223372002495037383,-9223372002495037382,-9223372002495037381,-9223372002495037380,-9223372002495037400,-9223372002495037379,-9223372002495037378,-9223372002495037377,-9223372002495037370,-9223372002495037421,-9223372002495037369,-9223372002495037430,-9223372002495037429,-9223372002495037407,-9223372002495037406,-9223372011084972032,-9223372011084972031,-9223372011084972030,-9223372011084972029,-9223372011084972028,-9223372011084972027,-9223372011084972026,-9223372011084972025,-9223372011084972024,-9223372011084972023,-9223372011084972022,-9223372011084972021,-9223372011084972020,-9223372011084972015,-9223372011084972014,-9223372011084972013,-9223372011084972012,-9223372011084972011,-9223372011084972009,-9223372011084971966,-9223372011084971965,-9223372011084972010,-9223372006790004736,-9223372006790004735,-9223372006790004734,-9223372006790004733,-9223372006790004715,-9223372006790004732,-9223372006790004731,-9223372006790004730,-9223372006790004729,-9223372006790004728,-9223372006790004727,-9223372006790004719,-9223372006790004718,-9223372006790004717,-9223372006790004716,-9223372006790004670,-9223372006790004669,-9223372006790004714,-9223371993905102848,-9223371993905102847,-9223371993905102843,-9223371993905102846,-9223371993905102842,-9223371993905102845,-9223371993905102844,-9223370890098507776,-9223370890098507775,-9223370890098507774,-9223370890098507773,-9223370890098507772,-9223370890098507771,-9223370890098507770,-9223370890098507769,-9223370890098507768,-9223370890098507767,-9223370890098507766,-9223370890098507765,-9223370890098507764,-9223370890098507763,-9223370890098507762,-9223370890098507761,-9223370890098507760,-9223370890098507759,-9223370890098507758,-9223370890098507757,-9223370890098507756,-9223370890098507755,-9223370890098507754,-9223370890098507753,-9223370890098507752,-9223370890098507751,-9223370890098507750,-9223370890098507749,-9223370890098507748,-9223370890098507747,-9223370890098507746,-9223370877213605888,-9223370877213605887,-9223370877213605886,-9223370877213605885,-9223370877213605884,-9223370877213605883,-9223370877213605882,-9223370877213605881,-9223370877213605880,-9223370877213605872,-9223370877213605879,-9223370877213605878,-9223370877213605877,-9223370877213605876,-9223370877213605875,-9223370877213605874,-9223370877213605873,-9223370877213605871,-9223370902983409664,-9223370902983409663,-9223370902983409661,-9223370902983409660,-9223370902983409659,-9223370902983409658,-9223370902983409657,-9223370902983409655,-9223370902983409656,-9223370902983409646,-9223370902983409645,-9223370902983409644,-9223370902983409643,-9223370902983409642,-9223370902983409641,-9223370902983409640,-9223370902983409662,-9223370902983409654,-9223370902983409653,-9223370902983409652,-9223370902983409651,-9223370902983409650,-9223370902983409649,-9223370902983409648,-9223370902983409647,-9223370881508573184,-9223370881508573182,-9223370881508573183,-9223370881508573171,-9223370881508573172,-9223370881508573181,-9223370881508573178,-9223370881508573177,-9223370881508573179,-9223370881508573180,-9223370881508573175,-9223370881508573174,-9223370881508573173,-9223370881508573176,-9223370881508573169,-9223370881508573170,-9223370881508573168,-9223370881508573167,-9223370881508573166,-9223370881508573165,-9223370881508573164,-9223370881508573162,-9223370881508573163,-9223370885803540480,-9223370885803540478,-9223370885803540479,-9223370885803540476,-9223370885803540477,-9223370885803540475,-9223370885803540473,-9223370885803540474,-9223370885803540471,-9223370885803540472,-9223370885803540470,-9223370885803540415,-9223370885803540416,-9223370885803540413,-9223370885803540414,-9223370885803540411,-9223370885803540412,-9223370885803540409,-9223370885803540410,-9223370885803540407,-9223370885803540408,-9223370885803540405,-9223370885803540406,-9223370885803540403,-9223370885803540404,-9223370885803540401,-9223370885803540402,-9223370885803540399,-9223370885803540400,-9223370885803540397,-9223370885803540398,-9223370885803540395,-9223370885803540396,-9223370885803540393,-9223370885803540394,-9223370885803540391,-9223370885803540392,-9223370885803540389,-9223370885803540390,-9223370885803540387,-9223370885803540388,-9223370885803540385,-9223370885803540386,-9223370885803540383,-9223370885803540384,-9223370885803540381,-9223370885803540382,-9223370885803540379,-9223370885803540380,-9223370885803540377,-9223370885803540378,-9223370885803540375,-9223370885803540376,-9223370885803540373,-9223370885803540374,-9223370885803540371,-9223370885803540372,-9223370885803540369,-9223370885803540370,-9223370885803540367,-9223370885803540368,-9223370885803540365,-9223370885803540366,-9223370885803540363,-9223370885803540364,-9223370885803540361,-9223370885803540362,-9223370885803540359,-9223370885803540360,-9223370885803540357,-9223370885803540358,-9223370885803540355,-9223370885803540356,-9223370885803540353,-9223370885803540354,-9223370885803540351,-9223370885803540352,-9223370885803540349,-9223370885803540350,-9223370885803540347,-9223370885803540348,-9223370885803540345,-9223370885803540346,-9223370885803540343,-9223370885803540344,-9223370885803540341,-9223370885803540342,-9223370885803540339,-9223370885803540340,-9223370885803540337,-9223370885803540338,-9223370885803540335,-9223370885803540336,-9223370885803540333,-9223370885803540334,-9223370885803540331,-9223370885803540332,-9223370885803540329,-9223370885803540330,-9223370885803540327,-9223370885803540328,-9223370885803540325,-9223370885803540326,-9223370885803540323,-9223370885803540324,-9223370885803540321,-9223370885803540322,-9223370885803540319,-9223370885803540320,-9223370885803540317,-9223370885803540318,-9223370885803540315,-9223370885803540316,-9223370885803540313,-9223370885803540314,-9223370885803540311,-9223370885803540312,-9223370885803540309,-9223370885803540310,-9223370885803540307,-9223370885803540308,-9223370885803540305,-9223370885803540306,-9223370885803540303,-9223370885803540304,-9223370885803540301,-9223370885803540302,-9223370885803540299,-9223370885803540300,-9223370885803540297,-9223370885803540298,-9223370885803540295,-9223370885803540296,-9223370885803540293,-9223370885803540294,-9223370885803540291,-9223370885803540292,-9223370885803540289,-9223370885803540290,-9223370885803540287,-9223370885803540288,-9223370885803540285,-9223370885803540286,-9223370885803540283,-9223370885803540284,-9223370885803540281,-9223370885803540282,-9223370885803540279,-9223370885803540280,-9223370885803540277,-9223370885803540278,-9223370885803540275,-9223370885803540276,-9223370885803540273,-9223370885803540274,-9223370885803540271,-9223370885803540272,-9223370885803540269,-9223370885803540270,-9223370885803540267,-9223370885803540268,-9223370885803540265,-9223370885803540266,-9223370885803540263,-9223370885803540264,-9223370885803540261,-9223370885803540262,-9223370885803540259,-9223370885803540260,-9223370885803540257,-9223370885803540258,-9223370885803540255,-9223370885803540256,-9223370885803540253,-9223370885803540254,-9223370885803540251,-9223370885803540252,-9223370885803540249,-9223370885803540250,-9223370885803540247,-9223370885803540248,-9223370885803540245,-9223370885803540246,-9223370885803540243,-9223370885803540244,-9223370885803540241,-9223370885803540242,-9223370885803540239,-9223370885803540240,-9223370885803540237,-9223370885803540238,-9223370885803540235,-9223370885803540236,-9223370885803540233,-9223370885803540234,-9223370885803540231,-9223370885803540232,-9223370885803540229,-9223370885803540230,-9223370885803540227,-9223370885803540228,-9223370885803540225,-9223370885803540226,-9223370885803540223,-9223370885803540224,-9223370885803540221,-9223370885803540222,-9223370885803540219,-9223370885803540220,-9223370885803540217,-9223370885803540218,-9223370885803540215,-9223370885803540216,-9223370885803540213,-9223370885803540214,-9223370885803540211,-9223370885803540212,-9223370885803540209,-9223370885803540210,-9223370885803540207,-9223370885803540208,-9223370885803540205,-9223370885803540206,-9223370885803540203,-9223370885803540204,-9223370885803540201,-9223370885803540202,-9223370885803540199,-9223370885803540200,-9223370885803540197,-9223370885803540198,-9223370885803540195,-9223370885803540196,-9223370885803540193,-9223370885803540194,-9223370885803540191,-9223370885803540192,-9223370885803540189,-9223370885803540190,-9223370885803540187,-9223370885803540188,-9223370885803540185,-9223370885803540186,-9223370885803540183,-9223370885803540184,-9223370885803540181,-9223370885803540182,-9223370885803540179,-9223370885803540180,-9223370885803540177,-9223370885803540178,-9223370885803540175,-9223370885803540176,-9223370885803540173,-9223370885803540174,-9223370885803540171,-9223370885803540172,-9223370885803540169,-9223370885803540170,-9223370885803540167,-9223370885803540168,-9223370885803540165,-9223370885803540166,-9223370885803540163,-9223370885803540164,-9223370885803540161,-9223370885803540162,-9223370851443802112,-9223370851443802111,-9223370851443802110,-9223370851443802109,-9223370851443802108,-9223370851443802107,-9223370851443802106,-9223370851443802105,-9223370851443802104,-9223370851443802103,-9223370851443802102,-9223370851443802101,-9223370898688442368,-9223370898688442366,-9223370898688442367,-9223370898688442364,-9223370898688442365,-9223370898688442363,-9223370898688442340,-9223370898688442362,-9223370898688442360,-9223370898688442361,-9223370898688442359,-9223370898688442358,-9223370898688442357,-9223370898688442356,-9223370898688442355,-9223370898688442354,-9223370898688442353,-9223370898688442352,-9223370898688442351,-9223370898688442350,-9223370898688442349,-9223370898688442348,-9223370898688442347,-9223370898688442346,-9223370898688442345,-9223370898688442344,-9223370898688442343,-9223370898688442342,-9223370898688442341,-9223370872918638592,-9223370872918638591,-9223370872918638590,-9223370872918638589,-9223370872918638588,-9223370872918638587,-9223370872918638586,-9223370872918638585,-9223370872918638584,-9223370842853867520,-9223370842853867519,-9223370842853867516,-9223370842853867515,-9223370842853867514,-9223370842853867513,-9223370842853867517,-9223370842853867498,-9223370842853867497,-9223370842853867496,-9223370842853867495,-9223370842853867494,-9223370842853867493,-9223370842853867492,-9223370842853867491,-9223370838558900224,-9223370838558900223,-9223370838558900220,-9223370838558900219,-9223370838558900221,-9223370838558900217,-9223370838558900218,-9223370838558900216,-9223370834263932928,-9223370834263932927,-9223370834263932924,-9223370834263932923,-9223370834263932925,-9223370834263932921,-9223370834263932922,-9223370834263932919,-9223370834263932920,-9223370834263932918,-9223370834263932917,-9223371332480139264,-9223371332480139263,-9223371332480139260,-9223371332480139259,-9223371332480139258,-9223371332480139249,-9223371332480139262,-9223371332480139257,-9223371332480139256,-9223371332480139255,-9223371332480139254,-9223371332480139253,-9223371332480139252,-9223371332480139251,-9223371332480139250,-9223371929480593408,-9223371929480593407,-9223371929480593404,-9223371929480593403,-9223371929480593402,-9223371929480593401,-9223371929480593398,-9223371929480593397,-9223371929480593396,-9223371929480593395,-9223371929480593394,-9223371929480593393,-9223371929480593392,-9223371929480593391,-9223371929480593390,-9223371929480593389,-9223371929480593388,-9223371929480593387,-9223371929480593377,-9223371929480593405,-9223371929480593386,-9223371929480593385,-9223371929480593384,-9223371929480593383,-9223371929480593382,-9223371929480593381,-9223371929480593380,-9223371929480593379,-9223371929480593378,-9223371384019746816,-9223371384019746814,-9223371384019746812,-9223371384019746803,-9223371384019746802,-9223371384019746813,-9223371384019746800,-9223371384019746801,-9223371384019746811,-9223371384019746810,-9223371384019746809,-9223371384019746808,-9223371384019746807,-9223371384019746806,-9223371384019746805,-9223371384019746804,-9223371379724779520,-9223371379724779519,-9223371379724779517,-9223371379724779516,-9223371379724779514,-9223371379724779513,-9223371379724779512,-9223371379724779511,-9223371379724779510,-9223371379724779509,-9223371379724779508,-9223371375429812224,-9223371375429812204,-9223371375429812203,-9223371375429812221,-9223371375429812206,-9223371375429812220,-9223371375429812215,-9223371375429812219,-9223371375429812214,-9223371375429812218,-9223371375429812217,-9223371375429812213,-9223371375429812200,-9223371375429812202,-9223371375429812211,-9223371375429812210,-9223371375429812208,-9223371375429812207,-9223371375429812201,-9223371723322163200,-9223371723322163199,-9223371723322163198,-9223371723322163197,-9223371723322163196,-9223371723322163195,-9223371723322163194,-9223371723322163193,-9223371723322163192,-9223371723322163191,-9223371723322163190,-9223371723322163179,-9223371723322163178,-9223371723322163189,-9223371723322163188,-9223371723322163187,-9223371723322163186,-9223371723322163185,-9223371723322163184,-9223371723322163183,-9223371723322163182,-9223371723322163181,-9223371723322163180,-9223371723322163177,-9223371723322163176,-9223371723322163175,-9223371723322163173,-9223371723322163172,-9223371723322163171,-9223371723322163168,-9223371723322163169,-9223371877940985856,-9223371877940985854,-9223371877940985853,-9223371877940985852,-9223371877940985851,-9223371877940985842,-9223371877940985841,-9223371877940985840,-9223371877940985839,-9223371877940985838,-9223371877940985806,-9223371877940985855,-9223371877940985850,-9223371877940985849,-9223371877940985848,-9223371877940985847,-9223371877940985846,-9223371877940985845,-9223371877940985844,-9223371877940985843,-9223371877940985776,-9223371912300724224,-9223371912300724223,-9223371912300724215,-9223371912300724214,-9223371912300724197,-9223371912300724196,-9223371912300724221,-9223371912300724220,-9223371912300724219,-9223371912300724218,-9223371912300724222,-9223371912300724213,-9223371912300724212,-9223371912300724211,-9223371912300724210,-9223371912300724209,-9223371912300724208,-9223371912300724207,-9223371912300724206,-9223370894393475045,-9223370894393475072,-9223370894393475071,-9223370894393475070,-9223371852171182080,-9223371852171182079,-9223371852171182078,-9223371852171182077,-9223371852171182076,-9223371852171182075,-9223371362544910336,-9223371362544910335,-9223371362544910334,-9223371362544910333,-9223371362544910332,-9223371362544910331,-9223371362544910330,-9223371362544910329,-9223371362544910328,-9223371362544910327,-9223371336775106560,-9223371336775106559,-9223371336775106558,-9223371336775106554,-9223371336775106516,-9223371336775106509,-9223371336775106552,-9223371336775106553,-9223371336775106551,-9223371336775106550,-9223371336775106519,-9223371336775106549,-9223371336775106547,-9223371336775106546,-9223371336775106545,-9223371336775106455,-9223371336775106544,-9223371336775106543,-9223371336775106542,-9223371336775106541,-9223371336775106540,-9223371336775106539,-9223371336775106538,-9223371336775106537,-9223371336775106536,-9223371336775106535,-9223371336775106533,-9223371336775106532,-9223371336775106531,-9223371336775106469,-9223371336775106466,-9223371336775106468,-9223371336775106470,-9223371336775106518,-9223371336775106515,-9223371336775106467,-9223371336775106514,-9223371336775106513,-9223371336775106512,-9223371336775106511,-9223371336775106510,-9223371336775106508,-9223371336775106507,-9223371336775106503,-9223371336775106502,-9223371336775106464,-9223371336775106463,-9223371336775106462,-9223371336775106461,-9223371336775106460,-9223371336775106459,-9223371336775106458,-9223371336775106457,-9223371336775106456,-9223371336775106506,-9223371336775106556,-9223371336775106530,-9223371336775106529,-9223371336775106528,-9223371336775106527,-9223371336775106526,-9223371336775106525,-9223371336775106524,-9223371336775106523,-9223370911573344235,-9223370911573344242,-9223370911573344256,-9223370911573344236,-9223370911573344255,-9223370911573344253,-9223370911573344252,-9223370911573344251,-9223370911573344254,-9223370911573344250,-9223370911573344249,-9223370911573344248,-9223370911573344247,-9223370911573344246,-9223370911573344245,-9223370911573344244,-9223370911573344243,-9223371164976414720,-9223371164976414716,-9223371164976414717,-9223371164976414718,-9223371164976414719,-9223371190746218496,-9223371190746218494,-9223371190746218476,-9223371190746218475,-9223371190746218481,-9223371190746218480,-9223371190746218485,-9223371190746218478,-9223371190746218484,-9223371190746218483,-9223371190746218482,-9223371190746218479,-9223371190746218477,-9223371190746218495,-9223371190746218493,-9223371190746218492,-9223371190746218491,-9223371190746218490,-9223371190746218489,-9223371190746218488,-9223371190746218487,-9223371190746218486,-9223371160681447424,-9223371160681447422,-9223371160681447423,-9223371160681447420,-9223371160681447421,-9223371173566349312,-9223371173566349311,-9223371173566349292,-9223371173566349310,-9223371173566349308,-9223371173566349309,-9223371173566349307,-9223371173566349306,-9223371173566349300,-9223371173566349305,-9223371173566349304,-9223371173566349303,-9223371173566349302,-9223371173566349301,-9223371173566349299,-9223371169271382016,-9223371169271382015,-9223371169271382011,-9223371169271382014,-9223371169271382009,-9223371169271382013,-9223371169271382012,-9223371169271382006,-9223371169271382010,-9223371169271381996,-9223371169271381995,-9223371169271381994,-9223371169271381993,-9223371169271381992,-9223371169271381991,-9223371169271381990,-9223371169271381989,-9223371169271381988,-9223371169271382008,-9223371169271382007,-9223371177861316608,-9223371177861316604,-9223371177861316605,-9223371177861316606,-9223371177861316607,-9223371186451251200,-9223371186451251197,-9223371186451251199,-9223371186451251198,-9223371186451251196,-9223371186451251195,-9223371186451251194,-9223371182156283904,-9223371182156283900,-9223371182156283901,-9223371182156283902,-9223371182156283903,-9223370954523017216,-9223370954523017215,-9223370954523017214,-9223370954523017213,-9223370954523017212,-9223370954523017211,-9223370954523017210,-9223370954523017209,-9223370954523017208,-9223370954523017207,-9223370954523017206,-9223370954523017205,-9223370954523017204,-9223370868623671296,-9223370868623671295,-9223370868623671283,-9223370868623671282,-9223370868623671292,-9223370868623671291,-9223370868623671290,-9223370868623671289,-9223370868623671288,-9223370868623671287,-9223370868623671286,-9223370868623671285,-9223370868623671284,-9223370864328704000,-9223370864328703999,-9223370864328703986,-9223370864328703987,-9223370864328703997,-9223370864328703998,-9223370864328703985,-9223370864328703984,-9223370864328703983,-9223370864328703982,-9223370864328703981,-9223370864328703980,-9223370864328703996,-9223370864328703995,-9223370864328703994,-9223370864328703993,-9223370864328703992,-9223370864328703991,-9223370864328703990,-9223370864328703989,-9223370864328703988,-9223371933775560704,-9223371933775560703,-9223371933775560699,-9223371933775560702,-9223371933775560701,-9223371933775560700,-9223371766271836160,-9223371766271836159,-9223371766271836158,-9223371766271836157,-9223371766271836156,-9223371770566803456,-9223371770566803454,-9223371770566803455,-9223371770566803452,-9223371770566803453,-9223371770566803450,-9223371770566803451,-9223371770566803449,-9223371787746672640,-9223371787746672637,-9223371787746672639,-9223371787746672638,-9223371787746672636,-9223371787746672635,-9223371787746672634,-9223371787746672628,-9223371787746672627,-9223371787746672629,-9223371787746672633,-9223371787746672632,-9223371787746672631,-9223371787746672630,-9223371774861770752,-9223371774861770751,-9223371774861770730,-9223371774861770750,-9223371774861770749,-9223371774861770747,-9223371774861770748,-9223371774861770746,-9223371774861770736,-9223371774861770744,-9223371774861770745,-9223371774861770743,-9223371774861770742,-9223371774861770740,-9223371774861770741,-9223371774861770739,-9223371774861770737,-9223371774861770738,-9223371774861770732,-9223371813516476416,-9223371813516476415,-9223371813516476414,-9223371813516476413,-9223371813516476412,-9223371813516476411,-9223371813516476410,-9223371813516476409,-9223371813516476407,-9223371813516476406,-9223371813516476405,-9223371813516476404,-9223371813516476385,-9223371813516476408,-9223371813516476403,-9223371813516476402,-9223371813516476401,-9223371813516476400,-9223371813516476399,-9223371813516476398,-9223371813516476397,-9223371813516476396,-9223371804926541824,-9223371804926541823,-9223371804926541822,-9223371804926541821,-9223371804926541820,-9223371804926541819,-9223371804926541818,-9223371804926541817,-9223371804926541816,-9223371804926541815,-9223371804926541814,-9223371804926541813,-9223371804926541812,-9223371804926541811,-9223371800631574528,-9223371800631574527,-9223371800631574520,-9223371800631574526,-9223371800631574525,-9223371800631574524,-9223371800631574523,-9223371800631574521,-9223371800631574519,-9223371800631574522,-9223371800631574518,-9223371800631574517,-9223371800631574516,-9223371800631574515,-9223371800631574514,-9223371800631574513,-9223371800631574512,-9223371800631574511,-9223371796336607232,-9223371796336607231,-9223371796336607230,-9223371796336607229,-9223371796336607228,-9223371796336607227,-9223371796336607226,-9223371796336607225,-9223371796336607224,-9223371796336607223,-9223371796336607222,-9223371796336607221,-9223371796336607220,-9223371796336607219,-9223371796336607218,-9223371796336607217,-9223371796336607216,-9223371809221509120,-9223371809221509119,-9223371809221509118,-9223371809221509117,-9223371809221509113,-9223371809221509112,-9223371809221509116,-9223371809221509111,-9223371809221509110,-9223371809221509109,-9223371809221509108,-9223371809221509107,-9223371809221509106,-9223371809221509105,-9223371809221509104,-9223371727617130496,-9223371727617130495,-9223371727617130494,-9223371727617130493,-9223371727617130480,-9223371727617130464,-9223371349660008448,-9223371349660008444,-9223371349660008443,-9223371349660008445,-9223371349660008441,-9223371349660008446,-9223371349660008440,-9223371349660008447,-9223371349660008442,-9223371349660008439,-9223371349660008438,-9223371349660008437,-9223371345365041152,-9223371345365041151,-9223371345365041150,-9223371345365041146,-9223371345365041147,-9223371345365041144,-9223371345365041145,-9223371345365041142,-9223371345365041143,-9223371345365041149,-9223371345365041148,-9223371345365041051,-9223371345365041052,-9223371345365041049,-9223371345365041050,-9223371345365041047,-9223371345365041048,-9223371345365041045,-9223371345365041046,-9223371345365041043,-9223371345365041044,-9223371345365041041,-9223371345365041042,-9223371345365041039,-9223371345365041040,-9223371345365041037,-9223371345365041038,-9223371345365041035,-9223371345365041036,-9223371345365041033,-9223371345365041034,-9223371345365041031,-9223371345365041032,-9223371345365041029,-9223371345365041030,-9223371345365041027,-9223371345365041028,-9223371345365041025,-9223371345365041026,-9223371345365041023,-9223371345365041024,-9223371345365041021,-9223371345365041022,-9223371345365041019,-9223371345365041020,-9223371345365041017,-9223371345365041018,-9223371345365041015,-9223371345365041016,-9223371345365041013,-9223371345365041014,-9223371345365041011,-9223371345365041012,-9223371345365041009,-9223371345365041010,-9223371345365041007,-9223371345365041008,-9223371345365041005,-9223371345365041006,-9223371345365041003,-9223371345365041004,-9223371345365041001,-9223371345365041002,-9223371345365040999,-9223371345365041000,-9223371345365040997,-9223371345365040998,-9223371345365040995,-9223371345365040996,-9223371345365040993,-9223371345365040994,-9223371345365040991,-9223371345365040992,-9223371345365040989,-9223371345365040990,-9223371345365040987,-9223371345365040988,-9223371345365040985,-9223371345365040986,-9223371345365040983,-9223371345365040984,-9223371345365040981,-9223371345365040982,-9223371345365040979,-9223371345365040980,-9223371345365040977,-9223371345365040978,-9223371345365040975,-9223371345365040976,-9223371345365040973,-9223371345365040974,-9223371345365040971,-9223371345365040972,-9223371345365040969,-9223371345365040970,-9223371345365040967,-9223371345365040968,-9223371345365040965,-9223371345365040966,-9223371345365040963,-9223371345365040964,-9223371345365040961,-9223371345365040962,-9223371345365040959,-9223371345365040960,-9223371345365040957,-9223371345365040958,-9223371345365040955,-9223371345365040956,-9223371345365040953,-9223371345365040954,-9223371345365040951,-9223371345365040952,-9223371345365040949,-9223371345365040950,-9223371345365040947,-9223371345365040948,-9223371345365040945,-9223371345365040946,-9223371345365040943,-9223371345365040944,-9223371345365040941,-9223371345365040942,-9223371345365040939,-9223371345365040940,-9223371345365040937,-9223371345365040938,-9223371345365040935,-9223371345365040936,-9223371345365040933,-9223371345365040934,-9223371345365040931,-9223371345365040932,-9223371345365040929,-9223371345365040930,-9223371345365040927,-9223371345365040928,-9223371345365040925,-9223371345365040926,-9223371345365040923,-9223371345365040924,-9223371345365040921,-9223371345365040922,-9223371345365040919,-9223371345365040920,-9223371345365040917,-9223371345365040918,-9223371345365040915,-9223371345365040916,-9223371345365040913,-9223371345365040914,-9223371345365040911,-9223371345365040912,-9223371345365040909,-9223371345365040910,-9223371345365040907,-9223371345365040908,-9223371345365040905,-9223371345365040906,-9223371345365040903,-9223371345365040904,-9223371345365040901,-9223371345365040902,-9223371345365040899,-9223371345365040900,-9223371345365040897,-9223371345365040898,-9223371345365040895,-9223371345365040896,-9223371345365040893,-9223371345365040894,-9223371345365040891,-9223371345365040892,-9223371345365040889,-9223371345365040890,-9223371345365040887,-9223371345365040888,-9223371345365040885,-9223371345365040886,-9223371345365040883,-9223371345365040884,-9223371345365040881,-9223371345365040882,-9223371345365040879,-9223371345365040880,-9223371345365040877,-9223371345365040878,-9223371345365040875,-9223371345365040876,-9223371345365040873,-9223371345365040874,-9223371345365040871,-9223371345365040872,-9223371345365040869,-9223371345365040870,-9223371345365040867,-9223371345365040868,-9223371345365040865,-9223371345365040866,-9223371345365040863,-9223371345365040864,-9223371345365040861,-9223371345365040862,-9223371345365040859,-9223371345365040860,-9223371345365040857,-9223371345365040858,-9223371345365040855,-9223371345365040856,-9223371345365040853,-9223371345365040854,-9223371345365040851,-9223371345365040852,-9223371345365040849,-9223371345365040850,-9223371345365040847,-9223371345365040848,-9223371345365040845,-9223371345365040846,-9223371345365040843,-9223371345365040844,-9223371345365040841,-9223371345365040842,-9223371345365040839,-9223371345365040840,-9223371345365040837,-9223371345365040838,-9223371345365040835,-9223371345365040836,-9223371345365040833,-9223371345365040834,-9223371345365040831,-9223371345365040832,-9223371345365040829,-9223371345365040830,-9223371345365040827,-9223371345365040828,-9223371345365040825,-9223371345365040826,-9223371345365040823,-9223371345365040824,-9223371345365040821,-9223371345365040822,-9223371345365040819,-9223371345365040820,-9223371345365040817,-9223371345365040818,-9223371345365040815,-9223371345365040816,-9223371345365040813,-9223371345365040814,-9223371345365040811,-9223371345365040812,-9223371345365040809,-9223371345365040810,-9223371345365040807,-9223371345365040808,-9223371345365040805,-9223371345365040806,-9223371345365040803,-9223371345365040804,-9223371345365040801,-9223371345365040802,-9223371345365040799,-9223371345365040800,-9223371345365040797,-9223371345365040798,-9223371353954975744,-9223371353954975743,-9223371353954975742,-9223371353954975741,-9223371353954975740,-9223371353954975739,-9223371353954975738,-9223371353954975737,-9223371353954975736,-9223371353954975735,-9223371353954975734,-9223371353954975733,-9223371371134844928,-9223371371134844927,-9223371371134844926,-9223371371134844924,-9223371371134844922,-9223371371134844921,-9223371371134844919,-9223371371134844918,-9223371371134844917,-9223371371134844916,-9223371371134844915,-9223371371134844914,-9223371371134844913,-9223371371134844912,-9223371371134844910,-9223371371134844911,-9223371371134844909,-9223371371134844908,-9223371371134844925,-9223371371134844923,-9223371371134844907,-9223371371134844906,-9223371371134844905,-9223371371134844904,-9223371371134844903,-9223371371134844902,-9223371371134844901,-9223371371134844900,-9223371371134844920,-9223371371134844899,-9223371371134844898,-9223371371134844897,-9223371371134844896,-9223371371134844895,-9223371371134844894,-9223371371134844893,-9223371371134844892,-9223371792041639936,-9223371792041639935,-9223371792041639926,-9223371869351051264,-9223371869351051263,-9223371869351051262,-9223371869351051261,-9223371869351051260,-9223371869351051258,-9223371869351051253,-9223371869351051252,-9223371869351051250,-9223371869351051249,-9223371869351051259,-9223371869351051251,-9223371869351051257,-9223371860761116672,-9223371860761116671,-9223371860761116670,-9223371860761116669,-9223371860761116668,-9223371860761116667,-9223371860761116659,-9223371860761116658,-9223371860761116654,-9223371860761116665,-9223371860761116664,-9223371860761116663,-9223371860761116662,-9223371860761116657,-9223371860761116656,-9223371860761116661,-9223371860761116660,-9223371860761116655,-9223371860761116666,-9223371860761116653,-9223371860761116652,-9223371860761116651,-9223371860761116650,-9223371860761116649,-9223371860761116648,-9223371860761116647,-9223371860761116646,-9223371826401378304,-9223371826401378303,-9223371826401378302,-9223371826401378301,-9223371826401378300,-9223371826401378299,-9223371826401378298,-9223371826401378297,-9223371826401378296,-9223371826401378295,-9223371826401378294,-9223371826401378293,-9223371822106411008,-9223371822106411007,-9223371822106411006,-9223371822106411005,-9223371822106411004,-9223371822106411003,-9223371822106411002,-9223371822106411000,-9223371822106411001,-9223371822106410999,-9223371822106410998,-9223371822106410997,-9223371822106410996,-9223371822106410995,-9223371822106410994,-9223371822106410993,-9223371822106410992,-9223371817811443712,-9223371817811443711,-9223371817811443710,-9223371817811443709,-9223371817811443708,-9223371817811443707,-9223371817811443706,-9223371783451705344,-9223371783451705341,-9223371783451705340,-9223371783451705339,-9223371783451705334,-9223371783451705333,-9223371783451705336,-9223371783451705335,-9223371783451705332,-9223371783451705337,-9223371779156738048,-9223371779156738045,-9223371779156738047,-9223371779156738036,-9223371779156738034,-9223371779156738032,-9223371779156738046,-9223371779156738035,-9223371779156738033,-9223371779156738031,-9223371779156738041,-9223371779156738043,-9223371779156738042,-9223371779156738040,-9223371779156738039,-9223371779156738029,-9223371779156738028,-9223371779156738030,-9223371779156738027,-9223371779156738026,-9223371779156738025,-9223371779156738024,-9223371779156738023,-9223371779156738022,-9223371779156738021,-9223371779156738020,-9223371779156738038,-9223371779156738019,-9223371779156738018,-9223371779156738017,-9223371779156738016,-9223371779156738015,-9223371779156738014,-9223371779156738013,-9223371779156738012,-9223371779156738037,-9223371779156738011,-9223371779156738010,-9223371779156738009,-9223371779156738008,-9223371779156738007,-9223371779156738006,-9223371779156738005,-9223371779156738004,-9223371749091966976,-9223371749091966975,-9223371749091966974,-9223371749091966973,-9223371749091966972,-9223371749091966962,-9223371749091966953,-9223371749091966952,-9223371749091966951,-9223371749091966971,-9223371749091966961,-9223371749091966960,-9223371749091966959,-9223371749091966958,-9223371749091966957,-9223371749091966956,-9223371749091966955,-9223371749091966954,-9223371749091966912,-9223371749091966911,-9223371749091966910,-9223371749091966909,-9223371749091966908,-9223371749091966907,-9223371749091966906,-9223371749091966905,-9223371749091966904,-9223371749091966903,-9223371749091966902,-9223371749091966901,-9223371749091966900,-9223371749091966899,-9223371749091966898,-9223371749091966897,-9223371749091966896,-9223371749091966895,-9223371749091966894,-9223371749091966893,-9223371749091966892,-9223371749091966891,-9223371749091966890,-9223371749091966889,-9223371749091966888,-9223371749091966887,-9223371749091966886,-9223371749091966885,-9223371749091966884,-9223371749091966883,-9223371749091966882,-9223371749091966881,-9223371749091966880,-9223371749091966879,-9223371749091966878,-9223371749091966877,-9223371749091966876,-9223371749091966875,-9223371749091966874,-9223371749091966873,-9223371749091966872,-9223371749091966871,-9223371749091966870,-9223371749091966869,-9223371749091966868,-9223371749091966867,-9223371749091966866,-9223371749091966865,-9223371749091966864,-9223371749091966863,-9223371749091966862,-9223371749091966861,-9223371749091966860,-9223371749091966859,-9223371749091966858,-9223371749091966857,-9223371749091966856,-9223371749091966855,-9223371749091966854,-9223371749091966853,-9223371749091966852,-9223371749091966851,-9223371749091966850,-9223371749091966849,-9223371749091966848,-9223371749091966847,-9223371749091966846,-9223371749091966845,-9223371749091966844,-9223371749091966843,-9223371749091966842,-9223371749091966841,-9223371749091966840,-9223371749091966839,-9223371749091966838,-9223371749091966837,-9223371749091966836,-9223371749091966835,-9223371749091966834,-9223371749091966833,-9223371749091966832,-9223371749091966831,-9223371749091966830,-9223371749091966829,-9223371749091966828,-9223371749091966827,-9223371749091966826,-9223371749091966825,-9223371749091966824,-9223371749091966823,-9223371749091966822,-9223371749091966821,-9223371749091966820,-9223371749091966819,-9223371749091966818,-9223371749091966817,-9223371749091966816,-9223371749091966815,-9223371749091966814,-9223371749091966813,-9223371749091966812,-9223371749091966811,-9223371749091966810,-9223371749091966809,-9223371749091966808,-9223371749091966807,-9223371749091966806,-9223371749091966805,-9223371749091966804,-9223371749091966803,-9223371749091966802,-9223371749091966801,-9223371749091966800,-9223371749091966799,-9223371749091966798,-9223371749091966797,-9223371749091966796,-9223371749091966795,-9223371749091966794,-9223371749091966793,-9223371749091966792,-9223371749091966791,-9223371749091966790,-9223371749091966789,-9223371749091966788,-9223371749091966787,-9223371749091966786,-9223371749091966785,-9223371740502032384,-9223371740502032383,-9223371740502032382,-9223371740502032379,-9223371740502032378,-9223371740502032377,-9223371740502032376,-9223371740502032375,-9223371740502032374,-9223371740502032373,-9223371740502032372,-9223371740502032371,-9223371740502032370,-9223371740502032369,-9223371740502032362,-9223371740502032365,-9223371740502032364,-9223371740502032363,-9223371740502032326,-9223371740502032327,-9223371740502032325,-9223371740502032354,-9223371740502032368,-9223371740502032353,-9223371740502032352,-9223371740502032351,-9223371740502032350,-9223371740502032349,-9223371740502032348,-9223371740502032347,-9223371740502032346,-9223371740502032367,-9223371740502032345,-9223371740502032344,-9223371740502032343,-9223371740502032342,-9223371740502032341,-9223371740502032340,-9223371740502032339,-9223371740502032338,-9223371740502032366,-9223371740502032337,-9223371740502032336,-9223371740502032335,-9223371740502032334,-9223371740502032333,-9223371740502032332,-9223371740502032331,-9223371740502032330,-9223371744796999680,-9223371744796999679,-9223371744796999678,-9223371744796999677,-9223371744796999676,-9223371744796999673,-9223371366839877632,-9223371366839877620,-9223371366839877629,-9223371366839877628,-9223371366839877627,-9223371366839877621,-9223371366839877619,-9223371366839877618,-9223371366839877626,-9223371366839877625,-9223371366839877624,-9223371366839877623,-9223371366839877622,-9223371366839877616,-9223371366839877615,-9223371366839877614,-9223371366839877613,-9223371366839877612,-9223371366839877611,-9223371366839877610,-9223371366839877609,-9223371366839877608,-9223371366839877607,-9223371366839877604,-9223371366839877603,-9223371366839877606,-9223371366839877605,-9223371366839877598,-9223371366839877599,-9223371366839877602,-9223371366839877601,-9223371366839877592,-9223371366839877630,-9223371366839877591,-9223371366839877590,-9223371366839877589,-9223371366839877588,-9223371366839877587,-9223371366839877586,-9223371366839877585,-9223371366839877584,-9223371366839877617,-9223371366839877583,-9223371366839877582,-9223371366839877581,-9223371366839877580,-9223371366839877579,-9223371366839877578,-9223371366839877577,-9223371366839877576,-9223371298120400896,-9223371298120400895,-9223371298120400890,-9223371298120400888,-9223371298120400893,-9223371298120400889,-9223371298120400878,-9223371298120400877,-9223371298120400876,-9223371298120400875,-9223371298120400874,-9223371298120400873,-9223371298120400872,-9223371298120400871,-9223371298120400870,-9223371302415368192,-9223371302415368189,-9223371302415368185,-9223371302415368191,-9223371302415368186,-9223371302415368188,-9223371302415368183,-9223371302415368184));
DELETE "um_entityproperties" WHERE ("id" < 0 OR "id" >= 9223372032559808512) AND "id" NOT IN (-9223371946660462592,-9223371946660462591,-9223371946660462590,-9223371946660462568,-9223371946660462563,-9223371946660462562,-9223371946660462561,-9223371946660462560,-9223371946660462559,-9223371946660462589,-9223371946660462588,-9223371946660462569,-9223371946660462567,-9223371946660462566,-9223371946660462565,-9223371946660462564,-9223371946660462585,-9223371946660462584,-9223371946660462587,-9223371946660462586,-9223371946660462583,-9223371946660462582,-9223371946660462581,-9223371946660462580,-9223371946660462579,-9223371946660462578,-9223371946660462577,-9223371946660462576,-9223371946660462575,-9223371946660462574,-9223371946660462572,-9223371946660462571,-9223371946660462570,-9223371946660462538,-9223371946660462537,-9223371946660462573,-9223371946660462546,-9223371946660462545,-9223371946660462544,-9223371946660462543,-9223371946660462542,-9223371946660462541,-9223371946660462540,-9223371946660462539,-9223371946660462527,-9223371946660462528,-9223371946660462525,-9223371946660462526,-9223371946660462523,-9223371946660462524,-9223371946660462521,-9223371946660462522,-9223371946660462519,-9223371946660462520,-9223371946660462517,-9223371946660462518,-9223371946660462515,-9223371946660462516,-9223371946660462513,-9223371946660462514,-9223371946660462511,-9223371946660462512,-9223371946660462509,-9223371946660462510,-9223371946660462507,-9223371946660462508,-9223371946660462505,-9223371946660462506,-9223371946660462503,-9223371946660462504,-9223371946660462501,-9223371946660462502,-9223371946660462499,-9223371946660462500,-9223371946660462497,-9223371946660462498,-9223371946660462495,-9223371946660462496,-9223371946660462493,-9223371946660462494,-9223371946660462491,-9223371946660462492,-9223371946660462489,-9223371946660462490,-9223371946660462487,-9223371946660462488,-9223371946660462485,-9223371946660462486,-9223371946660462483,-9223371946660462484,-9223371946660462481,-9223371946660462482,-9223371946660462479,-9223371946660462480,-9223371946660462477,-9223371946660462478,-9223371946660462475,-9223371946660462476,-9223371946660462473,-9223371946660462474,-9223371946660462471,-9223371946660462472,-9223371946660462469,-9223371946660462470,-9223371946660462467,-9223371946660462468,-9223371946660462465,-9223371946660462466,-9223371946660462463,-9223371946660462464,-9223371946660462461,-9223371946660462462,-9223371946660462459,-9223371946660462460,-9223371946660462457,-9223371946660462458,-9223371946660462455,-9223371946660462456,-9223371946660462453,-9223371946660462454,-9223371946660462451,-9223371946660462452,-9223371946660462449,-9223371946660462450,-9223371946660462447,-9223371946660462448,-9223371946660462445,-9223371946660462446,-9223371946660462443,-9223371946660462444,-9223371946660462441,-9223371946660462442,-9223371946660462439,-9223371946660462440,-9223371946660462437,-9223371946660462438,-9223371946660462435,-9223371946660462436,-9223371946660462433,-9223371946660462434,-9223371946660462431,-9223371946660462432,-9223371946660462429,-9223371946660462430,-9223371946660462427,-9223371946660462428,-9223371946660462425,-9223371946660462426,-9223371946660462423,-9223371946660462424,-9223371946660462421,-9223371946660462422,-9223371946660462419,-9223371946660462420,-9223371946660462417,-9223371946660462418,-9223371946660462415,-9223371946660462416,-9223371946660462413,-9223371946660462414,-9223371946660462411,-9223371946660462412,-9223371946660462409,-9223371946660462410,-9223371946660462407,-9223371946660462408,-9223371946660462405,-9223371946660462406,-9223371946660462403,-9223371946660462404,-9223371946660462401,-9223371946660462402,-9223371946660462399,-9223371946660462400,-9223371946660462397,-9223371946660462398,-9223371946660462395,-9223371946660462396,-9223371946660462393,-9223371946660462394,-9223371946660462391,-9223371946660462392,-9223371946660462389,-9223371946660462390,-9223371946660462387,-9223371946660462388,-9223371946660462385,-9223371946660462386,-9223371946660462383,-9223371946660462384,-9223371946660462381,-9223371946660462382,-9223371946660462379,-9223371946660462380,-9223371946660462377,-9223371946660462378,-9223371946660462375,-9223371946660462376,-9223371946660462373,-9223371946660462374,-9223371946660462371,-9223371946660462372,-9223371946660462369,-9223371946660462370,-9223371946660462367,-9223371946660462368,-9223371946660462365,-9223371946660462366,-9223371946660462363,-9223371946660462364,-9223371946660462361,-9223371946660462362,-9223371946660462359,-9223371946660462360,-9223371946660462357,-9223371946660462358,-9223371946660462355,-9223371946660462356,-9223371946660462353,-9223371946660462354,-9223371946660462351,-9223371946660462352,-9223371946660462349,-9223371946660462350,-9223371946660462347,-9223371946660462348,-9223371946660462345,-9223371946660462346,-9223371946660462343,-9223371946660462344,-9223371946660462341,-9223371946660462342,-9223371946660462339,-9223371946660462340,-9223371946660462337,-9223371946660462338,-9223371946660462335,-9223371946660462336,-9223371946660462333,-9223371946660462334,-9223371946660462331,-9223371946660462332,-9223371946660462329,-9223371946660462330,-9223371946660462327,-9223371946660462328,-9223371946660462325,-9223371946660462326,-9223371946660462323,-9223371946660462324,-9223371946660462321,-9223371946660462322,-9223371946660462319,-9223371946660462320,-9223371946660462317,-9223371946660462318,-9223371946660462315,-9223371946660462316,-9223371946660462313,-9223371946660462314,-9223371946660462311,-9223371946660462312,-9223371946660462309,-9223371946660462310,-9223371946660462307,-9223371946660462308,-9223371946660462305,-9223371946660462306,-9223371946660462303,-9223371946660462304,-9223371946660462301,-9223371946660462302,-9223371946660462299,-9223371946660462300,-9223371946660462297,-9223371946660462298,-9223371946660462295,-9223371946660462296,-9223371946660462293,-9223371946660462294,-9223371946660462291,-9223371946660462292,-9223371946660462289,-9223371946660462290,-9223371946660462287,-9223371946660462288,-9223371946660462285,-9223371946660462286,-9223371946660462283,-9223371946660462284,-9223371946660462281,-9223371946660462282,-9223371946660462279,-9223371946660462280,-9223371946660462277,-9223371946660462278,-9223371946660462275,-9223371946660462276,-9223371946660462273,-9223371946660462274,-9223371950955429888,-9223371950955429866,-9223371950955429885,-9223371950955429884,-9223371950955429883,-9223371950955429882,-9223371950955429879,-9223371950955429878,-9223371950955429877,-9223371950955429872,-9223371950955429871,-9223371950955429870,-9223371950955429869,-9223371950955429868,-9223371950955429844,-9223371950955429867,-9223371950955429876,-9223371950955429875,-9223371950955429854,-9223371950955429881,-9223371950955429880,-9223371950955429855,-9223371950955429874,-9223371950955429873,-9223371950955429856,-9223371950955429887,-9223371950955429864,-9223371950955429863,-9223371950955429862,-9223371950955429861,-9223371950955429860,-9223371950955429859,-9223371950955429858,-9223371950955429857,-9223371950955429835,-9223371950955429843,-9223371950955429842,-9223371950955429841,-9223371950955429840,-9223371950955429839,-9223371950955429838,-9223371950955429837,-9223371950955429836,-9223371950955429886,-9223371950955429853,-9223371950955429852,-9223371950955429851,-9223371950955429850,-9223371950955429849,-9223371950955429848,-9223371950955429847,-9223371950955429846,-9223371950955429845,-9223371950955429865,-9223371839286280192,-9223371839286280191,-9223371839286280190,-9223371839286280189,-9223371839286280188,-9223371839286280184,-9223371839286280183,-9223371839286280187,-9223371839286280186,-9223371839286280185,-9223371920890658792,-9223371920890658769,-9223371920890658768,-9223371920890658804,-9223371920890658803,-9223371920890658808,-9223371920890658807,-9223371920890658802,-9223371920890658801,-9223371920890658800,-9223371920890658799,-9223371920890658776,-9223371920890658798,-9223371920890658785,-9223371920890658809,-9223371920890658816,-9223371920890658815,-9223371920890658771,-9223371920890658813,-9223371920890658812,-9223371920890658814,-9223371920890658784,-9223371920890658783,-9223371920890658782,-9223371920890658781,-9223371920890658780,-9223371920890658779,-9223371920890658778,-9223371920890658777,-9223371920890658766,-9223371920890658770,-9223371920890658746,-9223371920890658789,-9223371920890658806,-9223371920890658793,-9223371920890658788,-9223371920890658787,-9223371920890658786,-9223371920890658728,-9223371985315168256,-9223371985315168239,-9223371985315168253,-9223371985315168244,-9223371985315168250,-9223371985315168251,-9223371985315168249,-9223371985315168247,-9223371985315168248,-9223371985315168245,-9223371985315168246,-9223371985315168252,-9223371985315168255,-9223371985315168237,-9223371985315168236,-9223371985315168235,-9223371985315168234,-9223371985315168233,-9223371985315168232,-9223371985315168231,-9223371985315168230,-9223371985315168254,-9223371985315168227,-9223371985315168226,-9223371985315168225,-9223371985315168224,-9223371985315168223,-9223371985315168222,-9223371985315168221,-9223371985315168220,-9223371985315168219,-9223371985315168218,-9223371985315168217,-9223371985315168216,-9223371985315168215,-9223371985315168214,-9223371985315168213,-9223371985315168212,-9223371985315168211,-9223371985315168210,-9223371985315168209,-9223370860033736704,-9223370860033736698,-9223370860033736699,-9223370860033736700,-9223370860033736701,-9223370860033736696,-9223370860033736697,-9223370855738769408,-9223370855738769406,-9223370855738769407,-9223370855738769404,-9223370855738769405,-9223370855738769402,-9223370855738769403,-9223370855738769400,-9223370855738769401,-9223370855738769399,-9223370855738769398,-9223370855738769397,-9223370855738769395,-9223371916595690519,-9223371916595691509,-9223371916595691508,-9223371916595691488,-9223371916595691487,-9223371916595691490,-9223371916595691489,-9223371916595691486,-9223371916595691430,-9223371916595691429,-9223371916595691426,-9223371916595691428,-9223371916595691427,-9223371916595691460,-9223371916595691459,-9223371916595691520,-9223371916595691519,-9223371916595691518,-9223371916595691517,-9223371916595691515,-9223371916595691516,-9223371916595691513,-9223371916595691514,-9223371916595691511,-9223371916595691512,-9223371916595691470,-9223371916595691469,-9223371916595691498,-9223371916595691497,-9223371916595691496,-9223371916595691495,-9223371916595691494,-9223371916595691480,-9223371916595691507,-9223371916595691510,-9223371916595691506,-9223371916595691505,-9223371916595691504,-9223371916595691503,-9223371916595691502,-9223371916595691501,-9223371916595691500,-9223371916595691499,-9223371938070527945,-9223371938070528000,-9223371938070527984,-9223371938070527997,-9223371938070527996,-9223371938070527971,-9223371938070527995,-9223371938070527994,-9223371938070527993,-9223371938070527992,-9223371938070527991,-9223371938070527990,-9223371938070527981,-9223371938070527959,-9223371938070527958,-9223371938070527956,-9223371938070527944,-9223371938070527988,-9223371938070527987,-9223371938070527986,-9223371938070527985,-9223371938070527983,-9223371938070527982,-9223371938070527980,-9223371938070527989,-9223371938070527960,-9223371938070527999,-9223371938070527979,-9223371938070527978,-9223371938070527977,-9223371938070527976,-9223371938070527975,-9223371938070527974,-9223371938070527973,-9223371938070527972,-9223371938070527954,-9223371938070527953,-9223371938070527952,-9223371938070527951,-9223371938070527950,-9223371938070527949,-9223371938070527948,-9223371938070527947,-9223371938070527946,-9223371938070527998,-9223371938070527969,-9223371938070527968,-9223371938070527967,-9223371938070527966,-9223371938070527965,-9223371938070527964,-9223371938070527963,-9223371938070527962,-9223371938070527961,-9223371938070527970,-9223371938070527930,-9223371938070527955,-9223371938070527957,-9223371942365495269,-9223371942365495274,-9223371942365495271,-9223371942365495285,-9223371942365495284,-9223371942365495289,-9223371942365495279,-9223371942365495236,-9223371942365495233,-9223371942365495230,-9223371942365495227,-9223371942365495288,-9223371942365495278,-9223371942365495235,-9223371942365495232,-9223371942365495229,-9223371942365495226,-9223371942365495291,-9223371942365495290,-9223371942365495277,-9223371942365495234,-9223371942365495231,-9223371942365495228,-9223371942365495225,-9223371942365495286,-9223371942365495276,-9223371942365495273,-9223371942365495275,-9223371942365495252,-9223371942365495265,-9223371942365495264,-9223371942365495263,-9223371942365495254,-9223371942365495253,-9223371940218010881,-9223371940218010880,-9223371940218010879,-9223371940218010878,-9223371940218010877,-9223371940218010876,-9223371940218010875,-9223371940218010874,-9223371940218010873,-9223371940218010872,-9223371940218010871,-9223371940218010870,-9223371940218010869,-9223371940218010868,-9223371940218010867,-9223371940218010866,-9223371940218010865,-9223371940218010864,-9223371940218010863,-9223371940218010862,-9223371940218010861,-9223371940218010860,-9223371940218010859,-9223371940218010858,-9223371940218010857,-9223371940218010856,-9223371940218010855,-9223371940218010854,-9223371940218010853,-9223371940218010852,-9223371940218010851,-9223371940218010850,-9223371940218010849,-9223371940218010848,-9223371940218010847,-9223371940218010846,-9223371940218010845,-9223371940218010844,-9223371940218010843,-9223371940218010842,-9223371940218010841,-9223371940218010840,-9223371940218010839,-9223371940218010838,-9223371940218010837,-9223371940218010836,-9223371940218010835,-9223371940218010834,-9223371940218010833,-9223371940218010832,-9223371940218010831,-9223371940218010830,-9223371940218010829,-9223371940218010828,-9223371940218010827,-9223371940218010826,-9223371940218010825,-9223371940218010824,-9223371940218010823,-9223371940218010822,-9223371940218010821,-9223371940218010820,-9223371940218010819,-9223371940218010818,-9223371940218010817,-9223371940218010816,-9223371940218010815,-9223371940218010814,-9223371940218010813,-9223371940218010812,-9223371940218010811,-9223371940218010810,-9223371940218010809,-9223371940218010808,-9223371940218010807,-9223371940218010806,-9223371940218010805,-9223371940218010804,-9223371940218010803,-9223371940218010802,-9223371940218010801,-9223371940218010800,-9223371940218010799,-9223371940218010798,-9223371940218010797,-9223371940218010796,-9223371940218010795,-9223371940218010794,-9223371940218010793,-9223371940218010792,-9223371940218010791,-9223371940218010790,-9223371940218010789,-9223371940218010788,-9223371940218010787,-9223371940218010786,-9223371940218010785,-9223371940218010784,-9223371940218010783,-9223371940218010782,-9223371940218010781,-9223371940218010780,-9223371940218010779,-9223371940218010778,-9223371940218010777,-9223371940218010776,-9223371940218010775,-9223371940218010774,-9223371940218010773,-9223371940218010772,-9223371940218010771,-9223371940218010770,-9223371940218010769,-9223371940218010768,-9223371940218010767,-9223371940218010766,-9223371940218010765,-9223371940218010764,-9223371940218010763,-9223371940218010762,-9223371940218010761,-9223371940218010760,-9223371940218010759,-9223371940218010758,-9223371940218010757,-9223371940218010756,-9223371940218010755,-9223371940218010754,-9223371942365495246,-9223371942365495296,-9223371942365495295,-9223371942365495294,-9223371942365495262,-9223371942365495261,-9223371942365495260,-9223371942365495259,-9223371942365495258,-9223371942365495257,-9223371942365495256,-9223371942365495255,-9223371942365495293,-9223371942365495281,-9223371942365495287,-9223371942365495280,-9223371942365495266,-9223371940218011009,-9223371940218011008,-9223371940218011007,-9223371940218011006,-9223371940218011005,-9223371940218011004,-9223371940218011003,-9223371940218011002,-9223371940218011001,-9223371940218011000,-9223371940218010999,-9223371940218010998,-9223371940218010997,-9223371940218010996,-9223371940218010995,-9223371940218010994,-9223371940218010993,-9223371940218010992,-9223371940218010991,-9223371940218010990,-9223371940218010989,-9223371940218010988,-9223371940218010987,-9223371940218010986,-9223371940218010985,-9223371940218010984,-9223371940218010983,-9223371940218010982,-9223371940218010981,-9223371940218010980,-9223371940218010979,-9223371940218010978,-9223371940218010977,-9223371940218010976,-9223371940218010975,-9223371940218010974,-9223371940218010973,-9223371940218010972,-9223371940218010971,-9223371940218010970,-9223371940218010969,-9223371940218010968,-9223371940218010967,-9223371940218010966,-9223371940218010965,-9223371940218010964,-9223371940218010963,-9223371940218010962,-9223371940218010961,-9223371940218010960,-9223371940218010959,-9223371940218010958,-9223371940218010957,-9223371940218010956,-9223371940218010955,-9223371940218010954,-9223371940218010953,-9223371940218010952,-9223371940218010951,-9223371940218010950,-9223371940218010949,-9223371940218010948,-9223371940218010947,-9223371940218010946,-9223371940218010945,-9223371940218010944,-9223371940218010943,-9223371940218010942,-9223371940218010941,-9223371940218010940,-9223371940218010939,-9223371940218010938,-9223371940218010937,-9223371940218010936,-9223371940218010935,-9223371940218010934,-9223371940218010933,-9223371940218010932,-9223371940218010931,-9223371940218010930,-9223371940218010929,-9223371940218010928,-9223371940218010927,-9223371940218010926,-9223371940218010925,-9223371940218010924,-9223371940218010923,-9223371940218010922,-9223371940218010921,-9223371940218010920,-9223371940218010919,-9223371940218010918,-9223371940218010917,-9223371940218010916,-9223371940218010915,-9223371940218010914,-9223371940218010913,-9223371940218010912,-9223371940218010911,-9223371940218010910,-9223371940218010909,-9223371940218010908,-9223371940218010907,-9223371940218010906,-9223371940218010905,-9223371940218010904,-9223371940218010903,-9223371940218010902,-9223371940218010901,-9223371940218010900,-9223371940218010899,-9223371940218010898,-9223371940218010897,-9223371940218010896,-9223371940218010895,-9223371940218010894,-9223371940218010893,-9223371940218010892,-9223371940218010891,-9223371940218010890,-9223371940218010889,-9223371940218010888,-9223371940218010887,-9223371940218010886,-9223371940218010885,-9223371940218010884,-9223371940218010883,-9223371940218010882,-9223371886530920418,-9223371886530920448,-9223371886530920447,-9223371886530920446,-9223371886530920445,-9223371886530920444,-9223371886530920443,-9223371886530920442,-9223371886530920441,-9223371886530920440,-9223371886530920439,-9223371886530920438,-9223371886530920437,-9223371886530920436,-9223371886530920435,-9223371886530920434,-9223371886530920433,-9223371886530920417,-9223371989610135552,-9223371989610135548,-9223371989610135549,-9223371989610135543,-9223371989610135550,-9223371989610135551,-9223371989610135547,-9223371989610135546,-9223371989610135544,-9223371989610135545,-9223370847148834816,-9223370847148834814,-9223370847148834815,-9223370847148834813,-9223370847148834812,-9223370847148834811,-9223371843581247488,-9223371843581247475,-9223371843581247485,-9223371843581247484,-9223371843581247462,-9223371843581247483,-9223371843581247482,-9223371843581247481,-9223371843581247480,-9223371843581247473,-9223371843581247443,-9223371843581247442,-9223371843581247441,-9223371843581247440,-9223371843581247439,-9223371843581247479,-9223371843581247478,-9223371843581247477,-9223371843581247476,-9223371843581247474,-9223371843581247487,-9223371843581247472,-9223371843581247471,-9223371843581247470,-9223371843581247469,-9223371843581247468,-9223371843581247467,-9223371843581247466,-9223371843581247465,-9223371843581247452,-9223371843581247451,-9223371843581247450,-9223371843581247449,-9223371843581247448,-9223371843581247447,-9223371843581247446,-9223371843581247445,-9223371843581247444,-9223371843581247486,-9223371843581247461,-9223371843581247460,-9223371843581247459,-9223371843581247458,-9223371843581247457,-9223371843581247456,-9223371843581247455,-9223371843581247454,-9223371843581247453,-9223371955250397184,-9223371955250397167,-9223371955250397181,-9223371955250397180,-9223371955250397156,-9223371955250397179,-9223371955250397178,-9223371955250397177,-9223371955250397176,-9223371955250397166,-9223371955250397134,-9223371955250397133,-9223371955250397132,-9223371955250397131,-9223371955250397130,-9223371955250397173,-9223371955250397172,-9223371955250397171,-9223371955250397170,-9223371955250397169,-9223371955250397168,-9223371955250397146,-9223371955250397145,-9223371955250397175,-9223371955250397183,-9223371955250397165,-9223371955250397164,-9223371955250397163,-9223371955250397162,-9223371955250397161,-9223371955250397160,-9223371955250397159,-9223371955250397158,-9223371955250397144,-9223371955250397143,-9223371955250397142,-9223371955250397141,-9223371955250397140,-9223371955250397139,-9223371955250397138,-9223371955250397137,-9223371955250397136,-9223371955250397182,-9223371955250397155,-9223371955250397154,-9223371955250397153,-9223371955250397152,-9223371955250397151,-9223371955250397150,-9223371955250397149,-9223371955250397148,-9223371955250397147,-9223371899415822336,-9223371899415822335,-9223371899415822333,-9223371899415822332,-9223371899415822331,-9223371899415822330,-9223371899415822329,-9223371899415822328,-9223371895120855040,-9223371895120855039,-9223371895120855037,-9223371895120855036,-9223371895120855035,-9223371895120855034,-9223371895120855033,-9223371895120855032,-9223371895120855031,-9223371895120855030,-9223371890825887744,-9223371890825887743,-9223371890825887741,-9223371890825887740,-9223371890825887739,-9223371890825887738,-9223371890825887737,-9223371890825887736,-9223371890825887735,-9223371890825887734,-9223371890825887733,-9223371890825887732,-9223371890825887724,-9223371358249943040,-9223371358249943039,-9223371358249943038,-9223371358249943037,-9223371358249943036,-9223371358249943035,-9223371358249943034,-9223371358249943033,-9223371358249943032,-9223371358249943031,-9223371358249943030,-9223371358249943029,-9223371358249943028,-9223371358249943027,-9223371358249943026,-9223371358249943024,-9223371358249943025,-9223371358249943000,-9223371856466149365,-9223371856466149364,-9223371856466149360,-9223371856466149359,-9223371856466149344,-9223371856466149343,-9223371856466149342,-9223371856466149341,-9223371856466149340,-9223371856466149339,-9223371856466149338,-9223371856466149337,-9223371856466149336,-9223371856466149335,-9223371856466149334,-9223371856466149358,-9223371856466149357,-9223371856466149331,-9223371856466149376,-9223371856466149356,-9223371856466149374,-9223371856466149373,-9223371856466149372,-9223371856466149371,-9223371856466149347,-9223371856466149370,-9223371856466149369,-9223371856466149368,-9223371856466149367,-9223371856466149329,-9223371856466149345,-9223371856466149330,-9223371856466149375,-9223371856466149366,-9223371856466149361,-9223371856466149362,-9223371856466149363,-9223371856466149346,-9223371856466149288,-9223370907278376960,-9223370907278376959,-9223370907278376958,-9223370907278376948,-9223370907278376957,-9223370907278376956,-9223370907278376955,-9223370907278376954,-9223370907278376953,-9223370907278376952,-9223370907278376951,-9223370907278376950,-9223370907278376949,-9223371976725233664,-9223371976725233663,-9223371976725233659,-9223371976725233657,-9223371976725233655,-9223371976725233654,-9223371976725233653,-9223371976725233652,-9223371976725233651,-9223371976725233650,-9223371976725233649,-9223371976725233648,-9223371976725233647,-9223371976725233646,-9223371976725233599,-9223371976725233600,-9223371976725233597,-9223371976725233598,-9223371976725233595,-9223371976725233596,-9223371976725233593,-9223371976725233594,-9223371976725233591,-9223371976725233592,-9223371976725233589,-9223371976725233590,-9223371976725233587,-9223371976725233588,-9223371976725233585,-9223371976725233586,-9223371976725233583,-9223371976725233584,-9223371976725233581,-9223371976725233582,-9223371976725233579,-9223371976725233580,-9223371976725233577,-9223371976725233578,-9223371976725233575,-9223371976725233576,-9223371976725233573,-9223371976725233574,-9223371976725233571,-9223371976725233572,-9223371976725233569,-9223371976725233570,-9223371976725233567,-9223371976725233568,-9223371976725233565,-9223371976725233566,-9223371976725233563,-9223371976725233564,-9223371976725233561,-9223371976725233562,-9223371976725233559,-9223371976725233560,-9223371976725233557,-9223371976725233558,-9223371976725233555,-9223371976725233556,-9223371976725233553,-9223371976725233554,-9223371976725233551,-9223371976725233552,-9223371976725233549,-9223371976725233550,-9223371976725233547,-9223371976725233548,-9223371976725233545,-9223371976725233546,-9223371976725233543,-9223371976725233544,-9223371976725233541,-9223371976725233542,-9223371976725233539,-9223371976725233540,-9223371976725233537,-9223371976725233538,-9223371976725233535,-9223371976725233536,-9223371976725233533,-9223371976725233534,-9223371976725233531,-9223371976725233532,-9223371976725233529,-9223371976725233530,-9223371976725233527,-9223371976725233528,-9223371976725233525,-9223371976725233526,-9223371976725233523,-9223371976725233524,-9223371976725233521,-9223371976725233522,-9223371976725233519,-9223371976725233520,-9223371976725233517,-9223371976725233518,-9223371976725233515,-9223371976725233516,-9223371976725233513,-9223371976725233514,-9223371976725233511,-9223371976725233512,-9223371976725233509,-9223371976725233510,-9223371976725233507,-9223371976725233508,-9223371976725233505,-9223371976725233506,-9223371976725233503,-9223371976725233504,-9223371976725233501,-9223371976725233502,-9223371976725233499,-9223371976725233500,-9223371976725233497,-9223371976725233498,-9223371976725233495,-9223371976725233496,-9223371976725233493,-9223371976725233494,-9223371976725233491,-9223371976725233492,-9223371976725233489,-9223371976725233490,-9223371976725233487,-9223371976725233488,-9223371976725233485,-9223371976725233486,-9223371976725233483,-9223371976725233484,-9223371976725233481,-9223371976725233482,-9223371976725233479,-9223371976725233480,-9223371976725233477,-9223371976725233478,-9223371976725233475,-9223371976725233476,-9223371976725233473,-9223371976725233474,-9223371976725233471,-9223371976725233472,-9223371976725233469,-9223371976725233470,-9223371976725233467,-9223371976725233468,-9223371976725233465,-9223371976725233466,-9223371976725233463,-9223371976725233464,-9223371976725233461,-9223371976725233462,-9223371976725233459,-9223371976725233460,-9223371976725233457,-9223371976725233458,-9223371976725233455,-9223371976725233456,-9223371976725233453,-9223371976725233454,-9223371976725233451,-9223371976725233452,-9223371976725233449,-9223371976725233450,-9223371976725233447,-9223371976725233448,-9223371976725233445,-9223371976725233446,-9223371976725233443,-9223371976725233444,-9223371976725233441,-9223371976725233442,-9223371976725233439,-9223371976725233440,-9223371976725233437,-9223371976725233438,-9223371976725233435,-9223371976725233436,-9223371976725233433,-9223371976725233434,-9223371976725233431,-9223371976725233432,-9223371976725233429,-9223371976725233430,-9223371976725233427,-9223371976725233428,-9223371976725233425,-9223371976725233426,-9223371976725233423,-9223371976725233424,-9223371976725233421,-9223371976725233422,-9223371976725233419,-9223371976725233420,-9223371976725233417,-9223371976725233418,-9223371976725233415,-9223371976725233416,-9223371976725233413,-9223371976725233414,-9223371976725233411,-9223371976725233412,-9223371976725233409,-9223371976725233410,-9223371976725233407,-9223371976725233408,-9223371976725233405,-9223371976725233406,-9223371976725233403,-9223371976725233404,-9223371976725233401,-9223371976725233402,-9223371976725233399,-9223371976725233400,-9223371976725233397,-9223371976725233398,-9223371976725233395,-9223371976725233396,-9223371976725233393,-9223371976725233394,-9223371976725233391,-9223371976725233392,-9223371976725233389,-9223371976725233390,-9223371976725233387,-9223371976725233388,-9223371976725233385,-9223371976725233386,-9223371976725233383,-9223371976725233384,-9223371976725233381,-9223371976725233382,-9223371976725233379,-9223371976725233380,-9223371976725233377,-9223371976725233378,-9223371976725233375,-9223371976725233376,-9223371976725233373,-9223371976725233374,-9223371976725233371,-9223371976725233372,-9223371976725233369,-9223371976725233370,-9223371976725233367,-9223371976725233368,-9223371976725233365,-9223371976725233366,-9223371976725233363,-9223371976725233364,-9223371976725233361,-9223371976725233362,-9223371976725233359,-9223371976725233360,-9223371976725233357,-9223371976725233358,-9223371976725233355,-9223371976725233356,-9223371976725233353,-9223371976725233354,-9223371976725233351,-9223371976725233352,-9223371976725233349,-9223371976725233350,-9223371976725233347,-9223371976725233348,-9223371976725233345,-9223371976725233346,-9223372015379939328,-9223372015379939327,-9223372015379939326,-9223372015379939325,-9223372015379939324,-9223372015379939322,-9223372015379939307,-9223372015379939320,-9223372015379939319,-9223372015379939318,-9223372015379939317,-9223372015379939316,-9223372015379939313,-9223372015379939312,-9223372015379939311,-9223372015379939310,-9223372015379939309,-9223372015379939308,-9223372015379939278,-9223372015379939277,-9223372015379939276,-9223372015379939275,-9223372015379939274,-9223372015379939273,-9223372015379939272,-9223372015379939271,-9223372015379939270,-9223372015379939269,-9223372015379939268,-9223372015379939305,-9223372015379939267,-9223372015379939266,-9223372015379939265,-9223372015379939264,-9223372015379939306,-9223371998200070144,-9223371998200070143,-9223371998200070142,-9223371998200070141,-9223371998200070140,-9223371998200070138,-9223371998200070124,-9223371998200070136,-9223371998200070135,-9223371998200070134,-9223371998200070133,-9223371998200070132,-9223371998200070130,-9223371998200070129,-9223371998200070128,-9223371998200070127,-9223371998200070126,-9223371998200070125,-9223371998200070094,-9223371998200070093,-9223371998200070092,-9223371998200070091,-9223371998200070090,-9223371998200070089,-9223371998200070088,-9223371998200070087,-9223371998200070086,-9223371998200070085,-9223371998200070084,-9223371998200070123,-9223371998200070083,-9223371998200070082,-9223371998200070081,-9223371998200070080,-9223371998200070122,-9223372002495037440,-9223372002495037439,-9223372002495037428,-9223372002495037438,-9223372002495037437,-9223372002495037436,-9223372002495037435,-9223372002495037433,-9223372002495037434,-9223372002495037402,-9223372002495037432,-9223372002495037431,-9223372002495037426,-9223372002495037425,-9223372002495037427,-9223372002495037424,-9223372002495037423,-9223372002495037422,-9223372002495037420,-9223372002495037419,-9223372002495037417,-9223372002495037418,-9223372002495037410,-9223372002495037411,-9223372002495037408,-9223372002495037409,-9223372002495037404,-9223372002495037403,-9223372002495037416,-9223372002495037415,-9223372002495037414,-9223372002495037413,-9223372002495037412,-9223372002495037401,-9223372002495037390,-9223372002495037389,-9223372002495037388,-9223372002495037387,-9223372002495037386,-9223372002495037385,-9223372002495037384,-9223372002495037383,-9223372002495037382,-9223372002495037381,-9223372002495037380,-9223372002495037400,-9223372002495037379,-9223372002495037378,-9223372002495037377,-9223372002495037370,-9223372002495037421,-9223372002495037369,-9223372002495037430,-9223372002495037429,-9223372002495037407,-9223372002495037406,-9223372011084972032,-9223372011084972031,-9223372011084972030,-9223372011084972029,-9223372011084972028,-9223372011084972027,-9223372011084972026,-9223372011084972025,-9223372011084972024,-9223372011084972023,-9223372011084972022,-9223372011084972021,-9223372011084972020,-9223372011084972015,-9223372011084972014,-9223372011084972013,-9223372011084972012,-9223372011084972011,-9223372011084972009,-9223372011084971966,-9223372011084971965,-9223372011084972010,-9223372006790004736,-9223372006790004735,-9223372006790004734,-9223372006790004733,-9223372006790004715,-9223372006790004732,-9223372006790004731,-9223372006790004730,-9223372006790004729,-9223372006790004728,-9223372006790004727,-9223372006790004719,-9223372006790004718,-9223372006790004717,-9223372006790004716,-9223372006790004670,-9223372006790004669,-9223372006790004714,-9223371993905102848,-9223371993905102847,-9223371993905102843,-9223371993905102846,-9223371993905102842,-9223371993905102845,-9223371993905102844,-9223370890098507776,-9223370890098507775,-9223370890098507774,-9223370890098507773,-9223370890098507772,-9223370890098507771,-9223370890098507770,-9223370890098507769,-9223370890098507768,-9223370890098507767,-9223370890098507766,-9223370890098507765,-9223370890098507764,-9223370890098507763,-9223370890098507762,-9223370890098507761,-9223370890098507760,-9223370890098507759,-9223370890098507758,-9223370890098507757,-9223370890098507756,-9223370890098507755,-9223370890098507754,-9223370890098507753,-9223370890098507752,-9223370890098507751,-9223370890098507750,-9223370890098507749,-9223370890098507748,-9223370890098507747,-9223370890098507746,-9223370877213605888,-9223370877213605887,-9223370877213605886,-9223370877213605885,-9223370877213605884,-9223370877213605883,-9223370877213605882,-9223370877213605881,-9223370877213605880,-9223370877213605872,-9223370877213605879,-9223370877213605878,-9223370877213605877,-9223370877213605876,-9223370877213605875,-9223370877213605874,-9223370877213605873,-9223370877213605871,-9223370902983409664,-9223370902983409663,-9223370902983409661,-9223370902983409660,-9223370902983409659,-9223370902983409658,-9223370902983409657,-9223370902983409655,-9223370902983409656,-9223370902983409646,-9223370902983409645,-9223370902983409644,-9223370902983409643,-9223370902983409642,-9223370902983409641,-9223370902983409640,-9223370902983409662,-9223370902983409654,-9223370902983409653,-9223370902983409652,-9223370902983409651,-9223370902983409650,-9223370902983409649,-9223370902983409648,-9223370902983409647,-9223370881508573184,-9223370881508573182,-9223370881508573183,-9223370881508573171,-9223370881508573172,-9223370881508573181,-9223370881508573178,-9223370881508573177,-9223370881508573179,-9223370881508573180,-9223370881508573175,-9223370881508573174,-9223370881508573173,-9223370881508573176,-9223370881508573169,-9223370881508573170,-9223370881508573168,-9223370881508573167,-9223370881508573166,-9223370881508573165,-9223370881508573164,-9223370881508573162,-9223370881508573163,-9223370885803540480,-9223370885803540478,-9223370885803540479,-9223370885803540476,-9223370885803540477,-9223370885803540475,-9223370885803540473,-9223370885803540474,-9223370885803540471,-9223370885803540472,-9223370885803540470,-9223370885803540415,-9223370885803540416,-9223370885803540413,-9223370885803540414,-9223370885803540411,-9223370885803540412,-9223370885803540409,-9223370885803540410,-9223370885803540407,-9223370885803540408,-9223370885803540405,-9223370885803540406,-9223370885803540403,-9223370885803540404,-9223370885803540401,-9223370885803540402,-9223370885803540399,-9223370885803540400,-9223370885803540397,-9223370885803540398,-9223370885803540395,-9223370885803540396,-9223370885803540393,-9223370885803540394,-9223370885803540391,-9223370885803540392,-9223370885803540389,-9223370885803540390,-9223370885803540387,-9223370885803540388,-9223370885803540385,-9223370885803540386,-9223370885803540383,-9223370885803540384,-9223370885803540381,-9223370885803540382,-9223370885803540379,-9223370885803540380,-9223370885803540377,-9223370885803540378,-9223370885803540375,-9223370885803540376,-9223370885803540373,-9223370885803540374,-9223370885803540371,-9223370885803540372,-9223370885803540369,-9223370885803540370,-9223370885803540367,-9223370885803540368,-9223370885803540365,-9223370885803540366,-9223370885803540363,-9223370885803540364,-9223370885803540361,-9223370885803540362,-9223370885803540359,-9223370885803540360,-9223370885803540357,-9223370885803540358,-9223370885803540355,-9223370885803540356,-9223370885803540353,-9223370885803540354,-9223370885803540351,-9223370885803540352,-9223370885803540349,-9223370885803540350,-9223370885803540347,-9223370885803540348,-9223370885803540345,-9223370885803540346,-9223370885803540343,-9223370885803540344,-9223370885803540341,-9223370885803540342,-9223370885803540339,-9223370885803540340,-9223370885803540337,-9223370885803540338,-9223370885803540335,-9223370885803540336,-9223370885803540333,-9223370885803540334,-9223370885803540331,-9223370885803540332,-9223370885803540329,-9223370885803540330,-9223370885803540327,-9223370885803540328,-9223370885803540325,-9223370885803540326,-9223370885803540323,-9223370885803540324,-9223370885803540321,-9223370885803540322,-9223370885803540319,-9223370885803540320,-9223370885803540317,-9223370885803540318,-9223370885803540315,-9223370885803540316,-9223370885803540313,-9223370885803540314,-9223370885803540311,-9223370885803540312,-9223370885803540309,-9223370885803540310,-9223370885803540307,-9223370885803540308,-9223370885803540305,-9223370885803540306,-9223370885803540303,-9223370885803540304,-9223370885803540301,-9223370885803540302,-9223370885803540299,-9223370885803540300,-9223370885803540297,-9223370885803540298,-9223370885803540295,-9223370885803540296,-9223370885803540293,-9223370885803540294,-9223370885803540291,-9223370885803540292,-9223370885803540289,-9223370885803540290,-9223370885803540287,-9223370885803540288,-9223370885803540285,-9223370885803540286,-9223370885803540283,-9223370885803540284,-9223370885803540281,-9223370885803540282,-9223370885803540279,-9223370885803540280,-9223370885803540277,-9223370885803540278,-9223370885803540275,-9223370885803540276,-9223370885803540273,-9223370885803540274,-9223370885803540271,-9223370885803540272,-9223370885803540269,-9223370885803540270,-9223370885803540267,-9223370885803540268,-9223370885803540265,-9223370885803540266,-9223370885803540263,-9223370885803540264,-9223370885803540261,-9223370885803540262,-9223370885803540259,-9223370885803540260,-9223370885803540257,-9223370885803540258,-9223370885803540255,-9223370885803540256,-9223370885803540253,-9223370885803540254,-9223370885803540251,-9223370885803540252,-9223370885803540249,-9223370885803540250,-9223370885803540247,-9223370885803540248,-9223370885803540245,-9223370885803540246,-9223370885803540243,-9223370885803540244,-9223370885803540241,-9223370885803540242,-9223370885803540239,-9223370885803540240,-9223370885803540237,-9223370885803540238,-9223370885803540235,-9223370885803540236,-9223370885803540233,-9223370885803540234,-9223370885803540231,-9223370885803540232,-9223370885803540229,-9223370885803540230,-9223370885803540227,-9223370885803540228,-9223370885803540225,-9223370885803540226,-9223370885803540223,-9223370885803540224,-9223370885803540221,-9223370885803540222,-9223370885803540219,-9223370885803540220,-9223370885803540217,-9223370885803540218,-9223370885803540215,-9223370885803540216,-9223370885803540213,-9223370885803540214,-9223370885803540211,-9223370885803540212,-9223370885803540209,-9223370885803540210,-9223370885803540207,-9223370885803540208,-9223370885803540205,-9223370885803540206,-9223370885803540203,-9223370885803540204,-9223370885803540201,-9223370885803540202,-9223370885803540199,-9223370885803540200,-9223370885803540197,-9223370885803540198,-9223370885803540195,-9223370885803540196,-9223370885803540193,-9223370885803540194,-9223370885803540191,-9223370885803540192,-9223370885803540189,-9223370885803540190,-9223370885803540187,-9223370885803540188,-9223370885803540185,-9223370885803540186,-9223370885803540183,-9223370885803540184,-9223370885803540181,-9223370885803540182,-9223370885803540179,-9223370885803540180,-9223370885803540177,-9223370885803540178,-9223370885803540175,-9223370885803540176,-9223370885803540173,-9223370885803540174,-9223370885803540171,-9223370885803540172,-9223370885803540169,-9223370885803540170,-9223370885803540167,-9223370885803540168,-9223370885803540165,-9223370885803540166,-9223370885803540163,-9223370885803540164,-9223370885803540161,-9223370885803540162,-9223370851443802112,-9223370851443802111,-9223370851443802110,-9223370851443802109,-9223370851443802108,-9223370851443802107,-9223370851443802106,-9223370851443802105,-9223370851443802104,-9223370851443802103,-9223370851443802102,-9223370851443802101,-9223370898688442368,-9223370898688442366,-9223370898688442367,-9223370898688442364,-9223370898688442365,-9223370898688442363,-9223370898688442340,-9223370898688442362,-9223370898688442360,-9223370898688442361,-9223370898688442359,-9223370898688442358,-9223370898688442357,-9223370898688442356,-9223370898688442355,-9223370898688442354,-9223370898688442353,-9223370898688442352,-9223370898688442351,-9223370898688442350,-9223370898688442349,-9223370898688442348,-9223370898688442347,-9223370898688442346,-9223370898688442345,-9223370898688442344,-9223370898688442343,-9223370898688442342,-9223370898688442341,-9223370872918638592,-9223370872918638591,-9223370872918638590,-9223370872918638589,-9223370872918638588,-9223370872918638587,-9223370872918638586,-9223370872918638585,-9223370872918638584,-9223370842853867520,-9223370842853867519,-9223370842853867516,-9223370842853867515,-9223370842853867514,-9223370842853867513,-9223370842853867517,-9223370842853867498,-9223370842853867497,-9223370842853867496,-9223370842853867495,-9223370842853867494,-9223370842853867493,-9223370842853867492,-9223370842853867491,-9223370838558900224,-9223370838558900223,-9223370838558900220,-9223370838558900219,-9223370838558900221,-9223370838558900217,-9223370838558900218,-9223370838558900216,-9223370834263932928,-9223370834263932927,-9223370834263932924,-9223370834263932923,-9223370834263932925,-9223370834263932921,-9223370834263932922,-9223370834263932919,-9223370834263932920,-9223370834263932918,-9223370834263932917,-9223371332480139264,-9223371332480139263,-9223371332480139260,-9223371332480139259,-9223371332480139258,-9223371332480139249,-9223371332480139262,-9223371332480139257,-9223371332480139256,-9223371332480139255,-9223371332480139254,-9223371332480139253,-9223371332480139252,-9223371332480139251,-9223371332480139250,-9223371929480593408,-9223371929480593407,-9223371929480593404,-9223371929480593403,-9223371929480593402,-9223371929480593401,-9223371929480593398,-9223371929480593397,-9223371929480593396,-9223371929480593395,-9223371929480593394,-9223371929480593393,-9223371929480593392,-9223371929480593391,-9223371929480593390,-9223371929480593389,-9223371929480593388,-9223371929480593387,-9223371929480593377,-9223371929480593405,-9223371929480593386,-9223371929480593385,-9223371929480593384,-9223371929480593383,-9223371929480593382,-9223371929480593381,-9223371929480593380,-9223371929480593379,-9223371929480593378,-9223371384019746816,-9223371384019746814,-9223371384019746812,-9223371384019746803,-9223371384019746802,-9223371384019746813,-9223371384019746800,-9223371384019746801,-9223371384019746811,-9223371384019746810,-9223371384019746809,-9223371384019746808,-9223371384019746807,-9223371384019746806,-9223371384019746805,-9223371384019746804,-9223371379724779520,-9223371379724779519,-9223371379724779517,-9223371379724779516,-9223371379724779514,-9223371379724779513,-9223371379724779512,-9223371379724779511,-9223371379724779510,-9223371379724779509,-9223371379724779508,-9223371375429812224,-9223371375429812204,-9223371375429812203,-9223371375429812221,-9223371375429812206,-9223371375429812220,-9223371375429812215,-9223371375429812219,-9223371375429812214,-9223371375429812218,-9223371375429812217,-9223371375429812213,-9223371375429812200,-9223371375429812202,-9223371375429812211,-9223371375429812210,-9223371375429812208,-9223371375429812207,-9223371375429812201,-9223371723322163200,-9223371723322163199,-9223371723322163198,-9223371723322163197,-9223371723322163196,-9223371723322163195,-9223371723322163194,-9223371723322163193,-9223371723322163192,-9223371723322163191,-9223371723322163190,-9223371723322163179,-9223371723322163178,-9223371723322163189,-9223371723322163188,-9223371723322163187,-9223371723322163186,-9223371723322163185,-9223371723322163184,-9223371723322163183,-9223371723322163182,-9223371723322163181,-9223371723322163180,-9223371723322163177,-9223371723322163176,-9223371723322163175,-9223371723322163173,-9223371723322163172,-9223371723322163171,-9223371723322163168,-9223371723322163169,-9223371877940985856,-9223371877940985854,-9223371877940985853,-9223371877940985852,-9223371877940985851,-9223371877940985842,-9223371877940985841,-9223371877940985840,-9223371877940985839,-9223371877940985838,-9223371877940985806,-9223371877940985855,-9223371877940985850,-9223371877940985849,-9223371877940985848,-9223371877940985847,-9223371877940985846,-9223371877940985845,-9223371877940985844,-9223371877940985843,-9223371877940985776,-9223371912300724224,-9223371912300724223,-9223371912300724215,-9223371912300724214,-9223371912300724197,-9223371912300724196,-9223371912300724221,-9223371912300724220,-9223371912300724219,-9223371912300724218,-9223371912300724222,-9223371912300724213,-9223371912300724212,-9223371912300724211,-9223371912300724210,-9223371912300724209,-9223371912300724208,-9223371912300724207,-9223371912300724206,-9223370894393475045,-9223370894393475072,-9223370894393475071,-9223370894393475070,-9223371852171182080,-9223371852171182079,-9223371852171182078,-9223371852171182077,-9223371852171182076,-9223371852171182075,-9223371362544910336,-9223371362544910335,-9223371362544910334,-9223371362544910333,-9223371362544910332,-9223371362544910331,-9223371362544910330,-9223371362544910329,-9223371362544910328,-9223371362544910327,-9223371336775106560,-9223371336775106559,-9223371336775106558,-9223371336775106554,-9223371336775106516,-9223371336775106509,-9223371336775106552,-9223371336775106553,-9223371336775106551,-9223371336775106550,-9223371336775106519,-9223371336775106549,-9223371336775106547,-9223371336775106546,-9223371336775106545,-9223371336775106455,-9223371336775106544,-9223371336775106543,-9223371336775106542,-9223371336775106541,-9223371336775106540,-9223371336775106539,-9223371336775106538,-9223371336775106537,-9223371336775106536,-9223371336775106535,-9223371336775106533,-9223371336775106532,-9223371336775106531,-9223371336775106469,-9223371336775106466,-9223371336775106468,-9223371336775106470,-9223371336775106518,-9223371336775106515,-9223371336775106467,-9223371336775106514,-9223371336775106513,-9223371336775106512,-9223371336775106511,-9223371336775106510,-9223371336775106508,-9223371336775106507,-9223371336775106503,-9223371336775106502,-9223371336775106464,-9223371336775106463,-9223371336775106462,-9223371336775106461,-9223371336775106460,-9223371336775106459,-9223371336775106458,-9223371336775106457,-9223371336775106456,-9223371336775106506,-9223371336775106556,-9223371336775106530,-9223371336775106529,-9223371336775106528,-9223371336775106527,-9223371336775106526,-9223371336775106525,-9223371336775106524,-9223371336775106523,-9223370911573344235,-9223370911573344242,-9223370911573344256,-9223370911573344236,-9223370911573344255,-9223370911573344253,-9223370911573344252,-9223370911573344251,-9223370911573344254,-9223370911573344250,-9223370911573344249,-9223370911573344248,-9223370911573344247,-9223370911573344246,-9223370911573344245,-9223370911573344244,-9223370911573344243,-9223371164976414720,-9223371164976414716,-9223371164976414717,-9223371164976414718,-9223371164976414719,-9223371190746218496,-9223371190746218494,-9223371190746218476,-9223371190746218475,-9223371190746218481,-9223371190746218480,-9223371190746218485,-9223371190746218478,-9223371190746218484,-9223371190746218483,-9223371190746218482,-9223371190746218479,-9223371190746218477,-9223371190746218495,-9223371190746218493,-9223371190746218492,-9223371190746218491,-9223371190746218490,-9223371190746218489,-9223371190746218488,-9223371190746218487,-9223371190746218486,-9223371160681447424,-9223371160681447422,-9223371160681447423,-9223371160681447420,-9223371160681447421,-9223371173566349312,-9223371173566349311,-9223371173566349292,-9223371173566349310,-9223371173566349308,-9223371173566349309,-9223371173566349307,-9223371173566349306,-9223371173566349300,-9223371173566349305,-9223371173566349304,-9223371173566349303,-9223371173566349302,-9223371173566349301,-9223371173566349299,-9223371169271382016,-9223371169271382015,-9223371169271382011,-9223371169271382014,-9223371169271382009,-9223371169271382013,-9223371169271382012,-9223371169271382006,-9223371169271382010,-9223371169271381996,-9223371169271381995,-9223371169271381994,-9223371169271381993,-9223371169271381992,-9223371169271381991,-9223371169271381990,-9223371169271381989,-9223371169271381988,-9223371169271382008,-9223371169271382007,-9223371177861316608,-9223371177861316604,-9223371177861316605,-9223371177861316606,-9223371177861316607,-9223371186451251200,-9223371186451251197,-9223371186451251199,-9223371186451251198,-9223371186451251196,-9223371186451251195,-9223371186451251194,-9223371182156283904,-9223371182156283900,-9223371182156283901,-9223371182156283902,-9223371182156283903,-9223370954523017216,-9223370954523017215,-9223370954523017214,-9223370954523017213,-9223370954523017212,-9223370954523017211,-9223370954523017210,-9223370954523017209,-9223370954523017208,-9223370954523017207,-9223370954523017206,-9223370954523017205,-9223370954523017204,-9223370868623671296,-9223370868623671295,-9223370868623671283,-9223370868623671282,-9223370868623671292,-9223370868623671291,-9223370868623671290,-9223370868623671289,-9223370868623671288,-9223370868623671287,-9223370868623671286,-9223370868623671285,-9223370868623671284,-9223370864328704000,-9223370864328703999,-9223370864328703986,-9223370864328703987,-9223370864328703997,-9223370864328703998,-9223370864328703985,-9223370864328703984,-9223370864328703983,-9223370864328703982,-9223370864328703981,-9223370864328703980,-9223370864328703996,-9223370864328703995,-9223370864328703994,-9223370864328703993,-9223370864328703992,-9223370864328703991,-9223370864328703990,-9223370864328703989,-9223370864328703988,-9223371933775560704,-9223371933775560703,-9223371933775560699,-9223371933775560702,-9223371933775560701,-9223371933775560700,-9223371766271836160,-9223371766271836159,-9223371766271836158,-9223371766271836157,-9223371766271836156,-9223371770566803456,-9223371770566803454,-9223371770566803455,-9223371770566803452,-9223371770566803453,-9223371770566803450,-9223371770566803451,-9223371770566803449,-9223371787746672640,-9223371787746672637,-9223371787746672639,-9223371787746672638,-9223371787746672636,-9223371787746672635,-9223371787746672634,-9223371787746672628,-9223371787746672627,-9223371787746672629,-9223371787746672633,-9223371787746672632,-9223371787746672631,-9223371787746672630,-9223371774861770752,-9223371774861770751,-9223371774861770730,-9223371774861770750,-9223371774861770749,-9223371774861770747,-9223371774861770748,-9223371774861770746,-9223371774861770736,-9223371774861770744,-9223371774861770745,-9223371774861770743,-9223371774861770742,-9223371774861770740,-9223371774861770741,-9223371774861770739,-9223371774861770737,-9223371774861770738,-9223371774861770732,-9223371813516476416,-9223371813516476415,-9223371813516476414,-9223371813516476413,-9223371813516476412,-9223371813516476411,-9223371813516476410,-9223371813516476409,-9223371813516476407,-9223371813516476406,-9223371813516476405,-9223371813516476404,-9223371813516476385,-9223371813516476408,-9223371813516476403,-9223371813516476402,-9223371813516476401,-9223371813516476400,-9223371813516476399,-9223371813516476398,-9223371813516476397,-9223371813516476396,-9223371804926541824,-9223371804926541823,-9223371804926541822,-9223371804926541821,-9223371804926541820,-9223371804926541819,-9223371804926541818,-9223371804926541817,-9223371804926541816,-9223371804926541815,-9223371804926541814,-9223371804926541813,-9223371804926541812,-9223371804926541811,-9223371800631574528,-9223371800631574527,-9223371800631574520,-9223371800631574526,-9223371800631574525,-9223371800631574524,-9223371800631574523,-9223371800631574521,-9223371800631574519,-9223371800631574522,-9223371800631574518,-9223371800631574517,-9223371800631574516,-9223371800631574515,-9223371800631574514,-9223371800631574513,-9223371800631574512,-9223371800631574511,-9223371796336607232,-9223371796336607231,-9223371796336607230,-9223371796336607229,-9223371796336607228,-9223371796336607227,-9223371796336607226,-9223371796336607225,-9223371796336607224,-9223371796336607223,-9223371796336607222,-9223371796336607221,-9223371796336607220,-9223371796336607219,-9223371796336607218,-9223371796336607217,-9223371796336607216,-9223371809221509120,-9223371809221509119,-9223371809221509118,-9223371809221509117,-9223371809221509113,-9223371809221509112,-9223371809221509116,-9223371809221509111,-9223371809221509110,-9223371809221509109,-9223371809221509108,-9223371809221509107,-9223371809221509106,-9223371809221509105,-9223371809221509104,-9223371727617130496,-9223371727617130495,-9223371727617130494,-9223371727617130493,-9223371727617130480,-9223371727617130464,-9223371349660008448,-9223371349660008444,-9223371349660008443,-9223371349660008445,-9223371349660008441,-9223371349660008446,-9223371349660008440,-9223371349660008447,-9223371349660008442,-9223371349660008439,-9223371349660008438,-9223371349660008437,-9223371345365041152,-9223371345365041151,-9223371345365041150,-9223371345365041146,-9223371345365041147,-9223371345365041144,-9223371345365041145,-9223371345365041142,-9223371345365041143,-9223371345365041149,-9223371345365041148,-9223371345365041051,-9223371345365041052,-9223371345365041049,-9223371345365041050,-9223371345365041047,-9223371345365041048,-9223371345365041045,-9223371345365041046,-9223371345365041043,-9223371345365041044,-9223371345365041041,-9223371345365041042,-9223371345365041039,-9223371345365041040,-9223371345365041037,-9223371345365041038,-9223371345365041035,-9223371345365041036,-9223371345365041033,-9223371345365041034,-9223371345365041031,-9223371345365041032,-9223371345365041029,-9223371345365041030,-9223371345365041027,-9223371345365041028,-9223371345365041025,-9223371345365041026,-9223371345365041023,-9223371345365041024,-9223371345365041021,-9223371345365041022,-9223371345365041019,-9223371345365041020,-9223371345365041017,-9223371345365041018,-9223371345365041015,-9223371345365041016,-9223371345365041013,-9223371345365041014,-9223371345365041011,-9223371345365041012,-9223371345365041009,-9223371345365041010,-9223371345365041007,-9223371345365041008,-9223371345365041005,-9223371345365041006,-9223371345365041003,-9223371345365041004,-9223371345365041001,-9223371345365041002,-9223371345365040999,-9223371345365041000,-9223371345365040997,-9223371345365040998,-9223371345365040995,-9223371345365040996,-9223371345365040993,-9223371345365040994,-9223371345365040991,-9223371345365040992,-9223371345365040989,-9223371345365040990,-9223371345365040987,-9223371345365040988,-9223371345365040985,-9223371345365040986,-9223371345365040983,-9223371345365040984,-9223371345365040981,-9223371345365040982,-9223371345365040979,-9223371345365040980,-9223371345365040977,-9223371345365040978,-9223371345365040975,-9223371345365040976,-9223371345365040973,-9223371345365040974,-9223371345365040971,-9223371345365040972,-9223371345365040969,-9223371345365040970,-9223371345365040967,-9223371345365040968,-9223371345365040965,-9223371345365040966,-9223371345365040963,-9223371345365040964,-9223371345365040961,-9223371345365040962,-9223371345365040959,-9223371345365040960,-9223371345365040957,-9223371345365040958,-9223371345365040955,-9223371345365040956,-9223371345365040953,-9223371345365040954,-9223371345365040951,-9223371345365040952,-9223371345365040949,-9223371345365040950,-9223371345365040947,-9223371345365040948,-9223371345365040945,-9223371345365040946,-9223371345365040943,-9223371345365040944,-9223371345365040941,-9223371345365040942,-9223371345365040939,-9223371345365040940,-9223371345365040937,-9223371345365040938,-9223371345365040935,-9223371345365040936,-9223371345365040933,-9223371345365040934,-9223371345365040931,-9223371345365040932,-9223371345365040929,-9223371345365040930,-9223371345365040927,-9223371345365040928,-9223371345365040925,-9223371345365040926,-9223371345365040923,-9223371345365040924,-9223371345365040921,-9223371345365040922,-9223371345365040919,-9223371345365040920,-9223371345365040917,-9223371345365040918,-9223371345365040915,-9223371345365040916,-9223371345365040913,-9223371345365040914,-9223371345365040911,-9223371345365040912,-9223371345365040909,-9223371345365040910,-9223371345365040907,-9223371345365040908,-9223371345365040905,-9223371345365040906,-9223371345365040903,-9223371345365040904,-9223371345365040901,-9223371345365040902,-9223371345365040899,-9223371345365040900,-9223371345365040897,-9223371345365040898,-9223371345365040895,-9223371345365040896,-9223371345365040893,-9223371345365040894,-9223371345365040891,-9223371345365040892,-9223371345365040889,-9223371345365040890,-9223371345365040887,-9223371345365040888,-9223371345365040885,-9223371345365040886,-9223371345365040883,-9223371345365040884,-9223371345365040881,-9223371345365040882,-9223371345365040879,-9223371345365040880,-9223371345365040877,-9223371345365040878,-9223371345365040875,-9223371345365040876,-9223371345365040873,-9223371345365040874,-9223371345365040871,-9223371345365040872,-9223371345365040869,-9223371345365040870,-9223371345365040867,-9223371345365040868,-9223371345365040865,-9223371345365040866,-9223371345365040863,-9223371345365040864,-9223371345365040861,-9223371345365040862,-9223371345365040859,-9223371345365040860,-9223371345365040857,-9223371345365040858,-9223371345365040855,-9223371345365040856,-9223371345365040853,-9223371345365040854,-9223371345365040851,-9223371345365040852,-9223371345365040849,-9223371345365040850,-9223371345365040847,-9223371345365040848,-9223371345365040845,-9223371345365040846,-9223371345365040843,-9223371345365040844,-9223371345365040841,-9223371345365040842,-9223371345365040839,-9223371345365040840,-9223371345365040837,-9223371345365040838,-9223371345365040835,-9223371345365040836,-9223371345365040833,-9223371345365040834,-9223371345365040831,-9223371345365040832,-9223371345365040829,-9223371345365040830,-9223371345365040827,-9223371345365040828,-9223371345365040825,-9223371345365040826,-9223371345365040823,-9223371345365040824,-9223371345365040821,-9223371345365040822,-9223371345365040819,-9223371345365040820,-9223371345365040817,-9223371345365040818,-9223371345365040815,-9223371345365040816,-9223371345365040813,-9223371345365040814,-9223371345365040811,-9223371345365040812,-9223371345365040809,-9223371345365040810,-9223371345365040807,-9223371345365040808,-9223371345365040805,-9223371345365040806,-9223371345365040803,-9223371345365040804,-9223371345365040801,-9223371345365040802,-9223371345365040799,-9223371345365040800,-9223371345365040797,-9223371345365040798,-9223371353954975744,-9223371353954975743,-9223371353954975742,-9223371353954975741,-9223371353954975740,-9223371353954975739,-9223371353954975738,-9223371353954975737,-9223371353954975736,-9223371353954975735,-9223371353954975734,-9223371353954975733,-9223371371134844928,-9223371371134844927,-9223371371134844926,-9223371371134844924,-9223371371134844922,-9223371371134844921,-9223371371134844919,-9223371371134844918,-9223371371134844917,-9223371371134844916,-9223371371134844915,-9223371371134844914,-9223371371134844913,-9223371371134844912,-9223371371134844910,-9223371371134844911,-9223371371134844909,-9223371371134844908,-9223371371134844925,-9223371371134844923,-9223371371134844907,-9223371371134844906,-9223371371134844905,-9223371371134844904,-9223371371134844903,-9223371371134844902,-9223371371134844901,-9223371371134844900,-9223371371134844920,-9223371371134844899,-9223371371134844898,-9223371371134844897,-9223371371134844896,-9223371371134844895,-9223371371134844894,-9223371371134844893,-9223371371134844892,-9223371792041639936,-9223371792041639935,-9223371792041639926,-9223371869351051264,-9223371869351051263,-9223371869351051262,-9223371869351051261,-9223371869351051260,-9223371869351051258,-9223371869351051253,-9223371869351051252,-9223371869351051250,-9223371869351051249,-9223371869351051259,-9223371869351051251,-9223371869351051257,-9223371860761116672,-9223371860761116671,-9223371860761116670,-9223371860761116669,-9223371860761116668,-9223371860761116667,-9223371860761116659,-9223371860761116658,-9223371860761116654,-9223371860761116665,-9223371860761116664,-9223371860761116663,-9223371860761116662,-9223371860761116657,-9223371860761116656,-9223371860761116661,-9223371860761116660,-9223371860761116655,-9223371860761116666,-9223371860761116653,-9223371860761116652,-9223371860761116651,-9223371860761116650,-9223371860761116649,-9223371860761116648,-9223371860761116647,-9223371860761116646,-9223371826401378304,-9223371826401378303,-9223371826401378302,-9223371826401378301,-9223371826401378300,-9223371826401378299,-9223371826401378298,-9223371826401378297,-9223371826401378296,-9223371826401378295,-9223371826401378294,-9223371826401378293,-9223371822106411008,-9223371822106411007,-9223371822106411006,-9223371822106411005,-9223371822106411004,-9223371822106411003,-9223371822106411002,-9223371822106411000,-9223371822106411001,-9223371822106410999,-9223371822106410998,-9223371822106410997,-9223371822106410996,-9223371822106410995,-9223371822106410994,-9223371822106410993,-9223371822106410992,-9223371817811443712,-9223371817811443711,-9223371817811443710,-9223371817811443709,-9223371817811443708,-9223371817811443707,-9223371817811443706,-9223371783451705344,-9223371783451705341,-9223371783451705340,-9223371783451705339,-9223371783451705334,-9223371783451705333,-9223371783451705336,-9223371783451705335,-9223371783451705332,-9223371783451705337,-9223371779156738048,-9223371779156738045,-9223371779156738047,-9223371779156738036,-9223371779156738034,-9223371779156738032,-9223371779156738046,-9223371779156738035,-9223371779156738033,-9223371779156738031,-9223371779156738041,-9223371779156738043,-9223371779156738042,-9223371779156738040,-9223371779156738039,-9223371779156738029,-9223371779156738028,-9223371779156738030,-9223371779156738027,-9223371779156738026,-9223371779156738025,-9223371779156738024,-9223371779156738023,-9223371779156738022,-9223371779156738021,-9223371779156738020,-9223371779156738038,-9223371779156738019,-9223371779156738018,-9223371779156738017,-9223371779156738016,-9223371779156738015,-9223371779156738014,-9223371779156738013,-9223371779156738012,-9223371779156738037,-9223371779156738011,-9223371779156738010,-9223371779156738009,-9223371779156738008,-9223371779156738007,-9223371779156738006,-9223371779156738005,-9223371779156738004,-9223371749091966976,-9223371749091966975,-9223371749091966974,-9223371749091966973,-9223371749091966972,-9223371749091966962,-9223371749091966953,-9223371749091966952,-9223371749091966951,-9223371749091966971,-9223371749091966961,-9223371749091966960,-9223371749091966959,-9223371749091966958,-9223371749091966957,-9223371749091966956,-9223371749091966955,-9223371749091966954,-9223371749091966912,-9223371749091966911,-9223371749091966910,-9223371749091966909,-9223371749091966908,-9223371749091966907,-9223371749091966906,-9223371749091966905,-9223371749091966904,-9223371749091966903,-9223371749091966902,-9223371749091966901,-9223371749091966900,-9223371749091966899,-9223371749091966898,-9223371749091966897,-9223371749091966896,-9223371749091966895,-9223371749091966894,-9223371749091966893,-9223371749091966892,-9223371749091966891,-9223371749091966890,-9223371749091966889,-9223371749091966888,-9223371749091966887,-9223371749091966886,-9223371749091966885,-9223371749091966884,-9223371749091966883,-9223371749091966882,-9223371749091966881,-9223371749091966880,-9223371749091966879,-9223371749091966878,-9223371749091966877,-9223371749091966876,-9223371749091966875,-9223371749091966874,-9223371749091966873,-9223371749091966872,-9223371749091966871,-9223371749091966870,-9223371749091966869,-9223371749091966868,-9223371749091966867,-9223371749091966866,-9223371749091966865,-9223371749091966864,-9223371749091966863,-9223371749091966862,-9223371749091966861,-9223371749091966860,-9223371749091966859,-9223371749091966858,-9223371749091966857,-9223371749091966856,-9223371749091966855,-9223371749091966854,-9223371749091966853,-9223371749091966852,-9223371749091966851,-9223371749091966850,-9223371749091966849,-9223371749091966848,-9223371749091966847,-9223371749091966846,-9223371749091966845,-9223371749091966844,-9223371749091966843,-9223371749091966842,-9223371749091966841,-9223371749091966840,-9223371749091966839,-9223371749091966838,-9223371749091966837,-9223371749091966836,-9223371749091966835,-9223371749091966834,-9223371749091966833,-9223371749091966832,-9223371749091966831,-9223371749091966830,-9223371749091966829,-9223371749091966828,-9223371749091966827,-9223371749091966826,-9223371749091966825,-9223371749091966824,-9223371749091966823,-9223371749091966822,-9223371749091966821,-9223371749091966820,-9223371749091966819,-9223371749091966818,-9223371749091966817,-9223371749091966816,-9223371749091966815,-9223371749091966814,-9223371749091966813,-9223371749091966812,-9223371749091966811,-9223371749091966810,-9223371749091966809,-9223371749091966808,-9223371749091966807,-9223371749091966806,-9223371749091966805,-9223371749091966804,-9223371749091966803,-9223371749091966802,-9223371749091966801,-9223371749091966800,-9223371749091966799,-9223371749091966798,-9223371749091966797,-9223371749091966796,-9223371749091966795,-9223371749091966794,-9223371749091966793,-9223371749091966792,-9223371749091966791,-9223371749091966790,-9223371749091966789,-9223371749091966788,-9223371749091966787,-9223371749091966786,-9223371749091966785,-9223371740502032384,-9223371740502032383,-9223371740502032382,-9223371740502032379,-9223371740502032378,-9223371740502032377,-9223371740502032376,-9223371740502032375,-9223371740502032374,-9223371740502032373,-9223371740502032372,-9223371740502032371,-9223371740502032370,-9223371740502032369,-9223371740502032362,-9223371740502032365,-9223371740502032364,-9223371740502032363,-9223371740502032326,-9223371740502032327,-9223371740502032325,-9223371740502032354,-9223371740502032368,-9223371740502032353,-9223371740502032352,-9223371740502032351,-9223371740502032350,-9223371740502032349,-9223371740502032348,-9223371740502032347,-9223371740502032346,-9223371740502032367,-9223371740502032345,-9223371740502032344,-9223371740502032343,-9223371740502032342,-9223371740502032341,-9223371740502032340,-9223371740502032339,-9223371740502032338,-9223371740502032366,-9223371740502032337,-9223371740502032336,-9223371740502032335,-9223371740502032334,-9223371740502032333,-9223371740502032332,-9223371740502032331,-9223371740502032330,-9223371744796999680,-9223371744796999679,-9223371744796999678,-9223371744796999677,-9223371744796999676,-9223371744796999673,-9223371366839877632,-9223371366839877620,-9223371366839877629,-9223371366839877628,-9223371366839877627,-9223371366839877621,-9223371366839877619,-9223371366839877618,-9223371366839877626,-9223371366839877625,-9223371366839877624,-9223371366839877623,-9223371366839877622,-9223371366839877616,-9223371366839877615,-9223371366839877614,-9223371366839877613,-9223371366839877612,-9223371366839877611,-9223371366839877610,-9223371366839877609,-9223371366839877608,-9223371366839877607,-9223371366839877604,-9223371366839877603,-9223371366839877606,-9223371366839877605,-9223371366839877598,-9223371366839877599,-9223371366839877602,-9223371366839877601,-9223371366839877592,-9223371366839877630,-9223371366839877591,-9223371366839877590,-9223371366839877589,-9223371366839877588,-9223371366839877587,-9223371366839877586,-9223371366839877585,-9223371366839877584,-9223371366839877617,-9223371366839877583,-9223371366839877582,-9223371366839877581,-9223371366839877580,-9223371366839877579,-9223371366839877578,-9223371366839877577,-9223371366839877576,-9223371298120400896,-9223371298120400895,-9223371298120400890,-9223371298120400888,-9223371298120400893,-9223371298120400889,-9223371298120400878,-9223371298120400877,-9223371298120400876,-9223371298120400875,-9223371298120400874,-9223371298120400873,-9223371298120400872,-9223371298120400871,-9223371298120400870,-9223371302415368192,-9223371302415368189,-9223371302415368185,-9223371302415368191,-9223371302415368186,-9223371302415368188,-9223371302415368183,-9223371302415368184);
DELETE ae FROM "ua_accesscontrolentries" ae JOIN "ua_accesscontrolrules" ar ON ar."id"=ae."rule_id" JOIN "um_entitytypes" e ON e."id"=ar."entitytype_id" WHERE e."id" >= 2147483647 AND e."id" NOT IN (2147483669,2147483668,2147483694,2147483660,2147483922,2147483923,2147483659,2147483925,2147483693,2147483667,2147483671,2147483680,2147483681,2147483682,2147483683,2147483806,2147483911,2147483662,2147483653,2147483657,2147483656,2147483654,2147483655,2147483658,2147483915,2147483918,2147483912,2147483917,2147483916,2147483924,2147483913,2147483919,2147483926,2147483927,2147483928,2147483812,2147483673,2147483800,2147483801,2147483802,2147483721,2147483685,2147483675,2147483677,2147483676,2147483690,2147483691,2147483805,2147483914,2147483811,2147483851,2147483845,2147483849,2147483850,2147483846,2147483848,2147483852,2147483847,2147483900,2147483920,2147483921,2147483670,2147483672,2147483711,2147483710,2147483706,2147483709,2147483700,2147483702,2147483703,2147483704,2147483701,2147483720,2147483808,2147483809,2147483807,2147483910,2147483803,2147483705,2147483687,2147483689,2147483697,2147483698,2147483699,2147483707,2147483708,2147483715,2147483717,2147483716,2147483819,2147483820,2147483804);
DELETE ar FROM "ua_accesscontrolrules" ar JOIN "um_entitytypes" e ON e."id"=ar."entitytype_id" WHERE e."id" >= 2147483647 AND e."id" NOT IN (2147483669,2147483668,2147483694,2147483660,2147483922,2147483923,2147483659,2147483925,2147483693,2147483667,2147483671,2147483680,2147483681,2147483682,2147483683,2147483806,2147483911,2147483662,2147483653,2147483657,2147483656,2147483654,2147483655,2147483658,2147483915,2147483918,2147483912,2147483917,2147483916,2147483924,2147483913,2147483919,2147483926,2147483927,2147483928,2147483812,2147483673,2147483800,2147483801,2147483802,2147483721,2147483685,2147483675,2147483677,2147483676,2147483690,2147483691,2147483805,2147483914,2147483811,2147483851,2147483845,2147483849,2147483850,2147483846,2147483848,2147483852,2147483847,2147483900,2147483920,2147483921,2147483670,2147483672,2147483711,2147483710,2147483706,2147483709,2147483700,2147483702,2147483703,2147483704,2147483701,2147483720,2147483808,2147483809,2147483807,2147483910,2147483803,2147483705,2147483687,2147483689,2147483697,2147483698,2147483699,2147483707,2147483708,2147483715,2147483717,2147483716,2147483819,2147483820,2147483804);
DELETE "um_entitytypes" WHERE "id" >= 2147483647 AND "id" NOT IN (2147483669,2147483668,2147483694,2147483660,2147483922,2147483923,2147483659,2147483925,2147483693,2147483667,2147483671,2147483680,2147483681,2147483682,2147483683,2147483806,2147483911,2147483662,2147483653,2147483657,2147483656,2147483654,2147483655,2147483658,2147483915,2147483918,2147483912,2147483917,2147483916,2147483924,2147483913,2147483919,2147483926,2147483927,2147483928,2147483812,2147483673,2147483800,2147483801,2147483802,2147483721,2147483685,2147483675,2147483677,2147483676,2147483690,2147483691,2147483805,2147483914,2147483811,2147483851,2147483845,2147483849,2147483850,2147483846,2147483848,2147483852,2147483847,2147483900,2147483920,2147483921,2147483670,2147483672,2147483711,2147483710,2147483706,2147483709,2147483700,2147483702,2147483703,2147483704,2147483701,2147483720,2147483808,2147483809,2147483807,2147483910,2147483803,2147483705,2147483687,2147483689,2147483697,2147483698,2147483699,2147483707,2147483708,2147483715,2147483717,2147483716,2147483819,2147483820,2147483804);
MERGE "um_entitytypes" AS TARGET USING (values(2147483926,'Connection')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "um_entitytypes" AS TARGET USING (values(2147483927,'ConnectionTable')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "um_entitytypes" AS TARGET USING (values(2147483928,'ConnectionColumn')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370855738769395,2147483923,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371886530920417,2147483683,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371989610135543,2147483659,'OwnerType',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370847148834811,2147483925,'OwnerType',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371899415822328,2147483680,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371895120855030,2147483681,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371890825887724,2147483682,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371358249943000,2147483806,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371856466149356,2147483690,'Path',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370907278376948,2147483911,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223372015379939264,2147483653,'OwnerType',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371998200070080,2147483657,'OwnerType',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223372002495037369,2147483656,'ProvisioningReviewFilter',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370877213605871,2147483918,'EntityTypeId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867520,2147483926,'Id',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867519,2147483926,'Identifier',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867516,2147483926,'ConnectorId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867515,2147483926,'Connector',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867514,2147483926,'RefreshDate',4,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867513,2147483926,'Tables',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867517,2147483926,'DisplayName',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867498,2147483926,'DisplayName_L1',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867497,2147483926,'DisplayName_L2',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867496,2147483926,'DisplayName_L3',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867495,2147483926,'DisplayName_L4',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867494,2147483926,'DisplayName_L5',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867493,2147483926,'DisplayName_L6',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867492,2147483926,'DisplayName_L7',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370842853867491,2147483926,'DisplayName_L8',0,-1,-9223370842853867517)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900224,2147483927,'Id',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900223,2147483927,'Identifier',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900220,2147483927,'ConnectionId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900219,2147483927,'Connection',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900221,2147483927,'DisplayName',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900217,2147483927,'Path',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900218,2147483927,'UpdateDate',4,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370838558900216,2147483927,'Columns',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932928,2147483928,'Id',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932927,2147483928,'Identifier',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932924,2147483928,'TableId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932923,2147483928,'Table',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932925,2147483928,'DisplayName',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932921,2147483928,'Path',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932922,2147483928,'UpdateDate',4,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932919,2147483928,'ValueType',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932920,2147483928,'KeyType',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932918,2147483928,'ValueLength',2,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370834263932917,2147483928,'ForeignColumnId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371332480139258,2147483812,'Tasks',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371332480139249,2147483812,'Jobs',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371929480593377,2147483673,'Connections',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371336775106550,2147483811,'OpenIdClient',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344235,2147483910,'Tasks',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344242,2147483910,'OpenIdClient',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344256,2147483910,'Id',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344236,2147483910,'Identifier',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344255,2147483910,'HashedSecret',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344253,2147483910,'ExpirationDate',4,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344252,2147483910,'Profile_Id',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344251,2147483910,'Context_Id',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344254,2147483910,'DisplayName',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344250,2147483910,'DisplayName_L1',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344249,2147483910,'DisplayName_L2',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344248,2147483910,'DisplayName_L3',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344247,2147483910,'DisplayName_L4',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344246,2147483910,'DisplayName_L5',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344245,2147483910,'DisplayName_L6',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344244,2147483910,'DisplayName_L7',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370911573344243,2147483910,'DisplayName_L8',0,-1,-9223370911573344254)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371190746218478,2147483845,'CronTimeZone',2,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371190746218477,2147483845,'IsIncremental',5,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371173566349299,2147483849,'Retry',5,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371774861770730,2147483709,'ChangeSetSummary',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityassociations" AS TARGET USING (values(-9223371929480593377,-9223371929480593377,-9223370842853867515,'Connector.Connections')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");
MERGE "um_entityassociations" AS TARGET USING (values(-9223370842853867513,-9223370842853867513,-9223370838558900219,'Connection.Tables')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");
MERGE "um_entityassociations" AS TARGET USING (values(-9223370838558900216,-9223370838558900216,-9223370834263932923,'ConnectionTable.Columns')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");
MERGE "um_entityassociations" AS TARGET USING (values(-9223370911573344235,-9223370911573344235,-9223371336775106550,'OpenIdClient.Tasks')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");
MERGE "um_entityassociations" AS TARGET USING (values(-9223371332480139258,-9223371332480139258,-9223371336775106553,'Agent.Tasks')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");
MERGE "um_entityassociations" AS TARGET USING (values(-9223371332480139249,-9223371332480139249,-9223371190746218483,'Agent.Jobs')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");
DELETE e FROM "ua_accesscontrolentries" e JOIN "ua_accesscontrolpermissions" p ON p."id"=e."permission_id" WHERE p."identifier" NOT LIKE '/Custom/%'  AND p."id" NOT IN (4611686018427387903,4611686018427388133,4611686018427414503,4611686018427414505,4611686018427414507,4611686018427414504,4611686018427414506,4611686018427415703,4611686018427415704,4611686018427388053,4611686018427404103,4611686018427404105,4611686018427404107,4611686018427404104,4611686018427404106,4611686018427414303,4611686018427414305,4611686018427414307,4611686018427414304,4611686018427414306,4611686018427404003,4611686018427404005,4611686018427404007,4611686018427404004,4611686018427404006,4611686018427387904,4611686018427387905,4611686018427404505,4611686018427404507,4611686018427387906,4611686018427404506,4611686018427390603,4611686018427390605,4611686018427390607,4611686018427390604,4611686018427390606,4611686018427403503,4611686018427403504,4611686018427403303,4611686018427403304,4611686018427387912,4611686018427387911,4611686018427387913,4611686018427387914,4611686018427387915,4611686018427387907,4611686018427387910,4611686018427388033,4611686018427388123,4611686018427388124,4611686018427388125,4611686018427388227,4611686018427388037,4611686018427388042,4611686018427388041,4611686018427388040,4611686018427388039,4611686018427388038,4611686018427388036,4611686018427388034,4611686018427388035,4611686018427388153,4611686018427388226,4611686018427388093,4611686018427388073,4611686018427407803,4611686018427407805,4611686018427407807,4611686018427407804,4611686018427407806,4611686018427408203,4611686018427408205,4611686018427408207,4611686018427408204,4611686018427408206,4611686018427407903,4611686018427407905,4611686018427407907,4611686018427407904,4611686018427407906,4611686018427388144,4611686018427388147,4611686018427388143,4611686018427388148,4611686018427404403,4611686018427404405,4611686018427404407,4611686018427404404,4611686018427404406,4611686018427408503,4611686018427408505,4611686018427408507,4611686018427408504,4611686018427408506,4611686018427408403,4611686018427408405,4611686018427408407,4611686018427408404,4611686018427408406,4611686018427408003,4611686018427408005,4611686018427408007,4611686018427408004,4611686018427408006,4611686018427388146,4611686018427388145,4611686018427408303,4611686018427408305,4611686018427408307,4611686018427408304,4611686018427408306,4611686018427408103,4611686018427408105,4611686018427408107,4611686018427408104,4611686018427408106,4611686018427387933,4611686018427392303,4611686018427392305,4611686018427392307,4611686018427392304,4611686018427392306,4611686018427392403,4611686018427392404,4611686018427391803,4611686018427391805,4611686018427391807,4611686018427391804,4611686018427391806,4611686018427391003,4611686018427391005,4611686018427391007,4611686018427391004,4611686018427391006,4611686018427390903,4611686018427390905,4611686018427390907,4611686018427390904,4611686018427390906,4611686018427390803,4611686018427390805,4611686018427390807,4611686018427390804,4611686018427390806,4611686018427403803,4611686018427403805,4611686018427403807,4611686018427403804,4611686018427403806,4611686018427387953,4611686018427388603,4611686018427388047,4611686018427388605,4611686018427388607,4611686018427388604,4611686018427388606,4611686018427388703,4611686018427388705,4611686018427388707,4611686018427388704,4611686018427388706,4611686018427388803,4611686018427388805,4611686018427388807,4611686018427388804,4611686018427388806,4611686018427388903,4611686018427388049,4611686018427388905,4611686018427388907,4611686018427387956,4611686018427388904,4611686018427388906,4611686018427389003,4611686018427388048,4611686018427389005,4611686018427389007,4611686018427389004,4611686018427389006,4611686018427390103,4611686018427390105,4611686018427390107,4611686018427390104,4611686018427390106,4611686018427392603,4611686018427392605,4611686018427392607,4611686018427392604,4611686018427392606,4611686018427391303,4611686018427391305,4611686018427391307,4611686018427391304,4611686018427391306,4611686018427414803,4611686018427414805,4611686018427414807,4611686018427414804,4611686018427414806,4611686018427389203,4611686018427389204,4611686018427390203,4611686018427390205,4611686018427390207,4611686018427390204,4611686018427390206,4611686018427388043,4611686018427388044,4611686018427387954,4611686018427387955,4611686018427414403,4611686018427414405,4611686018427414407,4611686018427414404,4611686018427414406,4611686018427388051,4611686018427388050,4611686018427391603,4611686018427391605,4611686018427391607,4611686018427391604,4611686018427391606,4611686018427415103,4611686018427415105,4611686018427415107,4611686018427415104,4611686018427415106,4611686018427403903,4611686018427403905,4611686018427403907,4611686018427403904,4611686018427403906,4611686018427390403,4611686018427390405,4611686018427390407,4611686018427390404,4611686018427390406,4611686018427391503,4611686018427391505,4611686018427391507,4611686018427391504,4611686018427391506,4611686018427389303,4611686018427389305,4611686018427389307,4611686018427389304,4611686018427389306,4611686018427390003,4611686018427390005,4611686018427390007,4611686018427390004,4611686018427390006,4611686018427391403,4611686018427391405,4611686018427391407,4611686018427391404,4611686018427391406,4611686018427388113,4611686018427388114,4611686018427388115,4611686018427388116,4611686018427388117,4611686018427413303,4611686018427413305,4611686018427413307,4611686018427413304,4611686018427413306,4611686018427387973,4611686018427390303,4611686018427390305,4611686018427390307,4611686018427390304,4611686018427390306,4611686018427388223,4611686018427415403,4611686018427415404,4611686018427415303,4611686018427415304,4611686018427388224,4611686018427388225,4611686018427388013,4611686018427388026,4611686018427388027,4611686018427388201,4611686018427388202,4611686018427394903,4611686018427394905,4611686018427394907,4611686018427394904,4611686018427394906,4611686018427395003,4611686018427395005,4611686018427395007,4611686018427395004,4611686018427395006,4611686018427394803,4611686018427394805,4611686018427394807,4611686018427394804,4611686018427394806,4611686018427392003,4611686018427392005,4611686018427392007,4611686018427392004,4611686018427392006,4611686018427392203,4611686018427392205,4611686018427392207,4611686018427392204,4611686018427392206,4611686018427393803,4611686018427393804,4611686018427388030,4611686018427388031,4611686018427403603,4611686018427403605,4611686018427403607,4611686018427403604,4611686018427403606,4611686018427403703,4611686018427403705,4611686018427403707,4611686018427403704,4611686018427403706,4611686018427388029,4611686018427388028,4611686018427405203,4611686018427405205,4611686018427405207,4611686018427405204,4611686018427405206,4611686018427405303,4611686018427405305,4611686018427405307,4611686018427405304,4611686018427405306,4611686018427388024,4611686018427388025,4611686018427388014,4611686018427388015,4611686018427388205,4611686018427388204,4611686018427388016,4611686018427388017,4611686018427388032,4611686018427388203,4611686018427394003,4611686018427394005,4611686018427394007,4611686018427394004,4611686018427394006,4611686018427394103,4611686018427394105,4611686018427394107,4611686018427394104,4611686018427394106,4611686018427393103,4611686018427393105,4611686018427393107,4611686018427393104,4611686018427393106,4611686018427393003,4611686018427393004,4611686018427393203,4611686018427393205,4611686018427393207,4611686018427393204,4611686018427393206,4611686018427388018,4611686018427388019,4611686018427388020,4611686018427388021,4611686018427388022,4611686018427388023,4611686018427387993,4611686018427393303,4611686018427393305,4611686018427393307,4611686018427393304,4611686018427393306,4611686018427394203,4611686018427394204,4611686018427393503,4611686018427393504,4611686018427393603,4611686018427393604,4611686018427393703,4611686018427393704,4611686018427388004,4611686018427388005,4611686018427395303,4611686018427395305,4611686018427395307,4611686018427395304,4611686018427395306,4611686018427387997,4611686018427387998,4611686018427388001,4611686018427388002,4611686018427393403,4611686018427393405,4611686018427393407,4611686018427393404,4611686018427393406,4611686018427387994,4611686018427393904,4611686018427387995,4611686018427387996,4611686018427388003,4611686018427387999,4611686018427388000);
DELETE p FROM "ua_accesscontrolpermissions" p WHERE p."identifier" NOT LIKE '/Custom/%'  AND p."id" NOT IN (4611686018427387903,4611686018427388133,4611686018427414503,4611686018427414505,4611686018427414507,4611686018427414504,4611686018427414506,4611686018427415703,4611686018427415704,4611686018427388053,4611686018427404103,4611686018427404105,4611686018427404107,4611686018427404104,4611686018427404106,4611686018427414303,4611686018427414305,4611686018427414307,4611686018427414304,4611686018427414306,4611686018427404003,4611686018427404005,4611686018427404007,4611686018427404004,4611686018427404006,4611686018427387904,4611686018427387905,4611686018427404505,4611686018427404507,4611686018427387906,4611686018427404506,4611686018427390603,4611686018427390605,4611686018427390607,4611686018427390604,4611686018427390606,4611686018427403503,4611686018427403504,4611686018427403303,4611686018427403304,4611686018427387912,4611686018427387911,4611686018427387913,4611686018427387914,4611686018427387915,4611686018427387907,4611686018427387910,4611686018427388033,4611686018427388123,4611686018427388124,4611686018427388125,4611686018427388227,4611686018427388037,4611686018427388042,4611686018427388041,4611686018427388040,4611686018427388039,4611686018427388038,4611686018427388036,4611686018427388034,4611686018427388035,4611686018427388153,4611686018427388226,4611686018427388093,4611686018427388073,4611686018427407803,4611686018427407805,4611686018427407807,4611686018427407804,4611686018427407806,4611686018427408203,4611686018427408205,4611686018427408207,4611686018427408204,4611686018427408206,4611686018427407903,4611686018427407905,4611686018427407907,4611686018427407904,4611686018427407906,4611686018427388144,4611686018427388147,4611686018427388143,4611686018427388148,4611686018427404403,4611686018427404405,4611686018427404407,4611686018427404404,4611686018427404406,4611686018427408503,4611686018427408505,4611686018427408507,4611686018427408504,4611686018427408506,4611686018427408403,4611686018427408405,4611686018427408407,4611686018427408404,4611686018427408406,4611686018427408003,4611686018427408005,4611686018427408007,4611686018427408004,4611686018427408006,4611686018427388146,4611686018427388145,4611686018427408303,4611686018427408305,4611686018427408307,4611686018427408304,4611686018427408306,4611686018427408103,4611686018427408105,4611686018427408107,4611686018427408104,4611686018427408106,4611686018427387933,4611686018427392303,4611686018427392305,4611686018427392307,4611686018427392304,4611686018427392306,4611686018427392403,4611686018427392404,4611686018427391803,4611686018427391805,4611686018427391807,4611686018427391804,4611686018427391806,4611686018427391003,4611686018427391005,4611686018427391007,4611686018427391004,4611686018427391006,4611686018427390903,4611686018427390905,4611686018427390907,4611686018427390904,4611686018427390906,4611686018427390803,4611686018427390805,4611686018427390807,4611686018427390804,4611686018427390806,4611686018427403803,4611686018427403805,4611686018427403807,4611686018427403804,4611686018427403806,4611686018427387953,4611686018427388603,4611686018427388047,4611686018427388605,4611686018427388607,4611686018427388604,4611686018427388606,4611686018427388703,4611686018427388705,4611686018427388707,4611686018427388704,4611686018427388706,4611686018427388803,4611686018427388805,4611686018427388807,4611686018427388804,4611686018427388806,4611686018427388903,4611686018427388049,4611686018427388905,4611686018427388907,4611686018427387956,4611686018427388904,4611686018427388906,4611686018427389003,4611686018427388048,4611686018427389005,4611686018427389007,4611686018427389004,4611686018427389006,4611686018427390103,4611686018427390105,4611686018427390107,4611686018427390104,4611686018427390106,4611686018427392603,4611686018427392605,4611686018427392607,4611686018427392604,4611686018427392606,4611686018427391303,4611686018427391305,4611686018427391307,4611686018427391304,4611686018427391306,4611686018427414803,4611686018427414805,4611686018427414807,4611686018427414804,4611686018427414806,4611686018427389203,4611686018427389204,4611686018427390203,4611686018427390205,4611686018427390207,4611686018427390204,4611686018427390206,4611686018427388043,4611686018427388044,4611686018427387954,4611686018427387955,4611686018427414403,4611686018427414405,4611686018427414407,4611686018427414404,4611686018427414406,4611686018427388051,4611686018427388050,4611686018427391603,4611686018427391605,4611686018427391607,4611686018427391604,4611686018427391606,4611686018427415103,4611686018427415105,4611686018427415107,4611686018427415104,4611686018427415106,4611686018427403903,4611686018427403905,4611686018427403907,4611686018427403904,4611686018427403906,4611686018427390403,4611686018427390405,4611686018427390407,4611686018427390404,4611686018427390406,4611686018427391503,4611686018427391505,4611686018427391507,4611686018427391504,4611686018427391506,4611686018427389303,4611686018427389305,4611686018427389307,4611686018427389304,4611686018427389306,4611686018427390003,4611686018427390005,4611686018427390007,4611686018427390004,4611686018427390006,4611686018427391403,4611686018427391405,4611686018427391407,4611686018427391404,4611686018427391406,4611686018427388113,4611686018427388114,4611686018427388115,4611686018427388116,4611686018427388117,4611686018427413303,4611686018427413305,4611686018427413307,4611686018427413304,4611686018427413306,4611686018427387973,4611686018427390303,4611686018427390305,4611686018427390307,4611686018427390304,4611686018427390306,4611686018427388223,4611686018427415403,4611686018427415404,4611686018427415303,4611686018427415304,4611686018427388224,4611686018427388225,4611686018427388013,4611686018427388026,4611686018427388027,4611686018427388201,4611686018427388202,4611686018427394903,4611686018427394905,4611686018427394907,4611686018427394904,4611686018427394906,4611686018427395003,4611686018427395005,4611686018427395007,4611686018427395004,4611686018427395006,4611686018427394803,4611686018427394805,4611686018427394807,4611686018427394804,4611686018427394806,4611686018427392003,4611686018427392005,4611686018427392007,4611686018427392004,4611686018427392006,4611686018427392203,4611686018427392205,4611686018427392207,4611686018427392204,4611686018427392206,4611686018427393803,4611686018427393804,4611686018427388030,4611686018427388031,4611686018427403603,4611686018427403605,4611686018427403607,4611686018427403604,4611686018427403606,4611686018427403703,4611686018427403705,4611686018427403707,4611686018427403704,4611686018427403706,4611686018427388029,4611686018427388028,4611686018427405203,4611686018427405205,4611686018427405207,4611686018427405204,4611686018427405206,4611686018427405303,4611686018427405305,4611686018427405307,4611686018427405304,4611686018427405306,4611686018427388024,4611686018427388025,4611686018427388014,4611686018427388015,4611686018427388205,4611686018427388204,4611686018427388016,4611686018427388017,4611686018427388032,4611686018427388203,4611686018427394003,4611686018427394005,4611686018427394007,4611686018427394004,4611686018427394006,4611686018427394103,4611686018427394105,4611686018427394107,4611686018427394104,4611686018427394106,4611686018427393103,4611686018427393105,4611686018427393107,4611686018427393104,4611686018427393106,4611686018427393003,4611686018427393004,4611686018427393203,4611686018427393205,4611686018427393207,4611686018427393204,4611686018427393206,4611686018427388018,4611686018427388019,4611686018427388020,4611686018427388021,4611686018427388022,4611686018427388023,4611686018427387993,4611686018427393303,4611686018427393305,4611686018427393307,4611686018427393304,4611686018427393306,4611686018427394203,4611686018427394204,4611686018427393503,4611686018427393504,4611686018427393603,4611686018427393604,4611686018427393703,4611686018427393704,4611686018427388004,4611686018427388005,4611686018427395303,4611686018427395305,4611686018427395307,4611686018427395304,4611686018427395306,4611686018427387997,4611686018427387998,4611686018427388001,4611686018427388002,4611686018427393403,4611686018427393405,4611686018427393407,4611686018427393404,4611686018427393406,4611686018427387994,4611686018427393904,4611686018427387995,4611686018427387996,4611686018427388003,4611686018427387999,4611686018427388000);
MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427404505,'/Connectors/Agent/Create')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427404507,'/Connectors/Agent/Delete')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427404506,'/Connectors/Agent/Update')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427403503,'/Connectors/EntityAssociationMapping')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427403504,'/Connectors/EntityAssociationMapping/Query')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427388004,'/Workflows/HistorizedResourceFileByWorkflowInstanceIdQuery')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427388005,'/Workflows/HistorizedResourceFileByWorkflowInstanceIdQuery/Query')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371787746672626,2147483706,'CurrentActivityInstance',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371774861770729,2147483709,'ActivityInstance_WorkflowInstanceForWhichItIsCurrent',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityassociations" AS TARGET USING (values(-9223371787746672626,-9223371787746672626,-9223371774861770729,'WorkflowInstance.CurrentActivityInstance')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");

MERGE "um_entityproperties" AS TARGET USING (values(-9223370885803540471,2147483916,'OwnerTargetRisk',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371985315168210,2147483660,'RuleItems',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371985315168208,2147483660,'AccessCertificationOwnerFilter',12,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityassociations" AS TARGET USING (values(-9223371985315168208,-9223371985315168208,-9223370885803540471,'Risk.AccessCertificationOwnerFilter')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");

GO


update j
set CronTabExpression = SUBSTRING(CronTabExpression, 3, LEN(CronTabExpression)-2),
CronTimeZone=1
from UJ_Jobs j where CronTabExpression like 'L:%'
GO
