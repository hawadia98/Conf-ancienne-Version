IF COL_LENGTH('dbo.US_AccessCertificationDataFilters', 'IncludeNestedCategories') IS NULL
    BEGIN
        ALTER TABLE "US_AccessCertificationDataFilters" ADD "IncludeNestedCategories" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeNestedCategories" DEFAULT ((0)) NOT NULL;        
    END
GO

IF COL_LENGTH('dbo.US_AccessCertificationOwnerFilters', 'L0') IS NULL
    BEGIN
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L0" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L0" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L4" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L4" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L5" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L5" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L6" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L6" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L7" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L7" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L8" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L8" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L9" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L9" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LA" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LA" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LB" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LB" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LC" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LC" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LD" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LD" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LE" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LE" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LF" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LF" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LG" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LG" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LH" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LH" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LI" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LI" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LJ" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LJ" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LK" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LK" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LL" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LL" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LM" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LM" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LN" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LN" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LO" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LO" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LP" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LP" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LQ" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LQ" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LR" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LR" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LS" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LS" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LT" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LT" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LU" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LU" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "LV" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LV" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L10" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L10" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L11" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L11" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L12" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L12" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L13" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L13" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L14" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L14" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L15" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L15" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L16" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L16" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L17" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L17" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L18" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L18" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L19" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L19" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1A" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1A" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1B" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1B" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1C" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1C" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1D" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1D" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1E" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1E" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1F" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1F" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1G" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1G" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1H" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1H" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1I" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1I" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1J" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1J" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1K" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1K" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1L" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1L" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1M" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1M" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1N" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1N" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1O" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1O" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1P" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1P" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1Q" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1Q" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1R" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1R" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1S" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1S" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1T" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1T" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1U" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1U" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L1V" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1V" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L20" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L20" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L21" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L21" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L22" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L22" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L23" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L23" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L24" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L24" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L25" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L25" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L26" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L26" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L27" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L27" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L28" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L28" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L29" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L29" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2A" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2A" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2B" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2B" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2C" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2C" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2D" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2D" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2E" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2E" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2F" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2F" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2G" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2G" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2H" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2H" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2I" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2I" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2J" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2J" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2K" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2K" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2L" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2L" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2M" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2M" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2N" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2N" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2O" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2O" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2P" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2P" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2Q" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2Q" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2R" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2R" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2S" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2S" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2T" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2T" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2U" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2U" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L2V" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2V" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L30" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L30" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L31" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L31" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L32" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L32" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L33" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L33" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L34" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L34" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L35" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L35" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L36" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L36" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L37" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L37" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L38" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L38" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L39" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L39" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3A" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3A" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3B" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3B" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3C" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3C" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3D" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3D" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3E" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3E" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3F" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3F" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3G" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3G" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3H" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3H" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3I" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3I" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3J" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3J" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3K" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3K" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3L" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3L" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3M" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3M" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3N" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3N" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3O" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3O" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3P" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3P" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3Q" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3Q" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3R" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3R" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3S" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3S" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3T" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3T" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3U" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3U" DEFAULT ((0)) NOT NULL;
        ALTER TABLE "US_AccessCertificationOwnerFilters" ADD "L3V" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3V" DEFAULT ((0)) NOT NULL;
    END
GO
IF COL_LENGTH('dbo.UP_CompositeRoles', 'Tags') IS NULL
    BEGIN
        ALTER TABLE UP_CompositeRoles ADD "Tags" NVARCHAR(442) NULL;        
    END
GO
IF COL_LENGTH('dbo.UP_SingleRoles', 'Tags') IS NULL
    BEGIN
        ALTER TABLE UP_SingleRoles ADD "Tags" NVARCHAR(442) NULL;        
    END
GO
IF COL_LENGTH('dbo.US_AccessCertificationDataFilters', 'Tags') IS NULL
    BEGIN
        ALTER TABLE US_AccessCertificationDataFilters ADD "Tags" NVARCHAR(442) NULL;        
    END
GO
