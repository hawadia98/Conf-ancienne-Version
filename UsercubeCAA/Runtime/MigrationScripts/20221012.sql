IF COL_LENGTH('dbo.UM_EntityTypes', 'LicenseTag') IS NULL
BEGIN
ALTER TABLE "UM_EntityTypes" ADD LicenseTag VARCHAR(442) NULL;
END
GO
