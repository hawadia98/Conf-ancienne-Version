IF COL_LENGTH('dbo.UJ_JobInstances', 'JobDefinition') IS NULL
    BEGIN
        alter table UJ_JobInstances
            ADD "JobDefinition" NVARCHAR(MAX) NULL;
    END
GO
