ALTER TABLE [dbo].[UC_Connections]
    ADD [Package521_Id] BIGINT NULL,
        [HasRefreshSchemaFailed] BIT CONSTRAINT [DF_Connections_HasRefreshSchemaFailed] DEFAULT ((0)) NOT NULL;
GO

UPDATE UC_Connections
SET Package521_Id = Package_Id;
GO
