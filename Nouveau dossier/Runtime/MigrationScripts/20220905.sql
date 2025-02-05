IF COL_LENGTH('dbo.UP_ResourceScalarRules', 'BaseRule_Id') IS NULL
BEGIN
    ALTER TABLE UP_ResourceScalarRules
    ADD BaseRule_Id BIGINT CONSTRAINT "DF_ResourceScalarRules_BaseRuleId" DEFAULT((0)) NULL;
END
GO

IF COL_LENGTH('dbo.UP_ResourceClassificationRules', 'BaseRule_Id') IS NULL
BEGIN
    ALTER TABLE UP_ResourceClassificationRules
    ADD BaseRule_Id BIGINT CONSTRAINT "DF_ResourceClassificationRules_BaseRuleId" DEFAULT((0)) NULL;
END
GO

