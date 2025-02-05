IF COL_LENGTH('dbo.UI_FormControls', 'Binding2_Id') IS NULL
BEGIN
ALTER TABLE "UI_FormControls" ADD "Binding2_Id" BIGINT NULL CONSTRAINT "FK_FormControls_Binding2" FOREIGN KEY ("Binding2_Id") REFERENCES "UM_Bindings" ("Id");
END
GO

IF COL_LENGTH('dbo.UI_FormControls', 'Binding3_Id') IS NULL
BEGIN
ALTER TABLE "UI_FormControls" ADD "Binding3_Id" BIGINT NULL CONSTRAINT "FK_FormControls_Binding3" FOREIGN KEY ("Binding3_Id") REFERENCES "UM_Bindings" ("Id");
END
GO
