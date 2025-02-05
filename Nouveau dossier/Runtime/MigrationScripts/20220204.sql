IF COL_LENGTH('dbo.UD_ConfigurationFileItems', 'LineNumber') IS NULL
BEGIN

ALTER TABLE "UD_ConfigurationFileItems" ADD "LineNumber" INT  DEFAULT ((0)) NOT NULL;
END

GO

ALTER TABLE UD_ConfigurationFileItems
DROP CONSTRAINT "PK_ConfigurationFileItems";
GO

ALTER TABLE UD_ConfigurationFileItems
ADD CONSTRAINT "PK_ConfigurationFileItems" PRIMARY KEY CLUSTERED ("TableName","Item_Id","File_Id","Scaffolding_Id","LineNumber" ASC);
GO
