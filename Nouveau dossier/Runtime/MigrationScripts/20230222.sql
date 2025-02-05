IF COL_LENGTH('dbo.UP_RecordProperties', 'IsExcluded') IS NULL
BEGIN
    ALTER TABLE "UP_RecordProperties" ADD "IsExcluded" BIT CONSTRAINT "DF_PolicySimulations_IsExcluded" DEFAULT ((0)) NOT NULL;
END
GO
