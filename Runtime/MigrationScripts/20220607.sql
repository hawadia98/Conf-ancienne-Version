ALTER TABLE UJ_TaskInstances
ALTER COLUMN WrappedProgress VARCHAR(8000);
GO

IF COL_LENGTH('dbo.UP_SingleRoles', 'MaxDuration') IS NULL
BEGIN
ALTER TABLE "UP_SingleRoles" ADD "MaxDuration" INT NOT NULL DEFAULT 0;
END
GO

IF COL_LENGTH('dbo.UP_CompositeRoles', 'MaxDuration') IS NULL
BEGIN
ALTER TABLE "UP_CompositeRoles" ADD "MaxDuration" INT NOT NULL DEFAULT 0;
END
GO

IF COL_LENGTH('dbo.UP_ResourceTypes', 'MaxDuration') IS NULL
BEGIN
ALTER TABLE "UP_ResourceTypes" ADD "MaxDuration" INT NOT NULL DEFAULT 0;
END
GO


