IF COL_LENGTH('dbo.UP_SingleRoles', 'AllowManualAssignment') IS NOT NULL
    BEGIN
        ALTER TABLE "UP_SingleRoles" DROP CONSTRAINT "DF_SingleRoles_AllowManualAssignment", COLUMN "AllowManualAssignment";
    END
GO

IF COL_LENGTH('dbo.UP_CompositeRoles', 'AllowManualAssignment') IS NOT NULL
    BEGIN
        ALTER TABLE "UP_CompositeRoles" DROP CONSTRAINT "DF_CompositeRoles_AllowManualAssignment", COLUMN "AllowManualAssignment";
    END
GO
