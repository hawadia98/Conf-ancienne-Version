IF COL_LENGTH('dbo.UP_AssignedSingleRoles', 'RedundantAssignment') IS NULL
    BEGIN
        ALTER TABLE "UP_AssignedSingleRoles" ADD "RedundantAssignment" BIT CONSTRAINT "DF_AssignedSingleRoles_RedundantAssignment" DEFAULT ((0)) NOT NULL;
    END
GO

IF COL_LENGTH('dbo.UP_AssignedResourceTypes', 'RedundantAssignment') IS NULL
    BEGIN
        ALTER TABLE "UP_AssignedResourceTypes" ADD "RedundantAssignment" BIT CONSTRAINT "DF_AssignedResourceTypes_RedundantAssignment" DEFAULT ((0)) NOT NULL;
    END
GO

IF COL_LENGTH('dbo.UP_AssignedCompositeRoles', 'RedundantAssignment') IS NULL
    BEGIN
        ALTER TABLE "UP_AssignedCompositeRoles" ADD "RedundantAssignment" BIT CONSTRAINT "DF_AssignedCompositeRoles_RedundantAssignment" DEFAULT ((0)) NOT NULL;
    END
GO
