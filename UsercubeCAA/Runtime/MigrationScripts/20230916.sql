IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'UI_DisplayEntityTypes' AND COLUMN_NAME = 'HideRoles'
)
    BEGIN
        ALTER TABLE "UI_DisplayEntityTypes" ADD "HideRoles" BIT CONSTRAINT "DF_DisplayEntityTypes_HideRoles" DEFAULT ((0)) NOT NULL;
    END
GO
