IF OBJECT_ID('dbo.UP_BulkChanges', 'U') IS NOT NULL
    BEGIN
        DROP TABLE UP_BulkChanges;
    END
GO
IF OBJECT_ID('dbo.UT_BulkDirtyOwners', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_BulkDirtyOwners" (
            "OwnerType" BIGINT NOT NULL,
            "Owner_Id" BIGINT NOT NULL,
            "PendingWork_Id" BIGINT NOT NULL,
            "BulkDate" DATETIME2(2) CONSTRAINT "DF_BulkDirtyOwners_BulkDate" DEFAULT GETUTCDATE() NOT NULL,
            CONSTRAINT "PK_BulkDirtyOwners" UNIQUE CLUSTERED ("PendingWork_Id" ASC, "BulkDate" ASC, "OwnerType" ASC, "Owner_Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
        );
    END
GO
