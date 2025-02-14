IF COL_LENGTH('dbo.UP_CompositeRoleRules', 'Priority') IS NULL
BEGIN
ALTER TABLE "UP_CompositeRoleRules" ADD "Priority" INT CONSTRAINT "DF_CompositeRoleRules_Priority" DEFAULT((0)) NOT NULL;
END
GO
IF COL_LENGTH('dbo.UP_SingleRoleRules', 'Priority') IS NULL
BEGIN
ALTER TABLE "UP_SingleRoleRules" ADD "Priority" INT CONSTRAINT "DF_SingleRoleRules_Priority" DEFAULT((0)) NOT NULL;
END
GO
