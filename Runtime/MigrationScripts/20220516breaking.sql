Update "US_AccessCertificationItems"  SET "ReviewDecision" = CASE WHEN "ReviewDecision"=1 THEN 2 WHEN "ReviewDecision"=2 THEN 1 END  WHERE "IsDenied"=1 AND "ReviewDecision" IN (1,2);
GO

BEGIN
	DECLARE @myTableVariable TABLE (name varchar(128))
    DECLARE @myTableView TABLE (name varchar(128), definition varchar(max))
	DECLARE @i INT = 0;
	DECLARE @name VARCHAR(500)
    DECLARE @definition VARCHAR(max)
	DECLARE @SQL VARCHAR(500)

    -- Drop ResourceType indexes linked to SourceEntityType_Id column
	INSERT INTO @myTableVariable
	SELECT  IndexName = i.Name
	FROM    [sys].[index_columns] ic
			INNER JOIN [sys].[columns] c
				ON ic.[object_id] = c.[object_id]
				AND ic.[column_id] = c.[column_id]
			INNER JOIN [sys].[indexes] i
				ON i.[object_id] = ic.[object_id]
				AND i.[index_id] = ic.[index_id]
	WHERE   ic.[object_id] = OBJECT_ID('dbo.UP_ResourceTypes')
	AND     c.Name = 'SourceEntityType_Id'
	AND     i.Name LIKE 'ZZ_IX_ResourceTypes_View_L%';

	SELECT @name = (SELECT TOP 1 "name" FROM @myTableVariable ORDER BY [name])

	WHILE @name IS NOT NULL
	BEGIN
		SELECT @SQL = 'DROP INDEX ' + @name +' ON "UP_ResourceTypes"'
		EXEC (@SQL)
		SELECT @name = (SELECT TOP 1 "name" FROM @myTableVariable WHERE "name" > @name ORDER BY [name])
	END

    -- Drop "IX_ResourceTypes_View_L1" index
    IF EXISTS (SELECT 1 FROM [sys].[indexes] WHERE name='IX_ResourceTypes_View_L1' AND object_id = OBJECT_ID('dbo.UP_ResourceTypes')
    )
    BEGIN
	    DROP INDEX "IX_ResourceTypes_View_L1" ON "UP_ResourceTypes";
    END

    -- Drop statistics linked to SourceEntityType_Id column
	IF EXISTS (SELECT 1 FROM [sys].[stats] where Name='S_ResourceTypes_Type')
	BEGIN
		DROP STATISTICS UP_ResourceTypes.S_ResourceTypes_Type;
	END

    -- Drop views linked to SourceEntityType_Id column
    INSERT INTO @myTableView
    SELECT name, definition
    FROM [sys].[views] v
    INNER JOIN [sys].[sql_modules] m
    ON v.object_id = m.object_id
    WHERE definition LIKE '%SourceEntityType_Id%'

    SELECT @name = (SELECT TOP 1 "name" FROM @myTableView ORDER BY [name])

	WHILE @name IS NOT NULL
	BEGIN
		SELECT @SQL = 'DROP VIEW "' + @name + '"'
		EXEC (@SQL)
		SELECT @name = (SELECT TOP 1 "name" FROM @myTableView WHERE "name" > @name ORDER BY [name])
	END

    -- Modify constraint SourceEntityType_Id column
	ALTER TABLE "UP_ResourceTypes" ALTER COLUMN "SourceEntityType_Id"  BIGINT NOT NULL;

    -- Recreate statistics linked to SourceEntityType_Id column
	CREATE STATISTICS "S_ResourceTypes_Type" ON "UP_ResourceTypes"("SourceEntityType_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;

    -- Recreate "IX_ResourceTypes_View_L1" index
	CREATE INDEX "IX_ResourceTypes_View_L1" ON "UP_ResourceTypes"("SourceEntityType_Id","FullName_L1","Id") INCLUDE ("DisplayName_L1","Identifier","ApprovalWorkflowType","Policy_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)

    -- Recreate ResourceType indexes linked to SourceEntityType_Id column
	SELECT @name = (SELECT TOP 1 "name" FROM @myTableVariable ORDER BY [name])

	WHILE @name IS NOT NULL
	BEGIN
		SELECT @SQL = 'CREATE INDEX ' + @name + ' ON "UP_ResourceTypes"("SourceEntityType_Id", "fullname_l' + REPLACE(@name, 'ZZ_IX_ResourceTypes_View_L', '') + '", "id") INCLUDE ("displayname_l1", "fullname_l1", "displayname_l' + REPLACE(@name, 'ZZ_IX_ResourceTypes_View_L', '') + '", "identifier", "approvalworkflowtype", "policy_id") WHERE "ValidTo"=CONVERT(DATETIME2(2),''9999-12-31 23:59:59.999'',121)'
		EXEC (@SQL)
		SELECT @name = (SELECT TOP 1 "name" FROM @myTableVariable WHERE "name" > @name ORDER BY [name])
	END

    -- Recreate views linked to SourceEntityType_Id column
	SELECT @definition = (SELECT TOP 1 "definition" FROM @myTableView ORDER BY [definition])

	WHILE @definition IS NOT NULL
	BEGIN
		EXEC (@definition)
		SELECT @definition = (SELECT TOP 1 "definition" FROM @myTableView WHERE "definition" > @definition ORDER BY [definition])
	END
END
GO
