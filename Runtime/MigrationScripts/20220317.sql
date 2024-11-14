-- Add columns for new configuration screens

IF COL_LENGTH('dbo.UA_Profiles', 'IsComponent') IS NULL
BEGIN
    ALTER TABLE "UA_Profiles" ADD "IsComponent" BIT CONSTRAINT "DF_Profiles_IsComponent" DEFAULT ((0)) NOT NULL;
END
GO

IF COL_LENGTH('dbo.UD_Scaffoldings', 'IsIncremental') IS NULL
BEGIN
    ALTER TABLE "UD_Scaffoldings" ADD "IsIncremental" BIT CONSTRAINT "DF_Scaffoldings_IsIncremental" DEFAULT ((0)) NOT NULL;
END
GO

IF COL_LENGTH('dbo.UD_Scaffoldings', 'IsEnabled') IS NULL
BEGIN
    ALTER TABLE "UD_Scaffoldings" ADD "IsEnabled" BIT CONSTRAINT "DF_Scaffoldings_IsEnabled" DEFAULT ((1)) NOT NULL;
END
GO

IF COL_LENGTH('dbo.UD_Scaffoldings', 'Package_Id') IS NULL
BEGIN
    ALTER TABLE "UD_Scaffoldings" ADD "Package_Id" BIGINT NULL;
    ALTER TABLE "UD_Scaffoldings" ADD CONSTRAINT "FK_Scaffolding_Package" FOREIGN KEY ("Package_Id") REFERENCES "UC_ConnectionPackages" ("Id");
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'Binding') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "Binding" NVARCHAR(442) NULL;
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'Count') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "Count" INT NULL;
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'ForcedCount') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "ForcedCount" INT NULL;
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'UniqueIdentifierPrefix') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "UniqueIdentifierPrefix" NVARCHAR(442) NULL;
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'UniqueIdentifierMin') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "UniqueIdentifierMin" INT NULL;
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'UniqueIdentifierMax') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "UniqueIdentifierMax" INT NULL;
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'LoginPrefix') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "LoginPrefix" NVARCHAR(442) NULL;
END
GO
 
IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'EmailDomain') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "EmailDomain" NVARCHAR(442) NULL;
END
GO

IF COL_LENGTH('dbo.UD_ScaffoldingArguments', 'NameSeparator') IS NULL
BEGIN
    ALTER TABLE "UD_ScaffoldingArguments" ADD "NameSeparator" NVARCHAR(442) NULL;
END
GO
