IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_JobInstances_CancelRequested' AND object_id = OBJECT_ID('UJ_JobInstances'))
    BEGIN
        DROP INDEX "UJ_JobInstances"."IX_JobInstances_CancelRequested";
    END
GO
CREATE INDEX "IX_JobInstances_CancelRequested" ON "UJ_JobInstances" ("Id") WHERE "CancelRequested"=0;
GO
IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_TaskInstances_JobInstance' AND object_id = OBJECT_ID('UJ_TaskInstances'))
    BEGIN
        DROP INDEX "UJ_TaskInstances"."IX_TaskInstances_JobInstance";
    END
GO
CREATE INDEX "IX_TaskInstances_JobInstance" ON "UJ_TaskInstances" ("JobInstance_Id","Id");
GO

ALTER TABLE "UM_BindingItems" DROP CONSTRAINT "PK_BindingItems";
ALTER TABLE "UM_BindingItems" ADD CONSTRAINT "PK_BindingItems" PRIMARY KEY CLUSTERED ("Binding_Id", "Order", "Id" ASC);
GO

IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE table_name='UM_BindingItems' AND CONSTRAINT_NAME='UK_BindingItems')
    BEGIN
        ALTER TABLE "UM_BindingItems" DROP CONSTRAINT "UK_BindingItems";
    END
GO
ALTER TABLE "UM_BindingItems" ADD CONSTRAINT "UK_BindingItems" UNIQUE ("Id" ASC);
GO

IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_EntityProperties_EntityType' AND object_id = OBJECT_ID('UM_EntityProperties'))
    BEGIN
        DROP INDEX "UM_EntityProperties"."IX_EntityProperties_EntityType";
    END
GO
CREATE INDEX "IX_EntityProperties_EntityType" ON "UM_EntityProperties" ("EntityType_Id", "Id" ASC) INCLUDE ("Identifier", "Type", "TargetColumnIndex", "IsKey", "HistoryPrecision", "DisplayName_L1", "DisplayName_L2", "DisplayName_L3", "DisplayName_L4", "DisplayName_L5", "DisplayName_L6", "DisplayName_L7", "DisplayName_L8", "DisplayName_L9", "DisplayName_L10", "DisplayName_L11", "DisplayName_L12", "DisplayName_L13", "DisplayName_L14", "DisplayName_L15", "DisplayName_L16","Language_Id","NeutralProperty_Id","GroupByProperty_Id","FlexibleComparisonExpression","TargetEntityType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);
GO

IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedCompositeRoles_RoleReview' AND object_id = OBJECT_ID('UP_AssignedCompositeRoles'))
    BEGIN
        DROP INDEX "UP_AssignedCompositeRoles"."IX_AssignedCompositeRoles_RoleReview";
    END
GO
CREATE INDEX "IX_AssignedCompositeRoles_RoleReview" ON "UP_AssignedCompositeRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","Comment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
    WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25,27)
GO
IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedResourceTypes_ProvisioningReview' AND object_id = OBJECT_ID('UP_AssignedResourceTypes'))
    BEGIN
        DROP INDEX "UP_AssignedResourceTypes"."IX_AssignedResourceTypes_ProvisioningReview";
    END
GO
CREATE INDEX "IX_AssignedResourceTypes_ProvisioningReview" ON "UP_AssignedResourceTypes" ("OwnerType","WorkflowInstance_Id" DESC,"Owner_Id" DESC,"Id" DESC)
    INCLUDE ("ProvisioningReviewFilter","WorkflowState","IsDenied","ProvisioningState","StartDate","EndDate","ParametersContext_Id","Resource_Id","ConsolidatedWorkflowBlockedState","ConsolidatedProvisioningState","ResourceType_Id")
    WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121) AND "ProvisioningReviewFilter">0
GO
IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedSingleRoles_RoleReview' AND object_id = OBJECT_ID('UP_AssignedSingleRoles'))
    BEGIN
        DROP INDEX "UP_AssignedSingleRoles"."IX_AssignedSingleRoles_RoleReview";
    END
GO
CREATE INDEX "IX_AssignedSingleRoles_RoleReview" ON "UP_AssignedSingleRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","Comment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
    WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25)
GO
IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_TAssignedResourceErrors_JobInstance' AND object_id = OBJECT_ID('UP_AssignedResourceErrors'))
    BEGIN
        DROP INDEX "UP_AssignedResourceErrors"."IX_TAssignedResourceErrors_JobInstance";
    END
GO
CREATE INDEX "IX_TAssignedResourceErrors_JobInstance" ON "UP_AssignedResourceErrors" ("JobInstance_Id","Id");
GO
