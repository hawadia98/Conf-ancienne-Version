-- Create tmp table containing ACR ending with '_Migration521'
CREATE TABLE #tmpacr (
	EntityType_Id BIGINT
	,Id BIGINT
	,Profile_Id BIGINT
	);

INSERT INTO #tmpacr
SELECT acr.EntityType_Id
	,acr.Id
	,acr.Profile_Id
FROM UA_AccessControlRules acr
WHERE Identifier LIKE '%_Migration521'
	AND NOT EXISTS (
		SELECT *
		FROM UD_ConfigurationFileItems
		WHERE Item_Id = acr.Id
			AND TableName = 'ua_accesscontrolrules'
		);

-- Create tmp table containing ACR delete
CREATE TABLE #tmpdel (Id BIGINT);

DECLARE @permissionId BIGINT = 4611686018427387998;

INSERT INTO #tmpdel
SELECT t.Id
FROM UA_AccessControlRules acr
JOIN UA_AccessControlEntries ace ON ace.Rule_Id = acr.Id
	AND ace.Permission_Id = @permissionId
JOIN #tmpacr t ON t.Profile_Id = acr.Profile_Id
	AND t.EntityType_Id = acr.EntityType_Id
WHERE acr.Identifier NOT LIKE '%_Migration521';

-- Delete ACE associated to duplicated ACR
DELETE
FROM UA_AccessControlEntries
WHERE Rule_Id IN (
		SELECT Id
		FROM #tmpdel
		);

-- Delete duplicated ACR
DELETE
FROM UA_AccessControlRules
WHERE Id IN (
		SELECT Id
		FROM #tmpdel
		);

-- Delete duplicated ACR, #tmpacr will contain no duplicated ACR
DELETE
FROM #tmpacr
WHERE Id IN (
		SELECT Id
		FROM #tmpdel
		);

DECLARE @fileId BIGINT = (
		SELECT TOP (1) Id
		FROM UD_ConfigurationFiles
		WHERE FilePath != 'scaffolding'
		);
DECLARE @scaffoldingId BIGINT = (
		SELECT TOP (1) Scaffolding_Id
		FROM UD_ConfigurationFileItems
		);

INSERT INTO UD_ConfigurationFileItems (
	File_Id
	,Item_Id
	,TableName
	,Scaffolding_Id
	)
SELECT @fileId
	,ace.Id
	,'ua_accesscontrolentries'
	,@scaffoldingId
FROM UA_AccessControlEntries ace
JOIN #tmpacr tmp ON tmp.Id = ace.Rule_Id;

-- INSERT ACR INTO CONF FILE ITEM
INSERT INTO UD_ConfigurationFileItems (
	File_Id
	,Item_Id
	,TableName
	,Scaffolding_Id
	)
SELECT @fileId
	,Id
	,'ua_accesscontrolrules'
	,@scaffoldingId
FROM #tmpacr;

-- DROP TABLES
DROP TABLE #tmpacr;

DROP TABLE #tmpdel;
GO
