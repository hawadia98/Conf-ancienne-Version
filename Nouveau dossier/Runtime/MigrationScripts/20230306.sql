IF COL_LENGTH('dbo.UZ_PendingWorks', 'EventId') IS NULL
BEGIN
    ALTER TABLE "UZ_PendingWorks" ADD "EventId" BIGINT NULL;
END
GO
