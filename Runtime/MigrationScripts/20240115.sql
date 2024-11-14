IF COL_LENGTH('dbo.UP_BulkChanges', 'Owner_Id') IS NOT NULL
    BEGIN
        DROP TABLE "UP_BulkChanges";
    END
GO
IF COL_LENGTH('dbo.UP_BulkChanges', 'Owner_Id') IS NULL
    BEGIN
        CREATE TABLE "UP_BulkChanges" (
          "OwnerType" BIGINT NOT NULL,
          "Owner_Id" BIGINT NOT NULL,
          "BulkDate" DATETIME2(2) CONSTRAINT "DF_BulkChanges_BulkDate" DEFAULT GETUTCDATE() NOT NULL,
          CONSTRAINT "PK_BulkChanges" UNIQUE CLUSTERED ("BulkDate" ASC, "OwnerType" ASC, "Owner_Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedResourceTypes', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkAssignedResourceTypes" (
            "Id" BIGINT NOT NULL,
            "Owner_Id" BIGINT NOT NULL,
            "OwnerType" BIGINT NOT NULL
        );
    END
GO
