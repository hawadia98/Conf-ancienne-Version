IF OBJECT_ID('dbo.UZ_PendingWorks', 'U') IS NOT NULL AND OBJECT_ID('dbo.UJ_PendingWork', 'U') IS NOT NULL
    BEGIN
        UPDATE uj
        SET uj."State"=uz."State", uj."ActualCompletionDate"=uz."ActualCompletionDate", uj."Payload"=uz."Payload"
        FROM "UJ_PendingWork" uj
        JOIN "UZ_PendingWorks" uz ON uj."Id" = uz."Id" AND uj."State" = 1 AND uz."State" IN (2,3,4);

        INSERT INTO "UJ_PendingWork" ("Id", "State", "EstimatedCompletionDate", "ActualCompletionDate", "Payload", "CompletionRedirectUri", "EventId")
        SELECT uz."Id", uz."State", uz."Ect", uz."ActualCompletionDate", uz."Payload", uz."CompletionRedirectUri", uz."EventId"
        FROM "UZ_PendingWorks" uz
        WHERE uz."Id" NOT IN (SELECT "Id" FROM "UJ_PendingWork");

        UPDATE uj
        SET uj."State"=3, uj."ActualCompletionDate"=FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss'), uj."Payload"='Migration cleanup: the process ended successfully but the pendingwork state could not be updated because of a migration procedure.'
        FROM "UJ_PendingWork" uj
        WHERE uj."State" = 1;

        DROP TABLE UZ_PendingWorks;
    END
GO
