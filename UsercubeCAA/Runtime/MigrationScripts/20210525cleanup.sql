ALTER TABLE "UD_ScaffoldingArguments" DROP CONSTRAINT "DF_ScaffoldingArguments_FileAreNotEncrypted", COLUMN "FilesAreNotEncrypted";
ALTER TABLE "UD_Scaffoldings" DROP CONSTRAINT "DF_Scaffolding_FileAreEncrypted", COLUMN "FilesAreNotEncrypted";
GO
ALTER TABLE "up_resourcetypes" DROP CONSTRAINT "FK_ResourceTypes_ContextRule";
GO
ALTER TABLE "up_resourcetypes" DROP COLUMN "contextrule_id";
GO
