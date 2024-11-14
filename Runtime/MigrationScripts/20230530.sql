IF COL_LENGTH('dbo.UD_ConfigurationFileItems', 'ConsolidationMode') IS NULL
BEGIN
ALTER TABLE "UD_ConfigurationFileItems" ADD "ConsolidationMode" INT DEFAULT ((0)) NOT NULL;
END
GO
