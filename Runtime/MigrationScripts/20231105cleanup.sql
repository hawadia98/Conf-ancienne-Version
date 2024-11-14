IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedSingleRoles') AND name = 'tmp_IX_AssignedSingleRoles_RoleReview'
    )
    BEGIN
        DROP INDEX tmp_IX_AssignedSingleRoles_RoleReview ON UP_AssignedSingleRoles;
    END
GO

IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedSingleRoles' AND COLUMN_NAME = 'Comment'
    )
    BEGIN
        ALTER TABLE UP_AssignedSingleRoles DROP COLUMN Comment;
    END
GO

IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedCompositeRoles') AND name = 'tmp_IX_AssignedCompositeRoles_RoleReview'
    )
    BEGIN
        DROP INDEX tmp_IX_AssignedCompositeRoles_RoleReview ON UP_AssignedCompositeRoles;
    END
GO

IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedCompositeRoles' AND COLUMN_NAME = 'Comment'
    )
    BEGIN
        ALTER TABLE UP_AssignedCompositeRoles DROP COLUMN Comment;
    END
GO

IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedResourceTypes' AND COLUMN_NAME = 'Comment'
    )
    BEGIN
        ALTER TABLE UP_AssignedResourceTypes DROP COLUMN Comment;
    END
GO

IF OBJECT_ID('dbo.DF_AccessCertificationDataFilters_IncludeNoManualAssignment', 'D') IS NOT NULL
    BEGIN
        ALTER TABLE US_AccessCertificationDataFilters
            DROP CONSTRAINT DF_AccessCertificationDataFilters_IncludeNoManualAssignment;
    END;
GO

IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'US_AccessCertificationDataFilters' AND COLUMN_NAME = 'IncludeNoManualAssignment'
)
    BEGIN
        ALTER TABLE US_AccessCertificationDataFilters
            DROP COLUMN IncludeNoManualAssignment;
    END;
GO

