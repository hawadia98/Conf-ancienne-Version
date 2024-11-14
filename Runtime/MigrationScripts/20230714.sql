IF COL_LENGTH('dbo.UP_ResourceTypes', 'DependsOnOwnerProperty_Id') IS NULL
BEGIN
ALTER TABLE "UP_ResourceTypes" ADD "DependsOnOwnerProperty_Id" BIGINT NULL FOREIGN KEY ("DependsOnOwnerProperty_Id") REFERENCES "UM_EntityProperties" ("Id");
END
GO
