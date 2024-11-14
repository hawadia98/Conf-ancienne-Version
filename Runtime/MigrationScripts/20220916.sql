IF COL_LENGTH('dbo.UI_DisplayTables', 'ParentProperty_Id') IS NULL
BEGIN
    ALTER TABLE UI_DisplayTables
    ADD ParentProperty_Id BIGINT CONSTRAINT "FK_DisplayTables_ParentProperty" FOREIGN KEY ("ParentProperty_Id") REFERENCES "UM_EntityProperties" ("Id") NULL;
END
GO

IF COL_LENGTH('dbo.UW_Aspects', 'HistorizeBinding_Id') IS NULL
BEGIN
    ALTER TABLE UW_Aspects
    ADD HistorizeBinding_Id BIGINT CONSTRAINT "FK_Aspects_HistorizeBinding" FOREIGN KEY ("HistorizeBinding_Id") REFERENCES "UM_Bindings" ("Id") NULL;
END
GO
