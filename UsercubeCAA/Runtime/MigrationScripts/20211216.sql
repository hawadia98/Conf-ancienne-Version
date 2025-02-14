If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_ProfileContexts_CompositeRole' AND object_id = OBJECT_ID('dbo.UA_ProfileContexts')
)
BEGIN
    CREATE INDEX "IX_ProfileContexts_CompositeRole" ON "UA_ProfileContexts" ("CompositeRole_Id")
    WHERE "CompositeRole_Id" IS NOT NULL;
END

GO

If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_ProfileContexts_SingleRole' AND object_id = OBJECT_ID('dbo.UA_ProfileContexts')
)
BEGIN
    CREATE INDEX "IX_ProfileContexts_SingleRole" ON "UA_ProfileContexts" ("SingleRole_Id")
    WHERE "SingleRole_Id" IS NOT NULL;

END

GO

If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_ProfileContexts_ResourceType' AND object_id = OBJECT_ID('dbo.UA_ProfileContexts')
)
BEGIN
    CREATE INDEX "IX_ProfileContexts_ResourceType" ON "UA_ProfileContexts" ("ResourceType_Id")
    WHERE "ResourceType_Id" IS NOT NULL;

END

GO

If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_ProfileContexts_Category' AND object_id = OBJECT_ID('dbo.UA_ProfileContexts')
)
BEGIN
    CREATE INDEX "IX_ProfileContexts_Category" ON "UA_ProfileContexts" ("Category_Id")
    WHERE "Category_Id" IS NOT NULL;
END
