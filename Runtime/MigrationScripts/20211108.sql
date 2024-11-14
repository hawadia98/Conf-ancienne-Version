ALTER TABLE UD_ConfigurationFileItems
ADD Scaffolding_Id BIGINT DEFAULT ((0)) NOT NULL;
GO

ALTER TABLE UD_ConfigurationFileItems
DROP CONSTRAINT "PK_ConfigurationFileItems";
GO

ALTER TABLE UD_ConfigurationFileItems
ADD CONSTRAINT "PK_ConfigurationFileItems" PRIMARY KEY CLUSTERED ("TableName","Item_Id","File_Id","Scaffolding_Id" ASC);
GO
