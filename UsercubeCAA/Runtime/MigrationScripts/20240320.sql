IF OBJECT_ID('dbo.UT_ReviewerIdComments', 'U') IS NOT NULL
    BEGIN
        DROP TABLE "UT_ReviewerIdComments";
    END
GO
IF OBJECT_ID('dbo.UT_ReviewerIdComments', 'U') IS NULL
    BEGIN
        CREATE TABLE "UT_ReviewerIdComments" (
            "Id" BIGINT NOT NULL,
            "ReviewerId" BIGINT NULL,
            "Comment" NVARCHAR(442) NULL,
        );
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedCompositeRoles', 'U') IS NOT NULL
    BEGIN
        DROP TABLE "UT_BulkAssignedCompositeRoles";
    END
GO

IF OBJECT_ID('dbo.UT_BulkAssignedSingleRoles', 'U') IS NOT NULL
    BEGIN
        DROP TABLE "UT_BulkAssignedSingleRoles";
    END
GO
