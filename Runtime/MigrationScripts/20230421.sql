IF COL_LENGTH('dbo.UP_CompositeRoleRules', 'ParentRole_Id') IS NULL
BEGIN
ALTER TABLE "UP_CompositeRoleRules" ADD "ParentRole_Id" BIGINT NULL;
ALTER TABLE "UP_CompositeRoleRules" ADD CONSTRAINT "FK_CompositeRoleRules_ParentRole" FOREIGN KEY ("ParentRole_Id") REFERENCES "UP_CompositeRoles" ("Id");
ALTER TABLE "UP_CompositeRoleRules" NOCHECK CONSTRAINT "FK_CompositeRoleRules_ParentRole";
END
GO
