IF COL_LENGTH('dbo.UA_InvalidTokens', 'Token') IS NULL
BEGIN
CREATE TABLE "UA_InvalidTokens" (
    "Guid" VARCHAR(36) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Token" NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "ExpireDate" SMALLDATETIME NOT NULL,
    CONSTRAINT "PK_InvalidTokens" PRIMARY KEY ("Guid"),
);
END
GO
