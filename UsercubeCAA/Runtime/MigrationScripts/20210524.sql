ALTER TABLE "UD_ScaffoldingArguments" ADD "IsIncremental" BIT CONSTRAINT "DF_ScaffoldingArguments_IsIncremental" DEFAULT ((0)) NOT NULL;
GO
UPDATE "UD_ScaffoldingArguments" SET "IsIncremental" = "FilesAreNotEncrypted";
GO

ALTER TABLE "UW_Aspects" ADD [P20]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P21]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P22]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P23]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P24]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P25]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P26]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P27]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P28]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P29]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P30]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P31]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P32]                  NVARCHAR (MAX) NULL;
ALTER TABLE "UW_Aspects" ADD     [P33]                  NVARCHAR (MAX) NULL;
GO
