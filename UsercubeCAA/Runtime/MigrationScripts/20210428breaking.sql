/* Reapply partitioning after the 5.2 migration */
IF CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'SQL Azure%'
    OR CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'Enterprise%'
    OR CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'Developer%'
    OR CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 4) AS int) > 13 --SQL 2017 and later
    OR (CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 4) AS int) = 13 --SQL 2016
    AND CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 2) AS int) >= 4001) --SP1 or greater
BEGIN
IF NOT EXISTS(select 1 from sys.partition_schemes WHERE name='HistoryScheme')
BEGIN
EXEC sp_executesql N'CREATE PARTITION FUNCTION "HistoryFunction"(DateTime2(2)) AS RANGE RIGHT FOR VALUES (CONVERT(DATETIME2(2),''9999-12-31 23:59:59.999'',121));
CREATE PARTITION SCHEME "HistoryScheme" AS PARTITION "HistoryFunction" TO ("PRIMARY", "PRIMARY");';
END;
--- Start UR_Resources ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_Resources'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='HistoryScheme'
where p.object_id =OBJECT_ID('ur_resources'))
BEGIN
DROP INDEX "IX_Resources" ON "UR_Resources";
CREATE UNIQUE CLUSTERED INDEX "IX_Resources" ON "UR_Resources"("ValidTo" ASC, "Type" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='pk_resources'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('ur_resources'))
BEGIN
ALTER TABLE "UR_Resources" DROP CONSTRAINT "PK_Resources";
ALTER TABLE "UR_Resources" ADD CONSTRAINT "PK_Resources" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- Start UR_ResourceLinks ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceLinks_1'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceLinks'))
BEGIN
DROP INDEX "IX_ResourceLinks_1" ON "UR_ResourceLinks";
CREATE UNIQUE CLUSTERED INDEX "IX_ResourceLinks_1" ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R1_Id" ASC, "R2_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceLinks_2'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceLinks'))
BEGIN
DROP INDEX "IX_ResourceLinks_2" ON "UR_ResourceLinks";
CREATE UNIQUE NONCLUSTERED INDEX "IX_ResourceLinks_2" ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R2_Id" ASC, "R1_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;

--- Start UR_ResourceFiles ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceFiles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceFiles'))
BEGIN
DROP INDEX "IX_ResourceFiles" ON "UR_ResourceFiles";
CREATE CLUSTERED INDEX "IX_ResourceFiles"
    ON "UR_ResourceFiles"("ValidTo" ASC, "Property_Id" ASC, "Resource_Id" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

    

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceFiles2'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceFiles'))
BEGIN
DROP INDEX "IX_ResourceFiles2" ON "UR_ResourceFiles";
CREATE INDEX "IX_ResourceFiles2"
    ON "UR_ResourceFiles"("Property_Id" ASC,"Resource_Id" ASC, "ValidFrom" DESC)
	INCLUDE (Id, "validto","mimetype","filename") ON "HistoryScheme"("ValidTo");
END;




IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_ResourceFiles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceFiles'))
BEGIN
ALTER TABLE "UR_ResourceFiles" DROP CONSTRAINT "PK_ResourceFiles";
ALTER TABLE "UR_ResourceFiles" ADD CONSTRAINT "PK_ResourceFiles" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedCompositeRoles---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedCompositeRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedCompositeRoles'))
BEGIN
ALTER TABLE "UP_AssignedCompositeRoles" DROP CONSTRAINT "PK_AssignedCompositeRoles";
ALTER TABLE "UP_AssignedCompositeRoles" ADD CONSTRAINT "PK_AssignedCompositeRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='UK_AssignedCompositeRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedCompositeRoles'))
BEGIN
ALTER TABLE "UP_AssignedCompositeRoles" DROP CONSTRAINT "UK_AssignedCompositeRoles";
ALTER TABLE "UP_AssignedCompositeRoles" ADD CONSTRAINT "UK_AssignedCompositeRoles" UNIQUE ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedSingleRoles---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedSingleRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedSingleRoles'))
BEGIN
ALTER TABLE "UP_AssignedSingleRoles" DROP CONSTRAINT "PK_AssignedSingleRoles";
ALTER TABLE "UP_AssignedSingleRoles" ADD CONSTRAINT "PK_AssignedSingleRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='UK_AssignedSingleRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedSingleRoles'))
BEGIN
ALTER TABLE "UP_AssignedSingleRoles" DROP CONSTRAINT "UK_AssignedSingleRoles";
ALTER TABLE "UP_AssignedSingleRoles" ADD CONSTRAINT "UK_AssignedSingleRoles" UNIQUE ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceTypes ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceTypes'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceTypes'))
BEGIN
ALTER TABLE "UP_AssignedResourceTypes" DROP CONSTRAINT "PK_AssignedResourceTypes"; 
ALTER TABLE "UP_AssignedResourceTypes" ADD CONSTRAINT "PK_AssignedResourceTypes" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceTypes'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceTypes'))
BEGIN
ALTER TABLE "UP_AssignedResourceTypes" DROP CONSTRAINT "CK_AssignedResourceTypes"; 
ALTER TABLE "UP_AssignedResourceTypes" ADD CONSTRAINT "CK_AssignedResourceTypes" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceScalars ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceScalar'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceScalars'))
BEGIN
ALTER TABLE "UP_AssignedResourceScalars" DROP CONSTRAINT "CK_AssignedResourceScalar" ;
ALTER TABLE "UP_AssignedResourceScalars" ADD CONSTRAINT "CK_AssignedResourceScalar" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceScalar'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceScalars'))
BEGIN
ALTER TABLE "UP_AssignedResourceScalars" DROP CONSTRAINT "PK_AssignedResourceScalar";
ALTER TABLE "UP_AssignedResourceScalars" ADD CONSTRAINT "PK_AssignedResourceScalar" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceNavigations ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceNavigations'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceNavigations'))
BEGIN
ALTER TABLE "UP_AssignedResourceNavigations" DROP CONSTRAINT "CK_AssignedResourceNavigations";
ALTER TABLE "UP_AssignedResourceNavigations" ADD CONSTRAINT "CK_AssignedResourceNavigations" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "Resource_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)  ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceNavigations'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceNavigations'))
BEGIN
ALTER TABLE "UP_AssignedResourceNavigations" DROP CONSTRAINT "PK_AssignedResourceNavigations";
ALTER TABLE "UP_AssignedResourceNavigations" ADD CONSTRAINT "PK_AssignedResourceNavigations" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC)  ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceBinaries ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceBinaries'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceBinaries'))
BEGIN
ALTER TABLE "UP_AssignedResourceBinaries" DROP CONSTRAINT "CK_AssignedResourceBinaries";
ALTER TABLE "UP_AssignedResourceBinaries" ADD CONSTRAINT "CK_AssignedResourceBinaries" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "ResourceFile_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)  ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceBinaries'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceBinaries'))
BEGIN
ALTER TABLE "UP_AssignedResourceBinaries" DROP CONSTRAINT "PK_AssignedResourceBinaries";
ALTER TABLE "UP_AssignedResourceBinaries" ADD CONSTRAINT "PK_AssignedResourceBinaries" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP IdentifiedRisks ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_IdentifiedRisks'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_IdentifiedRisks'))
BEGIN
ALTER TABLE "UP_IdentifiedRisks" DROP CONSTRAINT "CK_IdentifiedRisks";
ALTER TABLE "UP_IdentifiedRisks" ADD CONSTRAINT "CK_IdentifiedRisks" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_IdentifiedRisks'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_IdentifiedRisks'))
BEGIN
ALTER TABLE "UP_IdentifiedRisks" DROP CONSTRAINT "PK_IdentifiedRisks";
ALTER TABLE "UP_IdentifiedRisks" ADD CONSTRAINT "PK_IdentifiedRisks" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC,"Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP ResourceRiskScores ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_ResourceRiskScores'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_ResourceRiskScores'))
BEGIN
ALTER TABLE "UP_ResourceRiskScores" DROP CONSTRAINT "CK_ResourceRiskScores";
ALTER TABLE "UP_ResourceRiskScores" ADD CONSTRAINT "CK_ResourceRiskScores" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_ResourceRiskScores'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_ResourceRiskScores'))
BEGIN
ALTER TABLE "UP_ResourceRiskScores" DROP CONSTRAINT "PK_ResourceRiskScores";
ALTER TABLE "UP_ResourceRiskScores" ADD CONSTRAINT "PK_ResourceRiskScores" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

END;
GO
