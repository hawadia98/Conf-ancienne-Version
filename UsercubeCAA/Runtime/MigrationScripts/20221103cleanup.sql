IF EXISTS (
    SELECT TOP 1 1 FROM sys.default_constraints
    WHERE name='DF_AccessControlEntries_IsDenied' AND parent_object_id = OBJECT_ID('dbo.UA_AccessControlEntries'))
BEGIN
ALTER TABLE "UA_AccessControlEntries" DROP "DF_AccessControlEntries_IsDenied";
END
GO

IF COL_LENGTH('dbo.UA_AccessControlEntries', 'IsDenied') IS NOT NULL
BEGIN
ALTER TABLE "UA_AccessControlEntries" DROP COLUMN "IsDenied";
END
GO

IF EXISTS (
        SELECT TOP 1 1 FROM sys.default_constraints
        WHERE name='DF_ContextRules_MinIndentitiesCount' AND parent_object_id = OBJECT_ID('dbo.UP_ContextRules'))
BEGIN
    ALTER TABLE "UP_ContextRules" DROP "DF_ContextRules_MinIndentitiesCount";
END
GO
IF COL_LENGTH('dbo.UP_ContextRules', 'MinIndentitiesCount') IS NOT NULL
BEGIN
    ALTER TABLE "UP_ContextRules" DROP COLUMN "MinIndentitiesCount";
END
GO

IF OBJECT_ID(N'dbo.UP_PendingApprovalRules', N'U') IS NOT NULL
BEGIN
    DROP TABLE [dbo].[UP_PendingApprovalRules];
END
GO
