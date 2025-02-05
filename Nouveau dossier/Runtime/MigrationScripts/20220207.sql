UPDATE UP_PolicySimulations SET State=50 WHERE Policy_Id IS NULL

GO
IF EXISTS(select 1 from sys.partition_schemes WHERE name='HistoryScheme')
BEGIN
DROP INDEX "IX_AssignedResourceTypes_Resource" ON "UP_AssignedResourceTypes"; 
CREATE INDEX "IX_AssignedResourceTypes_Resource" ON "UP_AssignedResourceTypes" ("Resource_Id") WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;
ELSE
BEGIN
DROP INDEX "IX_AssignedResourceTypes_Resource" ON "UP_AssignedResourceTypes"; 
CREATE INDEX "IX_AssignedResourceTypes_Resource" ON "UP_AssignedResourceTypes" ("Resource_Id") WITH (FILLFACTOR=90, PAD_INDEX=ON);
END;
GO
