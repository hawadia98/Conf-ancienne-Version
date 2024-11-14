IF COL_LENGTH('dbo.UP_ContextRules', 'MinIdentitiesCount') IS NULL
    BEGIN
        ALTER TABLE "UP_ContextRules"
            ADD "MinIdentitiesCount" INT CONSTRAINT "DF_ContextRules_MinIdentitiesCount" DEFAULT ((0)) NOT NULL;
    END
GO

IF (COL_LENGTH('dbo.UP_ContextRules', 'MinIdentitiesCount') IS NOT NULL) AND (COL_LENGTH('dbo.UP_ContextRules', 'MinIndentitiesCount') IS NOT NULL)
    BEGIN
        EXEC ('UPDATE "UP_ContextRules" SET "MinIdentitiesCount"="MinIndentitiesCount"')
    END
GO
