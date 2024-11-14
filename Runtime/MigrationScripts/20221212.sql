IF COL_LENGTH('dbo.UZ_PendingWorks', 'Id') IS NULL
BEGIN
CREATE TABLE "UZ_PendingWorks"
(
    "Id" BIGINT NOT NULL,
    "State" SMALLINT NOT NULL,
    "Ect" SMALLDATETIME NULL,
    "Payload" NVARCHAR(MAX) NULL,
    "CompletionRedirectUri" NVARCHAR(442) NULL,
    CONSTRAINT "PK_PendingWorks" PRIMARY KEY ("Id" ASC),
)
END
GO
