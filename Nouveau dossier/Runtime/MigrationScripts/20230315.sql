IF COL_LENGTH('dbo.UP_CompositeRoles', 'AllowManualAssignment') IS NULL
BEGIN
ALTER TABLE "UP_CompositeRoles" ADD "AllowManualAssignment" BIT CONSTRAINT "DF_CompositeRoles_AllowManualAssignment"
    DEFAULT ((1)) NOT NULL;
END
GO
