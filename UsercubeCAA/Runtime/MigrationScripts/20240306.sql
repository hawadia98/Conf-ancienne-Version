IF OBJECT_ID('dbo.UT_BulkAssignedResourceScalars', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceScalars" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NOT NULL,
            "OwnerType" BIGINT NOT NULL
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedResourceNavigations', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceNavigations" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NOT NULL,
            "OwnerType" BIGINT NOT NULL
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedResourceBinaries', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceBinaries" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NOT NULL,
            "OwnerType" BIGINT NOT NULL
        );
    END
GO
