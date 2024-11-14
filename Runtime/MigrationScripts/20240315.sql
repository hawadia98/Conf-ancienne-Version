IF OBJECT_ID('dbo.UT_BulkAssignedResourceTypes', 'U') IS NOT NULL
    BEGIN
        DROP TABLE "UT_BulkAssignedResourceTypes";
    END
GO
IF OBJECT_ID('dbo.UT_BulkAssignedResourceTypes', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceTypes" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceTypes
            "OwnerType" BIGINT NOT NULL
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedResourceScalars', 'U') IS NOT NULL
    BEGIN
        DROP TABLE UT_BulkAssignedResourceScalars;
    END
GO
IF OBJECT_ID('dbo.UT_BulkAssignedResourceScalars', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceScalars" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceScalars
            "OwnerType" BIGINT NOT NULL
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedResourceNavigations', 'U') IS NOT NULL
    BEGIN
        DROP TABLE UT_BulkAssignedResourceNavigations;
    END
GO
IF OBJECT_ID('dbo.UT_BulkAssignedResourceNavigations', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceNavigations" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceNavigations
            "OwnerType" BIGINT NOT NULL
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedResourceBinaries', 'U') IS NOT NULL
    BEGIN
        DROP TABLE UT_BulkAssignedResourceBinaries;
    END
GO
IF OBJECT_ID('dbo.UT_BulkAssignedResourceBinaries', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceBinaries" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceBinaries
            "OwnerType" BIGINT NOT NULL
        );
    END
GO
