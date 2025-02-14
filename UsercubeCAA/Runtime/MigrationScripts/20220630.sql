IF COL_LENGTH('dbo.UC_Connectors', 'CompleteJob') IS NULL
BEGIN
ALTER TABLE "UC_Connectors" ADD "CompleteJob" TINYINT CONSTRAINT "DF_Connectors_CompleteJob" DEFAULT ((0)) NOT NULL;
END
GO

IF COL_LENGTH('dbo.UC_Connectors', 'IncrementalJob') IS NULL
BEGIN
ALTER TABLE "UC_Connectors" ADD "IncrementalJob" TINYINT CONSTRAINT "DF_Connectors_IncrementalJob" DEFAULT ((0)) NOT NULL;
END
GO
