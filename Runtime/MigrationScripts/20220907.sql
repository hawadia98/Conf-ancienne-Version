IF COL_LENGTH('dbo.UP_Policies', 'ProlongationWithoutApproval') IS NULL
BEGIN
ALTER TABLE "UP_Policies" ADD "ProlongationWithoutApproval" BIT DEFAULT ((0)) NOT NULL;
END
GO

IF COL_LENGTH('dbo.UP_CompositeRoles', 'ProlongationWithoutApproval') IS NULL
BEGIN
ALTER TABLE "UP_CompositeRoles" ADD "ProlongationWithoutApproval" TINYINT CONSTRAINT [DF_CompositeRoles_ProlongationWithoutApproval] DEFAULT ((0)) NOT NULL;
END
GO

IF COL_LENGTH('dbo.UP_SingleRoles', 'ProlongationWithoutApproval') IS NULL
BEGIN
ALTER TABLE "UP_SingleRoles" ADD "ProlongationWithoutApproval" TINYINT CONSTRAINT [DF_SingleRoles_ProlongationWithoutApproval] DEFAULT ((0)) NOT NULL;
END
GO

IF COL_LENGTH('dbo.UP_ResourceTypes', 'ProlongationWithoutApproval') IS NULL
BEGIN
ALTER TABLE "UP_ResourceTypes" ADD "ProlongationWithoutApproval" TINYINT CONSTRAINT [DF_ResourceTypes_ProlongationWithoutApproval] DEFAULT ((0)) NOT NULL;
END
GO
