IF COL_LENGTH('dbo.UJ_Jobs', 'HasHighFrequencyCrontab') IS NULL
BEGIN
    ALTER TABLE "UJ_Jobs" ADD "HasHighFrequencyCrontab" BIT CONSTRAINT "DF_Jobs_HasHighFrequencyCrontab" DEFAULT ((0)) NOT NULL;
    ALTER TABLE "UJ_Jobs" ADD "HasHighFrequencyExecution" BIT CONSTRAINT "DF_Jobs_HasHighFrequencyExecution" DEFAULT ((0)) NOT NULL;
    ALTER TABLE "UJ_Jobs" ADD "IsInQuotaWhitelist" BIT CONSTRAINT "DF_Jobs_IsInQuotaWhitelist" DEFAULT ((0)) NOT NULL;
END
GO
UPDATE "UJ_Jobs" SET "IsInQuotaWhitelist"=1;
GO
