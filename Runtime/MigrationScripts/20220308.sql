DECLARE @CustomResourceFilesPermissionID BIGINT = (SELECT "id" FROM "ua_accesscontrolpermissions" WHERE "identifier" LIKE '/Custom/ResourceFiles')
DELETE FROM "ua_accesscontrolentries" WHERE "permission_id" = @CustomResourceFilesPermissionID
GO

SELECT (SELECT COALESCE(MIN("id"),0)-1 FROM "ua_accesscontrolentries")-ROW_NUMBER() OVER(ORDER BY r."ruleid" ASC) itemId, r.permissionId, 1 canExecute, r.ruleId, r.fileId, r.scaffoldingId
INTO #EntriesToCreate
FROM (
	SELECT ap."id" permissionId, acr."id" ruleId, cfi."file_id" fileId, cfi."scaffolding_id" scaffoldingId
	FROM "ua_accesscontrolrules" acr
	JOIN "um_entitytypes" et ON et."id" = acr."entitytype_id"
	JOIN "ud_configurationfileitems" cfi ON cfi."item_id" = acr."id" AND cfi."tablename" = 'ua_accesscontrolrules'
	JOIN "ua_accesscontrolpermissions" ap ON ap."identifier" = '/Custom/ResourceFiles/' + et."identifier"
	WHERE acr."id" IN (
		SELECT ae."rule_id"
		FROM "ua_accesscontrolentries" ae
		JOIN "ua_accesscontrolrules" acr on acr."id" = ae."rule_id"
		JOIN "um_entitytypes" et ON et."id" = acr."entitytype_id"
		JOIN "ua_accesscontrolpermissions" ap on ap."id" = ae."permission_id"
		WHERE ap."identifier" = '/Custom/Resources/' + et."identifier" + '/View'
	)
) r
WHERE r.ruleId NOT IN (
	SELECT DISTINCT "rule_id"
	FROM "ua_accesscontrolentries" ae
	WHERE ae."permission_id" in (SELECT "id" FROM "ua_accesscontrolpermissions" WHERE "identifier" LIKE '/Custom/ResourceFiles/%')
)

INSERT INTO "ua_accesscontrolentries"("id","permission_id","canexecute","rule_id")
SELECT itemId, permissionId, canExecute, ruleId
FROM #EntriesToCreate

INSERT INTO "ud_configurationfileitems"("file_id","item_id","tablename","scaffolding_id","linenumber")
SELECT fileId, itemId, 'ua_accesscontrolentries' tableName, scaffoldingId, 0 lineNumber
FROM #EntriesToCreate

DROP TABLE #EntriesToCreate
GO

IF COL_LENGTH('dbo.UM_Settings','C11') IS NULL
BEGIN
    ALTER TABLE "UM_Settings" ADD "C11" NVARCHAR(4000) NULL;
END
GO

UPDATE "UM_Settings" SET "C11"='true' WHERE "identifier"='AppDisplay';
GO
