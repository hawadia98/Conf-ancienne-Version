IF COL_LENGTH('dbo.UP_ContextRules', 'ResourceCertificationComparisonBinding_Id') IS NULL
    BEGIN
        ALTER TABLE "UP_ContextRules" ADD "ResourceCertificationComparisonBinding_Id" BIGINT NULL CONSTRAINT "FK_ContextRules_ResourceCertificationComparisonBinding_Id" FOREIGN KEY ("ResourceCertificationComparisonBinding_Id") REFERENCES "UM_Bindings" ("Id");
    END
GO


IF COL_LENGTH('dbo.UP_ContextRules', 'ResourceCertificationComparisonOperator') IS NULL
    BEGIN
        ALTER TABLE "UP_ContextRules" ADD "ResourceCertificationComparisonOperator" TINYINT NULL;
    END
GO


IF COL_LENGTH('dbo.UP_ContextRules', 'ResourceCertificationComparisonValue') IS NULL
    BEGIN
        ALTER TABLE "UP_ContextRules" ADD "ResourceCertificationComparisonValue" NVARCHAR(442) NULL;
    END
GO
