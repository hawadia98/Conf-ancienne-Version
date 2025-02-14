IF EXISTS (
    SELECT 1 FROM sys.check_constraints
    WHERE name='CHK_ResourceTypes_ApprovalWorkflowType' AND parent_object_id = OBJECT_ID('dbo.UP_ResourceTypes'))
    BEGIN
        ALTER TABLE "UP_ResourceTypes" DROP CONSTRAINT "CHK_ResourceTypes_ApprovalWorkflowType";
        ALTER TABLE "UP_ResourceTypes" ADD CONSTRAINT "CHK_ResourceTypes_ApprovalWorkflowType" CHECK ("ApprovalWorkflowType"=(4) OR "ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));
    END
GO

IF EXISTS (
    SELECT 1 FROM sys.check_constraints
    WHERE name='CHK_SingleRoles_ApprovalWorkflowType' AND parent_object_id = OBJECT_ID('dbo.UP_SingleRoles'))
    BEGIN
        ALTER TABLE "UP_SingleRoles" DROP CONSTRAINT "CHK_SingleRoles_ApprovalWorkflowType";
        ALTER TABLE "UP_SingleRoles" ADD CONSTRAINT "CHK_SingleRoles_ApprovalWorkflowType" CHECK ("ApprovalWorkflowType"=(4) OR "ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));
    END
GO

IF EXISTS (
    SELECT 1 FROM sys.check_constraints
    WHERE name='CHK_CompositeRoles_ApprovalWorkflowType' AND parent_object_id = OBJECT_ID('dbo.UP_CompositeRoles'))
    BEGIN
        ALTER TABLE "UP_CompositeRoles" DROP CONSTRAINT "CHK_CompositeRoles_ApprovalWorkflowType";
        ALTER TABLE "UP_CompositeRoles" ADD CONSTRAINT "CHK_CompositeRoles_ApprovalWorkflowType" CHECK ("ApprovalWorkflowType"=(4) OR "ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));
    END
GO

IF NOT EXISTS (SELECT 1 FROM "UM_Languages" WHERE "Code"='fr-FR' AND "IndicatorNumber"=2)
    BEGIN
        UPDATE "UN_NotificationTemplates" SET "SubjectTemplate_L2"=NULL, "BodyTemplate_L2"=NULL WHERE "Identifier"='PerformManualProvisioningSummary';
    END
GO
