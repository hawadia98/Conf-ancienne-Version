IF COL_LENGTH('dbo.UA_AccessControlFilters', 'CurrentUser') IS NULL
BEGIN
ALTER TABLE "UA_AccessControlFilters" ADD
    "CurrentUser" BIT CONSTRAINT "DF_AccessControlFilters_CurrentUser" DEFAULT ((0)) NOT NULL;
END

IF COL_LENGTH('dbo.UA_AccessControlFilters', 'Operator') IS NULL
BEGIN
ALTER TABLE "UA_AccessControlFilters" ADD
    "Operator" TINYINT CONSTRAINT "DF_AccessControlFilters_Operator" DEFAULT ((0)) NOT NULL;
END

IF COL_LENGTH('dbo.UA_AccessControlFilters', 'Group') IS NULL
BEGIN
ALTER TABLE "UA_AccessControlFilters" ADD "Group" NVARCHAR(442) NULL;
END

