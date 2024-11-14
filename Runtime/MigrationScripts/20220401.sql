IF COL_LENGTH('dbo.UP_ResourceTypes', 'DependsOn_Id') IS NULL
BEGIN
    ALTER TABLE "UP_ResourceTypes" ADD "DependsOn_Id" BIGINT NULL CONSTRAINT "FK_ResourceTypes_DependsOn" FOREIGN KEY ("DependsOn_Id") REFERENCES "UP_ResourceTypes" ("Id");
END
GO
    UPDATE UC_ConnectionPackages
    SET ExportType = 17
    WHERE Identifier = 'Usercube.SQL@0000001'
GO
