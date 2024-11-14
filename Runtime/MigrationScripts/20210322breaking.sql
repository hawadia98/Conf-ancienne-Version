IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'um_entityproperties' AND COLUMN_NAME = 'groupbyproperty_id')
BEGIN
ALTER TABLE "UM_EntityProperties" ADD "GroupByProperty_Id" BIGINT NULL;
ALTER TABLE "UM_EntityProperties" ADD CONSTRAINT "FK_EntityProperties_GroupByProperty" FOREIGN KEY ("GroupByProperty_Id") REFERENCES "UM_EntityProperties" ("Id");
END
