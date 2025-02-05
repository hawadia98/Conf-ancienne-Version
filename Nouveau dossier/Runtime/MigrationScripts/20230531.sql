IF COL_LENGTH('dbo.UI_DisplayPropertyGroups', 'Identifier') IS NULL
BEGIN
    CREATE TABLE "UI_DisplayPropertyGroups" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NULL,
    "DisplayName_L2" NVARCHAR(442) NULL,
    "DisplayName_L3" NVARCHAR(442) NULL,
    "DisplayName_L4" NVARCHAR(442) NULL,
    "DisplayName_L5" NVARCHAR(442) NULL,
    "DisplayName_L6" NVARCHAR(442) NULL,
    "DisplayName_L7" NVARCHAR(442) NULL,
    "DisplayName_L8" NVARCHAR(442) NULL,
    "DisplayName_L9" NVARCHAR(442) NULL,
    "DisplayName_L10" NVARCHAR(442) NULL,
    "DisplayName_L11" NVARCHAR(442) NULL,
    "DisplayName_L12" NVARCHAR(442) NULL,
    "DisplayName_L13" NVARCHAR(442) NULL,
    "DisplayName_L14" NVARCHAR(442) NULL,
    "DisplayName_L15" NVARCHAR(442) NULL,
    "DisplayName_L16" NVARCHAR(442) NULL,
    CONSTRAINT "PK_DisplayPropertyGroups" PRIMARY KEY CLUSTERED ("Id" ASC),
);
    ALTER TABLE "UI_DisplayEntityProperties" ADD "Group_Id" BIGINT NULL  CONSTRAINT "FK_DisplayEntityProperties_Group" FOREIGN KEY ("Group_Id") REFERENCES "UI_DisplayPropertyGroups" ("Id");
END
GO
