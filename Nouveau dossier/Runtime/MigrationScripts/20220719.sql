IF COL_LENGTH('dbo.UP_AssignedResourceNavigations', 'IsInferred') IS NULL
    BEGIN
        ALTER TABLE "UP_AssignedResourceNavigations" ADD "IsInferred" BIT CONSTRAINT "DF_AssignedResourceNavigations_IsInferred" DEFAULT ((0)) NOT NULL;
    END
GO
