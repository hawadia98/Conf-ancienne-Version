IF COL_LENGTH('dbo.up_recordsections', 'IsDefaultBoundariesSection') IS NULL
    BEGIN
        ALTER TABLE "up_recordsections" ADD "IsDefaultBoundariesSection" BIT CONSTRAINT "DF_RecordSections_IsDefaultBoundariesSection" DEFAULT ((0)) NOT NULL;
    END
GO
IF COL_LENGTH('dbo.up_recordsections', 'InstanceKeyExpression') IS NULL
    BEGIN
        ALTER TABLE "up_recordsections" ADD "InstanceKeyExpression" VARCHAR(4000) NULL;
    END
GO
/*TODO: migrate EffectiveEndDate if in 101*/
