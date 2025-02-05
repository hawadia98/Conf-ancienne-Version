ALTER TABLE "UA_ProfileRuleContexts" ALTER COLUMN "ResourceType_Id" BIGINT NULL;
GO
IF COL_LENGTH('dbo.UA_ProfileRuleContexts', 'EntityType_Id') IS NULL
BEGIN
ALTER TABLE "UA_ProfileRuleContexts" ADD "EntityType_Id" BIGINT NULL CONSTRAINT "FK_ProfileRuleContexts_EntityType_Id" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id");
END
GO
