IF COL_LENGTH('dbo.UU_Universes', 'ColumnNamesMode') IS NULL
BEGIN
ALTER TABLE UU_Universes ADD "ColumnNamesMode" TINYINT CONSTRAINT "DF_Universes_ColumnNamesMode" DEFAULT ((0)) NOT NULL;
END
GO
