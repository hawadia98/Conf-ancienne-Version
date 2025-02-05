IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedSingleRoles' AND COLUMN_NAME = 'ReconciliationComment'
    )
    BEGIN
        ALTER TABLE UP_AssignedSingleRoles ADD ReconciliationComment NVARCHAR(442) NULL;
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedSingleRoles') AND name = 'tmp_IX_AssignedSingleRoles_RoleReview'
    )
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM sys.indexes
            WHERE OBJECT_ID = OBJECT_ID('UP_AssignedSingleRoles') AND name = 'IX_AssignedSingleRoles_RoleReview'
            )
            BEGIN
                EXEC sp_rename 'UP_AssignedSingleRoles.IX_AssignedSingleRoles_RoleReview', 'tmp_IX_AssignedSingleRoles_RoleReview', 'INDEX';
            END
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedSingleRoles') AND name = 'IX_AssignedSingleRoles_RoleReview'
    )
    BEGIN
        CREATE INDEX IX_AssignedSingleRoles_RoleReview
            ON UP_AssignedSingleRoles (OwnerType, WorkflowInstance_Id, Owner_Id, Id)
            INCLUDE (WorkflowState, IsDenied, StartDate, EndDate, Role_Id, ParametersContext_Id, WhenCreated, WhenPerformed, ReconciliationComment,
                     WhenReviewed1, WhenReviewed2, WhenReviewed3, WhenRiskReviewed, ReviewComment1, ReviewComment2, ReviewComment3,
                     RiskReviewComment, RequestComment, IsIndirect)
            WHERE ValidTo = CONVERT(DATETIME2(2), '9999-12-31 23:59:59.999', 121)
                AND IsIndirect = 0
                AND WorkflowState IN (8, 9, 10, 11, 12, 13, 25);
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedCompositeRoles' AND COLUMN_NAME = 'ReconciliationComment'
    )
    BEGIN
        ALTER TABLE UP_AssignedCompositeRoles ADD ReconciliationComment NVARCHAR(442) NULL;
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedCompositeRoles') AND name = 'tmp_IX_AssignedCompositeRoles_RoleReview'
    )
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM sys.indexes
            WHERE OBJECT_ID = OBJECT_ID('UP_AssignedCompositeRoles') AND name = 'IX_AssignedCompositeRoles_RoleReview'
            )
            BEGIN
                EXEC sp_rename 'UP_AssignedCompositeRoles.IX_AssignedCompositeRoles_RoleReview', 'tmp_IX_AssignedCompositeRoles_RoleReview', 'INDEX';
            END
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedCompositeRoles') AND name = 'IX_AssignedCompositeRoles_RoleReview'
    )
    BEGIN
        CREATE INDEX IX_AssignedCompositeRoles_RoleReview
            ON UP_AssignedCompositeRoles (OwnerType, WorkflowInstance_Id, Owner_Id, Id)
            INCLUDE (WorkflowState, IsDenied, StartDate, EndDate, Role_Id, ParametersContext_Id, WhenCreated, WhenPerformed, ReconciliationComment,
                     WhenReviewed1, WhenReviewed2, WhenReviewed3, WhenRiskReviewed, ReviewComment1, ReviewComment2, ReviewComment3,
                     RiskReviewComment, RequestComment, IsIndirect)
            WHERE ValidTo = CONVERT(DATETIME2(2), '9999-12-31 23:59:59.999', 121)
                AND IsIndirect = 0
                AND WorkflowState IN (8, 9, 10, 11, 12, 13, 25, 27);
    END
GO


IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedResourceTypes' AND COLUMN_NAME = 'ReconciliationComment'
    )
    BEGIN
        ALTER TABLE UP_AssignedResourceTypes ADD ReconciliationComment NVARCHAR(442) NULL;
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedSingleRoles' AND COLUMN_NAME = 'ReconciliationComment'
    )
    BEGIN
        ALTER TABLE UP_AssignedSingleRoles ADD ReconciliationComment NVARCHAR(442) NULL;
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedSingleRoles') AND name = 'tmp_IX_AssignedSingleRoles_RoleReview'
    )
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM sys.indexes
            WHERE OBJECT_ID = OBJECT_ID('UP_AssignedSingleRoles') AND name = 'IX_AssignedSingleRoles_RoleReview'
            )
            BEGIN
                EXEC sp_rename 'UP_AssignedSingleRoles.IX_AssignedSingleRoles_RoleReview', 'tmp_IX_AssignedSingleRoles_RoleReview', 'INDEX';
            END
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedSingleRoles') AND name = 'IX_AssignedSingleRoles_RoleReview'
    )
    BEGIN
        CREATE INDEX IX_AssignedSingleRoles_RoleReview
            ON UP_AssignedSingleRoles (OwnerType, WorkflowInstance_Id, Owner_Id, Id)
            INCLUDE (WorkflowState, IsDenied, StartDate, EndDate, Role_Id, ParametersContext_Id, WhenCreated, WhenPerformed, ReconciliationComment,
                     WhenReviewed1, WhenReviewed2, WhenReviewed3, WhenRiskReviewed, ReviewComment1, ReviewComment2, ReviewComment3,
                     RiskReviewComment, RequestComment, IsIndirect)
            WHERE ValidTo = CONVERT(DATETIME2(2), '9999-12-31 23:59:59.999', 121)
                AND IsIndirect = 0
                AND WorkflowState IN (8, 9, 10, 11, 12, 13, 25);
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedCompositeRoles' AND COLUMN_NAME = 'ReconciliationComment'
    )
    BEGIN
        ALTER TABLE UP_AssignedCompositeRoles ADD ReconciliationComment NVARCHAR(442) NULL;
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedCompositeRoles') AND name = 'tmp_IX_AssignedCompositeRoles_RoleReview'
    )
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM sys.indexes
            WHERE OBJECT_ID = OBJECT_ID('UP_AssignedCompositeRoles') AND name = 'IX_AssignedCompositeRoles_RoleReview'
            )
            BEGIN
                EXEC sp_rename 'UP_AssignedCompositeRoles.IX_AssignedCompositeRoles_RoleReview', 'tmp_IX_AssignedCompositeRoles_RoleReview', 'INDEX';
            END
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE OBJECT_ID = OBJECT_ID('UP_AssignedCompositeRoles') AND name = 'IX_AssignedCompositeRoles_RoleReview'
    )
    BEGIN
        CREATE INDEX IX_AssignedCompositeRoles_RoleReview
            ON UP_AssignedCompositeRoles (OwnerType, WorkflowInstance_Id, Owner_Id, Id)
            INCLUDE (WorkflowState, IsDenied, StartDate, EndDate, Role_Id, ParametersContext_Id, WhenCreated, WhenPerformed, ReconciliationComment,
                     WhenReviewed1, WhenReviewed2, WhenReviewed3, WhenRiskReviewed, ReviewComment1, ReviewComment2, ReviewComment3,
                     RiskReviewComment, RequestComment, IsIndirect)
            WHERE ValidTo = CONVERT(DATETIME2(2), '9999-12-31 23:59:59.999', 121)
                AND IsIndirect = 0
                AND WorkflowState IN (8, 9, 10, 11, 12, 13, 25, 27);
    END
GO

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UP_AssignedResourceTypes' AND COLUMN_NAME = 'ReconciliationComment'
    )
    BEGIN
        ALTER TABLE UP_AssignedResourceTypes ADD ReconciliationComment NVARCHAR(442) NULL;
    END
GO
