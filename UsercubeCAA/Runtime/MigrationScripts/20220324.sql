GO
IF NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_ResourceChanges_Resource_Id' AND object_id = OBJECT_ID('dbo.UR_ResourceChanges')
)
BEGIN
    CREATE NONCLUSTERED INDEX "IX_ResourceChanges_Resource_Id" ON "UR_ResourceChanges"
    (
        "JobInstance_Id" ASC,
        "Type" ASC,
        "Resource_Id" ASC
    );
END
GO
