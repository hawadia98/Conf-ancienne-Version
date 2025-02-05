IF COL_LENGTH('dbo.UD_Scaffoldings', 'OldAlgorithm') IS NULL
BEGIN
    ALTER TABLE UD_Scaffoldings
    ADD OldAlgorithm BIT CONSTRAINT DF_Scaffolding_OldAlgorithm DEFAULT ((0)) NOT NULL;
END

GO

UPDATE UD_Scaffoldings SET OldAlgorithm=1 WHERE Generator IN (105,106);

GO
