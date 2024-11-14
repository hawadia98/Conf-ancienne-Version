IF COL_LENGTH('dbo.UI_DisplayTableColumns', 'OptimizedSortBinding_Id') IS NULL
BEGIN
    ALTER TABLE "UI_DisplayTableColumns" ADD "OptimizedSortBinding_Id" BIGINT NULL;
    ALTER TABLE "UI_DisplayTableColumns" ADD CONSTRAINT "FK_DisplayTableColumns_OptimizedSortBinding" FOREIGN KEY ("OptimizedSortBinding_Id") REFERENCES "UM_Bindings" ("Id");
END
GO

IF COL_LENGTH('dbo.UI_SearchBarCriteria', 'OptimizedBinding1_Id') IS NULL
BEGIN
    ALTER TABLE "UI_SearchBarCriteria" ADD "OptimizedBinding1_Id" BIGINT NULL;
    ALTER TABLE "UI_SearchBarCriteria" ADD CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding1" FOREIGN KEY ("OptimizedBinding1_Id") REFERENCES "UM_Bindings" ("Id");
END
GO

IF COL_LENGTH('dbo.UI_SearchBarCriteria', 'OptimizedBinding2_Id') IS NULL
BEGIN
    ALTER TABLE "UI_SearchBarCriteria" ADD "OptimizedBinding2_Id" BIGINT NULL;
    ALTER TABLE "UI_SearchBarCriteria" ADD CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding2" FOREIGN KEY ("OptimizedBinding2_Id") REFERENCES "UM_Bindings" ("Id");
END
GO

IF COL_LENGTH('dbo.UI_SearchBarCriteria', 'OptimizedBinding3_Id') IS NULL
BEGIN
    ALTER TABLE "UI_SearchBarCriteria" ADD "OptimizedBinding3_Id" BIGINT NULL;
    ALTER TABLE "UI_SearchBarCriteria" ADD CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding3" FOREIGN KEY ("OptimizedBinding3_Id") REFERENCES "UM_Bindings" ("Id");
END
GO

IF COL_LENGTH('dbo.UI_SearchBarCriteria', 'OptimizedBinding4_Id') IS NULL
BEGIN
    ALTER TABLE "UI_SearchBarCriteria" ADD "OptimizedBinding4_Id" BIGINT NULL;
    ALTER TABLE "UI_SearchBarCriteria" ADD CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding4" FOREIGN KEY ("OptimizedBinding4_Id") REFERENCES "UM_Bindings" ("Id");
END
GO
