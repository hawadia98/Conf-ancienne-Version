IF COL_LENGTH('dbo.UP_Policies', 'CommentActivationOnRequest') IS NULL
BEGIN
ALTER TABLE "UP_Policies" ADD "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_Policies_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL;
END
GO
IF COL_LENGTH('dbo.UP_CompositeRoles', 'CommentActivationOnRequest') IS NULL
BEGIN
ALTER TABLE "UP_CompositeRoles" ADD "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_CompositeRoles_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL;
END
GO
IF COL_LENGTH('dbo.UP_SingleRoles', 'CommentActivationOnRequest') IS NULL
BEGIN
ALTER TABLE "UP_SingleRoles" ADD "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_SingleRoles_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL;
END
IF COL_LENGTH('dbo.UP_RoleMappings', 'CommentActivationOnRequest') IS NULL
BEGIN
ALTER TABLE "UP_RoleMappings" ADD "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_RoleMappings_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL;
END
GO
UPDATE UP_Policies SET CommentActivationOnRequest=1;
UPDATE UP_CompositeRoles SET CommentActivationOnRequest=3;
UPDATE UP_SingleRoles SET CommentActivationOnRequest=3;
UPDATE UP_RoleMappings SET CommentActivationOnRequest=3;
GO
