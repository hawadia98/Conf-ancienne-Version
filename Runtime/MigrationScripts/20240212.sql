IF OBJECT_ID('dbo.UT_BulkAssignedCompositeRoles', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedCompositeRoles" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NOT NULL,
            "OwnerType" BIGINT NOT NULL
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedSingleRoles', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedSingleRoles" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NOT NULL,
            "OwnerType" BIGINT NOT NULL
        );
    END
GO
