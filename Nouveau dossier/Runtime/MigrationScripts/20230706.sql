IF COL_LENGTH('dbo.US_AccessCertificationDataFilters', 'IncludeNoManualAssignment') IS NULL
    BEGIN
        ALTER TABLE "US_AccessCertificationDataFilters" ADD "IncludeNoManualAssignment" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeNoManualAssignment" DEFAULT ((1)) NOT NULL;
    END
GO
