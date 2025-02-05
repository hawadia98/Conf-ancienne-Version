ALTER TABLE [dbo].[UP_PolicySimulations] DROP CONSTRAINT [FK_PolicySimulations_EntityType2];
GO

ALTER TABLE [dbo].[UP_PolicySimulations] DROP COLUMN [EntityType2_Id];
GO



IF EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UP_IndirectResourceRules' AND COLUMN_NAME='DenialProperty_Id')
BEGIN
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP COLUMN [DenialProperty_Id], COLUMN [IndirectResourceBinding_Id], COLUMN [IndirectResourceReflexiveProperty_Id], COLUMN [TargetEntityTypeProperty_Id], COLUMN [TargetEntityTypeReflexiveProperty_Id];
END
GO

IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceFileChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
EXEC sp_executesql N'UPDATE "UR_ResourceFileChanges" SET "JobInstance_Id" = "JobInstanceId" WHERE JobInstance_Id is NULL';
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
EXEC sp_executesql N'UPDATE "UR_ResourceChanges" SET "JobInstance_Id" = "JobInstanceId" WHERE JobInstance_Id IS NULL';
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceLinkChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
EXEC sp_executesql N'UPDATE "UR_ResourceLinkChanges" SET "JobInstance_Id" = "JobInstanceId" WHERE JobInstance_Id IS NULL';
END
GO

ALTER TABLE "UR_ResourceFileChanges" ALTER COLUMN "JobInstance_Id"  BIGINT NOT NULL;
GO
ALTER TABLE "UR_ResourceChanges" ALTER COLUMN "JobInstance_Id"  BIGINT NOT NULL;
GO
ALTER TABLE "UR_ResourceLinkChanges" ALTER COLUMN "JobInstance_Id"  BIGINT NOT NULL;
GO

DROP INDEX "IX_ResourceFileChanges" ON "UR_ResourceFileChanges";
GO
DROP INDEX "IX_ResourceChanges" ON "UR_ResourceChanges";
GO
DROP INDEX "IX_ResourceLinkChanges" ON "UR_ResourceLinkChanges";
GO

CREATE CLUSTERED INDEX "IX_ResourceFileChanges" ON "UR_ResourceFileChanges"("JobInstance_Id" ASC, "Property_Id" ASC, "Resource_PK" ASC);
GO
CREATE CLUSTERED INDEX "IX_ResourceChanges" ON "UR_ResourceChanges"("JobInstance_Id"  ASC, "Type" ASC, "PrimaryKey" ASC, "Resource_Id" ASC);
GO
CREATE CLUSTERED INDEX "IX_ResourceLinkChanges" ON "UR_ResourceLinkChanges"("JobInstance_Id" ASC, "Type" ASC);
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceFileChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
ALTER TABLE "UR_ResourceFileChanges" DROP COLUMN "JobInstanceId";
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
ALTER TABLE "UR_ResourceChanges" DROP COLUMN "JobInstanceId";
END
GO
IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='UR_ResourceLinkChanges' AND COLUMN_NAME='JobInstanceId')
BEGIN
ALTER TABLE "UR_ResourceLinkChanges" DROP COLUMN "JobInstanceId";
END
GO


