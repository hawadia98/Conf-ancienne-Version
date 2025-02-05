IF COL_LENGTH('dbo.UD_ConfigurationFileItems', 'IsManualUpdate') IS NULL
BEGIN
ALTER TABLE "UD_ConfigurationFileItems" ADD "IsManualUpdate" BIT DEFAULT ((0)) NOT NULL;
END
GO
/* disable parallelism */
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 1;
GO
