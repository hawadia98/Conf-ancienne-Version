IF EXISTS (
   SELECT TOP 1 1
   FROM sys.foreign_keys
   WHERE name='FK_EntityAssociationMappings_EntityPropertyMapping1' AND referenced_object_id = OBJECT_ID('dbo.UC_EntityPropertyMappings') and parent_object_id = OBJECT_ID('dbo.UC_EntityAssociationMappings')
)
BEGIN
    ALTER TABLE "UC_EntityAssociationMappings" DROP CONSTRAINT "FK_EntityAssociationMappings_EntityPropertyMapping1";
END
GO

IF EXISTS (
   SELECT TOP 1 1
   FROM sys.foreign_keys
   WHERE name='FK_EntityAssociationMappings_EntityPropertyMapping2' AND referenced_object_id = OBJECT_ID('dbo.UC_EntityPropertyMappings') and parent_object_id = OBJECT_ID('dbo.UC_EntityAssociationMappings')
)
BEGIN
    ALTER TABLE "UC_EntityAssociationMappings" DROP CONSTRAINT "FK_EntityAssociationMappings_EntityPropertyMapping2";
END
GO

IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.foreign_keys
   WHERE name='FK_EntityAssociationMappings_EntityProperty1' AND referenced_object_id = OBJECT_ID('dbo.UM_EntityProperties') AND parent_object_id = OBJECT_ID('dbo.UC_EntityAssociationMappings')
)
BEGIN
    ALTER TABLE "UC_EntityAssociationMappings" ADD CONSTRAINT "FK_EntityAssociationMappings_EntityProperty1" FOREIGN KEY ("EntityPropertyMapping1_Id") REFERENCES "UM_EntityProperties" ("Id");
END
GO

IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.foreign_keys
   WHERE name='FK_EntityAssociationMappings_EntityProperty2' AND referenced_object_id = OBJECT_ID('dbo.UM_EntityProperties') AND parent_object_id = OBJECT_ID('dbo.UC_EntityAssociationMappings')
)
BEGIN
    ALTER TABLE "UC_EntityAssociationMappings" ADD CONSTRAINT "FK_EntityAssociationMappings_EntityProperty2" FOREIGN KEY ("EntityPropertyMapping2_Id") REFERENCES "UM_EntityProperties" ("Id");
END
GO
