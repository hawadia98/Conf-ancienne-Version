If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_EntityTypes' AND object_id = OBJECT_ID('UM_EntityTypes'))
BEGIN
DROP INDEX "UM_EntityTypes"."IX_EntityTypes";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_EntityProperties' AND object_id = OBJECT_ID('UM_EntityProperties'))
BEGIN
DROP INDEX "UM_EntityProperties"."IX_EntityProperties";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_EntityAssociations' AND object_id = OBJECT_ID('UM_EntityAssociations'))
BEGIN
DROP INDEX "UM_EntityAssociations"."IX_EntityAssociations";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_ResourceTypes' AND object_id = OBJECT_ID('UP_ResourceTypes'))
BEGIN
DROP INDEX "UP_ResourceTypes"."IX_ResourceTypes";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_SingleRoles' AND object_id = OBJECT_ID('UP_SingleRoles'))
BEGIN
DROP INDEX "UP_SingleRoles"."IX_SingleRoles";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_CompositeRoles' AND object_id = OBJECT_ID('UP_CompositeRoles'))
BEGIN
DROP INDEX "UP_CompositeRoles"."IX_CompositeRoles";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_Risks' AND object_id = OBJECT_ID('UP_Risks'))
BEGIN
DROP INDEX "UP_Risks"."IX_Risks";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_Policies' AND object_id = OBJECT_ID('UP_Policies'))
BEGIN
DROP INDEX "UP_Policies"."IX_Policies";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_Categories' AND object_id = OBJECT_ID('UP_Categories'))
BEGIN
DROP INDEX "UP_Categories"."IX_Categories";
END

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_MiningRules' AND object_id = OBJECT_ID('UP_MiningRules'))
BEGIN
DROP INDEX "UP_MiningRules"."IX_MiningRules";
END

CREATE CLUSTERED INDEX "IX_EntityTypes" ON "UM_EntityTypes" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_EntityProperties" ON "UM_EntityProperties" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_EntityAssociations" ON "UM_EntityAssociations" ("ValidTo" ASC, "Id" ASC);

CREATE CLUSTERED INDEX "IX_ResourceTypes" ON "UP_ResourceTypes" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_SingleRoles" ON "UP_SingleRoles" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_CompositeRoles" ON "UP_CompositeRoles" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_Risks" ON "UP_Risks" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_Policies" ON "UP_Policies" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_Categories" ON "UP_Categories" ("ValidTo" ASC, "Id" ASC);
CREATE CLUSTERED INDEX "IX_MiningRules" ON "UP_MiningRules" ("ValidTo" ASC, "Id" ASC);
GO

IF COL_LENGTH('dbo.UC_Connectors', 'IsSynchronizationBlocked') IS NULL
    BEGIN
        ALTER TABLE "UC_Connectors" ADD "IsSynchronizationBlocked" BIT CONSTRAINT "DF_Connectors_IsSynchronizationBlocked" DEFAULT ((0)) NOT NULL;
    END
GO
