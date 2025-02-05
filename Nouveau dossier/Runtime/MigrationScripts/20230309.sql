IF COL_LENGTH('dbo.UP_SingleRoles', 'AllowManualAssignment') IS NULL
BEGIN
ALTER TABLE "UP_SingleRoles" ADD "AllowManualAssignment" BIT CONSTRAINT "DF_SingleRoles_AllowManualAssignment"
    DEFAULT ((1)) NOT NULL;
END
GO
