IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'US_AccessCertificationDataFilters'
      AND COLUMN_NAME = 'IncludeManualAssignmentNotAllowed'
)
    BEGIN
        ALTER TABLE US_AccessCertificationDataFilters
            ADD IncludeManualAssignmentNotAllowed BIT CONSTRAINT DF_AccessCertificationDataFilters_IncludeManualAssignmentNotAllowed DEFAULT (1) NOT NULL;
    END;
GO

IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'US_AccessCertificationDataFilters'
      AND COLUMN_NAME = 'IncludeNoManualAssignment'
)
    BEGIN
        EXEC sp_executesql N'UPDATE US_AccessCertificationDataFilters SET IncludeManualAssignmentNotAllowed = IncludeNoManualAssignment;';
    END;
GO
