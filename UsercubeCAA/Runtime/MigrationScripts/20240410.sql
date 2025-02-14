IF OBJECT_ID('dbo.UJ_PendingWork', 'U') IS NULL
    BEGIN
        CREATE TABLE "UJ_PendingWork" (
            "Id" BIGINT NOT NULL,
            "State" SMALLINT NOT NULL,
            "LaunchDate" SMALLDATETIME NULL,
            "EstimatedCompletionDate" SMALLDATETIME NULL,
            "ActualCompletionDate" SMALLDATETIME NULL,
            "Payload" NVARCHAR(MAX) NULL,
            "CompletionRedirectUri" NVARCHAR(442) NULL,
            "EventId" BIGINT NULL,
            CONSTRAINT "PK_PendingWork" PRIMARY KEY ("Id" ASC),
        );

        -- Insert data from UZ_PendingWorks to UJ_PendingWork
        IF OBJECT_ID('dbo.UZ_PendingWorks', 'U') IS NOT NULL AND OBJECT_ID('dbo.UJ_PendingWork', 'U') IS NOT NULL
        BEGIN
            INSERT INTO "UJ_PendingWork" ("Id", "State", "EstimatedCompletionDate", "ActualCompletionDate", "Payload", "CompletionRedirectUri", "EventId")
            SELECT "Id", "State", "Ect", "ActualCompletionDate", "Payload", "CompletionRedirectUri", "EventId"
            FROM "UZ_PendingWorks";
        END
    END
GO
