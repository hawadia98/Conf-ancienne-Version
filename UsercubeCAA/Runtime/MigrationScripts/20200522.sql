/* Migration script for v5.1.3 */
/* clean duplicated resourcelinks and orphan assignedresourcescalars/navigations*/ 
/* contexts optimization as there were duplicated in very large quantities */
select min(id) id, d0_id,d1_id,d2_id,d3_id,d4_id,d5_id,d6_id,d7_id,automatic into tmp_up_contexts
from up_contexts
group by d0_id,d1_id,d2_id,d3_id,d4_id,d5_id,d6_id,d7_id,automatic

select c.id old_id,t.id new_id into tmp_up_contexts_ids
from UP_Contexts c
join tmp_up_contexts t
on
(c.d0_id=t.d0_Id or (c.d0_id is null and t.d0_Id is null))
and
(c.d1_id=t.d1_Id or (c.d1_id is null and t.d1_Id is null))
and
(c.d2_id=t.d2_Id or (c.d2_id is null and t.d2_Id is null))
and
(c.d3_id=t.d3_Id or (c.d3_id is null and t.d3_Id is null))
and
(c.d4_id=t.d4_Id or (c.d4_id is null and t.d4_Id is null))
and
(c.d5_id=t.d5_Id or (c.d5_id is null and t.d5_Id is null))
and
(c.d6_id=t.d6_Id or (c.d6_id is null and t.d6_Id is null))
and
(c.d7_id=t.d7_Id or (c.d7_id is null and t.d7_Id is null))
and
c.Automatic=t.Automatic

update a
set parameterscontext_id=c.new_id
from UP_AssignedCompositeRoles a
join tmp_up_contexts_ids c on c.old_id=a.parameterscontext_id

update a
set parameterscontext_id=c.new_id
from UP_AssignedSingleRoles a
join tmp_up_contexts_ids c on c.old_id=a.parameterscontext_id

update a
set parameterscontext_id=c.new_id
from UP_AssignedResourceTypes a
join tmp_up_contexts_ids c on c.old_id=a.parameterscontext_id

delete from up_contexts where id not in (select id from tmp_up_contexts)
GO
drop table tmp_up_contexts
drop table tmp_up_contexts_ids

GO
/* clean duplicated resourcelinks and orphans assignedresourcescalars/navigations*/
WITH cte AS (
    SELECT r1_id,r2_id,type,validto,validfrom,ROW_NUMBER()
    OVER (PARTITION BY r1_id, r2_id,type,validto,validfrom ORDER BY r1_id, r2_id,type,validto,validfrom) row_num
     FROM UR_ResourceLinks
)
DELETE FROM cte
WHERE row_num > 1;


delete a
from UP_AssignedResourceScalars a
left join UP_AssignedResourceTypes art on art.id=a.AssignedResourceType_Id
where art.id is null

delete a
from UP_AssignedResourceNavigations a
left join UP_AssignedResourceTypes art on art.id=a.AssignedResourceType_Id
where art.id is null

GO
/* assignments optimization to cluster everything to the owner */
ALTER TABLE "up_assignedresourcetypes" ADD "OwnerType" BIGINT NULL;
ALTER TABLE "up_assignedresourcescalars" ADD "OwnerType" BIGINT NULL;
ALTER TABLE "up_assignedresourcescalars" ADD Owner_Id BIGINT NULL;
ALTER TABLE "up_assignedresourcenavigations" ADD "OwnerType" BIGINT NULL;
ALTER TABLE "up_assignedresourcenavigations" ADD Owner_Id BIGINT NULL;
GO

update a
set ownertype=rt.SourceEntityType_Id
from UP_AssignedResourcetypes a join UP_ResourceTypes rt on rt.id=a.ResourceType_Id

update a
set a.ownertype=art.ownertype, a.owner_id=art.owner_id
from UP_AssignedResourceScalars a join UP_AssignedResourceTypes art on art.id=a.AssignedResourceType_Id

update a
set a.ownertype=art.ownertype, a.owner_id=art.owner_id
from UP_AssignedResourceNavigations a join UP_AssignedResourceTypes art on art.id=a.AssignedResourceType_Id
GO




GO
PRINT N'Dropping [dbo].[UR_Resources].[IX_Resources_DisplayName]...';


GO
DROP INDEX [IX_Resources_DisplayName]
    ON [dbo].[UR_Resources];


GO
PRINT N'Dropping [dbo].[DF_EntityTypeMappings_MaximumInsertedLines]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [DF_EntityTypeMappings_MaximumInsertedLines];


GO
PRINT N'Dropping [dbo].[DF_EntityTypeMappings_MaximumDeletedLines]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [DF_EntityTypeMappings_MaximumDeletedLines];


GO
PRINT N'Dropping [dbo].[DF_EntityTypeMappings_MaxPercentageUpdatedLines]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [DF_EntityTypeMappings_MaxPercentageUpdatedLines];


GO
PRINT N'Dropping [dbo].[DF_EntityTypeMappings_MaximumUpdatedLines]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [DF_EntityTypeMappings_MaximumUpdatedLines];


GO
PRINT N'Dropping [dbo].[DF_EntityTypeMappings_MaxPercentageDeletedLines]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [DF_EntityTypeMappings_MaxPercentageDeletedLines];


GO
PRINT N'Dropping [dbo].[DF_EntityTypeMappings_MaxPercentageInsertedLines]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [DF_EntityTypeMappings_MaxPercentageInsertedLines];


GO
PRINT N'Dropping [dbo].[DF_ScaffoldingArguments_ScafolldingArgumentType]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [DF_ScaffoldingArguments_ScafolldingArgumentType];


GO
PRINT N'Dropping [dbo].[DF_Scaffoldings_Generator]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [DF_Scaffoldings_Generator];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_IsInduced]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_IsInduced];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedCompositeRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [DF_AssignedCompositeRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_ProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_ProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_ConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_ConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceNavigations_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [DF_AssignedResourceNavigations_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_ProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_ProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceScalars_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [DF_AssignedResourceScalars_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeCountError]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeCountError];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ResourceTypeIdentificationConfidenceLevel]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ResourceTypeIdentificationConfidenceLevel];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_IsInduced]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_IsInduced];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowFoundState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedCount]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedCount];


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
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_NeedsPolicyApplication]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_NeedsPolicyApplication];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowReviewCount]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewCount];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowReviewState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowReviewState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ConsolidatedWorkflowFoundCount]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ConsolidatedWorkflowFoundCount];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_ManualProvisioningState]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_ManualProvisioningState];


GO
PRINT N'Dropping [dbo].[DF_AssignedResourceTypes_HasPendingOrders]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [DF_AssignedResourceTypes_HasPendingOrders];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_WhenCreated]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_WhenCreated];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_IsInduced]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_IsInduced];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_StartDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_StartDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_WorkflowState];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_EndDate]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_EndDate];


GO
PRINT N'Dropping [dbo].[DF_AssignedSingleRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [DF_AssignedSingleRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RH]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RH];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P39]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P39];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P28]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P28];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P29]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P29];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R9]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R9];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R8]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R8];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R15]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R15];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R14]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R14];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PU]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PU];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PV]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PV];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R13]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R13];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PT]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PT];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RD]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RD];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R25]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R25];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RE]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RE];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RC]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RC];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R37]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R37];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P30]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P30];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R36]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R36];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P20]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P20];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R26]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R26];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P31]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P31];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P19]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P19];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PC]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PC];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RI]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RI];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PB]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PB];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RJ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RJ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P34]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P34];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R29]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R29];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P23]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P23];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P35]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P35];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P24]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P24];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R32]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R32];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R33]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R33];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P37]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P37];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P36]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P36];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_HideOnSimplifiedView]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_HideOnSimplifiedView];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P38]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P38];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PA]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PA];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RG]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RG];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R27]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R27];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R28]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R28];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P21]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P21];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P9]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P9];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RF]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RF];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P8]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P8];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R35]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R35];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R34]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R34];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P18]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P18];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P22]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P22];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P17]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P17];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R20]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R20];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R21]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R21];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R22]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R22];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PI]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PI];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RP]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RP];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PJ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PJ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RO]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RO];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RN]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RN];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PH]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PH];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PG]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PG];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P14]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P14];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P12]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P12];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R19]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R19];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P13]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P13];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R18]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R18];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PO]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PO];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RV]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RV];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PP]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PP];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RU]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RU];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RT]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RT];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PN]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PN];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R10]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R10];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PQ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PQ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R23]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R23];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R30]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R30];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R24]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R24];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PE]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PE];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RK]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RK];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PF]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PF];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RL]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RL];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RM]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RM];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P15]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P15];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P16]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P16];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R31]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R31];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RQ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RQ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PK]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PK];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RS]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RS];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PL]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PL];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RR]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RR];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PM]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PM];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P11]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P11];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R17]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R17];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P10]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P10];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R16]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R16];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RB]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RB];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RA]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RA];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R39]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R39];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P32]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P32];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P33]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P33];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PR]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PR];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R12]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R12];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R11]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R11];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R38]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R38];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PS]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PS];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PD]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PD];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P26]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P26];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P27]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P27];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P25]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P25];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R8]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R8];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R20]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R20];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R21]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R21];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R16]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R16];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P10]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P10];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R17]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R17];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P11]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P11];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P23]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P23];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R29]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R29];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P24]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P24];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_DiscardManualAssignments]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_DiscardManualAssignments];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P25]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P25];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R36]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R36];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P30]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P30];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R35]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R35];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_HideOnSimplifiedView]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_HideOnSimplifiedView];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PI]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PI];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PG]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PG];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RM]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RM];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RO]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RO];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PH]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PH];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RN]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RN];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R11]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R11];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PR]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PR];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R13]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R13];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PT]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PT];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R12]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R12];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PS]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PS];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P28]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P28];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P27]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P27];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P29]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P29];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RF]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RF];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P9]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P9];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RG]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RG];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PA]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PA];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PC]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PC];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RI]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RI];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RH]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RH];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PB]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PB];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P26]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P26];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumInsertPercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumInsertPercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumUpdate]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumUpdate];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RR]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RR];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PL]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PL];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R30]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R30];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RP]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RP];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PK]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PK];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P14]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P14];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P15]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P15];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R31]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R31];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R24]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R24];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R25]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R25];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P34]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P34];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P35]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P35];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RU]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RU];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PO]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PO];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RV]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RV];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PP]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PP];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R10]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R10];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P19]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P19];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RL]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RL];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PF]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PF];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P39]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P39];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PE]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PE];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RK]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RK];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PD]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PD];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R14]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R14];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PU]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PU];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R15]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R15];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PV]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PV];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RE]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RE];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P8]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P8];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RC]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RC];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P6];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RD]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RD];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_AllowAdd]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_AllowAdd];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumUpdatePercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumUpdatePercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R6];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumDeletePercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumDeletePercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R19]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R19];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P13]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P13];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R18]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R18];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P12]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P12];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R23]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R23];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R34]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R34];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R33]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R33];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R22]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R22];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P18]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P18];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P17]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P17];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R32]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R32];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P16]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P16];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RB]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RB];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RA]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RA];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumInsert]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumInsert];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumDelete]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumDelete];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RS]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RS];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PM]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PM];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P20]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P20];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R26]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R26];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RT]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RT];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PN]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PN];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P37]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P37];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P38]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P38];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P36]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P36];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R37]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R37];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P31]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P31];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R28]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R28];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P22]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P22];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R27]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R27];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P21]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P21];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R38]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R38];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P32]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P32];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R39]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R39];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P33]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P33];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_AllowRemove]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_AllowRemove];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_BlockProvisioning]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_BlockProvisioning];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R9]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R9];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RemoveOrphans]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RemoveOrphans];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P38]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P38];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P37]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P37];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RQ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RQ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PJ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PJ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RP]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RP];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P36]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P36];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P32]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P32];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R38]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R38];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R39]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R39];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P33]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P33];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R33]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R33];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R37]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R37];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R34]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R34];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P31]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P31];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R32]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R32];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P29]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P29];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P28]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P28];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P17]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P18]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P18];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PT]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PT];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R14]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R14];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PU]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PU];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R25]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R25];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R15]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R15];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PV]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PV];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P8]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P8];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R26]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R26];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RF]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RF];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P9]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P9];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RG]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RG];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RJ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RJ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PD]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PD];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P23]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P23];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R29]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R29];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RL]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RL];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RK]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RK];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PE]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PE];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R18]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R18];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P12]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P12];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P24]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P24];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R19]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R19];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P13]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P13];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R21]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R21];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R22]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R22];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P20]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P20];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R28]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R28];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P21]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P21];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R27]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R27];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PB]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PB];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RH]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RH];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P22]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P22];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PA]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PA];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RI]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RI];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PC]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PC];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P39]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P39];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PN]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PN];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PK]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PK];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P16]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P16];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P14]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P14];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P15]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P15];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PL]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PL];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RR]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RR];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RT]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RT];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PM]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PM];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RS]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RS];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_HideOnSimplifiedView]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_HideOnSimplifiedView];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R20]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R20];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PG]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PG];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RN]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RN];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PH]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PH];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RM]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RM];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PF]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PF];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RC]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RC];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R35]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R35];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RA]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RA];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RB]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RB];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PR]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PR];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R11]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R11];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R12]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R12];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R36]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R36];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P30]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P30];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PS]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PS];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R13]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R13];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PI]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PI];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RO]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RO];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R9]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R9];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R8]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R8];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R10]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R10];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RV]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RV];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PP]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PP];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PQ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PQ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R16]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R16];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P10]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P10];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P11]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P11];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R17]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R24]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R24];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R23]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R23];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PO]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PO];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RU]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RU];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RE]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RE];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RD]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RD];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P35]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P35];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P25]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P25];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P26]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P26];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R31]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R31];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R30]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R30];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P27]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P27];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P34]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P34];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P19]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P19];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_IsProperty1Collection]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_IsProperty1Collection];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_IsProperty2Collection]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_IsProperty2Collection];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_EntityAssociations_ValidFrom]...';


GO
ALTER TABLE [dbo].[UM_EntityAssociations] DROP CONSTRAINT [DF_EntityAssociations_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_ValidFrom]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_Type]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_Type];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_TargetColumnIndex]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_TargetColumnIndex];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_HistoryPrecision]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_HistoryPrecision];


GO
PRINT N'Dropping [dbo].[DF_EntityProperties_IsKey]...';


GO
ALTER TABLE [dbo].[UM_EntityProperties] DROP CONSTRAINT [DF_EntityProperties_IsKey];


GO
PRINT N'Dropping [dbo].[DF_EntityTypes_ValidFrom]...';


GO
ALTER TABLE [dbo].[UM_EntityTypes] DROP CONSTRAINT [DF_EntityTypes_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_EntityTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UM_EntityTypes] DROP CONSTRAINT [DF_EntityTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsExternal]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsExternal];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsSimumationEnabled]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsSimumationEnabled];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsProvisioningEnabled]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsProvisioningEnabled];


GO
PRINT N'Dropping [dbo].[DF_Policies_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Policies_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_Risks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [DF_Risks_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Risks_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [DF_Risks_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_Risks_Level]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [DF_Risks_Level];


GO
PRINT N'Dropping [dbo].[DF_Risks_IsBlocking]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [DF_Risks_IsBlocking];


GO
PRINT N'Dropping [dbo].[DF_Risks_RiskType]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [DF_Risks_RiskType];


GO
PRINT N'Dropping [dbo].[DF_ResourceFiles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [DF_ResourceFiles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_ResourceFiles_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [DF_ResourceFiles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceLinks_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] DROP CONSTRAINT [DF_ResourceLinks_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceLinks_ValidFrom]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] DROP CONSTRAINT [DF_ResourceLinks_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_Resources_ValidFrom]...';


GO
ALTER TABLE [dbo].[UR_Resources] DROP CONSTRAINT [DF_Resources_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_Resources_ValidTo]...';


GO
ALTER TABLE [dbo].[UR_Resources] DROP CONSTRAINT [DF_Resources_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Resources_Dirty]...';


GO
ALTER TABLE [dbo].[UR_Resources] DROP CONSTRAINT [DF_Resources_Dirty];


GO
PRINT N'Dropping [dbo].[DF_IdentifiedRisks_StartDate]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [DF_IdentifiedRisks_StartDate];


GO
PRINT N'Dropping [dbo].[DF_IdentifiedRisks_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [DF_IdentifiedRisks_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_IdentifiedRisks_EndDate]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [DF_IdentifiedRisks_EndDate];


GO
PRINT N'Dropping [dbo].[DF_IdentifiedRisks_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [DF_IdentifiedRisks_ValidTo];


GO
PRINT N'Dropping [dbo].[FK_EntityTypeMappings_EntityType]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [FK_EntityTypeMappings_EntityType];


GO
PRINT N'Dropping [dbo].[FK_EntityTypeMappings_Connector]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] DROP CONSTRAINT [FK_EntityTypeMappings_Connector];


GO
PRINT N'Dropping [dbo].[FK_ScaffoldingArguments_Scaffolding]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [FK_ScaffoldingArguments_Scaffolding];


GO
PRINT N'Dropping [dbo].[FK_Scaffolding_EntityType]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_Scaffolding_EntityType];


GO
PRINT N'Dropping [dbo].[FK_Scaffolding_Profile]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_Scaffolding_Profile];


GO
PRINT N'Dropping [dbo].[FK_Scaffolding_Property]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_Scaffolding_Property];


GO
PRINT N'Dropping [dbo].[FK_Scaffolding_Connector]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_Scaffolding_Connector];


GO
PRINT N'Dropping [dbo].[FK_Scaffolding_Agent]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_Scaffolding_Agent];


GO
PRINT N'Dropping [dbo].[FK_Scaffolding_Workflow]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_Scaffolding_Workflow];


GO
PRINT N'Dropping [dbo].[FK_Scaffolding_Universe]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] DROP CONSTRAINT [FK_Scaffolding_Universe];


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
PRINT N'Dropping [dbo].[FK_AssignedResourceNavigations_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [FK_AssignedResourceNavigations_Property];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceNavigations_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] DROP CONSTRAINT [FK_AssignedResourceNavigations_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceScalars_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [FK_AssignedResourceScalars_Property];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceScalars_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] DROP CONSTRAINT [FK_AssignedResourceScalars_WorkflowInstance];


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
PRINT N'Dropping [dbo].[FK_CompositeRolesCategories_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] DROP CONSTRAINT [FK_CompositeRolesCategories_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_CompositeRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_Policy];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_Category];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_ResourceType]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ProfileRuleContexts_ResourceType_Id]...';


GO
ALTER TABLE [dbo].[UA_ProfileRuleContexts] DROP CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_TaskResourceTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskResourceTypes] DROP CONSTRAINT [FK_TaskResourceTypes_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypesCategories_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] DROP CONSTRAINT [FK_ResourceTypesCategories_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_AccessCertificationDataFilters_ResourceType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters] DROP CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_SourceEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_SourceEntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_TargetEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_TargetEntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_Category];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_ContextRule]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_ContextRule];


GO
PRINT N'Dropping [dbo].[FK_EntityInstances_FilterResourceType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] DROP CONSTRAINT [FK_EntityInstances_FilterResourceType];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_SingleRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_SingleRole0];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Role];


GO
PRINT N'Dropping [dbo].[FK_SingleRolesCategories_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRolesCategories] DROP CONSTRAINT [FK_SingleRolesCategories_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_Policy];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_Category];


GO
PRINT N'Dropping [dbo].[FK_AssociationInstances_Association]...';


GO
ALTER TABLE [dbo].[UU_AssociationInstances] DROP CONSTRAINT [FK_AssociationInstances_Association];


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
PRINT N'Dropping [dbo].[FK_DisplayEntityAssociations_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] DROP CONSTRAINT [FK_DisplayEntityAssociations_EntityAssociation];


GO
PRINT N'Dropping [dbo].[FK_ResourceLinks_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] DROP CONSTRAINT [FK_ResourceLinks_Type];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyMappings_EntityProperty]...';


GO
ALTER TABLE [dbo].[UC_EntityPropertyMappings] DROP CONSTRAINT [FK_EntityPropertyMappings_EntityProperty];


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
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_DenialProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_DenialProperty];


GO
PRINT N'Dropping [dbo].[FK_RecordProperties_Property_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordProperties] DROP CONSTRAINT [FK_RecordProperties_Property_Id];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Property];


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
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Property];


GO
PRINT N'Dropping [dbo].[FK_Changes_Property]...';


GO
ALTER TABLE [dbo].[UW_Changes] DROP CONSTRAINT [FK_Changes_Property];


GO
PRINT N'Dropping [dbo].[FK_BindingItems_Property]...';


GO
ALTER TABLE [dbo].[UM_BindingItems] DROP CONSTRAINT [FK_BindingItems_Property];


GO
PRINT N'Dropping [dbo].[FK_Dimensions_ParentProperty]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] DROP CONSTRAINT [FK_Dimensions_ParentProperty];


GO
PRINT N'Dropping [dbo].[FK_Dimensions_PathProperty]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] DROP CONSTRAINT [FK_Dimensions_PathProperty];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_Property]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_Property];


GO
PRINT N'Dropping [dbo].[FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] DROP CONSTRAINT [FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyExpressions_Property]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] DROP CONSTRAINT [FK_EntityPropertyExpressions_Property];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyExpressions_PropertyCriteria]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] DROP CONSTRAINT [FK_EntityPropertyExpressions_PropertyCriteria];


GO
PRINT N'Dropping [dbo].[FK_DisplayEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityProperties] DROP CONSTRAINT [FK_DisplayEntityProperties_EntityProperty];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_StartProperty_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_StartProperty_Id];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_EndProperty_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_EndProperty_Id];


GO
PRINT N'Dropping [dbo].[FK_EntityInstances_FilterProperty]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] DROP CONSTRAINT [FK_EntityInstances_FilterProperty];


GO
PRINT N'Dropping [dbo].[FK_EntityInstances_FilterEntityProperty]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] DROP CONSTRAINT [FK_EntityInstances_FilterEntityProperty];


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
PRINT N'Dropping [dbo].[FK_ResourceFiles_Property]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] DROP CONSTRAINT [FK_ResourceFiles_Property];


GO
PRINT N'Dropping [dbo].[FK_AccessControlEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UA_AccessControlEntityProperties] DROP CONSTRAINT [FK_AccessControlEntityProperties_EntityProperty];


GO
PRINT N'Dropping [dbo].[FK_WorkflowInstances_Type]...';


GO
ALTER TABLE [dbo].[UW_WorkflowInstances] DROP CONSTRAINT [FK_WorkflowInstances_Type];


GO
PRINT N'Dropping [dbo].[FK_SearchBars_EntityType]...';


GO
ALTER TABLE [dbo].[UI_SearchBars] DROP CONSTRAINT [FK_SearchBars_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SearchBars_SearchedEntityType]...';


GO
ALTER TABLE [dbo].[UI_SearchBars] DROP CONSTRAINT [FK_SearchBars_SearchedEntityType];


GO
PRINT N'Dropping [dbo].[FK_FormControls_EntityType]...';


GO
ALTER TABLE [dbo].[UI_FormControls] DROP CONSTRAINT [FK_FormControls_EntityType];


GO
PRINT N'Dropping [dbo].[FK_AccessControlRules_EntityType]...';


GO
ALTER TABLE [dbo].[UA_AccessControlRules] DROP CONSTRAINT [FK_AccessControlRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_DisplayTables_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayTables] DROP CONSTRAINT [FK_DisplayTables_EntityType];


GO
PRINT N'Dropping [dbo].[FK_TaskEntityTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskEntityTypes] DROP CONSTRAINT [FK_TaskEntityTypes_EntityType];


GO
PRINT N'Dropping [dbo].[FK_Tiles_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Tiles] DROP CONSTRAINT [FK_Tiles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_DisplayEntityTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityTypes] DROP CONSTRAINT [FK_DisplayEntityTypes_EntityType];


GO
PRINT N'Dropping [dbo].[FK_MenuItems_EntityType]...';


GO
ALTER TABLE [dbo].[UI_MenuItems] DROP CONSTRAINT [FK_MenuItems_EntityType];


GO
PRINT N'Dropping [dbo].[FK_Notifications_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[UN_Notifications] DROP CONSTRAINT [FK_Notifications_OwnerEntityType];


GO
PRINT N'Dropping [dbo].[FK_Dimensions_EntityType]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] DROP CONSTRAINT [FK_Dimensions_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_SourceEntityTypes]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_SourceEntityTypes];


GO
PRINT N'Dropping [dbo].[FK_Risks_EntityType]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [FK_Risks_EntityType];


GO
PRINT N'Dropping [dbo].[FK_EntityPropertyExpressions_EntityType]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] DROP CONSTRAINT [FK_EntityPropertyExpressions_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ReportQueries_EntityType]...';


GO
ALTER TABLE [dbo].[UQ_ReportQueries] DROP CONSTRAINT [FK_ReportQueries_EntityType];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_SourceEntityType_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_SourceEntityType_Id];


GO
PRINT N'Dropping [dbo].[FK_RecordSections_ResourceEntityType_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordSections] DROP CONSTRAINT [FK_RecordSections_ResourceEntityType_Id];


GO
PRINT N'Dropping [dbo].[FK_ResourceChanges_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceChanges] DROP CONSTRAINT [FK_ResourceChanges_Type];


GO
PRINT N'Dropping [dbo].[FK_Resources_Type]...';


GO
ALTER TABLE [dbo].[UR_Resources] DROP CONSTRAINT [FK_Resources_Type];


GO
PRINT N'Dropping [dbo].[FK_AccessCertificationCampaigns_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationCampaigns] DROP CONSTRAINT [FK_AccessCertificationCampaigns_OwnerEntityType];


GO
PRINT N'Dropping [dbo].[FK_EntityInstances_EntityType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] DROP CONSTRAINT [FK_EntityInstances_EntityType];


GO
PRINT N'Dropping [dbo].[FK_EntityInstances_FilterEntityType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] DROP CONSTRAINT [FK_EntityInstances_FilterEntityType];


GO
PRINT N'Dropping [dbo].[FK_Forms_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Forms] DROP CONSTRAINT [FK_Forms_EntityType];


GO
PRINT N'Dropping [dbo].[FK_RoleCounters_EntityType]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] DROP CONSTRAINT [FK_RoleCounters_EntityType];


GO
PRINT N'Dropping [dbo].[FK_HomonymWorkflowLinks_FormEntityType]...';


GO
ALTER TABLE [dbo].[UW_HomonymEntityLinks] DROP CONSTRAINT [FK_HomonymWorkflowLinks_FormEntityType];


GO
PRINT N'Dropping [dbo].[FK_Workflows_VariablesType]...';


GO
ALTER TABLE [dbo].[UW_Workflows] DROP CONSTRAINT [FK_Workflows_VariablesType];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_Categories_Policy]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [FK_Categories_Policy];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_Risks_Policy]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [FK_Risks_Policy];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_RiskRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] DROP CONSTRAINT [FK_RiskRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_RoleCounters_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] DROP CONSTRAINT [FK_RoleCounters_Policy];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_Risk]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_Risk];


GO
PRINT N'Dropping [dbo].[FK_RiskRules_Risk]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] DROP CONSTRAINT [FK_RiskRules_Risk];


GO
PRINT N'Dropping [dbo].[FK_IdentifiedRisks_Risk]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [FK_IdentifiedRisks_Risk];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceErrors_JobInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors] DROP CONSTRAINT [FK_AssignedResourceErrors_JobInstance];


GO
PRINT N'Dropping [dbo].[FK_IdentifiedRisks_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [FK_IdentifiedRisks_WorkflowInstance];


GO
PRINT N'Dropping [dbo].[PK_IdentifiedRisks]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] DROP CONSTRAINT [PK_IdentifiedRisks];


GO
PRINT N'Altering [dbo].[UC_EntityAssociationMappings]...';


GO
ALTER TABLE [dbo].[UC_EntityAssociationMappings]
    ADD [DataSourceName]        NVARCHAR (442) NULL,
        [DataSourceIsEncrypted] BIT            CONSTRAINT [DF_EntityAssociationMappings_DataSourceIsEncrypted] DEFAULT ((1)) NOT NULL;

GO
PRINT N'Altering [dbo].[US_AccessCertificationOwnerFilters]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationOwnerFilters]
    ADD [OwnerLastModificationDate]           SMALLDATETIME NULL,
        [OwnerLastModificationDateBinding_Id] BIGINT        NULL;


GO
PRINT N'Creating [dbo].[FK_AccessCertificationOwnerFilters_EntityProperty]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationOwnerFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationOwnerFilters_EntityProperty] FOREIGN KEY ([OwnerLastModificationDateBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [dbo].[US_AccessCertificationOwnerFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationOwnerFilters_EntityProperty];



GO
PRINT N'Starting rebuilding table [dbo].[UC_EntityTypeMappings]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UC_EntityTypeMappings] (
    [Id]                         BIGINT         NOT NULL,
    [MaximumInsertedLines]       INT            CONSTRAINT [DF_EntityTypeMappings_MaximumInsertedLines] DEFAULT ((0)) NOT NULL,
    [MaximumDeletedLines]        INT            CONSTRAINT [DF_EntityTypeMappings_MaximumDeletedLines] DEFAULT ((0)) NOT NULL,
    [MaximumUpdatedLines]        INT            CONSTRAINT [DF_EntityTypeMappings_MaximumUpdatedLines] DEFAULT ((0)) NOT NULL,
    [MaxPercentageInsertedLines] INT            CONSTRAINT [DF_EntityTypeMappings_MaxPercentageInsertedLines] DEFAULT ((0)) NOT NULL,
    [MaxPercentageDeletedLines]  INT            CONSTRAINT [DF_EntityTypeMappings_MaxPercentageDeletedLines] DEFAULT ((0)) NOT NULL,
    [MaxPercentageUpdatedLines]  INT            CONSTRAINT [DF_EntityTypeMappings_MaxPercentageUpdatedLines] DEFAULT ((0)) NOT NULL,
    [DataSourceIsEncrypted]      BIT            CONSTRAINT [DF_EntityTypeMappings_DataSourceIsEncrypted] DEFAULT ((1)) NOT NULL,
    [Connector_Id]               BIGINT         NULL,
    [DataSource]                 NVARCHAR (442) NULL,
    [FileEncoding]               NVARCHAR (25)  NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_EntityTypeMappings1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UC_EntityTypeMappings])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UC_EntityTypeMappings] ([Id], [MaximumInsertedLines], [MaximumDeletedLines], [MaximumUpdatedLines], [MaxPercentageInsertedLines], [MaxPercentageDeletedLines], [MaxPercentageUpdatedLines], [Connector_Id], [DataSource], [FileEncoding])
        SELECT   [Id],
                 [MaximumInsertedLines],
                 [MaximumDeletedLines],
                 [MaximumUpdatedLines],
                 [MaxPercentageInsertedLines],
                 [MaxPercentageDeletedLines],
                 [MaxPercentageUpdatedLines],
                 [Connector_Id],
                 [DataSource],
                 [FileEncoding]
        FROM     [dbo].[UC_EntityTypeMappings]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UC_EntityTypeMappings];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UC_EntityTypeMappings]', N'UC_EntityTypeMappings';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_EntityTypeMappings1]', N'PK_EntityTypeMappings', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UC_ResourceTypeMappings]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings]
    ADD [FulfillmentType]             INT            CONSTRAINT [DF_ResourceTypeMappings_FulfillmentType] DEFAULT ((0)) NOT NULL,
        [InformationSystemIdentifier] NVARCHAR (442) NULL;


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
    [FilesAreEncrypted]       BIT            CONSTRAINT [DF_ScaffoldingArguments_FileAreEncrypted] DEFAULT ((1)) NOT NULL,
    [CopyOccurence]           INT            NULL,
    [SearchBarPage]           INT            NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ScaffoldingArguments1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_ScaffoldingArguments_Identifier1] UNIQUE NONCLUSTERED ([Scaffolding_Id] ASC, [Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UD_ScaffoldingArguments])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UD_ScaffoldingArguments] ([Id], [Identifier], [Scaffolding_Id], [Value], [Order], [ConnectorIdentifier], [TaskIdentifier], [ScaffoldingArgumentType], [Before], [After], [CopyOccurence], [SearchBarPage])
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
                 [SearchBarPage]
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
PRINT N'Starting rebuilding table [dbo].[UD_Scaffoldings]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UD_Scaffoldings] (
    [Id]                   BIGINT         NOT NULL,
    [Identifier]           VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [Generator]            INT            CONSTRAINT [DF_Scaffoldings_Generator] DEFAULT ((0)) NOT NULL,
    [EntityType_Id]        BIGINT         NULL,
    [Profile_Id]           BIGINT         NULL,
    [Property_Id]          BIGINT         NULL,
    [Connector_Id]         BIGINT         NULL,
    [Workflow_Id]          BIGINT         NULL,
    [Agent_Id]             BIGINT         NULL,
    [Universe_Id]          BIGINT         NULL,
    [JobIdentifier]        NVARCHAR (442) NULL,
    [FilesAreNotEncrypted] BIT            CONSTRAINT [DF_Scaffolding_FileAreEncrypted] DEFAULT ((0)) NOT NULL,
    [DisplayName_L1]       NVARCHAR (442) NULL,
    [DisplayName_L2]       NVARCHAR (442) NULL,
    [DisplayName_L3]       NVARCHAR (442) NULL,
    [DisplayName_L4]       NVARCHAR (442) NULL,
    [DisplayName_L5]       NVARCHAR (442) NULL,
    [DisplayName_L6]       NVARCHAR (442) NULL,
    [DisplayName_L7]       NVARCHAR (442) NULL,
    [DisplayName_L8]       NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Scaffoldings1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Scaffoldings_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UD_Scaffoldings])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UD_Scaffoldings] ([Id], [Identifier], [Generator], [EntityType_Id], [Profile_Id], [Property_Id], [Connector_Id], [Workflow_Id], [Agent_Id], [Universe_Id], [JobIdentifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8])
        SELECT   [Id],
                 [Identifier],
                 [Generator],
                 [EntityType_Id],
                 [Profile_Id],
                 [Property_Id],
                 [Connector_Id],
                 [Workflow_Id],
                 [Agent_Id],
                 [Universe_Id],
                 [JobIdentifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8]
        FROM     [dbo].[UD_Scaffoldings]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UD_Scaffoldings];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UD_Scaffoldings]', N'UD_Scaffoldings';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Scaffoldings1]', N'PK_Scaffoldings', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Scaffoldings_Identifier1]', N'U_Scaffoldings_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UI_DisplayEntityProperties]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityProperties]
    ADD [AutocompleteBinding_Id] BIGINT NULL,
        [MinSearchLength]        INT    NULL;


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
    [ValidFrom]            DATETIME2 (2)  CONSTRAINT [DF_AssignedCompositeRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]              DATETIME2 (2)  CONSTRAINT [DF_AssignedCompositeRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedCompositeRoles1] PRIMARY KEY CLUSTERED ([ValidTo] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON),
    CONSTRAINT [tmp_ms_xx_constraint_UK_AssignedCompositeRoles1] UNIQUE NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedCompositeRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedCompositeRoles] ([ValidTo], [Owner_Id], [Role_Id], [ParametersContext_Id], [StartDate], [Id], [IsDenied], [IsInduced], [WorkflowState], [EndDate], [WhenCreated], [WorkflowInstance_Id], [WhenPerformed], [Performer_Id], [Requester_Id], [WhenReviewed1], [Reviewer1_Id], [WhenReviewed2], [Reviewer2_Id], [WhenReviewed3], [Reviewer3_Id], [Comment], [ReviewComment1], [ReviewComment2], [ReviewComment3], [ValidFrom])
        SELECT   [ValidTo],
                 [Owner_Id],
                 [Role_Id],
                 [ParametersContext_Id],
                 [StartDate],
                 [Id],
                 [IsDenied],
                 [IsInduced],
                 [WorkflowState],
                 [EndDate],
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
                 [ValidFrom]
        FROM     [dbo].[UP_AssignedCompositeRoles]
        ORDER BY [ValidTo] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedCompositeRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedCompositeRoles]', N'UP_AssignedCompositeRoles';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedCompositeRoles1]', N'PK_AssignedCompositeRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_UK_AssignedCompositeRoles1]', N'UK_AssignedCompositeRoles', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column OwnerType on table [dbo].[UP_AssignedResourceNavigations] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedResourceNavigations]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedResourceNavigations] (
    [Id]                      BIGINT        NOT NULL,
    [AssignedResourceType_Id] BIGINT        NOT NULL,
    [OwnerType]               BIGINT        NOT NULL,
    [Owner_Id]                BIGINT        NULL,
    [Property_Id]             BIGINT        NOT NULL,
    [Resource_Id]             BIGINT        NOT NULL,
    [IsDenied]                BIT           CONSTRAINT [DF_AssignedResourceNavigations_IsDenied] DEFAULT ((0)) NOT NULL,
    [WorkflowState]           TINYINT       CONSTRAINT [DF_AssignedResourceNavigations_WorkflowState] DEFAULT ((0)) NOT NULL,
    [ProvisioningState]       TINYINT       CONSTRAINT [DF_AssignedResourceNavigations_ProvisioningState] DEFAULT ((0)) NOT NULL,
    [ConfidenceLevel]         TINYINT       CONSTRAINT [DF_AssignedResourceNavigations_ConfidenceLevel] DEFAULT ((0)) NOT NULL,
    [StartDate]               SMALLDATETIME CONSTRAINT [DF_AssignedResourceNavigations_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]                 SMALLDATETIME CONSTRAINT [DF_AssignedResourceNavigations_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [ValidFrom]               DATETIME2 (2) CONSTRAINT [DF_AssignedResourceNavigations_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                 DATETIME2 (2) CONSTRAINT [DF_AssignedResourceNavigations_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [WhenCreated]             SMALLDATETIME CONSTRAINT [DF_AssignedResourceNavigations_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WhenPerformed]           SMALLDATETIME NULL,
    [Performer_Id]            BIGINT        NULL,
    [WorkflowInstance_Id]     BIGINT        NULL,
    [PolicyResource_Id]       BIGINT        NULL,
    CONSTRAINT [tmp_ms_xx_constraint_CK_AssignedResourceNavigations1] UNIQUE CLUSTERED ([ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [AssignedResourceType_Id] ASC, [Property_Id] ASC, [Resource_Id] ASC, [StartDate] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON),
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedResourceNavigations1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedResourceNavigations])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedResourceNavigations] ([ValidTo], [OwnerType], [Owner_Id], [AssignedResourceType_Id], [Property_Id], [Resource_Id], [StartDate], [Id], [IsDenied], [WorkflowState], [ProvisioningState], [ConfidenceLevel], [EndDate], [WhenCreated], [WhenPerformed], [Performer_Id], [WorkflowInstance_Id], [PolicyResource_Id], [ValidFrom])
        SELECT   [ValidTo],
                 [OwnerType],
                 [Owner_Id],
                 [AssignedResourceType_Id],
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
                 [WorkflowInstance_Id],
                 [PolicyResource_Id],
                 [ValidFrom]
        FROM     [dbo].[UP_AssignedResourceNavigations]
        ORDER BY [ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [AssignedResourceType_Id] ASC, [Property_Id] ASC, [Resource_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedResourceNavigations];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedResourceNavigations]', N'UP_AssignedResourceNavigations';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_CK_AssignedResourceNavigations1]', N'CK_AssignedResourceNavigations', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedResourceNavigations1]', N'PK_AssignedResourceNavigations', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column OwnerType on table [dbo].[UP_AssignedResourceScalars] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedResourceScalars]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedResourceScalars] (
    [Id]                      BIGINT          NOT NULL,
    [AssignedResourceType_Id] BIGINT          NOT NULL,
    [OwnerType]               BIGINT          NOT NULL,
    [Owner_Id]                BIGINT          NULL,
    [Property_Id]             BIGINT          NOT NULL,
    [WorkflowState]           TINYINT         CONSTRAINT [DF_AssignedResourceScalars_WorkflowState] DEFAULT ((0)) NOT NULL,
    [ProvisioningState]       TINYINT         CONSTRAINT [DF_AssignedResourceScalars_ProvisioningState] DEFAULT ((0)) NOT NULL,
    [StartDate]               SMALLDATETIME   CONSTRAINT [DF_AssignedResourceScalars_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]                 SMALLDATETIME   CONSTRAINT [DF_AssignedResourceScalars_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [ValidFrom]               DATETIME2 (2)   CONSTRAINT [DF_AssignedResourceScalars_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                 DATETIME2 (2)   CONSTRAINT [DF_AssignedResourceScalars_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [WhenCreated]             SMALLDATETIME   CONSTRAINT [DF_AssignedResourceScalars_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WhenPerformed]           SMALLDATETIME   NULL,
    [Performer_Id]            BIGINT          NULL,
    [WorkflowInstance_Id]     BIGINT          NULL,
    [Value]                   NVARCHAR (4000) NULL,
    [PolicyValue]             NVARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_CK_AssignedResourceScalar1] UNIQUE CLUSTERED ([ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [AssignedResourceType_Id] ASC, [Property_Id] ASC, [StartDate] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON),
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedResourceScalar1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedResourceScalars])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedResourceScalars] ([ValidTo], [OwnerType], [Owner_Id], [AssignedResourceType_Id], [Property_Id], [StartDate], [Id], [WorkflowState], [ProvisioningState], [EndDate], [WhenCreated], [WhenPerformed], [Performer_Id], [WorkflowInstance_Id], [Value], [PolicyValue], [ValidFrom])
        SELECT   [ValidTo],
                 [OwnerType],
                 [Owner_Id],
                 [AssignedResourceType_Id],
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
                 [Value],
                 [PolicyValue],
                 [ValidFrom]
        FROM     [dbo].[UP_AssignedResourceScalars]
        ORDER BY [ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [AssignedResourceType_Id] ASC, [Property_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedResourceScalars];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedResourceScalars]', N'UP_AssignedResourceScalars';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_CK_AssignedResourceScalar1]', N'CK_AssignedResourceScalar', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedResourceScalar1]', N'PK_AssignedResourceScalar', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The column OwnerType on table [dbo].[UP_AssignedResourceTypes] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_AssignedResourceTypes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_AssignedResourceTypes] (
    [Id]                                         BIGINT         NOT NULL,
    [ResourceType_Id]                            BIGINT         NOT NULL,
    [OwnerType]                                  BIGINT         NOT NULL,
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
    [ManualProvisioningState]                    TINYINT        CONSTRAINT [DF_AssignedResourceTypes_ManualProvisioningState] DEFAULT ((0)) NOT NULL,
    [HasPendingOrders]                           BIT            CONSTRAINT [DF_AssignedResourceTypes_HasPendingOrders] DEFAULT ((0)) NOT NULL,
    [ValidFrom]                                  DATETIME2 (2)  CONSTRAINT [DF_AssignedResourceTypes_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                    DATETIME2 (2)  CONSTRAINT [DF_AssignedResourceTypes_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [WhenCreated]                                SMALLDATETIME  CONSTRAINT [DF_AssignedResourceTypes_WhenCreated] DEFAULT CONVERT (SMALLDATETIME, GETUTCDATE(), 112) NOT NULL,
    [WorkflowInstance_Id]                        BIGINT         NULL,
    [WhenPerformed]                              SMALLDATETIME  NULL,
    [Performer_Id]                               BIGINT         NULL,
    [Requester_Id]                               BIGINT         NULL,
    [WhenReviewed1]                              SMALLDATETIME  NULL,
    [Reviewer1_Id]                               BIGINT         NULL,
    [WhenReviewed2]                              SMALLDATETIME  NULL,
    [Reviewer2_Id]                               BIGINT         NULL,
    [WhenReviewed3]                              SMALLDATETIME  NULL,
    [Reviewer3_Id]                               BIGINT         NULL,
    [Comment]                                    NVARCHAR (442) NULL,
    [ReviewComment1]                             NVARCHAR (442) NULL,
    [ReviewComment2]                             NVARCHAR (442) NULL,
    [ReviewComment3]                             NVARCHAR (442) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedResourceTypes1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_CK_AssignedResourceTypes1] UNIQUE CLUSTERED ([ValidTo] ASC, [OwnerType] ASC, [Owner_Id] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedResourceTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedResourceTypes] ([ValidTo], [OwnerType], [Owner_Id], [Id], [ResourceType_Id], [Resource_Id], [ParametersContext_Id], [IsDenied], [IsInduced], [WorkflowState], [ProvisioningState], [SourceMatchedConfidenceLevel], [ResourceTypeIdentificationConfidenceLevel], [StartDate], [EndDate], [NeedsPolicyApplication], [ConsolidatedWorkflowBlockedState], [ConsolidatedWorkflowBlockedCount], [ConsolidatedWorkflowFoundState], [ConsolidatedWorkflowFoundCount], [ConsolidatedWorkflowReviewState], [ConsolidatedWorkflowReviewCount], [ConsolidatedProvisioningState], [ConsolidatedAssignedResourceTypeCountError], [ManualProvisioningState], [HasPendingOrders], [WhenCreated], [WorkflowInstance_Id], [WhenPerformed], [Performer_Id], [Requester_Id], [WhenReviewed1], [Reviewer1_Id], [WhenReviewed2], [Reviewer2_Id], [WhenReviewed3], [Reviewer3_Id], [Comment], [ReviewComment1], [ReviewComment2], [ReviewComment3], [ValidFrom])
        SELECT   [ValidTo],
                 [OwnerType],
                 [Owner_Id],
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
                 [ManualProvisioningState],
                 [HasPendingOrders],
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
                 [ValidFrom]
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
    ON [dbo].[UP_AssignedResourceTypes]([Resource_Id] ASC) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.9999999') WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_NeedsPolicyApplication]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_NeedsPolicyApplication]
    ON [dbo].[UP_AssignedResourceTypes]([NeedsPolicyApplication] ASC)
    INCLUDE([ValidTo], [OwnerType], [Owner_Id], [Id]) WHERE "NeedsPolicyApplication"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.9999999') WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_HasPendingOrders]...';


GO
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_HasPendingOrders]
    ON [dbo].[UP_AssignedResourceTypes]([HasPendingOrders] ASC)
    INCLUDE([ValidTo], [OwnerType], [Owner_Id], [Id]) WHERE "HasPendingOrders"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.9999999') WITH (FILLFACTOR = 90, PAD_INDEX = ON);


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
    [ValidFrom]            DATETIME2 (2)  CONSTRAINT [DF_AssignedSingleRoles_ValidFrom] DEFAULT (GETUTCDATE()) NOT NULL,
    [ValidTo]              DATETIME2 (2)  CONSTRAINT [DF_AssignedSingleRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
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
    CONSTRAINT [tmp_ms_xx_constraint_PK_AssignedSingleRoles1] PRIMARY KEY CLUSTERED ([ValidTo] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON),
    CONSTRAINT [tmp_ms_xx_constraint_UK_AssignedSingleRoles1] UNIQUE NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_AssignedSingleRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_AssignedSingleRoles] ([ValidTo], [Owner_Id], [Role_Id], [ParametersContext_Id], [StartDate], [Id], [IsDenied], [IsInduced], [WorkflowState], [EndDate], [WhenCreated], [WorkflowInstance_Id], [WhenPerformed], [Performer_Id], [Requester_Id], [WhenReviewed1], [Reviewer1_Id], [WhenReviewed2], [Reviewer2_Id], [WhenReviewed3], [Reviewer3_Id], [Comment], [ReviewComment1], [ReviewComment2], [ReviewComment3], [ValidFrom])
        SELECT   [ValidTo],
                 [Owner_Id],
                 [Role_Id],
                 [ParametersContext_Id],
                 [StartDate],
                 [Id],
                 [IsDenied],
                 [IsInduced],
                 [WorkflowState],
                 [EndDate],
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
                 [ValidFrom]
        FROM     [dbo].[UP_AssignedSingleRoles]
        ORDER BY [ValidTo] ASC, [Owner_Id] ASC, [Role_Id] ASC, [ParametersContext_Id] ASC, [StartDate] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_AssignedSingleRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_AssignedSingleRoles]', N'UP_AssignedSingleRoles';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_AssignedSingleRoles1]', N'PK_AssignedSingleRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_UK_AssignedSingleRoles1]', N'UK_AssignedSingleRoles', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_CompositeRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_CompositeRoles] (
    [Id]                                           BIGINT          NOT NULL,
    [Policy_Id]                                    BIGINT          NOT NULL,
    [EntityType_Id]                                BIGINT          NOT NULL,
    [Category_Id]                                  BIGINT          NULL,
    [ValidFrom]                                    DATETIME2 (2)   CONSTRAINT [DF_CompositeRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                      DATETIME2 (2)   CONSTRAINT [DF_CompositeRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [P0]                                           BIT             CONSTRAINT [DF_CompositeRoles_P0] DEFAULT ((0)) NOT NULL,
    [P1]                                           BIT             CONSTRAINT [DF_CompositeRoles_P1] DEFAULT ((0)) NOT NULL,
    [P2]                                           BIT             CONSTRAINT [DF_CompositeRoles_P2] DEFAULT ((0)) NOT NULL,
    [P3]                                           BIT             CONSTRAINT [DF_CompositeRoles_P3] DEFAULT ((0)) NOT NULL,
    [P4]                                           BIT             CONSTRAINT [DF_CompositeRoles_P4] DEFAULT ((0)) NOT NULL,
    [P5]                                           BIT             CONSTRAINT [DF_CompositeRoles_P5] DEFAULT ((0)) NOT NULL,
    [P6]                                           BIT             CONSTRAINT [DF_CompositeRoles_P6] DEFAULT ((0)) NOT NULL,
    [P7]                                           BIT             CONSTRAINT [DF_CompositeRoles_P7] DEFAULT ((0)) NOT NULL,
    [P8]                                           BIT             CONSTRAINT [DF_CompositeRoles_P8] DEFAULT ((0)) NOT NULL,
    [P9]                                           BIT             CONSTRAINT [DF_CompositeRoles_P9] DEFAULT ((0)) NOT NULL,
    [PA]                                           BIT             CONSTRAINT [DF_CompositeRoles_PA] DEFAULT ((0)) NOT NULL,
    [PB]                                           BIT             CONSTRAINT [DF_CompositeRoles_PB] DEFAULT ((0)) NOT NULL,
    [PC]                                           BIT             CONSTRAINT [DF_CompositeRoles_PC] DEFAULT ((0)) NOT NULL,
    [PD]                                           BIT             CONSTRAINT [DF_CompositeRoles_PD] DEFAULT ((0)) NOT NULL,
    [PE]                                           BIT             CONSTRAINT [DF_CompositeRoles_PE] DEFAULT ((0)) NOT NULL,
    [PF]                                           BIT             CONSTRAINT [DF_CompositeRoles_PF] DEFAULT ((0)) NOT NULL,
    [PG]                                           BIT             CONSTRAINT [DF_CompositeRoles_PG] DEFAULT ((0)) NOT NULL,
    [PH]                                           BIT             CONSTRAINT [DF_CompositeRoles_PH] DEFAULT ((0)) NOT NULL,
    [PI]                                           BIT             CONSTRAINT [DF_CompositeRoles_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                                           BIT             CONSTRAINT [DF_CompositeRoles_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                                           BIT             CONSTRAINT [DF_CompositeRoles_PK] DEFAULT ((0)) NOT NULL,
    [PL]                                           BIT             CONSTRAINT [DF_CompositeRoles_PL] DEFAULT ((0)) NOT NULL,
    [PM]                                           BIT             CONSTRAINT [DF_CompositeRoles_PM] DEFAULT ((0)) NOT NULL,
    [PN]                                           BIT             CONSTRAINT [DF_CompositeRoles_PN] DEFAULT ((0)) NOT NULL,
    [PO]                                           BIT             CONSTRAINT [DF_CompositeRoles_PO] DEFAULT ((0)) NOT NULL,
    [PP]                                           BIT             CONSTRAINT [DF_CompositeRoles_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                                           BIT             CONSTRAINT [DF_CompositeRoles_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                                           BIT             CONSTRAINT [DF_CompositeRoles_PR] DEFAULT ((0)) NOT NULL,
    [PS]                                           BIT             CONSTRAINT [DF_CompositeRoles_PS] DEFAULT ((0)) NOT NULL,
    [PT]                                           BIT             CONSTRAINT [DF_CompositeRoles_PT] DEFAULT ((0)) NOT NULL,
    [PU]                                           BIT             CONSTRAINT [DF_CompositeRoles_PU] DEFAULT ((0)) NOT NULL,
    [PV]                                           BIT             CONSTRAINT [DF_CompositeRoles_PV] DEFAULT ((0)) NOT NULL,
    [P10]                                          BIT             CONSTRAINT [DF_CompositeRoles_P10] DEFAULT ((0)) NOT NULL,
    [P11]                                          BIT             CONSTRAINT [DF_CompositeRoles_P11] DEFAULT ((0)) NOT NULL,
    [P12]                                          BIT             CONSTRAINT [DF_CompositeRoles_P12] DEFAULT ((0)) NOT NULL,
    [P13]                                          BIT             CONSTRAINT [DF_CompositeRoles_P13] DEFAULT ((0)) NOT NULL,
    [P14]                                          BIT             CONSTRAINT [DF_CompositeRoles_P14] DEFAULT ((0)) NOT NULL,
    [P15]                                          BIT             CONSTRAINT [DF_CompositeRoles_P15] DEFAULT ((0)) NOT NULL,
    [P16]                                          BIT             CONSTRAINT [DF_CompositeRoles_P16] DEFAULT ((0)) NOT NULL,
    [P17]                                          BIT             CONSTRAINT [DF_CompositeRoles_P17] DEFAULT ((0)) NOT NULL,
    [P18]                                          BIT             CONSTRAINT [DF_CompositeRoles_P18] DEFAULT ((0)) NOT NULL,
    [P19]                                          BIT             CONSTRAINT [DF_CompositeRoles_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                                          BIT             CONSTRAINT [DF_CompositeRoles_P20] DEFAULT ((0)) NOT NULL,
    [P21]                                          BIT             CONSTRAINT [DF_CompositeRoles_P21] DEFAULT ((0)) NOT NULL,
    [P22]                                          BIT             CONSTRAINT [DF_CompositeRoles_P22] DEFAULT ((0)) NOT NULL,
    [P23]                                          BIT             CONSTRAINT [DF_CompositeRoles_P23] DEFAULT ((0)) NOT NULL,
    [P24]                                          BIT             CONSTRAINT [DF_CompositeRoles_P24] DEFAULT ((0)) NOT NULL,
    [P25]                                          BIT             CONSTRAINT [DF_CompositeRoles_P25] DEFAULT ((0)) NOT NULL,
    [P26]                                          BIT             CONSTRAINT [DF_CompositeRoles_P26] DEFAULT ((0)) NOT NULL,
    [P27]                                          BIT             CONSTRAINT [DF_CompositeRoles_P27] DEFAULT ((0)) NOT NULL,
    [P28]                                          BIT             CONSTRAINT [DF_CompositeRoles_P28] DEFAULT ((0)) NOT NULL,
    [P29]                                          BIT             CONSTRAINT [DF_CompositeRoles_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                                          BIT             CONSTRAINT [DF_CompositeRoles_P30] DEFAULT ((0)) NOT NULL,
    [P31]                                          BIT             CONSTRAINT [DF_CompositeRoles_P31] DEFAULT ((0)) NOT NULL,
    [P32]                                          BIT             CONSTRAINT [DF_CompositeRoles_P32] DEFAULT ((0)) NOT NULL,
    [P33]                                          BIT             CONSTRAINT [DF_CompositeRoles_P33] DEFAULT ((0)) NOT NULL,
    [P34]                                          BIT             CONSTRAINT [DF_CompositeRoles_P34] DEFAULT ((0)) NOT NULL,
    [P35]                                          BIT             CONSTRAINT [DF_CompositeRoles_P35] DEFAULT ((0)) NOT NULL,
    [P36]                                          BIT             CONSTRAINT [DF_CompositeRoles_P36] DEFAULT ((0)) NOT NULL,
    [P37]                                          BIT             CONSTRAINT [DF_CompositeRoles_P37] DEFAULT ((0)) NOT NULL,
    [P38]                                          BIT             CONSTRAINT [DF_CompositeRoles_P38] DEFAULT ((0)) NOT NULL,
    [P39]                                          BIT             CONSTRAINT [DF_CompositeRoles_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                                           BIT             CONSTRAINT [DF_CompositeRoles_R0] DEFAULT ((0)) NOT NULL,
    [R1]                                           BIT             CONSTRAINT [DF_CompositeRoles_R1] DEFAULT ((0)) NOT NULL,
    [R2]                                           BIT             CONSTRAINT [DF_CompositeRoles_R2] DEFAULT ((0)) NOT NULL,
    [R3]                                           BIT             CONSTRAINT [DF_CompositeRoles_R3] DEFAULT ((0)) NOT NULL,
    [R4]                                           BIT             CONSTRAINT [DF_CompositeRoles_R4] DEFAULT ((0)) NOT NULL,
    [R5]                                           BIT             CONSTRAINT [DF_CompositeRoles_R5] DEFAULT ((0)) NOT NULL,
    [R6]                                           BIT             CONSTRAINT [DF_CompositeRoles_R6] DEFAULT ((0)) NOT NULL,
    [R7]                                           BIT             CONSTRAINT [DF_CompositeRoles_R7] DEFAULT ((0)) NOT NULL,
    [R8]                                           BIT             CONSTRAINT [DF_CompositeRoles_R8] DEFAULT ((0)) NOT NULL,
    [R9]                                           BIT             CONSTRAINT [DF_CompositeRoles_R9] DEFAULT ((0)) NOT NULL,
    [RA]                                           BIT             CONSTRAINT [DF_CompositeRoles_RA] DEFAULT ((0)) NOT NULL,
    [RB]                                           BIT             CONSTRAINT [DF_CompositeRoles_RB] DEFAULT ((0)) NOT NULL,
    [RC]                                           BIT             CONSTRAINT [DF_CompositeRoles_RC] DEFAULT ((0)) NOT NULL,
    [RD]                                           BIT             CONSTRAINT [DF_CompositeRoles_RD] DEFAULT ((0)) NOT NULL,
    [RE]                                           BIT             CONSTRAINT [DF_CompositeRoles_RE] DEFAULT ((0)) NOT NULL,
    [RF]                                           BIT             CONSTRAINT [DF_CompositeRoles_RF] DEFAULT ((0)) NOT NULL,
    [RG]                                           BIT             CONSTRAINT [DF_CompositeRoles_RG] DEFAULT ((0)) NOT NULL,
    [RH]                                           BIT             CONSTRAINT [DF_CompositeRoles_RH] DEFAULT ((0)) NOT NULL,
    [RI]                                           BIT             CONSTRAINT [DF_CompositeRoles_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                                           BIT             CONSTRAINT [DF_CompositeRoles_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                                           BIT             CONSTRAINT [DF_CompositeRoles_RK] DEFAULT ((0)) NOT NULL,
    [RL]                                           BIT             CONSTRAINT [DF_CompositeRoles_RL] DEFAULT ((0)) NOT NULL,
    [RM]                                           BIT             CONSTRAINT [DF_CompositeRoles_RM] DEFAULT ((0)) NOT NULL,
    [RN]                                           BIT             CONSTRAINT [DF_CompositeRoles_RN] DEFAULT ((0)) NOT NULL,
    [RO]                                           BIT             CONSTRAINT [DF_CompositeRoles_RO] DEFAULT ((0)) NOT NULL,
    [RP]                                           BIT             CONSTRAINT [DF_CompositeRoles_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                                           BIT             CONSTRAINT [DF_CompositeRoles_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                                           BIT             CONSTRAINT [DF_CompositeRoles_RR] DEFAULT ((0)) NOT NULL,
    [RS]                                           BIT             CONSTRAINT [DF_CompositeRoles_RS] DEFAULT ((0)) NOT NULL,
    [RT]                                           BIT             CONSTRAINT [DF_CompositeRoles_RT] DEFAULT ((0)) NOT NULL,
    [RU]                                           BIT             CONSTRAINT [DF_CompositeRoles_RU] DEFAULT ((0)) NOT NULL,
    [RV]                                           BIT             CONSTRAINT [DF_CompositeRoles_RV] DEFAULT ((0)) NOT NULL,
    [R10]                                          BIT             CONSTRAINT [DF_CompositeRoles_R10] DEFAULT ((0)) NOT NULL,
    [R11]                                          BIT             CONSTRAINT [DF_CompositeRoles_R11] DEFAULT ((0)) NOT NULL,
    [R12]                                          BIT             CONSTRAINT [DF_CompositeRoles_R12] DEFAULT ((0)) NOT NULL,
    [R13]                                          BIT             CONSTRAINT [DF_CompositeRoles_R13] DEFAULT ((0)) NOT NULL,
    [R14]                                          BIT             CONSTRAINT [DF_CompositeRoles_R14] DEFAULT ((0)) NOT NULL,
    [R15]                                          BIT             CONSTRAINT [DF_CompositeRoles_R15] DEFAULT ((0)) NOT NULL,
    [R16]                                          BIT             CONSTRAINT [DF_CompositeRoles_R16] DEFAULT ((0)) NOT NULL,
    [R17]                                          BIT             CONSTRAINT [DF_CompositeRoles_R17] DEFAULT ((0)) NOT NULL,
    [R18]                                          BIT             CONSTRAINT [DF_CompositeRoles_R18] DEFAULT ((0)) NOT NULL,
    [R19]                                          BIT             CONSTRAINT [DF_CompositeRoles_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                                          BIT             CONSTRAINT [DF_CompositeRoles_R20] DEFAULT ((0)) NOT NULL,
    [R21]                                          BIT             CONSTRAINT [DF_CompositeRoles_R21] DEFAULT ((0)) NOT NULL,
    [R22]                                          BIT             CONSTRAINT [DF_CompositeRoles_R22] DEFAULT ((0)) NOT NULL,
    [R23]                                          BIT             CONSTRAINT [DF_CompositeRoles_R23] DEFAULT ((0)) NOT NULL,
    [R24]                                          BIT             CONSTRAINT [DF_CompositeRoles_R24] DEFAULT ((0)) NOT NULL,
    [R25]                                          BIT             CONSTRAINT [DF_CompositeRoles_R25] DEFAULT ((0)) NOT NULL,
    [R26]                                          BIT             CONSTRAINT [DF_CompositeRoles_R26] DEFAULT ((0)) NOT NULL,
    [R27]                                          BIT             CONSTRAINT [DF_CompositeRoles_R27] DEFAULT ((0)) NOT NULL,
    [R28]                                          BIT             CONSTRAINT [DF_CompositeRoles_R28] DEFAULT ((0)) NOT NULL,
    [R29]                                          BIT             CONSTRAINT [DF_CompositeRoles_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                                          BIT             CONSTRAINT [DF_CompositeRoles_R30] DEFAULT ((0)) NOT NULL,
    [R31]                                          BIT             CONSTRAINT [DF_CompositeRoles_R31] DEFAULT ((0)) NOT NULL,
    [R32]                                          BIT             CONSTRAINT [DF_CompositeRoles_R32] DEFAULT ((0)) NOT NULL,
    [R33]                                          BIT             CONSTRAINT [DF_CompositeRoles_R33] DEFAULT ((0)) NOT NULL,
    [R34]                                          BIT             CONSTRAINT [DF_CompositeRoles_R34] DEFAULT ((0)) NOT NULL,
    [R35]                                          BIT             CONSTRAINT [DF_CompositeRoles_R35] DEFAULT ((0)) NOT NULL,
    [R36]                                          BIT             CONSTRAINT [DF_CompositeRoles_R36] DEFAULT ((0)) NOT NULL,
    [R37]                                          BIT             CONSTRAINT [DF_CompositeRoles_R37] DEFAULT ((0)) NOT NULL,
    [R38]                                          BIT             CONSTRAINT [DF_CompositeRoles_R38] DEFAULT ((0)) NOT NULL,
    [R39]                                          BIT             CONSTRAINT [DF_CompositeRoles_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3V] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType]                         INT             CONSTRAINT [DF_CompositeRoles_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [HideOnSimplifiedView]                         BIT             CONSTRAINT [DF_CompositeRoles_HideOnSimplifiedView] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnApproveInReview]           TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnApproveInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeclineInReview]           TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnDeclineInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeleteGapInReconciliation] TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnDeleteGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnKeepGapInReconciliation]   TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnKeepGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [Identifier]                                   VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]                               NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]                               NVARCHAR (442)  NULL,
    [DisplayName_L3]                               NVARCHAR (442)  NULL,
    [DisplayName_L4]                               NVARCHAR (442)  NULL,
    [DisplayName_L5]                               NVARCHAR (442)  NULL,
    [DisplayName_L6]                               NVARCHAR (442)  NULL,
    [DisplayName_L7]                               NVARCHAR (442)  NULL,
    [DisplayName_L8]                               NVARCHAR (442)  NULL,
    [FullName_L1]                                  NVARCHAR (4000) NULL,
    [FullName_L2]                                  NVARCHAR (4000) NULL,
    [FullName_L3]                                  NVARCHAR (4000) NULL,
    [FullName_L4]                                  NVARCHAR (4000) NULL,
    [FullName_L5]                                  NVARCHAR (4000) NULL,
    [FullName_L6]                                  NVARCHAR (4000) NULL,
    [FullName_L7]                                  NVARCHAR (4000) NULL,
    [FullName_L8]                                  NVARCHAR (4000) NULL,
    [Description_L1]                               NVARCHAR (1024) NULL,
    [Description_L2]                               NVARCHAR (1024) NULL,
    [Description_L3]                               NVARCHAR (1024) NULL,
    [Description_L4]                               NVARCHAR (1024) NULL,
    [Description_L5]                               NVARCHAR (1024) NULL,
    [Description_L6]                               NVARCHAR (1024) NULL,
    [Description_L7]                               NVARCHAR (1024) NULL,
    [Description_L8]                               NVARCHAR (1024) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_CompositeRoles1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_CompositeRoles_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_CompositeRoles1]
    ON [dbo].[tmp_ms_xx_UP_CompositeRoles]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_CompositeRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_CompositeRoles] ([Id], [ValidTo], [Policy_Id], [EntityType_Id], [Category_Id], [ValidFrom], [P0], [P1], [P2], [P3], [P4], [P5], [P6], [P7], [P8], [P9], [PA], [PB], [PC], [PD], [PE], [PF], [PG], [PH], [PI], [PJ], [PK], [PL], [PM], [PN], [PO], [PP], [PQ], [PR], [PS], [PT], [PU], [PV], [P10], [P11], [P12], [P13], [P14], [P15], [P16], [P17], [P18], [P19], [P1A], [P1B], [P1C], [P1D], [P1E], [P1F], [P1G], [P1H], [P1I], [P1J], [P1K], [P1L], [P1M], [P1N], [P1O], [P1P], [P1Q], [P1R], [P1S], [P1T], [P1U], [P1V], [P20], [P21], [P22], [P23], [P24], [P25], [P26], [P27], [P28], [P29], [P2A], [P2B], [P2C], [P2D], [P2E], [P2F], [P2G], [P2H], [P2I], [P2J], [P2K], [P2L], [P2M], [P2N], [P2O], [P2P], [P2Q], [P2R], [P2S], [P2T], [P2U], [P2V], [P30], [P31], [P32], [P33], [P34], [P35], [P36], [P37], [P38], [P39], [P3A], [P3B], [P3C], [P3D], [P3E], [P3F], [P3G], [P3H], [P3I], [P3J], [P3K], [P3L], [P3M], [P3N], [P3O], [P3P], [P3Q], [P3R], [P3S], [P3T], [P3U], [P3V], [R0], [R1], [R2], [R3], [R4], [R5], [R6], [R7], [R8], [R9], [RA], [RB], [RC], [RD], [RE], [RF], [RG], [RH], [RI], [RJ], [RK], [RL], [RM], [RN], [RO], [RP], [RQ], [RR], [RS], [RT], [RU], [RV], [R10], [R11], [R12], [R13], [R14], [R15], [R16], [R17], [R18], [R19], [R1A], [R1B], [R1C], [R1D], [R1E], [R1F], [R1G], [R1H], [R1I], [R1J], [R1K], [R1L], [R1M], [R1N], [R1O], [R1P], [R1Q], [R1R], [R1S], [R1T], [R1U], [R1V], [R20], [R21], [R22], [R23], [R24], [R25], [R26], [R27], [R28], [R29], [R2A], [R2B], [R2C], [R2D], [R2E], [R2F], [R2G], [R2H], [R2I], [R2J], [R2K], [R2L], [R2M], [R2N], [R2O], [R2P], [R2Q], [R2R], [R2S], [R2T], [R2U], [R2V], [R30], [R31], [R32], [R33], [R34], [R35], [R36], [R37], [R38], [R39], [R3A], [R3B], [R3C], [R3D], [R3E], [R3F], [R3G], [R3H], [R3I], [R3J], [R3K], [R3L], [R3M], [R3N], [R3O], [R3P], [R3Q], [R3R], [R3S], [R3T], [R3U], [R3V], [ApprovalWorkflowType], [HideOnSimplifiedView], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [FullName_L1], [FullName_L2], [FullName_L3], [FullName_L4], [FullName_L5], [FullName_L6], [FullName_L7], [FullName_L8], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8])
        SELECT   [Id],
                 [ValidTo],
                 [Policy_Id],
                 [EntityType_Id],
                 [Category_Id],
                 [ValidFrom],
                 [P0],
                 [P1],
                 [P2],
                 [P3],
                 [P4],
                 [P5],
                 [P6],
                 [P7],
                 [P8],
                 [P9],
                 [PA],
                 [PB],
                 [PC],
                 [PD],
                 [PE],
                 [PF],
                 [PG],
                 [PH],
                 [PI],
                 [PJ],
                 [PK],
                 [PL],
                 [PM],
                 [PN],
                 [PO],
                 [PP],
                 [PQ],
                 [PR],
                 [PS],
                 [PT],
                 [PU],
                 [PV],
                 [P10],
                 [P11],
                 [P12],
                 [P13],
                 [P14],
                 [P15],
                 [P16],
                 [P17],
                 [P18],
                 [P19],
                 [P1A],
                 [P1B],
                 [P1C],
                 [P1D],
                 [P1E],
                 [P1F],
                 [P1G],
                 [P1H],
                 [P1I],
                 [P1J],
                 [P1K],
                 [P1L],
                 [P1M],
                 [P1N],
                 [P1O],
                 [P1P],
                 [P1Q],
                 [P1R],
                 [P1S],
                 [P1T],
                 [P1U],
                 [P1V],
                 [P20],
                 [P21],
                 [P22],
                 [P23],
                 [P24],
                 [P25],
                 [P26],
                 [P27],
                 [P28],
                 [P29],
                 [P2A],
                 [P2B],
                 [P2C],
                 [P2D],
                 [P2E],
                 [P2F],
                 [P2G],
                 [P2H],
                 [P2I],
                 [P2J],
                 [P2K],
                 [P2L],
                 [P2M],
                 [P2N],
                 [P2O],
                 [P2P],
                 [P2Q],
                 [P2R],
                 [P2S],
                 [P2T],
                 [P2U],
                 [P2V],
                 [P30],
                 [P31],
                 [P32],
                 [P33],
                 [P34],
                 [P35],
                 [P36],
                 [P37],
                 [P38],
                 [P39],
                 [P3A],
                 [P3B],
                 [P3C],
                 [P3D],
                 [P3E],
                 [P3F],
                 [P3G],
                 [P3H],
                 [P3I],
                 [P3J],
                 [P3K],
                 [P3L],
                 [P3M],
                 [P3N],
                 [P3O],
                 [P3P],
                 [P3Q],
                 [P3R],
                 [P3S],
                 [P3T],
                 [P3U],
                 [P3V],
                 [R0],
                 [R1],
                 [R2],
                 [R3],
                 [R4],
                 [R5],
                 [R6],
                 [R7],
                 [R8],
                 [R9],
                 [RA],
                 [RB],
                 [RC],
                 [RD],
                 [RE],
                 [RF],
                 [RG],
                 [RH],
                 [RI],
                 [RJ],
                 [RK],
                 [RL],
                 [RM],
                 [RN],
                 [RO],
                 [RP],
                 [RQ],
                 [RR],
                 [RS],
                 [RT],
                 [RU],
                 [RV],
                 [R10],
                 [R11],
                 [R12],
                 [R13],
                 [R14],
                 [R15],
                 [R16],
                 [R17],
                 [R18],
                 [R19],
                 [R1A],
                 [R1B],
                 [R1C],
                 [R1D],
                 [R1E],
                 [R1F],
                 [R1G],
                 [R1H],
                 [R1I],
                 [R1J],
                 [R1K],
                 [R1L],
                 [R1M],
                 [R1N],
                 [R1O],
                 [R1P],
                 [R1Q],
                 [R1R],
                 [R1S],
                 [R1T],
                 [R1U],
                 [R1V],
                 [R20],
                 [R21],
                 [R22],
                 [R23],
                 [R24],
                 [R25],
                 [R26],
                 [R27],
                 [R28],
                 [R29],
                 [R2A],
                 [R2B],
                 [R2C],
                 [R2D],
                 [R2E],
                 [R2F],
                 [R2G],
                 [R2H],
                 [R2I],
                 [R2J],
                 [R2K],
                 [R2L],
                 [R2M],
                 [R2N],
                 [R2O],
                 [R2P],
                 [R2Q],
                 [R2R],
                 [R2S],
                 [R2T],
                 [R2U],
                 [R2V],
                 [R30],
                 [R31],
                 [R32],
                 [R33],
                 [R34],
                 [R35],
                 [R36],
                 [R37],
                 [R38],
                 [R39],
                 [R3A],
                 [R3B],
                 [R3C],
                 [R3D],
                 [R3E],
                 [R3F],
                 [R3G],
                 [R3H],
                 [R3I],
                 [R3J],
                 [R3K],
                 [R3L],
                 [R3M],
                 [R3N],
                 [R3O],
                 [R3P],
                 [R3Q],
                 [R3R],
                 [R3S],
                 [R3T],
                 [R3U],
                 [R3V],
                 [ApprovalWorkflowType],
                 [HideOnSimplifiedView],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [FullName_L1],
                 [FullName_L2],
                 [FullName_L3],
                 [FullName_L4],
                 [FullName_L5],
                 [FullName_L6],
                 [FullName_L7],
                 [FullName_L8],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8]
        FROM     [dbo].[UP_CompositeRoles]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_CompositeRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_CompositeRoles]', N'UP_CompositeRoles';

EXECUTE sp_rename N'[dbo].[UP_CompositeRoles].[tmp_ms_xx_index_IX_CompositeRoles1]', N'IX_CompositeRoles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_CompositeRoles1]', N'PK_CompositeRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_CompositeRoles_Identifier1]', N'U_CompositeRoles_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
/*
The type for column Value in table [dbo].[UP_ResourceCorrelationKeys] is currently  NVARCHAR (4000) NOT NULL but is being changed to  NVARCHAR (442) NOT NULL. Data loss could occur.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceCorrelationKeys]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceCorrelationKeys] (
    [Id]                    BIGINT         NOT NULL,
    [BindingExpressionHash] INT            NOT NULL,
    [Resource_Id]           BIGINT         NOT NULL,
    [Value]                 NVARCHAR (442) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceCorrelationKeys1] PRIMARY KEY CLUSTERED ([BindingExpressionHash] ASC, [Value] ASC, [Resource_Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceCorrelationKeys])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceCorrelationKeys] ([BindingExpressionHash], [Value], [Resource_Id], [Id])
        SELECT   [BindingExpressionHash],
                 [Value],
                 [Resource_Id],
                 [Id]
        FROM     [dbo].[UP_ResourceCorrelationKeys]
        ORDER BY [BindingExpressionHash] ASC, [Value] ASC, [Resource_Id] ASC;
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
    ON [dbo].[UP_ResourceCorrelationKeys]([Resource_Id] ASC, [BindingExpressionHash] ASC, [Value] ASC)
    INCLUDE([Id]) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceTypes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceTypes] (
    [Id]                         BIGINT          NOT NULL,
    [Policy_Id]                  BIGINT          NOT NULL,
    [Category_Id]                BIGINT          NULL,
    [SourceEntityType_Id]        BIGINT          NULL,
    [TargetEntityType_Id]        BIGINT          NOT NULL,
    [ContextRule_Id]             BIGINT          NULL,
    [ValidFrom]                  DATETIME2 (2)   CONSTRAINT [DF_ResourceTypes_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                    DATETIME2 (2)   CONSTRAINT [DF_ResourceTypes_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [P0]                         BIT             CONSTRAINT [DF_ResourceTypes_P0] DEFAULT ((0)) NOT NULL,
    [P1]                         BIT             CONSTRAINT [DF_ResourceTypes_P1] DEFAULT ((0)) NOT NULL,
    [P2]                         BIT             CONSTRAINT [DF_ResourceTypes_P2] DEFAULT ((0)) NOT NULL,
    [P3]                         BIT             CONSTRAINT [DF_ResourceTypes_P3] DEFAULT ((0)) NOT NULL,
    [P4]                         BIT             CONSTRAINT [DF_ResourceTypes_P4] DEFAULT ((0)) NOT NULL,
    [P5]                         BIT             CONSTRAINT [DF_ResourceTypes_P5] DEFAULT ((0)) NOT NULL,
    [P6]                         BIT             CONSTRAINT [DF_ResourceTypes_P6] DEFAULT ((0)) NOT NULL,
    [P7]                         BIT             CONSTRAINT [DF_ResourceTypes_P7] DEFAULT ((0)) NOT NULL,
    [P8]                         BIT             CONSTRAINT [DF_ResourceTypes_P8] DEFAULT ((0)) NOT NULL,
    [P9]                         BIT             CONSTRAINT [DF_ResourceTypes_P9] DEFAULT ((0)) NOT NULL,
    [PA]                         BIT             CONSTRAINT [DF_ResourceTypes_PA] DEFAULT ((0)) NOT NULL,
    [PB]                         BIT             CONSTRAINT [DF_ResourceTypes_PB] DEFAULT ((0)) NOT NULL,
    [PC]                         BIT             CONSTRAINT [DF_ResourceTypes_PC] DEFAULT ((0)) NOT NULL,
    [PD]                         BIT             CONSTRAINT [DF_ResourceTypes_PD] DEFAULT ((0)) NOT NULL,
    [PE]                         BIT             CONSTRAINT [DF_ResourceTypes_PE] DEFAULT ((0)) NOT NULL,
    [PF]                         BIT             CONSTRAINT [DF_ResourceTypes_PF] DEFAULT ((0)) NOT NULL,
    [PG]                         BIT             CONSTRAINT [DF_ResourceTypes_PG] DEFAULT ((0)) NOT NULL,
    [PH]                         BIT             CONSTRAINT [DF_ResourceTypes_PH] DEFAULT ((0)) NOT NULL,
    [PI]                         BIT             CONSTRAINT [DF_ResourceTypes_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                         BIT             CONSTRAINT [DF_ResourceTypes_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                         BIT             CONSTRAINT [DF_ResourceTypes_PK] DEFAULT ((0)) NOT NULL,
    [PL]                         BIT             CONSTRAINT [DF_ResourceTypes_PL] DEFAULT ((0)) NOT NULL,
    [PM]                         BIT             CONSTRAINT [DF_ResourceTypes_PM] DEFAULT ((0)) NOT NULL,
    [PN]                         BIT             CONSTRAINT [DF_ResourceTypes_PN] DEFAULT ((0)) NOT NULL,
    [PO]                         BIT             CONSTRAINT [DF_ResourceTypes_PO] DEFAULT ((0)) NOT NULL,
    [PP]                         BIT             CONSTRAINT [DF_ResourceTypes_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                         BIT             CONSTRAINT [DF_ResourceTypes_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                         BIT             CONSTRAINT [DF_ResourceTypes_PR] DEFAULT ((0)) NOT NULL,
    [PS]                         BIT             CONSTRAINT [DF_ResourceTypes_PS] DEFAULT ((0)) NOT NULL,
    [PT]                         BIT             CONSTRAINT [DF_ResourceTypes_PT] DEFAULT ((0)) NOT NULL,
    [PU]                         BIT             CONSTRAINT [DF_ResourceTypes_PU] DEFAULT ((0)) NOT NULL,
    [PV]                         BIT             CONSTRAINT [DF_ResourceTypes_PV] DEFAULT ((0)) NOT NULL,
    [P10]                        BIT             CONSTRAINT [DF_ResourceTypes_P10] DEFAULT ((0)) NOT NULL,
    [P11]                        BIT             CONSTRAINT [DF_ResourceTypes_P11] DEFAULT ((0)) NOT NULL,
    [P12]                        BIT             CONSTRAINT [DF_ResourceTypes_P12] DEFAULT ((0)) NOT NULL,
    [P13]                        BIT             CONSTRAINT [DF_ResourceTypes_P13] DEFAULT ((0)) NOT NULL,
    [P14]                        BIT             CONSTRAINT [DF_ResourceTypes_P14] DEFAULT ((0)) NOT NULL,
    [P15]                        BIT             CONSTRAINT [DF_ResourceTypes_P15] DEFAULT ((0)) NOT NULL,
    [P16]                        BIT             CONSTRAINT [DF_ResourceTypes_P16] DEFAULT ((0)) NOT NULL,
    [P17]                        BIT             CONSTRAINT [DF_ResourceTypes_P17] DEFAULT ((0)) NOT NULL,
    [P18]                        BIT             CONSTRAINT [DF_ResourceTypes_P18] DEFAULT ((0)) NOT NULL,
    [P19]                        BIT             CONSTRAINT [DF_ResourceTypes_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                        BIT             CONSTRAINT [DF_ResourceTypes_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                        BIT             CONSTRAINT [DF_ResourceTypes_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                        BIT             CONSTRAINT [DF_ResourceTypes_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                        BIT             CONSTRAINT [DF_ResourceTypes_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                        BIT             CONSTRAINT [DF_ResourceTypes_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                        BIT             CONSTRAINT [DF_ResourceTypes_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                        BIT             CONSTRAINT [DF_ResourceTypes_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                        BIT             CONSTRAINT [DF_ResourceTypes_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                        BIT             CONSTRAINT [DF_ResourceTypes_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                        BIT             CONSTRAINT [DF_ResourceTypes_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                        BIT             CONSTRAINT [DF_ResourceTypes_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                        BIT             CONSTRAINT [DF_ResourceTypes_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                        BIT             CONSTRAINT [DF_ResourceTypes_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                        BIT             CONSTRAINT [DF_ResourceTypes_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                        BIT             CONSTRAINT [DF_ResourceTypes_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                        BIT             CONSTRAINT [DF_ResourceTypes_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                        BIT             CONSTRAINT [DF_ResourceTypes_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                        BIT             CONSTRAINT [DF_ResourceTypes_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                        BIT             CONSTRAINT [DF_ResourceTypes_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                        BIT             CONSTRAINT [DF_ResourceTypes_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                        BIT             CONSTRAINT [DF_ResourceTypes_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                        BIT             CONSTRAINT [DF_ResourceTypes_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                        BIT             CONSTRAINT [DF_ResourceTypes_P20] DEFAULT ((0)) NOT NULL,
    [P21]                        BIT             CONSTRAINT [DF_ResourceTypes_P21] DEFAULT ((0)) NOT NULL,
    [P22]                        BIT             CONSTRAINT [DF_ResourceTypes_P22] DEFAULT ((0)) NOT NULL,
    [P23]                        BIT             CONSTRAINT [DF_ResourceTypes_P23] DEFAULT ((0)) NOT NULL,
    [P24]                        BIT             CONSTRAINT [DF_ResourceTypes_P24] DEFAULT ((0)) NOT NULL,
    [P25]                        BIT             CONSTRAINT [DF_ResourceTypes_P25] DEFAULT ((0)) NOT NULL,
    [P26]                        BIT             CONSTRAINT [DF_ResourceTypes_P26] DEFAULT ((0)) NOT NULL,
    [P27]                        BIT             CONSTRAINT [DF_ResourceTypes_P27] DEFAULT ((0)) NOT NULL,
    [P28]                        BIT             CONSTRAINT [DF_ResourceTypes_P28] DEFAULT ((0)) NOT NULL,
    [P29]                        BIT             CONSTRAINT [DF_ResourceTypes_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                        BIT             CONSTRAINT [DF_ResourceTypes_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                        BIT             CONSTRAINT [DF_ResourceTypes_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                        BIT             CONSTRAINT [DF_ResourceTypes_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                        BIT             CONSTRAINT [DF_ResourceTypes_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                        BIT             CONSTRAINT [DF_ResourceTypes_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                        BIT             CONSTRAINT [DF_ResourceTypes_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                        BIT             CONSTRAINT [DF_ResourceTypes_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                        BIT             CONSTRAINT [DF_ResourceTypes_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                        BIT             CONSTRAINT [DF_ResourceTypes_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                        BIT             CONSTRAINT [DF_ResourceTypes_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                        BIT             CONSTRAINT [DF_ResourceTypes_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                        BIT             CONSTRAINT [DF_ResourceTypes_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                        BIT             CONSTRAINT [DF_ResourceTypes_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                        BIT             CONSTRAINT [DF_ResourceTypes_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                        BIT             CONSTRAINT [DF_ResourceTypes_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                        BIT             CONSTRAINT [DF_ResourceTypes_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                        BIT             CONSTRAINT [DF_ResourceTypes_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                        BIT             CONSTRAINT [DF_ResourceTypes_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                        BIT             CONSTRAINT [DF_ResourceTypes_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                        BIT             CONSTRAINT [DF_ResourceTypes_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                        BIT             CONSTRAINT [DF_ResourceTypes_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                        BIT             CONSTRAINT [DF_ResourceTypes_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                        BIT             CONSTRAINT [DF_ResourceTypes_P30] DEFAULT ((0)) NOT NULL,
    [P31]                        BIT             CONSTRAINT [DF_ResourceTypes_P31] DEFAULT ((0)) NOT NULL,
    [P32]                        BIT             CONSTRAINT [DF_ResourceTypes_P32] DEFAULT ((0)) NOT NULL,
    [P33]                        BIT             CONSTRAINT [DF_ResourceTypes_P33] DEFAULT ((0)) NOT NULL,
    [P34]                        BIT             CONSTRAINT [DF_ResourceTypes_P34] DEFAULT ((0)) NOT NULL,
    [P35]                        BIT             CONSTRAINT [DF_ResourceTypes_P35] DEFAULT ((0)) NOT NULL,
    [P36]                        BIT             CONSTRAINT [DF_ResourceTypes_P36] DEFAULT ((0)) NOT NULL,
    [P37]                        BIT             CONSTRAINT [DF_ResourceTypes_P37] DEFAULT ((0)) NOT NULL,
    [P38]                        BIT             CONSTRAINT [DF_ResourceTypes_P38] DEFAULT ((0)) NOT NULL,
    [P39]                        BIT             CONSTRAINT [DF_ResourceTypes_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                        BIT             CONSTRAINT [DF_ResourceTypes_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                        BIT             CONSTRAINT [DF_ResourceTypes_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                        BIT             CONSTRAINT [DF_ResourceTypes_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                        BIT             CONSTRAINT [DF_ResourceTypes_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                        BIT             CONSTRAINT [DF_ResourceTypes_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                        BIT             CONSTRAINT [DF_ResourceTypes_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                        BIT             CONSTRAINT [DF_ResourceTypes_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                        BIT             CONSTRAINT [DF_ResourceTypes_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                        BIT             CONSTRAINT [DF_ResourceTypes_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                        BIT             CONSTRAINT [DF_ResourceTypes_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                        BIT             CONSTRAINT [DF_ResourceTypes_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                        BIT             CONSTRAINT [DF_ResourceTypes_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                        BIT             CONSTRAINT [DF_ResourceTypes_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                        BIT             CONSTRAINT [DF_ResourceTypes_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                        BIT             CONSTRAINT [DF_ResourceTypes_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                        BIT             CONSTRAINT [DF_ResourceTypes_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                        BIT             CONSTRAINT [DF_ResourceTypes_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                        BIT             CONSTRAINT [DF_ResourceTypes_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                        BIT             CONSTRAINT [DF_ResourceTypes_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                        BIT             CONSTRAINT [DF_ResourceTypes_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                        BIT             CONSTRAINT [DF_ResourceTypes_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                        BIT             CONSTRAINT [DF_ResourceTypes_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                         BIT             CONSTRAINT [DF_ResourceTypes_R0] DEFAULT ((0)) NOT NULL,
    [R1]                         BIT             CONSTRAINT [DF_ResourceTypes_R1] DEFAULT ((0)) NOT NULL,
    [R2]                         BIT             CONSTRAINT [DF_ResourceTypes_R2] DEFAULT ((0)) NOT NULL,
    [R3]                         BIT             CONSTRAINT [DF_ResourceTypes_R3] DEFAULT ((0)) NOT NULL,
    [R4]                         BIT             CONSTRAINT [DF_ResourceTypes_R4] DEFAULT ((0)) NOT NULL,
    [R5]                         BIT             CONSTRAINT [DF_ResourceTypes_R5] DEFAULT ((0)) NOT NULL,
    [R6]                         BIT             CONSTRAINT [DF_ResourceTypes_R6] DEFAULT ((0)) NOT NULL,
    [R7]                         BIT             CONSTRAINT [DF_ResourceTypes_R7] DEFAULT ((0)) NOT NULL,
    [R8]                         BIT             CONSTRAINT [DF_ResourceTypes_R8] DEFAULT ((0)) NOT NULL,
    [R9]                         BIT             CONSTRAINT [DF_ResourceTypes_R9] DEFAULT ((0)) NOT NULL,
    [RA]                         BIT             CONSTRAINT [DF_ResourceTypes_RA] DEFAULT ((0)) NOT NULL,
    [RB]                         BIT             CONSTRAINT [DF_ResourceTypes_RB] DEFAULT ((0)) NOT NULL,
    [RC]                         BIT             CONSTRAINT [DF_ResourceTypes_RC] DEFAULT ((0)) NOT NULL,
    [RD]                         BIT             CONSTRAINT [DF_ResourceTypes_RD] DEFAULT ((0)) NOT NULL,
    [RE]                         BIT             CONSTRAINT [DF_ResourceTypes_RE] DEFAULT ((0)) NOT NULL,
    [RF]                         BIT             CONSTRAINT [DF_ResourceTypes_RF] DEFAULT ((0)) NOT NULL,
    [RG]                         BIT             CONSTRAINT [DF_ResourceTypes_RG] DEFAULT ((0)) NOT NULL,
    [RH]                         BIT             CONSTRAINT [DF_ResourceTypes_RH] DEFAULT ((0)) NOT NULL,
    [RI]                         BIT             CONSTRAINT [DF_ResourceTypes_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                         BIT             CONSTRAINT [DF_ResourceTypes_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                         BIT             CONSTRAINT [DF_ResourceTypes_RK] DEFAULT ((0)) NOT NULL,
    [RL]                         BIT             CONSTRAINT [DF_ResourceTypes_RL] DEFAULT ((0)) NOT NULL,
    [RM]                         BIT             CONSTRAINT [DF_ResourceTypes_RM] DEFAULT ((0)) NOT NULL,
    [RN]                         BIT             CONSTRAINT [DF_ResourceTypes_RN] DEFAULT ((0)) NOT NULL,
    [RO]                         BIT             CONSTRAINT [DF_ResourceTypes_RO] DEFAULT ((0)) NOT NULL,
    [RP]                         BIT             CONSTRAINT [DF_ResourceTypes_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                         BIT             CONSTRAINT [DF_ResourceTypes_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                         BIT             CONSTRAINT [DF_ResourceTypes_RR] DEFAULT ((0)) NOT NULL,
    [RS]                         BIT             CONSTRAINT [DF_ResourceTypes_RS] DEFAULT ((0)) NOT NULL,
    [RT]                         BIT             CONSTRAINT [DF_ResourceTypes_RT] DEFAULT ((0)) NOT NULL,
    [RU]                         BIT             CONSTRAINT [DF_ResourceTypes_RU] DEFAULT ((0)) NOT NULL,
    [RV]                         BIT             CONSTRAINT [DF_ResourceTypes_RV] DEFAULT ((0)) NOT NULL,
    [R10]                        BIT             CONSTRAINT [DF_ResourceTypes_R10] DEFAULT ((0)) NOT NULL,
    [R11]                        BIT             CONSTRAINT [DF_ResourceTypes_R11] DEFAULT ((0)) NOT NULL,
    [R12]                        BIT             CONSTRAINT [DF_ResourceTypes_R12] DEFAULT ((0)) NOT NULL,
    [R13]                        BIT             CONSTRAINT [DF_ResourceTypes_R13] DEFAULT ((0)) NOT NULL,
    [R14]                        BIT             CONSTRAINT [DF_ResourceTypes_R14] DEFAULT ((0)) NOT NULL,
    [R15]                        BIT             CONSTRAINT [DF_ResourceTypes_R15] DEFAULT ((0)) NOT NULL,
    [R16]                        BIT             CONSTRAINT [DF_ResourceTypes_R16] DEFAULT ((0)) NOT NULL,
    [R17]                        BIT             CONSTRAINT [DF_ResourceTypes_R17] DEFAULT ((0)) NOT NULL,
    [R18]                        BIT             CONSTRAINT [DF_ResourceTypes_R18] DEFAULT ((0)) NOT NULL,
    [R19]                        BIT             CONSTRAINT [DF_ResourceTypes_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                        BIT             CONSTRAINT [DF_ResourceTypes_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                        BIT             CONSTRAINT [DF_ResourceTypes_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                        BIT             CONSTRAINT [DF_ResourceTypes_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                        BIT             CONSTRAINT [DF_ResourceTypes_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                        BIT             CONSTRAINT [DF_ResourceTypes_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                        BIT             CONSTRAINT [DF_ResourceTypes_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                        BIT             CONSTRAINT [DF_ResourceTypes_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                        BIT             CONSTRAINT [DF_ResourceTypes_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                        BIT             CONSTRAINT [DF_ResourceTypes_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                        BIT             CONSTRAINT [DF_ResourceTypes_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                        BIT             CONSTRAINT [DF_ResourceTypes_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                        BIT             CONSTRAINT [DF_ResourceTypes_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                        BIT             CONSTRAINT [DF_ResourceTypes_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                        BIT             CONSTRAINT [DF_ResourceTypes_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                        BIT             CONSTRAINT [DF_ResourceTypes_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                        BIT             CONSTRAINT [DF_ResourceTypes_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                        BIT             CONSTRAINT [DF_ResourceTypes_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                        BIT             CONSTRAINT [DF_ResourceTypes_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                        BIT             CONSTRAINT [DF_ResourceTypes_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                        BIT             CONSTRAINT [DF_ResourceTypes_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                        BIT             CONSTRAINT [DF_ResourceTypes_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                        BIT             CONSTRAINT [DF_ResourceTypes_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                        BIT             CONSTRAINT [DF_ResourceTypes_R20] DEFAULT ((0)) NOT NULL,
    [R21]                        BIT             CONSTRAINT [DF_ResourceTypes_R21] DEFAULT ((0)) NOT NULL,
    [R22]                        BIT             CONSTRAINT [DF_ResourceTypes_R22] DEFAULT ((0)) NOT NULL,
    [R23]                        BIT             CONSTRAINT [DF_ResourceTypes_R23] DEFAULT ((0)) NOT NULL,
    [R24]                        BIT             CONSTRAINT [DF_ResourceTypes_R24] DEFAULT ((0)) NOT NULL,
    [R25]                        BIT             CONSTRAINT [DF_ResourceTypes_R25] DEFAULT ((0)) NOT NULL,
    [R26]                        BIT             CONSTRAINT [DF_ResourceTypes_R26] DEFAULT ((0)) NOT NULL,
    [R27]                        BIT             CONSTRAINT [DF_ResourceTypes_R27] DEFAULT ((0)) NOT NULL,
    [R28]                        BIT             CONSTRAINT [DF_ResourceTypes_R28] DEFAULT ((0)) NOT NULL,
    [R29]                        BIT             CONSTRAINT [DF_ResourceTypes_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                        BIT             CONSTRAINT [DF_ResourceTypes_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                        BIT             CONSTRAINT [DF_ResourceTypes_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                        BIT             CONSTRAINT [DF_ResourceTypes_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                        BIT             CONSTRAINT [DF_ResourceTypes_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                        BIT             CONSTRAINT [DF_ResourceTypes_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                        BIT             CONSTRAINT [DF_ResourceTypes_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                        BIT             CONSTRAINT [DF_ResourceTypes_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                        BIT             CONSTRAINT [DF_ResourceTypes_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                        BIT             CONSTRAINT [DF_ResourceTypes_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                        BIT             CONSTRAINT [DF_ResourceTypes_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                        BIT             CONSTRAINT [DF_ResourceTypes_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                        BIT             CONSTRAINT [DF_ResourceTypes_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                        BIT             CONSTRAINT [DF_ResourceTypes_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                        BIT             CONSTRAINT [DF_ResourceTypes_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                        BIT             CONSTRAINT [DF_ResourceTypes_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                        BIT             CONSTRAINT [DF_ResourceTypes_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                        BIT             CONSTRAINT [DF_ResourceTypes_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                        BIT             CONSTRAINT [DF_ResourceTypes_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                        BIT             CONSTRAINT [DF_ResourceTypes_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                        BIT             CONSTRAINT [DF_ResourceTypes_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                        BIT             CONSTRAINT [DF_ResourceTypes_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                        BIT             CONSTRAINT [DF_ResourceTypes_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                        BIT             CONSTRAINT [DF_ResourceTypes_R30] DEFAULT ((0)) NOT NULL,
    [R31]                        BIT             CONSTRAINT [DF_ResourceTypes_R31] DEFAULT ((0)) NOT NULL,
    [R32]                        BIT             CONSTRAINT [DF_ResourceTypes_R32] DEFAULT ((0)) NOT NULL,
    [R33]                        BIT             CONSTRAINT [DF_ResourceTypes_R33] DEFAULT ((0)) NOT NULL,
    [R34]                        BIT             CONSTRAINT [DF_ResourceTypes_R34] DEFAULT ((0)) NOT NULL,
    [R35]                        BIT             CONSTRAINT [DF_ResourceTypes_R35] DEFAULT ((0)) NOT NULL,
    [R36]                        BIT             CONSTRAINT [DF_ResourceTypes_R36] DEFAULT ((0)) NOT NULL,
    [R37]                        BIT             CONSTRAINT [DF_ResourceTypes_R37] DEFAULT ((0)) NOT NULL,
    [R38]                        BIT             CONSTRAINT [DF_ResourceTypes_R38] DEFAULT ((0)) NOT NULL,
    [R39]                        BIT             CONSTRAINT [DF_ResourceTypes_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                        BIT             CONSTRAINT [DF_ResourceTypes_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                        BIT             CONSTRAINT [DF_ResourceTypes_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                        BIT             CONSTRAINT [DF_ResourceTypes_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                        BIT             CONSTRAINT [DF_ResourceTypes_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                        BIT             CONSTRAINT [DF_ResourceTypes_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                        BIT             CONSTRAINT [DF_ResourceTypes_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                        BIT             CONSTRAINT [DF_ResourceTypes_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                        BIT             CONSTRAINT [DF_ResourceTypes_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                        BIT             CONSTRAINT [DF_ResourceTypes_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                        BIT             CONSTRAINT [DF_ResourceTypes_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                        BIT             CONSTRAINT [DF_ResourceTypes_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                        BIT             CONSTRAINT [DF_ResourceTypes_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                        BIT             CONSTRAINT [DF_ResourceTypes_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                        BIT             CONSTRAINT [DF_ResourceTypes_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                        BIT             CONSTRAINT [DF_ResourceTypes_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                        BIT             CONSTRAINT [DF_ResourceTypes_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                        BIT             CONSTRAINT [DF_ResourceTypes_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                        BIT             CONSTRAINT [DF_ResourceTypes_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                        BIT             CONSTRAINT [DF_ResourceTypes_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                        BIT             CONSTRAINT [DF_ResourceTypes_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                        BIT             CONSTRAINT [DF_ResourceTypes_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                        BIT             CONSTRAINT [DF_ResourceTypes_R3V] DEFAULT ((0)) NOT NULL,
    [AllowAdd]                   BIT             CONSTRAINT [DF_ResourceTypes_AllowAdd] DEFAULT ((1)) NOT NULL,
    [AllowRemove]                BIT             CONSTRAINT [DF_ResourceTypes_AllowRemove] DEFAULT ((1)) NOT NULL,
    [CorrelateMultipleResources] BIT             CONSTRAINT [DF_ResourceTypes_CorrelateMultipleResources] DEFAULT ((0)) NOT NULL,
    [RemoveOrphans]              BIT             CONSTRAINT [DF_ResourceTypes_RemoveOrphans] DEFAULT ((0)) NOT NULL,
    [BlockProvisioning]          BIT             CONSTRAINT [DF_ResourceTypes_BlockProvisioning] DEFAULT ((1)) NOT NULL,
    [DiscardManualAssignments]   BIT             CONSTRAINT [DF_ResourceTypes_DiscardManualAssignments] DEFAULT ((0)) NOT NULL,
    [HideOnSimplifiedView]       BIT             CONSTRAINT [DF_ResourceTypes_HideOnSimplifiedView] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType]       INT             CONSTRAINT [DF_ResourceTypes_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [Description_L1]             NVARCHAR (1024) NULL,
    [Description_L2]             NVARCHAR (1024) NULL,
    [Description_L3]             NVARCHAR (1024) NULL,
    [Description_L4]             NVARCHAR (1024) NULL,
    [Description_L5]             NVARCHAR (1024) NULL,
    [Description_L6]             NVARCHAR (1024) NULL,
    [Description_L7]             NVARCHAR (1024) NULL,
    [Description_L8]             NVARCHAR (1024) NULL,
    [MaximumInsert]              INT             CONSTRAINT [DF_ResourceTypes_MaximumInsert] DEFAULT ((0)) NOT NULL,
    [MaximumDelete]              INT             CONSTRAINT [DF_ResourceTypes_MaximumDelete] DEFAULT ((0)) NOT NULL,
    [MaximumUpdate]              INT             CONSTRAINT [DF_ResourceTypes_MaximumUpdate] DEFAULT ((0)) NOT NULL,
    [MaximumInsertPercent]       INT             CONSTRAINT [DF_ResourceTypes_MaximumInsertPercent] DEFAULT ((30)) NOT NULL,
    [MaximumDeletePercent]       INT             CONSTRAINT [DF_ResourceTypes_MaximumDeletePercent] DEFAULT ((30)) NOT NULL,
    [MaximumUpdatePercent]       INT             CONSTRAINT [DF_ResourceTypes_MaximumUpdatePercent] DEFAULT ((30)) NOT NULL,
    [Identifier]                 VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]             NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]             NVARCHAR (442)  NULL,
    [DisplayName_L3]             NVARCHAR (442)  NULL,
    [DisplayName_L4]             NVARCHAR (442)  NULL,
    [DisplayName_L5]             NVARCHAR (442)  NULL,
    [DisplayName_L6]             NVARCHAR (442)  NULL,
    [DisplayName_L7]             NVARCHAR (442)  NULL,
    [DisplayName_L8]             NVARCHAR (442)  NULL,
    [FullName_L1]                NVARCHAR (4000) NULL,
    [FullName_L2]                NVARCHAR (4000) NULL,
    [FullName_L3]                NVARCHAR (4000) NULL,
    [FullName_L4]                NVARCHAR (4000) NULL,
    [FullName_L5]                NVARCHAR (4000) NULL,
    [FullName_L6]                NVARCHAR (4000) NULL,
    [FullName_L7]                NVARCHAR (4000) NULL,
    [FullName_L8]                NVARCHAR (4000) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypes1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_ResourceTypes_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceTypes1]
    ON [dbo].[tmp_ms_xx_UP_ResourceTypes]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceTypes] ([Id], [ValidTo], [Policy_Id], [Category_Id], [SourceEntityType_Id], [TargetEntityType_Id], [ContextRule_Id], [ValidFrom], [P0], [P1], [P2], [P3], [P4], [P5], [P6], [P7], [P8], [P9], [PA], [PB], [PC], [PD], [PE], [PF], [PG], [PH], [PI], [PJ], [PK], [PL], [PM], [PN], [PO], [PP], [PQ], [PR], [PS], [PT], [PU], [PV], [P10], [P11], [P12], [P13], [P14], [P15], [P16], [P17], [P18], [P19], [P1A], [P1B], [P1C], [P1D], [P1E], [P1F], [P1G], [P1H], [P1I], [P1J], [P1K], [P1L], [P1M], [P1N], [P1O], [P1P], [P1Q], [P1R], [P1S], [P1T], [P1U], [P1V], [P20], [P21], [P22], [P23], [P24], [P25], [P26], [P27], [P28], [P29], [P2A], [P2B], [P2C], [P2D], [P2E], [P2F], [P2G], [P2H], [P2I], [P2J], [P2K], [P2L], [P2M], [P2N], [P2O], [P2P], [P2Q], [P2R], [P2S], [P2T], [P2U], [P2V], [P30], [P31], [P32], [P33], [P34], [P35], [P36], [P37], [P38], [P39], [P3A], [P3B], [P3C], [P3D], [P3E], [P3F], [P3G], [P3H], [P3I], [P3J], [P3K], [P3L], [P3M], [P3N], [P3O], [P3P], [P3Q], [P3R], [P3S], [P3T], [P3U], [P3V], [R0], [R1], [R2], [R3], [R4], [R5], [R6], [R7], [R8], [R9], [RA], [RB], [RC], [RD], [RE], [RF], [RG], [RH], [RI], [RJ], [RK], [RL], [RM], [RN], [RO], [RP], [RQ], [RR], [RS], [RT], [RU], [RV], [R10], [R11], [R12], [R13], [R14], [R15], [R16], [R17], [R18], [R19], [R1A], [R1B], [R1C], [R1D], [R1E], [R1F], [R1G], [R1H], [R1I], [R1J], [R1K], [R1L], [R1M], [R1N], [R1O], [R1P], [R1Q], [R1R], [R1S], [R1T], [R1U], [R1V], [R20], [R21], [R22], [R23], [R24], [R25], [R26], [R27], [R28], [R29], [R2A], [R2B], [R2C], [R2D], [R2E], [R2F], [R2G], [R2H], [R2I], [R2J], [R2K], [R2L], [R2M], [R2N], [R2O], [R2P], [R2Q], [R2R], [R2S], [R2T], [R2U], [R2V], [R30], [R31], [R32], [R33], [R34], [R35], [R36], [R37], [R38], [R39], [R3A], [R3B], [R3C], [R3D], [R3E], [R3F], [R3G], [R3H], [R3I], [R3J], [R3K], [R3L], [R3M], [R3N], [R3O], [R3P], [R3Q], [R3R], [R3S], [R3T], [R3U], [R3V], [AllowAdd], [AllowRemove], [RemoveOrphans], [BlockProvisioning], [DiscardManualAssignments], [HideOnSimplifiedView], [ApprovalWorkflowType], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8], [MaximumInsert], [MaximumDelete], [MaximumUpdate], [MaximumInsertPercent], [MaximumDeletePercent], [MaximumUpdatePercent], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [FullName_L1], [FullName_L2], [FullName_L3], [FullName_L4], [FullName_L5], [FullName_L6], [FullName_L7], [FullName_L8])
        SELECT   [Id],
                 [ValidTo],
                 [Policy_Id],
                 [Category_Id],
                 [SourceEntityType_Id],
                 [TargetEntityType_Id],
                 [ContextRule_Id],
                 [ValidFrom],
                 [P0],
                 [P1],
                 [P2],
                 [P3],
                 [P4],
                 [P5],
                 [P6],
                 [P7],
                 [P8],
                 [P9],
                 [PA],
                 [PB],
                 [PC],
                 [PD],
                 [PE],
                 [PF],
                 [PG],
                 [PH],
                 [PI],
                 [PJ],
                 [PK],
                 [PL],
                 [PM],
                 [PN],
                 [PO],
                 [PP],
                 [PQ],
                 [PR],
                 [PS],
                 [PT],
                 [PU],
                 [PV],
                 [P10],
                 [P11],
                 [P12],
                 [P13],
                 [P14],
                 [P15],
                 [P16],
                 [P17],
                 [P18],
                 [P19],
                 [P1A],
                 [P1B],
                 [P1C],
                 [P1D],
                 [P1E],
                 [P1F],
                 [P1G],
                 [P1H],
                 [P1I],
                 [P1J],
                 [P1K],
                 [P1L],
                 [P1M],
                 [P1N],
                 [P1O],
                 [P1P],
                 [P1Q],
                 [P1R],
                 [P1S],
                 [P1T],
                 [P1U],
                 [P1V],
                 [P20],
                 [P21],
                 [P22],
                 [P23],
                 [P24],
                 [P25],
                 [P26],
                 [P27],
                 [P28],
                 [P29],
                 [P2A],
                 [P2B],
                 [P2C],
                 [P2D],
                 [P2E],
                 [P2F],
                 [P2G],
                 [P2H],
                 [P2I],
                 [P2J],
                 [P2K],
                 [P2L],
                 [P2M],
                 [P2N],
                 [P2O],
                 [P2P],
                 [P2Q],
                 [P2R],
                 [P2S],
                 [P2T],
                 [P2U],
                 [P2V],
                 [P30],
                 [P31],
                 [P32],
                 [P33],
                 [P34],
                 [P35],
                 [P36],
                 [P37],
                 [P38],
                 [P39],
                 [P3A],
                 [P3B],
                 [P3C],
                 [P3D],
                 [P3E],
                 [P3F],
                 [P3G],
                 [P3H],
                 [P3I],
                 [P3J],
                 [P3K],
                 [P3L],
                 [P3M],
                 [P3N],
                 [P3O],
                 [P3P],
                 [P3Q],
                 [P3R],
                 [P3S],
                 [P3T],
                 [P3U],
                 [P3V],
                 [R0],
                 [R1],
                 [R2],
                 [R3],
                 [R4],
                 [R5],
                 [R6],
                 [R7],
                 [R8],
                 [R9],
                 [RA],
                 [RB],
                 [RC],
                 [RD],
                 [RE],
                 [RF],
                 [RG],
                 [RH],
                 [RI],
                 [RJ],
                 [RK],
                 [RL],
                 [RM],
                 [RN],
                 [RO],
                 [RP],
                 [RQ],
                 [RR],
                 [RS],
                 [RT],
                 [RU],
                 [RV],
                 [R10],
                 [R11],
                 [R12],
                 [R13],
                 [R14],
                 [R15],
                 [R16],
                 [R17],
                 [R18],
                 [R19],
                 [R1A],
                 [R1B],
                 [R1C],
                 [R1D],
                 [R1E],
                 [R1F],
                 [R1G],
                 [R1H],
                 [R1I],
                 [R1J],
                 [R1K],
                 [R1L],
                 [R1M],
                 [R1N],
                 [R1O],
                 [R1P],
                 [R1Q],
                 [R1R],
                 [R1S],
                 [R1T],
                 [R1U],
                 [R1V],
                 [R20],
                 [R21],
                 [R22],
                 [R23],
                 [R24],
                 [R25],
                 [R26],
                 [R27],
                 [R28],
                 [R29],
                 [R2A],
                 [R2B],
                 [R2C],
                 [R2D],
                 [R2E],
                 [R2F],
                 [R2G],
                 [R2H],
                 [R2I],
                 [R2J],
                 [R2K],
                 [R2L],
                 [R2M],
                 [R2N],
                 [R2O],
                 [R2P],
                 [R2Q],
                 [R2R],
                 [R2S],
                 [R2T],
                 [R2U],
                 [R2V],
                 [R30],
                 [R31],
                 [R32],
                 [R33],
                 [R34],
                 [R35],
                 [R36],
                 [R37],
                 [R38],
                 [R39],
                 [R3A],
                 [R3B],
                 [R3C],
                 [R3D],
                 [R3E],
                 [R3F],
                 [R3G],
                 [R3H],
                 [R3I],
                 [R3J],
                 [R3K],
                 [R3L],
                 [R3M],
                 [R3N],
                 [R3O],
                 [R3P],
                 [R3Q],
                 [R3R],
                 [R3S],
                 [R3T],
                 [R3U],
                 [R3V],
                 [AllowAdd],
                 [AllowRemove],
                 [RemoveOrphans],
                 [BlockProvisioning],
                 [DiscardManualAssignments],
                 [HideOnSimplifiedView],
                 [ApprovalWorkflowType],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8],
                 [MaximumInsert],
                 [MaximumDelete],
                 [MaximumUpdate],
                 [MaximumInsertPercent],
                 [MaximumDeletePercent],
                 [MaximumUpdatePercent],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [FullName_L1],
                 [FullName_L2],
                 [FullName_L3],
                 [FullName_L4],
                 [FullName_L5],
                 [FullName_L6],
                 [FullName_L7],
                 [FullName_L8]
        FROM     [dbo].[UP_ResourceTypes]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_ResourceTypes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceTypes]', N'UP_ResourceTypes';

EXECUTE sp_rename N'[dbo].[UP_ResourceTypes].[tmp_ms_xx_index_IX_ResourceTypes1]', N'IX_ResourceTypes', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypes1]', N'PK_ResourceTypes', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_ResourceTypes_Identifier1]', N'U_ResourceTypes_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_SingleRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_SingleRoles] (
    [Id]                                           BIGINT          NOT NULL,
    [Policy_Id]                                    BIGINT          NOT NULL,
    [EntityType_Id]                                BIGINT          NOT NULL,
    [Category_Id]                                  BIGINT          NULL,
    [ValidFrom]                                    DATETIME2 (2)   CONSTRAINT [DF_SingleRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                      DATETIME2 (2)   CONSTRAINT [DF_SingleRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    [P0]                                           BIT             CONSTRAINT [DF_SingleRoles_P0] DEFAULT ((0)) NOT NULL,
    [P1]                                           BIT             CONSTRAINT [DF_SingleRoles_P1] DEFAULT ((0)) NOT NULL,
    [P2]                                           BIT             CONSTRAINT [DF_SingleRoles_P2] DEFAULT ((0)) NOT NULL,
    [P3]                                           BIT             CONSTRAINT [DF_SingleRoles_P3] DEFAULT ((0)) NOT NULL,
    [P4]                                           BIT             CONSTRAINT [DF_SingleRoles_P4] DEFAULT ((0)) NOT NULL,
    [P5]                                           BIT             CONSTRAINT [DF_SingleRoles_P5] DEFAULT ((0)) NOT NULL,
    [P6]                                           BIT             CONSTRAINT [DF_SingleRoles_P6] DEFAULT ((0)) NOT NULL,
    [P7]                                           BIT             CONSTRAINT [DF_SingleRoles_P7] DEFAULT ((0)) NOT NULL,
    [P8]                                           BIT             CONSTRAINT [DF_SingleRoles_P8] DEFAULT ((0)) NOT NULL,
    [P9]                                           BIT             CONSTRAINT [DF_SingleRoles_P9] DEFAULT ((0)) NOT NULL,
    [PA]                                           BIT             CONSTRAINT [DF_SingleRoles_PA] DEFAULT ((0)) NOT NULL,
    [PB]                                           BIT             CONSTRAINT [DF_SingleRoles_PB] DEFAULT ((0)) NOT NULL,
    [PC]                                           BIT             CONSTRAINT [DF_SingleRoles_PC] DEFAULT ((0)) NOT NULL,
    [PD]                                           BIT             CONSTRAINT [DF_SingleRoles_PD] DEFAULT ((0)) NOT NULL,
    [PE]                                           BIT             CONSTRAINT [DF_SingleRoles_PE] DEFAULT ((0)) NOT NULL,
    [PF]                                           BIT             CONSTRAINT [DF_SingleRoles_PF] DEFAULT ((0)) NOT NULL,
    [PG]                                           BIT             CONSTRAINT [DF_SingleRoles_PG] DEFAULT ((0)) NOT NULL,
    [PH]                                           BIT             CONSTRAINT [DF_SingleRoles_PH] DEFAULT ((0)) NOT NULL,
    [PI]                                           BIT             CONSTRAINT [DF_SingleRoles_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                                           BIT             CONSTRAINT [DF_SingleRoles_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                                           BIT             CONSTRAINT [DF_SingleRoles_PK] DEFAULT ((0)) NOT NULL,
    [PL]                                           BIT             CONSTRAINT [DF_SingleRoles_PL] DEFAULT ((0)) NOT NULL,
    [PM]                                           BIT             CONSTRAINT [DF_SingleRoles_PM] DEFAULT ((0)) NOT NULL,
    [PN]                                           BIT             CONSTRAINT [DF_SingleRoles_PN] DEFAULT ((0)) NOT NULL,
    [PO]                                           BIT             CONSTRAINT [DF_SingleRoles_PO] DEFAULT ((0)) NOT NULL,
    [PP]                                           BIT             CONSTRAINT [DF_SingleRoles_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                                           BIT             CONSTRAINT [DF_SingleRoles_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                                           BIT             CONSTRAINT [DF_SingleRoles_PR] DEFAULT ((0)) NOT NULL,
    [PS]                                           BIT             CONSTRAINT [DF_SingleRoles_PS] DEFAULT ((0)) NOT NULL,
    [PT]                                           BIT             CONSTRAINT [DF_SingleRoles_PT] DEFAULT ((0)) NOT NULL,
    [PU]                                           BIT             CONSTRAINT [DF_SingleRoles_PU] DEFAULT ((0)) NOT NULL,
    [PV]                                           BIT             CONSTRAINT [DF_SingleRoles_PV] DEFAULT ((0)) NOT NULL,
    [P10]                                          BIT             CONSTRAINT [DF_SingleRoles_P10] DEFAULT ((0)) NOT NULL,
    [P11]                                          BIT             CONSTRAINT [DF_SingleRoles_P11] DEFAULT ((0)) NOT NULL,
    [P12]                                          BIT             CONSTRAINT [DF_SingleRoles_P12] DEFAULT ((0)) NOT NULL,
    [P13]                                          BIT             CONSTRAINT [DF_SingleRoles_P13] DEFAULT ((0)) NOT NULL,
    [P14]                                          BIT             CONSTRAINT [DF_SingleRoles_P14] DEFAULT ((0)) NOT NULL,
    [P15]                                          BIT             CONSTRAINT [DF_SingleRoles_P15] DEFAULT ((0)) NOT NULL,
    [P16]                                          BIT             CONSTRAINT [DF_SingleRoles_P16] DEFAULT ((0)) NOT NULL,
    [P17]                                          BIT             CONSTRAINT [DF_SingleRoles_P17] DEFAULT ((0)) NOT NULL,
    [P18]                                          BIT             CONSTRAINT [DF_SingleRoles_P18] DEFAULT ((0)) NOT NULL,
    [P19]                                          BIT             CONSTRAINT [DF_SingleRoles_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                                          BIT             CONSTRAINT [DF_SingleRoles_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                                          BIT             CONSTRAINT [DF_SingleRoles_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                                          BIT             CONSTRAINT [DF_SingleRoles_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                                          BIT             CONSTRAINT [DF_SingleRoles_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                                          BIT             CONSTRAINT [DF_SingleRoles_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                                          BIT             CONSTRAINT [DF_SingleRoles_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                                          BIT             CONSTRAINT [DF_SingleRoles_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                                          BIT             CONSTRAINT [DF_SingleRoles_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                                          BIT             CONSTRAINT [DF_SingleRoles_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                                          BIT             CONSTRAINT [DF_SingleRoles_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                                          BIT             CONSTRAINT [DF_SingleRoles_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                                          BIT             CONSTRAINT [DF_SingleRoles_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                                          BIT             CONSTRAINT [DF_SingleRoles_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                                          BIT             CONSTRAINT [DF_SingleRoles_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                                          BIT             CONSTRAINT [DF_SingleRoles_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                                          BIT             CONSTRAINT [DF_SingleRoles_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                                          BIT             CONSTRAINT [DF_SingleRoles_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                                          BIT             CONSTRAINT [DF_SingleRoles_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                                          BIT             CONSTRAINT [DF_SingleRoles_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                                          BIT             CONSTRAINT [DF_SingleRoles_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                                          BIT             CONSTRAINT [DF_SingleRoles_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                                          BIT             CONSTRAINT [DF_SingleRoles_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                                          BIT             CONSTRAINT [DF_SingleRoles_P20] DEFAULT ((0)) NOT NULL,
    [P21]                                          BIT             CONSTRAINT [DF_SingleRoles_P21] DEFAULT ((0)) NOT NULL,
    [P22]                                          BIT             CONSTRAINT [DF_SingleRoles_P22] DEFAULT ((0)) NOT NULL,
    [P23]                                          BIT             CONSTRAINT [DF_SingleRoles_P23] DEFAULT ((0)) NOT NULL,
    [P24]                                          BIT             CONSTRAINT [DF_SingleRoles_P24] DEFAULT ((0)) NOT NULL,
    [P25]                                          BIT             CONSTRAINT [DF_SingleRoles_P25] DEFAULT ((0)) NOT NULL,
    [P26]                                          BIT             CONSTRAINT [DF_SingleRoles_P26] DEFAULT ((0)) NOT NULL,
    [P27]                                          BIT             CONSTRAINT [DF_SingleRoles_P27] DEFAULT ((0)) NOT NULL,
    [P28]                                          BIT             CONSTRAINT [DF_SingleRoles_P28] DEFAULT ((0)) NOT NULL,
    [P29]                                          BIT             CONSTRAINT [DF_SingleRoles_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                                          BIT             CONSTRAINT [DF_SingleRoles_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                                          BIT             CONSTRAINT [DF_SingleRoles_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                                          BIT             CONSTRAINT [DF_SingleRoles_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                                          BIT             CONSTRAINT [DF_SingleRoles_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                                          BIT             CONSTRAINT [DF_SingleRoles_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                                          BIT             CONSTRAINT [DF_SingleRoles_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                                          BIT             CONSTRAINT [DF_SingleRoles_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                                          BIT             CONSTRAINT [DF_SingleRoles_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                                          BIT             CONSTRAINT [DF_SingleRoles_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                                          BIT             CONSTRAINT [DF_SingleRoles_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                                          BIT             CONSTRAINT [DF_SingleRoles_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                                          BIT             CONSTRAINT [DF_SingleRoles_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                                          BIT             CONSTRAINT [DF_SingleRoles_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                                          BIT             CONSTRAINT [DF_SingleRoles_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                                          BIT             CONSTRAINT [DF_SingleRoles_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                                          BIT             CONSTRAINT [DF_SingleRoles_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                                          BIT             CONSTRAINT [DF_SingleRoles_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                                          BIT             CONSTRAINT [DF_SingleRoles_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                                          BIT             CONSTRAINT [DF_SingleRoles_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                                          BIT             CONSTRAINT [DF_SingleRoles_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                                          BIT             CONSTRAINT [DF_SingleRoles_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                                          BIT             CONSTRAINT [DF_SingleRoles_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                                          BIT             CONSTRAINT [DF_SingleRoles_P30] DEFAULT ((0)) NOT NULL,
    [P31]                                          BIT             CONSTRAINT [DF_SingleRoles_P31] DEFAULT ((0)) NOT NULL,
    [P32]                                          BIT             CONSTRAINT [DF_SingleRoles_P32] DEFAULT ((0)) NOT NULL,
    [P33]                                          BIT             CONSTRAINT [DF_SingleRoles_P33] DEFAULT ((0)) NOT NULL,
    [P34]                                          BIT             CONSTRAINT [DF_SingleRoles_P34] DEFAULT ((0)) NOT NULL,
    [P35]                                          BIT             CONSTRAINT [DF_SingleRoles_P35] DEFAULT ((0)) NOT NULL,
    [P36]                                          BIT             CONSTRAINT [DF_SingleRoles_P36] DEFAULT ((0)) NOT NULL,
    [P37]                                          BIT             CONSTRAINT [DF_SingleRoles_P37] DEFAULT ((0)) NOT NULL,
    [P38]                                          BIT             CONSTRAINT [DF_SingleRoles_P38] DEFAULT ((0)) NOT NULL,
    [P39]                                          BIT             CONSTRAINT [DF_SingleRoles_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                                          BIT             CONSTRAINT [DF_SingleRoles_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                                          BIT             CONSTRAINT [DF_SingleRoles_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                                          BIT             CONSTRAINT [DF_SingleRoles_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                                          BIT             CONSTRAINT [DF_SingleRoles_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                                          BIT             CONSTRAINT [DF_SingleRoles_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                                          BIT             CONSTRAINT [DF_SingleRoles_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                                          BIT             CONSTRAINT [DF_SingleRoles_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                                          BIT             CONSTRAINT [DF_SingleRoles_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                                          BIT             CONSTRAINT [DF_SingleRoles_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                                          BIT             CONSTRAINT [DF_SingleRoles_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                                          BIT             CONSTRAINT [DF_SingleRoles_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                                          BIT             CONSTRAINT [DF_SingleRoles_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                                          BIT             CONSTRAINT [DF_SingleRoles_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                                          BIT             CONSTRAINT [DF_SingleRoles_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                                          BIT             CONSTRAINT [DF_SingleRoles_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                                          BIT             CONSTRAINT [DF_SingleRoles_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                                          BIT             CONSTRAINT [DF_SingleRoles_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                                          BIT             CONSTRAINT [DF_SingleRoles_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                                          BIT             CONSTRAINT [DF_SingleRoles_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                                          BIT             CONSTRAINT [DF_SingleRoles_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                                          BIT             CONSTRAINT [DF_SingleRoles_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                                          BIT             CONSTRAINT [DF_SingleRoles_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                                           BIT             CONSTRAINT [DF_SingleRoles_R0] DEFAULT ((0)) NOT NULL,
    [R1]                                           BIT             CONSTRAINT [DF_SingleRoles_R1] DEFAULT ((0)) NOT NULL,
    [R2]                                           BIT             CONSTRAINT [DF_SingleRoles_R2] DEFAULT ((0)) NOT NULL,
    [R3]                                           BIT             CONSTRAINT [DF_SingleRoles_R3] DEFAULT ((0)) NOT NULL,
    [R4]                                           BIT             CONSTRAINT [DF_SingleRoles_R4] DEFAULT ((0)) NOT NULL,
    [R5]                                           BIT             CONSTRAINT [DF_SingleRoles_R5] DEFAULT ((0)) NOT NULL,
    [R6]                                           BIT             CONSTRAINT [DF_SingleRoles_R6] DEFAULT ((0)) NOT NULL,
    [R7]                                           BIT             CONSTRAINT [DF_SingleRoles_R7] DEFAULT ((0)) NOT NULL,
    [R8]                                           BIT             CONSTRAINT [DF_SingleRoles_R8] DEFAULT ((0)) NOT NULL,
    [R9]                                           BIT             CONSTRAINT [DF_SingleRoles_R9] DEFAULT ((0)) NOT NULL,
    [RA]                                           BIT             CONSTRAINT [DF_SingleRoles_RA] DEFAULT ((0)) NOT NULL,
    [RB]                                           BIT             CONSTRAINT [DF_SingleRoles_RB] DEFAULT ((0)) NOT NULL,
    [RC]                                           BIT             CONSTRAINT [DF_SingleRoles_RC] DEFAULT ((0)) NOT NULL,
    [RD]                                           BIT             CONSTRAINT [DF_SingleRoles_RD] DEFAULT ((0)) NOT NULL,
    [RE]                                           BIT             CONSTRAINT [DF_SingleRoles_RE] DEFAULT ((0)) NOT NULL,
    [RF]                                           BIT             CONSTRAINT [DF_SingleRoles_RF] DEFAULT ((0)) NOT NULL,
    [RG]                                           BIT             CONSTRAINT [DF_SingleRoles_RG] DEFAULT ((0)) NOT NULL,
    [RH]                                           BIT             CONSTRAINT [DF_SingleRoles_RH] DEFAULT ((0)) NOT NULL,
    [RI]                                           BIT             CONSTRAINT [DF_SingleRoles_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                                           BIT             CONSTRAINT [DF_SingleRoles_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                                           BIT             CONSTRAINT [DF_SingleRoles_RK] DEFAULT ((0)) NOT NULL,
    [RL]                                           BIT             CONSTRAINT [DF_SingleRoles_RL] DEFAULT ((0)) NOT NULL,
    [RM]                                           BIT             CONSTRAINT [DF_SingleRoles_RM] DEFAULT ((0)) NOT NULL,
    [RN]                                           BIT             CONSTRAINT [DF_SingleRoles_RN] DEFAULT ((0)) NOT NULL,
    [RO]                                           BIT             CONSTRAINT [DF_SingleRoles_RO] DEFAULT ((0)) NOT NULL,
    [RP]                                           BIT             CONSTRAINT [DF_SingleRoles_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                                           BIT             CONSTRAINT [DF_SingleRoles_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                                           BIT             CONSTRAINT [DF_SingleRoles_RR] DEFAULT ((0)) NOT NULL,
    [RS]                                           BIT             CONSTRAINT [DF_SingleRoles_RS] DEFAULT ((0)) NOT NULL,
    [RT]                                           BIT             CONSTRAINT [DF_SingleRoles_RT] DEFAULT ((0)) NOT NULL,
    [RU]                                           BIT             CONSTRAINT [DF_SingleRoles_RU] DEFAULT ((0)) NOT NULL,
    [RV]                                           BIT             CONSTRAINT [DF_SingleRoles_RV] DEFAULT ((0)) NOT NULL,
    [R10]                                          BIT             CONSTRAINT [DF_SingleRoles_R10] DEFAULT ((0)) NOT NULL,
    [R11]                                          BIT             CONSTRAINT [DF_SingleRoles_R11] DEFAULT ((0)) NOT NULL,
    [R12]                                          BIT             CONSTRAINT [DF_SingleRoles_R12] DEFAULT ((0)) NOT NULL,
    [R13]                                          BIT             CONSTRAINT [DF_SingleRoles_R13] DEFAULT ((0)) NOT NULL,
    [R14]                                          BIT             CONSTRAINT [DF_SingleRoles_R14] DEFAULT ((0)) NOT NULL,
    [R15]                                          BIT             CONSTRAINT [DF_SingleRoles_R15] DEFAULT ((0)) NOT NULL,
    [R16]                                          BIT             CONSTRAINT [DF_SingleRoles_R16] DEFAULT ((0)) NOT NULL,
    [R17]                                          BIT             CONSTRAINT [DF_SingleRoles_R17] DEFAULT ((0)) NOT NULL,
    [R18]                                          BIT             CONSTRAINT [DF_SingleRoles_R18] DEFAULT ((0)) NOT NULL,
    [R19]                                          BIT             CONSTRAINT [DF_SingleRoles_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                                          BIT             CONSTRAINT [DF_SingleRoles_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                                          BIT             CONSTRAINT [DF_SingleRoles_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                                          BIT             CONSTRAINT [DF_SingleRoles_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                                          BIT             CONSTRAINT [DF_SingleRoles_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                                          BIT             CONSTRAINT [DF_SingleRoles_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                                          BIT             CONSTRAINT [DF_SingleRoles_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                                          BIT             CONSTRAINT [DF_SingleRoles_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                                          BIT             CONSTRAINT [DF_SingleRoles_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                                          BIT             CONSTRAINT [DF_SingleRoles_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                                          BIT             CONSTRAINT [DF_SingleRoles_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                                          BIT             CONSTRAINT [DF_SingleRoles_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                                          BIT             CONSTRAINT [DF_SingleRoles_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                                          BIT             CONSTRAINT [DF_SingleRoles_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                                          BIT             CONSTRAINT [DF_SingleRoles_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                                          BIT             CONSTRAINT [DF_SingleRoles_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                                          BIT             CONSTRAINT [DF_SingleRoles_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                                          BIT             CONSTRAINT [DF_SingleRoles_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                                          BIT             CONSTRAINT [DF_SingleRoles_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                                          BIT             CONSTRAINT [DF_SingleRoles_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                                          BIT             CONSTRAINT [DF_SingleRoles_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                                          BIT             CONSTRAINT [DF_SingleRoles_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                                          BIT             CONSTRAINT [DF_SingleRoles_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                                          BIT             CONSTRAINT [DF_SingleRoles_R20] DEFAULT ((0)) NOT NULL,
    [R21]                                          BIT             CONSTRAINT [DF_SingleRoles_R21] DEFAULT ((0)) NOT NULL,
    [R22]                                          BIT             CONSTRAINT [DF_SingleRoles_R22] DEFAULT ((0)) NOT NULL,
    [R23]                                          BIT             CONSTRAINT [DF_SingleRoles_R23] DEFAULT ((0)) NOT NULL,
    [R24]                                          BIT             CONSTRAINT [DF_SingleRoles_R24] DEFAULT ((0)) NOT NULL,
    [R25]                                          BIT             CONSTRAINT [DF_SingleRoles_R25] DEFAULT ((0)) NOT NULL,
    [R26]                                          BIT             CONSTRAINT [DF_SingleRoles_R26] DEFAULT ((0)) NOT NULL,
    [R27]                                          BIT             CONSTRAINT [DF_SingleRoles_R27] DEFAULT ((0)) NOT NULL,
    [R28]                                          BIT             CONSTRAINT [DF_SingleRoles_R28] DEFAULT ((0)) NOT NULL,
    [R29]                                          BIT             CONSTRAINT [DF_SingleRoles_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                                          BIT             CONSTRAINT [DF_SingleRoles_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                                          BIT             CONSTRAINT [DF_SingleRoles_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                                          BIT             CONSTRAINT [DF_SingleRoles_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                                          BIT             CONSTRAINT [DF_SingleRoles_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                                          BIT             CONSTRAINT [DF_SingleRoles_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                                          BIT             CONSTRAINT [DF_SingleRoles_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                                          BIT             CONSTRAINT [DF_SingleRoles_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                                          BIT             CONSTRAINT [DF_SingleRoles_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                                          BIT             CONSTRAINT [DF_SingleRoles_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                                          BIT             CONSTRAINT [DF_SingleRoles_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                                          BIT             CONSTRAINT [DF_SingleRoles_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                                          BIT             CONSTRAINT [DF_SingleRoles_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                                          BIT             CONSTRAINT [DF_SingleRoles_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                                          BIT             CONSTRAINT [DF_SingleRoles_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                                          BIT             CONSTRAINT [DF_SingleRoles_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                                          BIT             CONSTRAINT [DF_SingleRoles_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                                          BIT             CONSTRAINT [DF_SingleRoles_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                                          BIT             CONSTRAINT [DF_SingleRoles_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                                          BIT             CONSTRAINT [DF_SingleRoles_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                                          BIT             CONSTRAINT [DF_SingleRoles_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                                          BIT             CONSTRAINT [DF_SingleRoles_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                                          BIT             CONSTRAINT [DF_SingleRoles_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                                          BIT             CONSTRAINT [DF_SingleRoles_R30] DEFAULT ((0)) NOT NULL,
    [R31]                                          BIT             CONSTRAINT [DF_SingleRoles_R31] DEFAULT ((0)) NOT NULL,
    [R32]                                          BIT             CONSTRAINT [DF_SingleRoles_R32] DEFAULT ((0)) NOT NULL,
    [R33]                                          BIT             CONSTRAINT [DF_SingleRoles_R33] DEFAULT ((0)) NOT NULL,
    [R34]                                          BIT             CONSTRAINT [DF_SingleRoles_R34] DEFAULT ((0)) NOT NULL,
    [R35]                                          BIT             CONSTRAINT [DF_SingleRoles_R35] DEFAULT ((0)) NOT NULL,
    [R36]                                          BIT             CONSTRAINT [DF_SingleRoles_R36] DEFAULT ((0)) NOT NULL,
    [R37]                                          BIT             CONSTRAINT [DF_SingleRoles_R37] DEFAULT ((0)) NOT NULL,
    [R38]                                          BIT             CONSTRAINT [DF_SingleRoles_R38] DEFAULT ((0)) NOT NULL,
    [R39]                                          BIT             CONSTRAINT [DF_SingleRoles_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                                          BIT             CONSTRAINT [DF_SingleRoles_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                                          BIT             CONSTRAINT [DF_SingleRoles_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                                          BIT             CONSTRAINT [DF_SingleRoles_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                                          BIT             CONSTRAINT [DF_SingleRoles_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                                          BIT             CONSTRAINT [DF_SingleRoles_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                                          BIT             CONSTRAINT [DF_SingleRoles_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                                          BIT             CONSTRAINT [DF_SingleRoles_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                                          BIT             CONSTRAINT [DF_SingleRoles_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                                          BIT             CONSTRAINT [DF_SingleRoles_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                                          BIT             CONSTRAINT [DF_SingleRoles_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                                          BIT             CONSTRAINT [DF_SingleRoles_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                                          BIT             CONSTRAINT [DF_SingleRoles_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                                          BIT             CONSTRAINT [DF_SingleRoles_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                                          BIT             CONSTRAINT [DF_SingleRoles_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                                          BIT             CONSTRAINT [DF_SingleRoles_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                                          BIT             CONSTRAINT [DF_SingleRoles_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                                          BIT             CONSTRAINT [DF_SingleRoles_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                                          BIT             CONSTRAINT [DF_SingleRoles_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                                          BIT             CONSTRAINT [DF_SingleRoles_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                                          BIT             CONSTRAINT [DF_SingleRoles_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                                          BIT             CONSTRAINT [DF_SingleRoles_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                                          BIT             CONSTRAINT [DF_SingleRoles_R3V] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType]                         INT             CONSTRAINT [DF_SingleRoles_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [HideOnSimplifiedView]                         BIT             CONSTRAINT [DF_SingleRoles_HideOnSimplifiedView] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnApproveInReview]           TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnApproveInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeclineInReview]           TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnDeclineInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeleteGapInReconciliation] TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnDeleteGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnKeepGapInReconciliation]   TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnKeepGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [Identifier]                                   VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]                               NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]                               NVARCHAR (442)  NULL,
    [DisplayName_L3]                               NVARCHAR (442)  NULL,
    [DisplayName_L4]                               NVARCHAR (442)  NULL,
    [DisplayName_L5]                               NVARCHAR (442)  NULL,
    [DisplayName_L6]                               NVARCHAR (442)  NULL,
    [DisplayName_L7]                               NVARCHAR (442)  NULL,
    [DisplayName_L8]                               NVARCHAR (442)  NULL,
    [FullName_L1]                                  NVARCHAR (4000) NULL,
    [FullName_L2]                                  NVARCHAR (4000) NULL,
    [FullName_L3]                                  NVARCHAR (4000) NULL,
    [FullName_L4]                                  NVARCHAR (4000) NULL,
    [FullName_L5]                                  NVARCHAR (4000) NULL,
    [FullName_L6]                                  NVARCHAR (4000) NULL,
    [FullName_L7]                                  NVARCHAR (4000) NULL,
    [FullName_L8]                                  NVARCHAR (4000) NULL,
    [Description_L1]                               NVARCHAR (1024) NULL,
    [Description_L2]                               NVARCHAR (1024) NULL,
    [Description_L3]                               NVARCHAR (1024) NULL,
    [Description_L4]                               NVARCHAR (1024) NULL,
    [Description_L5]                               NVARCHAR (1024) NULL,
    [Description_L6]                               NVARCHAR (1024) NULL,
    [Description_L7]                               NVARCHAR (1024) NULL,
    [Description_L8]                               NVARCHAR (1024) NULL,
    [D0_Id]                                        BIGINT          NULL,
    [D1_Id]                                        BIGINT          NULL,
    [D2_Id]                                        BIGINT          NULL,
    [D3_Id]                                        BIGINT          NULL,
    [D4_Id]                                        BIGINT          NULL,
    [D5_Id]                                        BIGINT          NULL,
    [D6_Id]                                        BIGINT          NULL,
    [D7_Id]                                        BIGINT          NULL,
    [D8_Id]                                        BIGINT          NULL,
    [D9_Id]                                        BIGINT          NULL,
    [DA_Id]                                        BIGINT          NULL,
    [DB_Id]                                        BIGINT          NULL,
    [DC_Id]                                        BIGINT          NULL,
    [DD_Id]                                        BIGINT          NULL,
    [DE_Id]                                        BIGINT          NULL,
    [DF_Id]                                        BIGINT          NULL,
    [DG_Id]                                        BIGINT          NULL,
    [DH_Id]                                        BIGINT          NULL,
    [DI_Id]                                        BIGINT          NULL,
    [DJ_Id]                                        BIGINT          NULL,
    [DK_Id]                                        BIGINT          NULL,
    [DL_Id]                                        BIGINT          NULL,
    [DM_Id]                                        BIGINT          NULL,
    [DN_Id]                                        BIGINT          NULL,
    [DO_Id]                                        BIGINT          NULL,
    [DP_Id]                                        BIGINT          NULL,
    [DQ_Id]                                        BIGINT          NULL,
    [DR_Id]                                        BIGINT          NULL,
    [DS_Id]                                        BIGINT          NULL,
    [DT_Id]                                        BIGINT          NULL,
    [DU_Id]                                        BIGINT          NULL,
    [DV_Id]                                        BIGINT          NULL,
    [D10_Id]                                       BIGINT          NULL,
    [D11_Id]                                       BIGINT          NULL,
    [D12_Id]                                       BIGINT          NULL,
    [D13_Id]                                       BIGINT          NULL,
    [D14_Id]                                       BIGINT          NULL,
    [D15_Id]                                       BIGINT          NULL,
    [D16_Id]                                       BIGINT          NULL,
    [D17_Id]                                       BIGINT          NULL,
    [D18_Id]                                       BIGINT          NULL,
    [D19_Id]                                       BIGINT          NULL,
    [D1A_Id]                                       BIGINT          NULL,
    [D1B_Id]                                       BIGINT          NULL,
    [D1C_Id]                                       BIGINT          NULL,
    [D1D_Id]                                       BIGINT          NULL,
    [D1E_Id]                                       BIGINT          NULL,
    [D1F_Id]                                       BIGINT          NULL,
    [D1G_Id]                                       BIGINT          NULL,
    [D1H_Id]                                       BIGINT          NULL,
    [D1I_Id]                                       BIGINT          NULL,
    [D1J_Id]                                       BIGINT          NULL,
    [D1K_Id]                                       BIGINT          NULL,
    [D1L_Id]                                       BIGINT          NULL,
    [D1M_Id]                                       BIGINT          NULL,
    [D1N_Id]                                       BIGINT          NULL,
    [D1O_Id]                                       BIGINT          NULL,
    [D1P_Id]                                       BIGINT          NULL,
    [D1Q_Id]                                       BIGINT          NULL,
    [D1R_Id]                                       BIGINT          NULL,
    [D1S_Id]                                       BIGINT          NULL,
    [D1T_Id]                                       BIGINT          NULL,
    [D1U_Id]                                       BIGINT          NULL,
    [D1V_Id]                                       BIGINT          NULL,
    [D20_Id]                                       BIGINT          NULL,
    [D21_Id]                                       BIGINT          NULL,
    [D22_Id]                                       BIGINT          NULL,
    [D23_Id]                                       BIGINT          NULL,
    [D24_Id]                                       BIGINT          NULL,
    [D25_Id]                                       BIGINT          NULL,
    [D26_Id]                                       BIGINT          NULL,
    [D27_Id]                                       BIGINT          NULL,
    [D28_Id]                                       BIGINT          NULL,
    [D29_Id]                                       BIGINT          NULL,
    [D2A_Id]                                       BIGINT          NULL,
    [D2B_Id]                                       BIGINT          NULL,
    [D2C_Id]                                       BIGINT          NULL,
    [D2D_Id]                                       BIGINT          NULL,
    [D2E_Id]                                       BIGINT          NULL,
    [D2F_Id]                                       BIGINT          NULL,
    [D2G_Id]                                       BIGINT          NULL,
    [D2H_Id]                                       BIGINT          NULL,
    [D2I_Id]                                       BIGINT          NULL,
    [D2J_Id]                                       BIGINT          NULL,
    [D2K_Id]                                       BIGINT          NULL,
    [D2L_Id]                                       BIGINT          NULL,
    [D2M_Id]                                       BIGINT          NULL,
    [D2N_Id]                                       BIGINT          NULL,
    [D2O_Id]                                       BIGINT          NULL,
    [D2P_Id]                                       BIGINT          NULL,
    [D2Q_Id]                                       BIGINT          NULL,
    [D2R_Id]                                       BIGINT          NULL,
    [D2S_Id]                                       BIGINT          NULL,
    [D2T_Id]                                       BIGINT          NULL,
    [D2U_Id]                                       BIGINT          NULL,
    [D2V_Id]                                       BIGINT          NULL,
    [D30_Id]                                       BIGINT          NULL,
    [D31_Id]                                       BIGINT          NULL,
    [D32_Id]                                       BIGINT          NULL,
    [D33_Id]                                       BIGINT          NULL,
    [D34_Id]                                       BIGINT          NULL,
    [D35_Id]                                       BIGINT          NULL,
    [D36_Id]                                       BIGINT          NULL,
    [D37_Id]                                       BIGINT          NULL,
    [D38_Id]                                       BIGINT          NULL,
    [D39_Id]                                       BIGINT          NULL,
    [D3A_Id]                                       BIGINT          NULL,
    [D3B_Id]                                       BIGINT          NULL,
    [D3C_Id]                                       BIGINT          NULL,
    [D3D_Id]                                       BIGINT          NULL,
    [D3E_Id]                                       BIGINT          NULL,
    [D3F_Id]                                       BIGINT          NULL,
    [D3G_Id]                                       BIGINT          NULL,
    [D3H_Id]                                       BIGINT          NULL,
    [D3I_Id]                                       BIGINT          NULL,
    [D3J_Id]                                       BIGINT          NULL,
    [D3K_Id]                                       BIGINT          NULL,
    [D3L_Id]                                       BIGINT          NULL,
    [D3M_Id]                                       BIGINT          NULL,
    [D3N_Id]                                       BIGINT          NULL,
    [D3O_Id]                                       BIGINT          NULL,
    [D3P_Id]                                       BIGINT          NULL,
    [D3Q_Id]                                       BIGINT          NULL,
    [D3R_Id]                                       BIGINT          NULL,
    [D3S_Id]                                       BIGINT          NULL,
    [D3T_Id]                                       BIGINT          NULL,
    [D3U_Id]                                       BIGINT          NULL,
    [D3V_Id]                                       BIGINT          NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_SingleRoles1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_SingleRoles_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_SingleRoles1]
    ON [dbo].[tmp_ms_xx_UP_SingleRoles]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_SingleRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_SingleRoles] ([Id], [ValidTo], [Policy_Id], [EntityType_Id], [Category_Id], [ValidFrom], [P0], [P1], [P2], [P3], [P4], [P5], [P6], [P7], [P8], [P9], [PA], [PB], [PC], [PD], [PE], [PF], [PG], [PH], [PI], [PJ], [PK], [PL], [PM], [PN], [PO], [PP], [PQ], [PR], [PS], [PT], [PU], [PV], [P10], [P11], [P12], [P13], [P14], [P15], [P16], [P17], [P18], [P19], [P1A], [P1B], [P1C], [P1D], [P1E], [P1F], [P1G], [P1H], [P1I], [P1J], [P1K], [P1L], [P1M], [P1N], [P1O], [P1P], [P1Q], [P1R], [P1S], [P1T], [P1U], [P1V], [P20], [P21], [P22], [P23], [P24], [P25], [P26], [P27], [P28], [P29], [P2A], [P2B], [P2C], [P2D], [P2E], [P2F], [P2G], [P2H], [P2I], [P2J], [P2K], [P2L], [P2M], [P2N], [P2O], [P2P], [P2Q], [P2R], [P2S], [P2T], [P2U], [P2V], [P30], [P31], [P32], [P33], [P34], [P35], [P36], [P37], [P38], [P39], [P3A], [P3B], [P3C], [P3D], [P3E], [P3F], [P3G], [P3H], [P3I], [P3J], [P3K], [P3L], [P3M], [P3N], [P3O], [P3P], [P3Q], [P3R], [P3S], [P3T], [P3U], [P3V], [R0], [R1], [R2], [R3], [R4], [R5], [R6], [R7], [R8], [R9], [RA], [RB], [RC], [RD], [RE], [RF], [RG], [RH], [RI], [RJ], [RK], [RL], [RM], [RN], [RO], [RP], [RQ], [RR], [RS], [RT], [RU], [RV], [R10], [R11], [R12], [R13], [R14], [R15], [R16], [R17], [R18], [R19], [R1A], [R1B], [R1C], [R1D], [R1E], [R1F], [R1G], [R1H], [R1I], [R1J], [R1K], [R1L], [R1M], [R1N], [R1O], [R1P], [R1Q], [R1R], [R1S], [R1T], [R1U], [R1V], [R20], [R21], [R22], [R23], [R24], [R25], [R26], [R27], [R28], [R29], [R2A], [R2B], [R2C], [R2D], [R2E], [R2F], [R2G], [R2H], [R2I], [R2J], [R2K], [R2L], [R2M], [R2N], [R2O], [R2P], [R2Q], [R2R], [R2S], [R2T], [R2U], [R2V], [R30], [R31], [R32], [R33], [R34], [R35], [R36], [R37], [R38], [R39], [R3A], [R3B], [R3C], [R3D], [R3E], [R3F], [R3G], [R3H], [R3I], [R3J], [R3K], [R3L], [R3M], [R3N], [R3O], [R3P], [R3Q], [R3R], [R3S], [R3T], [R3U], [R3V], [ApprovalWorkflowType], [HideOnSimplifiedView], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [FullName_L1], [FullName_L2], [FullName_L3], [FullName_L4], [FullName_L5], [FullName_L6], [FullName_L7], [FullName_L8], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [Id],
                 [ValidTo],
                 [Policy_Id],
                 [EntityType_Id],
                 [Category_Id],
                 [ValidFrom],
                 [P0],
                 [P1],
                 [P2],
                 [P3],
                 [P4],
                 [P5],
                 [P6],
                 [P7],
                 [P8],
                 [P9],
                 [PA],
                 [PB],
                 [PC],
                 [PD],
                 [PE],
                 [PF],
                 [PG],
                 [PH],
                 [PI],
                 [PJ],
                 [PK],
                 [PL],
                 [PM],
                 [PN],
                 [PO],
                 [PP],
                 [PQ],
                 [PR],
                 [PS],
                 [PT],
                 [PU],
                 [PV],
                 [P10],
                 [P11],
                 [P12],
                 [P13],
                 [P14],
                 [P15],
                 [P16],
                 [P17],
                 [P18],
                 [P19],
                 [P1A],
                 [P1B],
                 [P1C],
                 [P1D],
                 [P1E],
                 [P1F],
                 [P1G],
                 [P1H],
                 [P1I],
                 [P1J],
                 [P1K],
                 [P1L],
                 [P1M],
                 [P1N],
                 [P1O],
                 [P1P],
                 [P1Q],
                 [P1R],
                 [P1S],
                 [P1T],
                 [P1U],
                 [P1V],
                 [P20],
                 [P21],
                 [P22],
                 [P23],
                 [P24],
                 [P25],
                 [P26],
                 [P27],
                 [P28],
                 [P29],
                 [P2A],
                 [P2B],
                 [P2C],
                 [P2D],
                 [P2E],
                 [P2F],
                 [P2G],
                 [P2H],
                 [P2I],
                 [P2J],
                 [P2K],
                 [P2L],
                 [P2M],
                 [P2N],
                 [P2O],
                 [P2P],
                 [P2Q],
                 [P2R],
                 [P2S],
                 [P2T],
                 [P2U],
                 [P2V],
                 [P30],
                 [P31],
                 [P32],
                 [P33],
                 [P34],
                 [P35],
                 [P36],
                 [P37],
                 [P38],
                 [P39],
                 [P3A],
                 [P3B],
                 [P3C],
                 [P3D],
                 [P3E],
                 [P3F],
                 [P3G],
                 [P3H],
                 [P3I],
                 [P3J],
                 [P3K],
                 [P3L],
                 [P3M],
                 [P3N],
                 [P3O],
                 [P3P],
                 [P3Q],
                 [P3R],
                 [P3S],
                 [P3T],
                 [P3U],
                 [P3V],
                 [R0],
                 [R1],
                 [R2],
                 [R3],
                 [R4],
                 [R5],
                 [R6],
                 [R7],
                 [R8],
                 [R9],
                 [RA],
                 [RB],
                 [RC],
                 [RD],
                 [RE],
                 [RF],
                 [RG],
                 [RH],
                 [RI],
                 [RJ],
                 [RK],
                 [RL],
                 [RM],
                 [RN],
                 [RO],
                 [RP],
                 [RQ],
                 [RR],
                 [RS],
                 [RT],
                 [RU],
                 [RV],
                 [R10],
                 [R11],
                 [R12],
                 [R13],
                 [R14],
                 [R15],
                 [R16],
                 [R17],
                 [R18],
                 [R19],
                 [R1A],
                 [R1B],
                 [R1C],
                 [R1D],
                 [R1E],
                 [R1F],
                 [R1G],
                 [R1H],
                 [R1I],
                 [R1J],
                 [R1K],
                 [R1L],
                 [R1M],
                 [R1N],
                 [R1O],
                 [R1P],
                 [R1Q],
                 [R1R],
                 [R1S],
                 [R1T],
                 [R1U],
                 [R1V],
                 [R20],
                 [R21],
                 [R22],
                 [R23],
                 [R24],
                 [R25],
                 [R26],
                 [R27],
                 [R28],
                 [R29],
                 [R2A],
                 [R2B],
                 [R2C],
                 [R2D],
                 [R2E],
                 [R2F],
                 [R2G],
                 [R2H],
                 [R2I],
                 [R2J],
                 [R2K],
                 [R2L],
                 [R2M],
                 [R2N],
                 [R2O],
                 [R2P],
                 [R2Q],
                 [R2R],
                 [R2S],
                 [R2T],
                 [R2U],
                 [R2V],
                 [R30],
                 [R31],
                 [R32],
                 [R33],
                 [R34],
                 [R35],
                 [R36],
                 [R37],
                 [R38],
                 [R39],
                 [R3A],
                 [R3B],
                 [R3C],
                 [R3D],
                 [R3E],
                 [R3F],
                 [R3G],
                 [R3H],
                 [R3I],
                 [R3J],
                 [R3K],
                 [R3L],
                 [R3M],
                 [R3N],
                 [R3O],
                 [R3P],
                 [R3Q],
                 [R3R],
                 [R3S],
                 [R3T],
                 [R3U],
                 [R3V],
                 [ApprovalWorkflowType],
                 [HideOnSimplifiedView],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [FullName_L1],
                 [FullName_L2],
                 [FullName_L3],
                 [FullName_L4],
                 [FullName_L5],
                 [FullName_L6],
                 [FullName_L7],
                 [FullName_L8],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8],
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
        FROM     [dbo].[UP_SingleRoles]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_SingleRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_SingleRoles]', N'UP_SingleRoles';

EXECUTE sp_rename N'[dbo].[UP_SingleRoles].[tmp_ms_xx_index_IX_SingleRoles1]', N'IX_SingleRoles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SingleRoles1]', N'PK_SingleRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_SingleRoles_Identifier1]', N'U_SingleRoles_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UW_Aspects]...';


GO
ALTER TABLE [dbo].[UW_Aspects]
    ADD [IfExpression] NVARCHAR (MAX) NULL;


GO
PRINT N'Altering [dbo].[UW_Recipients]...';


GO
ALTER TABLE [dbo].[UW_Recipients]
    ADD [Expression] NVARCHAR (MAX) NULL;


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
    ON [dbo].[tmp_ms_xx_UM_EntityAssociations]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UM_EntityAssociations])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UM_EntityAssociations] ([Id], [ValidTo], [Identifier], [Property1_Id], [Property2_Id], [IsProperty1Collection], [IsProperty2Collection], [ValidFrom], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8])
        SELECT   [Id],
                 [ValidTo],
                 [Identifier],
                 [Property1_Id],
                 [Property2_Id],
                 [IsProperty1Collection],
                 [IsProperty2Collection],
                 [ValidFrom],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8]
        FROM     [dbo].[UM_EntityAssociations]
        ORDER BY [Id] ASC, [ValidTo] ASC;
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
    ON [dbo].[tmp_ms_xx_UM_EntityProperties]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UM_EntityProperties])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UM_EntityProperties] ([Id], [ValidTo], [EntityType_Id], [Identifier], [Type], [TargetColumnIndex], [IsKey], [HistoryPrecision], [ValidFrom], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [Language_Id], [NeutralProperty_Id], [FlexibleComparisonExpression])
        SELECT   [Id],
                 [ValidTo],
                 [EntityType_Id],
                 [Identifier],
                 [Type],
                 [TargetColumnIndex],
                 [IsKey],
                 [HistoryPrecision],
                 [ValidFrom],
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
        ORDER BY [Id] ASC, [ValidTo] ASC;
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
    ON [dbo].[tmp_ms_xx_UM_EntityTypes]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UM_EntityTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UM_EntityTypes] ([Id], [ValidTo], [Identifier], [ValidFrom], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [TableName])
        SELECT   [Id],
                 [ValidTo],
                 [Identifier],
                 [ValidFrom],
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
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UM_EntityTypes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UM_EntityTypes]', N'UM_EntityTypes';

EXECUTE sp_rename N'[dbo].[UM_EntityTypes].[tmp_ms_xx_index_IX_EntityTypes1]', N'IX_EntityTypes', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_EntityTypes1]', N'PK_EntityTypes', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_EntityTypes_Identifier1]', N'U_EntityTypes_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


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
    [IsExternal]            BIT            CONSTRAINT [DF_Policies_IsExternal] DEFAULT ((0)) NOT NULL,
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
    ON [dbo].[tmp_ms_xx_UP_Policies]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_Policies])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_Policies] ([Id], [ValidTo], [IsProvisioningEnabled], [IsSimulationEnabled], [IsExternal], [Identifier], [ValidFrom], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [Id],
                 [ValidTo],
                 [IsProvisioningEnabled],
                 [IsSimulationEnabled],
                 [IsExternal],
                 [Identifier],
                 [ValidFrom],
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
        FROM     [dbo].[UP_Policies]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_Policies];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_Policies]', N'UP_Policies';

EXECUTE sp_rename N'[dbo].[UP_Policies].[tmp_ms_xx_index_IX_Policies1]', N'IX_Policies', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Policies1]', N'PK_Policies', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Policies_Identifier1]', N'U_Policies_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_Risks]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_Risks] (
    [Id]             BIGINT          NOT NULL,
    [Policy_Id]      BIGINT          NOT NULL,
    [EntityType_Id]  BIGINT          NOT NULL,
    [Identifier]     VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [RiskType]       TINYINT         CONSTRAINT [DF_Risks_RiskType] DEFAULT ((0)) NOT NULL,
    [IsBlocking]     BIT             CONSTRAINT [DF_Risks_IsBlocking] DEFAULT ((0)) NOT NULL,
    [Level]          TINYINT         CONSTRAINT [DF_Risks_Level] DEFAULT ((0)) NOT NULL,
    [ValidFrom]      DATETIME2 (2)   CONSTRAINT [DF_Risks_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]        DATETIME2 (2)   CONSTRAINT [DF_Risks_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
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
    [Remediation_L1] NVARCHAR (2048) NULL,
    [Remediation_L2] NVARCHAR (2048) NULL,
    [Remediation_L3] NVARCHAR (2048) NULL,
    [Remediation_L4] NVARCHAR (2048) NULL,
    [Remediation_L5] NVARCHAR (2048) NULL,
    [Remediation_L6] NVARCHAR (2048) NULL,
    [Remediation_L7] NVARCHAR (2048) NULL,
    [Remediation_L8] NVARCHAR (2048) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Risks1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_Risks1]
    ON [dbo].[tmp_ms_xx_UP_Risks]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_Risks])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_Risks] ([Id], [ValidTo], [Policy_Id], [EntityType_Id], [Identifier], [RiskType], [IsBlocking], [Level], [ValidFrom], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8], [Remediation_L1], [Remediation_L2], [Remediation_L3], [Remediation_L4], [Remediation_L5], [Remediation_L6], [Remediation_L7], [Remediation_L8])
        SELECT   [Id],
                 [ValidTo],
                 [Policy_Id],
                 [EntityType_Id],
                 [Identifier],
                 [RiskType],
                 [IsBlocking],
                 [Level],
                 [ValidFrom],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8],
                 [Remediation_L1],
                 [Remediation_L2],
                 [Remediation_L3],
                 [Remediation_L4],
                 [Remediation_L5],
                 [Remediation_L6],
                 [Remediation_L7],
                 [Remediation_L8]
        FROM     [dbo].[UP_Risks]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_Risks];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_Risks]', N'UP_Risks';

EXECUTE sp_rename N'[dbo].[UP_Risks].[tmp_ms_xx_index_IX_Risks1]', N'IX_Risks', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Risks1]', N'PK_Risks', N'OBJECT';

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
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceFiles1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceFiles1]
    ON [dbo].[tmp_ms_xx_UR_ResourceFiles]([ValidTo] ASC, [Resource_Id] ASC, [Property_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_ResourceFiles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceFiles] ([ValidTo], [Resource_Id], [Property_Id], [Id], [FileName], [MimeType], [Data], [ValidFrom])
        SELECT   [ValidTo],
                 [Resource_Id],
                 [Property_Id],
                 [Id],
                 [FileName],
                 [MimeType],
                 [Data],
                 [ValidFrom]
        FROM     [dbo].[UR_ResourceFiles]
        ORDER BY [ValidTo] ASC, [Resource_Id] ASC, [Property_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UR_ResourceFiles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceFiles]', N'UR_ResourceFiles';

EXECUTE sp_rename N'[dbo].[UR_ResourceFiles].[tmp_ms_xx_index_IX_ResourceFiles1]', N'IX_ResourceFiles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceFiles1]', N'PK_ResourceFiles', N'OBJECT';

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

CREATE UNIQUE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceLinks_11]
    ON [dbo].[tmp_ms_xx_UR_ResourceLinks]([ValidTo] ASC, [Type] ASC, [R1_Id] ASC, [R2_Id] ASC, [ValidFrom] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_ResourceLinks])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_ResourceLinks] ([ValidTo], [Type], [R1_Id], [R2_Id], [ValidFrom])
        SELECT   [ValidTo],
                 [Type],
                 [R1_Id],
                 [R2_Id],
                 [ValidFrom]
        FROM     [dbo].[UR_ResourceLinks]
        ORDER BY [ValidTo] ASC, [Type] ASC, [R1_Id] ASC, [R2_Id] ASC, [ValidFrom] ASC;
    END

DROP TABLE [dbo].[UR_ResourceLinks];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_ResourceLinks]', N'UR_ResourceLinks';

EXECUTE sp_rename N'[dbo].[UR_ResourceLinks].[tmp_ms_xx_index_IX_ResourceLinks_11]', N'IX_ResourceLinks_1', N'INDEX';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UR_ResourceLinks].[IX_ResourceLinks_2]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ResourceLinks_2]
    ON [dbo].[UR_ResourceLinks]([ValidTo] ASC, [Type] ASC, [R2_Id] ASC, [R1_Id] ASC, [ValidFrom] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


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
    CONSTRAINT [tmp_ms_xx_constraint_PK_Resources1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

CREATE UNIQUE CLUSTERED INDEX [tmp_ms_xx_index_IX_Resources1]
    ON [dbo].[tmp_ms_xx_UR_Resources]([ValidTo] ASC, [Type] ASC, [Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UR_Resources])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UR_Resources] ([ValidTo], [Type], [Id], [ValidFrom], [Dirty], [DisplayName_L1], [C0], [C1], [C2], [C3], [C4], [C5], [C6], [C7], [C8], [C9], [CA], [CB], [CC], [CD], [CE], [DisplayName_L2], [I40], [I41], [CF], [CG], [CH], [CI], [CJ], [CK], [CL], [CM], [CN], [CO], [CP], [CQ], [CR], [CS], [CT], [DisplayName_L3], [I42], [I43], [CU], [CV], [C10], [C11], [C12], [C13], [C14], [C15], [C16], [C17], [C18], [C19], [C1A], [C1B], [C1C], [DisplayName_L4], [I44], [I45], [C1D], [C1E], [C1F], [C1G], [C1H], [C1I], [C1J], [C1K], [C1L], [C1M], [C1N], [C1O], [C1P], [C1Q], [C1R], [DisplayName_L5], [I46], [I47], [C1S], [C1T], [C1U], [C1V], [C20], [C21], [C22], [C23], [C24], [C25], [C26], [C27], [C28], [C29], [C2A], [DisplayName_L6], [I48], [I49], [C2B], [C2C], [C2D], [C2E], [C2F], [C2G], [C2H], [C2I], [C2J], [C2K], [C2L], [C2M], [C2N], [DisplayName_L7], [C2O], [C2P], [C2Q], [C2R], [C2S], [C2T], [C2U], [C2V], [C30], [C31], [C32], [C33], [C34], [C35], [C36], [DisplayName_L8], [C37], [C38], [C39], [C3A], [C3B], [C3C], [C3D], [C3E], [C3F], [C3G], [C3H], [C3I], [C3J], [C3K], [C3L], [C3M], [C3N], [C3O], [C3P], [C3Q], [C3R], [C3S], [C3T], [C3U], [C3V])
        SELECT   [ValidTo],
                 [Type],
                 [Id],
                 [ValidFrom],
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
                 [DisplayName_L2],
                 [I40],
                 [I41],
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
                 [DisplayName_L3],
                 [I42],
                 [I43],
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
                 [DisplayName_L4],
                 [I44],
                 [I45],
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
                 [DisplayName_L5],
                 [I46],
                 [I47],
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
                 [DisplayName_L6],
                 [I48],
                 [I49],
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
                 [DisplayName_L7],
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
                 [DisplayName_L8],
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
        FROM     [dbo].[UR_Resources]
        ORDER BY [ValidTo] ASC, [Type] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UR_Resources];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UR_Resources]', N'UR_Resources';

EXECUTE sp_rename N'[dbo].[UR_Resources].[tmp_ms_xx_index_IX_Resources1]', N'IX_Resources', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Resources1]', N'PK_Resources', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UR_Resources].[IX_Resources_DisplayName_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_Resources_DisplayName_L1]
    ON [dbo].[UR_Resources]([DisplayName_L1] ASC, [Id] ASC) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.9999999') WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Creating [dbo].[UR_Resources].[IX_Resources_Dirty]...';


GO
CREATE NONCLUSTERED INDEX [IX_Resources_Dirty]
    ON [dbo].[UR_Resources]([Dirty] ASC) WHERE "Dirty"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.9999999') WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO
PRINT N'Starting rebuilding table [dbo].[UP_IdentifiedRisks]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_IdentifiedRisks] (
    [Id]                        BIGINT        NOT NULL,
    [Owner_Id]                  BIGINT        NOT NULL,
    [Risk_Id]                   BIGINT        NOT NULL,
    [StartDate]                 SMALLDATETIME CONSTRAINT [DF_IdentifiedRisks_StartDate] DEFAULT CONVERT (SMALLDATETIME, '19000101', 112) NOT NULL,
    [EndDate]                   SMALLDATETIME CONSTRAINT [DF_IdentifiedRisks_EndDate] DEFAULT CONVERT (SMALLDATETIME, '20790606', 112) NOT NULL,
    [WorkflowInstance_Id]       BIGINT        NULL,
    [AssignedSingleRole1_Id]    BIGINT        NULL,
    [AssignedSingleRole2_Id]    BIGINT        NULL,
    [AssignedCompositeRole1_Id] BIGINT        NULL,
    [AssignedCompositeRole2_Id] BIGINT        NULL,
    [ValidFrom]                 DATETIME2 (2) CONSTRAINT [DF_IdentifiedRisks_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                   DATETIME2 (2) CONSTRAINT [DF_IdentifiedRisks_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_CK_IdentifiedRisks1] UNIQUE CLUSTERED ([ValidTo] ASC, [Owner_Id] ASC, [Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_PK_IdentifiedRisks1] PRIMARY KEY NONCLUSTERED ([ValidTo] ASC, [Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_IdentifiedRisks])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_IdentifiedRisks] ([ValidTo], [Owner_Id], [Id], [Risk_Id], [StartDate], [EndDate], [WorkflowInstance_Id], [AssignedSingleRole1_Id], [AssignedSingleRole2_Id], [AssignedCompositeRole1_Id], [AssignedCompositeRole2_Id], [ValidFrom])
        SELECT   [ValidTo],
                 [Owner_Id],
                 [Id],
                 [Risk_Id],
                 [StartDate],
                 [EndDate],
                 [WorkflowInstance_Id],
                 [AssignedSingleRole1_Id],
                 [AssignedSingleRole2_Id],
                 [AssignedCompositeRole1_Id],
                 [AssignedCompositeRole2_Id],
                 [ValidFrom]
        FROM     [dbo].[UP_IdentifiedRisks]
        ORDER BY [ValidTo] ASC, [Owner_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_IdentifiedRisks];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_IdentifiedRisks]', N'UP_IdentifiedRisks';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_CK_IdentifiedRisks1]', N'CK_IdentifiedRisks', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_IdentifiedRisks1]', N'PK_IdentifiedRisks', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UT_InsertResourceLinks]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_InsertResourceLinks] (
    [ChangeOperation] INT             NULL,
    [R1_Identifier]   NVARCHAR (4000) NOT NULL,
    [R2_Identifier]   NVARCHAR (4000) NOT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_InsertResourceLinks])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_InsertResourceLinks] ([ChangeOperation], [R1_Identifier], [R2_Identifier])
        SELECT [ChangeOperation],
               [R1_Identifier],
               [R2_Identifier]
        FROM   [dbo].[UT_InsertResourceLinks];
    END

DROP TABLE [dbo].[UT_InsertResourceLinks];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_InsertResourceLinks]', N'UT_InsertResourceLinks';


GO
PRINT N'Starting rebuilding table [dbo].[UT_NotificationInstances]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_NotificationInstances] (
    [Notification_Id]   BIGINT   NOT NULL,
    [OwnerResource_Id]  BIGINT   NOT NULL,
    [LastExecutionDate] DATETIME NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_NotificationInstances])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_NotificationInstances] ([Notification_Id], [OwnerResource_Id], [LastExecutionDate])
        SELECT [Notification_Id],
               [OwnerResource_Id],
               [LastExecutionDate]
        FROM   [dbo].[UT_NotificationInstances];
    END

DROP TABLE [dbo].[UT_NotificationInstances];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_NotificationInstances]', N'UT_NotificationInstances';


GO
PRINT N'Starting rebuilding table [dbo].[UT_OnlyId]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_OnlyId] (
    [Id] BIGINT NOT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_OnlyId])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_OnlyId] ([Id])
        SELECT [Id]
        FROM   [dbo].[UT_OnlyId];
    END

DROP TABLE [dbo].[UT_OnlyId];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_OnlyId]', N'UT_OnlyId';


GO
PRINT N'Starting rebuilding table [dbo].[UT_ResourceLinks]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_ResourceLinks] (
    [R1_Id] BIGINT NOT NULL,
    [R2_Id] BIGINT NOT NULL,
    [Type]  BIGINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_ResourceLinks])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_ResourceLinks] ([R1_Id], [R2_Id], [Type])
        SELECT [R1_Id],
               [R2_Id],
               [Type]
        FROM   [dbo].[UT_ResourceLinks];
    END

DROP TABLE [dbo].[UT_ResourceLinks];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_ResourceLinks]', N'UT_ResourceLinks';


GO
PRINT N'Starting rebuilding table [dbo].[UT_ResourceOrphans]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_ResourceOrphans] (
    [Type]          BIGINT          NULL,
    [R1_Identifier] NVARCHAR (4000) NOT NULL,
    [R2_Identifier] NVARCHAR (4000) NOT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_ResourceOrphans])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_ResourceOrphans] ([Type], [R1_Identifier], [R2_Identifier])
        SELECT [Type],
               [R1_Identifier],
               [R2_Identifier]
        FROM   [dbo].[UT_ResourceOrphans];
    END

DROP TABLE [dbo].[UT_ResourceOrphans];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_ResourceOrphans]', N'UT_ResourceOrphans';


GO
PRINT N'Starting rebuilding table [dbo].[UT_TempNavigations]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_TempNavigations] (
    [Id] BIGINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_TempNavigations])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_TempNavigations] ([Id])
        SELECT [Id]
        FROM   [dbo].[UT_TempNavigations];
    END

DROP TABLE [dbo].[UT_TempNavigations];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_TempNavigations]', N'UT_TempNavigations';


GO
PRINT N'Starting rebuilding table [dbo].[UT_TempOwner]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_TempOwner] (
    [Owner_Id] BIGINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_TempOwner])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_TempOwner] ([Owner_Id])
        SELECT [Owner_Id]
        FROM   [dbo].[UT_TempOwner];
    END

DROP TABLE [dbo].[UT_TempOwner];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_TempOwner]', N'UT_TempOwner';


GO
PRINT N'Starting rebuilding table [dbo].[UT_TempSacalars]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_TempSacalars] (
    [Id] BIGINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_TempSacalars])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_TempSacalars] ([Id])
        SELECT [Id]
        FROM   [dbo].[UT_TempSacalars];
    END

DROP TABLE [dbo].[UT_TempSacalars];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_TempSacalars]', N'UT_TempSacalars';


GO
PRINT N'Starting rebuilding table [dbo].[UT_TempTypes]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_TempTypes] (
    [Id] BIGINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_TempTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_TempTypes] ([Id])
        SELECT [Id]
        FROM   [dbo].[UT_TempTypes];
    END

DROP TABLE [dbo].[UT_TempTypes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_TempTypes]', N'UT_TempTypes';


GO
PRINT N'Starting rebuilding table [dbo].[UT_BigInts]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_BigInts] (
    [Id]    BIGINT NOT NULL,
    [Value] BIGINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_BigInts])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_BigInts] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_BigInts];
    END

DROP TABLE [dbo].[UT_BigInts];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_BigInts]', N'UT_BigInts';


GO
PRINT N'Starting rebuilding table [dbo].[UT_Bits]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_Bits] (
    [Id]    BIGINT NOT NULL,
    [Value] BIT    NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_Bits])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_Bits] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_Bits];
    END

DROP TABLE [dbo].[UT_Bits];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_Bits]', N'UT_Bits';


GO
PRINT N'Starting rebuilding table [dbo].[UT_ConsolidateProvisioningState]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_ConsolidateProvisioningState] (
    [Id]    BIGINT  NOT NULL,
    [Value] TINYINT NOT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_ConsolidateProvisioningState])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_ConsolidateProvisioningState] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_ConsolidateProvisioningState];
    END

DROP TABLE [dbo].[UT_ConsolidateProvisioningState];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_ConsolidateProvisioningState]', N'UT_ConsolidateProvisioningState';


GO
PRINT N'Starting rebuilding table [dbo].[UT_Ints]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_Ints] (
    [Id]    BIGINT NOT NULL,
    [Value] INT    NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_Ints])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_Ints] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_Ints];
    END

DROP TABLE [dbo].[UT_Ints];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_Ints]', N'UT_Ints';


GO
PRINT N'Starting rebuilding table [dbo].[UT_NvarChar]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_NvarChar] (
    [Id]    BIGINT          NOT NULL,
    [Value] NVARCHAR (4000) NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_NvarChar])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_NvarChar] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_NvarChar];
    END

DROP TABLE [dbo].[UT_NvarChar];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_NvarChar]', N'UT_NvarChar';


GO
PRINT N'Starting rebuilding table [dbo].[UT_ResourceFiles]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_ResourceFiles] (
    [ChangeOperation] INT             NULL,
    [Id]              BIGINT          NOT NULL,
    [Identifier]      NVARCHAR (4000) NOT NULL,
    [Data]            VARBINARY (MAX) NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_ResourceFiles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_ResourceFiles] ([ChangeOperation], [Id], [Identifier], [Data])
        SELECT [ChangeOperation],
               [Id],
               [Identifier],
               [Data]
        FROM   [dbo].[UT_ResourceFiles];
    END

DROP TABLE [dbo].[UT_ResourceFiles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_ResourceFiles]', N'UT_ResourceFiles';


GO
PRINT N'Starting rebuilding table [dbo].[UT_Resources]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_Resources] (
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

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_Resources])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_Resources] ([Id], [Type], [DisplayName_L1], [C0], [C1], [C2], [C3], [C4], [C5], [C6], [C7], [C8], [C9], [CA], [CB], [CC], [CD], [CE], [DisplayName_L2], [I40], [I41], [CF], [CG], [CH], [CI], [CJ], [CK], [CL], [CM], [CN], [CO], [CP], [CQ], [CR], [CS], [CT], [DisplayName_L3], [I42], [I43], [CU], [CV], [C10], [C11], [C12], [C13], [C14], [C15], [C16], [C17], [C18], [C19], [C1A], [C1B], [C1C], [DisplayName_L4], [I44], [I45], [C1D], [C1E], [C1F], [C1G], [C1H], [C1I], [C1J], [C1K], [C1L], [C1M], [C1N], [C1O], [C1P], [C1Q], [C1R], [DisplayName_L5], [I46], [I47], [C1S], [C1T], [C1U], [C1V], [C20], [C21], [C22], [C23], [C24], [C25], [C26], [C27], [C28], [C29], [C2A], [DisplayName_L6], [I48], [I49], [C2B], [C2C], [C2D], [C2E], [C2F], [C2G], [C2H], [C2I], [C2J], [C2K], [C2L], [C2M], [C2N], [DisplayName_L7], [C2O], [C2P], [C2Q], [C2R], [C2S], [C2T], [C2U], [C2V], [C30], [C31], [C32], [C33], [C34], [C35], [C36], [DisplayName_L8], [C37], [C38], [C39], [C3A], [C3B], [C3C], [C3D], [C3E], [C3F], [C3G], [C3H], [C3I], [C3J], [C3K], [C3L], [C3M], [C3N], [C3O], [C3P], [C3Q], [C3R], [C3S], [C3T], [C3U], [C3V])
        SELECT [Id],
               [Type],
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
               [DisplayName_L2],
               [I40],
               [I41],
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
               [DisplayName_L3],
               [I42],
               [I43],
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
               [DisplayName_L4],
               [I44],
               [I45],
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
               [DisplayName_L5],
               [I46],
               [I47],
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
               [DisplayName_L6],
               [I48],
               [I49],
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
               [DisplayName_L7],
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
               [DisplayName_L8],
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
        FROM   [dbo].[UT_Resources];
    END

DROP TABLE [dbo].[UT_Resources];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_Resources]', N'UT_Resources';


GO
PRINT N'Starting rebuilding table [dbo].[UT_SmallDateTimes]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_SmallDateTimes] (
    [Id]    BIGINT        NOT NULL,
    [Value] SMALLDATETIME NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_SmallDateTimes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_SmallDateTimes] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_SmallDateTimes];
    END

DROP TABLE [dbo].[UT_SmallDateTimes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_SmallDateTimes]', N'UT_SmallDateTimes';


GO
PRINT N'Starting rebuilding table [dbo].[UT_SmallInts]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_SmallInts] (
    [Id]    BIGINT   NOT NULL,
    [Value] SMALLINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_SmallInts])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_SmallInts] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_SmallInts];
    END

DROP TABLE [dbo].[UT_SmallInts];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_SmallInts]', N'UT_SmallInts';


GO
PRINT N'Starting rebuilding table [dbo].[UT_TinyInts]...';


GO
CREATE TABLE [dbo].[tmp_ms_xx_UT_TinyInts] (
    [Id]    BIGINT  NOT NULL,
    [Value] TINYINT NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UT_TinyInts])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UT_TinyInts] ([Id], [Value])
        SELECT [Id],
               [Value]
        FROM   [dbo].[UT_TinyInts];
    END

DROP TABLE [dbo].[UT_TinyInts];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UT_TinyInts]', N'UT_TinyInts';


GO
PRINT N'Creating [dbo].[UT_OnlyNVarchar]...';


GO
CREATE TABLE [dbo].[UT_OnlyNVarchar] (
    [Value] NVARCHAR (4000) NOT NULL
);


GO
PRINT N'Creating [dbo].[UT_ResourceCorrelationKeys]...';


GO
CREATE TABLE [dbo].[UT_ResourceCorrelationKeys] (
    [BindingExpressionHash] INT            NOT NULL,
    [Resource_Id]           BIGINT         NOT NULL,
    [Value]                 NVARCHAR (442) NOT NULL,
    [NewValue]              NVARCHAR (442) NULL,
    CONSTRAINT [PK_TmpResourceCorrelationKeys] PRIMARY KEY CLUSTERED ([BindingExpressionHash] ASC, [Value] ASC, [Resource_Id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
);


GO
PRINT N'Creating [dbo].[UR_ResourceLinks].[S_ResourceLinks_TypeR1]...';


GO
CREATE STATISTICS [S_ResourceLinks_TypeR1]
    ON [dbo].[UR_ResourceLinks]([Type], [R1_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99')
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[UR_ResourceLinks].[S_ResourceLinks_TypeR2]...';


GO
CREATE STATISTICS [S_ResourceLinks_TypeR2]
    ON [dbo].[UR_ResourceLinks]([Type], [R2_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99')
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[UR_Resources].[S_Resources_Type]...';


GO
CREATE STATISTICS [S_Resources_Type]
    ON [dbo].[UR_Resources]([Type]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99')
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[FK_EntityTypeMappings_EntityType]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityTypeMappings_EntityType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityTypeMappings_Connector]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityTypeMappings_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ScaffoldingArguments_Scaffolding]...';


GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] WITH NOCHECK
    ADD CONSTRAINT [FK_ScaffoldingArguments_Scaffolding] FOREIGN KEY ([Scaffolding_Id]) REFERENCES [dbo].[UD_Scaffoldings] ([Id]);


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
PRINT N'Creating [dbo].[FK_Scaffolding_Connector]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Agent]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Agent] FOREIGN KEY ([Agent_Id]) REFERENCES [dbo].[UC_Agents] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Workflow]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Workflow] FOREIGN KEY ([Workflow_Id]) REFERENCES [dbo].[UW_Workflows] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Scaffolding_Universe]...';


GO
ALTER TABLE [dbo].[UD_Scaffoldings] WITH NOCHECK
    ADD CONSTRAINT [FK_Scaffolding_Universe] FOREIGN KEY ([Universe_Id]) REFERENCES [dbo].[UU_Universes] ([Id]);


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
PRINT N'Creating [dbo].[FK_AssignedResourceNavigations_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceNavigations_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] NOCHECK CONSTRAINT [FK_AssignedResourceNavigations_Property];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceNavigations_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceNavigations_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceNavigations] NOCHECK CONSTRAINT [FK_AssignedResourceNavigations_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceScalars_Property]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceScalars_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] NOCHECK CONSTRAINT [FK_AssignedResourceScalars_Property];


GO
PRINT N'Creating [dbo].[FK_AssignedResourceScalars_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceScalars_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceScalars] NOCHECK CONSTRAINT [FK_AssignedResourceScalars_WorkflowInstance];


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
PRINT N'Creating [dbo].[FK_CompositeRolesCategories_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRolesCategories_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_CompositeRoles] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_CompositeRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


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
PRINT N'Creating [dbo].[FK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_ResourceType]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileRuleContexts_ResourceType_Id]...';


GO
ALTER TABLE [dbo].[UA_ProfileRuleContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


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
PRINT N'Creating [dbo].[FK_TaskResourceTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskResourceTypes_EntityType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_ResourceType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypesCategories_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypesCategories_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRuleItems_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationDataFilters_ResourceType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceTypes_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_ContextRule]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_ContextRule] FOREIGN KEY ([ContextRule_Id]) REFERENCES [dbo].[UP_ContextRules] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityInstances_FilterResourceType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityInstances_FilterResourceType] FOREIGN KEY ([FilterResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_SingleRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_SingleRole0] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


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
PRINT N'Creating [dbo].[FK_SingleRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssociationInstances_Association]...';


GO
ALTER TABLE [dbo].[UU_AssociationInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_AssociationInstances_Association] FOREIGN KEY ([Association_Id]) REFERENCES [dbo].[UM_EntityAssociations] ([Id]);


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
PRINT N'Creating [dbo].[FK_DisplayEntityAssociations_EntityAssociation]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityAssociations_EntityAssociation] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityAssociations] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceLinks_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceLinks] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceLinks_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[UM_EntityAssociations] ([Id]);


GO
ALTER TABLE [dbo].[UR_ResourceLinks] NOCHECK CONSTRAINT [FK_ResourceLinks_Type];


GO
PRINT N'Creating [dbo].[FK_EntityPropertyMappings_EntityProperty]...';


GO
ALTER TABLE [dbo].[UC_EntityPropertyMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityPropertyMappings_EntityProperty] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_IndirectResourceRules_DenialProperty]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_DenialProperty] FOREIGN KEY ([DenialProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RecordProperties_Property_Id]...';


GO
ALTER TABLE [dbo].[UP_RecordProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_RecordProperties_Property_Id] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Changes_Property]...';


GO
ALTER TABLE [dbo].[UW_Changes] WITH NOCHECK
    ADD CONSTRAINT [FK_Changes_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_BindingItems_Property]...';


GO
ALTER TABLE [dbo].[UM_BindingItems] WITH NOCHECK
    ADD CONSTRAINT [FK_BindingItems_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_RiskRuleItems_Property]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty] FOREIGN KEY ([ParentTreeNavDisplayProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_DisplayEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityProperties_EntityProperty] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_EntityInstances_FilterProperty]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityInstances_FilterProperty] FOREIGN KEY ([FilterProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityInstances_FilterEntityProperty]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityInstances_FilterEntityProperty] FOREIGN KEY ([FilterEntityProperty_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceFiles_Property]...';


GO
ALTER TABLE [dbo].[UR_ResourceFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceFiles_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessControlEntityProperties_EntityProperty]...';


GO
ALTER TABLE [dbo].[UA_AccessControlEntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessControlEntityProperties_EntityProperty] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


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
PRINT N'Creating [dbo].[FK_FormControls_EntityType]...';


GO
ALTER TABLE [dbo].[UI_FormControls] WITH NOCHECK
    ADD CONSTRAINT [FK_FormControls_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessControlRules_EntityType]...';


GO
ALTER TABLE [dbo].[UA_AccessControlRules] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessControlRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayTables_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayTables] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayTables_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskEntityTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskEntityTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskEntityTypes_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Tiles_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Tiles] WITH NOCHECK
    ADD CONSTRAINT [FK_Tiles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DisplayEntityTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityTypes_EntityType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_MenuItems_EntityType]...';


GO
ALTER TABLE [dbo].[UI_MenuItems] WITH NOCHECK
    ADD CONSTRAINT [FK_MenuItems_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Notifications_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[UN_Notifications] WITH NOCHECK
    ADD CONSTRAINT [FK_Notifications_OwnerEntityType] FOREIGN KEY ([OwnerEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Dimensions_EntityType]...';


GO
ALTER TABLE [dbo].[UM_Dimensions] WITH NOCHECK
    ADD CONSTRAINT [FK_Dimensions_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_SourceEntityTypes]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_SourceEntityTypes] FOREIGN KEY ([SourceEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Risks_EntityType]...';


GO
ALTER TABLE [dbo].[UP_Risks] WITH NOCHECK
    ADD CONSTRAINT [FK_Risks_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityPropertyExpressions_EntityType]...';


GO
ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityPropertyExpressions_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ReportQueries_EntityType]...';


GO
ALTER TABLE [dbo].[UQ_ReportQueries] WITH NOCHECK
    ADD CONSTRAINT [FK_ReportQueries_EntityType] FOREIGN KEY ([ReturnedEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


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
PRINT N'Creating [dbo].[FK_ResourceChanges_Type]...';


GO
ALTER TABLE [dbo].[UR_ResourceChanges] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceChanges_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
ALTER TABLE [dbo].[UR_ResourceChanges] NOCHECK CONSTRAINT [FK_ResourceChanges_Type];


GO
PRINT N'Creating [dbo].[FK_Resources_Type]...';


GO
ALTER TABLE [dbo].[UR_Resources] WITH NOCHECK
    ADD CONSTRAINT [FK_Resources_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
ALTER TABLE [dbo].[UR_Resources] NOCHECK CONSTRAINT [FK_Resources_Type];


GO
PRINT N'Creating [dbo].[FK_AccessCertificationCampaigns_OwnerEntityType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationCampaigns] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationCampaigns_OwnerEntityType] FOREIGN KEY ([OwnerEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityInstances_EntityType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityInstances_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityInstances_FilterEntityType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityInstances_FilterEntityType] FOREIGN KEY ([FilterEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Forms_EntityType]...';


GO
ALTER TABLE [dbo].[UI_Forms] WITH NOCHECK
    ADD CONSTRAINT [FK_Forms_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleCounters_EntityType]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleCounters_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_HomonymWorkflowLinks_FormEntityType]...';


GO
ALTER TABLE [dbo].[UW_HomonymEntityLinks] WITH NOCHECK
    ADD CONSTRAINT [FK_HomonymWorkflowLinks_FormEntityType] FOREIGN KEY ([FormEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Workflows_VariablesType]...';


GO
ALTER TABLE [dbo].[UW_Workflows] WITH NOCHECK
    ADD CONSTRAINT [FK_Workflows_VariablesType] FOREIGN KEY ([VariablesType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Categories_Policy]...';


GO
ALTER TABLE [dbo].[UP_Categories] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Risks_Policy]...';


GO
ALTER TABLE [dbo].[UP_Risks] WITH NOCHECK
    ADD CONSTRAINT [FK_Risks_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleCounters_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleCounters_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRuleItems_Risk]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_Risk] FOREIGN KEY ([Risk_Id]) REFERENCES [dbo].[UP_Risks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRules_Risk]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRules_Risk] FOREIGN KEY ([Risk_Id]) REFERENCES [dbo].[UP_Risks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_IdentifiedRisks_Risk]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] WITH NOCHECK
    ADD CONSTRAINT [FK_IdentifiedRisks_Risk] FOREIGN KEY ([Risk_Id]) REFERENCES [dbo].[UP_Risks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedResourceErrors_JobInstance]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceErrors_JobInstance] FOREIGN KEY ([JobInstance_Id]) REFERENCES [dbo].[UJ_TaskInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceErrors] NOCHECK CONSTRAINT [FK_AssignedResourceErrors_JobInstance];


GO
PRINT N'Creating [dbo].[FK_IdentifiedRisks_WorkflowInstance]...';


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] WITH NOCHECK
    ADD CONSTRAINT [FK_IdentifiedRisks_WorkflowInstance] FOREIGN KEY ([WorkflowInstance_Id]) REFERENCES [dbo].[UW_WorkflowInstances] ([Id]);


GO
ALTER TABLE [dbo].[UP_IdentifiedRisks] NOCHECK CONSTRAINT [FK_IdentifiedRisks_WorkflowInstance];


GO
PRINT N'Creating [dbo].[FK_DisplayEntityProperties_AutocompleteBinding]...';


GO
ALTER TABLE [dbo].[UI_DisplayEntityProperties] WITH NOCHECK
    ADD CONSTRAINT [FK_DisplayEntityProperties_AutocompleteBinding] FOREIGN KEY ([AutocompleteBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[CHK_CompositeRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_CompositeRoles_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));


GO
PRINT N'Creating [dbo].[CHK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_CompositeRoles_EntityType] CHECK ("ValidTo"!=(CONVERT(DATETIME2(2),'9999-12-31 23:59:59.9999999')) OR "Policy_Id" IS NOT NULL);


GO
PRINT N'Creating [dbo].[CHK_ResourceTypes_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [CHK_ResourceTypes_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));


GO
PRINT N'Creating [dbo].[CHK_ResourceTypes_RemoveOrphans]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [CHK_ResourceTypes_RemoveOrphans] CHECK ("AllowRemove"=(1) OR "RemoveOrphans"=(0));


GO
PRINT N'Creating [dbo].[CHK_SingleRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_SingleRoles_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));


GO
PRINT N'Creating [dbo].[UC_EntityTypeMappings].[UC_EntityTypeMappings]...';


GO
ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityTypeMappings_EntityType];

ALTER TABLE [dbo].[UC_EntityTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityTypeMappings_Connector];

ALTER TABLE [dbo].[UD_ScaffoldingArguments] WITH CHECK CHECK CONSTRAINT [FK_ScaffoldingArguments_Scaffolding];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_EntityType];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Profile];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Property];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Connector];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Agent];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Workflow];

ALTER TABLE [dbo].[UD_Scaffoldings] WITH CHECK CHECK CONSTRAINT [FK_Scaffolding_Universe];

ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_CompositeRolesCategories_CompositeRole];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_CompositeRole];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_CompositeRole];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_Policy];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_EntityType];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_Category];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_ResourceType];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_ResourceType];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];

ALTER TABLE [dbo].[UA_ProfileRuleContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_ResourceType];

ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_TaskResourceTypes_EntityType];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ResourceType];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypesCategories_ResourceType];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_ResourceType];

ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_Policy];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_SourceEntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_TargetEntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_Category];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_ContextRule];

ALTER TABLE [dbo].[UU_EntityInstances] WITH CHECK CHECK CONSTRAINT [FK_EntityInstances_FilterResourceType];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_SingleRole];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_SingleRole];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_SingleRole];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_SingleRole0];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Role];

ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_SingleRolesCategories_SingleRole];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_Policy];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_EntityType];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_Category];

ALTER TABLE [dbo].[UU_AssociationInstances] WITH CHECK CHECK CONSTRAINT [FK_AssociationInstances_Association];

ALTER TABLE [dbo].[UC_EntityAssociationMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociationMappings_EntityAssociation];

ALTER TABLE [dbo].[UM_EntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociations_Property1];

ALTER TABLE [dbo].[UM_EntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_EntityAssociations_Property2];

ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityAssociations_EntityAssociation];

ALTER TABLE [dbo].[UC_EntityPropertyMappings] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyMappings_EntityProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_EntityTypeReflexiveProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_IndirectResourceReflexiveProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_ResourceProperty];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_DenialProperty];

ALTER TABLE [dbo].[UP_RecordProperties] WITH CHECK CHECK CONSTRAINT [FK_RecordProperties_Property_Id];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Property];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Property];

ALTER TABLE [dbo].[UM_EntityProperties] WITH CHECK CHECK CONSTRAINT [FK_EntityProperties_EntityType];

ALTER TABLE [dbo].[UM_EntityProperties] WITH CHECK CHECK CONSTRAINT [FK_EntityProperties_Language];

ALTER TABLE [dbo].[UM_EntityProperties] WITH CHECK CHECK CONSTRAINT [FK_EntityProperties_NeutralProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ObjectClasseProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_DNProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ParentProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_UserAcountControlProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_RDNProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_MailProperty];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_DisplayNameProperty];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Property];

ALTER TABLE [dbo].[UW_Changes] WITH CHECK CHECK CONSTRAINT [FK_Changes_Property];

ALTER TABLE [dbo].[UM_BindingItems] WITH CHECK CHECK CONSTRAINT [FK_BindingItems_Property];

ALTER TABLE [dbo].[UM_Dimensions] WITH CHECK CHECK CONSTRAINT [FK_Dimensions_ParentProperty];

ALTER TABLE [dbo].[UM_Dimensions] WITH CHECK CHECK CONSTRAINT [FK_Dimensions_PathProperty];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Property];

ALTER TABLE [dbo].[UI_DisplayEntityAssociations] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty];

ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyExpressions_Property];

ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyExpressions_PropertyCriteria];

ALTER TABLE [dbo].[UI_DisplayEntityProperties] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityProperties_EntityProperty];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_StartProperty_Id];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_EndProperty_Id];

ALTER TABLE [dbo].[UU_EntityInstances] WITH CHECK CHECK CONSTRAINT [FK_EntityInstances_FilterProperty];

ALTER TABLE [dbo].[UU_EntityInstances] WITH CHECK CHECK CONSTRAINT [FK_EntityInstances_FilterEntityProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_MainProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordStartProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordEndProperty];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_RecordSortProperty];

ALTER TABLE [dbo].[UR_ResourceFiles] WITH CHECK CHECK CONSTRAINT [FK_ResourceFiles_Property];

ALTER TABLE [dbo].[UA_AccessControlEntityProperties] WITH CHECK CHECK CONSTRAINT [FK_AccessControlEntityProperties_EntityProperty];

ALTER TABLE [dbo].[UW_WorkflowInstances] WITH CHECK CHECK CONSTRAINT [FK_WorkflowInstances_Type];

ALTER TABLE [dbo].[UI_SearchBars] WITH CHECK CHECK CONSTRAINT [FK_SearchBars_EntityType];

ALTER TABLE [dbo].[UI_SearchBars] WITH CHECK CHECK CONSTRAINT [FK_SearchBars_SearchedEntityType];

ALTER TABLE [dbo].[UI_FormControls] WITH CHECK CHECK CONSTRAINT [FK_FormControls_EntityType];

ALTER TABLE [dbo].[UA_AccessControlRules] WITH CHECK CHECK CONSTRAINT [FK_AccessControlRules_EntityType];

ALTER TABLE [dbo].[UI_DisplayTables] WITH CHECK CHECK CONSTRAINT [FK_DisplayTables_EntityType];

ALTER TABLE [dbo].[UJ_TaskEntityTypes] WITH CHECK CHECK CONSTRAINT [FK_TaskEntityTypes_EntityType];

ALTER TABLE [dbo].[UI_Tiles] WITH CHECK CHECK CONSTRAINT [FK_Tiles_EntityType];

ALTER TABLE [dbo].[UI_DisplayEntityTypes] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityTypes_EntityType];

ALTER TABLE [dbo].[UI_MenuItems] WITH CHECK CHECK CONSTRAINT [FK_MenuItems_EntityType];

ALTER TABLE [dbo].[UN_Notifications] WITH CHECK CHECK CONSTRAINT [FK_Notifications_OwnerEntityType];

ALTER TABLE [dbo].[UM_Dimensions] WITH CHECK CHECK CONSTRAINT [FK_Dimensions_EntityType];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_SourceEntityTypes];

ALTER TABLE [dbo].[UP_Risks] WITH CHECK CHECK CONSTRAINT [FK_Risks_EntityType];

ALTER TABLE [dbo].[UM_EntityPropertyExpressions] WITH CHECK CHECK CONSTRAINT [FK_EntityPropertyExpressions_EntityType];

ALTER TABLE [dbo].[UQ_ReportQueries] WITH CHECK CHECK CONSTRAINT [FK_ReportQueries_EntityType];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_SourceEntityType_Id];

ALTER TABLE [dbo].[UP_RecordSections] WITH CHECK CHECK CONSTRAINT [FK_RecordSections_ResourceEntityType_Id];

ALTER TABLE [dbo].[US_AccessCertificationCampaigns] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationCampaigns_OwnerEntityType];

ALTER TABLE [dbo].[UU_EntityInstances] WITH CHECK CHECK CONSTRAINT [FK_EntityInstances_EntityType];

ALTER TABLE [dbo].[UU_EntityInstances] WITH CHECK CHECK CONSTRAINT [FK_EntityInstances_FilterEntityType];

ALTER TABLE [dbo].[UI_Forms] WITH CHECK CHECK CONSTRAINT [FK_Forms_EntityType];

ALTER TABLE [dbo].[UP_RoleCounters] WITH CHECK CHECK CONSTRAINT [FK_RoleCounters_EntityType];

ALTER TABLE [dbo].[UW_HomonymEntityLinks] WITH CHECK CHECK CONSTRAINT [FK_HomonymWorkflowLinks_FormEntityType];

ALTER TABLE [dbo].[UW_Workflows] WITH CHECK CHECK CONSTRAINT [FK_Workflows_VariablesType];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_Policy];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Policy];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Policy];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_Policy];

ALTER TABLE [dbo].[UP_Categories] WITH CHECK CHECK CONSTRAINT [FK_Categories_Policy];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_Policy];

ALTER TABLE [dbo].[UP_Risks] WITH CHECK CHECK CONSTRAINT [FK_Risks_Policy];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Policy];

ALTER TABLE [dbo].[UP_RiskRules] WITH CHECK CHECK CONSTRAINT [FK_RiskRules_Policy];

ALTER TABLE [dbo].[UP_RoleCounters] WITH CHECK CHECK CONSTRAINT [FK_RoleCounters_Policy];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_Risk];

ALTER TABLE [dbo].[UP_RiskRules] WITH CHECK CHECK CONSTRAINT [FK_RiskRules_Risk];

ALTER TABLE [dbo].[UP_IdentifiedRisks] WITH CHECK CHECK CONSTRAINT [FK_IdentifiedRisks_Risk];

ALTER TABLE [dbo].[UI_DisplayEntityProperties] WITH CHECK CHECK CONSTRAINT [FK_DisplayEntityProperties_AutocompleteBinding];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [CHK_CompositeRoles_ApprovalWorkflowType];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [CHK_CompositeRoles_EntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [CHK_ResourceTypes_ApprovalWorkflowType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [CHK_ResourceTypes_RemoveOrphans];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [CHK_SingleRoles_ApprovalWorkflowType];


GO
PRINT N'Update complete.';


GO



MERGE "um_entityproperties" AS TARGET USING (values(-9223371843581247442,2147483693,'CommentActivationOnApproveInReview',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371843581247441,2147483693,'CommentActivationOnDeclineInReview',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371843581247440,2147483693,'CommentActivationOnDeleteGapInReconciliation',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371843581247439,2147483693,'CommentActivationOnKeepGapInReconciliation',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371955250397133,2147483667,'CommentActivationOnApproveInReview',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371955250397132,2147483667,'CommentActivationOnDeclineInReview',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371955250397131,2147483667,'CommentActivationOnDeleteGapInReconciliation',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371955250397130,2147483667,'CommentActivationOnKeepGapInReconciliation',9,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371856466149317,2147483690,'AutocompleteBindingDisplayEntityProperties',-1,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371384019746800,2147483800,'DataSourceIsEncrypted',5,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371375429812200,2147483802,'DataSourceName',-1,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371375429812201,2147483802,'DataSourceIsEncrypted',5,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371723322163177,2147483721,'FulfillmentType',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371723322163176,2147483721,'InformationSystemIdentifier',0,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371740502032326,2147483717,'AutocompleteBinding',-1,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371740502032327,2147483717,'AutocompleteBindingId',3,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223371740502032324,2147483717,'MinSearchLength',2,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");

MERGE "um_entityproperties" AS TARGET USING (values(-9223371856466149331,2147483690,'AccessCertificationOwnerFilter',-1,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370885803540475,2147483916,'OwnerLastModificationDate',-1,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370885803540473,2147483916,'OwnerLastModificationDateBinding',-1,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityproperties" AS TARGET USING (values(-9223370885803540474,2147483916,'OwnerLastModificationDateBindingId',-1,-1,NULL)) AS SOURCE("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "entitytype_id"=SOURCE."entitytype_id","identifier"=SOURCE."identifier","type"=SOURCE."type","targetcolumnindex"=SOURCE."targetcolumnindex","neutralproperty_id"=SOURCE."neutralproperty_id" WHEN NOT MATCHED THEN INSERT("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id") VALUES(SOURCE."id", SOURCE."entitytype_id",SOURCE."identifier",SOURCE."type",SOURCE."targetcolumnindex",SOURCE."neutralproperty_id");
MERGE "um_entityassociations" AS TARGET USING (values(-9223371856466149331,-9223371856466149331,-9223370885803540473,'Binding.AccessCertificationOwnerFilter')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");


MERGE "um_entityassociations" AS TARGET USING (values(-9223371740502032326,-9223371740502032326,-9223371856466149317,'DisplayEntityProperty.AutocompleteBinding')) AS SOURCE("id","property1_id","property2_id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "property1_id"=SOURCE."property1_id","property2_id"=SOURCE."property2_id","identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","property1_id","property2_id","identifier") VALUES(SOURCE."id", SOURCE."property1_id",SOURCE."property2_id",SOURCE."identifier");

MERGE "ua_accesscontrolpermissions" AS TARGET USING (values(4611686018427388226,'/Custom/WorkflowsNotifications')) AS SOURCE("id","identifier") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier" WHEN NOT MATCHED THEN INSERT("id","identifier") VALUES(SOURCE."id", SOURCE."identifier");
GO



/* defaults */
update UC_EntityAssociationMappings set "DataSourceIsEncrypted"=0;
update UC_EntityTypeMappings set "DataSourceIsEncrypted"=0;
GO
