IF EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedCompositeRole_History' AND object_id = OBJECT_ID('dbo.UP_AssignedCompositeRoles')
)
BEGIN
    DROP INDEX "IX_AssignedCompositeRole_History" ON "UP_AssignedCompositeRoles";
END
GO
IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedCompositeRoles_History' AND object_id = OBJECT_ID('dbo.UP_AssignedCompositeRoles')
)
BEGIN
    CREATE NONCLUSTERED INDEX "IX_AssignedCompositeRoles_History" ON "UP_AssignedCompositeRoles"
    (
	    "OwnerType" ASC,
	    "Owner_Id" ASC,
	    "Id" ASC,
	    "ValidTo" ASC
    )
    INCLUDE("ValidFrom","StartDate","EndDate");
END
GO
IF EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedSingleRole_History' AND object_id = OBJECT_ID('dbo.UP_AssignedSingleRoles')
)
BEGIN
    DROP INDEX "IX_AssignedSingleRole_History" ON "UP_AssignedSingleRoles";
END
GO
IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedSingleRoles_History' AND object_id = OBJECT_ID('dbo.UP_AssignedSingleRoles')
)
BEGIN
    CREATE NONCLUSTERED INDEX "IX_AssignedSingleRoles_History" ON "UP_AssignedSingleRoles"
    (
	    "OwnerType" ASC,
	    "Owner_Id" ASC,
	    "Id" ASC,
	    "ValidTo" ASC
    )
    INCLUDE("ValidFrom","StartDate","EndDate");
END
GO
IF EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedResourceTypes_History' AND object_id = OBJECT_ID('dbo.UP_AssignedResourceTypes')
)
BEGIN
    DROP INDEX "IX_AssignedResourceTypes_History" ON "UP_AssignedResourceTypes";
END
GO
IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedResourceTypes_History' AND object_id = OBJECT_ID('dbo.UP_AssignedResourceTypes')
)
BEGIN
    CREATE NONCLUSTERED INDEX "IX_AssignedResourceTypes_History" ON "UP_AssignedResourceTypes"
    (
	    "OwnerType" ASC,
	    "Owner_Id" ASC,
	    "Id" ASC,
	    "ValidTo" ASC
    )
    INCLUDE("ValidFrom","StartDate","EndDate");
END
GO
IF EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedResourceNavigations_History' AND object_id = OBJECT_ID('dbo.UP_AssignedResourceNavigations')
)
BEGIN
    DROP INDEX "IX_AssignedResourceNavigations_History" ON "UP_AssignedResourceNavigations";
END
GO
IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedResourceNavigations_History' AND object_id = OBJECT_ID('dbo.UP_AssignedResourceNavigations')
)
BEGIN
    CREATE NONCLUSTERED INDEX "IX_AssignedResourceNavigations_History" ON "UP_AssignedResourceNavigations"
    (
	    "OwnerType" ASC,
	    "Owner_Id" ASC,
	    "Id" ASC,
	    "ValidTo" ASC
    )
    INCLUDE("ValidFrom","StartDate","EndDate");
END
GO
IF EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_Resources_History' AND object_id = OBJECT_ID('dbo.UR_Resources')
)
BEGIN
    DROP INDEX "IX_Resources_History" ON "UR_Resources";
END
GO
IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_Resources_History' AND object_id = OBJECT_ID('dbo.UR_Resources')
)
BEGIN
    CREATE NONCLUSTERED INDEX "IX_Resources_History" ON "UR_Resources"
    (
	    "Type" ASC,
	    "Id" ASC,
	    "ValidTo" ASC
    )
    INCLUDE("ValidFrom","DisplayName_L1","DisplayName_L2","DisplayName_L3","DisplayName_L4","DisplayName_L5","DisplayName_L6","DisplayName_L7","DisplayName_L8","DisplayName_L9","DisplayName_L10","DisplayName_L11","DisplayName_L12","DisplayName_L13","DisplayName_L14","DisplayName_L15","DisplayName_L16");
END
GO
IF COL_LENGTH('dbo.UP_PendingApprovalRules', 'WhenCreated') IS NULL
BEGIN
    ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD [WhenCreated] SMALLDATETIME NULL;
END
IF COL_LENGTH('dbo.UP_PendingApprovalRules', 'CreatedBy_Id') IS NULL
BEGIN
    ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD [CreatedBy_Id] BIGINT NULL;
END
IF COL_LENGTH('dbo.UP_PendingApprovalRules', 'WhenChanged') IS NULL
BEGIN
    ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD [WhenChanged] SMALLDATETIME NULL;
END
IF COL_LENGTH('dbo.UP_PendingApprovalRules', 'ChangedBy_Id') IS NULL
BEGIN
    ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD [ChangedBy_Id] BIGINT NULL;
END
