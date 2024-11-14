CREATE TABLE "UA_AccessControlPermissions" (
    "Id" BIGINT NOT NULL,
    "BlockInheritance" BIT CONSTRAINT "DF_Containers_BlockInheritance" DEFAULT ((0)) NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    CONSTRAINT "PK_AccessControlPermissions" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_AccessControlPermissions_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UA_AccessControlPropertyGroups" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_AccessControlPropertyGroups" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_AccessControlPropertyGroups_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UA_InvalidTokens" (
    "Guid" VARCHAR(36) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Token" NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "ExpireDate" SMALLDATETIME NOT NULL,
    CONSTRAINT "PK_InvalidTokens" PRIMARY KEY ("Guid"),
);


   GO
   CREATE TABLE "UA_Profiles" (
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
    "IsComponent" BIT CONSTRAINT "DF_Profiles_IsComponent" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_Profiles" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_Profiles_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UC_Agents" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "State" INT CONSTRAINT "DF_Agents_State" DEFAULT ((0)) NOT NULL,
    "URI" NVARCHAR(442) NULL,
    CONSTRAINT "PK_Agents" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_Agents_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UC_ConnectionPackages" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "ImplementsEntityTypeMapping" BIT CONSTRAINT "DF_ConnectionPackages_ImplementsEntityTypeMapping" DEFAULT ((0)) NOT NULL,
    "ImplementsResourceTypeMapping" BIT CONSTRAINT "DF_ConnectionPackages_ImplementsResourceTypeMapping" DEFAULT ((0)) NOT NULL,
    "ImplementsConfiguration" BIT CONSTRAINT "DF_ConnectionPackages_ImplementsConfiguration" DEFAULT ((0)) NOT NULL,
    "HasIncrementalMode" BIT CONSTRAINT "DF_ConnectionPackages_HasIncrementalMode" DEFAULT ((0)) NOT NULL,
    "ExportType" INT CONSTRAINT "DF_ConnectionPackages_ExportType" DEFAULT ((0)) NOT NULL,
    "FulfillmentType" INT CONSTRAINT "DF_ConnectionPackages_FulfillmentType" DEFAULT ((0)) NOT NULL,
    "InducedFulfillment" INT CONSTRAINT "DF_ConnectionPackages_InducedFulfillment" DEFAULT ((0)) NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "Description_L1" NVARCHAR(442) NULL,
    "Description_L2" NVARCHAR(442) NULL,
    "Description_L3" NVARCHAR(442) NULL,
    "Description_L4" NVARCHAR(442) NULL,
    "Description_L5" NVARCHAR(442) NULL,
    "Description_L6" NVARCHAR(442) NULL,
    "Description_L7" NVARCHAR(442) NULL,
    "Description_L8" NVARCHAR(442) NULL,
    "Description_L9" NVARCHAR(442) NULL,
    "Description_L10" NVARCHAR(442) NULL,
    "Description_L11" NVARCHAR(442) NULL,
    "Description_L12" NVARCHAR(442) NULL,
    "Description_L13" NVARCHAR(442) NULL,
    "Description_L14" NVARCHAR(442) NULL,
    "Description_L15" NVARCHAR(442) NULL,
    "Description_L16" NVARCHAR(442) NULL,
    "Keywords" NVARCHAR(442) NULL,
    "Publisher" NVARCHAR(442) NULL,
    "LogoUrl" NVARCHAR(4000) NULL,
    "WebsiteUrl" NVARCHAR(442) NULL,
    "DocumentationUrl" NVARCHAR(442) NULL,
    "License" NVARCHAR(442) NULL,
    CONSTRAINT "PK_ConnectionPackges" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_ConnectionPackages_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UD_ConfigurationDLLs"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Type" INT NOT NULL,
    "Data" VARBINARY(MAX) NULL,
    CONSTRAINT "PK_ConfigurationDLLs" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_ConfigurationDLLs_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UD_ConfigurationFiles"
(
    "Id" BIGINT NOT NULL,
    "FilePath" NVARCHAR(442) NULL,
    CONSTRAINT "PK_ConfigurationFiles" PRIMARY KEY CLUSTERED ("Id" ASC)
);

   GO
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
GO

   GO
   CREATE TABLE "UI_DisplayTableDesignElements"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_DisplayTableDesignElements" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_DisplayTableDesignElements_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_FormTypes"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    CONSTRAINT "PK_FormTypes" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_FormTypes_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_InputTypes"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    CONSTRAINT "PK_InputTypes" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_InputTypes_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_OutputTypes"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    CONSTRAINT "PK_OutputTypes" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_OutputTypes_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_SearchBarDesignElements"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_SearchBarDesignElements" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_SearchBarDesignElements_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_TileDesignElements"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_TileDesignElements" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_TileDesignElements_Identifier" UNIQUE ("Identifier"),
);

   GO
   IF COL_LENGTH('dbo.UJ_Pendingwork', 'Id') IS NULL
BEGIN
    CREATE TABLE "UJ_PendingWork"
    (
        "Id" BIGINT NOT NULL,
        "State" SMALLINT NOT NULL,
        "LaunchDate" SMALLDATETIME NULL,
        "EstimatedCompletionDate" SMALLDATETIME NULL,
        "ActualCompletionDate" SMALLDATETIME NULL,
        "Payload" NVARCHAR(MAX) NULL,
        "CompletionRedirectUri" NVARCHAR(442) NULL,
        "EventId" BIGINT NULL,
        CONSTRAINT "PK_PendingWork" PRIMARY KEY ("Id" ASC),
    )

      END
   GO
   CREATE TABLE "UM_Bindings"
(
    "Id" BIGINT NOT NULL,
    "Path" NVARCHAR(4000) NULL,
    CONSTRAINT "PK_Bindings" PRIMARY KEY CLUSTERED ("Id" ASC),
);

   GO
   CREATE TABLE "UM_EntityTypes" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_EntityTypes_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_EntityTypes_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
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
    "TableName" NVARCHAR(442) NULL,
    "LicenseTag" VARCHAR(442) NULL,
    "IsRelatedToRules" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToRules" DEFAULT ((0)) NOT NULL,
    "IsRelatedToRoleReview" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToRoleReview" DEFAULT ((0)) NOT NULL,
    "IsRelatedToRoleReconciliation" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToRoleReconciliation" DEFAULT ((0)) NOT NULL,
    "IsRelatedToResourceReview" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToResourceReview" DEFAULT ((0)) NOT NULL,
    "IsRelatedToResourceReconciliation" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToResourceReconciliation" DEFAULT ((0)) NOT NULL,
    "IsRelatedToManualProvisioning" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToManualProvisioning" DEFAULT ((0)) NOT NULL,
    "IsRelatedToWorkflowReview" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToWorkflowReview" DEFAULT ((0)) NOT NULL,
    "IsRelatedToWorkflowSupervision" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToWorkflowSupervision" DEFAULT ((0)) NOT NULL,
    "IsRelatedToAccessCertificationCampaign" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToAccessCertificationCampaign" DEFAULT ((0)) NOT NULL,
    "IsRelatedToIdentifiedRisks" BIT CONSTRAINT "DF_DisplayEntityTypes_IsRelatedToIdentifiedRisks" DEFAULT ((0)) NOT NULL,
    "UnclassifiedCount" INT CONSTRAINT "DF_EntityTypes_UnclassifiedCount" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_EntityTypes" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "U_EntityTypes_Identifier" UNIQUE ("Identifier","ValidTo"),
);
GO
CREATE CLUSTERED INDEX "IX_EntityTypes" ON "UM_EntityTypes" ("ValidTo" ASC, "Id" ASC);

   GO
   CREATE TABLE "UM_Languages"
(
    "Id" BIGINT NOT NULL,
    "Code" NVARCHAR(10) NOT NULL,
    "IndicatorNumber" INT NOT NULL,
    "Translations" NVARCHAR(MAX) NULL,
    "JsonPath" NVARCHAR(442) NULL,
    CONSTRAINT "PK_Languages" PRIMARY KEY CLUSTERED ("Id" ASC)
);

   GO
   CREATE TABLE "UM_Sequences" (
    "Id" BIGINT NOT NULL,
    "Value" BIGINT CONSTRAINT DF_Sequences_Value DEFAULT (0) NOT NULL,
    CONSTRAINT "PK_Sequences" PRIMARY KEY CLUSTERED ("Id" ASC)
);

   GO
   CREATE TABLE "UM_Settings"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Type" INT CONSTRAINT "DF_Settings_Type" DEFAULT((0)) NOT NULL,
    "C0" NVARCHAR(4000) NULL,
    "C1" NVARCHAR(4000) NULL,
    "C2" NVARCHAR(4000) NULL,
    "C3" NVARCHAR(4000) NULL,
    "C4" NVARCHAR(4000) NULL,
    "C5" NVARCHAR(4000) NULL,
    "C6" NVARCHAR(4000) NULL,
    "C7" NVARCHAR(4000) NULL,
    "C8" NVARCHAR(4000) NULL,
    "C9" NVARCHAR(4000) NULL,
    "C10" NVARCHAR(4000) NULL,
    "C11" NVARCHAR(4000) NULL,
    "C12" NVARCHAR(4000) NULL,
    "C13" NVARCHAR(4000) NULL,
    "C14" NVARCHAR(4000) NULL,
    "C15" NVARCHAR(4000) NULL,
    "C16" NVARCHAR(4000) NULL,
    "B0" VARBINARY(MAX) NULL,
    "B1" VARBINARY(MAX) NULL,
    "B2" VARBINARY(MAX) NULL,
    "B3" VARBINARY(MAX) NULL,
    "B4" VARBINARY(MAX) NULL,
    "B5" VARBINARY(MAX) NULL,
    "B6" VARBINARY(MAX) NULL,
    "B7" VARBINARY(MAX) NULL,
    "B8" VARBINARY(MAX) NULL,
    "B9" VARBINARY(MAX) NULL,
    "B10" VARBINARY(MAX) NULL,
    "B11" VARBINARY(MAX) NULL,
    "B12" VARBINARY(MAX) NULL,
    "B13" VARBINARY(MAX) NULL,
    "B14" VARBINARY(MAX) NULL,
    "B15" VARBINARY(MAX) NULL,
    CONSTRAINT "PK_Settings" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_Settings_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UN_NotificationTemplates"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "SubjectTemplate_L1" NVARCHAR(1024) NULL,
    "BodyTemplate_L1" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L2" NVARCHAR(1024) NULL,
    "BodyTemplate_L2" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L3" NVARCHAR(1024) NULL,
    "BodyTemplate_L3" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L4" NVARCHAR(1024) NULL,
    "BodyTemplate_L4" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L5" NVARCHAR(1024) NULL,
    "BodyTemplate_L5" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L6" NVARCHAR(1024) NULL,
    "BodyTemplate_L6" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L7" NVARCHAR(1024) NULL,
    "BodyTemplate_L7" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L8" NVARCHAR(1024) NULL,
    "BodyTemplate_L8" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L9" NVARCHAR(1024) NULL,
    "BodyTemplate_L9" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L10" NVARCHAR(1024) NULL,
    "BodyTemplate_L10" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L11" NVARCHAR(1024) NULL,
    "BodyTemplate_L11" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L12" NVARCHAR(1024) NULL,
    "BodyTemplate_L12" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L13" NVARCHAR(1024) NULL,
    "BodyTemplate_L13" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L14" NVARCHAR(1024) NULL,
    "BodyTemplate_L14" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L15" NVARCHAR(1024) NULL,
    "BodyTemplate_L15" NVARCHAR(MAX) NULL,
    "SubjectTemplate_L16" NVARCHAR(1024) NULL,
    "BodyTemplate_L16" NVARCHAR(MAX) NULL,
    CONSTRAINT "PK_NotificationTemplates" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_NotificationTemplates_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UP_Contexts" (
    "Id" BIGINT NOT NULL,
    "Automatic" BIT CONSTRAINT "DF_Contexts_Automatic" DEFAULT ((0)) NOT NULL,
    "DisplayName_L1" NVARCHAR(4000) NULL,
    "DisplayName_L2" NVARCHAR(4000) NULL,
    "DisplayName_L3" NVARCHAR(4000) NULL,
    "DisplayName_L4" NVARCHAR(4000) NULL,
    "DisplayName_L5" NVARCHAR(4000) NULL,
    "DisplayName_L6" NVARCHAR(4000) NULL,
    "DisplayName_L7" NVARCHAR(4000) NULL,
    "DisplayName_L8" NVARCHAR(4000) NULL,
    "DisplayName_L9" NVARCHAR(4000) NULL,
    "DisplayName_L10" NVARCHAR(4000) NULL,
    "DisplayName_L11" NVARCHAR(4000) NULL,
    "DisplayName_L12" NVARCHAR(4000) NULL,
    "DisplayName_L13" NVARCHAR(4000) NULL,
    "DisplayName_L14" NVARCHAR(4000) NULL,
    "DisplayName_L15" NVARCHAR(4000) NULL,
    "DisplayName_L16" NVARCHAR(4000) NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    CONSTRAINT "PK_Contexts" PRIMARY KEY CLUSTERED ("Id" ASC),
);

   GO
   CREATE TABLE "UP_Policies" (
    "Id" BIGINT NOT NULL,
    "IsProvisioningEnabled" BIT CONSTRAINT "DF_Policies_IsProvisioningEnabled" DEFAULT ((0)) NOT NULL,
    "IsSimulationEnabled" BIT CONSTRAINT "DF_Policies_IsSimumationEnabled" DEFAULT ((0)) NOT NULL,
    "IsExternal" BIT CONSTRAINT "DF_Policies_IsExternal" DEFAULT ((0)) NOT NULL,
    "HasImplicitApproval" BIT CONSTRAINT "DF_Policies_HasImplicitApproval" DEFAULT ((0)) NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_Policies_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_Policies_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_Policies_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnApproveInReview" TINYINT CONSTRAINT "DF_Policies_CommentActivationOnApproveInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeclineInReview" TINYINT CONSTRAINT "DF_Policies_CommentActivationOnDeclineInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeleteGapInReconciliation" TINYINT CONSTRAINT "DF_Policies_CommentActivationOnDeleteGapInReconciliation" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnKeepGapInReconciliation" TINYINT CONSTRAINT "DF_Policies_CommentActivationOnKeepGapInReconciliation" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "PolicyProvisioning_Id" BIGINT NULL,
    "PolicySimulation_Id" BIGINT NULL,
    "MaxDuration" INT CONSTRAINT "DF_Policies_MaxDuration" DEFAULT ((0)) NOT NULL,
    "GracePeriod" INT CONSTRAINT "DF_Policies_GracePeriod" DEFAULT ((0)) NOT NULL,
    "ProlongationWithoutApproval" BIT CONSTRAINT "DF_Policies_ProlongationWithoutApproval" DEFAULT ((0)) NOT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    CONSTRAINT "PK_Policies" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "U_Policies_Identifier" UNIQUE ("Identifier","ValidTo"),
);
GO
CREATE CLUSTERED INDEX "IX_Policies" ON "UP_Policies" ("ValidTo" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_ResourceCorrelationKeys" (
    "Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "BindingExpressionHash" INT NOT NULL,
    "Resource_Id" BIGINT NOT NULL,
    "Value" NVARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    CONSTRAINT "PK_ResourceCorrelationKeys" PRIMARY KEY CLUSTERED ("EntityType_Id" ASC, "BindingExpressionHash" ASC, "Value" ASC, "Resource_Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)
);
GO
CREATE NONCLUSTERED INDEX "IX_ResourceCorrelationKeys"
    ON "UP_ResourceCorrelationKeys" ("EntityType_Id" ASC, "Resource_Id" ASC) INCLUDE ("BindingExpressionHash", "Value", "Id") WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE STATISTICS "S_ResourceCorrelationKeys_BindingExpressionHash" ON "UP_ResourceCorrelationKeys"("BindingExpressionHash")  WITH FULLSCAN;

   GO
   CREATE TABLE "UP_ResourceRiskScores" (
    "Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_ResourceRiskScores_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_ResourceRiskScores_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "Score" INT NOT NULL,
    "Rating" INT NOT NULL,
    CONSTRAINT "PK_ResourceRiskScores" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "CK_ResourceRiskScores" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)
);
GO
CREATE STATISTICS "S_ResourceRiskScores_Type" ON "UP_ResourceRiskScores"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;

   GO
   CREATE TABLE "UP_WorkflowStates" (
    "Id" TINYINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_WorkflowStates" PRIMARY KEY CLUSTERED ("Id" ASC)
);

   GO
   CREATE TABLE "UR_ResourceFileChanges"
(
    "JobInstance_Id" BIGINT NOT NULL,
    "ChangeOperation" INT NOT NULL,
    "ResourceFile_Id" BIGINT NOT NULL,
    "Resource_Id" BIGINT NULL,
    "Resource_PK" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NULL,
    "Property_Id" BIGINT NOT NULL,
    "Data" VARBINARY(MAX) NULL,    
    "DataHash" INT NULL,
    "ValidFrom" DATETIME2(2) NULL,
    "ValidTo" DATETIME2(2) NULL,
);

GO
CREATE CLUSTERED INDEX "IX_ResourceFileChanges"
    ON "UR_ResourceFileChanges"("JobInstance_Id" ASC, "Property_Id" ASC, "Resource_PK" ASC);

   GO
   CREATE TABLE "UR_ResourceLinkChanges"
(
    "JobInstance_Id" BIGINT NOT NULL,
    "ChangeOperation" INT NOT NULL,
    "R1_Id" BIGINT NULL,
    "R2_Id" BIGINT NULL,
    "Type" BIGINT NOT NULL,
    "ValidFrom" DATETIME2(2) NULL,
    "ValidTo" DATETIME2(2) NULL,
    "R1_PK" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NULL,
    "R2_PK" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NULL,
);

GO
CREATE CLUSTERED INDEX "IX_ResourceLinkChanges"
    ON "UR_ResourceLinkChanges"("JobInstance_Id" ASC, "Type" ASC);

   GO
   CREATE TABLE "US_AccessCertificationCampaignPolicies"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_AccessCertificationCampaignPolicies" PRIMARY KEY ("Id" ASC),
);

   GO
   CREATE TABLE "UT_AssignedTinyInts" (
    [AssignedResourceType_Id] [bigint] NOT NULL,
    [OwnerType] [bigint] NULL,
    [Owner_Id] [bigint] NULL,
    [Value] [tinyint] NOT NULL,
    CONSTRAINT [CK_AssignedTinyInts] UNIQUE CLUSTERED
        (
            [OwnerType] ASC,
            [Owner_Id] ASC,
            [AssignedResourceType_Id] ASC
        )
);

   GO
   CREATE TABLE "UT_BigInts" (
    "Id" BIGINT NOT NULL,
    "Value" BIGINT,
);

   GO
   CREATE TABLE "UT_BigIntsValue" (
    "Id" BIGINT NOT NULL,
    "Value" BIGINT,
    "IntValue" INT,
);

   GO
   CREATE TABLE "UT_BinNvarChar" (
    "Id" BIGINT NOT NULL,
    "PrimaryKey" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NOT NULL,
    "Value" NVARCHAR(4000) COLLATE Latin1_General_BIN2,
);

   GO
   CREATE TABLE "UT_Bits" (
    "Id" BIGINT NOT NULL,
    "Value" BIT,
);

   GO
   CREATE TABLE "UT_BulkAssignedResourceBinaries" (
    "Id" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceBinaries
    "OwnerType" BIGINT NOT NULL
);

   GO
   CREATE TABLE "UT_BulkAssignedResourceNavigations" (
    "Id" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceNavigations
    "OwnerType" BIGINT NOT NULL
);

   GO
   CREATE TABLE "UT_BulkAssignedResourceScalars" (
    "Id" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceScalars
    "OwnerType" BIGINT NOT NULL
);

   GO
   CREATE TABLE "UT_BulkAssignedResourceTypes" (
    "Id" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL, -- Same as in UP_AssignedResourceTypes
    "OwnerType" BIGINT NOT NULL
);

   GO
   CREATE TABLE "UT_BulkDirtyOwners" (
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NOT NULL,
    "PendingWork_Id" BIGINT NOT NULL,
    "BulkDate" DATETIME2(2) CONSTRAINT "DF_BulkDirtyOwners_BulkDate" DEFAULT GETUTCDATE() NOT NULL,
    CONSTRAINT "PK_BulkDirtyOwners" UNIQUE CLUSTERED ("PendingWork_Id" ASC, "BulkDate" ASC, "OwnerType" ASC, "Owner_Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
);

   GO
   CREATE TABLE "UT_ConsolidateProvisioningState" (
    "Id" BIGINT NOT NULL,
    "Value" TINYINT NOT NULL,
);

   GO
   CREATE TABLE "UT_InsertResourceLinks" (
    "ChangeOperation" INT,
    "R1_Identifier" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NOT NULL,
    "R2_Identifier" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NOT NULL,
);

   GO
   CREATE TABLE "UT_Ints" (
    "Id" BIGINT NOT NULL,
    "Value" INT,
);

   GO
   CREATE TABLE "UT_NotificationInstances" (
    "Notification_Id" BIGINT NOT NULL,
    "OwnerResource_Id" BIGINT NOT NULL,
    "LastExecutionDate" DateTime,
);

   GO
   CREATE TABLE "UT_NvarChar" (
    "Id" BIGINT NOT NULL,
    "Value" NVARCHAR(4000),
);

   GO
   CREATE TABLE "UT_OnlyId" (
    "Id" BIGINT NOT NULL,
);

   GO
   CREATE TABLE "UT_OnlyNVarchar" (
    "Value" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NOT NULL,
);

   GO
   CREATE TABLE "UT_ResourceCorrelationKeys"
(
    "EntityType_Id" BIGINT NOT NULL,
    "BindingExpressionHash" INT NOT NULL,
    "Resource_Id" BIGINT NOT NULL,
    "Value" NVARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "NewValue" NVARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    CONSTRAINT "PK_TmpResourceCorrelationKeys" PRIMARY KEY CLUSTERED ("EntityType_Id" ASC, "BindingExpressionHash" ASC, "Value" ASC, "Resource_Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)
);

   GO
   CREATE TABLE "UT_ResourceFiles" (
    "ChangeOperation" INT,
    "Id" BIGINT NOT NULL,
    "Identifier" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NOT NULL,
    "Data" VARBINARY(max),
    "DataHash" INT,
);

   GO
   CREATE TABLE "UT_ResourceLinks" (
    "R1_Id" BIGINT NOT NULL,
    "R2_Id" BIGINT NOT NULL,
    "Type" BIGINT,
);

   GO
   CREATE TABLE "UT_ResourceMonovaluedChanges" (
    "Id" BIGINT NOT NULL,
    "Type" BIGINT NOT NULL,
    "Value" BIGINT,
);

   GO
   CREATE TABLE "UT_ResourceNvarChar" (
    "Id" BIGINT NOT NULL,
    "PrimaryKey" NVARCHAR(4000) COLLATE Latin1_General_BIN2 NOT NULL,  
    "Value" NVARCHAR(4000),
);

   GO
   CREATE TABLE "UT_ResourceOrphans" (
    "Type" BIGINT NULL,
    "R1_Identifier" NVARCHAR(4000) NOT NULL,
    "R2_Identifier" NVARCHAR(4000) NOT NULL,
);

   GO
   CREATE TABLE "UT_ResourceRiskScores" (
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NOT NULL,
    "Score" INT NOT NULL,
    "Rating" INT NOT NULL,
    "NewRating" INT NOT NULL,
    CONSTRAINT "PK_TmpResourceRiskScores" PRIMARY KEY CLUSTERED ("OwnerType" ASC, "Score" ASC, "Rating" ASC, "Owner_Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)
);

   GO
   CREATE TABLE "UT_Resources" (
    "Id" BIGINT NOT NULL,
    "Type" BIGINT NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NULL,
    "ValidTo" DATETIME2(2) NOT NULL,
    "PrimaryKey" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U0" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U1" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U2" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "C0" NVARCHAR(4000) NULL,
    "C1" NVARCHAR(4000) NULL,
    "C2" NVARCHAR(4000) NULL,
    "C3" NVARCHAR(4000) NULL,
    "C4" NVARCHAR(442) NULL,
    "C5" NVARCHAR(442) NULL,
    "C6" NVARCHAR(442) NULL,
    "C7" NVARCHAR(442) NULL,
    "C8" NVARCHAR(442) NULL,
    "C9" NVARCHAR(442) NULL,
    "CA" NVARCHAR(442) NULL,
    "CB" NVARCHAR(442) NULL,
    "CC" NVARCHAR(442) NULL,
    "CD" NVARCHAR(442) NULL,
    "CE" NVARCHAR(442) NULL,
    "DisplayName_L2" NVARCHAR(442) NULL,
    "I40" BIGINT NULL,
    "I41" BIGINT NULL,
    "I42" BIGINT NULL,
    "I43" BIGINT NULL,
    "I44" BIGINT NULL,
    "CF" NVARCHAR(442) NULL,
    "CG" NVARCHAR(442) NULL,
    "CH" NVARCHAR(442) NULL,
    "CI" NVARCHAR(442) NULL,
    "CJ" NVARCHAR(442) NULL,
    "CK" NVARCHAR(442) NULL,
    "CL" NVARCHAR(442) NULL,
    "CM" NVARCHAR(442) NULL,
    "CN" NVARCHAR(442) NULL,
    "CO" NVARCHAR(442) NULL,
    "CP" NVARCHAR(442) NULL,
    "CQ" NVARCHAR(442) NULL,
    "CR" NVARCHAR(442) NULL,
    "CS" NVARCHAR(442) NULL,
    "CT" NVARCHAR(442) NULL,
    "DisplayName_L3" NVARCHAR(442) NULL,
    "I45" BIGINT NULL,
    "I46" BIGINT NULL,
    "I47" BIGINT NULL,
    "I48" BIGINT NULL,
    "I49" BIGINT NULL,
    "CU" NVARCHAR(442) NULL,
    "CV" NVARCHAR(442) NULL,
    "C10" NVARCHAR(442) NULL,
    "C11" NVARCHAR(442) NULL,
    "C12" NVARCHAR(442) NULL,
    "C13" NVARCHAR(442) NULL,
    "C14" NVARCHAR(442) NULL,
    "C15" NVARCHAR(442) NULL,
    "C16" NVARCHAR(442) NULL,
    "C17" NVARCHAR(442) NULL,
    "C18" NVARCHAR(442) NULL,
    "C19" NVARCHAR(442) NULL,
    "C1A" NVARCHAR(442) NULL,
    "C1B" NVARCHAR(442) NULL,
    "C1C" NVARCHAR(442) NULL,
    "DisplayName_L4" NVARCHAR(442) NULL,
    "I4A" BIGINT NULL,
    "I4B" BIGINT NULL,
    "I4C" BIGINT NULL,
    "I4D" BIGINT NULL,
    "I4E" BIGINT NULL,
    "C1D" NVARCHAR(442) NULL,
    "C1E" NVARCHAR(442) NULL,
    "C1F" NVARCHAR(442) NULL,
    "C1G" NVARCHAR(442) NULL,
    "C1H" NVARCHAR(442) NULL,
    "C1I" NVARCHAR(442) NULL,
    "C1J" NVARCHAR(442) NULL,
    "C1K" NVARCHAR(442) NULL,
    "C1L" NVARCHAR(442) NULL,
    "C1M" NVARCHAR(442) NULL,
    "C1N" NVARCHAR(442) NULL,
    "C1O" NVARCHAR(442) NULL,
    "C1P" NVARCHAR(442) NULL,
    "C1Q" NVARCHAR(442) NULL,
    "C1R" NVARCHAR(442) NULL,
    "DisplayName_L5" NVARCHAR(442) NULL,
    "I4F" BIGINT NULL,
    "I4G" BIGINT NULL,
    "I4H" BIGINT NULL,
    "I4I" BIGINT NULL,
    "C1S" NVARCHAR(442) NULL,
    "C1T" NVARCHAR(442) NULL,
    "C1U" NVARCHAR(442) NULL,
    "C1V" NVARCHAR(442) NULL,
    "C20" NVARCHAR(442) NULL,
    "C21" NVARCHAR(442) NULL,
    "C22" NVARCHAR(442) NULL,
    "C23" NVARCHAR(442) NULL,
    "C24" NVARCHAR(442) NULL,
    "C25" NVARCHAR(442) NULL,
    "C26" NVARCHAR(442) NULL,
    "C27" NVARCHAR(442) NULL,
    "C28" NVARCHAR(442) NULL,
    "C29" NVARCHAR(442) NULL,
    "C2A" NVARCHAR(442) NULL,
    "DisplayName_L6" NVARCHAR(442) NULL,
    "I4J" BIGINT NULL,
    "I4K" BIGINT NULL,
    "I4L" BIGINT NULL,
    "C2B" NVARCHAR(442) NULL,
    "C2C" NVARCHAR(442) NULL,
    "C2D" NVARCHAR(442) NULL,
    "C2E" NVARCHAR(442) NULL,
    "C2F" NVARCHAR(442) NULL,
    "C2G" NVARCHAR(442) NULL,
    "C2H" NVARCHAR(442) NULL,
    "C2I" NVARCHAR(442) NULL,
    "C2J" NVARCHAR(442) NULL,
    "C2K" NVARCHAR(442) NULL,
    "C2L" NVARCHAR(442) NULL,
    "C2M" NVARCHAR(442) NULL,
    "C2N" NVARCHAR(442) NULL,
    "DisplayName_L7" NVARCHAR(442) NULL,
    "I4M" BIGINT NULL,
    "I4N" BIGINT NULL,
    "C2O" NVARCHAR(442) NULL,
    "C2P" NVARCHAR(442) NULL,
    "C2Q" NVARCHAR(442) NULL,
    "C2R" NVARCHAR(442) NULL,
    "C2S" NVARCHAR(442) NULL,
    "C2T" NVARCHAR(442) NULL,
    "C2U" NVARCHAR(442) NULL,
    "C2V" NVARCHAR(442) NULL,
    "C30" NVARCHAR(442) NULL,
    "C31" NVARCHAR(442) NULL,
    "C32" NVARCHAR(442) NULL,
    "C33" NVARCHAR(442) NULL,
    "C34" NVARCHAR(442) NULL,
    "C35" NVARCHAR(442) NULL,
    "C36" NVARCHAR(442) NULL,
    "DisplayName_L8" NVARCHAR(442) NULL,
    "I4O" BIGINT NULL,
    "C37" NVARCHAR(442) NULL,
    "C38" NVARCHAR(442) NULL,
    "C39" NVARCHAR(442) NULL,
    "C3A" NVARCHAR(442) NULL,
    "C3B" NVARCHAR(442) NULL,
    "C3C" NVARCHAR(442) NULL,
    "C3D" NVARCHAR(442) NULL,
    "C3E" NVARCHAR(442) NULL,
    "C3F" NVARCHAR(442) NULL,
    "C3G" NVARCHAR(442) NULL,
    "C3H" NVARCHAR(442) NULL,
    "C3I" NVARCHAR(442) NULL,
    "C3J" NVARCHAR(442) NULL,
    "C3K" NVARCHAR(442) NULL,
    "C3L" NVARCHAR(442) NULL,
    "C3M" NVARCHAR(442) NULL,
    "C3N" NVARCHAR(442) NULL,
    "C3O" NVARCHAR(442) NULL,
    "C3P" NVARCHAR(442) NULL,
    "C3Q" NVARCHAR(442) NULL,
    "C3R" NVARCHAR(442) NULL,
    "C3S" NVARCHAR(442) NULL,
    "C3T" NVARCHAR(442) NULL,
    "C3U" NVARCHAR(442) NULL,
    "C3V" NVARCHAR(442) NULL,
    "DisplayName_L9" NVARCHAR(442) NULL,
    "DisplayName_L10" NVARCHAR(442) NULL,
    "DisplayName_L11" NVARCHAR(442) NULL,
    "DisplayName_L12" NVARCHAR(442) NULL,
    "DisplayName_L13" NVARCHAR(442) NULL,
    "DisplayName_L14" NVARCHAR(442) NULL,
    "DisplayName_L15" NVARCHAR(442) NULL,
    "DisplayName_L16" NVARCHAR(442) NULL,
);

   GO
   CREATE TABLE "UT_ResourceScalarChanges" (
    "Id" BIGINT NOT NULL,
    "Type" BIGINT NOT NULL,
    "Value" NVARCHAR(4000),
);

   GO
   CREATE TABLE "UT_ReviewerIdComments" (
    "Id" BIGINT NOT NULL,
    "ReviewerId" BIGINT NULL,
    "Comment" NVARCHAR(442) NULL,
);

   GO
   CREATE TABLE "UT_SmallDateTimes" (
    "Id" BIGINT NOT NULL,
    "Value" SMALLDATETIME,
);

   GO
   CREATE TABLE "UT_SmallInts" (
    "Id" BIGINT NOT NULL,
    "Value" SMALLINT,
);

   GO
   CREATE TABLE "UT_TempNavigations" (
    "Id" BIGINT NULL,
);

   GO
   CREATE TABLE "UT_TempOwner" (
    "Owner_Id" BIGINT NULL,
);

   GO
   CREATE TABLE "UT_TempSacalars" (
    "Id" BIGINT NULL,
);

   GO
   CREATE TABLE "UT_TempTaskJobInstances"
(
    "Id" BIGINT NOT NULL,
    CONSTRAINT "PK_TempJobTaskInstances" PRIMARY KEY ("Id" ASC)
);

   GO
   CREATE TABLE "UT_TempTypes" (
    "Id" BIGINT NULL,
);

   GO
   CREATE TABLE "UT_TinyInts" (
    "Id" BIGINT NOT NULL,
    "Value" TINYINT,
);

   GO
   CREATE TABLE "UU_Universes"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "IsHistoryDisabled" BIT CONSTRAINT "DF_Universes_IsHistoryDisabled" DEFAULT ((0)) NOT NULL,
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
    "ColumnNamesMode" TINYINT CONSTRAINT "DF_Universes_ColumnNamesMode" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_Universes" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_Universes_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UW_ActivityTemplates" (
    "Id" BIGINT NOT NULL,
    "FirstState_Id" BIGINT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_ActivityTemplates" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_ActivityTemplates_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UA_AccessControlRules" (
    "Id" BIGINT NOT NULL,
    "Profile_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_AccessControlRules" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AccessControlRules_Profile" FOREIGN KEY ("Profile_Id") REFERENCES "UA_Profiles" ("Id"),
    CONSTRAINT "FK_AccessControlRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "U_AccessControlRules_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UC_Connectors" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Agent_Id" BIGINT NULL,
    "CompleteJob" TINYINT CONSTRAINT "DF_Connectors_CompleteJob" DEFAULT ((0)) NOT NULL,
    "IncrementalJob" TINYINT CONSTRAINT "DF_Connectors_IncrementalJob" DEFAULT ((0)) NOT NULL,
    "MaximumInsertedLines" INT CONSTRAINT "DF_Connectors_MaximumInsertedLines" DEFAULT ((100)) NOT NULL,
    "MaximumDeletedLines" INT CONSTRAINT "DF_Connectors_MaximumDeletedLines" DEFAULT ((100)) NOT NULL,
    "MaximumUpdatedLines" INT CONSTRAINT "DF_Connectors_MaximumUpdatedLines" DEFAULT ((100)) NOT NULL,
    "MaxPercentageInsertedLines" INT CONSTRAINT "DF_Connectors_MaxPercentageInsertedLines" DEFAULT ((5)) NOT NULL,
    "MaxPercentageDeletedLines" INT CONSTRAINT "DF_Connectors_MaxPercentageDeletedLines" DEFAULT ((5)) NOT NULL,
    "MaxPercentageUpdatedLines" INT CONSTRAINT "DF_Connectors_MaxPercentageUpdatedLines" DEFAULT ((5)) NOT NULL,
    "MaximumLinkInsertedLines" INT CONSTRAINT "DF_Connectors_MaximumLinkInsertedLines" DEFAULT ((1000)) NOT NULL,
    "MaximumLinkDeletedLines" INT CONSTRAINT "DF_Connectors_MaximumLinkDeletedLines" DEFAULT ((1000)) NOT NULL,
    "MaxLinkPercentageInsertedLines" INT CONSTRAINT "DF_Connectors_MaxLinkPercentageInsertedLines" DEFAULT ((5)) NOT NULL,
    "MaxLinkPercentageDeletedLines" INT CONSTRAINT "DF_Connectors_MaxLinkPercentageDeletedLines" DEFAULT ((5)) NOT NULL,
    "IsDeactivated" BIT CONSTRAINT "DF_Connectors_IsDeactivated" DEFAULT ((0)) NOT NULL,
    "IsSynchronizationBlocked" BIT CONSTRAINT "DF_Connectors_IsSynchronizationBlocked" DEFAULT ((0)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_Connectors" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_Connectors_Identifier" UNIQUE ("Identifier"),
    CONSTRAINT "FK_Connectors_Agent" FOREIGN KEY ("Agent_Id") REFERENCES "UC_Agents" ("Id"),
);

   GO
   CREATE TABLE "UC_PasswordResetSettings" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Mode" BIGINT CONSTRAINT "DF_PasswordResetSettings_Mode" DEFAULT ((0)) NOT NULL,
    "MustChange" BIT CONSTRAINT "DF_PasswordResetSettings_MustChange" DEFAULT ((0)) NOT NULL,
    "AutoGenerate" BIT CONSTRAINT "DF_PasswordResetSettings_AutoGenerate" DEFAULT ((0)) NOT NULL,
    "DisableNotifications" BIT CONSTRAINT "DF_PasswordResetSettings_DisableNotifications" DEFAULT ((0)) NOT NULL,
    "GeneratedLength" INT CONSTRAINT "DF_PasswordResetSettings_GeneratedLength" DEFAULT ((12)) NOT NULL,
    "NotifiedFullNameBinding_Id" BIGINT NULL,
    "NotifiedEmailBinding_Id" BIGINT NULL,
    "BeneficiaryFullNameBinding_Id" BIGINT NULL,
    "BeneficiaryEmailBinding_Id" BIGINT NULL,
    "DefaultPassword" NVARCHAR(32) NULL,
    "StrengthCheck" NVARCHAR(128) NULL,
    "NotificationCC" NVARCHAR(256) NULL,
    "GeneratedLowerCaseCharsCount" INT CONSTRAINT "DF_PasswordResetSettings_GeneratedLowerCaseCharsCount" DEFAULT ((6)) NOT NULL, 
    "GeneratedUpperCaseCharsCount" INT CONSTRAINT "DF_PasswordResetSettings_GeneratedUpperCaseCharsCount" DEFAULT ((2)) NOT NULL, 
    "GeneratedSymbolCharsCount" INT CONSTRAINT "DF_PasswordResetSettings_GeneratedSymbolCharsCount" DEFAULT ((2)) NOT NULL, 
    "GeneratedDigitCharsCount" INT CONSTRAINT "DF_PasswordResetSettingsGeneratedDigitCharsCount" DEFAULT ((2)) NOT NULL, 
    CONSTRAINT "PK_PasswordResetSettings" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_PasswordResetSettings_Identifier" UNIQUE ("Identifier"),
    CONSTRAINT "FK_PasswordResetSettings_NotifiedFullNameBinding" FOREIGN KEY ("NotifiedFullNameBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_PasswordResetSettings_NotifiedEmailBinding" FOREIGN KEY ("NotifiedEmailBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_PasswordResetSettings_BeneficiaryFullNameBinding" FOREIGN KEY ("BeneficiaryFullNameBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_PasswordResetSettings_BeneficiaryEmailBinding" FOREIGN KEY ("BeneficiaryEmailBinding_Id") REFERENCES "UM_Bindings" ("Id"),
);

   GO
   CREATE TABLE "UD_ConfigurationFileItems"
(
"File_Id" BIGINT NOT NULL,
"Item_Id" BIGINT NOT NULL,
"TableName" VARCHAR(64) NOT NULL,
"Scaffolding_Id" BIGINT CONSTRAINT "DF_ConfigurationFileItems_Scaffolding" DEFAULT ((0)) NOT NULL,
"LineNumber" INT CONSTRAINT "DF_ConfigurationFileItems_LineNumber" DEFAULT ((0)) NOT NULL,
"ConsolidationMode" INT CONSTRAINT "DF_ConfigurationFileItems_ConsolidationMode" DEFAULT ((0)) NOT NULL,
"IsManualUpdate" BIT CONSTRAINT "DF_ConfigurationFileItems_IsManualUpdate" DEFAULT ((0)) NOT NULL,
CONSTRAINT "PK_ConfigurationFileItems" PRIMARY KEY CLUSTERED ("TableName","Item_Id","File_Id","Scaffolding_Id", "LineNumber" ASC),
CONSTRAINT "FK_ConfigurationFileItems_File" FOREIGN KEY ("File_Id") REFERENCES "UD_ConfigurationFiles" ("Id"),
);

   GO
   CREATE TABLE "UI_DisplayEntityTypes"
(
    "Id" BIGINT NOT NULL,
    "IsHierarchical" BIT CONSTRAINT "DF_DisplayEntityTypes_IsHierarchical" DEFAULT ((0)) NOT NULL,
    "D0IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D0" DEFAULT ((0)) NOT NULL,
    "D1IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1" DEFAULT ((0)) NOT NULL,
    "D2IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2" DEFAULT ((0)) NOT NULL,
    "D3IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3" DEFAULT ((0)) NOT NULL,
    "D4IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D4" DEFAULT ((0)) NOT NULL,
    "D5IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D5" DEFAULT ((0)) NOT NULL,
    "D6IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D6" DEFAULT ((0)) NOT NULL,
    "D7IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D7" DEFAULT ((0)) NOT NULL,
    "D8IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D8" DEFAULT ((0)) NOT NULL,
    "D9IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D9" DEFAULT ((0)) NOT NULL,
    "DAIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DA" DEFAULT ((0)) NOT NULL,
    "DBIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DB" DEFAULT ((0)) NOT NULL,
    "DCIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DC" DEFAULT ((0)) NOT NULL,
    "DDIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DD" DEFAULT ((0)) NOT NULL,
    "DEIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DE" DEFAULT ((0)) NOT NULL,
    "DFIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DF" DEFAULT ((0)) NOT NULL,
    "DGIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DG" DEFAULT ((0)) NOT NULL,
    "DHIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DH" DEFAULT ((0)) NOT NULL,
    "DIIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DI" DEFAULT ((0)) NOT NULL,
    "DJIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DJ" DEFAULT ((0)) NOT NULL,
    "DKIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DK" DEFAULT ((0)) NOT NULL,
    "DLIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DL" DEFAULT ((0)) NOT NULL,
    "DMIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DM" DEFAULT ((0)) NOT NULL,
    "DNIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DN" DEFAULT ((0)) NOT NULL,
    "DOIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DO" DEFAULT ((0)) NOT NULL,
    "DPIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DP" DEFAULT ((0)) NOT NULL,
    "DQIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DQ" DEFAULT ((0)) NOT NULL,
    "DRIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DR" DEFAULT ((0)) NOT NULL,
    "DSIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DS" DEFAULT ((0)) NOT NULL,
    "DTIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DT" DEFAULT ((0)) NOT NULL,
    "DUIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DU" DEFAULT ((0)) NOT NULL,
    "DVIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_DV" DEFAULT ((0)) NOT NULL,
    "D10IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D10" DEFAULT ((0)) NOT NULL,
    "D11IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D11" DEFAULT ((0)) NOT NULL,
    "D12IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D12" DEFAULT ((0)) NOT NULL,
    "D13IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D13" DEFAULT ((0)) NOT NULL,
    "D14IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D14" DEFAULT ((0)) NOT NULL,
    "D15IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D15" DEFAULT ((0)) NOT NULL,
    "D16IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D16" DEFAULT ((0)) NOT NULL,
    "D17IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D17" DEFAULT ((0)) NOT NULL,
    "D18IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D18" DEFAULT ((0)) NOT NULL,
    "D19IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D19" DEFAULT ((0)) NOT NULL,
    "D1AIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1A" DEFAULT ((0)) NOT NULL,
    "D1BIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1B" DEFAULT ((0)) NOT NULL,
    "D1CIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1C" DEFAULT ((0)) NOT NULL,
    "D1DIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1D" DEFAULT ((0)) NOT NULL,
    "D1EIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1E" DEFAULT ((0)) NOT NULL,
    "D1FIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1F" DEFAULT ((0)) NOT NULL,
    "D1GIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1G" DEFAULT ((0)) NOT NULL,
    "D1HIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1H" DEFAULT ((0)) NOT NULL,
    "D1IIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1I" DEFAULT ((0)) NOT NULL,
    "D1JIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1J" DEFAULT ((0)) NOT NULL,
    "D1KIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1K" DEFAULT ((0)) NOT NULL,
    "D1LIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1L" DEFAULT ((0)) NOT NULL,
    "D1MIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1M" DEFAULT ((0)) NOT NULL,
    "D1NIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1N" DEFAULT ((0)) NOT NULL,
    "D1OIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1O" DEFAULT ((0)) NOT NULL,
    "D1PIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1P" DEFAULT ((0)) NOT NULL,
    "D1QIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1Q" DEFAULT ((0)) NOT NULL,
    "D1RIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1R" DEFAULT ((0)) NOT NULL,
    "D1SIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1S" DEFAULT ((0)) NOT NULL,
    "D1TIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1T" DEFAULT ((0)) NOT NULL,
    "D1UIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1U" DEFAULT ((0)) NOT NULL,
    "D1VIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D1V" DEFAULT ((0)) NOT NULL,
    "D20IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D20" DEFAULT ((0)) NOT NULL,
    "D21IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D21" DEFAULT ((0)) NOT NULL,
    "D22IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D22" DEFAULT ((0)) NOT NULL,
    "D23IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D23" DEFAULT ((0)) NOT NULL,
    "D24IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D24" DEFAULT ((0)) NOT NULL,
    "D25IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D25" DEFAULT ((0)) NOT NULL,
    "D26IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D26" DEFAULT ((0)) NOT NULL,
    "D27IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D27" DEFAULT ((0)) NOT NULL,
    "D28IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D28" DEFAULT ((0)) NOT NULL,
    "D29IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D29" DEFAULT ((0)) NOT NULL,
    "D2AIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2A" DEFAULT ((0)) NOT NULL,
    "D2BIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2B" DEFAULT ((0)) NOT NULL,
    "D2CIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2C" DEFAULT ((0)) NOT NULL,
    "D2DIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2D" DEFAULT ((0)) NOT NULL,
    "D2EIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2E" DEFAULT ((0)) NOT NULL,
    "D2FIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2F" DEFAULT ((0)) NOT NULL,
    "D2GIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2G" DEFAULT ((0)) NOT NULL,
    "D2HIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2H" DEFAULT ((0)) NOT NULL,
    "D2IIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2I" DEFAULT ((0)) NOT NULL,
    "D2JIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2J" DEFAULT ((0)) NOT NULL,
    "D2KIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2K" DEFAULT ((0)) NOT NULL,
    "D2LIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2L" DEFAULT ((0)) NOT NULL,
    "D2MIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2M" DEFAULT ((0)) NOT NULL,
    "D2NIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2N" DEFAULT ((0)) NOT NULL,
    "D2OIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2O" DEFAULT ((0)) NOT NULL,
    "D2PIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2P" DEFAULT ((0)) NOT NULL,
    "D2QIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2Q" DEFAULT ((0)) NOT NULL,
    "D2RIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2R" DEFAULT ((0)) NOT NULL,
    "D2SIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2S" DEFAULT ((0)) NOT NULL,
    "D2TIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2T" DEFAULT ((0)) NOT NULL,
    "D2UIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2U" DEFAULT ((0)) NOT NULL,
    "D2VIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D2V" DEFAULT ((0)) NOT NULL,
    "D30IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D30" DEFAULT ((0)) NOT NULL,
    "D31IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D31" DEFAULT ((0)) NOT NULL,
    "D32IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D32" DEFAULT ((0)) NOT NULL,
    "D33IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D33" DEFAULT ((0)) NOT NULL,
    "D34IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D34" DEFAULT ((0)) NOT NULL,
    "D35IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D35" DEFAULT ((0)) NOT NULL,
    "D36IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D36" DEFAULT ((0)) NOT NULL,
    "D37IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D37" DEFAULT ((0)) NOT NULL,
    "D38IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D38" DEFAULT ((0)) NOT NULL,
    "D39IsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D39" DEFAULT ((0)) NOT NULL,
    "D3AIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3A" DEFAULT ((0)) NOT NULL,
    "D3BIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3B" DEFAULT ((0)) NOT NULL,
    "D3CIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3C" DEFAULT ((0)) NOT NULL,
    "D3DIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3D" DEFAULT ((0)) NOT NULL,
    "D3EIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3E" DEFAULT ((0)) NOT NULL,
    "D3FIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3F" DEFAULT ((0)) NOT NULL,
    "D3GIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3G" DEFAULT ((0)) NOT NULL,
    "D3HIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3H" DEFAULT ((0)) NOT NULL,
    "D3IIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3I" DEFAULT ((0)) NOT NULL,
    "D3JIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3J" DEFAULT ((0)) NOT NULL,
    "D3KIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3K" DEFAULT ((0)) NOT NULL,
    "D3LIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3L" DEFAULT ((0)) NOT NULL,
    "D3MIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3M" DEFAULT ((0)) NOT NULL,
    "D3NIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3N" DEFAULT ((0)) NOT NULL,
    "D3OIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3O" DEFAULT ((0)) NOT NULL,
    "D3PIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3P" DEFAULT ((0)) NOT NULL,
    "D3QIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3Q" DEFAULT ((0)) NOT NULL,
    "D3RIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3R" DEFAULT ((0)) NOT NULL,
    "D3SIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3S" DEFAULT ((0)) NOT NULL,
    "D3TIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3T" DEFAULT ((0)) NOT NULL,
    "D3UIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3U" DEFAULT ((0)) NOT NULL,
    "D3VIsActive" BIT CONSTRAINT "DF_DisplayEntityTypes_D3V" DEFAULT ((0)) NOT NULL,
    "HideRoles" BIT CONSTRAINT "DF_DisplayEntityTypes_HideRoles" DEFAULT ((0)) NOT NULL,
    "IconCode" VARCHAR(32) NULL,
    "Color" VARCHAR(7) NULL,
    "PluralDisplayName_L1" NVARCHAR(442) NULL,
    "PluralDisplayName_L2" NVARCHAR(442) NULL,
    "PluralDisplayName_L3" NVARCHAR(442) NULL,
    "PluralDisplayName_L4" NVARCHAR(442) NULL,
    "PluralDisplayName_L5" NVARCHAR(442) NULL,
    "PluralDisplayName_L6" NVARCHAR(442) NULL,
    "PluralDisplayName_L7" NVARCHAR(442) NULL,
    "PluralDisplayName_L8" NVARCHAR(442) NULL,
    "PluralDisplayName_L9" NVARCHAR(442) NULL,
    "PluralDisplayName_L10" NVARCHAR(442) NULL,
    "PluralDisplayName_L11" NVARCHAR(442) NULL,
    "PluralDisplayName_L12" NVARCHAR(442) NULL,
    "PluralDisplayName_L13" NVARCHAR(442) NULL,
    "PluralDisplayName_L14" NVARCHAR(442) NULL,
    "PluralDisplayName_L15" NVARCHAR(442) NULL,
    "PluralDisplayName_L16" NVARCHAR(442) NULL,
    "AutocompleteBinding_Id" BIGINT NULL,
    "MinSearchLength" INT NULL,
    "Priority" INT NOT NULL CONSTRAINT "DF_DisplayEntityType_Priority" DEFAULT 2147483647,
    CONSTRAINT "PK_DisplayEntityTypes" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_DisplayEntityTypes_EntityType" FOREIGN KEY ("Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_DisplayEntityTypes_AutocompleteBinding" FOREIGN KEY ("AutocompleteBinding_Id") REFERENCES "UM_Bindings" ("Id")
);

   GO
   CREATE TABLE "UI_Indicators" (
    "Id"                 BIGINT  NOT NULL,
    "EntityType_Id"      BIGINT  NOT NULL,
    "Binding_Id"         BIGINT  NULL,
    "OptimizedBinding_Id"         BIGINT  NULL,
    "ComparisonOperator" TINYINT NOT NULL,
    "Order"              INT     NOT NULL,
    CONSTRAINT "PK_Indicators" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Indicators_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_Indicators_OptimizedBinding" FOREIGN KEY ("OptimizedBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_Indicators_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id")
);
GO


   GO
   CREATE TABLE "UI_Tiles"
(
    "Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "TileDesignElement_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_Tiles" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Tiles_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_Tiles_TileDesignElement" FOREIGN KEY ("TileDesignElement_Id") REFERENCES "UI_TileDesignElements" ("Id"),
    CONSTRAINT "U_Tiles_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UJ_Jobs"
(
    "Id" BIGINT NOT NULL,
    "Identifier" NVARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "CronTabExpression" NVARCHAR(442) NULL,
    "CronTimeZone" INT CONSTRAINT "DF_Job_CronTimeZone" DEFAULT ((0)) NOT NULL,
    "Agent_Id" BIGINT NULL,
    "UserStartDenied" BIT CONSTRAINT "DF_Jobs_StartDisabled" DEFAULT ((0)) NOT NULL,
    "LastJobInstance_Id" BIGINT NULL,
    "LogLevel" INT CONSTRAINT "DF_Job_LogLevel" DEFAULT ((6)) NOT NULL,
    "IsIncremental" BIT CONSTRAINT "DF_Jobs_IsIncremental" DEFAULT ((0)) NOT NULL,
    "IsConnectorJob" BIT CONSTRAINT "DF_Jobs_IsConnectorJob" DEFAULT ((0)) NOT NULL,
    "IsInitializationJob" BIT CONSTRAINT "DF_Jobs_IsInitializationJob" DEFAULT ((0)) NOT NULL,
    "HasHighFrequencyCrontab" BIT CONSTRAINT "DF_Jobs_HasHighFrequencyCrontab" DEFAULT ((0)) NOT NULL,
    "HasHighFrequencyExecution" BIT CONSTRAINT "DF_Jobs_HasHighFrequencyExecution" DEFAULT ((0)) NOT NULL,
    "IsInQuotaWhitelist" BIT CONSTRAINT "DF_Jobs_IsInQuotaWhitelist" DEFAULT ((0)) NOT NULL,

    CONSTRAINT "PK_Jobs" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_Agent" FOREIGN KEY ("Agent_Id") REFERENCES "UC_Agents" ("Id"),
    CONSTRAINT "U_Jobs" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UM_EntityProperties" (
    "Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Type" INT CONSTRAINT "DF_EntityProperties_Type" DEFAULT ((0)) NOT NULL,
    "TargetColumnIndex" INT CONSTRAINT "DF_EntityProperties_TargetColumnIndex" DEFAULT ((-1)) NOT NULL,
    "IsKey" BIT CONSTRAINT "DF_EntityProperties_IsKey" DEFAULT ((0)) NOT NULL,
    "HistoryPrecision" INT CONSTRAINT "DF_EntityProperties_HistoryPrecision" DEFAULT ((0)) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_EntityProperties_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_EntityProperties_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
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
    "Language_Id" BIGINT NULL,
    "NeutralProperty_Id" BIGINT NULL,
    "GroupByProperty_Id" BIGINT NULL,
    "FlexibleComparisonExpression" VARCHAR(4000) NULL,
    "TargetEntityType" BIGINT NULL,
    CONSTRAINT "PK_EntityProperties" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_EntityProperties_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_EntityProperties_Language" FOREIGN KEY ("Language_Id") REFERENCES "UM_Languages" ("Id"),
    CONSTRAINT "FK_EntityProperties_NeutralProperty" FOREIGN KEY ("NeutralProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_EntityProperties_GroupByProperty" FOREIGN KEY ("GroupByProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "U_EntityProperties_Identifier" UNIQUE ("Identifier","EntityType_Id","ValidTo"),
);
GO
CREATE CLUSTERED INDEX "IX_EntityProperties" ON "UM_EntityProperties" ("ValidTo" ASC, "Id" ASC);
GO
CREATE INDEX "IX_EntityProperties_EntityType" ON "UM_EntityProperties" ("EntityType_Id", "Id" ASC) INCLUDE ("Identifier", "Type", "TargetColumnIndex", "IsKey", "HistoryPrecision", "DisplayName_L1", "DisplayName_L2", "DisplayName_L3", "DisplayName_L4", "DisplayName_L5", "DisplayName_L6", "DisplayName_L7", "DisplayName_L8", "DisplayName_L9", "DisplayName_L10", "DisplayName_L11", "DisplayName_L12", "DisplayName_L13", "DisplayName_L14", "DisplayName_L15", "DisplayName_L16","Language_Id","NeutralProperty_Id","GroupByProperty_Id","FlexibleComparisonExpression","TargetEntityType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);



   GO
   CREATE TABLE "UN_Notifications" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Type" TINYINT CONSTRAINT "DF_Notifications_Type" DEFAULT ((0)) NOT NULL,
    "OwnerEntityType_Id" BIGINT NOT NULL,
    "RazorTemplate" NVARCHAR(MAX) NULL,
    "CssTemplate" NVARCHAR(MAX) NULL,
    "TitleExpression" VARCHAR(4000) NULL,
    "RecipientMailBinding_Id" BIGINT NULL,
    "ReminderInterval" INT CONSTRAINT "DF_Notifications_ReminderInterval" DEFAULT ((0)) NOT NULL,
    "QueryFilterExpression" VARCHAR(4000) NULL,
    CONSTRAINT "PK_Notifications" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Notifications_OwnerEntityType" FOREIGN KEY ("OwnerEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_Notifications_RecipientMailBinding" FOREIGN KEY ("RecipientMailBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "U_Notifications_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UP_BindingExpressions" (
    "Hash" INT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Binding_Id" BIGINT NULL,
    "Expression" VARCHAR(4000) NULL,
    CONSTRAINT "PK_BindingExpressions" PRIMARY KEY ("EntityType_Id", "Hash"),
    CONSTRAINT "FK_BindingExpression_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_BindingExpression_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
);
GO

   GO
   CREATE TABLE "UP_Categories"
(
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "Parent_Id" BIGINT NULL,
    "CurrentNodeIndex" UNIQUEIDENTIFIER CONSTRAINT "DF_Categories_CurrentNodeIndex" DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    "NextNodeIndex" UNIQUEIDENTIFIER CONSTRAINT "DF_Categories_NextNodeIndex" DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_Categories_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_Categories_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "FullName_L1" NVARCHAR(4000) NULL,
    "FullName_L2" NVARCHAR(4000) NULL,
    "FullName_L3" NVARCHAR(4000) NULL,
    "FullName_L4" NVARCHAR(4000) NULL,
    "FullName_L5" NVARCHAR(4000) NULL,
    "FullName_L6" NVARCHAR(4000) NULL,
    "FullName_L7" NVARCHAR(4000) NULL,
    "FullName_L8" NVARCHAR(4000) NULL,
    "FullName_L9" NVARCHAR(4000) NULL,
    "FullName_L10" NVARCHAR(4000) NULL,
    "FullName_L11" NVARCHAR(4000) NULL,
    "FullName_L12" NVARCHAR(4000) NULL,
    "FullName_L13" NVARCHAR(4000) NULL,
    "FullName_L14" NVARCHAR(4000) NULL,
    "FullName_L15" NVARCHAR(4000) NULL,
    "FullName_L16" NVARCHAR(4000) NULL,
    "Description_L1" NVARCHAR(1024) NULL,
    "Description_L2" NVARCHAR(1024) NULL,
    "Description_L3" NVARCHAR(1024) NULL,
    "Description_L4" NVARCHAR(1024) NULL,
    "Description_L5" NVARCHAR(1024) NULL,
    "Description_L6" NVARCHAR(1024) NULL,
    "Description_L7" NVARCHAR(1024) NULL,
    "Description_L8" NVARCHAR(1024) NULL,
    "Description_L9" NVARCHAR(1024) NULL,
    "Description_L10" NVARCHAR(1024) NULL,
    "Description_L11" NVARCHAR(1024) NULL,
    "Description_L12" NVARCHAR(1024) NULL,
    "Description_L13" NVARCHAR(1024) NULL,
    "Description_L14" NVARCHAR(1024) NULL,
    "Description_L15" NVARCHAR(1024) NULL,
    "Description_L16" NVARCHAR(1024) NULL,
    "IsCollapsed" BIT CONSTRAINT "DF_Categories_IsCollapsed" DEFAULT((0)) NOT NULL,
    "SingleRoleCounter" INT CONSTRAINT "DF_Categories_SingleRoleCounter" DEFAULT ((0)) NOT NULL,
    "CompositeRoleCounter" INT CONSTRAINT "DF_Categories_CompositeRoleCounter" DEFAULT ((0)) NOT NULL,
    "ResourceTypeCounter" INT CONSTRAINT "DF_Categories_ResourceTypeCounter" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_Categories" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Categories_Category" FOREIGN KEY ("Parent_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_Categories_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "U_Categories_Identifier" UNIQUE ("Identifier", "ValidTo"),
);
GO
CREATE CLUSTERED INDEX "IX_Categories" ON "UP_Categories" ("ValidTo" ASC, "Id" ASC);
GO

   GO
   CREATE TABLE "UP_ContextRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "SourceEntityType_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "ResourcesBinding_Id" BIGINT NULL,
    "ResourcesExpression" VARCHAR(4000) NULL,
    "ResourcesStartBinding_Id" BIGINT NULL,
    "ResourcesStartExpression" VARCHAR(4000) NULL,
    "ResourcesEndBinding_Id" BIGINT NULL,
    "ResourcesEndExpression" VARCHAR(4000) NULL,
    "ResourceCertificationComparisonBinding_Id" BIGINT NULL,
    "ResourceCertificationComparisonOperator" TINYINT NULL,
    "ResourceCertificationComparisonValue" NVARCHAR(442) NULL,
    "ExcludeExpression" VARCHAR(4000) NULL,
    "RiskFactorType" TINYINT NULL,

    "MinIdentitiesCount" INT CONSTRAINT "DF_ContextRules_MinIdentitiesCount" DEFAULT ((0)) NOT NULL,
    "ReductionOutlierPercentage" FLOAT(24) CONSTRAINT "DF_ContextRules_ReductionOutlierPercentage" DEFAULT((0.0)) NOT NULL,

    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "B0_Id" BIGINT NULL,
    "B1_Id" BIGINT NULL,
    "B2_Id" BIGINT NULL,
    "B3_Id" BIGINT NULL,
    "B4_Id" BIGINT NULL,
    "B5_Id" BIGINT NULL,
    "B6_Id" BIGINT NULL,
    "B7_Id" BIGINT NULL,
    "B8_Id" BIGINT NULL,
    "B9_Id" BIGINT NULL,
    "BA_Id" BIGINT NULL,
    "BB_Id" BIGINT NULL,
    "BC_Id" BIGINT NULL,
    "BD_Id" BIGINT NULL,
    "BE_Id" BIGINT NULL,
    "BF_Id" BIGINT NULL,
    "BG_Id" BIGINT NULL,
    "BH_Id" BIGINT NULL,
    "BI_Id" BIGINT NULL,
    "BJ_Id" BIGINT NULL,
    "BK_Id" BIGINT NULL,
    "BL_Id" BIGINT NULL,
    "BM_Id" BIGINT NULL,
    "BN_Id" BIGINT NULL,
    "BO_Id" BIGINT NULL,
    "BP_Id" BIGINT NULL,
    "BQ_Id" BIGINT NULL,
    "BR_Id" BIGINT NULL,
    "BS_Id" BIGINT NULL,
    "BT_Id" BIGINT NULL,
    "BU_Id" BIGINT NULL,
    "BV_Id" BIGINT NULL,
    "B10_Id" BIGINT NULL,
    "B11_Id" BIGINT NULL,
    "B12_Id" BIGINT NULL,
    "B13_Id" BIGINT NULL,
    "B14_Id" BIGINT NULL,
    "B15_Id" BIGINT NULL,
    "B16_Id" BIGINT NULL,
    "B17_Id" BIGINT NULL,
    "B18_Id" BIGINT NULL,
    "B19_Id" BIGINT NULL,
    "B1A_Id" BIGINT NULL,
    "B1B_Id" BIGINT NULL,
    "B1C_Id" BIGINT NULL,
    "B1D_Id" BIGINT NULL,
    "B1E_Id" BIGINT NULL,
    "B1F_Id" BIGINT NULL,
    "B1G_Id" BIGINT NULL,
    "B1H_Id" BIGINT NULL,
    "B1I_Id" BIGINT NULL,
    "B1J_Id" BIGINT NULL,
    "B1K_Id" BIGINT NULL,
    "B1L_Id" BIGINT NULL,
    "B1M_Id" BIGINT NULL,
    "B1N_Id" BIGINT NULL,
    "B1O_Id" BIGINT NULL,
    "B1P_Id" BIGINT NULL,
    "B1Q_Id" BIGINT NULL,
    "B1R_Id" BIGINT NULL,
    "B1S_Id" BIGINT NULL,
    "B1T_Id" BIGINT NULL,
    "B1U_Id" BIGINT NULL,
    "B1V_Id" BIGINT NULL,
    "B20_Id" BIGINT NULL,
    "B21_Id" BIGINT NULL,
    "B22_Id" BIGINT NULL,
    "B23_Id" BIGINT NULL,
    "B24_Id" BIGINT NULL,
    "B25_Id" BIGINT NULL,
    "B26_Id" BIGINT NULL,
    "B27_Id" BIGINT NULL,
    "B28_Id" BIGINT NULL,
    "B29_Id" BIGINT NULL,
    "B2A_Id" BIGINT NULL,
    "B2B_Id" BIGINT NULL,
    "B2C_Id" BIGINT NULL,
    "B2D_Id" BIGINT NULL,
    "B2E_Id" BIGINT NULL,
    "B2F_Id" BIGINT NULL,
    "B2G_Id" BIGINT NULL,
    "B2H_Id" BIGINT NULL,
    "B2I_Id" BIGINT NULL,
    "B2J_Id" BIGINT NULL,
    "B2K_Id" BIGINT NULL,
    "B2L_Id" BIGINT NULL,
    "B2M_Id" BIGINT NULL,
    "B2N_Id" BIGINT NULL,
    "B2O_Id" BIGINT NULL,
    "B2P_Id" BIGINT NULL,
    "B2Q_Id" BIGINT NULL,
    "B2R_Id" BIGINT NULL,
    "B2S_Id" BIGINT NULL,
    "B2T_Id" BIGINT NULL,
    "B2U_Id" BIGINT NULL,
    "B2V_Id" BIGINT NULL,
    "B30_Id" BIGINT NULL,
    "B31_Id" BIGINT NULL,
    "B32_Id" BIGINT NULL,
    "B33_Id" BIGINT NULL,
    "B34_Id" BIGINT NULL,
    "B35_Id" BIGINT NULL,
    "B36_Id" BIGINT NULL,
    "B37_Id" BIGINT NULL,
    "B38_Id" BIGINT NULL,
    "B39_Id" BIGINT NULL,
    "B3A_Id" BIGINT NULL,
    "B3B_Id" BIGINT NULL,
    "B3C_Id" BIGINT NULL,
    "B3D_Id" BIGINT NULL,
    "B3E_Id" BIGINT NULL,
    "B3F_Id" BIGINT NULL,
    "B3G_Id" BIGINT NULL,
    "B3H_Id" BIGINT NULL,
    "B3I_Id" BIGINT NULL,
    "B3J_Id" BIGINT NULL,
    "B3K_Id" BIGINT NULL,
    "B3L_Id" BIGINT NULL,
    "B3M_Id" BIGINT NULL,
    "B3N_Id" BIGINT NULL,
    "B3O_Id" BIGINT NULL,
    "B3P_Id" BIGINT NULL,
    "B3Q_Id" BIGINT NULL,
    "B3R_Id" BIGINT NULL,
    "B3S_Id" BIGINT NULL,
    "B3T_Id" BIGINT NULL,
    "B3U_Id" BIGINT NULL,
    "B3V_Id" BIGINT NULL,
    CONSTRAINT "PK_ContextRules" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ContextRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ContextRules_SourceEntityTypes" FOREIGN KEY ("SourceEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ContextRules_ResourcesBinding" FOREIGN KEY ("ResourcesBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_ResourcesStartBinding_Id" FOREIGN KEY ("ResourcesStartBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_ResourceCertificationComparisonBinding_Id" FOREIGN KEY ("ResourceCertificationComparisonBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_ResourcesEndBinding_Id" FOREIGN KEY ("ResourcesEndBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B0_Id" FOREIGN KEY ("B0_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1_Id" FOREIGN KEY ("B1_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2_Id" FOREIGN KEY ("B2_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3_Id" FOREIGN KEY ("B3_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B4_Id" FOREIGN KEY ("B4_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B5_Id" FOREIGN KEY ("B5_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B6_Id" FOREIGN KEY ("B6_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B7_Id" FOREIGN KEY ("B7_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B8_Id" FOREIGN KEY ("B8_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B9_Id" FOREIGN KEY ("B9_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BA_Id" FOREIGN KEY ("BA_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BB_Id" FOREIGN KEY ("BB_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BC_Id" FOREIGN KEY ("BC_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BD_Id" FOREIGN KEY ("BD_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BE_Id" FOREIGN KEY ("BE_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BF_Id" FOREIGN KEY ("BF_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BG_Id" FOREIGN KEY ("BG_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BH_Id" FOREIGN KEY ("BH_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BI_Id" FOREIGN KEY ("BI_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BJ_Id" FOREIGN KEY ("BJ_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BK_Id" FOREIGN KEY ("BK_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BL_Id" FOREIGN KEY ("BL_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BM_Id" FOREIGN KEY ("BM_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BN_Id" FOREIGN KEY ("BN_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BO_Id" FOREIGN KEY ("BO_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BP_Id" FOREIGN KEY ("BP_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BQ_Id" FOREIGN KEY ("BQ_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BR_Id" FOREIGN KEY ("BR_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BS_Id" FOREIGN KEY ("BS_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BT_Id" FOREIGN KEY ("BT_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BU_Id" FOREIGN KEY ("BU_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_BV_Id" FOREIGN KEY ("BV_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B10_Id" FOREIGN KEY ("B10_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B11_Id" FOREIGN KEY ("B11_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B12_Id" FOREIGN KEY ("B12_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B13_Id" FOREIGN KEY ("B13_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B14_Id" FOREIGN KEY ("B14_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B15_Id" FOREIGN KEY ("B15_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B16_Id" FOREIGN KEY ("B16_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B17_Id" FOREIGN KEY ("B17_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B18_Id" FOREIGN KEY ("B18_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B19_Id" FOREIGN KEY ("B19_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1A_Id" FOREIGN KEY ("B1A_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1B_Id" FOREIGN KEY ("B1B_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1C_Id" FOREIGN KEY ("B1C_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1D_Id" FOREIGN KEY ("B1D_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1E_Id" FOREIGN KEY ("B1E_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1F_Id" FOREIGN KEY ("B1F_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1G_Id" FOREIGN KEY ("B1G_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1H_Id" FOREIGN KEY ("B1H_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1I_Id" FOREIGN KEY ("B1I_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1J_Id" FOREIGN KEY ("B1J_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1K_Id" FOREIGN KEY ("B1K_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1L_Id" FOREIGN KEY ("B1L_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1M_Id" FOREIGN KEY ("B1M_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1N_Id" FOREIGN KEY ("B1N_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1O_Id" FOREIGN KEY ("B1O_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1P_Id" FOREIGN KEY ("B1P_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1Q_Id" FOREIGN KEY ("B1Q_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1R_Id" FOREIGN KEY ("B1R_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1S_Id" FOREIGN KEY ("B1S_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1T_Id" FOREIGN KEY ("B1T_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1U_Id" FOREIGN KEY ("B1U_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B1V_Id" FOREIGN KEY ("B1V_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B20_Id" FOREIGN KEY ("B20_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B21_Id" FOREIGN KEY ("B21_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B22_Id" FOREIGN KEY ("B22_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B23_Id" FOREIGN KEY ("B23_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B24_Id" FOREIGN KEY ("B24_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B25_Id" FOREIGN KEY ("B25_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B26_Id" FOREIGN KEY ("B26_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B27_Id" FOREIGN KEY ("B27_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B28_Id" FOREIGN KEY ("B28_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B29_Id" FOREIGN KEY ("B29_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2A_Id" FOREIGN KEY ("B2A_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2B_Id" FOREIGN KEY ("B2B_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2C_Id" FOREIGN KEY ("B2C_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2D_Id" FOREIGN KEY ("B2D_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2E_Id" FOREIGN KEY ("B2E_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2F_Id" FOREIGN KEY ("B2F_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2G_Id" FOREIGN KEY ("B2G_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2H_Id" FOREIGN KEY ("B2H_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2I_Id" FOREIGN KEY ("B2I_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2J_Id" FOREIGN KEY ("B2J_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2K_Id" FOREIGN KEY ("B2K_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2L_Id" FOREIGN KEY ("B2L_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2M_Id" FOREIGN KEY ("B2M_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2N_Id" FOREIGN KEY ("B2N_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2O_Id" FOREIGN KEY ("B2O_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2P_Id" FOREIGN KEY ("B2P_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2Q_Id" FOREIGN KEY ("B2Q_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2R_Id" FOREIGN KEY ("B2R_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2S_Id" FOREIGN KEY ("B2S_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2T_Id" FOREIGN KEY ("B2T_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2U_Id" FOREIGN KEY ("B2U_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B2V_Id" FOREIGN KEY ("B2V_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B30_Id" FOREIGN KEY ("B30_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B31_Id" FOREIGN KEY ("B31_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B32_Id" FOREIGN KEY ("B32_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B33_Id" FOREIGN KEY ("B33_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B34_Id" FOREIGN KEY ("B34_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B35_Id" FOREIGN KEY ("B35_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B36_Id" FOREIGN KEY ("B36_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B37_Id" FOREIGN KEY ("B37_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B38_Id" FOREIGN KEY ("B38_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B39_Id" FOREIGN KEY ("B39_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3A_Id" FOREIGN KEY ("B3A_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3B_Id" FOREIGN KEY ("B3B_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3C_Id" FOREIGN KEY ("B3C_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3D_Id" FOREIGN KEY ("B3D_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3E_Id" FOREIGN KEY ("B3E_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3F_Id" FOREIGN KEY ("B3F_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3G_Id" FOREIGN KEY ("B3G_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3H_Id" FOREIGN KEY ("B3H_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3I_Id" FOREIGN KEY ("B3I_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3J_Id" FOREIGN KEY ("B3J_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3K_Id" FOREIGN KEY ("B3K_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3L_Id" FOREIGN KEY ("B3L_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3M_Id" FOREIGN KEY ("B3M_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3N_Id" FOREIGN KEY ("B3N_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3O_Id" FOREIGN KEY ("B3O_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3P_Id" FOREIGN KEY ("B3P_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3Q_Id" FOREIGN KEY ("B3Q_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3R_Id" FOREIGN KEY ("B3R_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3S_Id" FOREIGN KEY ("B3S_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3T_Id" FOREIGN KEY ("B3T_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3U_Id" FOREIGN KEY ("B3U_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ContextRules_B3V_Id" FOREIGN KEY ("B3V_Id") REFERENCES "UM_Bindings" ("Id"),
);

   GO
   CREATE TABLE "UP_PolicySimulations" (
    "Id" BIGINT NOT NULL,
    "Identifier" NVARCHAR(442) NOT NULL,
    "State" TINYINT CONSTRAINT "DF_PolicySimulations_State" DEFAULT ((0)) NOT NULL,
    "BlockProvisioning" BIT CONSTRAINT "DF_PolicySimulations_BlocProvisioning" DEFAULT ((1)) NOT NULL,
    "Policy_Id" BIGINT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "WhenStarted" SMALLDATETIME NULL,
    "StartedBy_Id" BIGINT NULL,
    "WhenCompleted" SMALLDATETIME NULL,

    "CompositeRoleAddedAutomaticCount" INT NULL,
    "CompositeRoleAddedBlockedCount" INT NULL,
    "CompositeRoleAddedFoundOrHistoryCount" INT NULL,
    "CompositeRoleDeletedCount" INT NULL,
    "CompositeRoleUpdatedCount" INT NULL,

    "SingleRoleAddedAutomaticCount" INT NULL,
    "SingleRoleAddedBlockedCount" INT NULL,
    "SingleRoleAddedFoundOrHistoryCount" INT NULL,
    "SingleRoleDeletedCount" INT NULL,
    "SingleRoleUpdatedCount" INT NULL,

    "ResourceTypeAddedAutomaticCount" INT NULL,
    "ResourceTypeAddedBlockedCount" INT NULL,
    "ResourceTypeAddedFoundOrHistoryCount" INT NULL,
    "ResourceTypeDeletedCount" INT NULL,
    "ResourceTypeUpdatedCount" INT NULL,

    "ResourceNavigationAddedAutomaticCount" INT NULL,
    "ResourceNavigationAddedBlockedCount" INT NULL,
    "ResourceNavigationAddedFoundOrHistoryCount" INT NULL,
    "ResourceNavigationDeletedCount" INT NULL,
    "ResourceNavigationUpdatedCount" INT NULL,

    "ResourceScalarAddedAutomaticCount" INT NULL,
    "ResourceScalarAddedBlockedCount" INT NULL,
    "ResourceScalarAddedFoundOrHistoryCount" INT NULL,
    "ResourceScalarDeletedCount" INT NULL,
    "ResourceScalarUpdatedCount" INT NULL,

    "RiskDeletedCount" INT NULL,
    "RiskAddedCount" INT NULL,

    CONSTRAINT "FK_PolicySimulations_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_PolicySimulations_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "PK_PolicySimulations" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_PolicySimulations_Identifier" UNIQUE ("Identifier"),
);
GO

   GO
   CREATE TABLE "UP_Risks" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "RiskType" TINYINT CONSTRAINT "DF_Risks_RiskType" DEFAULT ((0)) NOT NULL,
    "ExemptionPolicy" TINYINT CONSTRAINT "DF_Risks_ExemptionPolicy" DEFAULT ((0)) NOT NULL,
    "Level" TINYINT CONSTRAINT "DF_Risks_Level" DEFAULT ((0)) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_Risks_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_Risks_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "Description_L1" NVARCHAR(1024) NULL,
    "Description_L2" NVARCHAR(1024) NULL,
    "Description_L3" NVARCHAR(1024) NULL,
    "Description_L4" NVARCHAR(1024) NULL,
    "Description_L5" NVARCHAR(1024) NULL,
    "Description_L6" NVARCHAR(1024) NULL,
    "Description_L7" NVARCHAR(1024) NULL,
    "Description_L8" NVARCHAR(1024) NULL,
    "Description_L9" NVARCHAR(1024) NULL,
    "Description_L10" NVARCHAR(1024) NULL,
    "Description_L11" NVARCHAR(1024) NULL,
    "Description_L12" NVARCHAR(1024) NULL,
    "Description_L13" NVARCHAR(1024) NULL,
    "Description_L14" NVARCHAR(1024) NULL,
    "Description_L15" NVARCHAR(1024) NULL,
    "Description_L16" NVARCHAR(1024) NULL,
    "Remediation_L1" NVARCHAR(2048) NULL,
    "Remediation_L2" NVARCHAR(2048) NULL,
    "Remediation_L3" NVARCHAR(2048) NULL,
    "Remediation_L4" NVARCHAR(2048) NULL,
    "Remediation_L5" NVARCHAR(2048) NULL,
    "Remediation_L6" NVARCHAR(2048) NULL,
    "Remediation_L7" NVARCHAR(2048) NULL,
    "Remediation_L8" NVARCHAR(2048) NULL,
    "Remediation_L9" NVARCHAR(2048) NULL,
    "Remediation_L10" NVARCHAR(2048) NULL,
    "Remediation_L11" NVARCHAR(2048) NULL,
    "Remediation_L12" NVARCHAR(2048) NULL,
    "Remediation_L13" NVARCHAR(2048) NULL,
    "Remediation_L14" NVARCHAR(2048) NULL,
    "Remediation_L15" NVARCHAR(2048) NULL,
    "Remediation_L16" NVARCHAR(2048) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_Risks" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Risks_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_Risks_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
);
GO
CREATE CLUSTERED INDEX "IX_Risks" ON "UP_Risks" ("ValidTo" ASC, "Id" ASC);

   GO
   CREATE TABLE "UQ_ReportQueries" (
    "Id" BIGINT NOT NULL,
    "ReturnedEntityType_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Query" NVARCHAR(4000) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_ReportQueries" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_ReportQueries_Identifier" UNIQUE ("Identifier"),
    CONSTRAINT "FK_ReportQueries_EntityType" FOREIGN KEY ("ReturnedEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
);

   GO
   CREATE TABLE "UR_ResourceChanges"
(
    "JobInstance_Id" BIGINT NOT NULL,
    "ChangeOperation" INT NOT NULL,
    "Resource_Id" BIGINT NOT NULL,
    "Type" BIGINT NOT NULL,
    "ValidFrom" DATETIME2(2) NULL,
    "ValidTo" DATETIME2(2) NULL,
    "DisplayName_L1" NVARCHAR(442) NULL,
    "PrimaryKey" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U0" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U1" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U2" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "C0" NVARCHAR(4000) NULL,
    "C1" NVARCHAR(4000) NULL,
    "C2" NVARCHAR(4000) NULL,
    "C3" NVARCHAR(4000) NULL,
    "C4" NVARCHAR(442) NULL,
    "C5" NVARCHAR(442) NULL,
    "C6" NVARCHAR(442) NULL,
    "C7" NVARCHAR(442) NULL,
    "C8" NVARCHAR(442) NULL,
    "C9" NVARCHAR(442) NULL,
    "CA" NVARCHAR(442) NULL,
    "CB" NVARCHAR(442) NULL,
    "CC" NVARCHAR(442) NULL,
    "CD" NVARCHAR(442) NULL,
    "CE" NVARCHAR(442) NULL,  
    "R0" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "DisplayName_L2" NVARCHAR(442) NULL,
    "I40" BIGINT NULL,
    "I41" BIGINT NULL,
    "I42" BIGINT NULL,
    "I43" BIGINT NULL,
    "I44" BIGINT NULL,
    "CF" NVARCHAR(442) NULL,
    "CG" NVARCHAR(442) NULL,
    "CH" NVARCHAR(442) NULL,
    "CI" NVARCHAR(442) NULL,
    "CJ" NVARCHAR(442) NULL,
    "CK" NVARCHAR(442) NULL,
    "CL" NVARCHAR(442) NULL,
    "CM" NVARCHAR(442) NULL,
    "CN" NVARCHAR(442) NULL,
    "CO" NVARCHAR(442) NULL,
    "CP" NVARCHAR(442) NULL,
    "CQ" NVARCHAR(442) NULL,
    "CR" NVARCHAR(442) NULL,
    "CS" NVARCHAR(442) NULL,
    "CT" NVARCHAR(442) NULL,
    "DisplayName_L3" NVARCHAR(442) NULL,
    "I45" BIGINT NULL,
    "I46" BIGINT NULL,
    "I47" BIGINT NULL,
    "I48" BIGINT NULL,
    "I49" BIGINT NULL,
    "CU" NVARCHAR(442) NULL,
    "CV" NVARCHAR(442) NULL,
    "C10" NVARCHAR(442) NULL,
    "C11" NVARCHAR(442) NULL,
    "C12" NVARCHAR(442) NULL,
    "C13" NVARCHAR(442) NULL,
    "C14" NVARCHAR(442) NULL,
    "C15" NVARCHAR(442) NULL,
    "C16" NVARCHAR(442) NULL,
    "C17" NVARCHAR(442) NULL,
    "C18" NVARCHAR(442) NULL,
    "C19" NVARCHAR(442) NULL,
    "C1A" NVARCHAR(442) NULL,
    "C1B" NVARCHAR(442) NULL,
    "C1C" NVARCHAR(442) NULL,
    "DisplayName_L4" NVARCHAR(442) NULL,
    "I4A" BIGINT NULL,
    "I4B" BIGINT NULL,
    "I4C" BIGINT NULL,
    "I4D" BIGINT NULL,
    "I4E" BIGINT NULL,
    "C1D" NVARCHAR(442) NULL,
    "C1E" NVARCHAR(442) NULL,
    "C1F" NVARCHAR(442) NULL,
    "C1G" NVARCHAR(442) NULL,
    "C1H" NVARCHAR(442) NULL,
    "C1I" NVARCHAR(442) NULL,
    "C1J" NVARCHAR(442) NULL,
    "C1K" NVARCHAR(442) NULL,
    "C1L" NVARCHAR(442) NULL,
    "C1M" NVARCHAR(442) NULL,
    "C1N" NVARCHAR(442) NULL,
    "C1O" NVARCHAR(442) NULL,
    "C1P" NVARCHAR(442) NULL,
    "C1Q" NVARCHAR(442) NULL,
    "C1R" NVARCHAR(442) NULL,
    "DisplayName_L5" NVARCHAR(442) NULL,
    "I4F" BIGINT NULL,
    "I4G" BIGINT NULL,
    "I4H" BIGINT NULL,
    "I4I" BIGINT NULL,
    "C1S" NVARCHAR(442) NULL,
    "C1T" NVARCHAR(442) NULL,
    "C1U" NVARCHAR(442) NULL,
    "C1V" NVARCHAR(442) NULL,
    "C20" NVARCHAR(442) NULL,
    "C21" NVARCHAR(442) NULL,
    "C22" NVARCHAR(442) NULL,
    "C23" NVARCHAR(442) NULL,
    "C24" NVARCHAR(442) NULL,
    "C25" NVARCHAR(442) NULL,
    "C26" NVARCHAR(442) NULL,
    "C27" NVARCHAR(442) NULL,
    "C28" NVARCHAR(442) NULL,
    "C29" NVARCHAR(442) NULL,
    "C2A" NVARCHAR(442) NULL,
    "DisplayName_L6" NVARCHAR(442) NULL,
    "I4J" BIGINT NULL,
    "I4K" BIGINT NULL,
    "I4L" BIGINT NULL,
    "C2B" NVARCHAR(442) NULL,
    "C2C" NVARCHAR(442) NULL,
    "C2D" NVARCHAR(442) NULL,
    "C2E" NVARCHAR(442) NULL,
    "C2F" NVARCHAR(442) NULL,
    "C2G" NVARCHAR(442) NULL,
    "C2H" NVARCHAR(442) NULL,
    "C2I" NVARCHAR(442) NULL,
    "C2J" NVARCHAR(442) NULL,
    "C2K" NVARCHAR(442) NULL,
    "C2L" NVARCHAR(442) NULL,
    "C2M" NVARCHAR(442) NULL,
    "C2N" NVARCHAR(442) NULL,
    "DisplayName_L7" NVARCHAR(442) NULL,
    "I4M" BIGINT NULL,
    "I4N" BIGINT NULL,
    "C2O" NVARCHAR(442) NULL,
    "C2P" NVARCHAR(442) NULL,
    "C2Q" NVARCHAR(442) NULL,
    "C2R" NVARCHAR(442) NULL,
    "C2S" NVARCHAR(442) NULL,
    "C2T" NVARCHAR(442) NULL,
    "C2U" NVARCHAR(442) NULL,
    "C2V" NVARCHAR(442) NULL,
    "C30" NVARCHAR(442) NULL,
    "C31" NVARCHAR(442) NULL,
    "C32" NVARCHAR(442) NULL,
    "C33" NVARCHAR(442) NULL,
    "C34" NVARCHAR(442) NULL,
    "C35" NVARCHAR(442) NULL,
    "C36" NVARCHAR(442) NULL,
    "DisplayName_L8" NVARCHAR(442) NULL,
    "I4O" BIGINT NULL,
    "C37" NVARCHAR(442) NULL,
    "C38" NVARCHAR(442) NULL,
    "C39" NVARCHAR(442) NULL,
    "C3A" NVARCHAR(442) NULL,
    "C3B" NVARCHAR(442) NULL,
    "C3C" NVARCHAR(442) NULL,
    "C3D" NVARCHAR(442) NULL,
    "C3E" NVARCHAR(442) NULL,
    "C3F" NVARCHAR(442) NULL,
    "C3G" NVARCHAR(442) NULL,
    "C3H" NVARCHAR(442) NULL,
    "C3I" NVARCHAR(442) NULL,
    "C3J" NVARCHAR(442) NULL,
    "C3K" NVARCHAR(442) NULL,
    "C3L" NVARCHAR(442) NULL,
    "C3M" NVARCHAR(442) NULL,
    "C3N" NVARCHAR(442) NULL,
    "C3O" NVARCHAR(442) NULL,
    "C3P" NVARCHAR(442) NULL,
    "C3Q" NVARCHAR(442) NULL,
    "C3R" NVARCHAR(442) NULL,
    "C3S" NVARCHAR(442) NULL,
    "C3T" NVARCHAR(442) NULL,
    "C3U" NVARCHAR(442) NULL,
    "C3V" NVARCHAR(442) NULL,
    "DisplayName_L9" NVARCHAR(442) NULL,
    "DisplayName_L10" NVARCHAR(442) NULL,
    "DisplayName_L11" NVARCHAR(442) NULL,
    "DisplayName_L12" NVARCHAR(442) NULL,
    "DisplayName_L13" NVARCHAR(442) NULL,
    "DisplayName_L14" NVARCHAR(442) NULL,
    "DisplayName_L15" NVARCHAR(442) NULL,
    "DisplayName_L16" NVARCHAR(442) NULL,
    CONSTRAINT "FK_ResourceChanges_Type" FOREIGN KEY ("Type") REFERENCES "UM_EntityTypes" ("Id")
);

GO
ALTER TABLE "UR_ResourceChanges" NOCHECK CONSTRAINT "FK_ResourceChanges_Type";
GO
CREATE CLUSTERED INDEX "IX_ResourceChanges"
    ON "UR_ResourceChanges"("JobInstance_Id" ASC, "Type" ASC, "PrimaryKey" ASC, "Resource_Id" ASC);
GO
CREATE NONCLUSTERED INDEX "IX_ResourceChanges_Resource_Id"
    ON "UR_ResourceChanges"("JobInstance_Id" ASC, "Type" ASC, "Resource_Id" ASC);
GO

   GO
   CREATE TABLE "UR_Resources" (
    "Id" BIGINT NOT NULL,
    "Type" BIGINT NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_Resources_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_Resources_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "Dirty" BIT CONSTRAINT "DF_Resources_Dirty" DEFAULT ((0)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NULL,
    "PrimaryKey" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U0" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U1" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "U2" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "C0" NVARCHAR(4000) NULL,
    "C1" NVARCHAR(4000) NULL,
    "C2" NVARCHAR(4000) NULL,
    "C3" NVARCHAR(4000) NULL,
    "C4" NVARCHAR(442) NULL,
    "C5" NVARCHAR(442) NULL,
    "C6" NVARCHAR(442) NULL,
    "C7" NVARCHAR(442) NULL,
    "C8" NVARCHAR(442) NULL,
    "C9" NVARCHAR(442) NULL,
    "CA" NVARCHAR(442) NULL,
    "CB" NVARCHAR(442) NULL,
    "CC" NVARCHAR(442) NULL,
    "CD" NVARCHAR(442) NULL,
    "CE" NVARCHAR(442) NULL,  
    "R0" NVARCHAR(442) COLLATE Latin1_General_BIN2 NULL,
    "DisplayName_L2" NVARCHAR(442) NULL,
    "I40" BIGINT NULL,
    "I41" BIGINT NULL,
    "I42" BIGINT NULL,
    "I43" BIGINT NULL,
    "I44" BIGINT NULL,
    "CF" NVARCHAR(442) NULL,
    "CG" NVARCHAR(442) NULL,
    "CH" NVARCHAR(442) NULL,
    "CI" NVARCHAR(442) NULL,
    "CJ" NVARCHAR(442) NULL,
    "CK" NVARCHAR(442) NULL,
    "CL" NVARCHAR(442) NULL,
    "CM" NVARCHAR(442) NULL,
    "CN" NVARCHAR(442) NULL,
    "CO" NVARCHAR(442) NULL,
    "CP" NVARCHAR(442) NULL,
    "CQ" NVARCHAR(442) NULL,
    "CR" NVARCHAR(442) NULL,
    "CS" NVARCHAR(442) NULL,
    "CT" NVARCHAR(442) NULL,
    "DisplayName_L3" NVARCHAR(442) NULL,
    "I45" BIGINT NULL,
    "I46" BIGINT NULL,
    "I47" BIGINT NULL,
    "I48" BIGINT NULL,
    "I49" BIGINT NULL,
    "CU" NVARCHAR(442) NULL,
    "CV" NVARCHAR(442) NULL,
    "C10" NVARCHAR(442) NULL,
    "C11" NVARCHAR(442) NULL,
    "C12" NVARCHAR(442) NULL,
    "C13" NVARCHAR(442) NULL,
    "C14" NVARCHAR(442) NULL,
    "C15" NVARCHAR(442) NULL,
    "C16" NVARCHAR(442) NULL,
    "C17" NVARCHAR(442) NULL,
    "C18" NVARCHAR(442) NULL,
    "C19" NVARCHAR(442) NULL,
    "C1A" NVARCHAR(442) NULL,
    "C1B" NVARCHAR(442) NULL,
    "C1C" NVARCHAR(442) NULL,
    "DisplayName_L4" NVARCHAR(442) NULL,
    "I4A" BIGINT NULL,
    "I4B" BIGINT NULL,
    "I4C" BIGINT NULL,
    "I4D" BIGINT NULL,
    "I4E" BIGINT NULL,
    "C1D" NVARCHAR(442) NULL,
    "C1E" NVARCHAR(442) NULL,
    "C1F" NVARCHAR(442) NULL,
    "C1G" NVARCHAR(442) NULL,
    "C1H" NVARCHAR(442) NULL,
    "C1I" NVARCHAR(442) NULL,
    "C1J" NVARCHAR(442) NULL,
    "C1K" NVARCHAR(442) NULL,
    "C1L" NVARCHAR(442) NULL,
    "C1M" NVARCHAR(442) NULL,
    "C1N" NVARCHAR(442) NULL,
    "C1O" NVARCHAR(442) NULL,
    "C1P" NVARCHAR(442) NULL,
    "C1Q" NVARCHAR(442) NULL,
    "C1R" NVARCHAR(442) NULL,
    "DisplayName_L5" NVARCHAR(442) NULL,
    "I4F" BIGINT NULL,
    "I4G" BIGINT NULL,
    "I4H" BIGINT NULL,
    "I4I" BIGINT NULL,
    "C1S" NVARCHAR(442) NULL,
    "C1T" NVARCHAR(442) NULL,
    "C1U" NVARCHAR(442) NULL,
    "C1V" NVARCHAR(442) NULL,
    "C20" NVARCHAR(442) NULL,
    "C21" NVARCHAR(442) NULL,
    "C22" NVARCHAR(442) NULL,
    "C23" NVARCHAR(442) NULL,
    "C24" NVARCHAR(442) NULL,
    "C25" NVARCHAR(442) NULL,
    "C26" NVARCHAR(442) NULL,
    "C27" NVARCHAR(442) NULL,
    "C28" NVARCHAR(442) NULL,
    "C29" NVARCHAR(442) NULL,
    "C2A" NVARCHAR(442) NULL,
    "DisplayName_L6" NVARCHAR(442) NULL,
    "I4J" BIGINT NULL,
    "I4K" BIGINT NULL,
    "I4L" BIGINT NULL,
    "C2B" NVARCHAR(442) NULL,
    "C2C" NVARCHAR(442) NULL,
    "C2D" NVARCHAR(442) NULL,
    "C2E" NVARCHAR(442) NULL,
    "C2F" NVARCHAR(442) NULL,
    "C2G" NVARCHAR(442) NULL,
    "C2H" NVARCHAR(442) NULL,
    "C2I" NVARCHAR(442) NULL,
    "C2J" NVARCHAR(442) NULL,
    "C2K" NVARCHAR(442) NULL,
    "C2L" NVARCHAR(442) NULL,
    "C2M" NVARCHAR(442) NULL,
    "C2N" NVARCHAR(442) NULL,
    "DisplayName_L7" NVARCHAR(442) NULL,
    "I4M" BIGINT NULL,
    "I4N" BIGINT NULL,
    "C2O" NVARCHAR(442) NULL,
    "C2P" NVARCHAR(442) NULL,
    "C2Q" NVARCHAR(442) NULL,
    "C2R" NVARCHAR(442) NULL,
    "C2S" NVARCHAR(442) NULL,
    "C2T" NVARCHAR(442) NULL,
    "C2U" NVARCHAR(442) NULL,
    "C2V" NVARCHAR(442) NULL,
    "C30" NVARCHAR(442) NULL,
    "C31" NVARCHAR(442) NULL,
    "C32" NVARCHAR(442) NULL,
    "C33" NVARCHAR(442) NULL,
    "C34" NVARCHAR(442) NULL,
    "C35" NVARCHAR(442) NULL,
    "C36" NVARCHAR(442) NULL,
    "DisplayName_L8" NVARCHAR(442) NULL,
    "I4O" BIGINT NULL,
    "C37" NVARCHAR(442) NULL,
    "C38" NVARCHAR(442) NULL,
    "C39" NVARCHAR(442) NULL,
    "C3A" NVARCHAR(442) NULL,
    "C3B" NVARCHAR(442) NULL,
    "C3C" NVARCHAR(442) NULL,
    "C3D" NVARCHAR(442) NULL,
    "C3E" NVARCHAR(442) NULL,
    "C3F" NVARCHAR(442) NULL,
    "C3G" NVARCHAR(442) NULL,
    "C3H" NVARCHAR(442) NULL,
    "C3I" NVARCHAR(442) NULL,
    "C3J" NVARCHAR(442) NULL,
    "C3K" NVARCHAR(442) NULL,
    "C3L" NVARCHAR(442) NULL,
    "C3M" NVARCHAR(442) NULL,
    "C3N" NVARCHAR(442) NULL,
    "C3O" NVARCHAR(442) NULL,
    "C3P" NVARCHAR(442) NULL,
    "C3Q" NVARCHAR(442) NULL,
    "C3R" NVARCHAR(442) NULL,
    "C3S" NVARCHAR(442) NULL,
    "C3T" NVARCHAR(442) NULL,
    "C3U" NVARCHAR(442) NULL,
    "C3V" NVARCHAR(442) NULL,
    "DisplayName_L9" NVARCHAR(442) NULL,
    "DisplayName_L10" NVARCHAR(442) NULL,
    "DisplayName_L11" NVARCHAR(442) NULL,
    "DisplayName_L12" NVARCHAR(442) NULL,
    "DisplayName_L13" NVARCHAR(442) NULL,
    "DisplayName_L14" NVARCHAR(442) NULL,
    "DisplayName_L15" NVARCHAR(442) NULL,
    "DisplayName_L16" NVARCHAR(442) NULL,
    CONSTRAINT "PK_Resources" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_Resources_Type" FOREIGN KEY ("Type") REFERENCES "UM_EntityTypes" ("Id")
);
GO
CREATE UNIQUE CLUSTERED INDEX "IX_Resources"
    ON "UR_Resources"("ValidTo" ASC, "Type" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)
GO
ALTER TABLE "UR_Resources" NOCHECK CONSTRAINT "FK_Resources_Type";
GO
CREATE INDEX "IX_Resources_DisplayName_L1"
    ON "UR_Resources" ("DisplayName_L1", "Id")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE NONCLUSTERED INDEX "IX_Resources_Dirty"
    ON "UR_Resources" ("Dirty" ASC)
WHERE "Dirty"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE STATISTICS "S_Resources_Type" ON "UR_Resources"("Type") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_Resources_PrimaryKey"
    ON "UR_Resources" ("Type", "PrimaryKey", "Id")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "PrimaryKey" IS NOT NULL WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_Resources_U0"
    ON "UR_Resources" ("Type", "U0", "Id")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "U0" IS NOT NULL WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_Resources_U1"
    ON "UR_Resources" ("Type", "U1", "Id")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "U1" IS NOT NULL WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_Resources_U2"
    ON "UR_Resources" ("Type", "U2", "Id")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "U2" IS NOT NULL WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_Resources_R0"
    ON "UR_Resources" ("Type", "R0", "Id")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "R0" IS NOT NULL WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE NONCLUSTERED INDEX "IX_Resources_History"
    ON "UR_Resources"("Type","Id","ValidTo")
    INCLUDE ("ValidFrom","DisplayName_L1","DisplayName_L2","DisplayName_L3","DisplayName_L4","DisplayName_L5","DisplayName_L6","DisplayName_L7","DisplayName_L8","DisplayName_L9","DisplayName_L10","DisplayName_L11","DisplayName_L12","DisplayName_L13","DisplayName_L14","DisplayName_L15","DisplayName_L16");

   GO
   CREATE TABLE "US_AccessCertificationCampaigns"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "StartDate" SMALLDATETIME NOT NULL,
    "CertificationEndDate" SMALLDATETIME NOT NULL,
    "OwnerEntityType_Id" BIGINT NOT NULL,
    "State" TINYINT CONSTRAINT "DF_AccessCertificationCampaigns_State" DEFAULT ((0)) NOT NULL,
    "ItemsCount" INT CONSTRAINT "DF_AccessCertificationCampaigns_ItemsCount" DEFAULT ((0)) NOT NULL,
    "CompletedItemsCount" INT CONSTRAINT "DF_AccessCertificationCampaigns_CompletedItemsCount" DEFAULT ((0)) NOT NULL,
    "LastNotificationDate" SMALLDATETIME NULL,
    "NotificationNeeded" BIT CONSTRAINT "DF_AccessCertificationCampaigns_NotificationNeeded" DEFAULT ((1)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_AccessCertificationCampaigns" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_AccessCertificationCampaigns_OwnerEntityType" FOREIGN KEY ("OwnerEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_AccessCertificationCampaigns_Policies" FOREIGN KEY ("Policy_Id") REFERENCES "US_AccessCertificationCampaignPolicies" ("Id"),
);

   GO
   CREATE TABLE "UW_ActivityTemplateStates" (
    "Id" BIGINT NOT NULL,
    "ActivityTemplate_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "ShortIdentifier" NVARCHAR(442) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "Interactive" BIT CONSTRAINT "DF_ActivityTemplateStates_Interactive" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_ActivityTemplateStates" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ActivityTemplateStates_ActivityTemplate" FOREIGN KEY ("ActivityTemplate_Id") REFERENCES "UW_ActivityTemplates" ("Id"),
    CONSTRAINT "U_ActivityTemplateStates_Identifier" UNIQUE ("Identifier"),
);
GO

/* FK loop */
ALTER TABLE "UW_ActivityTemplates" ADD CONSTRAINT "FK_ActivityTemplates_FirstState" FOREIGN KEY ("FirstState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id");

   GO
   CREATE TABLE "UW_Aspects" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Type" INT NOT NULL,
    "Priority" INT CONSTRAINT "DF_Aspects_Priority" DEFAULT ((0)) NOT NULL,
    "Binding_Id" BIGINT NULL,
    "HistorizeBinding_Id" BIGINT NULL,
    "ExpressionBinding_Id" BIGINT NULL,
    "P0" NVARCHAR(MAX) NULL,
    "P1" NVARCHAR(MAX) NULL,
    "P2" NVARCHAR(MAX) NULL,
    "P3" NVARCHAR(MAX) NULL,
    "P4" NVARCHAR(MAX) NULL,
    "P5" NVARCHAR(MAX) NULL,
    "P6" NVARCHAR(MAX) NULL,
    "P7" NVARCHAR(MAX) NULL,
    "P8" NVARCHAR(MAX) NULL,
    "P9" NVARCHAR(MAX) NULL,
    "P10" NVARCHAR(MAX) NULL,
    "P11" NVARCHAR(MAX) NULL,
    "P12" NVARCHAR(MAX) NULL,
    "P13" NVARCHAR(MAX) NULL,
    "P14" NVARCHAR(MAX) NULL,
    "P15" NVARCHAR(MAX) NULL,
    "P16" NVARCHAR(MAX) NULL,
    "P17" NVARCHAR(MAX) NULL,
    "P18" NVARCHAR(MAX) NULL,
    "P19" NVARCHAR(MAX) NULL,
    "P20" NVARCHAR(MAX) NULL,
    "P21" NVARCHAR(MAX) NULL,
    "P22" NVARCHAR(MAX) NULL,
    "P23" NVARCHAR(MAX) NULL,
    "P24" NVARCHAR(MAX) NULL,
    "P25" NVARCHAR(MAX) NULL,
    "P26" NVARCHAR(MAX) NULL,
    "P27" NVARCHAR(MAX) NULL,
    "P28" NVARCHAR(MAX) NULL,
    "P29" NVARCHAR(MAX) NULL,
    "P30" NVARCHAR(MAX) NULL,
    "P31" NVARCHAR(MAX) NULL,
    "P32" NVARCHAR(MAX) NULL,
    "P33" NVARCHAR(MAX) NULL,
    "IfExpression" NVARCHAR(MAX) NULL,
    CONSTRAINT "PK_Aspects" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Aspects_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_Aspects_HistorizeBinding" FOREIGN KEY ("HistorizeBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_Aspects_ExpressionBinding" FOREIGN KEY ("ExpressionBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "U_Aspects_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UW_HomonymEntityLinks"
(
    "Id" BIGINT NOT NULL,
    "FormEntityType_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    CONSTRAINT "PK_HomonymWorkflowLinks" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_HomonymWorkflowLinks_FormEntityType" FOREIGN KEY ("FormEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
);

   GO
   CREATE TABLE "UW_Workflows" (
    "Id" BIGINT NOT NULL,
    "VariablesType_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "IdentifierPrefix" NVARCHAR(16) NULL,
    CONSTRAINT "PK_Workflows" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Workflows_VariablesType" FOREIGN KEY ("VariablesType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "U_Workflows_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UA_AccessControlEntityProperties" (
    "Id" BIGINT NOT NULL,
    "VisibilityGroup_Id" BIGINT NULL,
    CONSTRAINT "PK_AccessControlEntityProperties" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AccessControlEntityProperties_EntityProperty" FOREIGN KEY ("Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_AccessControlEntityProperties_VisibilityGroup" FOREIGN KEY ("VisibilityGroup_Id") REFERENCES "UA_AccessControlPropertyGroups" ("Id"),
);

   GO
   CREATE TABLE "UA_AccessControlEntries" (
    "Id" BIGINT NOT NULL,
    "Rule_Id" BIGINT NOT NULL,
    "Permission_Id" BIGINT NOT NULL,
    "PropertyGroup_Id" BIGINT NULL,
    "IsPreCondition" BIT CONSTRAINT "DF_AccessControlEntries_IsPreCondition" DEFAULT ((1)) NOT NULL,
    "IsPostCondition" BIT CONSTRAINT "DF_AccessControlEntries_IsPostCondition" DEFAULT ((1)) NOT NULL,
    "CanExecute" BIT CONSTRAINT "DF_AccessControlEntries_CanExecute" DEFAULT ((0)) NOT NULL,
    "Notify" BIT CONSTRAINT "DF_AccessControlEntries_Notify" DEFAULT ((1)) NOT NULL,
    "Priority" INT CONSTRAINT "DF_AccessControlEntries_Priority" DEFAULT ((0)) NOT NULL,
    "FullAccessProperties" BIT CONSTRAINT "DF_AccessControlEntries_FullAccessProperties" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_AccessControlEntries" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AccessControlEntries_Rule" FOREIGN KEY ("Rule_Id") REFERENCES "UA_AccessControlRules" ("Id"),
    CONSTRAINT "FK_AccessControlEntries_Container" FOREIGN KEY ("Permission_Id") REFERENCES "UA_AccessControlPermissions" ("Id"),
    CONSTRAINT "FK_AccessControlEntries_PropertyGroup" FOREIGN KEY ("PropertyGroup_Id") REFERENCES "UA_AccessControlPropertyGroups" ("Id"),
);

   GO
   CREATE TABLE "UC_Connections" (
    "Id" BIGINT NOT NULL,
    "Connector_Id" BIGINT NOT NULL,
    "Package_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "RefreshSchemaDate" DATETIME NULL,
    "HasRefreshSchemaFailed" BIT CONSTRAINT "DF_Connections_HasRefreshSchemaFailed" DEFAULT ((0)) NOT NULL,
    "DeactivationExportFulfill" INT CONSTRAINT "DF_Connections_DeactivationExportFulfill" DEFAULT ((0)) NOT NULL,
    "Package521_Id" BIGINT NULL,
    CONSTRAINT "PK_Connections" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_Connections_Identifier" UNIQUE ("Identifier"),
    CONSTRAINT "FK_Connections_Connector" FOREIGN KEY ("Connector_Id") REFERENCES "UC_Connectors" ("Id"),
    CONSTRAINT "FK_Connections_Package" FOREIGN KEY ("Package_Id") REFERENCES "UC_ConnectionPackages" ("Id"),
);

   GO
   CREATE TABLE "UC_EntityPropertyMappings" (
    "Id" BIGINT NOT NULL,
    "IsPrimaryKey" BIT CONSTRAINT "DF_EntityPropertyMappings_IsPrimaryKey" DEFAULT ((0)) NOT NULL,
    "IsUniqueKey" BIT CONSTRAINT "DF_EntityPropertyMappings_IsUniqueKey" DEFAULT ((0)) NOT NULL,
    "UniqueKeyOrder" INT NULL,
    "ConnectionColumn" NVARCHAR(442) NULL,
    "Format" NVARCHAR(442) NULL,
    CONSTRAINT "PK_EntityPropertyMappings" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_EntityPropertyMappings_EntityProperty" FOREIGN KEY ("Id") REFERENCES "UM_EntityProperties" ("Id"),
);

   GO
   CREATE TABLE "UC_EntityTypeMappings" (
    "Id" BIGINT NOT NULL,
    "MaximumInsertedLines" INT CONSTRAINT "DF_EntityTypeMappings_MaximumInsertedLines" DEFAULT ((0)) NOT NULL,
    "MaximumDeletedLines" INT CONSTRAINT "DF_EntityTypeMappings_MaximumDeletedLines" DEFAULT ((0)) NOT NULL,
    "MaximumUpdatedLines" INT CONSTRAINT "DF_EntityTypeMappings_MaximumUpdatedLines" DEFAULT ((0)) NOT NULL,
    "MaxPercentageInsertedLines" INT CONSTRAINT "DF_EntityTypeMappings_MaxPercentageInsertedLines" DEFAULT ((0)) NOT NULL,
    "MaxPercentageDeletedLines" INT CONSTRAINT "DF_EntityTypeMappings_MaxPercentageDeletedLines" DEFAULT ((0)) NOT NULL,
    "MaxPercentageUpdatedLines" INT CONSTRAINT "DF_EntityTypeMappings_MaxPercentageUpdatedLines" DEFAULT ((0)) NOT NULL,
    "ResourceCount" INT CONSTRAINT "DF_EntityTypeMappings_ResourceCount" DEFAULT ((0)) NOT NULL,
    "Connector_Id" BIGINT NULL,
    "ConnectionTable" NVARCHAR(442) NULL,
    "C0" NVARCHAR(442) NULL,
    CONSTRAINT "PK_EntityTypeMappings" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_EntityTypeMappings_EntityType" FOREIGN KEY ("Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_EntityTypeMappings_Connector" FOREIGN KEY ("Connector_Id") REFERENCES "UC_Connectors" ("Id"),
);

   GO
   CREATE TABLE "UD_Scaffoldings"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Generator" INT CONSTRAINT "DF_Scaffoldings_Generator" DEFAULT ((0)) NOT NULL,
    "IsIncremental" BIT CONSTRAINT "DF_Scaffoldings_IsIncremental" DEFAULT ((0)) NOT NULL,
    "IsEnabled" BIT CONSTRAINT "DF_Scaffoldings_IsEnabled" DEFAULT ((1)) NOT NULL,
    "Package_Id" BIGINT NULL,
    "EntityType_Id" BIGINT NULL,
    "Profile_Id" BIGINT NULL,
    "Property_Id" BIGINT NULL,
    "Connector_Id" BIGINT NULL,
    "Workflow_Id" BIGINT NULL,
    "Agent_Id" BIGINT NULL,
    "Universe_Id" BIGINT NULL,
    "OldAlgorithm" BIT CONSTRAINT "DF_Scaffolding_OldAlgorithm" DEFAULT ((0)) NOT NULL,
    "JobIdentifier" NVARCHAR(442) NULL,
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
    CONSTRAINT "PK_Scaffoldings" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Scaffolding_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_Scaffolding_Profile" FOREIGN KEY ("Profile_Id") REFERENCES "UA_Profiles" ("Id"),
    CONSTRAINT "FK_Scaffolding_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_Scaffolding_Connector" FOREIGN KEY ("Connector_Id") REFERENCES "UC_Connectors" ("Id"),
    CONSTRAINT "FK_Scaffolding_Agent" FOREIGN KEY ("Agent_Id") REFERENCES "UC_Agents" ("Id"),
    CONSTRAINT "FK_Scaffolding_Workflow" FOREIGN KEY ("Workflow_Id") REFERENCES "UW_Workflows" ("Id"),
    CONSTRAINT "FK_Scaffolding_Universe" FOREIGN KEY ("Universe_Id") REFERENCES "UU_Universes" ("Id"),
    CONSTRAINT "FK_Scaffolding_Package" FOREIGN KEY ("Package_Id") REFERENCES "UC_ConnectionPackages" ("Id"),
    CONSTRAINT "U_Scaffoldings_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_DisplayTables"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "DisplayTableDesignElement_Id" BIGINT NOT NULL,
    "LinesPerPage" INT CONSTRAINT "DF_DisplayTables_PaginationLimit" DEFAULT ((15)) NOT NULL,
    "IsEntityTypeDefault" BIT CONSTRAINT "DF_DisplayTables_IsEntityTypeDefault" DEFAULT ((0)) NOT NULL,
    "HomonymEntityLink_Id" BIGINT NULL,
    "ParentProperty_Id" BIGINT NULL,
    CONSTRAINT "PK_DisplayTables" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_DisplayTables_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_DisplayTables_DisplayTableDesignElements" FOREIGN KEY ("DisplayTableDesignElement_Id") REFERENCES "UI_DisplayTableDesignElements" ("Id"),
    CONSTRAINT "FK_DisplayTables_HomonymEntityLink" FOREIGN KEY ("HomonymEntityLink_Id") REFERENCES "UW_HomonymEntityLinks" ("Id"),
    CONSTRAINT "FK_DisplayTables_ParentProperty" FOREIGN KEY ("ParentProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "CHK_DisplayTables_LinesPerPage" CHECK ("LinesPerPage" > 0),
    CONSTRAINT "U_DisplayTables_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_IndicatorItems" (
    "Id" BIGINT NOT NULL,
    "Indicator_Id" BIGINT NULL,
    "Value"               NVARCHAR (MAX) NULL,
    "Color"               NVARCHAR (7)   NOT NULL,
    "Priority"            INT            NOT NULL,
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
    CONSTRAINT "PK_IndicatorItems" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_IndicatorItems_Indicator" FOREIGN KEY ("Indicator_Id") REFERENCES "UI_Indicators" ("Id")
);
GO

   GO
   CREATE TABLE "UI_MenuItems"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "IsExpandedByDefault" BIT CONSTRAINT "DF_MenuItems_IsExpanded" DEFAULT ((1)) NOT NULL,
    "IsSelfForm" BIT CONSTRAINT "DF_MenuItems_IsSelfForm" DEFAULT ((0)) NOT NULL,
    "DisplayOrder" INT NOT NULL,
    "ParentMenuItem_Id" BIGINT NULL,
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
    "IconCode" VARCHAR(32) NULL,
    "EntityType_Id" BIGINT NULL,
    "Workflow_Id" BIGINT NULL,
    "ReportQuery_Id" BIGINT NULL,
    "URI" NVARCHAR(2048) NULL,
    CONSTRAINT "PK_MenuItems" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_MenuItems_Parent" FOREIGN KEY ("ParentMenuItem_Id") REFERENCES "UI_MenuItems" ("Id"),
    CONSTRAINT "FK_MenuItems_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_MenuItems_Workflow" FOREIGN KEY ("Workflow_Id") REFERENCES "UW_Workflows" ("Id"),
    CONSTRAINT "FK_MenuItems_ReportQuery" FOREIGN KEY ("ReportQuery_Id") REFERENCES "UQ_ReportQueries" ("Id"),
    CONSTRAINT "U_MenuItems_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_TileItems"
(
    "Id" BIGINT NOT NULL,
    "Tile_Id" BIGINT NOT NULL,
    "Binding_Id" BIGINT NOT NULL,
    "OptimizedBinding_Id" BIGINT NULL,
    "LineNumber" INT NOT NULL,
    "LineDisplayOrderIndicator" INT NOT NULL,
    "AddedMinutes" INT NULL,
    CONSTRAINT "PK_TileItems" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_TileItems_Tile" FOREIGN KEY ("Tile_Id") REFERENCES "UI_Tiles" ("Id"),
    CONSTRAINT "FK_TileItems_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_TileItems_OptimizedBinding" FOREIGN KEY ("OptimizedBinding_Id") REFERENCES "UM_Bindings" ("Id"),
);

   GO
   CREATE TABLE "UJ_JobInstances"
(
    "Id" BIGINT NOT NULL,
    "Job_Id" BIGINT NOT NULL,
    "StartDate" DATETIME NOT NULL,
    "EndDate" DATETIME NULL,
    "LastProgressUpdate" DATETIME NOT NULL,
    "CurrentLaunch" INT NOT NULL,
    "TotalLaunch" INT NOT NULL,
    "State" SMALLINT NOT NULL,
    "User_Id" BIGINT NULL,
    "CancelRequested" BIT CONSTRAINT "DF_JobInstances_CancelRequested" DEFAULT (0) NOT NULL,
    "Retry" BIT CONSTRAINT "DF_JobInstances_Retry" DEFAULT (0) NOT NULL,
    "JobDefinition" NVARCHAR(MAX) NULL,
    CONSTRAINT "PK_JobInstances" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_Jobs" FOREIGN KEY ("Job_Id") REFERENCES "UJ_Jobs" ("Id"),
);
GO
CREATE INDEX "IX_JobInstances_CancelRequested" ON "UJ_JobInstances" ("Id") WHERE "CancelRequested"=0;
GO

   GO
   CREATE TABLE "UM_BindingItems"
(
    "Id" BIGINT NOT NULL,
    "Binding_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "Order" INT NOT NULL,
    CONSTRAINT "PK_BindingItems" PRIMARY KEY CLUSTERED ("Binding_Id", "Order", "Id" ASC),
    CONSTRAINT "UK_BindingItems" UNIQUE ("Id" ASC),
    CONSTRAINT "FK_BindingItems_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_BindingItems_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id")
);

   GO
   CREATE TABLE "UM_Dimensions"
(
    "Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ColumnMapping" INT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "IsHierarchical" BIT CONSTRAINT "DF_Dimensions_IsHierarchical" DEFAULT ((0)) NOT NULL,
    "IsExcludedFromRoleMining" BIT CONSTRAINT "DF_Dimensions_IsExcludedFromRoleMining" DEFAULT ((0)) NOT NULL,
    "ParentProperty_Id" BIGINT NULL,
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
    CONSTRAINT "PK_Dimensions" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Dimensions_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_Dimensions_ParentProperty" FOREIGN KEY ("ParentProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "U_Dimensions_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UM_EntityAssociations" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "Property1_Id" BIGINT NOT NULL,
    "Property2_Id" BIGINT NOT NULL,
    "IsProperty1Collection" BIT CONSTRAINT "DF_EntityAssociations_IsProperty1Collection" DEFAULT ((0)) NOT NULL,
    "IsProperty2Collection" BIT CONSTRAINT "DF_EntityAssociations_IsProperty2Collection" DEFAULT ((0)) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_EntityAssociations_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_EntityAssociations_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
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
    CONSTRAINT "PK_EntityAssociations" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_EntityAssociations_Property1" FOREIGN KEY ("Property1_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_EntityAssociations_Property2" FOREIGN KEY ("Property2_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "U_EntityAssociations_Identifier" UNIQUE ("Identifier", "ValidTo"),
);
GO
CREATE CLUSTERED INDEX "IX_EntityAssociations" ON "UM_EntityAssociations" ("ValidTo" ASC, "Id" ASC);

   GO
   CREATE TABLE "UM_EntityPropertyExpressions"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "Priority" INT CONSTRAINT "DF_EntityPropertyExpressions_Priority" DEFAULT ((0)) NOT NULL,
    "Binding_Id" BIGINT NULL,
    "PropertyCriteria_Id" BIGINT NULL,
    "Expression" VARCHAR(4000) NULL,
    CONSTRAINT "PK_EntityPropertyExpressions" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_EntityPropertyExpressions_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_EntityPropertyExpressions_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_EntityPropertyExpressions_PropertyCriteria" FOREIGN KEY ("PropertyCriteria_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_EntityPropertyExpressions_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "U_EntityPropertyExpressions_Identifier" UNIQUE ("Identifier"),
    CONSTRAINT "U_EntityPropertyExpressions_EntityType_Property" UNIQUE ("EntityType_Id", "Property_Id"),
);
GO
CREATE INDEX "IX_EntityPropertyExpressions" ON "UM_EntityPropertyExpressions" ("Property_Id" ASC);
GO

   GO
   CREATE TABLE "UN_NotificationInstances" (
    "Notification_Id" BIGINT NOT NULL,
    "OwnerResource_Id" BIGINT NOT NULL,
    "LastExecutionDate" DATETIME NOT NULL,
    CONSTRAINT "FK_NotificationInstances_Notification" FOREIGN KEY ("Notification_Id") REFERENCES "UN_Notifications" ("Id"),
);

   GO
   CREATE TABLE "UP_CompositeRoles"
(
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Category_Id" BIGINT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_CompositeRoles_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_CompositeRoles_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "MaxDuration" INT NULL,
    "GracePeriod" INT NULL,
    "ProlongationWithoutApproval" TINYINT CONSTRAINT "DF_CompositeRoles_ProlongationWithoutApproval" DEFAULT ((0)) NOT NULL,
    "P0" BIT CONSTRAINT "DF_CompositeRoles_P0" DEFAULT ((0)) NOT NULL,
    "P1" BIT CONSTRAINT "DF_CompositeRoles_P1" DEFAULT ((0)) NOT NULL,
    "P2" BIT CONSTRAINT "DF_CompositeRoles_P2" DEFAULT ((0)) NOT NULL,
    "P3" BIT CONSTRAINT "DF_CompositeRoles_P3" DEFAULT ((0)) NOT NULL,
    "P4" BIT CONSTRAINT "DF_CompositeRoles_P4" DEFAULT ((0)) NOT NULL,
    "P5" BIT CONSTRAINT "DF_CompositeRoles_P5" DEFAULT ((0)) NOT NULL,
    "P6" BIT CONSTRAINT "DF_CompositeRoles_P6" DEFAULT ((0)) NOT NULL,
    "P7" BIT CONSTRAINT "DF_CompositeRoles_P7" DEFAULT ((0)) NOT NULL,
    "P8" BIT CONSTRAINT "DF_CompositeRoles_P8" DEFAULT ((0)) NOT NULL,
    "P9" BIT CONSTRAINT "DF_CompositeRoles_P9" DEFAULT ((0)) NOT NULL,
    "PA" BIT CONSTRAINT "DF_CompositeRoles_PA" DEFAULT ((0)) NOT NULL,
    "PB" BIT CONSTRAINT "DF_CompositeRoles_PB" DEFAULT ((0)) NOT NULL,
    "PC" BIT CONSTRAINT "DF_CompositeRoles_PC" DEFAULT ((0)) NOT NULL,
    "PD" BIT CONSTRAINT "DF_CompositeRoles_PD" DEFAULT ((0)) NOT NULL,
    "PE" BIT CONSTRAINT "DF_CompositeRoles_PE" DEFAULT ((0)) NOT NULL,
    "PF" BIT CONSTRAINT "DF_CompositeRoles_PF" DEFAULT ((0)) NOT NULL,
    "PG" BIT CONSTRAINT "DF_CompositeRoles_PG" DEFAULT ((0)) NOT NULL,
    "PH" BIT CONSTRAINT "DF_CompositeRoles_PH" DEFAULT ((0)) NOT NULL,
    "PI" BIT CONSTRAINT "DF_CompositeRoles_PI" DEFAULT ((0)) NOT NULL,
    "PJ" BIT CONSTRAINT "DF_CompositeRoles_PJ" DEFAULT ((0)) NOT NULL,
    "PK" BIT CONSTRAINT "DF_CompositeRoles_PK" DEFAULT ((0)) NOT NULL,
    "PL" BIT CONSTRAINT "DF_CompositeRoles_PL" DEFAULT ((0)) NOT NULL,
    "PM" BIT CONSTRAINT "DF_CompositeRoles_PM" DEFAULT ((0)) NOT NULL,
    "PN" BIT CONSTRAINT "DF_CompositeRoles_PN" DEFAULT ((0)) NOT NULL,
    "PO" BIT CONSTRAINT "DF_CompositeRoles_PO" DEFAULT ((0)) NOT NULL,
    "PP" BIT CONSTRAINT "DF_CompositeRoles_PP" DEFAULT ((0)) NOT NULL,
    "PQ" BIT CONSTRAINT "DF_CompositeRoles_PQ" DEFAULT ((0)) NOT NULL,
    "PR" BIT CONSTRAINT "DF_CompositeRoles_PR" DEFAULT ((0)) NOT NULL,
    "PS" BIT CONSTRAINT "DF_CompositeRoles_PS" DEFAULT ((0)) NOT NULL,
    "PT" BIT CONSTRAINT "DF_CompositeRoles_PT" DEFAULT ((0)) NOT NULL,
    "PU" BIT CONSTRAINT "DF_CompositeRoles_PU" DEFAULT ((0)) NOT NULL,
    "PV" BIT CONSTRAINT "DF_CompositeRoles_PV" DEFAULT ((0)) NOT NULL,
    "P10" BIT CONSTRAINT "DF_CompositeRoles_P10" DEFAULT ((0)) NOT NULL,
    "P11" BIT CONSTRAINT "DF_CompositeRoles_P11" DEFAULT ((0)) NOT NULL,
    "P12" BIT CONSTRAINT "DF_CompositeRoles_P12" DEFAULT ((0)) NOT NULL,
    "P13" BIT CONSTRAINT "DF_CompositeRoles_P13" DEFAULT ((0)) NOT NULL,
    "P14" BIT CONSTRAINT "DF_CompositeRoles_P14" DEFAULT ((0)) NOT NULL,
    "P15" BIT CONSTRAINT "DF_CompositeRoles_P15" DEFAULT ((0)) NOT NULL,
    "P16" BIT CONSTRAINT "DF_CompositeRoles_P16" DEFAULT ((0)) NOT NULL,
    "P17" BIT CONSTRAINT "DF_CompositeRoles_P17" DEFAULT ((0)) NOT NULL,
    "P18" BIT CONSTRAINT "DF_CompositeRoles_P18" DEFAULT ((0)) NOT NULL,
    "P19" BIT CONSTRAINT "DF_CompositeRoles_P19" DEFAULT ((0)) NOT NULL,
    "P1A" BIT CONSTRAINT "DF_CompositeRoles_P1A" DEFAULT ((0)) NOT NULL,
    "P1B" BIT CONSTRAINT "DF_CompositeRoles_P1B" DEFAULT ((0)) NOT NULL,
    "P1C" BIT CONSTRAINT "DF_CompositeRoles_P1C" DEFAULT ((0)) NOT NULL,
    "P1D" BIT CONSTRAINT "DF_CompositeRoles_P1D" DEFAULT ((0)) NOT NULL,
    "P1E" BIT CONSTRAINT "DF_CompositeRoles_P1E" DEFAULT ((0)) NOT NULL,
    "P1F" BIT CONSTRAINT "DF_CompositeRoles_P1F" DEFAULT ((0)) NOT NULL,
    "P1G" BIT CONSTRAINT "DF_CompositeRoles_P1G" DEFAULT ((0)) NOT NULL,
    "P1H" BIT CONSTRAINT "DF_CompositeRoles_P1H" DEFAULT ((0)) NOT NULL,
    "P1I" BIT CONSTRAINT "DF_CompositeRoles_P1I" DEFAULT ((0)) NOT NULL,
    "P1J" BIT CONSTRAINT "DF_CompositeRoles_P1J" DEFAULT ((0)) NOT NULL,
    "P1K" BIT CONSTRAINT "DF_CompositeRoles_P1K" DEFAULT ((0)) NOT NULL,
    "P1L" BIT CONSTRAINT "DF_CompositeRoles_P1L" DEFAULT ((0)) NOT NULL,
    "P1M" BIT CONSTRAINT "DF_CompositeRoles_P1M" DEFAULT ((0)) NOT NULL,
    "P1N" BIT CONSTRAINT "DF_CompositeRoles_P1N" DEFAULT ((0)) NOT NULL,
    "P1O" BIT CONSTRAINT "DF_CompositeRoles_P1O" DEFAULT ((0)) NOT NULL,
    "P1P" BIT CONSTRAINT "DF_CompositeRoles_P1P" DEFAULT ((0)) NOT NULL,
    "P1Q" BIT CONSTRAINT "DF_CompositeRoles_P1Q" DEFAULT ((0)) NOT NULL,
    "P1R" BIT CONSTRAINT "DF_CompositeRoles_P1R" DEFAULT ((0)) NOT NULL,
    "P1S" BIT CONSTRAINT "DF_CompositeRoles_P1S" DEFAULT ((0)) NOT NULL,
    "P1T" BIT CONSTRAINT "DF_CompositeRoles_P1T" DEFAULT ((0)) NOT NULL,
    "P1U" BIT CONSTRAINT "DF_CompositeRoles_P1U" DEFAULT ((0)) NOT NULL,
    "P1V" BIT CONSTRAINT "DF_CompositeRoles_P1V" DEFAULT ((0)) NOT NULL,
    "P20" BIT CONSTRAINT "DF_CompositeRoles_P20" DEFAULT ((0)) NOT NULL,
    "P21" BIT CONSTRAINT "DF_CompositeRoles_P21" DEFAULT ((0)) NOT NULL,
    "P22" BIT CONSTRAINT "DF_CompositeRoles_P22" DEFAULT ((0)) NOT NULL,
    "P23" BIT CONSTRAINT "DF_CompositeRoles_P23" DEFAULT ((0)) NOT NULL,
    "P24" BIT CONSTRAINT "DF_CompositeRoles_P24" DEFAULT ((0)) NOT NULL,
    "P25" BIT CONSTRAINT "DF_CompositeRoles_P25" DEFAULT ((0)) NOT NULL,
    "P26" BIT CONSTRAINT "DF_CompositeRoles_P26" DEFAULT ((0)) NOT NULL,
    "P27" BIT CONSTRAINT "DF_CompositeRoles_P27" DEFAULT ((0)) NOT NULL,
    "P28" BIT CONSTRAINT "DF_CompositeRoles_P28" DEFAULT ((0)) NOT NULL,
    "P29" BIT CONSTRAINT "DF_CompositeRoles_P29" DEFAULT ((0)) NOT NULL,
    "P2A" BIT CONSTRAINT "DF_CompositeRoles_P2A" DEFAULT ((0)) NOT NULL,
    "P2B" BIT CONSTRAINT "DF_CompositeRoles_P2B" DEFAULT ((0)) NOT NULL,
    "P2C" BIT CONSTRAINT "DF_CompositeRoles_P2C" DEFAULT ((0)) NOT NULL,
    "P2D" BIT CONSTRAINT "DF_CompositeRoles_P2D" DEFAULT ((0)) NOT NULL,
    "P2E" BIT CONSTRAINT "DF_CompositeRoles_P2E" DEFAULT ((0)) NOT NULL,
    "P2F" BIT CONSTRAINT "DF_CompositeRoles_P2F" DEFAULT ((0)) NOT NULL,
    "P2G" BIT CONSTRAINT "DF_CompositeRoles_P2G" DEFAULT ((0)) NOT NULL,
    "P2H" BIT CONSTRAINT "DF_CompositeRoles_P2H" DEFAULT ((0)) NOT NULL,
    "P2I" BIT CONSTRAINT "DF_CompositeRoles_P2I" DEFAULT ((0)) NOT NULL,
    "P2J" BIT CONSTRAINT "DF_CompositeRoles_P2J" DEFAULT ((0)) NOT NULL,
    "P2K" BIT CONSTRAINT "DF_CompositeRoles_P2K" DEFAULT ((0)) NOT NULL,
    "P2L" BIT CONSTRAINT "DF_CompositeRoles_P2L" DEFAULT ((0)) NOT NULL,
    "P2M" BIT CONSTRAINT "DF_CompositeRoles_P2M" DEFAULT ((0)) NOT NULL,
    "P2N" BIT CONSTRAINT "DF_CompositeRoles_P2N" DEFAULT ((0)) NOT NULL,
    "P2O" BIT CONSTRAINT "DF_CompositeRoles_P2O" DEFAULT ((0)) NOT NULL,
    "P2P" BIT CONSTRAINT "DF_CompositeRoles_P2P" DEFAULT ((0)) NOT NULL,
    "P2Q" BIT CONSTRAINT "DF_CompositeRoles_P2Q" DEFAULT ((0)) NOT NULL,
    "P2R" BIT CONSTRAINT "DF_CompositeRoles_P2R" DEFAULT ((0)) NOT NULL,
    "P2S" BIT CONSTRAINT "DF_CompositeRoles_P2S" DEFAULT ((0)) NOT NULL,
    "P2T" BIT CONSTRAINT "DF_CompositeRoles_P2T" DEFAULT ((0)) NOT NULL,
    "P2U" BIT CONSTRAINT "DF_CompositeRoles_P2U" DEFAULT ((0)) NOT NULL,
    "P2V" BIT CONSTRAINT "DF_CompositeRoles_P2V" DEFAULT ((0)) NOT NULL,
    "P30" BIT CONSTRAINT "DF_CompositeRoles_P30" DEFAULT ((0)) NOT NULL,
    "P31" BIT CONSTRAINT "DF_CompositeRoles_P31" DEFAULT ((0)) NOT NULL,
    "P32" BIT CONSTRAINT "DF_CompositeRoles_P32" DEFAULT ((0)) NOT NULL,
    "P33" BIT CONSTRAINT "DF_CompositeRoles_P33" DEFAULT ((0)) NOT NULL,
    "P34" BIT CONSTRAINT "DF_CompositeRoles_P34" DEFAULT ((0)) NOT NULL,
    "P35" BIT CONSTRAINT "DF_CompositeRoles_P35" DEFAULT ((0)) NOT NULL,
    "P36" BIT CONSTRAINT "DF_CompositeRoles_P36" DEFAULT ((0)) NOT NULL,
    "P37" BIT CONSTRAINT "DF_CompositeRoles_P37" DEFAULT ((0)) NOT NULL,
    "P38" BIT CONSTRAINT "DF_CompositeRoles_P38" DEFAULT ((0)) NOT NULL,
    "P39" BIT CONSTRAINT "DF_CompositeRoles_P39" DEFAULT ((0)) NOT NULL,
    "P3A" BIT CONSTRAINT "DF_CompositeRoles_P3A" DEFAULT ((0)) NOT NULL,
    "P3B" BIT CONSTRAINT "DF_CompositeRoles_P3B" DEFAULT ((0)) NOT NULL,
    "P3C" BIT CONSTRAINT "DF_CompositeRoles_P3C" DEFAULT ((0)) NOT NULL,
    "P3D" BIT CONSTRAINT "DF_CompositeRoles_P3D" DEFAULT ((0)) NOT NULL,
    "P3E" BIT CONSTRAINT "DF_CompositeRoles_P3E" DEFAULT ((0)) NOT NULL,
    "P3F" BIT CONSTRAINT "DF_CompositeRoles_P3F" DEFAULT ((0)) NOT NULL,
    "P3G" BIT CONSTRAINT "DF_CompositeRoles_P3G" DEFAULT ((0)) NOT NULL,
    "P3H" BIT CONSTRAINT "DF_CompositeRoles_P3H" DEFAULT ((0)) NOT NULL,
    "P3I" BIT CONSTRAINT "DF_CompositeRoles_P3I" DEFAULT ((0)) NOT NULL,
    "P3J" BIT CONSTRAINT "DF_CompositeRoles_P3J" DEFAULT ((0)) NOT NULL,
    "P3K" BIT CONSTRAINT "DF_CompositeRoles_P3K" DEFAULT ((0)) NOT NULL,
    "P3L" BIT CONSTRAINT "DF_CompositeRoles_P3L" DEFAULT ((0)) NOT NULL,
    "P3M" BIT CONSTRAINT "DF_CompositeRoles_P3M" DEFAULT ((0)) NOT NULL,
    "P3N" BIT CONSTRAINT "DF_CompositeRoles_P3N" DEFAULT ((0)) NOT NULL,
    "P3O" BIT CONSTRAINT "DF_CompositeRoles_P3O" DEFAULT ((0)) NOT NULL,
    "P3P" BIT CONSTRAINT "DF_CompositeRoles_P3P" DEFAULT ((0)) NOT NULL,
    "P3Q" BIT CONSTRAINT "DF_CompositeRoles_P3Q" DEFAULT ((0)) NOT NULL,
    "P3R" BIT CONSTRAINT "DF_CompositeRoles_P3R" DEFAULT ((0)) NOT NULL,
    "P3S" BIT CONSTRAINT "DF_CompositeRoles_P3S" DEFAULT ((0)) NOT NULL,
    "P3T" BIT CONSTRAINT "DF_CompositeRoles_P3T" DEFAULT ((0)) NOT NULL,
    "P3U" BIT CONSTRAINT "DF_CompositeRoles_P3U" DEFAULT ((0)) NOT NULL,
    "P3V" BIT CONSTRAINT "DF_CompositeRoles_P3V" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "BaseRole_Id" BIGINT NULL,
    "R0" BIT CONSTRAINT "DF_CompositeRoles_R0" DEFAULT ((0)) NOT NULL,
    "R1" BIT CONSTRAINT "DF_CompositeRoles_R1" DEFAULT ((0)) NOT NULL,
    "R2" BIT CONSTRAINT "DF_CompositeRoles_R2" DEFAULT ((0)) NOT NULL,
    "R3" BIT CONSTRAINT "DF_CompositeRoles_R3" DEFAULT ((0)) NOT NULL,
    "R4" BIT CONSTRAINT "DF_CompositeRoles_R4" DEFAULT ((0)) NOT NULL,
    "R5" BIT CONSTRAINT "DF_CompositeRoles_R5" DEFAULT ((0)) NOT NULL,
    "R6" BIT CONSTRAINT "DF_CompositeRoles_R6" DEFAULT ((0)) NOT NULL,
    "R7" BIT CONSTRAINT "DF_CompositeRoles_R7" DEFAULT ((0)) NOT NULL,
    "R8" BIT CONSTRAINT "DF_CompositeRoles_R8" DEFAULT ((0)) NOT NULL,
    "R9" BIT CONSTRAINT "DF_CompositeRoles_R9" DEFAULT ((0)) NOT NULL,
    "RA" BIT CONSTRAINT "DF_CompositeRoles_RA" DEFAULT ((0)) NOT NULL,
    "RB" BIT CONSTRAINT "DF_CompositeRoles_RB" DEFAULT ((0)) NOT NULL,
    "RC" BIT CONSTRAINT "DF_CompositeRoles_RC" DEFAULT ((0)) NOT NULL,
    "RD" BIT CONSTRAINT "DF_CompositeRoles_RD" DEFAULT ((0)) NOT NULL,
    "RE" BIT CONSTRAINT "DF_CompositeRoles_RE" DEFAULT ((0)) NOT NULL,
    "RF" BIT CONSTRAINT "DF_CompositeRoles_RF" DEFAULT ((0)) NOT NULL,
    "RG" BIT CONSTRAINT "DF_CompositeRoles_RG" DEFAULT ((0)) NOT NULL,
    "RH" BIT CONSTRAINT "DF_CompositeRoles_RH" DEFAULT ((0)) NOT NULL,
    "RI" BIT CONSTRAINT "DF_CompositeRoles_RI" DEFAULT ((0)) NOT NULL,
    "RJ" BIT CONSTRAINT "DF_CompositeRoles_RJ" DEFAULT ((0)) NOT NULL,
    "RK" BIT CONSTRAINT "DF_CompositeRoles_RK" DEFAULT ((0)) NOT NULL,
    "RL" BIT CONSTRAINT "DF_CompositeRoles_RL" DEFAULT ((0)) NOT NULL,
    "RM" BIT CONSTRAINT "DF_CompositeRoles_RM" DEFAULT ((0)) NOT NULL,
    "RN" BIT CONSTRAINT "DF_CompositeRoles_RN" DEFAULT ((0)) NOT NULL,
    "RO" BIT CONSTRAINT "DF_CompositeRoles_RO" DEFAULT ((0)) NOT NULL,
    "RP" BIT CONSTRAINT "DF_CompositeRoles_RP" DEFAULT ((0)) NOT NULL,
    "RQ" BIT CONSTRAINT "DF_CompositeRoles_RQ" DEFAULT ((0)) NOT NULL,
    "RR" BIT CONSTRAINT "DF_CompositeRoles_RR" DEFAULT ((0)) NOT NULL,
    "RS" BIT CONSTRAINT "DF_CompositeRoles_RS" DEFAULT ((0)) NOT NULL,
    "RT" BIT CONSTRAINT "DF_CompositeRoles_RT" DEFAULT ((0)) NOT NULL,
    "RU" BIT CONSTRAINT "DF_CompositeRoles_RU" DEFAULT ((0)) NOT NULL,
    "RV" BIT CONSTRAINT "DF_CompositeRoles_RV" DEFAULT ((0)) NOT NULL,
    "R10" BIT CONSTRAINT "DF_CompositeRoles_R10" DEFAULT ((0)) NOT NULL,
    "R11" BIT CONSTRAINT "DF_CompositeRoles_R11" DEFAULT ((0)) NOT NULL,
    "R12" BIT CONSTRAINT "DF_CompositeRoles_R12" DEFAULT ((0)) NOT NULL,
    "R13" BIT CONSTRAINT "DF_CompositeRoles_R13" DEFAULT ((0)) NOT NULL,
    "R14" BIT CONSTRAINT "DF_CompositeRoles_R14" DEFAULT ((0)) NOT NULL,
    "R15" BIT CONSTRAINT "DF_CompositeRoles_R15" DEFAULT ((0)) NOT NULL,
    "R16" BIT CONSTRAINT "DF_CompositeRoles_R16" DEFAULT ((0)) NOT NULL,
    "R17" BIT CONSTRAINT "DF_CompositeRoles_R17" DEFAULT ((0)) NOT NULL,
    "R18" BIT CONSTRAINT "DF_CompositeRoles_R18" DEFAULT ((0)) NOT NULL,
    "R19" BIT CONSTRAINT "DF_CompositeRoles_R19" DEFAULT ((0)) NOT NULL,
    "R1A" BIT CONSTRAINT "DF_CompositeRoles_R1A" DEFAULT ((0)) NOT NULL,
    "R1B" BIT CONSTRAINT "DF_CompositeRoles_R1B" DEFAULT ((0)) NOT NULL,
    "R1C" BIT CONSTRAINT "DF_CompositeRoles_R1C" DEFAULT ((0)) NOT NULL,
    "R1D" BIT CONSTRAINT "DF_CompositeRoles_R1D" DEFAULT ((0)) NOT NULL,
    "R1E" BIT CONSTRAINT "DF_CompositeRoles_R1E" DEFAULT ((0)) NOT NULL,
    "R1F" BIT CONSTRAINT "DF_CompositeRoles_R1F" DEFAULT ((0)) NOT NULL,
    "R1G" BIT CONSTRAINT "DF_CompositeRoles_R1G" DEFAULT ((0)) NOT NULL,
    "R1H" BIT CONSTRAINT "DF_CompositeRoles_R1H" DEFAULT ((0)) NOT NULL,
    "R1I" BIT CONSTRAINT "DF_CompositeRoles_R1I" DEFAULT ((0)) NOT NULL,
    "R1J" BIT CONSTRAINT "DF_CompositeRoles_R1J" DEFAULT ((0)) NOT NULL,
    "R1K" BIT CONSTRAINT "DF_CompositeRoles_R1K" DEFAULT ((0)) NOT NULL,
    "R1L" BIT CONSTRAINT "DF_CompositeRoles_R1L" DEFAULT ((0)) NOT NULL,
    "R1M" BIT CONSTRAINT "DF_CompositeRoles_R1M" DEFAULT ((0)) NOT NULL,
    "R1N" BIT CONSTRAINT "DF_CompositeRoles_R1N" DEFAULT ((0)) NOT NULL,
    "R1O" BIT CONSTRAINT "DF_CompositeRoles_R1O" DEFAULT ((0)) NOT NULL,
    "R1P" BIT CONSTRAINT "DF_CompositeRoles_R1P" DEFAULT ((0)) NOT NULL,
    "R1Q" BIT CONSTRAINT "DF_CompositeRoles_R1Q" DEFAULT ((0)) NOT NULL,
    "R1R" BIT CONSTRAINT "DF_CompositeRoles_R1R" DEFAULT ((0)) NOT NULL,
    "R1S" BIT CONSTRAINT "DF_CompositeRoles_R1S" DEFAULT ((0)) NOT NULL,
    "R1T" BIT CONSTRAINT "DF_CompositeRoles_R1T" DEFAULT ((0)) NOT NULL,
    "R1U" BIT CONSTRAINT "DF_CompositeRoles_R1U" DEFAULT ((0)) NOT NULL,
    "R1V" BIT CONSTRAINT "DF_CompositeRoles_R1V" DEFAULT ((0)) NOT NULL,
    "R20" BIT CONSTRAINT "DF_CompositeRoles_R20" DEFAULT ((0)) NOT NULL,
    "R21" BIT CONSTRAINT "DF_CompositeRoles_R21" DEFAULT ((0)) NOT NULL,
    "R22" BIT CONSTRAINT "DF_CompositeRoles_R22" DEFAULT ((0)) NOT NULL,
    "R23" BIT CONSTRAINT "DF_CompositeRoles_R23" DEFAULT ((0)) NOT NULL,
    "R24" BIT CONSTRAINT "DF_CompositeRoles_R24" DEFAULT ((0)) NOT NULL,
    "R25" BIT CONSTRAINT "DF_CompositeRoles_R25" DEFAULT ((0)) NOT NULL,
    "R26" BIT CONSTRAINT "DF_CompositeRoles_R26" DEFAULT ((0)) NOT NULL,
    "R27" BIT CONSTRAINT "DF_CompositeRoles_R27" DEFAULT ((0)) NOT NULL,
    "R28" BIT CONSTRAINT "DF_CompositeRoles_R28" DEFAULT ((0)) NOT NULL,
    "R29" BIT CONSTRAINT "DF_CompositeRoles_R29" DEFAULT ((0)) NOT NULL,
    "R2A" BIT CONSTRAINT "DF_CompositeRoles_R2A" DEFAULT ((0)) NOT NULL,
    "R2B" BIT CONSTRAINT "DF_CompositeRoles_R2B" DEFAULT ((0)) NOT NULL,
    "R2C" BIT CONSTRAINT "DF_CompositeRoles_R2C" DEFAULT ((0)) NOT NULL,
    "R2D" BIT CONSTRAINT "DF_CompositeRoles_R2D" DEFAULT ((0)) NOT NULL,
    "R2E" BIT CONSTRAINT "DF_CompositeRoles_R2E" DEFAULT ((0)) NOT NULL,
    "R2F" BIT CONSTRAINT "DF_CompositeRoles_R2F" DEFAULT ((0)) NOT NULL,
    "R2G" BIT CONSTRAINT "DF_CompositeRoles_R2G" DEFAULT ((0)) NOT NULL,
    "R2H" BIT CONSTRAINT "DF_CompositeRoles_R2H" DEFAULT ((0)) NOT NULL,
    "R2I" BIT CONSTRAINT "DF_CompositeRoles_R2I" DEFAULT ((0)) NOT NULL,
    "R2J" BIT CONSTRAINT "DF_CompositeRoles_R2J" DEFAULT ((0)) NOT NULL,
    "R2K" BIT CONSTRAINT "DF_CompositeRoles_R2K" DEFAULT ((0)) NOT NULL,
    "R2L" BIT CONSTRAINT "DF_CompositeRoles_R2L" DEFAULT ((0)) NOT NULL,
    "R2M" BIT CONSTRAINT "DF_CompositeRoles_R2M" DEFAULT ((0)) NOT NULL,
    "R2N" BIT CONSTRAINT "DF_CompositeRoles_R2N" DEFAULT ((0)) NOT NULL,
    "R2O" BIT CONSTRAINT "DF_CompositeRoles_R2O" DEFAULT ((0)) NOT NULL,
    "R2P" BIT CONSTRAINT "DF_CompositeRoles_R2P" DEFAULT ((0)) NOT NULL,
    "R2Q" BIT CONSTRAINT "DF_CompositeRoles_R2Q" DEFAULT ((0)) NOT NULL,
    "R2R" BIT CONSTRAINT "DF_CompositeRoles_R2R" DEFAULT ((0)) NOT NULL,
    "R2S" BIT CONSTRAINT "DF_CompositeRoles_R2S" DEFAULT ((0)) NOT NULL,
    "R2T" BIT CONSTRAINT "DF_CompositeRoles_R2T" DEFAULT ((0)) NOT NULL,
    "R2U" BIT CONSTRAINT "DF_CompositeRoles_R2U" DEFAULT ((0)) NOT NULL,
    "R2V" BIT CONSTRAINT "DF_CompositeRoles_R2V" DEFAULT ((0)) NOT NULL,
    "R30" BIT CONSTRAINT "DF_CompositeRoles_R30" DEFAULT ((0)) NOT NULL,
    "R31" BIT CONSTRAINT "DF_CompositeRoles_R31" DEFAULT ((0)) NOT NULL,
    "R32" BIT CONSTRAINT "DF_CompositeRoles_R32" DEFAULT ((0)) NOT NULL,
    "R33" BIT CONSTRAINT "DF_CompositeRoles_R33" DEFAULT ((0)) NOT NULL,
    "R34" BIT CONSTRAINT "DF_CompositeRoles_R34" DEFAULT ((0)) NOT NULL,
    "R35" BIT CONSTRAINT "DF_CompositeRoles_R35" DEFAULT ((0)) NOT NULL,
    "R36" BIT CONSTRAINT "DF_CompositeRoles_R36" DEFAULT ((0)) NOT NULL,
    "R37" BIT CONSTRAINT "DF_CompositeRoles_R37" DEFAULT ((0)) NOT NULL,
    "R38" BIT CONSTRAINT "DF_CompositeRoles_R38" DEFAULT ((0)) NOT NULL,
    "R39" BIT CONSTRAINT "DF_CompositeRoles_R39" DEFAULT ((0)) NOT NULL,
    "R3A" BIT CONSTRAINT "DF_CompositeRoles_R3A" DEFAULT ((0)) NOT NULL,
    "R3B" BIT CONSTRAINT "DF_CompositeRoles_R3B" DEFAULT ((0)) NOT NULL,
    "R3C" BIT CONSTRAINT "DF_CompositeRoles_R3C" DEFAULT ((0)) NOT NULL,
    "R3D" BIT CONSTRAINT "DF_CompositeRoles_R3D" DEFAULT ((0)) NOT NULL,
    "R3E" BIT CONSTRAINT "DF_CompositeRoles_R3E" DEFAULT ((0)) NOT NULL,
    "R3F" BIT CONSTRAINT "DF_CompositeRoles_R3F" DEFAULT ((0)) NOT NULL,
    "R3G" BIT CONSTRAINT "DF_CompositeRoles_R3G" DEFAULT ((0)) NOT NULL,
    "R3H" BIT CONSTRAINT "DF_CompositeRoles_R3H" DEFAULT ((0)) NOT NULL,
    "R3I" BIT CONSTRAINT "DF_CompositeRoles_R3I" DEFAULT ((0)) NOT NULL,
    "R3J" BIT CONSTRAINT "DF_CompositeRoles_R3J" DEFAULT ((0)) NOT NULL,
    "R3K" BIT CONSTRAINT "DF_CompositeRoles_R3K" DEFAULT ((0)) NOT NULL,
    "R3L" BIT CONSTRAINT "DF_CompositeRoles_R3L" DEFAULT ((0)) NOT NULL,
    "R3M" BIT CONSTRAINT "DF_CompositeRoles_R3M" DEFAULT ((0)) NOT NULL,
    "R3N" BIT CONSTRAINT "DF_CompositeRoles_R3N" DEFAULT ((0)) NOT NULL,
    "R3O" BIT CONSTRAINT "DF_CompositeRoles_R3O" DEFAULT ((0)) NOT NULL,
    "R3P" BIT CONSTRAINT "DF_CompositeRoles_R3P" DEFAULT ((0)) NOT NULL,
    "R3Q" BIT CONSTRAINT "DF_CompositeRoles_R3Q" DEFAULT ((0)) NOT NULL,
    "R3R" BIT CONSTRAINT "DF_CompositeRoles_R3R" DEFAULT ((0)) NOT NULL,
    "R3S" BIT CONSTRAINT "DF_CompositeRoles_R3S" DEFAULT ((0)) NOT NULL,
    "R3T" BIT CONSTRAINT "DF_CompositeRoles_R3T" DEFAULT ((0)) NOT NULL,
    "R3U" BIT CONSTRAINT "DF_CompositeRoles_R3U" DEFAULT ((0)) NOT NULL,
    "R3V" BIT CONSTRAINT "DF_CompositeRoles_R3V" DEFAULT ((0)) NOT NULL,
    "ApprovalWorkflowType" INT CONSTRAINT "DF_CompositeRoles_ApprovalWorkflowType" DEFAULT ((0)) NOT NULL,
    "HideOnSimplifiedView" BIT CONSTRAINT "DF_CompositeRoles_HideOnSimplifiedView" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_CompositeRoles_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnApproveInReview" TINYINT CONSTRAINT "DF_CompositeRoles_CommentActivationOnApproveInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeclineInReview" TINYINT CONSTRAINT "DF_CompositeRoles_CommentActivationOnDeclineInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeleteGapInReconciliation" TINYINT CONSTRAINT "DF_CompositeRoles_CommentActivationOnDeleteGapInReconciliation" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnKeepGapInReconciliation" TINYINT CONSTRAINT "DF_CompositeRoles_CommentActivationOnKeepGapInReconciliation" DEFAULT ((0)) NOT NULL,
    "ImplicitApproval" TINYINT CONSTRAINT "DF_CompositeRoles_ImplicitApproval" DEFAULT ((0)) NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
    "Tags" NVARCHAR(442) NULL,
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
    "FullName_L1" NVARCHAR(4000) NULL,
    "FullName_L2" NVARCHAR(4000) NULL,
    "FullName_L3" NVARCHAR(4000) NULL,
    "FullName_L4" NVARCHAR(4000) NULL,
    "FullName_L5" NVARCHAR(4000) NULL,
    "FullName_L6" NVARCHAR(4000) NULL,
    "FullName_L7" NVARCHAR(4000) NULL,
    "FullName_L8" NVARCHAR(4000) NULL,
    "FullName_L9" NVARCHAR(4000) NULL,
    "FullName_L10" NVARCHAR(4000) NULL,
    "FullName_L11" NVARCHAR(4000) NULL,
    "FullName_L12" NVARCHAR(4000) NULL,
    "FullName_L13" NVARCHAR(4000) NULL,
    "FullName_L14" NVARCHAR(4000) NULL,
    "FullName_L15" NVARCHAR(4000) NULL,
    "FullName_L16" NVARCHAR(4000) NULL,
    "Description_L1" NVARCHAR(1024) NULL,
    "Description_L2" NVARCHAR(1024) NULL,
    "Description_L3" NVARCHAR(1024) NULL,
    "Description_L4" NVARCHAR(1024) NULL,
    "Description_L5" NVARCHAR(1024) NULL,
    "Description_L6" NVARCHAR(1024) NULL,
    "Description_L7" NVARCHAR(1024) NULL,
    "Description_L8" NVARCHAR(1024) NULL,
    "Description_L9" NVARCHAR(1024) NULL,
    "Description_L10" NVARCHAR(1024) NULL,
    "Description_L11" NVARCHAR(1024) NULL,
    "Description_L12" NVARCHAR(1024) NULL,
    "Description_L13" NVARCHAR(1024) NULL,
    "Description_L14" NVARCHAR(1024) NULL,
    "Description_L15" NVARCHAR(1024) NULL,
    "Description_L16" NVARCHAR(1024) NULL,
    CONSTRAINT "PK_CompositeRoles" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_CompositeRoles_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_CompositeRoles_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_CompositeRoles_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "U_CompositeRoles_Identifier" UNIQUE ("Identifier","ValidTo"),
    CONSTRAINT "CHK_CompositeRoles_ApprovalWorkflowType" CHECK ("ApprovalWorkflowType"=(4) OR "ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0)),
    CONSTRAINT "CHK_CompositeRoles_EntityType" CHECK ("ValidTo"!=(CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) OR "Policy_Id" IS NOT NULL),
);
GO
CREATE CLUSTERED INDEX "IX_CompositeRoles" ON "UP_CompositeRoles" ("ValidTo" ASC, "Id" ASC);
GO
CREATE STATISTICS "S_CompositeRoles_Type" ON "UP_CompositeRoles"("EntityType_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_CompositeRoles_View_L1" ON "UP_CompositeRoles"("EntityType_Id","FullName_L1","Id") INCLUDE ("DisplayName_L1","Identifier","ApprovalWorkflowType","Policy_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
GO

   GO
   CREATE TABLE "UP_MiningRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,

    "IncludeNoValidation" BIT CONSTRAINT "DF_MiningRules_IncludeNoValidation" DEFAULT ((1)) NOT NULL,
    "IncludeSimpleValidation" BIT CONSTRAINT "DF_MiningRules_IncludeSimpleValidation" DEFAULT ((1)) NOT NULL,
    "IncludeDoubleValidation" BIT CONSTRAINT "DF_MiningRules_IncludeDoubleValidation" DEFAULT ((1)) NOT NULL,
    "IncludeTripleValidation" BIT CONSTRAINT "DF_MiningRules_IncludeTripleValidation" DEFAULT ((1)) NOT NULL,

    "RuleType" INT CONSTRAINT "DF_MiningRules_RuleType" DEFAULT((0)) NOT NULL,
    "RulePolicy_Id" BIGINT NULL,

    "PrecisionMinPercentage" FLOAT(24) CONSTRAINT "DF_MiningRules_PrecisionMinPercentage" DEFAULT((100.0)) NOT NULL,
    "FalsePositiveMaxPercentage" FLOAT(24) CONSTRAINT "DF_MiningRules_FalsePositiveMaxPercentage" DEFAULT((0.0)) NOT NULL,

    "Priority" INT CONSTRAINT "DF_MiningRules_Priority" DEFAULT((0)) NOT NULL,
    "ExcludeRole" BIT CONSTRAINT "DF_MiningRules_ExcludeRole" DEFAULT ((0)) NOT NULL,

    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_MiningRules_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_MiningRules_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,

    "Category_Id" BIGINT NULL,

    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_MiningRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_MiningRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_MiningRules_RulePolicy" FOREIGN KEY ("RulePolicy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_MiningRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_MiningRules_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
);
GO
CREATE CLUSTERED INDEX "IX_MiningRules" ON "UP_MiningRules" ("ValidTo" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_RecordSections" (
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "SourceEntityType_Id" BIGINT NOT NULL,
    "ResourceEntityType_Id" BIGINT NOT NULL,
    "ExtensionKind" INT CONSTRAINT "DF_RecordSections_ExtensionKind" DEFAULT ((0)) NOT NULL,
    "BoundaryKind" INT CONSTRAINT "DF_RecordSections_BoundaryKind" DEFAULT ((0)) NOT NULL,
    "IsDefaultBoundariesSection" BIT CONSTRAINT "DF_RecordSections_IsDefaultBoundariesSection" DEFAULT ((0)) NOT NULL,
    "StartProperty_Id" BIGINT NULL,
    "EndProperty_Id" BIGINT NULL,
    "SortKeyExpression" VARCHAR(4000) NULL,
    "ExtendedSortKey" VARCHAR(4000) NULL,
    "InstanceKeyExpression" VARCHAR(4000) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_RecordSections" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_RecordSections_SourceEntityType_Id" FOREIGN KEY ("SourceEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_RecordSections_ResourceEntityType_Id" FOREIGN KEY ("ResourceEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_RecordSections_StartProperty_Id" FOREIGN KEY ("StartProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_RecordSections_EndProperty_Id" FOREIGN KEY ("EndProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
);

   GO
   CREATE TABLE "UP_ResourceTypes"
(
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "Category_Id" BIGINT NULL,
    "SourceEntityType_Id" BIGINT NOT NULL,
    "TargetEntityType_Id" BIGINT NOT NULL,
    "FulfillHoursAheadOfTime" INT CONSTRAINT "DF_ResourceTypes_FulfillHoursAheadOfTime" DEFAULT ((0)) NOT NULL,
    "TransmittedStateValidityPeriod" INT CONSTRAINT "DF_ResourceTypes_TransmittedStateValidityPeriod" DEFAULT ((0)) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_ResourceTypes_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_ResourceTypes_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "MaxDuration" INT NULL,
    "GracePeriod" INT NULL,
    "ProlongationWithoutApproval" TINYINT CONSTRAINT "DF_ResourceTypes_ProlongationWithoutApproval" DEFAULT ((0)) NOT NULL,
    "P0" BIT CONSTRAINT "DF_ResourceTypes_P0" DEFAULT ((0)) NOT NULL,
    "P1" BIT CONSTRAINT "DF_ResourceTypes_P1" DEFAULT ((0)) NOT NULL,
    "P2" BIT CONSTRAINT "DF_ResourceTypes_P2" DEFAULT ((0)) NOT NULL,
    "P3" BIT CONSTRAINT "DF_ResourceTypes_P3" DEFAULT ((0)) NOT NULL,
    "P4" BIT CONSTRAINT "DF_ResourceTypes_P4" DEFAULT ((0)) NOT NULL,
    "P5" BIT CONSTRAINT "DF_ResourceTypes_P5" DEFAULT ((0)) NOT NULL,
    "P6" BIT CONSTRAINT "DF_ResourceTypes_P6" DEFAULT ((0)) NOT NULL,
    "P7" BIT CONSTRAINT "DF_ResourceTypes_P7" DEFAULT ((0)) NOT NULL,
    "P8" BIT CONSTRAINT "DF_ResourceTypes_P8" DEFAULT ((0)) NOT NULL,
    "P9" BIT CONSTRAINT "DF_ResourceTypes_P9" DEFAULT ((0)) NOT NULL,
    "PA" BIT CONSTRAINT "DF_ResourceTypes_PA" DEFAULT ((0)) NOT NULL,
    "PB" BIT CONSTRAINT "DF_ResourceTypes_PB" DEFAULT ((0)) NOT NULL,
    "PC" BIT CONSTRAINT "DF_ResourceTypes_PC" DEFAULT ((0)) NOT NULL,
    "PD" BIT CONSTRAINT "DF_ResourceTypes_PD" DEFAULT ((0)) NOT NULL,
    "PE" BIT CONSTRAINT "DF_ResourceTypes_PE" DEFAULT ((0)) NOT NULL,
    "PF" BIT CONSTRAINT "DF_ResourceTypes_PF" DEFAULT ((0)) NOT NULL,
    "PG" BIT CONSTRAINT "DF_ResourceTypes_PG" DEFAULT ((0)) NOT NULL,
    "PH" BIT CONSTRAINT "DF_ResourceTypes_PH" DEFAULT ((0)) NOT NULL,
    "PI" BIT CONSTRAINT "DF_ResourceTypes_PI" DEFAULT ((0)) NOT NULL,
    "PJ" BIT CONSTRAINT "DF_ResourceTypes_PJ" DEFAULT ((0)) NOT NULL,
    "PK" BIT CONSTRAINT "DF_ResourceTypes_PK" DEFAULT ((0)) NOT NULL,
    "PL" BIT CONSTRAINT "DF_ResourceTypes_PL" DEFAULT ((0)) NOT NULL,
    "PM" BIT CONSTRAINT "DF_ResourceTypes_PM" DEFAULT ((0)) NOT NULL,
    "PN" BIT CONSTRAINT "DF_ResourceTypes_PN" DEFAULT ((0)) NOT NULL,
    "PO" BIT CONSTRAINT "DF_ResourceTypes_PO" DEFAULT ((0)) NOT NULL,
    "PP" BIT CONSTRAINT "DF_ResourceTypes_PP" DEFAULT ((0)) NOT NULL,
    "PQ" BIT CONSTRAINT "DF_ResourceTypes_PQ" DEFAULT ((0)) NOT NULL,
    "PR" BIT CONSTRAINT "DF_ResourceTypes_PR" DEFAULT ((0)) NOT NULL,
    "PS" BIT CONSTRAINT "DF_ResourceTypes_PS" DEFAULT ((0)) NOT NULL,
    "PT" BIT CONSTRAINT "DF_ResourceTypes_PT" DEFAULT ((0)) NOT NULL,
    "PU" BIT CONSTRAINT "DF_ResourceTypes_PU" DEFAULT ((0)) NOT NULL,
    "PV" BIT CONSTRAINT "DF_ResourceTypes_PV" DEFAULT ((0)) NOT NULL,
    "P10" BIT CONSTRAINT "DF_ResourceTypes_P10" DEFAULT ((0)) NOT NULL,
    "P11" BIT CONSTRAINT "DF_ResourceTypes_P11" DEFAULT ((0)) NOT NULL,
    "P12" BIT CONSTRAINT "DF_ResourceTypes_P12" DEFAULT ((0)) NOT NULL,
    "P13" BIT CONSTRAINT "DF_ResourceTypes_P13" DEFAULT ((0)) NOT NULL,
    "P14" BIT CONSTRAINT "DF_ResourceTypes_P14" DEFAULT ((0)) NOT NULL,
    "P15" BIT CONSTRAINT "DF_ResourceTypes_P15" DEFAULT ((0)) NOT NULL,
    "P16" BIT CONSTRAINT "DF_ResourceTypes_P16" DEFAULT ((0)) NOT NULL,
    "P17" BIT CONSTRAINT "DF_ResourceTypes_P17" DEFAULT ((0)) NOT NULL,
    "P18" BIT CONSTRAINT "DF_ResourceTypes_P18" DEFAULT ((0)) NOT NULL,
    "P19" BIT CONSTRAINT "DF_ResourceTypes_P19" DEFAULT ((0)) NOT NULL,
    "P1A" BIT CONSTRAINT "DF_ResourceTypes_P1A" DEFAULT ((0)) NOT NULL,
    "P1B" BIT CONSTRAINT "DF_ResourceTypes_P1B" DEFAULT ((0)) NOT NULL,
    "P1C" BIT CONSTRAINT "DF_ResourceTypes_P1C" DEFAULT ((0)) NOT NULL,
    "P1D" BIT CONSTRAINT "DF_ResourceTypes_P1D" DEFAULT ((0)) NOT NULL,
    "P1E" BIT CONSTRAINT "DF_ResourceTypes_P1E" DEFAULT ((0)) NOT NULL,
    "P1F" BIT CONSTRAINT "DF_ResourceTypes_P1F" DEFAULT ((0)) NOT NULL,
    "P1G" BIT CONSTRAINT "DF_ResourceTypes_P1G" DEFAULT ((0)) NOT NULL,
    "P1H" BIT CONSTRAINT "DF_ResourceTypes_P1H" DEFAULT ((0)) NOT NULL,
    "P1I" BIT CONSTRAINT "DF_ResourceTypes_P1I" DEFAULT ((0)) NOT NULL,
    "P1J" BIT CONSTRAINT "DF_ResourceTypes_P1J" DEFAULT ((0)) NOT NULL,
    "P1K" BIT CONSTRAINT "DF_ResourceTypes_P1K" DEFAULT ((0)) NOT NULL,
    "P1L" BIT CONSTRAINT "DF_ResourceTypes_P1L" DEFAULT ((0)) NOT NULL,
    "P1M" BIT CONSTRAINT "DF_ResourceTypes_P1M" DEFAULT ((0)) NOT NULL,
    "P1N" BIT CONSTRAINT "DF_ResourceTypes_P1N" DEFAULT ((0)) NOT NULL,
    "P1O" BIT CONSTRAINT "DF_ResourceTypes_P1O" DEFAULT ((0)) NOT NULL,
    "P1P" BIT CONSTRAINT "DF_ResourceTypes_P1P" DEFAULT ((0)) NOT NULL,
    "P1Q" BIT CONSTRAINT "DF_ResourceTypes_P1Q" DEFAULT ((0)) NOT NULL,
    "P1R" BIT CONSTRAINT "DF_ResourceTypes_P1R" DEFAULT ((0)) NOT NULL,
    "P1S" BIT CONSTRAINT "DF_ResourceTypes_P1S" DEFAULT ((0)) NOT NULL,
    "P1T" BIT CONSTRAINT "DF_ResourceTypes_P1T" DEFAULT ((0)) NOT NULL,
    "P1U" BIT CONSTRAINT "DF_ResourceTypes_P1U" DEFAULT ((0)) NOT NULL,
    "P1V" BIT CONSTRAINT "DF_ResourceTypes_P1V" DEFAULT ((0)) NOT NULL,
    "P20" BIT CONSTRAINT "DF_ResourceTypes_P20" DEFAULT ((0)) NOT NULL,
    "P21" BIT CONSTRAINT "DF_ResourceTypes_P21" DEFAULT ((0)) NOT NULL,
    "P22" BIT CONSTRAINT "DF_ResourceTypes_P22" DEFAULT ((0)) NOT NULL,
    "P23" BIT CONSTRAINT "DF_ResourceTypes_P23" DEFAULT ((0)) NOT NULL,
    "P24" BIT CONSTRAINT "DF_ResourceTypes_P24" DEFAULT ((0)) NOT NULL,
    "P25" BIT CONSTRAINT "DF_ResourceTypes_P25" DEFAULT ((0)) NOT NULL,
    "P26" BIT CONSTRAINT "DF_ResourceTypes_P26" DEFAULT ((0)) NOT NULL,
    "P27" BIT CONSTRAINT "DF_ResourceTypes_P27" DEFAULT ((0)) NOT NULL,
    "P28" BIT CONSTRAINT "DF_ResourceTypes_P28" DEFAULT ((0)) NOT NULL,
    "P29" BIT CONSTRAINT "DF_ResourceTypes_P29" DEFAULT ((0)) NOT NULL,
    "P2A" BIT CONSTRAINT "DF_ResourceTypes_P2A" DEFAULT ((0)) NOT NULL,
    "P2B" BIT CONSTRAINT "DF_ResourceTypes_P2B" DEFAULT ((0)) NOT NULL,
    "P2C" BIT CONSTRAINT "DF_ResourceTypes_P2C" DEFAULT ((0)) NOT NULL,
    "P2D" BIT CONSTRAINT "DF_ResourceTypes_P2D" DEFAULT ((0)) NOT NULL,
    "P2E" BIT CONSTRAINT "DF_ResourceTypes_P2E" DEFAULT ((0)) NOT NULL,
    "P2F" BIT CONSTRAINT "DF_ResourceTypes_P2F" DEFAULT ((0)) NOT NULL,
    "P2G" BIT CONSTRAINT "DF_ResourceTypes_P2G" DEFAULT ((0)) NOT NULL,
    "P2H" BIT CONSTRAINT "DF_ResourceTypes_P2H" DEFAULT ((0)) NOT NULL,
    "P2I" BIT CONSTRAINT "DF_ResourceTypes_P2I" DEFAULT ((0)) NOT NULL,
    "P2J" BIT CONSTRAINT "DF_ResourceTypes_P2J" DEFAULT ((0)) NOT NULL,
    "P2K" BIT CONSTRAINT "DF_ResourceTypes_P2K" DEFAULT ((0)) NOT NULL,
    "P2L" BIT CONSTRAINT "DF_ResourceTypes_P2L" DEFAULT ((0)) NOT NULL,
    "P2M" BIT CONSTRAINT "DF_ResourceTypes_P2M" DEFAULT ((0)) NOT NULL,
    "P2N" BIT CONSTRAINT "DF_ResourceTypes_P2N" DEFAULT ((0)) NOT NULL,
    "P2O" BIT CONSTRAINT "DF_ResourceTypes_P2O" DEFAULT ((0)) NOT NULL,
    "P2P" BIT CONSTRAINT "DF_ResourceTypes_P2P" DEFAULT ((0)) NOT NULL,
    "P2Q" BIT CONSTRAINT "DF_ResourceTypes_P2Q" DEFAULT ((0)) NOT NULL,
    "P2R" BIT CONSTRAINT "DF_ResourceTypes_P2R" DEFAULT ((0)) NOT NULL,
    "P2S" BIT CONSTRAINT "DF_ResourceTypes_P2S" DEFAULT ((0)) NOT NULL,
    "P2T" BIT CONSTRAINT "DF_ResourceTypes_P2T" DEFAULT ((0)) NOT NULL,
    "P2U" BIT CONSTRAINT "DF_ResourceTypes_P2U" DEFAULT ((0)) NOT NULL,
    "P2V" BIT CONSTRAINT "DF_ResourceTypes_P2V" DEFAULT ((0)) NOT NULL,
    "P30" BIT CONSTRAINT "DF_ResourceTypes_P30" DEFAULT ((0)) NOT NULL,
    "P31" BIT CONSTRAINT "DF_ResourceTypes_P31" DEFAULT ((0)) NOT NULL,
    "P32" BIT CONSTRAINT "DF_ResourceTypes_P32" DEFAULT ((0)) NOT NULL,
    "P33" BIT CONSTRAINT "DF_ResourceTypes_P33" DEFAULT ((0)) NOT NULL,
    "P34" BIT CONSTRAINT "DF_ResourceTypes_P34" DEFAULT ((0)) NOT NULL,
    "P35" BIT CONSTRAINT "DF_ResourceTypes_P35" DEFAULT ((0)) NOT NULL,
    "P36" BIT CONSTRAINT "DF_ResourceTypes_P36" DEFAULT ((0)) NOT NULL,
    "P37" BIT CONSTRAINT "DF_ResourceTypes_P37" DEFAULT ((0)) NOT NULL,
    "P38" BIT CONSTRAINT "DF_ResourceTypes_P38" DEFAULT ((0)) NOT NULL,
    "P39" BIT CONSTRAINT "DF_ResourceTypes_P39" DEFAULT ((0)) NOT NULL,
    "P3A" BIT CONSTRAINT "DF_ResourceTypes_P3A" DEFAULT ((0)) NOT NULL,
    "P3B" BIT CONSTRAINT "DF_ResourceTypes_P3B" DEFAULT ((0)) NOT NULL,
    "P3C" BIT CONSTRAINT "DF_ResourceTypes_P3C" DEFAULT ((0)) NOT NULL,
    "P3D" BIT CONSTRAINT "DF_ResourceTypes_P3D" DEFAULT ((0)) NOT NULL,
    "P3E" BIT CONSTRAINT "DF_ResourceTypes_P3E" DEFAULT ((0)) NOT NULL,
    "P3F" BIT CONSTRAINT "DF_ResourceTypes_P3F" DEFAULT ((0)) NOT NULL,
    "P3G" BIT CONSTRAINT "DF_ResourceTypes_P3G" DEFAULT ((0)) NOT NULL,
    "P3H" BIT CONSTRAINT "DF_ResourceTypes_P3H" DEFAULT ((0)) NOT NULL,
    "P3I" BIT CONSTRAINT "DF_ResourceTypes_P3I" DEFAULT ((0)) NOT NULL,
    "P3J" BIT CONSTRAINT "DF_ResourceTypes_P3J" DEFAULT ((0)) NOT NULL,
    "P3K" BIT CONSTRAINT "DF_ResourceTypes_P3K" DEFAULT ((0)) NOT NULL,
    "P3L" BIT CONSTRAINT "DF_ResourceTypes_P3L" DEFAULT ((0)) NOT NULL,
    "P3M" BIT CONSTRAINT "DF_ResourceTypes_P3M" DEFAULT ((0)) NOT NULL,
    "P3N" BIT CONSTRAINT "DF_ResourceTypes_P3N" DEFAULT ((0)) NOT NULL,
    "P3O" BIT CONSTRAINT "DF_ResourceTypes_P3O" DEFAULT ((0)) NOT NULL,
    "P3P" BIT CONSTRAINT "DF_ResourceTypes_P3P" DEFAULT ((0)) NOT NULL,
    "P3Q" BIT CONSTRAINT "DF_ResourceTypes_P3Q" DEFAULT ((0)) NOT NULL,
    "P3R" BIT CONSTRAINT "DF_ResourceTypes_P3R" DEFAULT ((0)) NOT NULL,
    "P3S" BIT CONSTRAINT "DF_ResourceTypes_P3S" DEFAULT ((0)) NOT NULL,
    "P3T" BIT CONSTRAINT "DF_ResourceTypes_P3T" DEFAULT ((0)) NOT NULL,
    "P3U" BIT CONSTRAINT "DF_ResourceTypes_P3U" DEFAULT ((0)) NOT NULL,
    "P3V" BIT CONSTRAINT "DF_ResourceTypes_P3V" DEFAULT ((0)) NOT NULL,
    "R0" BIT CONSTRAINT "DF_ResourceTypes_R0" DEFAULT ((0)) NOT NULL,
    "R1" BIT CONSTRAINT "DF_ResourceTypes_R1" DEFAULT ((0)) NOT NULL,
    "R2" BIT CONSTRAINT "DF_ResourceTypes_R2" DEFAULT ((0)) NOT NULL,
    "R3" BIT CONSTRAINT "DF_ResourceTypes_R3" DEFAULT ((0)) NOT NULL,
    "R4" BIT CONSTRAINT "DF_ResourceTypes_R4" DEFAULT ((0)) NOT NULL,
    "R5" BIT CONSTRAINT "DF_ResourceTypes_R5" DEFAULT ((0)) NOT NULL,
    "R6" BIT CONSTRAINT "DF_ResourceTypes_R6" DEFAULT ((0)) NOT NULL,
    "R7" BIT CONSTRAINT "DF_ResourceTypes_R7" DEFAULT ((0)) NOT NULL,
    "R8" BIT CONSTRAINT "DF_ResourceTypes_R8" DEFAULT ((0)) NOT NULL,
    "R9" BIT CONSTRAINT "DF_ResourceTypes_R9" DEFAULT ((0)) NOT NULL,
    "RA" BIT CONSTRAINT "DF_ResourceTypes_RA" DEFAULT ((0)) NOT NULL,
    "RB" BIT CONSTRAINT "DF_ResourceTypes_RB" DEFAULT ((0)) NOT NULL,
    "RC" BIT CONSTRAINT "DF_ResourceTypes_RC" DEFAULT ((0)) NOT NULL,
    "RD" BIT CONSTRAINT "DF_ResourceTypes_RD" DEFAULT ((0)) NOT NULL,
    "RE" BIT CONSTRAINT "DF_ResourceTypes_RE" DEFAULT ((0)) NOT NULL,
    "RF" BIT CONSTRAINT "DF_ResourceTypes_RF" DEFAULT ((0)) NOT NULL,
    "RG" BIT CONSTRAINT "DF_ResourceTypes_RG" DEFAULT ((0)) NOT NULL,
    "RH" BIT CONSTRAINT "DF_ResourceTypes_RH" DEFAULT ((0)) NOT NULL,
    "RI" BIT CONSTRAINT "DF_ResourceTypes_RI" DEFAULT ((0)) NOT NULL,
    "RJ" BIT CONSTRAINT "DF_ResourceTypes_RJ" DEFAULT ((0)) NOT NULL,
    "RK" BIT CONSTRAINT "DF_ResourceTypes_RK" DEFAULT ((0)) NOT NULL,
    "RL" BIT CONSTRAINT "DF_ResourceTypes_RL" DEFAULT ((0)) NOT NULL,
    "RM" BIT CONSTRAINT "DF_ResourceTypes_RM" DEFAULT ((0)) NOT NULL,
    "RN" BIT CONSTRAINT "DF_ResourceTypes_RN" DEFAULT ((0)) NOT NULL,
    "RO" BIT CONSTRAINT "DF_ResourceTypes_RO" DEFAULT ((0)) NOT NULL,
    "RP" BIT CONSTRAINT "DF_ResourceTypes_RP" DEFAULT ((0)) NOT NULL,
    "RQ" BIT CONSTRAINT "DF_ResourceTypes_RQ" DEFAULT ((0)) NOT NULL,
    "RR" BIT CONSTRAINT "DF_ResourceTypes_RR" DEFAULT ((0)) NOT NULL,
    "RS" BIT CONSTRAINT "DF_ResourceTypes_RS" DEFAULT ((0)) NOT NULL,
    "RT" BIT CONSTRAINT "DF_ResourceTypes_RT" DEFAULT ((0)) NOT NULL,
    "RU" BIT CONSTRAINT "DF_ResourceTypes_RU" DEFAULT ((0)) NOT NULL,
    "RV" BIT CONSTRAINT "DF_ResourceTypes_RV" DEFAULT ((0)) NOT NULL,
    "R10" BIT CONSTRAINT "DF_ResourceTypes_R10" DEFAULT ((0)) NOT NULL,
    "R11" BIT CONSTRAINT "DF_ResourceTypes_R11" DEFAULT ((0)) NOT NULL,
    "R12" BIT CONSTRAINT "DF_ResourceTypes_R12" DEFAULT ((0)) NOT NULL,
    "R13" BIT CONSTRAINT "DF_ResourceTypes_R13" DEFAULT ((0)) NOT NULL,
    "R14" BIT CONSTRAINT "DF_ResourceTypes_R14" DEFAULT ((0)) NOT NULL,
    "R15" BIT CONSTRAINT "DF_ResourceTypes_R15" DEFAULT ((0)) NOT NULL,
    "R16" BIT CONSTRAINT "DF_ResourceTypes_R16" DEFAULT ((0)) NOT NULL,
    "R17" BIT CONSTRAINT "DF_ResourceTypes_R17" DEFAULT ((0)) NOT NULL,
    "R18" BIT CONSTRAINT "DF_ResourceTypes_R18" DEFAULT ((0)) NOT NULL,
    "R19" BIT CONSTRAINT "DF_ResourceTypes_R19" DEFAULT ((0)) NOT NULL,
    "R1A" BIT CONSTRAINT "DF_ResourceTypes_R1A" DEFAULT ((0)) NOT NULL,
    "R1B" BIT CONSTRAINT "DF_ResourceTypes_R1B" DEFAULT ((0)) NOT NULL,
    "R1C" BIT CONSTRAINT "DF_ResourceTypes_R1C" DEFAULT ((0)) NOT NULL,
    "R1D" BIT CONSTRAINT "DF_ResourceTypes_R1D" DEFAULT ((0)) NOT NULL,
    "R1E" BIT CONSTRAINT "DF_ResourceTypes_R1E" DEFAULT ((0)) NOT NULL,
    "R1F" BIT CONSTRAINT "DF_ResourceTypes_R1F" DEFAULT ((0)) NOT NULL,
    "R1G" BIT CONSTRAINT "DF_ResourceTypes_R1G" DEFAULT ((0)) NOT NULL,
    "R1H" BIT CONSTRAINT "DF_ResourceTypes_R1H" DEFAULT ((0)) NOT NULL,
    "R1I" BIT CONSTRAINT "DF_ResourceTypes_R1I" DEFAULT ((0)) NOT NULL,
    "R1J" BIT CONSTRAINT "DF_ResourceTypes_R1J" DEFAULT ((0)) NOT NULL,
    "R1K" BIT CONSTRAINT "DF_ResourceTypes_R1K" DEFAULT ((0)) NOT NULL,
    "R1L" BIT CONSTRAINT "DF_ResourceTypes_R1L" DEFAULT ((0)) NOT NULL,
    "R1M" BIT CONSTRAINT "DF_ResourceTypes_R1M" DEFAULT ((0)) NOT NULL,
    "R1N" BIT CONSTRAINT "DF_ResourceTypes_R1N" DEFAULT ((0)) NOT NULL,
    "R1O" BIT CONSTRAINT "DF_ResourceTypes_R1O" DEFAULT ((0)) NOT NULL,
    "R1P" BIT CONSTRAINT "DF_ResourceTypes_R1P" DEFAULT ((0)) NOT NULL,
    "R1Q" BIT CONSTRAINT "DF_ResourceTypes_R1Q" DEFAULT ((0)) NOT NULL,
    "R1R" BIT CONSTRAINT "DF_ResourceTypes_R1R" DEFAULT ((0)) NOT NULL,
    "R1S" BIT CONSTRAINT "DF_ResourceTypes_R1S" DEFAULT ((0)) NOT NULL,
    "R1T" BIT CONSTRAINT "DF_ResourceTypes_R1T" DEFAULT ((0)) NOT NULL,
    "R1U" BIT CONSTRAINT "DF_ResourceTypes_R1U" DEFAULT ((0)) NOT NULL,
    "R1V" BIT CONSTRAINT "DF_ResourceTypes_R1V" DEFAULT ((0)) NOT NULL,
    "R20" BIT CONSTRAINT "DF_ResourceTypes_R20" DEFAULT ((0)) NOT NULL,
    "R21" BIT CONSTRAINT "DF_ResourceTypes_R21" DEFAULT ((0)) NOT NULL,
    "R22" BIT CONSTRAINT "DF_ResourceTypes_R22" DEFAULT ((0)) NOT NULL,
    "R23" BIT CONSTRAINT "DF_ResourceTypes_R23" DEFAULT ((0)) NOT NULL,
    "R24" BIT CONSTRAINT "DF_ResourceTypes_R24" DEFAULT ((0)) NOT NULL,
    "R25" BIT CONSTRAINT "DF_ResourceTypes_R25" DEFAULT ((0)) NOT NULL,
    "R26" BIT CONSTRAINT "DF_ResourceTypes_R26" DEFAULT ((0)) NOT NULL,
    "R27" BIT CONSTRAINT "DF_ResourceTypes_R27" DEFAULT ((0)) NOT NULL,
    "R28" BIT CONSTRAINT "DF_ResourceTypes_R28" DEFAULT ((0)) NOT NULL,
    "R29" BIT CONSTRAINT "DF_ResourceTypes_R29" DEFAULT ((0)) NOT NULL,
    "R2A" BIT CONSTRAINT "DF_ResourceTypes_R2A" DEFAULT ((0)) NOT NULL,
    "R2B" BIT CONSTRAINT "DF_ResourceTypes_R2B" DEFAULT ((0)) NOT NULL,
    "R2C" BIT CONSTRAINT "DF_ResourceTypes_R2C" DEFAULT ((0)) NOT NULL,
    "R2D" BIT CONSTRAINT "DF_ResourceTypes_R2D" DEFAULT ((0)) NOT NULL,
    "R2E" BIT CONSTRAINT "DF_ResourceTypes_R2E" DEFAULT ((0)) NOT NULL,
    "R2F" BIT CONSTRAINT "DF_ResourceTypes_R2F" DEFAULT ((0)) NOT NULL,
    "R2G" BIT CONSTRAINT "DF_ResourceTypes_R2G" DEFAULT ((0)) NOT NULL,
    "R2H" BIT CONSTRAINT "DF_ResourceTypes_R2H" DEFAULT ((0)) NOT NULL,
    "R2I" BIT CONSTRAINT "DF_ResourceTypes_R2I" DEFAULT ((0)) NOT NULL,
    "R2J" BIT CONSTRAINT "DF_ResourceTypes_R2J" DEFAULT ((0)) NOT NULL,
    "R2K" BIT CONSTRAINT "DF_ResourceTypes_R2K" DEFAULT ((0)) NOT NULL,
    "R2L" BIT CONSTRAINT "DF_ResourceTypes_R2L" DEFAULT ((0)) NOT NULL,
    "R2M" BIT CONSTRAINT "DF_ResourceTypes_R2M" DEFAULT ((0)) NOT NULL,
    "R2N" BIT CONSTRAINT "DF_ResourceTypes_R2N" DEFAULT ((0)) NOT NULL,
    "R2O" BIT CONSTRAINT "DF_ResourceTypes_R2O" DEFAULT ((0)) NOT NULL,
    "R2P" BIT CONSTRAINT "DF_ResourceTypes_R2P" DEFAULT ((0)) NOT NULL,
    "R2Q" BIT CONSTRAINT "DF_ResourceTypes_R2Q" DEFAULT ((0)) NOT NULL,
    "R2R" BIT CONSTRAINT "DF_ResourceTypes_R2R" DEFAULT ((0)) NOT NULL,
    "R2S" BIT CONSTRAINT "DF_ResourceTypes_R2S" DEFAULT ((0)) NOT NULL,
    "R2T" BIT CONSTRAINT "DF_ResourceTypes_R2T" DEFAULT ((0)) NOT NULL,
    "R2U" BIT CONSTRAINT "DF_ResourceTypes_R2U" DEFAULT ((0)) NOT NULL,
    "R2V" BIT CONSTRAINT "DF_ResourceTypes_R2V" DEFAULT ((0)) NOT NULL,
    "R30" BIT CONSTRAINT "DF_ResourceTypes_R30" DEFAULT ((0)) NOT NULL,
    "R31" BIT CONSTRAINT "DF_ResourceTypes_R31" DEFAULT ((0)) NOT NULL,
    "R32" BIT CONSTRAINT "DF_ResourceTypes_R32" DEFAULT ((0)) NOT NULL,
    "R33" BIT CONSTRAINT "DF_ResourceTypes_R33" DEFAULT ((0)) NOT NULL,
    "R34" BIT CONSTRAINT "DF_ResourceTypes_R34" DEFAULT ((0)) NOT NULL,
    "R35" BIT CONSTRAINT "DF_ResourceTypes_R35" DEFAULT ((0)) NOT NULL,
    "R36" BIT CONSTRAINT "DF_ResourceTypes_R36" DEFAULT ((0)) NOT NULL,
    "R37" BIT CONSTRAINT "DF_ResourceTypes_R37" DEFAULT ((0)) NOT NULL,
    "R38" BIT CONSTRAINT "DF_ResourceTypes_R38" DEFAULT ((0)) NOT NULL,
    "R39" BIT CONSTRAINT "DF_ResourceTypes_R39" DEFAULT ((0)) NOT NULL,
    "R3A" BIT CONSTRAINT "DF_ResourceTypes_R3A" DEFAULT ((0)) NOT NULL,
    "R3B" BIT CONSTRAINT "DF_ResourceTypes_R3B" DEFAULT ((0)) NOT NULL,
    "R3C" BIT CONSTRAINT "DF_ResourceTypes_R3C" DEFAULT ((0)) NOT NULL,
    "R3D" BIT CONSTRAINT "DF_ResourceTypes_R3D" DEFAULT ((0)) NOT NULL,
    "R3E" BIT CONSTRAINT "DF_ResourceTypes_R3E" DEFAULT ((0)) NOT NULL,
    "R3F" BIT CONSTRAINT "DF_ResourceTypes_R3F" DEFAULT ((0)) NOT NULL,
    "R3G" BIT CONSTRAINT "DF_ResourceTypes_R3G" DEFAULT ((0)) NOT NULL,
    "R3H" BIT CONSTRAINT "DF_ResourceTypes_R3H" DEFAULT ((0)) NOT NULL,
    "R3I" BIT CONSTRAINT "DF_ResourceTypes_R3I" DEFAULT ((0)) NOT NULL,
    "R3J" BIT CONSTRAINT "DF_ResourceTypes_R3J" DEFAULT ((0)) NOT NULL,
    "R3K" BIT CONSTRAINT "DF_ResourceTypes_R3K" DEFAULT ((0)) NOT NULL,
    "R3L" BIT CONSTRAINT "DF_ResourceTypes_R3L" DEFAULT ((0)) NOT NULL,
    "R3M" BIT CONSTRAINT "DF_ResourceTypes_R3M" DEFAULT ((0)) NOT NULL,
    "R3N" BIT CONSTRAINT "DF_ResourceTypes_R3N" DEFAULT ((0)) NOT NULL,
    "R3O" BIT CONSTRAINT "DF_ResourceTypes_R3O" DEFAULT ((0)) NOT NULL,
    "R3P" BIT CONSTRAINT "DF_ResourceTypes_R3P" DEFAULT ((0)) NOT NULL,
    "R3Q" BIT CONSTRAINT "DF_ResourceTypes_R3Q" DEFAULT ((0)) NOT NULL,
    "R3R" BIT CONSTRAINT "DF_ResourceTypes_R3R" DEFAULT ((0)) NOT NULL,
    "R3S" BIT CONSTRAINT "DF_ResourceTypes_R3S" DEFAULT ((0)) NOT NULL,
    "R3T" BIT CONSTRAINT "DF_ResourceTypes_R3T" DEFAULT ((0)) NOT NULL,
    "R3U" BIT CONSTRAINT "DF_ResourceTypes_R3U" DEFAULT ((0)) NOT NULL,
    "R3V" BIT CONSTRAINT "DF_ResourceTypes_R3V" DEFAULT ((0)) NOT NULL,
    "AllowAdd" BIT CONSTRAINT "DF_ResourceTypes_AllowAdd" DEFAULT ((1)) NOT NULL,
    "AllowRemove" BIT CONSTRAINT "DF_ResourceTypes_AllowRemove" DEFAULT ((1)) NOT NULL,
    "CorrelateMultipleResources" BIT CONSTRAINT "DF_ResourceTypes_CorrelateMultipleResources" DEFAULT ((0)) NOT NULL,
    "RemoveOrphans" BIT CONSTRAINT "DF_ResourceTypes_RemoveOrphans" DEFAULT ((0)) NOT NULL,
    "BlockProvisioning" BIT CONSTRAINT "DF_ResourceTypes_BlockProvisioning" DEFAULT ((1)) NOT NULL,
    "DiscardManualAssignments" BIT CONSTRAINT "DF_ResourceTypes_DiscardManualAssignments" DEFAULT ((0)) NOT NULL,
    "HideOnSimplifiedView" BIT CONSTRAINT "DF_ResourceTypes_HideOnSimplifiedView" DEFAULT ((0)) NOT NULL,
    "ApprovalWorkflowType" INT CONSTRAINT "DF_ResourceTypes_ApprovalWorkflowType" DEFAULT ((0)) NOT NULL,
    "ImplicitApproval" TINYINT CONSTRAINT "DF_ResourceTypes_ImplicitApproval" DEFAULT ((0)) NOT NULL,
    "ArgumentsExpression" NVARCHAR(4000) NULL,
    "Description_L1" NVARCHAR(1024) NULL,
    "Description_L2" NVARCHAR(1024) NULL,
    "Description_L3" NVARCHAR(1024) NULL,
    "Description_L4" NVARCHAR(1024) NULL,
    "Description_L5" NVARCHAR(1024) NULL,
    "Description_L6" NVARCHAR(1024) NULL,
    "Description_L7" NVARCHAR(1024) NULL,
    "Description_L8" NVARCHAR(1024) NULL,
    "Description_L9" NVARCHAR(1024) NULL,
    "Description_L10" NVARCHAR(1024) NULL,
    "Description_L11" NVARCHAR(1024) NULL,
    "Description_L12" NVARCHAR(1024) NULL,
    "Description_L13" NVARCHAR(1024) NULL,
    "Description_L14" NVARCHAR(1024) NULL,
    "Description_L15" NVARCHAR(1024) NULL,
    "Description_L16" NVARCHAR(1024) NULL,
    "MaximumInsert" INT CONSTRAINT "DF_ResourceTypes_MaximumInsert" DEFAULT ((0)) NOT NULL,
    "MaximumDelete" INT CONSTRAINT "DF_ResourceTypes_MaximumDelete" DEFAULT ((0)) NOT NULL,
    "MaximumUpdate" INT CONSTRAINT "DF_ResourceTypes_MaximumUpdate" DEFAULT ((0)) NOT NULL,
    "AssignmentCount" INT CONSTRAINT "DF_ResourceTypes_AssignmentCount" DEFAULT ((0)) NOT NULL,
    "OrphanCount" INT CONSTRAINT "DF_ResourceTypes_OrphansCount" DEFAULT ((0)) NOT NULL,
    "MaximumInsertPercent" INT CONSTRAINT "DF_ResourceTypes_MaximumInsertPercent" DEFAULT ((30)) NOT NULL,
    "MaximumDeletePercent" INT CONSTRAINT "DF_ResourceTypes_MaximumDeletePercent" DEFAULT ((30)) NOT NULL,
    "MaximumUpdatePercent" INT CONSTRAINT "DF_ResourceTypes_MaximumUpdatePercent" DEFAULT ((30)) NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "FullName_L1" NVARCHAR(4000) NULL,
    "FullName_L2" NVARCHAR(4000) NULL,
    "FullName_L3" NVARCHAR(4000) NULL,
    "FullName_L4" NVARCHAR(4000) NULL,
    "FullName_L5" NVARCHAR(4000) NULL,
    "FullName_L6" NVARCHAR(4000) NULL,
    "FullName_L7" NVARCHAR(4000) NULL,
    "FullName_L8" NVARCHAR(4000) NULL,
    "FullName_L9" NVARCHAR(4000) NULL,
    "FullName_L10" NVARCHAR(4000) NULL,
    "FullName_L11" NVARCHAR(4000) NULL,
    "FullName_L12" NVARCHAR(4000) NULL,
    "FullName_L13" NVARCHAR(4000) NULL,
    "FullName_L14" NVARCHAR(4000) NULL,
    "FullName_L15" NVARCHAR(4000) NULL,
    "FullName_L16" NVARCHAR(4000) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "BaseRole_Id" BIGINT NULL,
    "DependsOn_Id" BIGINT NULL,
    "DependsOnOwnerProperty_Id" BIGINT NULL,
    CONSTRAINT "PK_ResourceTypes" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceTypes_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceTypes_SourceEntityType" FOREIGN KEY ("SourceEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceTypes_TargetEntityType" FOREIGN KEY ("TargetEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceTypes_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_ResourceTypes_DependsOn" FOREIGN KEY ("DependsOn_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ResourceTypes_DependsOnOwnerProperty" FOREIGN KEY ("DependsOnOwnerProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "U_ResourceTypes_Identifier" UNIQUE ("Identifier","ValidTo"),
    CONSTRAINT "CHK_ResourceTypes_ApprovalWorkflowType" CHECK ("ApprovalWorkflowType"=(4) OR "ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0)),
    CONSTRAINT "CHK_ResourceTypes_RemoveOrphans" CHECK("AllowRemove"=(1) OR "RemoveOrphans"=(0)),
);
GO
CREATE CLUSTERED INDEX "IX_ResourceTypes" ON "UP_ResourceTypes" ("ValidTo" ASC, "Id" ASC);
GO
CREATE STATISTICS "S_ResourceTypes_Type" ON "UP_ResourceTypes"("SourceEntityType_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_ResourceTypes_View_L1" ON "UP_ResourceTypes"("SourceEntityType_Id","FullName_L1","Id") INCLUDE ("DisplayName_L1","Identifier","ApprovalWorkflowType","Policy_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
GO

   GO
   CREATE TABLE "UP_RiskRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "Risk_Id" BIGINT NOT NULL,
    "Order" INT NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "CK_RiskRules" UNIQUE CLUSTERED ("Risk_Id" ASC, "Id" ASC),
    CONSTRAINT "PK_RiskRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_RiskRules_Risk" FOREIGN KEY ("Risk_Id") REFERENCES "UP_Risks" ("Id"),
    CONSTRAINT "FK_RiskRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
);

   GO
   CREATE TABLE "UP_RoleCounters"
(
    "Id" BIGINT NOT NULL,
    "Category_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "SingleRoleCounter" INT CONSTRAINT "DF_RoleCounters_SingleRoleCounter" DEFAULT ((0)) NOT NULL,
    "CompositeRoleCounter" INT CONSTRAINT "DF_RoleCounters_CompositeRoleCounter" DEFAULT ((0)) NOT NULL,
    "ResourceTypeCounter" INT CONSTRAINT "DF_RoleCounters_ResourceTypeCounter" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_RoleCounters" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_RoleCounters_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_RoleCounters_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_RoleCounters_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
);

   GO
   CREATE TABLE "UP_SingleRoles" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Category_Id" BIGINT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_SingleRoles_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_SingleRoles_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "MaxDuration" INT NULL,
    "GracePeriod" INT NULL,
    "ProlongationWithoutApproval" TINYINT CONSTRAINT "DF_SingleRoles_ProlongationWithoutApproval" DEFAULT ((0)) NOT NULL,
    "P0" BIT CONSTRAINT "DF_SingleRoles_P0" DEFAULT ((0)) NOT NULL,
    "P1" BIT CONSTRAINT "DF_SingleRoles_P1" DEFAULT ((0)) NOT NULL,
    "P2" BIT CONSTRAINT "DF_SingleRoles_P2" DEFAULT ((0)) NOT NULL,
    "P3" BIT CONSTRAINT "DF_SingleRoles_P3" DEFAULT ((0)) NOT NULL,
    "P4" BIT CONSTRAINT "DF_SingleRoles_P4" DEFAULT ((0)) NOT NULL,
    "P5" BIT CONSTRAINT "DF_SingleRoles_P5" DEFAULT ((0)) NOT NULL,
    "P6" BIT CONSTRAINT "DF_SingleRoles_P6" DEFAULT ((0)) NOT NULL,
    "P7" BIT CONSTRAINT "DF_SingleRoles_P7" DEFAULT ((0)) NOT NULL,
    "P8" BIT CONSTRAINT "DF_SingleRoles_P8" DEFAULT ((0)) NOT NULL,
    "P9" BIT CONSTRAINT "DF_SingleRoles_P9" DEFAULT ((0)) NOT NULL,
    "PA" BIT CONSTRAINT "DF_SingleRoles_PA" DEFAULT ((0)) NOT NULL,
    "PB" BIT CONSTRAINT "DF_SingleRoles_PB" DEFAULT ((0)) NOT NULL,
    "PC" BIT CONSTRAINT "DF_SingleRoles_PC" DEFAULT ((0)) NOT NULL,
    "PD" BIT CONSTRAINT "DF_SingleRoles_PD" DEFAULT ((0)) NOT NULL,
    "PE" BIT CONSTRAINT "DF_SingleRoles_PE" DEFAULT ((0)) NOT NULL,
    "PF" BIT CONSTRAINT "DF_SingleRoles_PF" DEFAULT ((0)) NOT NULL,
    "PG" BIT CONSTRAINT "DF_SingleRoles_PG" DEFAULT ((0)) NOT NULL,
    "PH" BIT CONSTRAINT "DF_SingleRoles_PH" DEFAULT ((0)) NOT NULL,
    "PI" BIT CONSTRAINT "DF_SingleRoles_PI" DEFAULT ((0)) NOT NULL,
    "PJ" BIT CONSTRAINT "DF_SingleRoles_PJ" DEFAULT ((0)) NOT NULL,
    "PK" BIT CONSTRAINT "DF_SingleRoles_PK" DEFAULT ((0)) NOT NULL,
    "PL" BIT CONSTRAINT "DF_SingleRoles_PL" DEFAULT ((0)) NOT NULL,
    "PM" BIT CONSTRAINT "DF_SingleRoles_PM" DEFAULT ((0)) NOT NULL,
    "PN" BIT CONSTRAINT "DF_SingleRoles_PN" DEFAULT ((0)) NOT NULL,
    "PO" BIT CONSTRAINT "DF_SingleRoles_PO" DEFAULT ((0)) NOT NULL,
    "PP" BIT CONSTRAINT "DF_SingleRoles_PP" DEFAULT ((0)) NOT NULL,
    "PQ" BIT CONSTRAINT "DF_SingleRoles_PQ" DEFAULT ((0)) NOT NULL,
    "PR" BIT CONSTRAINT "DF_SingleRoles_PR" DEFAULT ((0)) NOT NULL,
    "PS" BIT CONSTRAINT "DF_SingleRoles_PS" DEFAULT ((0)) NOT NULL,
    "PT" BIT CONSTRAINT "DF_SingleRoles_PT" DEFAULT ((0)) NOT NULL,
    "PU" BIT CONSTRAINT "DF_SingleRoles_PU" DEFAULT ((0)) NOT NULL,
    "PV" BIT CONSTRAINT "DF_SingleRoles_PV" DEFAULT ((0)) NOT NULL,
    "P10" BIT CONSTRAINT "DF_SingleRoles_P10" DEFAULT ((0)) NOT NULL,
    "P11" BIT CONSTRAINT "DF_SingleRoles_P11" DEFAULT ((0)) NOT NULL,
    "P12" BIT CONSTRAINT "DF_SingleRoles_P12" DEFAULT ((0)) NOT NULL,
    "P13" BIT CONSTRAINT "DF_SingleRoles_P13" DEFAULT ((0)) NOT NULL,
    "P14" BIT CONSTRAINT "DF_SingleRoles_P14" DEFAULT ((0)) NOT NULL,
    "P15" BIT CONSTRAINT "DF_SingleRoles_P15" DEFAULT ((0)) NOT NULL,
    "P16" BIT CONSTRAINT "DF_SingleRoles_P16" DEFAULT ((0)) NOT NULL,
    "P17" BIT CONSTRAINT "DF_SingleRoles_P17" DEFAULT ((0)) NOT NULL,
    "P18" BIT CONSTRAINT "DF_SingleRoles_P18" DEFAULT ((0)) NOT NULL,
    "P19" BIT CONSTRAINT "DF_SingleRoles_P19" DEFAULT ((0)) NOT NULL,
    "P1A" BIT CONSTRAINT "DF_SingleRoles_P1A" DEFAULT ((0)) NOT NULL,
    "P1B" BIT CONSTRAINT "DF_SingleRoles_P1B" DEFAULT ((0)) NOT NULL,
    "P1C" BIT CONSTRAINT "DF_SingleRoles_P1C" DEFAULT ((0)) NOT NULL,
    "P1D" BIT CONSTRAINT "DF_SingleRoles_P1D" DEFAULT ((0)) NOT NULL,
    "P1E" BIT CONSTRAINT "DF_SingleRoles_P1E" DEFAULT ((0)) NOT NULL,
    "P1F" BIT CONSTRAINT "DF_SingleRoles_P1F" DEFAULT ((0)) NOT NULL,
    "P1G" BIT CONSTRAINT "DF_SingleRoles_P1G" DEFAULT ((0)) NOT NULL,
    "P1H" BIT CONSTRAINT "DF_SingleRoles_P1H" DEFAULT ((0)) NOT NULL,
    "P1I" BIT CONSTRAINT "DF_SingleRoles_P1I" DEFAULT ((0)) NOT NULL,
    "P1J" BIT CONSTRAINT "DF_SingleRoles_P1J" DEFAULT ((0)) NOT NULL,
    "P1K" BIT CONSTRAINT "DF_SingleRoles_P1K" DEFAULT ((0)) NOT NULL,
    "P1L" BIT CONSTRAINT "DF_SingleRoles_P1L" DEFAULT ((0)) NOT NULL,
    "P1M" BIT CONSTRAINT "DF_SingleRoles_P1M" DEFAULT ((0)) NOT NULL,
    "P1N" BIT CONSTRAINT "DF_SingleRoles_P1N" DEFAULT ((0)) NOT NULL,
    "P1O" BIT CONSTRAINT "DF_SingleRoles_P1O" DEFAULT ((0)) NOT NULL,
    "P1P" BIT CONSTRAINT "DF_SingleRoles_P1P" DEFAULT ((0)) NOT NULL,
    "P1Q" BIT CONSTRAINT "DF_SingleRoles_P1Q" DEFAULT ((0)) NOT NULL,
    "P1R" BIT CONSTRAINT "DF_SingleRoles_P1R" DEFAULT ((0)) NOT NULL,
    "P1S" BIT CONSTRAINT "DF_SingleRoles_P1S" DEFAULT ((0)) NOT NULL,
    "P1T" BIT CONSTRAINT "DF_SingleRoles_P1T" DEFAULT ((0)) NOT NULL,
    "P1U" BIT CONSTRAINT "DF_SingleRoles_P1U" DEFAULT ((0)) NOT NULL,
    "P1V" BIT CONSTRAINT "DF_SingleRoles_P1V" DEFAULT ((0)) NOT NULL,
    "P20" BIT CONSTRAINT "DF_SingleRoles_P20" DEFAULT ((0)) NOT NULL,
    "P21" BIT CONSTRAINT "DF_SingleRoles_P21" DEFAULT ((0)) NOT NULL,
    "P22" BIT CONSTRAINT "DF_SingleRoles_P22" DEFAULT ((0)) NOT NULL,
    "P23" BIT CONSTRAINT "DF_SingleRoles_P23" DEFAULT ((0)) NOT NULL,
    "P24" BIT CONSTRAINT "DF_SingleRoles_P24" DEFAULT ((0)) NOT NULL,
    "P25" BIT CONSTRAINT "DF_SingleRoles_P25" DEFAULT ((0)) NOT NULL,
    "P26" BIT CONSTRAINT "DF_SingleRoles_P26" DEFAULT ((0)) NOT NULL,
    "P27" BIT CONSTRAINT "DF_SingleRoles_P27" DEFAULT ((0)) NOT NULL,
    "P28" BIT CONSTRAINT "DF_SingleRoles_P28" DEFAULT ((0)) NOT NULL,
    "P29" BIT CONSTRAINT "DF_SingleRoles_P29" DEFAULT ((0)) NOT NULL,
    "P2A" BIT CONSTRAINT "DF_SingleRoles_P2A" DEFAULT ((0)) NOT NULL,
    "P2B" BIT CONSTRAINT "DF_SingleRoles_P2B" DEFAULT ((0)) NOT NULL,
    "P2C" BIT CONSTRAINT "DF_SingleRoles_P2C" DEFAULT ((0)) NOT NULL,
    "P2D" BIT CONSTRAINT "DF_SingleRoles_P2D" DEFAULT ((0)) NOT NULL,
    "P2E" BIT CONSTRAINT "DF_SingleRoles_P2E" DEFAULT ((0)) NOT NULL,
    "P2F" BIT CONSTRAINT "DF_SingleRoles_P2F" DEFAULT ((0)) NOT NULL,
    "P2G" BIT CONSTRAINT "DF_SingleRoles_P2G" DEFAULT ((0)) NOT NULL,
    "P2H" BIT CONSTRAINT "DF_SingleRoles_P2H" DEFAULT ((0)) NOT NULL,
    "P2I" BIT CONSTRAINT "DF_SingleRoles_P2I" DEFAULT ((0)) NOT NULL,
    "P2J" BIT CONSTRAINT "DF_SingleRoles_P2J" DEFAULT ((0)) NOT NULL,
    "P2K" BIT CONSTRAINT "DF_SingleRoles_P2K" DEFAULT ((0)) NOT NULL,
    "P2L" BIT CONSTRAINT "DF_SingleRoles_P2L" DEFAULT ((0)) NOT NULL,
    "P2M" BIT CONSTRAINT "DF_SingleRoles_P2M" DEFAULT ((0)) NOT NULL,
    "P2N" BIT CONSTRAINT "DF_SingleRoles_P2N" DEFAULT ((0)) NOT NULL,
    "P2O" BIT CONSTRAINT "DF_SingleRoles_P2O" DEFAULT ((0)) NOT NULL,
    "P2P" BIT CONSTRAINT "DF_SingleRoles_P2P" DEFAULT ((0)) NOT NULL,
    "P2Q" BIT CONSTRAINT "DF_SingleRoles_P2Q" DEFAULT ((0)) NOT NULL,
    "P2R" BIT CONSTRAINT "DF_SingleRoles_P2R" DEFAULT ((0)) NOT NULL,
    "P2S" BIT CONSTRAINT "DF_SingleRoles_P2S" DEFAULT ((0)) NOT NULL,
    "P2T" BIT CONSTRAINT "DF_SingleRoles_P2T" DEFAULT ((0)) NOT NULL,
    "P2U" BIT CONSTRAINT "DF_SingleRoles_P2U" DEFAULT ((0)) NOT NULL,
    "P2V" BIT CONSTRAINT "DF_SingleRoles_P2V" DEFAULT ((0)) NOT NULL,
    "P30" BIT CONSTRAINT "DF_SingleRoles_P30" DEFAULT ((0)) NOT NULL,
    "P31" BIT CONSTRAINT "DF_SingleRoles_P31" DEFAULT ((0)) NOT NULL,
    "P32" BIT CONSTRAINT "DF_SingleRoles_P32" DEFAULT ((0)) NOT NULL,
    "P33" BIT CONSTRAINT "DF_SingleRoles_P33" DEFAULT ((0)) NOT NULL,
    "P34" BIT CONSTRAINT "DF_SingleRoles_P34" DEFAULT ((0)) NOT NULL,
    "P35" BIT CONSTRAINT "DF_SingleRoles_P35" DEFAULT ((0)) NOT NULL,
    "P36" BIT CONSTRAINT "DF_SingleRoles_P36" DEFAULT ((0)) NOT NULL,
    "P37" BIT CONSTRAINT "DF_SingleRoles_P37" DEFAULT ((0)) NOT NULL,
    "P38" BIT CONSTRAINT "DF_SingleRoles_P38" DEFAULT ((0)) NOT NULL,
    "P39" BIT CONSTRAINT "DF_SingleRoles_P39" DEFAULT ((0)) NOT NULL,
    "P3A" BIT CONSTRAINT "DF_SingleRoles_P3A" DEFAULT ((0)) NOT NULL,
    "P3B" BIT CONSTRAINT "DF_SingleRoles_P3B" DEFAULT ((0)) NOT NULL,
    "P3C" BIT CONSTRAINT "DF_SingleRoles_P3C" DEFAULT ((0)) NOT NULL,
    "P3D" BIT CONSTRAINT "DF_SingleRoles_P3D" DEFAULT ((0)) NOT NULL,
    "P3E" BIT CONSTRAINT "DF_SingleRoles_P3E" DEFAULT ((0)) NOT NULL,
    "P3F" BIT CONSTRAINT "DF_SingleRoles_P3F" DEFAULT ((0)) NOT NULL,
    "P3G" BIT CONSTRAINT "DF_SingleRoles_P3G" DEFAULT ((0)) NOT NULL,
    "P3H" BIT CONSTRAINT "DF_SingleRoles_P3H" DEFAULT ((0)) NOT NULL,
    "P3I" BIT CONSTRAINT "DF_SingleRoles_P3I" DEFAULT ((0)) NOT NULL,
    "P3J" BIT CONSTRAINT "DF_SingleRoles_P3J" DEFAULT ((0)) NOT NULL,
    "P3K" BIT CONSTRAINT "DF_SingleRoles_P3K" DEFAULT ((0)) NOT NULL,
    "P3L" BIT CONSTRAINT "DF_SingleRoles_P3L" DEFAULT ((0)) NOT NULL,
    "P3M" BIT CONSTRAINT "DF_SingleRoles_P3M" DEFAULT ((0)) NOT NULL,
    "P3N" BIT CONSTRAINT "DF_SingleRoles_P3N" DEFAULT ((0)) NOT NULL,
    "P3O" BIT CONSTRAINT "DF_SingleRoles_P3O" DEFAULT ((0)) NOT NULL,
    "P3P" BIT CONSTRAINT "DF_SingleRoles_P3P" DEFAULT ((0)) NOT NULL,
    "P3Q" BIT CONSTRAINT "DF_SingleRoles_P3Q" DEFAULT ((0)) NOT NULL,
    "P3R" BIT CONSTRAINT "DF_SingleRoles_P3R" DEFAULT ((0)) NOT NULL,
    "P3S" BIT CONSTRAINT "DF_SingleRoles_P3S" DEFAULT ((0)) NOT NULL,
    "P3T" BIT CONSTRAINT "DF_SingleRoles_P3T" DEFAULT ((0)) NOT NULL,
    "P3U" BIT CONSTRAINT "DF_SingleRoles_P3U" DEFAULT ((0)) NOT NULL,
    "P3V" BIT CONSTRAINT "DF_SingleRoles_P3V" DEFAULT ((0)) NOT NULL,
    "R0" BIT CONSTRAINT "DF_SingleRoles_R0" DEFAULT ((0)) NOT NULL,
    "R1" BIT CONSTRAINT "DF_SingleRoles_R1" DEFAULT ((0)) NOT NULL,
    "R2" BIT CONSTRAINT "DF_SingleRoles_R2" DEFAULT ((0)) NOT NULL,
    "R3" BIT CONSTRAINT "DF_SingleRoles_R3" DEFAULT ((0)) NOT NULL,
    "R4" BIT CONSTRAINT "DF_SingleRoles_R4" DEFAULT ((0)) NOT NULL,
    "R5" BIT CONSTRAINT "DF_SingleRoles_R5" DEFAULT ((0)) NOT NULL,
    "R6" BIT CONSTRAINT "DF_SingleRoles_R6" DEFAULT ((0)) NOT NULL,
    "R7" BIT CONSTRAINT "DF_SingleRoles_R7" DEFAULT ((0)) NOT NULL,
    "R8" BIT CONSTRAINT "DF_SingleRoles_R8" DEFAULT ((0)) NOT NULL,
    "R9" BIT CONSTRAINT "DF_SingleRoles_R9" DEFAULT ((0)) NOT NULL,
    "RA" BIT CONSTRAINT "DF_SingleRoles_RA" DEFAULT ((0)) NOT NULL,
    "RB" BIT CONSTRAINT "DF_SingleRoles_RB" DEFAULT ((0)) NOT NULL,
    "RC" BIT CONSTRAINT "DF_SingleRoles_RC" DEFAULT ((0)) NOT NULL,
    "RD" BIT CONSTRAINT "DF_SingleRoles_RD" DEFAULT ((0)) NOT NULL,
    "RE" BIT CONSTRAINT "DF_SingleRoles_RE" DEFAULT ((0)) NOT NULL,
    "RF" BIT CONSTRAINT "DF_SingleRoles_RF" DEFAULT ((0)) NOT NULL,
    "RG" BIT CONSTRAINT "DF_SingleRoles_RG" DEFAULT ((0)) NOT NULL,
    "RH" BIT CONSTRAINT "DF_SingleRoles_RH" DEFAULT ((0)) NOT NULL,
    "RI" BIT CONSTRAINT "DF_SingleRoles_RI" DEFAULT ((0)) NOT NULL,
    "RJ" BIT CONSTRAINT "DF_SingleRoles_RJ" DEFAULT ((0)) NOT NULL,
    "RK" BIT CONSTRAINT "DF_SingleRoles_RK" DEFAULT ((0)) NOT NULL,
    "RL" BIT CONSTRAINT "DF_SingleRoles_RL" DEFAULT ((0)) NOT NULL,
    "RM" BIT CONSTRAINT "DF_SingleRoles_RM" DEFAULT ((0)) NOT NULL,
    "RN" BIT CONSTRAINT "DF_SingleRoles_RN" DEFAULT ((0)) NOT NULL,
    "RO" BIT CONSTRAINT "DF_SingleRoles_RO" DEFAULT ((0)) NOT NULL,
    "RP" BIT CONSTRAINT "DF_SingleRoles_RP" DEFAULT ((0)) NOT NULL,
    "RQ" BIT CONSTRAINT "DF_SingleRoles_RQ" DEFAULT ((0)) NOT NULL,
    "RR" BIT CONSTRAINT "DF_SingleRoles_RR" DEFAULT ((0)) NOT NULL,
    "RS" BIT CONSTRAINT "DF_SingleRoles_RS" DEFAULT ((0)) NOT NULL,
    "RT" BIT CONSTRAINT "DF_SingleRoles_RT" DEFAULT ((0)) NOT NULL,
    "RU" BIT CONSTRAINT "DF_SingleRoles_RU" DEFAULT ((0)) NOT NULL,
    "RV" BIT CONSTRAINT "DF_SingleRoles_RV" DEFAULT ((0)) NOT NULL,
    "R10" BIT CONSTRAINT "DF_SingleRoles_R10" DEFAULT ((0)) NOT NULL,
    "R11" BIT CONSTRAINT "DF_SingleRoles_R11" DEFAULT ((0)) NOT NULL,
    "R12" BIT CONSTRAINT "DF_SingleRoles_R12" DEFAULT ((0)) NOT NULL,
    "R13" BIT CONSTRAINT "DF_SingleRoles_R13" DEFAULT ((0)) NOT NULL,
    "R14" BIT CONSTRAINT "DF_SingleRoles_R14" DEFAULT ((0)) NOT NULL,
    "R15" BIT CONSTRAINT "DF_SingleRoles_R15" DEFAULT ((0)) NOT NULL,
    "R16" BIT CONSTRAINT "DF_SingleRoles_R16" DEFAULT ((0)) NOT NULL,
    "R17" BIT CONSTRAINT "DF_SingleRoles_R17" DEFAULT ((0)) NOT NULL,
    "R18" BIT CONSTRAINT "DF_SingleRoles_R18" DEFAULT ((0)) NOT NULL,
    "R19" BIT CONSTRAINT "DF_SingleRoles_R19" DEFAULT ((0)) NOT NULL,
    "R1A" BIT CONSTRAINT "DF_SingleRoles_R1A" DEFAULT ((0)) NOT NULL,
    "R1B" BIT CONSTRAINT "DF_SingleRoles_R1B" DEFAULT ((0)) NOT NULL,
    "R1C" BIT CONSTRAINT "DF_SingleRoles_R1C" DEFAULT ((0)) NOT NULL,
    "R1D" BIT CONSTRAINT "DF_SingleRoles_R1D" DEFAULT ((0)) NOT NULL,
    "R1E" BIT CONSTRAINT "DF_SingleRoles_R1E" DEFAULT ((0)) NOT NULL,
    "R1F" BIT CONSTRAINT "DF_SingleRoles_R1F" DEFAULT ((0)) NOT NULL,
    "R1G" BIT CONSTRAINT "DF_SingleRoles_R1G" DEFAULT ((0)) NOT NULL,
    "R1H" BIT CONSTRAINT "DF_SingleRoles_R1H" DEFAULT ((0)) NOT NULL,
    "R1I" BIT CONSTRAINT "DF_SingleRoles_R1I" DEFAULT ((0)) NOT NULL,
    "R1J" BIT CONSTRAINT "DF_SingleRoles_R1J" DEFAULT ((0)) NOT NULL,
    "R1K" BIT CONSTRAINT "DF_SingleRoles_R1K" DEFAULT ((0)) NOT NULL,
    "R1L" BIT CONSTRAINT "DF_SingleRoles_R1L" DEFAULT ((0)) NOT NULL,
    "R1M" BIT CONSTRAINT "DF_SingleRoles_R1M" DEFAULT ((0)) NOT NULL,
    "R1N" BIT CONSTRAINT "DF_SingleRoles_R1N" DEFAULT ((0)) NOT NULL,
    "R1O" BIT CONSTRAINT "DF_SingleRoles_R1O" DEFAULT ((0)) NOT NULL,
    "R1P" BIT CONSTRAINT "DF_SingleRoles_R1P" DEFAULT ((0)) NOT NULL,
    "R1Q" BIT CONSTRAINT "DF_SingleRoles_R1Q" DEFAULT ((0)) NOT NULL,
    "R1R" BIT CONSTRAINT "DF_SingleRoles_R1R" DEFAULT ((0)) NOT NULL,
    "R1S" BIT CONSTRAINT "DF_SingleRoles_R1S" DEFAULT ((0)) NOT NULL,
    "R1T" BIT CONSTRAINT "DF_SingleRoles_R1T" DEFAULT ((0)) NOT NULL,
    "R1U" BIT CONSTRAINT "DF_SingleRoles_R1U" DEFAULT ((0)) NOT NULL,
    "R1V" BIT CONSTRAINT "DF_SingleRoles_R1V" DEFAULT ((0)) NOT NULL,
    "R20" BIT CONSTRAINT "DF_SingleRoles_R20" DEFAULT ((0)) NOT NULL,
    "R21" BIT CONSTRAINT "DF_SingleRoles_R21" DEFAULT ((0)) NOT NULL,
    "R22" BIT CONSTRAINT "DF_SingleRoles_R22" DEFAULT ((0)) NOT NULL,
    "R23" BIT CONSTRAINT "DF_SingleRoles_R23" DEFAULT ((0)) NOT NULL,
    "R24" BIT CONSTRAINT "DF_SingleRoles_R24" DEFAULT ((0)) NOT NULL,
    "R25" BIT CONSTRAINT "DF_SingleRoles_R25" DEFAULT ((0)) NOT NULL,
    "R26" BIT CONSTRAINT "DF_SingleRoles_R26" DEFAULT ((0)) NOT NULL,
    "R27" BIT CONSTRAINT "DF_SingleRoles_R27" DEFAULT ((0)) NOT NULL,
    "R28" BIT CONSTRAINT "DF_SingleRoles_R28" DEFAULT ((0)) NOT NULL,
    "R29" BIT CONSTRAINT "DF_SingleRoles_R29" DEFAULT ((0)) NOT NULL,
    "R2A" BIT CONSTRAINT "DF_SingleRoles_R2A" DEFAULT ((0)) NOT NULL,
    "R2B" BIT CONSTRAINT "DF_SingleRoles_R2B" DEFAULT ((0)) NOT NULL,
    "R2C" BIT CONSTRAINT "DF_SingleRoles_R2C" DEFAULT ((0)) NOT NULL,
    "R2D" BIT CONSTRAINT "DF_SingleRoles_R2D" DEFAULT ((0)) NOT NULL,
    "R2E" BIT CONSTRAINT "DF_SingleRoles_R2E" DEFAULT ((0)) NOT NULL,
    "R2F" BIT CONSTRAINT "DF_SingleRoles_R2F" DEFAULT ((0)) NOT NULL,
    "R2G" BIT CONSTRAINT "DF_SingleRoles_R2G" DEFAULT ((0)) NOT NULL,
    "R2H" BIT CONSTRAINT "DF_SingleRoles_R2H" DEFAULT ((0)) NOT NULL,
    "R2I" BIT CONSTRAINT "DF_SingleRoles_R2I" DEFAULT ((0)) NOT NULL,
    "R2J" BIT CONSTRAINT "DF_SingleRoles_R2J" DEFAULT ((0)) NOT NULL,
    "R2K" BIT CONSTRAINT "DF_SingleRoles_R2K" DEFAULT ((0)) NOT NULL,
    "R2L" BIT CONSTRAINT "DF_SingleRoles_R2L" DEFAULT ((0)) NOT NULL,
    "R2M" BIT CONSTRAINT "DF_SingleRoles_R2M" DEFAULT ((0)) NOT NULL,
    "R2N" BIT CONSTRAINT "DF_SingleRoles_R2N" DEFAULT ((0)) NOT NULL,
    "R2O" BIT CONSTRAINT "DF_SingleRoles_R2O" DEFAULT ((0)) NOT NULL,
    "R2P" BIT CONSTRAINT "DF_SingleRoles_R2P" DEFAULT ((0)) NOT NULL,
    "R2Q" BIT CONSTRAINT "DF_SingleRoles_R2Q" DEFAULT ((0)) NOT NULL,
    "R2R" BIT CONSTRAINT "DF_SingleRoles_R2R" DEFAULT ((0)) NOT NULL,
    "R2S" BIT CONSTRAINT "DF_SingleRoles_R2S" DEFAULT ((0)) NOT NULL,
    "R2T" BIT CONSTRAINT "DF_SingleRoles_R2T" DEFAULT ((0)) NOT NULL,
    "R2U" BIT CONSTRAINT "DF_SingleRoles_R2U" DEFAULT ((0)) NOT NULL,
    "R2V" BIT CONSTRAINT "DF_SingleRoles_R2V" DEFAULT ((0)) NOT NULL,
    "R30" BIT CONSTRAINT "DF_SingleRoles_R30" DEFAULT ((0)) NOT NULL,
    "R31" BIT CONSTRAINT "DF_SingleRoles_R31" DEFAULT ((0)) NOT NULL,
    "R32" BIT CONSTRAINT "DF_SingleRoles_R32" DEFAULT ((0)) NOT NULL,
    "R33" BIT CONSTRAINT "DF_SingleRoles_R33" DEFAULT ((0)) NOT NULL,
    "R34" BIT CONSTRAINT "DF_SingleRoles_R34" DEFAULT ((0)) NOT NULL,
    "R35" BIT CONSTRAINT "DF_SingleRoles_R35" DEFAULT ((0)) NOT NULL,
    "R36" BIT CONSTRAINT "DF_SingleRoles_R36" DEFAULT ((0)) NOT NULL,
    "R37" BIT CONSTRAINT "DF_SingleRoles_R37" DEFAULT ((0)) NOT NULL,
    "R38" BIT CONSTRAINT "DF_SingleRoles_R38" DEFAULT ((0)) NOT NULL,
    "R39" BIT CONSTRAINT "DF_SingleRoles_R39" DEFAULT ((0)) NOT NULL,
    "R3A" BIT CONSTRAINT "DF_SingleRoles_R3A" DEFAULT ((0)) NOT NULL,
    "R3B" BIT CONSTRAINT "DF_SingleRoles_R3B" DEFAULT ((0)) NOT NULL,
    "R3C" BIT CONSTRAINT "DF_SingleRoles_R3C" DEFAULT ((0)) NOT NULL,
    "R3D" BIT CONSTRAINT "DF_SingleRoles_R3D" DEFAULT ((0)) NOT NULL,
    "R3E" BIT CONSTRAINT "DF_SingleRoles_R3E" DEFAULT ((0)) NOT NULL,
    "R3F" BIT CONSTRAINT "DF_SingleRoles_R3F" DEFAULT ((0)) NOT NULL,
    "R3G" BIT CONSTRAINT "DF_SingleRoles_R3G" DEFAULT ((0)) NOT NULL,
    "R3H" BIT CONSTRAINT "DF_SingleRoles_R3H" DEFAULT ((0)) NOT NULL,
    "R3I" BIT CONSTRAINT "DF_SingleRoles_R3I" DEFAULT ((0)) NOT NULL,
    "R3J" BIT CONSTRAINT "DF_SingleRoles_R3J" DEFAULT ((0)) NOT NULL,
    "R3K" BIT CONSTRAINT "DF_SingleRoles_R3K" DEFAULT ((0)) NOT NULL,
    "R3L" BIT CONSTRAINT "DF_SingleRoles_R3L" DEFAULT ((0)) NOT NULL,
    "R3M" BIT CONSTRAINT "DF_SingleRoles_R3M" DEFAULT ((0)) NOT NULL,
    "R3N" BIT CONSTRAINT "DF_SingleRoles_R3N" DEFAULT ((0)) NOT NULL,
    "R3O" BIT CONSTRAINT "DF_SingleRoles_R3O" DEFAULT ((0)) NOT NULL,
    "R3P" BIT CONSTRAINT "DF_SingleRoles_R3P" DEFAULT ((0)) NOT NULL,
    "R3Q" BIT CONSTRAINT "DF_SingleRoles_R3Q" DEFAULT ((0)) NOT NULL,
    "R3R" BIT CONSTRAINT "DF_SingleRoles_R3R" DEFAULT ((0)) NOT NULL,
    "R3S" BIT CONSTRAINT "DF_SingleRoles_R3S" DEFAULT ((0)) NOT NULL,
    "R3T" BIT CONSTRAINT "DF_SingleRoles_R3T" DEFAULT ((0)) NOT NULL,
    "R3U" BIT CONSTRAINT "DF_SingleRoles_R3U" DEFAULT ((0)) NOT NULL,
    "R3V" BIT CONSTRAINT "DF_SingleRoles_R3V" DEFAULT ((0)) NOT NULL,
    "ApprovalWorkflowType" INT CONSTRAINT "DF_SingleRoles_ApprovalWorkflowType" DEFAULT ((0)) NOT NULL,
    "HideOnSimplifiedView" BIT CONSTRAINT "DF_SingleRoles_HideOnSimplifiedView" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_SingleRoles_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnApproveInReview" TINYINT CONSTRAINT "DF_SingleRoles_CommentActivationOnApproveInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeclineInReview" TINYINT CONSTRAINT "DF_SingleRoles_CommentActivationOnDeclineInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeleteGapInReconciliation" TINYINT CONSTRAINT "DF_SingleRoles_CommentActivationOnDeleteGapInReconciliation" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnKeepGapInReconciliation" TINYINT CONSTRAINT "DF_SingleRoles_CommentActivationOnKeepGapInReconciliation" DEFAULT ((0)) NOT NULL,
    "ImplicitApproval" TINYINT CONSTRAINT "DF_SingleRoles_ImplicitApproval" DEFAULT ((0)) NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "State" TINYINT CONSTRAINT "DF_SingleRoles_State" DEFAULT ((0)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
    "Tags" NVARCHAR(442) NULL,
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
    "FullName_L1" NVARCHAR(4000) NULL,
    "FullName_L2" NVARCHAR(4000) NULL,
    "FullName_L3" NVARCHAR(4000) NULL,
    "FullName_L4" NVARCHAR(4000) NULL,
    "FullName_L5" NVARCHAR(4000) NULL,
    "FullName_L6" NVARCHAR(4000) NULL,
    "FullName_L7" NVARCHAR(4000) NULL,
    "FullName_L8" NVARCHAR(4000) NULL,
    "FullName_L9" NVARCHAR(4000) NULL,
    "FullName_L10" NVARCHAR(4000) NULL,
    "FullName_L11" NVARCHAR(4000) NULL,
    "FullName_L12" NVARCHAR(4000) NULL,
    "FullName_L13" NVARCHAR(4000) NULL,
    "FullName_L14" NVARCHAR(4000) NULL,
    "FullName_L15" NVARCHAR(4000) NULL,
    "FullName_L16" NVARCHAR(4000) NULL,
    "Description_L1" NVARCHAR(1024) NULL,
    "Description_L2" NVARCHAR(1024) NULL,
    "Description_L3" NVARCHAR(1024) NULL,
    "Description_L4" NVARCHAR(1024) NULL,
    "Description_L5" NVARCHAR(1024) NULL,
    "Description_L6" NVARCHAR(1024) NULL,
    "Description_L7" NVARCHAR(1024) NULL,
    "Description_L8" NVARCHAR(1024) NULL,
    "Description_L9" NVARCHAR(1024) NULL,
    "Description_L10" NVARCHAR(1024) NULL,
    "Description_L11" NVARCHAR(1024) NULL,
    "Description_L12" NVARCHAR(1024) NULL,
    "Description_L13" NVARCHAR(1024) NULL,
    "Description_L14" NVARCHAR(1024) NULL,
    "Description_L15" NVARCHAR(1024) NULL,
    "Description_L16" NVARCHAR(1024) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "BaseRole_Id" BIGINT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    CONSTRAINT "PK_SingleRoles" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_SingleRoles_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_SingleRoles_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_SingleRoles_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "U_SingleRoles_Identifier" UNIQUE ("Identifier","ValidTo"),
    CONSTRAINT "CHK_SingleRoles_ApprovalWorkflowType" CHECK ("ApprovalWorkflowType"=(4) OR "ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0)),
);
GO
CREATE CLUSTERED INDEX "IX_SingleRoles" ON "UP_SingleRoles" ("ValidTo" ASC, "Id" ASC);
GO
CREATE STATISTICS "S_SingleRoles_Type" ON "UP_SingleRoles"("EntityType_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_SingleRoles_View_L1" ON "UP_SingleRoles"("EntityType_Id","FullName_L1","Id") INCLUDE ("DisplayName_L1","Identifier","ApprovalWorkflowType","Policy_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
GO

   GO
   CREATE TABLE "UR_ResourceFiles" (
    "Id" BIGINT NOT NULL,
    "Resource_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "FileName" NVARCHAR(442) NULL,
    "MimeType" VARCHAR(442) NULL,
    "Data" VARBINARY(MAX) NOT NULL,
    "DataHash" INT NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_ResourceFiles_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_ResourceFiles_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    CONSTRAINT "PK_ResourceFiles" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_ResourceFiles_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
);

GO
CREATE CLUSTERED INDEX "IX_ResourceFiles"
    ON "UR_ResourceFiles"("ValidTo" ASC, "Property_Id" ASC, "Resource_Id" ASC, "Id" ASC);
GO
    
CREATE INDEX "IX_ResourceFiles2"
    ON "UR_ResourceFiles"("Property_Id" ASC,"Resource_Id" ASC, "ValidFrom" DESC)
	INCLUDE (Id, "ValidTo","MimeType","FileName");
GO

   GO
   CREATE TABLE "US_AccessCertificationItems" (
    "Id" BIGINT NOT NULL,
    "Campaign_Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NOT NULL,
    "ReviewDecision" TINYINT CONSTRAINT "DF_AccessCertificationItems_ReviewerDecision" DEFAULT ((0)) NOT NULL,
    "AdministratorDecision" TINYINT CONSTRAINT "DF_AccessCertificationItems_AdministratorDecision" DEFAULT ((0)) NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_AccessCertificationItems_IsDenied" DEFAULT ((0)) NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AccessCertificationItems_WorkflowState" DEFAULT ((0)) NOT NULL,
    "IsTransferred" BIT CONSTRAINT "DF_AccessCertificationItems_IsTransferred" DEFAULT ((0)) NOT NULL,
    "CertificationState" TINYINT CONSTRAINT "DF_AccessCertificationItems_CertificationState" DEFAULT ((0)) NOT NULL,
    "Reviewer_Id" BIGINT NULL,
    "SetReviewerDate" SMALLDATETIME NULL,
    "ReviewDate" SMALLDATETIME NULL,
    "Administrator_Id" BIGINT NULL,
    "AdministratorDate" SMALLDATETIME NULL,
    "AssignedCompositeRole_Id" BIGINT NULL,
    "AssignedSingleRole_Id" BIGINT NULL,
    "AssignedResourceType_Id" BIGINT NULL,
    "AssignedResourceNavigation_Id" BIGINT NULL,
    "AssignedResourceScalar_Id" BIGINT NULL,

    "ReviewComment" NVARCHAR(442) NULL,
    "AdministratorComment" NVARCHAR(442) NULL,

    CONSTRAINT "PK_AccessCertificationItem" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "CK_AccessCertificationItem" UNIQUE CLUSTERED ("Campaign_Id" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC),
    CONSTRAINT "FK_AccessCertificationItem_Campaign" FOREIGN KEY ("Campaign_Id") REFERENCES "US_AccessCertificationCampaigns" ("Id"),
);

   GO
   CREATE TABLE "US_AccessCertificationOwnerFilters" (
    "Id" BIGINT NOT NULL,
    "Campaign_Id" BIGINT NOT NULL,
    "IndividualOwner_Id" BIGINT NULL,
    "TargetedRisk_Id" BIGINT NULL,
    "MinimalRiskScore" INT NULL,
    "L0" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L0" DEFAULT ((0)) NOT NULL,
    "L1" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1" DEFAULT ((0)) NOT NULL,
    "L2" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2" DEFAULT ((0)) NOT NULL,
    "L3" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3" DEFAULT ((0)) NOT NULL,
    "L4" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L4" DEFAULT ((0)) NOT NULL,
    "L5" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L5" DEFAULT ((0)) NOT NULL,
    "L6" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L6" DEFAULT ((0)) NOT NULL,
    "L7" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L7" DEFAULT ((0)) NOT NULL,
    "L8" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L8" DEFAULT ((0)) NOT NULL,
    "L9" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L9" DEFAULT ((0)) NOT NULL,
    "LA" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LA" DEFAULT ((0)) NOT NULL,
    "LB" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LB" DEFAULT ((0)) NOT NULL,
    "LC" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LC" DEFAULT ((0)) NOT NULL,
    "LD" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LD" DEFAULT ((0)) NOT NULL,
    "LE" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LE" DEFAULT ((0)) NOT NULL,
    "LF" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LF" DEFAULT ((0)) NOT NULL,
    "LG" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LG" DEFAULT ((0)) NOT NULL,
    "LH" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LH" DEFAULT ((0)) NOT NULL,
    "LI" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LI" DEFAULT ((0)) NOT NULL,
    "LJ" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LJ" DEFAULT ((0)) NOT NULL,
    "LK" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LK" DEFAULT ((0)) NOT NULL,
    "LL" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LL" DEFAULT ((0)) NOT NULL,
    "LM" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LM" DEFAULT ((0)) NOT NULL,
    "LN" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LN" DEFAULT ((0)) NOT NULL,
    "LO" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LO" DEFAULT ((0)) NOT NULL,
    "LP" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LP" DEFAULT ((0)) NOT NULL,
    "LQ" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LQ" DEFAULT ((0)) NOT NULL,
    "LR" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LR" DEFAULT ((0)) NOT NULL,
    "LS" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LS" DEFAULT ((0)) NOT NULL,
    "LT" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LT" DEFAULT ((0)) NOT NULL,
    "LU" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LU" DEFAULT ((0)) NOT NULL,
    "LV" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_LV" DEFAULT ((0)) NOT NULL,
    "L10" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L10" DEFAULT ((0)) NOT NULL,
    "L11" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L11" DEFAULT ((0)) NOT NULL,
    "L12" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L12" DEFAULT ((0)) NOT NULL,
    "L13" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L13" DEFAULT ((0)) NOT NULL,
    "L14" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L14" DEFAULT ((0)) NOT NULL,
    "L15" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L15" DEFAULT ((0)) NOT NULL,
    "L16" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L16" DEFAULT ((0)) NOT NULL,
    "L17" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L17" DEFAULT ((0)) NOT NULL,
    "L18" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L18" DEFAULT ((0)) NOT NULL,
    "L19" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L19" DEFAULT ((0)) NOT NULL,
    "L1A" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1A" DEFAULT ((0)) NOT NULL,
    "L1B" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1B" DEFAULT ((0)) NOT NULL,
    "L1C" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1C" DEFAULT ((0)) NOT NULL,
    "L1D" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1D" DEFAULT ((0)) NOT NULL,
    "L1E" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1E" DEFAULT ((0)) NOT NULL,
    "L1F" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1F" DEFAULT ((0)) NOT NULL,
    "L1G" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1G" DEFAULT ((0)) NOT NULL,
    "L1H" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1H" DEFAULT ((0)) NOT NULL,
    "L1I" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1I" DEFAULT ((0)) NOT NULL,
    "L1J" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1J" DEFAULT ((0)) NOT NULL,
    "L1K" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1K" DEFAULT ((0)) NOT NULL,
    "L1L" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1L" DEFAULT ((0)) NOT NULL,
    "L1M" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1M" DEFAULT ((0)) NOT NULL,
    "L1N" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1N" DEFAULT ((0)) NOT NULL,
    "L1O" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1O" DEFAULT ((0)) NOT NULL,
    "L1P" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1P" DEFAULT ((0)) NOT NULL,
    "L1Q" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1Q" DEFAULT ((0)) NOT NULL,
    "L1R" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1R" DEFAULT ((0)) NOT NULL,
    "L1S" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1S" DEFAULT ((0)) NOT NULL,
    "L1T" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1T" DEFAULT ((0)) NOT NULL,
    "L1U" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1U" DEFAULT ((0)) NOT NULL,
    "L1V" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L1V" DEFAULT ((0)) NOT NULL,
    "L20" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L20" DEFAULT ((0)) NOT NULL,
    "L21" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L21" DEFAULT ((0)) NOT NULL,
    "L22" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L22" DEFAULT ((0)) NOT NULL,
    "L23" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L23" DEFAULT ((0)) NOT NULL,
    "L24" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L24" DEFAULT ((0)) NOT NULL,
    "L25" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L25" DEFAULT ((0)) NOT NULL,
    "L26" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L26" DEFAULT ((0)) NOT NULL,
    "L27" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L27" DEFAULT ((0)) NOT NULL,
    "L28" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L28" DEFAULT ((0)) NOT NULL,
    "L29" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L29" DEFAULT ((0)) NOT NULL,
    "L2A" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2A" DEFAULT ((0)) NOT NULL,
    "L2B" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2B" DEFAULT ((0)) NOT NULL,
    "L2C" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2C" DEFAULT ((0)) NOT NULL,
    "L2D" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2D" DEFAULT ((0)) NOT NULL,
    "L2E" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2E" DEFAULT ((0)) NOT NULL,
    "L2F" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2F" DEFAULT ((0)) NOT NULL,
    "L2G" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2G" DEFAULT ((0)) NOT NULL,
    "L2H" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2H" DEFAULT ((0)) NOT NULL,
    "L2I" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2I" DEFAULT ((0)) NOT NULL,
    "L2J" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2J" DEFAULT ((0)) NOT NULL,
    "L2K" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2K" DEFAULT ((0)) NOT NULL,
    "L2L" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2L" DEFAULT ((0)) NOT NULL,
    "L2M" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2M" DEFAULT ((0)) NOT NULL,
    "L2N" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2N" DEFAULT ((0)) NOT NULL,
    "L2O" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2O" DEFAULT ((0)) NOT NULL,
    "L2P" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2P" DEFAULT ((0)) NOT NULL,
    "L2Q" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2Q" DEFAULT ((0)) NOT NULL,
    "L2R" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2R" DEFAULT ((0)) NOT NULL,
    "L2S" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2S" DEFAULT ((0)) NOT NULL,
    "L2T" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2T" DEFAULT ((0)) NOT NULL,
    "L2U" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2U" DEFAULT ((0)) NOT NULL,
    "L2V" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L2V" DEFAULT ((0)) NOT NULL,
    "L30" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L30" DEFAULT ((0)) NOT NULL,
    "L31" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L31" DEFAULT ((0)) NOT NULL,
    "L32" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L32" DEFAULT ((0)) NOT NULL,
    "L33" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L33" DEFAULT ((0)) NOT NULL,
    "L34" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L34" DEFAULT ((0)) NOT NULL,
    "L35" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L35" DEFAULT ((0)) NOT NULL,
    "L36" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L36" DEFAULT ((0)) NOT NULL,
    "L37" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L37" DEFAULT ((0)) NOT NULL,
    "L38" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L38" DEFAULT ((0)) NOT NULL,
    "L39" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L39" DEFAULT ((0)) NOT NULL,
    "L3A" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3A" DEFAULT ((0)) NOT NULL,
    "L3B" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3B" DEFAULT ((0)) NOT NULL,
    "L3C" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3C" DEFAULT ((0)) NOT NULL,
    "L3D" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3D" DEFAULT ((0)) NOT NULL,
    "L3E" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3E" DEFAULT ((0)) NOT NULL,
    "L3F" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3F" DEFAULT ((0)) NOT NULL,
    "L3G" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3G" DEFAULT ((0)) NOT NULL,
    "L3H" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3H" DEFAULT ((0)) NOT NULL,
    "L3I" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3I" DEFAULT ((0)) NOT NULL,
    "L3J" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3J" DEFAULT ((0)) NOT NULL,
    "L3K" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3K" DEFAULT ((0)) NOT NULL,
    "L3L" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3L" DEFAULT ((0)) NOT NULL,
    "L3M" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3M" DEFAULT ((0)) NOT NULL,
    "L3N" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3N" DEFAULT ((0)) NOT NULL,
    "L3O" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3O" DEFAULT ((0)) NOT NULL,
    "L3P" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3P" DEFAULT ((0)) NOT NULL,
    "L3Q" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3Q" DEFAULT ((0)) NOT NULL,
    "L3R" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3R" DEFAULT ((0)) NOT NULL,
    "L3S" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3S" DEFAULT ((0)) NOT NULL,
    "L3T" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3T" DEFAULT ((0)) NOT NULL,
    "L3U" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3U" DEFAULT ((0)) NOT NULL,
    "L3V" BIT CONSTRAINT "DF_AccessCertificationOwnerFilters_L3V" DEFAULT ((0)) NOT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    "OwnerLastModificationDate" SMALLDATETIME NULL, 
    "OwnerLastModificationDateBinding_Id" BIGINT NULL, 
    CONSTRAINT "PK_AccessCertificationOwnerFilters" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AccessCertificationOwnerFilters_Campaign" FOREIGN KEY ("Campaign_Id") REFERENCES "US_AccessCertificationCampaigns" ("Id"),
    CONSTRAINT "FK_AccessCertificationOwnerFilters_EntityProperty" FOREIGN KEY ("OwnerLastModificationDateBinding_Id") REFERENCES "UM_Bindings" ("Id"),
);

   GO
   CREATE TABLE "UW_Activities" (
    "Id" BIGINT NOT NULL,
    "Workflow_Id" BIGINT NOT NULL,
    "Template_Id" BIGINT NOT NULL,
    "Order" INT CONSTRAINT "DF_Activities_Order" DEFAULT ((0)) NOT NULL,
    "ArgumentBlockProvisioning" BIT CONSTRAINT "DF_Activities_ArgumentBlockProvisioning" DEFAULT ((0)) NOT NULL,
    "ArgumentCalledWorkflow_Id" BIGINT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "WorkflowOverviewDisable" BIT CONSTRAINT "DF_Activities_WorkflowOverviewDisable" DEFAULT ((0)) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    CONSTRAINT "PK_Activities" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Activities_Workflow" FOREIGN KEY ("Workflow_Id") REFERENCES "UW_Workflows" ("Id"),
    CONSTRAINT "FK_Activities_Template" FOREIGN KEY ("Template_Id") REFERENCES "UW_ActivityTemplates" ("Id"),
    CONSTRAINT "FK_Activities_CalledWorkflow" FOREIGN KEY ("ArgumentCalledWorkflow_Id") REFERENCES "UW_Workflows" ("Id"),
    CONSTRAINT "U_Activities_Identifier" UNIQUE ("Workflow_Id","Identifier"),
);

   GO
   CREATE TABLE "UW_ActivityTemplateTransitions" (
    "Id" BIGINT NOT NULL,
    "FromState_Id" BIGINT NOT NULL,
    "ToState_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "IsBatchActor" BIT CONSTRAINT "DF_ActivityTemplateTransitions_IsBatchActor" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_ActivityTemplateTransitions" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ActivityTemplateTransitions_FromState" FOREIGN KEY ("FromState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id"),
    CONSTRAINT "FK_ActivityTemplateTransitions_ToState" FOREIGN KEY ("ToState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id"),
    CONSTRAINT "U_ActivityTemplateTransitions_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UW_HomonymEntityLinkFilters"
(
	"Id" BIGINT NOT NULL,
    "HomonymEntityLink_Id" BIGINT NOT NULL,
    "Property1_Id" BIGINT NULL,
    "Expression1" VARCHAR(4000) NULL,
    "Operator1" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator1" DEFAULT ((2)) NOT NULL,
    "ComparisonProperty1_Id" BIGINT NULL,
    "Property2_Id" BIGINT NULL,
    "Expression2" VARCHAR(4000) NULL,
    "Operator2" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator2" DEFAULT ((2)) NOT NULL,
    "ComparisonProperty2_Id" BIGINT NULL,
    "Property3_Id" BIGINT NULL,
    "Expression3" VARCHAR(4000) NULL,
    "Operator3" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator3" DEFAULT ((2)) NOT NULL,
    "ComparisonProperty3_Id" BIGINT NULL,
    "Property4_Id" BIGINT NULL,
    "Expression4" VARCHAR(4000) NULL,
    "Operator4" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator4" DEFAULT ((2)) NOT NULL,
    "ComparisonProperty4_Id" BIGINT NULL,
    "Property5_Id" BIGINT NULL,
    "Expression5" VARCHAR(4000) NULL,
    "Operator5" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator5" DEFAULT ((2)) NOT NULL,
    "ComparisonProperty5_Id" BIGINT NULL,
    CONSTRAINT "PK_HomonymEntityLinkFilters" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_HomonymEntityLinkFilters_HomonymEntityLink" FOREIGN KEY ("HomonymEntityLink_Id") REFERENCES "UW_HomonymEntityLinks" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property1" FOREIGN KEY ("Property1_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty1" FOREIGN KEY ("ComparisonProperty1_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property2" FOREIGN KEY ("Property2_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty2" FOREIGN KEY ("ComparisonProperty2_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property3" FOREIGN KEY ("Property3_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty3" FOREIGN KEY ("ComparisonProperty3_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property4" FOREIGN KEY ("Property4_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty4" FOREIGN KEY ("ComparisonProperty4_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property5" FOREIGN KEY ("Property5_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty5" FOREIGN KEY ("ComparisonProperty5_Id") REFERENCES "UM_EntityProperties" ("Id")
);

   GO
   CREATE TABLE "UW_UnicityCheckRules" (
    "Id" BIGINT NOT NULL,
    "Aspect_Id" BIGINT NOT NULL,
    "TargetEntityType_Id" BIGINT NOT NULL,
    "SourceBinding_Id" BIGINT NULL,
    "SourceExpression" VARCHAR(4000) NULL,
    "TargetBinding_Id" BIGINT NULL,
    "TargetExpression" VARCHAR(4000) NULL,
    CONSTRAINT "PK_UnicityCheckRules" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_UnicityCheckRules_Aspect" FOREIGN KEY ("Aspect_Id") REFERENCES "UW_Aspects" ("Id"),
    CONSTRAINT "FK_UnicityCheckRules_TargetEntityType" FOREIGN KEY ("TargetEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_UnicityCheckRules_SourceBinding" FOREIGN KEY ("SourceBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_UnicityCheckRules_TargetBinding" FOREIGN KEY ("TargetBinding_Id") REFERENCES "UM_Bindings" ("Id"),
);

   GO
   CREATE TABLE "UA_AccessControlFilters" (
    "Id" BIGINT NOT NULL,
    "Rule_Id" BIGINT NOT NULL,
    "Binding_Id" BIGINT NOT NULL,
    "CompositeRole" BIT CONSTRAINT "DF_AccessControlFilters_CompositeRole" DEFAULT ((0)) NOT NULL,
    "SingleRole" BIT CONSTRAINT "DF_AccessControlFilters_SingleRole" DEFAULT ((0)) NOT NULL,
    "ResourceType" BIT CONSTRAINT "DF_AccessControlFilters_ResourceType" DEFAULT ((0)) NOT NULL,
    "Category" BIT CONSTRAINT "DF_AccessControlFilters_Category" DEFAULT ((0)) NOT NULL,
    "CurrentUser" BIT CONSTRAINT "DF_AccessControlFilters_CurrentUser" DEFAULT ((0)) NOT NULL,
    "Operator" TINYINT CONSTRAINT "DF_AccessControlFilters_Operator" DEFAULT ((0)) NOT NULL,
    "Dimension_Id" BIGINT NULL,
    "Value" NVARCHAR(442) NULL,
    "Group" NVARCHAR(442) NULL,
    CONSTRAINT "PK_AccessControlFilters" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AccessControlFilters_Rule" FOREIGN KEY ("Rule_Id") REFERENCES "UA_AccessControlRules" ("Id"),
    CONSTRAINT "FK_AccessControlFilters_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_AccessControlFilters_Dimension" FOREIGN KEY ("Dimension_Id") REFERENCES "UM_Dimensions" ("Id"),
);

   GO
   CREATE TABLE "UA_ProfileContexts" (
    "Id" BIGINT NOT NULL,
    "IsAutomatic" BIT CONSTRAINT "DF_ProfileContexts_IsAutomatic" DEFAULT ((0)) NOT NULL,
    "CompositeRole_Id" BIGINT NULL,
    "SingleRole_Id" BIGINT NULL,
    "ResourceType_Id" BIGINT NULL,
    "Category_Id" BIGINT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    CONSTRAINT "PK_ProfileContexts" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ProfileContexts_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_ProfileContexts_CompositeRole" FOREIGN KEY ("CompositeRole_Id") REFERENCES "UP_CompositeRoles" ("Id"),
    CONSTRAINT "FK_ProfileContexts_SingleRole" FOREIGN KEY ("SingleRole_Id") REFERENCES "UP_SingleRoles" ("Id"),
    CONSTRAINT "FK_ProfileContexts_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
);
GO
CREATE INDEX "IX_ProfileContexts_CompositeRole" ON "UA_ProfileContexts" ("CompositeRole_Id") WHERE "CompositeRole_Id" IS NOT NULL
GO
CREATE INDEX "IX_ProfileContexts_SingleRole" ON "UA_ProfileContexts" ("SingleRole_Id") WHERE "SingleRole_Id" IS NOT NULL
GO
CREATE INDEX "IX_ProfileContexts_ResourceType" ON "UA_ProfileContexts" ("ResourceType_Id") WHERE "ResourceType_Id" IS NOT NULL
GO
CREATE INDEX "IX_ProfileContexts_Category" ON "UA_ProfileContexts" ("Category_Id") WHERE "Category_Id" IS NOT NULL
GO

   GO
   CREATE TABLE "UA_ProfileRuleContexts" (
    "Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NULL,
    "RootBinding_Id" BIGINT NULL,
    "SubBinding_Id" BIGINT NULL,
    "EntityType_Id" BIGINT NULL,
    "IsAppliedToRoot" BIT CONSTRAINT "DF_RuleContexts_IsAppliedToRoot" DEFAULT ((1)) NOT NULL,
    CONSTRAINT "PK_ProfileRuleContexts" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ProfileRuleContexts_RootBinding_Id" FOREIGN KEY ("RootBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRuleContexts_SubBinding_Id" FOREIGN KEY ("SubBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRuleContexts_ResourceType_Id" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ProfileRuleContexts_EntityType_Id" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
);

   GO
   CREATE TABLE "UC_ConnectionTables" (
    "Id" BIGINT NOT NULL,
    "Connection_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName" NVARCHAR(442) NULL,
    "Path" NVARCHAR(442) NULL,
    "UpdateDate" DATETIME NULL,
    CONSTRAINT "PK_ConnectionTables" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_ConnectionTables_Identifier" UNIQUE ("Connection_Id","Identifier"),
    CONSTRAINT "FK_ConnectionTables_Connection" FOREIGN KEY ("Connection_Id") REFERENCES "UC_Connections" ("Id"),
);

   GO
   CREATE TABLE "UC_ConnectionTransformations" (
    "Id" BIGINT NOT NULL,
    "Connection_Id" BIGINT NOT NULL,
    "Type" INT NOT NULL,
    "TransformationOrder" INT NOT NULL,
    "Table" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "Column" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn2" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn3" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn4" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn5" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "WhereOperator" INT NULL,
    "WhereValue" NVARCHAR(442) NULL,
    "DatePattern" NVARCHAR(442) NULL,
    "AddedDays" REAL NULL,
    "MinYear" INT NULL,
    "MaxYear" INT NULL,
    "ConcatSeparator" NVARCHAR(442) NULL,
    "RemoveEmpty" BIT NULL,
    "RemoveDuplicates" BIT NULL,
    "SortValues" BIT NULL,
    CONSTRAINT "PK_ConnectionTransformations" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ConnectionTransformations_Connection" FOREIGN KEY ("Connection_Id") REFERENCES "UC_Connections" ("Id"),
);

   GO
   CREATE TABLE "UC_EntityAssociationMappings" (
    "Id" BIGINT NOT NULL,
    "Connector_Id" BIGINT NOT NULL,
    "ConnectionTable" NVARCHAR(442) NULL,
    "Column1" NVARCHAR(442) NOT NULL,
    "Column2" NVARCHAR(442) NOT NULL,
    "EntityPropertyMapping1_Id" BIGINT NOT NULL,
    "EntityPropertyMapping2_Id" BIGINT NOT NULL,
    "MaximumInsertedLines" INT CONSTRAINT "DF_EntityAssociationMappings_MaximumInsertedLines" DEFAULT ((0)) NOT NULL,
    "MaximumDeletedLines" INT CONSTRAINT "DF_EntityAssociationMappings_MaximumDeletedLines" DEFAULT ((0)) NOT NULL,
    "MaxPercentageInsertedLines" INT CONSTRAINT "DF_EntityAssociationMappings_MaxPercentageInsertedLines" DEFAULT ((0)) NOT NULL,
    "MaxPercentageDeletedLines" INT CONSTRAINT "DF_EntityAssociationMappings_MaxPercentageDeletedLines" DEFAULT ((0)) NOT NULL,
    "C0" NVARCHAR(442) NULL,
    CONSTRAINT "PK_EntityAssociationMappings" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_EntityAssociationMappings_EntityAssociation" FOREIGN KEY ("Id") REFERENCES "UM_EntityAssociations" ("Id"),
    CONSTRAINT "FK_EntityAssociationMappings_Connector" FOREIGN KEY ("Connector_Id") REFERENCES "UC_Connectors" ("Id"),
    CONSTRAINT "FK_EntityAssociationMappings_EntityProperty1" FOREIGN KEY ("EntityPropertyMapping1_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_EntityAssociationMappings_EntityProperty2" FOREIGN KEY ("EntityPropertyMapping2_Id") REFERENCES "UM_EntityProperties" ("Id"),
);

   GO
   CREATE TABLE "UC_ResourceTypeMappings"
(
    "Id" BIGINT NOT NULL,
    "Connection_Id" BIGINT NOT NULL,
    "PasswordResetSetting_Id" BIGINT NULL,
    "C0" NVARCHAR(442) NULL,
    "C1" NVARCHAR(442) NULL,
    "C2" NVARCHAR(442) NULL,
    "C3" NVARCHAR(442) NULL,
    "C4" NVARCHAR(442) NULL,
    "C5" NVARCHAR(442) NULL,
    "C6" NVARCHAR(442) NULL,
    "C7" NVARCHAR(442) NULL,
    "C8" NVARCHAR(442) NULL,
    "C9" NVARCHAR(442) NULL,
    "C10" NVARCHAR(442) NULL,
    "Type" INT CONSTRAINT "DF_ResourceTypeMappings_Type" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_ResourceTypeMappings" PRIMARY KEY CLUSTERED("Id" ASC),
    CONSTRAINT "FK_ResourceTypeMappings_ResourceType" FOREIGN KEY ("Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ResourceTypeMappings_Connection" FOREIGN KEY ("Connection_Id") REFERENCES "UC_Connections" ("Id"),
    CONSTRAINT "FK_ResourceTypeMappings_PasswordResetSetting" FOREIGN KEY ("PasswordResetSetting_Id") REFERENCES "UC_PasswordResetSettings" ("Id"),
);

   GO
   CREATE TABLE "UD_ScaffoldingArguments"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "Scaffolding_Id" BIGINT NOT NULL,
    "Order" INT NOT NULL,
    "ScaffoldingArgumentType" INT CONSTRAINT "DF_ScaffoldingArguments_ScafolldingArgumentType" DEFAULT ((0)) NOT NULL,
    "Value" NVARCHAR(442) NULL,
    "ConnectorIdentifier" NVARCHAR(442) NULL,
    "TaskIdentifier" NVARCHAR(442) NULL,
    "Before" BIT NULL,
    "After" BIT NULL,
    "IsIncremental" BIT CONSTRAINT "DF_ScaffoldingArguments_IsIncremental" DEFAULT ((0)) NOT NULL,
    "CopyOccurence" INT NULL,
    "SearchBarPage" INT NULL,
    "Binding" NVARCHAR(442) NULL,
    "Count" INT NULL,
    "ForcedCount" INT NULL,
    "UniqueIdentifierPrefix" NVARCHAR(442) NULL,
    "UniqueIdentifierMin" INT NULL,
    "UniqueIdentifierMax" INT NULL,
    "LoginPrefix" NVARCHAR(442) NULL,
    "EmailDomain" NVARCHAR(442) NULL,
    "NameSeparator" NVARCHAR(442) NULL,
    CONSTRAINT "PK_ScaffoldingArguments" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ScaffoldingArguments_Scaffolding" FOREIGN KEY ("Scaffolding_Id") REFERENCES "UD_Scaffoldings" ("Id"),
);

   GO
   CREATE TABLE "UI_DisplayEntityAssociations"
(
    "Id" BIGINT NOT NULL,
    "IsHierarchical" BIT CONSTRAINT "DF_DisplayEntityAssociations_IsHierarchical" DEFAULT ((0)) NOT NULL,
    "ParentTreeNavDisplayProperty_Id" BIGINT NULL,
    CONSTRAINT "PK_DisplayEntityAssociations" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_DisplayEntityAssociations_EntityAssociation" FOREIGN KEY ("Id") REFERENCES "UM_EntityAssociations" ("Id"),
    CONSTRAINT "FK_DisplayEntityAssociations_ParentTreeNavDisplayProperty" FOREIGN KEY ("ParentTreeNavDisplayProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "CHK_DisplayEntityAssociations_ParentTreeNavDisplayProperty" CHECK (("IsHierarchical"=0 AND "ParentTreeNavDisplayProperty_Id" IS NULL) OR ("IsHierarchical"=1 AND "ParentTreeNavDisplayProperty_Id" IS NOT NULL)),
);

   GO
   CREATE TABLE "UI_DisplayEntityProperties"
(
    "Id" BIGINT NOT NULL,
    "IsRequired" BIT CONSTRAINT "DF_DisplayEntityProperties_IsRequired" DEFAULT ((0)) NOT NULL,
    "DisplayOrder" INT CONSTRAINT "DF_DisplayEntityProperties_DisplayOrder" DEFAULT ((0)) NOT NULL,
    "IsReadOnly" BIT CONSTRAINT "DF_DisplayEntityProperties_IsReadOnly" DEFAULT ((0)) NOT NULL,
    "IsHidden" BIT CONSTRAINT "DF_DisplayEntityProperties_IsHidden" DEFAULT ((0)) NOT NULL,
    "InputType_Id" BIGINT CONSTRAINT "DF_DisplayEntityProperties_InputType" DEFAULT ((-1)) NOT NULL,
    "OutputType_Id" BIGINT CONSTRAINT "DF_DisplayEntityProperties_OutputType" DEFAULT ((-1)) NOT NULL,
    "Tile_Id" BIGINT NULL,
    "DisplayTable_Id" BIGINT NULL,
    "Group_Id" BIGINT NULL,
    "NavigationBinding_Id" BIGINT NULL,
    "IconCode" VARCHAR(32) NULL,
    "PlaceHolderText_L1" NVARCHAR(64) NULL,
    "PlaceHolderText_L2" NVARCHAR(64) NULL,
    "PlaceHolderText_L3" NVARCHAR(64) NULL,
    "PlaceHolderText_L4" NVARCHAR(64) NULL,
    "PlaceHolderText_L5" NVARCHAR(64) NULL,
    "PlaceHolderText_L6" NVARCHAR(64) NULL,
    "PlaceHolderText_L7" NVARCHAR(64) NULL,
    "PlaceHolderText_L8" NVARCHAR(64) NULL,
    "PlaceHolderText_L9" NVARCHAR(64) NULL,
    "PlaceHolderText_L10" NVARCHAR(64) NULL,
    "PlaceHolderText_L11" NVARCHAR(64) NULL,
    "PlaceHolderText_L12" NVARCHAR(64) NULL,
    "PlaceHolderText_L13" NVARCHAR(64) NULL,
    "PlaceHolderText_L14" NVARCHAR(64) NULL,
    "PlaceHolderText_L15" NVARCHAR(64) NULL,
    "PlaceHolderText_L16" NVARCHAR(64) NULL,
    "ToolTipText_L1" NVARCHAR(1024) NULL,
    "ToolTipText_L2" NVARCHAR(1024) NULL,
    "ToolTipText_L3" NVARCHAR(1024) NULL,
    "ToolTipText_L4" NVARCHAR(1024) NULL,
    "ToolTipText_L5" NVARCHAR(1024) NULL,
    "ToolTipText_L6" NVARCHAR(1024) NULL,
    "ToolTipText_L7" NVARCHAR(1024) NULL,
    "ToolTipText_L8" NVARCHAR(1024) NULL,
    "ToolTipText_L9" NVARCHAR(1024) NULL,
    "ToolTipText_L10" NVARCHAR(1024) NULL,
    "ToolTipText_L11" NVARCHAR(1024) NULL,
    "ToolTipText_L12" NVARCHAR(1024) NULL,
    "ToolTipText_L13" NVARCHAR(1024) NULL,
    "ToolTipText_L14" NVARCHAR(1024) NULL,
    "ToolTipText_L15" NVARCHAR(1024) NULL,
    "ToolTipText_L16" NVARCHAR(1024) NULL,
    "Format" NVARCHAR(64) NULL,
    "AutocompleteBinding_Id" BIGINT NULL,
    "MinSearchLength" INT NULL,
    "AddedMinutes" INT NULL,
    CONSTRAINT "PK_DisplayEntityProperties" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_DisplayEntityProperties_EntityProperty" FOREIGN KEY ("Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_DisplayEntityProperties_InputType" FOREIGN KEY ("InputType_Id") REFERENCES "UI_InputTypes" ("Id"),
    CONSTRAINT "FK_DisplayEntityProperties_OutputType" FOREIGN KEY ("OutputType_Id") REFERENCES "UI_OutputTypes" ("Id"),
    CONSTRAINT "FK_DisplayEntityProperties_Tile" FOREIGN KEY ("Tile_Id") REFERENCES "UI_Tiles" ("Id"),
    CONSTRAINT "FK_DisplayEntityProperties_DisplayTable" FOREIGN KEY ("DisplayTable_Id") REFERENCES "UI_DisplayTables" ("Id"),
    CONSTRAINT "FK_DisplayEntityProperties_NavigationBinding" FOREIGN KEY ("NavigationBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_DisplayEntityProperties_Group" FOREIGN KEY ("Group_Id") REFERENCES "UI_DisplayPropertyGroups" ("Id"),
    CONSTRAINT "FK_DisplayEntityProperties_AutocompleteBinding" FOREIGN KEY ("AutocompleteBinding_Id") REFERENCES "UM_Bindings" ("Id")
);

   GO
   CREATE TABLE "UI_DisplayTableColumns"
(
    "Id" BIGINT NOT NULL,
    "DisplayTable_Id" BIGINT NOT NULL,
    "DisplayOrder" INT NOT NULL,
    "ColumnSize" INT CONSTRAINT "DF_DisplayTableColumns_ColumnSize" DEFAULT ((1)) NOT NULL,
    "IsResizable" BIT CONSTRAINT "DF_DisplayTableColumns_IsResizable" DEFAULT ((0)) NOT NULL,
    "IsSortable" BIT CONSTRAINT "DF_DisplayTableColumns_IsSortable" DEFAULT ((0)) NOT NULL,
    "CanBeFiltered" BIT CONSTRAINT "DF_DisplayTableColumns_CanBeFiltered" DEFAULT ((0)) NOT NULL,
    "IsDisplayInSummaryView" BIT CONSTRAINT "DF_DisplayTableColumns_IsDisplayInSummaryView" DEFAULT ((0)) NOT NULL,
    "IsDisplayInDropDownList" BIT CONSTRAINT "DF_DisplayTableColumns_IsDisplayInDropDownList" DEFAULT ((0)) NOT NULL,
    "SearchOperator" TINYINT CONSTRAINT "DF_DisplayTableColumns_SearchOperator" DEFAULT ((0)) NULL,
    "DisplayBinding_Id" BIGINT NULL,
    "OptimizedDisplayBinding_Id" BIGINT NULL,
    "Tile_Id" BIGINT NULL,
    "DefaultSortPriority" INT NULL,
    "SortBinding_Id" BIGINT NULL,
    "OptimizedSortBinding_Id" BIGINT NULL,
    "DisplayName_L1" NVARCHAR(64) NULL,
    "DisplayName_L2" NVARCHAR(64) NULL,
    "DisplayName_L3" NVARCHAR(64) NULL,
    "DisplayName_L4" NVARCHAR(64) NULL,
    "DisplayName_L5" NVARCHAR(64) NULL,
    "DisplayName_L6" NVARCHAR(64) NULL,
    "DisplayName_L7" NVARCHAR(64) NULL,
    "DisplayName_L8" NVARCHAR(64) NULL,
    "DisplayName_L9" NVARCHAR(64) NULL,
    "DisplayName_L10" NVARCHAR(64) NULL,
    "DisplayName_L11" NVARCHAR(64) NULL,
    "DisplayName_L12" NVARCHAR(64) NULL,
    "DisplayName_L13" NVARCHAR(64) NULL,
    "DisplayName_L14" NVARCHAR(64) NULL,
    "DisplayName_L15" NVARCHAR(64) NULL,
    "DisplayName_L16" NVARCHAR(64) NULL,
    "AddedMinutes" INT NULL,
    CONSTRAINT "PK_DisplayTableColumns" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_DisplayTableColumns_DisplayTable" FOREIGN KEY ("DisplayTable_Id") REFERENCES "UI_DisplayTables" ("Id"),
    CONSTRAINT "FK_DisplayTableColumns_DisplayBinding" FOREIGN KEY ("DisplayBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_DisplayTableColumns_OptimizedDisplayBinding" FOREIGN KEY ("OptimizedDisplayBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_DisplayTableColumns_SortBinding" FOREIGN KEY ("SortBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_DisplayTableColumns_OptimizedSortBinding" FOREIGN KEY ("OptimizedSortBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_DisplayTableColumns_Tile" FOREIGN KEY ("Tile_Id") REFERENCES "UI_Tiles" ("Id"),
    CONSTRAINT "CHK_DisplayTableColumns_BindingXorTile" CHECK (("DisplayBinding_Id" IS NULL AND "Tile_Id" IS NOT NULL) OR ("DisplayBinding_Id" IS NOT NULL AND "Tile_Id" IS NULL)),
    CONSTRAINT "CHK_DisplayTableColumns_ColumnSize" CHECK ("ColumnSize" >= 1 AND "ColumnSize" <= 12),
);

   GO
   CREATE TABLE "UI_Forms"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "IsDefaultViewForm" BIT CONSTRAINT "DF_Forms_IsDefaultViewForm" DEFAULT ((0)) NOT NULL,
    "IsDefaultSelfForm" BIT CONSTRAINT "DF_Forms_IsDefaultSelfForm" DEFAULT ((0)) NOT NULL,
    "HideRoles" BIT CONSTRAINT "DF_Forms_HideRoles" DEFAULT ((0)) NOT NULL,
    "HideRecordAddButton" BIT CONSTRAINT "DF_Forms_HideRecordAddButton" DEFAULT ((0)) NOT NULL,
    "HideRecordRemoveButton" BIT CONSTRAINT "DF_Forms_HideRecordRemoveButton" DEFAULT ((0)) NOT NULL,
    "IsDeleteForm" BIT CONSTRAINT "DF_Forms_IsDelete" DEFAULT ((0)) NOT NULL,
    "WorkflowRequestType" INT CONSTRAINT "DF_Forms_WorkflowRequestType" DEFAULT ((0)) NOT NULL,
    "FormType_Id" BIGINT CONSTRAINT "DF_Forms_FormType" DEFAULT ((-1)) NOT NULL,
    "RecordFilter" INT CONSTRAINT "DF_Forms_RecordFilter" DEFAULT ((1)) NOT NULL,
    "MainProperty_Id" BIGINT NULL,
    "RecordProperty_Id" BIGINT NULL,
    "RecordStartProperty_Id" BIGINT NULL,
    "RecordEndProperty_Id" BIGINT NULL,
    "RecordSortProperty_Id" BIGINT NULL,
    "RecordTable_Id" BIGINT NULL,
    "Activity_Id" BIGINT NULL,
    "ActivityState_Id" BIGINT NULL,
    "Menu_Id" BIGINT NULL,
    "FormTitle_L1" NVARCHAR(442) NULL,
    "FormTitle_L2" NVARCHAR(442) NULL,
    "FormTitle_L3" NVARCHAR(442) NULL,
    "FormTitle_L4" NVARCHAR(442) NULL,
    "FormTitle_L5" NVARCHAR(442) NULL,
    "FormTitle_L6" NVARCHAR(442) NULL,
    "FormTitle_L7" NVARCHAR(442) NULL,
    "FormTitle_L8" NVARCHAR(442) NULL,
    "FormTitle_L9" NVARCHAR(442) NULL,
    "FormTitle_L10" NVARCHAR(442) NULL,
    "FormTitle_L11" NVARCHAR(442) NULL,
    "FormTitle_L12" NVARCHAR(442) NULL,
    "FormTitle_L13" NVARCHAR(442) NULL,
    "FormTitle_L14" NVARCHAR(442) NULL,
    "FormTitle_L15" NVARCHAR(442) NULL,
    "FormTitle_L16" NVARCHAR(442) NULL,
    "MainPropertyLabel_L1" NVARCHAR(442) NULL,
    "MainPropertyLabel_L2" NVARCHAR(442) NULL,
    "MainPropertyLabel_L3" NVARCHAR(442) NULL,
    "MainPropertyLabel_L4" NVARCHAR(442) NULL,
    "MainPropertyLabel_L5" NVARCHAR(442) NULL,
    "MainPropertyLabel_L6" NVARCHAR(442) NULL,
    "MainPropertyLabel_L7" NVARCHAR(442) NULL,
    "MainPropertyLabel_L8" NVARCHAR(442) NULL,
    "MainPropertyLabel_L9" NVARCHAR(442) NULL,
    "MainPropertyLabel_L10" NVARCHAR(442) NULL,
    "MainPropertyLabel_L11" NVARCHAR(442) NULL,
    "MainPropertyLabel_L12" NVARCHAR(442) NULL,
    "MainPropertyLabel_L13" NVARCHAR(442) NULL,
    "MainPropertyLabel_L14" NVARCHAR(442) NULL,
    "MainPropertyLabel_L15" NVARCHAR(442) NULL,
    "MainPropertyLabel_L16" NVARCHAR(442) NULL,
    "TableTitle_L1" NVARCHAR(442) NULL,
    "TableTitle_L2" NVARCHAR(442) NULL,
    "TableTitle_L3" NVARCHAR(442) NULL,
    "TableTitle_L4" NVARCHAR(442) NULL,
    "TableTitle_L5" NVARCHAR(442) NULL,
    "TableTitle_L6" NVARCHAR(442) NULL,
    "TableTitle_L7" NVARCHAR(442) NULL,
    "TableTitle_L8" NVARCHAR(442) NULL,
    "TableTitle_L9" NVARCHAR(442) NULL,
    "TableTitle_L10" NVARCHAR(442) NULL,
    "TableTitle_L11" NVARCHAR(442) NULL,
    "TableTitle_L12" NVARCHAR(442) NULL,
    "TableTitle_L13" NVARCHAR(442) NULL,
    "TableTitle_L14" NVARCHAR(442) NULL,
    "TableTitle_L15" NVARCHAR(442) NULL,
    "TableTitle_L16" NVARCHAR(442) NULL,
    "AddRowLabel_L1" NVARCHAR(442) NULL,
    "AddRowLabel_L2" NVARCHAR(442) NULL,
    "AddRowLabel_L3" NVARCHAR(442) NULL,
    "AddRowLabel_L4" NVARCHAR(442) NULL,
    "AddRowLabel_L5" NVARCHAR(442) NULL,
    "AddRowLabel_L6" NVARCHAR(442) NULL,
    "AddRowLabel_L7" NVARCHAR(442) NULL,
    "AddRowLabel_L8" NVARCHAR(442) NULL,
    "AddRowLabel_L9" NVARCHAR(442) NULL,
    "AddRowLabel_L10" NVARCHAR(442) NULL,
    "AddRowLabel_L11" NVARCHAR(442) NULL,
    "AddRowLabel_L12" NVARCHAR(442) NULL,
    "AddRowLabel_L13" NVARCHAR(442) NULL,
    "AddRowLabel_L14" NVARCHAR(442) NULL,
    "AddRowLabel_L15" NVARCHAR(442) NULL,
    "AddRowLabel_L16" NVARCHAR(442) NULL,
	"RemoveRowLabel_L1" NVARCHAR(442) NULL,
    "RemoveRowLabel_L2" NVARCHAR(442) NULL,
    "RemoveRowLabel_L3" NVARCHAR(442) NULL,
    "RemoveRowLabel_L4" NVARCHAR(442) NULL,
    "RemoveRowLabel_L5" NVARCHAR(442) NULL,
    "RemoveRowLabel_L6" NVARCHAR(442) NULL,
    "RemoveRowLabel_L7" NVARCHAR(442) NULL,
    "RemoveRowLabel_L8" NVARCHAR(442) NULL,
    "RemoveRowLabel_L9" NVARCHAR(442) NULL,
    "RemoveRowLabel_L10" NVARCHAR(442) NULL,
    "RemoveRowLabel_L11" NVARCHAR(442) NULL,
    "RemoveRowLabel_L12" NVARCHAR(442) NULL,
    "RemoveRowLabel_L13" NVARCHAR(442) NULL,
    "RemoveRowLabel_L14" NVARCHAR(442) NULL,
    "RemoveRowLabel_L15" NVARCHAR(442) NULL,
    "RemoveRowLabel_L16" NVARCHAR(442) NULL,
    CONSTRAINT "PK_Forms" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Forms_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_Forms_MainProperty" FOREIGN KEY ("MainProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_Forms_RecordProperty" FOREIGN KEY ("RecordProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_Forms_RecordStartProperty" FOREIGN KEY ("RecordStartProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_Forms_RecordEndProperty" FOREIGN KEY ("RecordEndProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_Forms_RecordSortProperty" FOREIGN KEY ("RecordSortProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_Forms_RecordTable" FOREIGN KEY ("RecordTable_Id") REFERENCES "UI_DisplayTables" ("Id"),
    CONSTRAINT "FK_Forms_FormType" FOREIGN KEY ("FormType_Id") REFERENCES "UI_FormTypes" ("Id"),
    CONSTRAINT "FK_Forms_Activity" FOREIGN KEY ("Activity_Id") REFERENCES "UW_Activities" ("Id"),
    CONSTRAINT "FK_Forms_ActivityStep" FOREIGN KEY ("ActivityState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id"),
    CONSTRAINT "FK_Forms_Menu" FOREIGN KEY ("Menu_Id") REFERENCES "UI_MenuItems" ("Id"),
    CONSTRAINT "U_Forms_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UI_SearchBars"
(
    "Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "SearchBarDesignElement_Id" BIGINT NOT NULL,
    "SearchedEntityType_Id" BIGINT NOT NULL,
    "SearchedBinding_Id" BIGINT NULL,
    "Menu_Id" BIGINT NULL,
    CONSTRAINT "PK_SearchBars" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_SearchBars_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_SearchBars_SearchBarType" FOREIGN KEY ("SearchBarDesignElement_Id") REFERENCES "UI_SearchBarDesignElements" ("Id"),
    CONSTRAINT "FK_SearchBars_SearchedEntityType" FOREIGN KEY ("SearchedEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_SearchBars_SearchedBinding" FOREIGN KEY ("SearchedBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBars_Menu" FOREIGN KEY ("Menu_Id") REFERENCES "UI_MenuItems" ("Id"),
    CONSTRAINT "U_SearchBars_EntityType" UNIQUE ("EntityType_Id"),
);

   GO
   CREATE TABLE "UP_AutomationRules"
(
    "Id" BIGINT NOT NULL,
    "Type" TINYINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AutomationRules_WorkflowState" DEFAULT ((0)) NOT NULL,
    "HoursToWait" INT NOT NULL,
    "Decision" TINYINT CONSTRAINT "DF_AutomationRules_Decision" DEFAULT ((0)) NOT NULL ,
    "CompositeRole_Id" BIGINT NULL,
    "SingleRole_Id" BIGINT NULL,
    "ResourceType_Id" BIGINT NULL,
    "Category_Id" BIGINT NULL,
    "Policy_Id" BIGINT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "L0" BIT CONSTRAINT "DF_AutomationRules_L0" DEFAULT ((0)) NOT NULL,
    "L1" BIT CONSTRAINT "DF_AutomationRules_L1" DEFAULT ((0)) NOT NULL,
    "L2" BIT CONSTRAINT "DF_AutomationRules_L2" DEFAULT ((0)) NOT NULL,
    "L3" BIT CONSTRAINT "DF_AutomationRules_L3" DEFAULT ((0)) NOT NULL,
    "L4" BIT CONSTRAINT "DF_AutomationRules_L4" DEFAULT ((0)) NOT NULL,
    "L5" BIT CONSTRAINT "DF_AutomationRules_L5" DEFAULT ((0)) NOT NULL,
    "L6" BIT CONSTRAINT "DF_AutomationRules_L6" DEFAULT ((0)) NOT NULL,
    "L7" BIT CONSTRAINT "DF_AutomationRules_L7" DEFAULT ((0)) NOT NULL,
    "L8" BIT CONSTRAINT "DF_AutomationRules_L8" DEFAULT ((0)) NOT NULL,
    "L9" BIT CONSTRAINT "DF_AutomationRules_L9" DEFAULT ((0)) NOT NULL,
    "LA" BIT CONSTRAINT "DF_AutomationRules_LA" DEFAULT ((0)) NOT NULL,
    "LB" BIT CONSTRAINT "DF_AutomationRules_LB" DEFAULT ((0)) NOT NULL,
    "LC" BIT CONSTRAINT "DF_AutomationRules_LC" DEFAULT ((0)) NOT NULL,
    "LD" BIT CONSTRAINT "DF_AutomationRules_LD" DEFAULT ((0)) NOT NULL,
    "LE" BIT CONSTRAINT "DF_AutomationRules_LE" DEFAULT ((0)) NOT NULL,
    "LF" BIT CONSTRAINT "DF_AutomationRules_LF" DEFAULT ((0)) NOT NULL,
    "LG" BIT CONSTRAINT "DF_AutomationRules_LG" DEFAULT ((0)) NOT NULL,
    "LH" BIT CONSTRAINT "DF_AutomationRules_LH" DEFAULT ((0)) NOT NULL,
    "LI" BIT CONSTRAINT "DF_AutomationRules_LI" DEFAULT ((0)) NOT NULL,
    "LJ" BIT CONSTRAINT "DF_AutomationRules_LJ" DEFAULT ((0)) NOT NULL,
    "LK" BIT CONSTRAINT "DF_AutomationRules_LK" DEFAULT ((0)) NOT NULL,
    "LL" BIT CONSTRAINT "DF_AutomationRules_LL" DEFAULT ((0)) NOT NULL,
    "LM" BIT CONSTRAINT "DF_AutomationRules_LM" DEFAULT ((0)) NOT NULL,
    "LN" BIT CONSTRAINT "DF_AutomationRules_LN" DEFAULT ((0)) NOT NULL,
    "LO" BIT CONSTRAINT "DF_AutomationRules_LO" DEFAULT ((0)) NOT NULL,
    "LP" BIT CONSTRAINT "DF_AutomationRules_LP" DEFAULT ((0)) NOT NULL,
    "LQ" BIT CONSTRAINT "DF_AutomationRules_LQ" DEFAULT ((0)) NOT NULL,
    "LR" BIT CONSTRAINT "DF_AutomationRules_LR" DEFAULT ((0)) NOT NULL,
    "LS" BIT CONSTRAINT "DF_AutomationRules_LS" DEFAULT ((0)) NOT NULL,
    "LT" BIT CONSTRAINT "DF_AutomationRules_LT" DEFAULT ((0)) NOT NULL,
    "LU" BIT CONSTRAINT "DF_AutomationRules_LU" DEFAULT ((0)) NOT NULL,
    "LV" BIT CONSTRAINT "DF_AutomationRules_LV" DEFAULT ((0)) NOT NULL,
    "L10" BIT CONSTRAINT "DF_AutomationRules_L10" DEFAULT ((0)) NOT NULL,
    "L11" BIT CONSTRAINT "DF_AutomationRules_L11" DEFAULT ((0)) NOT NULL,
    "L12" BIT CONSTRAINT "DF_AutomationRules_L12" DEFAULT ((0)) NOT NULL,
    "L13" BIT CONSTRAINT "DF_AutomationRules_L13" DEFAULT ((0)) NOT NULL,
    "L14" BIT CONSTRAINT "DF_AutomationRules_L14" DEFAULT ((0)) NOT NULL,
    "L15" BIT CONSTRAINT "DF_AutomationRules_L15" DEFAULT ((0)) NOT NULL,
    "L16" BIT CONSTRAINT "DF_AutomationRules_L16" DEFAULT ((0)) NOT NULL,
    "L17" BIT CONSTRAINT "DF_AutomationRules_L17" DEFAULT ((0)) NOT NULL,
    "L18" BIT CONSTRAINT "DF_AutomationRules_L18" DEFAULT ((0)) NOT NULL,
    "L19" BIT CONSTRAINT "DF_AutomationRules_L19" DEFAULT ((0)) NOT NULL,
    "L1A" BIT CONSTRAINT "DF_AutomationRules_L1A" DEFAULT ((0)) NOT NULL,
    "L1B" BIT CONSTRAINT "DF_AutomationRules_L1B" DEFAULT ((0)) NOT NULL,
    "L1C" BIT CONSTRAINT "DF_AutomationRules_L1C" DEFAULT ((0)) NOT NULL,
    "L1D" BIT CONSTRAINT "DF_AutomationRules_L1D" DEFAULT ((0)) NOT NULL,
    "L1E" BIT CONSTRAINT "DF_AutomationRules_L1E" DEFAULT ((0)) NOT NULL,
    "L1F" BIT CONSTRAINT "DF_AutomationRules_L1F" DEFAULT ((0)) NOT NULL,
    "L1G" BIT CONSTRAINT "DF_AutomationRules_L1G" DEFAULT ((0)) NOT NULL,
    "L1H" BIT CONSTRAINT "DF_AutomationRules_L1H" DEFAULT ((0)) NOT NULL,
    "L1I" BIT CONSTRAINT "DF_AutomationRules_L1I" DEFAULT ((0)) NOT NULL,
    "L1J" BIT CONSTRAINT "DF_AutomationRules_L1J" DEFAULT ((0)) NOT NULL,
    "L1K" BIT CONSTRAINT "DF_AutomationRules_L1K" DEFAULT ((0)) NOT NULL,
    "L1L" BIT CONSTRAINT "DF_AutomationRules_L1L" DEFAULT ((0)) NOT NULL,
    "L1M" BIT CONSTRAINT "DF_AutomationRules_L1M" DEFAULT ((0)) NOT NULL,
    "L1N" BIT CONSTRAINT "DF_AutomationRules_L1N" DEFAULT ((0)) NOT NULL,
    "L1O" BIT CONSTRAINT "DF_AutomationRules_L1O" DEFAULT ((0)) NOT NULL,
    "L1P" BIT CONSTRAINT "DF_AutomationRules_L1P" DEFAULT ((0)) NOT NULL,
    "L1Q" BIT CONSTRAINT "DF_AutomationRules_L1Q" DEFAULT ((0)) NOT NULL,
    "L1R" BIT CONSTRAINT "DF_AutomationRules_L1R" DEFAULT ((0)) NOT NULL,
    "L1S" BIT CONSTRAINT "DF_AutomationRules_L1S" DEFAULT ((0)) NOT NULL,
    "L1T" BIT CONSTRAINT "DF_AutomationRules_L1T" DEFAULT ((0)) NOT NULL,
    "L1U" BIT CONSTRAINT "DF_AutomationRules_L1U" DEFAULT ((0)) NOT NULL,
    "L1V" BIT CONSTRAINT "DF_AutomationRules_L1V" DEFAULT ((0)) NOT NULL,
    "L20" BIT CONSTRAINT "DF_AutomationRules_L20" DEFAULT ((0)) NOT NULL,
    "L21" BIT CONSTRAINT "DF_AutomationRules_L21" DEFAULT ((0)) NOT NULL,
    "L22" BIT CONSTRAINT "DF_AutomationRules_L22" DEFAULT ((0)) NOT NULL,
    "L23" BIT CONSTRAINT "DF_AutomationRules_L23" DEFAULT ((0)) NOT NULL,
    "L24" BIT CONSTRAINT "DF_AutomationRules_L24" DEFAULT ((0)) NOT NULL,
    "L25" BIT CONSTRAINT "DF_AutomationRules_L25" DEFAULT ((0)) NOT NULL,
    "L26" BIT CONSTRAINT "DF_AutomationRules_L26" DEFAULT ((0)) NOT NULL,
    "L27" BIT CONSTRAINT "DF_AutomationRules_L27" DEFAULT ((0)) NOT NULL,
    "L28" BIT CONSTRAINT "DF_AutomationRules_L28" DEFAULT ((0)) NOT NULL,
    "L29" BIT CONSTRAINT "DF_AutomationRules_L29" DEFAULT ((0)) NOT NULL,
    "L2A" BIT CONSTRAINT "DF_AutomationRules_L2A" DEFAULT ((0)) NOT NULL,
    "L2B" BIT CONSTRAINT "DF_AutomationRules_L2B" DEFAULT ((0)) NOT NULL,
    "L2C" BIT CONSTRAINT "DF_AutomationRules_L2C" DEFAULT ((0)) NOT NULL,
    "L2D" BIT CONSTRAINT "DF_AutomationRules_L2D" DEFAULT ((0)) NOT NULL,
    "L2E" BIT CONSTRAINT "DF_AutomationRules_L2E" DEFAULT ((0)) NOT NULL,
    "L2F" BIT CONSTRAINT "DF_AutomationRules_L2F" DEFAULT ((0)) NOT NULL,
    "L2G" BIT CONSTRAINT "DF_AutomationRules_L2G" DEFAULT ((0)) NOT NULL,
    "L2H" BIT CONSTRAINT "DF_AutomationRules_L2H" DEFAULT ((0)) NOT NULL,
    "L2I" BIT CONSTRAINT "DF_AutomationRules_L2I" DEFAULT ((0)) NOT NULL,
    "L2J" BIT CONSTRAINT "DF_AutomationRules_L2J" DEFAULT ((0)) NOT NULL,
    "L2K" BIT CONSTRAINT "DF_AutomationRules_L2K" DEFAULT ((0)) NOT NULL,
    "L2L" BIT CONSTRAINT "DF_AutomationRules_L2L" DEFAULT ((0)) NOT NULL,
    "L2M" BIT CONSTRAINT "DF_AutomationRules_L2M" DEFAULT ((0)) NOT NULL,
    "L2N" BIT CONSTRAINT "DF_AutomationRules_L2N" DEFAULT ((0)) NOT NULL,
    "L2O" BIT CONSTRAINT "DF_AutomationRules_L2O" DEFAULT ((0)) NOT NULL,
    "L2P" BIT CONSTRAINT "DF_AutomationRules_L2P" DEFAULT ((0)) NOT NULL,
    "L2Q" BIT CONSTRAINT "DF_AutomationRules_L2Q" DEFAULT ((0)) NOT NULL,
    "L2R" BIT CONSTRAINT "DF_AutomationRules_L2R" DEFAULT ((0)) NOT NULL,
    "L2S" BIT CONSTRAINT "DF_AutomationRules_L2S" DEFAULT ((0)) NOT NULL,
    "L2T" BIT CONSTRAINT "DF_AutomationRules_L2T" DEFAULT ((0)) NOT NULL,
    "L2U" BIT CONSTRAINT "DF_AutomationRules_L2U" DEFAULT ((0)) NOT NULL,
    "L2V" BIT CONSTRAINT "DF_AutomationRules_L2V" DEFAULT ((0)) NOT NULL,
    "L30" BIT CONSTRAINT "DF_AutomationRules_L30" DEFAULT ((0)) NOT NULL,
    "L31" BIT CONSTRAINT "DF_AutomationRules_L31" DEFAULT ((0)) NOT NULL,
    "L32" BIT CONSTRAINT "DF_AutomationRules_L32" DEFAULT ((0)) NOT NULL,
    "L33" BIT CONSTRAINT "DF_AutomationRules_L33" DEFAULT ((0)) NOT NULL,
    "L34" BIT CONSTRAINT "DF_AutomationRules_L34" DEFAULT ((0)) NOT NULL,
    "L35" BIT CONSTRAINT "DF_AutomationRules_L35" DEFAULT ((0)) NOT NULL,
    "L36" BIT CONSTRAINT "DF_AutomationRules_L36" DEFAULT ((0)) NOT NULL,
    "L37" BIT CONSTRAINT "DF_AutomationRules_L37" DEFAULT ((0)) NOT NULL,
    "L38" BIT CONSTRAINT "DF_AutomationRules_L38" DEFAULT ((0)) NOT NULL,
    "L39" BIT CONSTRAINT "DF_AutomationRules_L39" DEFAULT ((0)) NOT NULL,
    "L3A" BIT CONSTRAINT "DF_AutomationRules_L3A" DEFAULT ((0)) NOT NULL,
    "L3B" BIT CONSTRAINT "DF_AutomationRules_L3B" DEFAULT ((0)) NOT NULL,
    "L3C" BIT CONSTRAINT "DF_AutomationRules_L3C" DEFAULT ((0)) NOT NULL,
    "L3D" BIT CONSTRAINT "DF_AutomationRules_L3D" DEFAULT ((0)) NOT NULL,
    "L3E" BIT CONSTRAINT "DF_AutomationRules_L3E" DEFAULT ((0)) NOT NULL,
    "L3F" BIT CONSTRAINT "DF_AutomationRules_L3F" DEFAULT ((0)) NOT NULL,
    "L3G" BIT CONSTRAINT "DF_AutomationRules_L3G" DEFAULT ((0)) NOT NULL,
    "L3H" BIT CONSTRAINT "DF_AutomationRules_L3H" DEFAULT ((0)) NOT NULL,
    "L3I" BIT CONSTRAINT "DF_AutomationRules_L3I" DEFAULT ((0)) NOT NULL,
    "L3J" BIT CONSTRAINT "DF_AutomationRules_L3J" DEFAULT ((0)) NOT NULL,
    "L3K" BIT CONSTRAINT "DF_AutomationRules_L3K" DEFAULT ((0)) NOT NULL,
    "L3L" BIT CONSTRAINT "DF_AutomationRules_L3L" DEFAULT ((0)) NOT NULL,
    "L3M" BIT CONSTRAINT "DF_AutomationRules_L3M" DEFAULT ((0)) NOT NULL,
    "L3N" BIT CONSTRAINT "DF_AutomationRules_L3N" DEFAULT ((0)) NOT NULL,
    "L3O" BIT CONSTRAINT "DF_AutomationRules_L3O" DEFAULT ((0)) NOT NULL,
    "L3P" BIT CONSTRAINT "DF_AutomationRules_L3P" DEFAULT ((0)) NOT NULL,
    "L3Q" BIT CONSTRAINT "DF_AutomationRules_L3Q" DEFAULT ((0)) NOT NULL,
    "L3R" BIT CONSTRAINT "DF_AutomationRules_L3R" DEFAULT ((0)) NOT NULL,
    "L3S" BIT CONSTRAINT "DF_AutomationRules_L3S" DEFAULT ((0)) NOT NULL,
    "L3T" BIT CONSTRAINT "DF_AutomationRules_L3T" DEFAULT ((0)) NOT NULL,
    "L3U" BIT CONSTRAINT "DF_AutomationRules_L3U" DEFAULT ((0)) NOT NULL,
    "L3V" BIT CONSTRAINT "DF_AutomationRules_L3V" DEFAULT ((0)) NOT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    CONSTRAINT "PK_AutomationRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AutomationRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_AutomationRules_CompositeRole" FOREIGN KEY ("CompositeRole_Id") REFERENCES "UP_CompositeRoles" ("Id"),
    CONSTRAINT "FK_AutomationRules_SingleRole" FOREIGN KEY ("SingleRole_Id") REFERENCES "UP_SingleRoles" ("Id"),
    CONSTRAINT "FK_AutomationRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_AutomationRules_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_AutomationRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
);
GO

   GO
   CREATE TABLE "UP_CompositeRoleRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "Type" INT CONSTRAINT "DF_CompositeRoleRules_Type" DEFAULT((0)) NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Role_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_CompositeRoleRules_IsDenied" DEFAULT ((0)) NOT NULL,
    "Priority" INT CONSTRAINT "DF_CompositeRoleRules_Priority" DEFAULT((0)) NOT NULL,
    "L0" BIT CONSTRAINT "DF_CompositeRoleRules_L0" DEFAULT ((0)) NOT NULL,
    "L1" BIT CONSTRAINT "DF_CompositeRoleRules_L1" DEFAULT ((0)) NOT NULL,
    "L2" BIT CONSTRAINT "DF_CompositeRoleRules_L2" DEFAULT ((0)) NOT NULL,
    "L3" BIT CONSTRAINT "DF_CompositeRoleRules_L3" DEFAULT ((0)) NOT NULL,
    "L4" BIT CONSTRAINT "DF_CompositeRoleRules_L4" DEFAULT ((0)) NOT NULL,
    "L5" BIT CONSTRAINT "DF_CompositeRoleRules_L5" DEFAULT ((0)) NOT NULL,
    "L6" BIT CONSTRAINT "DF_CompositeRoleRules_L6" DEFAULT ((0)) NOT NULL,
    "L7" BIT CONSTRAINT "DF_CompositeRoleRules_L7" DEFAULT ((0)) NOT NULL,
    "L8" BIT CONSTRAINT "DF_CompositeRoleRules_L8" DEFAULT ((0)) NOT NULL,
    "L9" BIT CONSTRAINT "DF_CompositeRoleRules_L9" DEFAULT ((0)) NOT NULL,
    "LA" BIT CONSTRAINT "DF_CompositeRoleRules_LA" DEFAULT ((0)) NOT NULL,
    "LB" BIT CONSTRAINT "DF_CompositeRoleRules_LB" DEFAULT ((0)) NOT NULL,
    "LC" BIT CONSTRAINT "DF_CompositeRoleRules_LC" DEFAULT ((0)) NOT NULL,
    "LD" BIT CONSTRAINT "DF_CompositeRoleRules_LD" DEFAULT ((0)) NOT NULL,
    "LE" BIT CONSTRAINT "DF_CompositeRoleRules_LE" DEFAULT ((0)) NOT NULL,
    "LF" BIT CONSTRAINT "DF_CompositeRoleRules_LF" DEFAULT ((0)) NOT NULL,
    "LG" BIT CONSTRAINT "DF_CompositeRoleRules_LG" DEFAULT ((0)) NOT NULL,
    "LH" BIT CONSTRAINT "DF_CompositeRoleRules_LH" DEFAULT ((0)) NOT NULL,
    "LI" BIT CONSTRAINT "DF_CompositeRoleRules_LI" DEFAULT ((0)) NOT NULL,
    "LJ" BIT CONSTRAINT "DF_CompositeRoleRules_LJ" DEFAULT ((0)) NOT NULL,
    "LK" BIT CONSTRAINT "DF_CompositeRoleRules_LK" DEFAULT ((0)) NOT NULL,
    "LL" BIT CONSTRAINT "DF_CompositeRoleRules_LL" DEFAULT ((0)) NOT NULL,
    "LM" BIT CONSTRAINT "DF_CompositeRoleRules_LM" DEFAULT ((0)) NOT NULL,
    "LN" BIT CONSTRAINT "DF_CompositeRoleRules_LN" DEFAULT ((0)) NOT NULL,
    "LO" BIT CONSTRAINT "DF_CompositeRoleRules_LO" DEFAULT ((0)) NOT NULL,
    "LP" BIT CONSTRAINT "DF_CompositeRoleRules_LP" DEFAULT ((0)) NOT NULL,
    "LQ" BIT CONSTRAINT "DF_CompositeRoleRules_LQ" DEFAULT ((0)) NOT NULL,
    "LR" BIT CONSTRAINT "DF_CompositeRoleRules_LR" DEFAULT ((0)) NOT NULL,
    "LS" BIT CONSTRAINT "DF_CompositeRoleRules_LS" DEFAULT ((0)) NOT NULL,
    "LT" BIT CONSTRAINT "DF_CompositeRoleRules_LT" DEFAULT ((0)) NOT NULL,
    "LU" BIT CONSTRAINT "DF_CompositeRoleRules_LU" DEFAULT ((0)) NOT NULL,
    "LV" BIT CONSTRAINT "DF_CompositeRoleRules_LV" DEFAULT ((0)) NOT NULL,
    "L10" BIT CONSTRAINT "DF_CompositeRoleRules_L10" DEFAULT ((0)) NOT NULL,
    "L11" BIT CONSTRAINT "DF_CompositeRoleRules_L11" DEFAULT ((0)) NOT NULL,
    "L12" BIT CONSTRAINT "DF_CompositeRoleRules_L12" DEFAULT ((0)) NOT NULL,
    "L13" BIT CONSTRAINT "DF_CompositeRoleRules_L13" DEFAULT ((0)) NOT NULL,
    "L14" BIT CONSTRAINT "DF_CompositeRoleRules_L14" DEFAULT ((0)) NOT NULL,
    "L15" BIT CONSTRAINT "DF_CompositeRoleRules_L15" DEFAULT ((0)) NOT NULL,
    "L16" BIT CONSTRAINT "DF_CompositeRoleRules_L16" DEFAULT ((0)) NOT NULL,
    "L17" BIT CONSTRAINT "DF_CompositeRoleRules_L17" DEFAULT ((0)) NOT NULL,
    "L18" BIT CONSTRAINT "DF_CompositeRoleRules_L18" DEFAULT ((0)) NOT NULL,
    "L19" BIT CONSTRAINT "DF_CompositeRoleRules_L19" DEFAULT ((0)) NOT NULL,
    "L1A" BIT CONSTRAINT "DF_CompositeRoleRules_L1A" DEFAULT ((0)) NOT NULL,
    "L1B" BIT CONSTRAINT "DF_CompositeRoleRules_L1B" DEFAULT ((0)) NOT NULL,
    "L1C" BIT CONSTRAINT "DF_CompositeRoleRules_L1C" DEFAULT ((0)) NOT NULL,
    "L1D" BIT CONSTRAINT "DF_CompositeRoleRules_L1D" DEFAULT ((0)) NOT NULL,
    "L1E" BIT CONSTRAINT "DF_CompositeRoleRules_L1E" DEFAULT ((0)) NOT NULL,
    "L1F" BIT CONSTRAINT "DF_CompositeRoleRules_L1F" DEFAULT ((0)) NOT NULL,
    "L1G" BIT CONSTRAINT "DF_CompositeRoleRules_L1G" DEFAULT ((0)) NOT NULL,
    "L1H" BIT CONSTRAINT "DF_CompositeRoleRules_L1H" DEFAULT ((0)) NOT NULL,
    "L1I" BIT CONSTRAINT "DF_CompositeRoleRules_L1I" DEFAULT ((0)) NOT NULL,
    "L1J" BIT CONSTRAINT "DF_CompositeRoleRules_L1J" DEFAULT ((0)) NOT NULL,
    "L1K" BIT CONSTRAINT "DF_CompositeRoleRules_L1K" DEFAULT ((0)) NOT NULL,
    "L1L" BIT CONSTRAINT "DF_CompositeRoleRules_L1L" DEFAULT ((0)) NOT NULL,
    "L1M" BIT CONSTRAINT "DF_CompositeRoleRules_L1M" DEFAULT ((0)) NOT NULL,
    "L1N" BIT CONSTRAINT "DF_CompositeRoleRules_L1N" DEFAULT ((0)) NOT NULL,
    "L1O" BIT CONSTRAINT "DF_CompositeRoleRules_L1O" DEFAULT ((0)) NOT NULL,
    "L1P" BIT CONSTRAINT "DF_CompositeRoleRules_L1P" DEFAULT ((0)) NOT NULL,
    "L1Q" BIT CONSTRAINT "DF_CompositeRoleRules_L1Q" DEFAULT ((0)) NOT NULL,
    "L1R" BIT CONSTRAINT "DF_CompositeRoleRules_L1R" DEFAULT ((0)) NOT NULL,
    "L1S" BIT CONSTRAINT "DF_CompositeRoleRules_L1S" DEFAULT ((0)) NOT NULL,
    "L1T" BIT CONSTRAINT "DF_CompositeRoleRules_L1T" DEFAULT ((0)) NOT NULL,
    "L1U" BIT CONSTRAINT "DF_CompositeRoleRules_L1U" DEFAULT ((0)) NOT NULL,
    "L1V" BIT CONSTRAINT "DF_CompositeRoleRules_L1V" DEFAULT ((0)) NOT NULL,
    "L20" BIT CONSTRAINT "DF_CompositeRoleRules_L20" DEFAULT ((0)) NOT NULL,
    "L21" BIT CONSTRAINT "DF_CompositeRoleRules_L21" DEFAULT ((0)) NOT NULL,
    "L22" BIT CONSTRAINT "DF_CompositeRoleRules_L22" DEFAULT ((0)) NOT NULL,
    "L23" BIT CONSTRAINT "DF_CompositeRoleRules_L23" DEFAULT ((0)) NOT NULL,
    "L24" BIT CONSTRAINT "DF_CompositeRoleRules_L24" DEFAULT ((0)) NOT NULL,
    "L25" BIT CONSTRAINT "DF_CompositeRoleRules_L25" DEFAULT ((0)) NOT NULL,
    "L26" BIT CONSTRAINT "DF_CompositeRoleRules_L26" DEFAULT ((0)) NOT NULL,
    "L27" BIT CONSTRAINT "DF_CompositeRoleRules_L27" DEFAULT ((0)) NOT NULL,
    "L28" BIT CONSTRAINT "DF_CompositeRoleRules_L28" DEFAULT ((0)) NOT NULL,
    "L29" BIT CONSTRAINT "DF_CompositeRoleRules_L29" DEFAULT ((0)) NOT NULL,
    "L2A" BIT CONSTRAINT "DF_CompositeRoleRules_L2A" DEFAULT ((0)) NOT NULL,
    "L2B" BIT CONSTRAINT "DF_CompositeRoleRules_L2B" DEFAULT ((0)) NOT NULL,
    "L2C" BIT CONSTRAINT "DF_CompositeRoleRules_L2C" DEFAULT ((0)) NOT NULL,
    "L2D" BIT CONSTRAINT "DF_CompositeRoleRules_L2D" DEFAULT ((0)) NOT NULL,
    "L2E" BIT CONSTRAINT "DF_CompositeRoleRules_L2E" DEFAULT ((0)) NOT NULL,
    "L2F" BIT CONSTRAINT "DF_CompositeRoleRules_L2F" DEFAULT ((0)) NOT NULL,
    "L2G" BIT CONSTRAINT "DF_CompositeRoleRules_L2G" DEFAULT ((0)) NOT NULL,
    "L2H" BIT CONSTRAINT "DF_CompositeRoleRules_L2H" DEFAULT ((0)) NOT NULL,
    "L2I" BIT CONSTRAINT "DF_CompositeRoleRules_L2I" DEFAULT ((0)) NOT NULL,
    "L2J" BIT CONSTRAINT "DF_CompositeRoleRules_L2J" DEFAULT ((0)) NOT NULL,
    "L2K" BIT CONSTRAINT "DF_CompositeRoleRules_L2K" DEFAULT ((0)) NOT NULL,
    "L2L" BIT CONSTRAINT "DF_CompositeRoleRules_L2L" DEFAULT ((0)) NOT NULL,
    "L2M" BIT CONSTRAINT "DF_CompositeRoleRules_L2M" DEFAULT ((0)) NOT NULL,
    "L2N" BIT CONSTRAINT "DF_CompositeRoleRules_L2N" DEFAULT ((0)) NOT NULL,
    "L2O" BIT CONSTRAINT "DF_CompositeRoleRules_L2O" DEFAULT ((0)) NOT NULL,
    "L2P" BIT CONSTRAINT "DF_CompositeRoleRules_L2P" DEFAULT ((0)) NOT NULL,
    "L2Q" BIT CONSTRAINT "DF_CompositeRoleRules_L2Q" DEFAULT ((0)) NOT NULL,
    "L2R" BIT CONSTRAINT "DF_CompositeRoleRules_L2R" DEFAULT ((0)) NOT NULL,
    "L2S" BIT CONSTRAINT "DF_CompositeRoleRules_L2S" DEFAULT ((0)) NOT NULL,
    "L2T" BIT CONSTRAINT "DF_CompositeRoleRules_L2T" DEFAULT ((0)) NOT NULL,
    "L2U" BIT CONSTRAINT "DF_CompositeRoleRules_L2U" DEFAULT ((0)) NOT NULL,
    "L2V" BIT CONSTRAINT "DF_CompositeRoleRules_L2V" DEFAULT ((0)) NOT NULL,
    "L30" BIT CONSTRAINT "DF_CompositeRoleRules_L30" DEFAULT ((0)) NOT NULL,
    "L31" BIT CONSTRAINT "DF_CompositeRoleRules_L31" DEFAULT ((0)) NOT NULL,
    "L32" BIT CONSTRAINT "DF_CompositeRoleRules_L32" DEFAULT ((0)) NOT NULL,
    "L33" BIT CONSTRAINT "DF_CompositeRoleRules_L33" DEFAULT ((0)) NOT NULL,
    "L34" BIT CONSTRAINT "DF_CompositeRoleRules_L34" DEFAULT ((0)) NOT NULL,
    "L35" BIT CONSTRAINT "DF_CompositeRoleRules_L35" DEFAULT ((0)) NOT NULL,
    "L36" BIT CONSTRAINT "DF_CompositeRoleRules_L36" DEFAULT ((0)) NOT NULL,
    "L37" BIT CONSTRAINT "DF_CompositeRoleRules_L37" DEFAULT ((0)) NOT NULL,
    "L38" BIT CONSTRAINT "DF_CompositeRoleRules_L38" DEFAULT ((0)) NOT NULL,
    "L39" BIT CONSTRAINT "DF_CompositeRoleRules_L39" DEFAULT ((0)) NOT NULL,
    "L3A" BIT CONSTRAINT "DF_CompositeRoleRules_L3A" DEFAULT ((0)) NOT NULL,
    "L3B" BIT CONSTRAINT "DF_CompositeRoleRules_L3B" DEFAULT ((0)) NOT NULL,
    "L3C" BIT CONSTRAINT "DF_CompositeRoleRules_L3C" DEFAULT ((0)) NOT NULL,
    "L3D" BIT CONSTRAINT "DF_CompositeRoleRules_L3D" DEFAULT ((0)) NOT NULL,
    "L3E" BIT CONSTRAINT "DF_CompositeRoleRules_L3E" DEFAULT ((0)) NOT NULL,
    "L3F" BIT CONSTRAINT "DF_CompositeRoleRules_L3F" DEFAULT ((0)) NOT NULL,
    "L3G" BIT CONSTRAINT "DF_CompositeRoleRules_L3G" DEFAULT ((0)) NOT NULL,
    "L3H" BIT CONSTRAINT "DF_CompositeRoleRules_L3H" DEFAULT ((0)) NOT NULL,
    "L3I" BIT CONSTRAINT "DF_CompositeRoleRules_L3I" DEFAULT ((0)) NOT NULL,
    "L3J" BIT CONSTRAINT "DF_CompositeRoleRules_L3J" DEFAULT ((0)) NOT NULL,
    "L3K" BIT CONSTRAINT "DF_CompositeRoleRules_L3K" DEFAULT ((0)) NOT NULL,
    "L3L" BIT CONSTRAINT "DF_CompositeRoleRules_L3L" DEFAULT ((0)) NOT NULL,
    "L3M" BIT CONSTRAINT "DF_CompositeRoleRules_L3M" DEFAULT ((0)) NOT NULL,
    "L3N" BIT CONSTRAINT "DF_CompositeRoleRules_L3N" DEFAULT ((0)) NOT NULL,
    "L3O" BIT CONSTRAINT "DF_CompositeRoleRules_L3O" DEFAULT ((0)) NOT NULL,
    "L3P" BIT CONSTRAINT "DF_CompositeRoleRules_L3P" DEFAULT ((0)) NOT NULL,
    "L3Q" BIT CONSTRAINT "DF_CompositeRoleRules_L3Q" DEFAULT ((0)) NOT NULL,
    "L3R" BIT CONSTRAINT "DF_CompositeRoleRules_L3R" DEFAULT ((0)) NOT NULL,
    "L3S" BIT CONSTRAINT "DF_CompositeRoleRules_L3S" DEFAULT ((0)) NOT NULL,
    "L3T" BIT CONSTRAINT "DF_CompositeRoleRules_L3T" DEFAULT ((0)) NOT NULL,
    "L3U" BIT CONSTRAINT "DF_CompositeRoleRules_L3U" DEFAULT ((0)) NOT NULL,
    "L3V" BIT CONSTRAINT "DF_CompositeRoleRules_L3V" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "ParentRole_Id" BIGINT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    "BaseRule_Id" BIGINT CONSTRAINT "DF_CompositeRoleRules_BaseRule" DEFAULT((0)) NULL,
    CONSTRAINT "PK_CompositeRoleRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_CompositeRoleRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_CompositeRoleRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_CompositeRoleRules_CompositeRoles" FOREIGN KEY ("Role_Id") REFERENCES "UP_CompositeRoles" ("Id"),
    CONSTRAINT "FK_CompositeRoleRules_ParentRole" FOREIGN KEY ("ParentRole_Id") REFERENCES "UP_CompositeRoles" ("Id"),
);
GO
CREATE CLUSTERED INDEX "IX_CompositeRoleRules" ON "UP_CompositeRoleRules" ("EntityType_Id" ASC,"Role_Id" ASC, "Id" ASC);
GO
ALTER TABLE "UP_CompositeRoleRules" NOCHECK CONSTRAINT "FK_CompositeRoleRules_ParentRole";
GO

   GO
   CREATE TABLE "UP_CompositeRolesCategories" (
    "CompositeRole_Id" BIGINT NOT NULL,
    "Category_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_CompositeRolesCategories" PRIMARY KEY CLUSTERED ("CompositeRole_Id" ASC, "Category_Id" ASC),
    CONSTRAINT "FK_CompositeRolesCategories_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_CompositeRolesCategories_CompositeRole" FOREIGN KEY ("CompositeRole_Id") REFERENCES "UP_CompositeRoles" ("Id")
);

   GO
   CREATE TABLE "UP_IndirectResourceRules"
(
    "Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "Correspondence_Id" BIGINT NULL,
    "CorrespondenceMembershipProperty_Id" BIGINT NULL,
    "Entitlement_Id" BIGINT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_IndirectResourceRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_IndirectResourceRules_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_IndirectResourceRules_Correspondence" FOREIGN KEY (Correspondence_Id) REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_IndirectResourceRules_CorrespondenceMembershipProperty" FOREIGN KEY ("CorrespondenceMembershipProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_IndirectResourceRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_IndirectResourceRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_IndirectResourceRules_Entitlement" FOREIGN KEY ("Entitlement_Id") REFERENCES "UM_EntityProperties" ("Id"),
);
GO
CREATE CLUSTERED INDEX "IX_IndirectResourceRules" ON "UP_IndirectResourceRules" ("EntityType_Id" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_RecordProperties" (
    "Id" BIGINT NOT NULL,
    "Section_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "ExtensionKind" INT CONSTRAINT "DF_RecordPropertis_ExtensionKind" DEFAULT ((0)) NOT NULL,
    "IsExcluded" BIT CONSTRAINT "DF_PolicySimulations_IsExcluded" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_RecordProperties" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_RecordProperties_Section_Id" FOREIGN KEY ("Section_Id") REFERENCES "UP_RecordSections" ("Id"),
    CONSTRAINT "FK_RecordProperties_Property_Id" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
);

   GO
   CREATE TABLE "UP_ResourceBinaryRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "TimeOffsetReference" INT CONSTRAINT "DF_ResourceBinaryRules_TimeOffsetReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetBeforeReference" INT CONSTRAINT "DF_ResourceBinaryRules_TimeOffsetBeforeReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetAfterReference" INT CONSTRAINT "DF_ResourceBinaryRules_TimeOffsetAfterReference" DEFAULT ((0)) NOT NULL,
    "Binding_Id" BIGINT NULL,
    "SingleRole_Id" BIGINT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_ResourceBinaryRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceBinaryRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceBinaryRules_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_ResourceBinaryRules_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ResourceBinaryRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceBinaryRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ResourceBinaryRules_SingleRole" FOREIGN KEY ("SingleRole_Id") REFERENCES "UP_SingleRoles" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_ResourceBinaryRules" ON "UP_ResourceBinaryRules" ("EntityType_Id" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_ResourceClassificationRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "ResourceTypeIdentificationConfidenceLevel" INT CONSTRAINT "DF_ResourceClassificationRules_ResourceTypeIdentificationConfidenceLevel" DEFAULT ((0)) NOT NULL,
    "SourceMatchedConfidenceLevel" BIT CONSTRAINT "DF_ResourceClassificationRules_SourceMatchedConfidenceLevel" DEFAULT ((0)) NOT NULL,
    "TargetExpression" VARCHAR(4000) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "BaseRule_Id" BIGINT CONSTRAINT "DF_ResourceClassificationRules_BaseRuleId" DEFAULT((0)) NULL,
    CONSTRAINT "PK_ResourceClassificationRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceClassificationRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceClassificationRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceClassificationRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_ResourceClassificationRules" ON "UP_ResourceClassificationRules" ("EntityType_Id" ASC, "ResourceType_Id" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_ResourceCorrelationRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "SourceBinding_Id" BIGINT NULL,
    "SourceExpression" VARCHAR(4000) NULL,
    "TargetBinding_Id" BIGINT NULL,
    "TargetExpression" VARCHAR(4000) NULL,
    "SourceMatchedConfidenceLevel" INT CONSTRAINT "DF_ResourceCorrelationRules_SourceMatchedConfidenceLevel" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "BaseRule_Id" BIGINT CONSTRAINT "DF_ResourceCorrelationRules_BaseRule" DEFAULT((0)) NULL,
    CONSTRAINT "PK_ResourceCorrelationRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceCorrelationRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceCorrelationRules_Binding" FOREIGN KEY ("SourceBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ResourceCorrelationRules_TargetBinding" FOREIGN KEY ("TargetBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ResourceCorrelationRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceCorrelationRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_ResourceCorrelationRules" ON "UP_ResourceCorrelationRules" ("EntityType_Id" ASC, "ResourceType_Id" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_ResourceNavigationRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "Type" INT CONSTRAINT "DF_ResourceNavigationRules_Type" DEFAULT((0)) NOT NULL,
    "Resource_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_ResourceNavigationRules_IsDenied" DEFAULT ((0)) NOT NULL,
    "TimeOffsetReference" INT CONSTRAINT "DF_ResourceNavigationRules_TimeOffsetReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetBeforeReference" INT CONSTRAINT "DF_ResourceNavigationRules_TimeOffsetBeforeReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetAfterReference" INT CONSTRAINT "DF_ResourceNavigationRules_TimeOffsetAfterReference" DEFAULT ((0)) NOT NULL,
    "SingleRole_Id" BIGINT NULL,
    "L0" BIT CONSTRAINT "DF_ResourceNavigationRules_L0" DEFAULT ((0)) NOT NULL,
    "L1" BIT CONSTRAINT "DF_ResourceNavigationRules_L1" DEFAULT ((0)) NOT NULL,
    "L2" BIT CONSTRAINT "DF_ResourceNavigationRules_L2" DEFAULT ((0)) NOT NULL,
    "L3" BIT CONSTRAINT "DF_ResourceNavigationRules_L3" DEFAULT ((0)) NOT NULL,
    "L4" BIT CONSTRAINT "DF_ResourceNavigationRules_L4" DEFAULT ((0)) NOT NULL,
    "L5" BIT CONSTRAINT "DF_ResourceNavigationRules_L5" DEFAULT ((0)) NOT NULL,
    "L6" BIT CONSTRAINT "DF_ResourceNavigationRules_L6" DEFAULT ((0)) NOT NULL,
    "L7" BIT CONSTRAINT "DF_ResourceNavigationRules_L7" DEFAULT ((0)) NOT NULL,
    "L8" BIT CONSTRAINT "DF_ResourceNavigationRules_L8" DEFAULT ((0)) NOT NULL,
    "L9" BIT CONSTRAINT "DF_ResourceNavigationRules_L9" DEFAULT ((0)) NOT NULL,
    "LA" BIT CONSTRAINT "DF_ResourceNavigationRules_LA" DEFAULT ((0)) NOT NULL,
    "LB" BIT CONSTRAINT "DF_ResourceNavigationRules_LB" DEFAULT ((0)) NOT NULL,
    "LC" BIT CONSTRAINT "DF_ResourceNavigationRules_LC" DEFAULT ((0)) NOT NULL,
    "LD" BIT CONSTRAINT "DF_ResourceNavigationRules_LD" DEFAULT ((0)) NOT NULL,
    "LE" BIT CONSTRAINT "DF_ResourceNavigationRules_LE" DEFAULT ((0)) NOT NULL,
    "LF" BIT CONSTRAINT "DF_ResourceNavigationRules_LF" DEFAULT ((0)) NOT NULL,
    "LG" BIT CONSTRAINT "DF_ResourceNavigationRules_LG" DEFAULT ((0)) NOT NULL,
    "LH" BIT CONSTRAINT "DF_ResourceNavigationRules_LH" DEFAULT ((0)) NOT NULL,
    "LI" BIT CONSTRAINT "DF_ResourceNavigationRules_LI" DEFAULT ((0)) NOT NULL,
    "LJ" BIT CONSTRAINT "DF_ResourceNavigationRules_LJ" DEFAULT ((0)) NOT NULL,
    "LK" BIT CONSTRAINT "DF_ResourceNavigationRules_LK" DEFAULT ((0)) NOT NULL,
    "LL" BIT CONSTRAINT "DF_ResourceNavigationRules_LL" DEFAULT ((0)) NOT NULL,
    "LM" BIT CONSTRAINT "DF_ResourceNavigationRules_LM" DEFAULT ((0)) NOT NULL,
    "LN" BIT CONSTRAINT "DF_ResourceNavigationRules_LN" DEFAULT ((0)) NOT NULL,
    "LO" BIT CONSTRAINT "DF_ResourceNavigationRules_LO" DEFAULT ((0)) NOT NULL,
    "LP" BIT CONSTRAINT "DF_ResourceNavigationRules_LP" DEFAULT ((0)) NOT NULL,
    "LQ" BIT CONSTRAINT "DF_ResourceNavigationRules_LQ" DEFAULT ((0)) NOT NULL,
    "LR" BIT CONSTRAINT "DF_ResourceNavigationRules_LR" DEFAULT ((0)) NOT NULL,
    "LS" BIT CONSTRAINT "DF_ResourceNavigationRules_LS" DEFAULT ((0)) NOT NULL,
    "LT" BIT CONSTRAINT "DF_ResourceNavigationRules_LT" DEFAULT ((0)) NOT NULL,
    "LU" BIT CONSTRAINT "DF_ResourceNavigationRules_LU" DEFAULT ((0)) NOT NULL,
    "LV" BIT CONSTRAINT "DF_ResourceNavigationRules_LV" DEFAULT ((0)) NOT NULL,
    "L10" BIT CONSTRAINT "DF_ResourceNavigationRules_L10" DEFAULT ((0)) NOT NULL,
    "L11" BIT CONSTRAINT "DF_ResourceNavigationRules_L11" DEFAULT ((0)) NOT NULL,
    "L12" BIT CONSTRAINT "DF_ResourceNavigationRules_L12" DEFAULT ((0)) NOT NULL,
    "L13" BIT CONSTRAINT "DF_ResourceNavigationRules_L13" DEFAULT ((0)) NOT NULL,
    "L14" BIT CONSTRAINT "DF_ResourceNavigationRules_L14" DEFAULT ((0)) NOT NULL,
    "L15" BIT CONSTRAINT "DF_ResourceNavigationRules_L15" DEFAULT ((0)) NOT NULL,
    "L16" BIT CONSTRAINT "DF_ResourceNavigationRules_L16" DEFAULT ((0)) NOT NULL,
    "L17" BIT CONSTRAINT "DF_ResourceNavigationRules_L17" DEFAULT ((0)) NOT NULL,
    "L18" BIT CONSTRAINT "DF_ResourceNavigationRules_L18" DEFAULT ((0)) NOT NULL,
    "L19" BIT CONSTRAINT "DF_ResourceNavigationRules_L19" DEFAULT ((0)) NOT NULL,
    "L1A" BIT CONSTRAINT "DF_ResourceNavigationRules_L1A" DEFAULT ((0)) NOT NULL,
    "L1B" BIT CONSTRAINT "DF_ResourceNavigationRules_L1B" DEFAULT ((0)) NOT NULL,
    "L1C" BIT CONSTRAINT "DF_ResourceNavigationRules_L1C" DEFAULT ((0)) NOT NULL,
    "L1D" BIT CONSTRAINT "DF_ResourceNavigationRules_L1D" DEFAULT ((0)) NOT NULL,
    "L1E" BIT CONSTRAINT "DF_ResourceNavigationRules_L1E" DEFAULT ((0)) NOT NULL,
    "L1F" BIT CONSTRAINT "DF_ResourceNavigationRules_L1F" DEFAULT ((0)) NOT NULL,
    "L1G" BIT CONSTRAINT "DF_ResourceNavigationRules_L1G" DEFAULT ((0)) NOT NULL,
    "L1H" BIT CONSTRAINT "DF_ResourceNavigationRules_L1H" DEFAULT ((0)) NOT NULL,
    "L1I" BIT CONSTRAINT "DF_ResourceNavigationRules_L1I" DEFAULT ((0)) NOT NULL,
    "L1J" BIT CONSTRAINT "DF_ResourceNavigationRules_L1J" DEFAULT ((0)) NOT NULL,
    "L1K" BIT CONSTRAINT "DF_ResourceNavigationRules_L1K" DEFAULT ((0)) NOT NULL,
    "L1L" BIT CONSTRAINT "DF_ResourceNavigationRules_L1L" DEFAULT ((0)) NOT NULL,
    "L1M" BIT CONSTRAINT "DF_ResourceNavigationRules_L1M" DEFAULT ((0)) NOT NULL,
    "L1N" BIT CONSTRAINT "DF_ResourceNavigationRules_L1N" DEFAULT ((0)) NOT NULL,
    "L1O" BIT CONSTRAINT "DF_ResourceNavigationRules_L1O" DEFAULT ((0)) NOT NULL,
    "L1P" BIT CONSTRAINT "DF_ResourceNavigationRules_L1P" DEFAULT ((0)) NOT NULL,
    "L1Q" BIT CONSTRAINT "DF_ResourceNavigationRules_L1Q" DEFAULT ((0)) NOT NULL,
    "L1R" BIT CONSTRAINT "DF_ResourceNavigationRules_L1R" DEFAULT ((0)) NOT NULL,
    "L1S" BIT CONSTRAINT "DF_ResourceNavigationRules_L1S" DEFAULT ((0)) NOT NULL,
    "L1T" BIT CONSTRAINT "DF_ResourceNavigationRules_L1T" DEFAULT ((0)) NOT NULL,
    "L1U" BIT CONSTRAINT "DF_ResourceNavigationRules_L1U" DEFAULT ((0)) NOT NULL,
    "L1V" BIT CONSTRAINT "DF_ResourceNavigationRules_L1V" DEFAULT ((0)) NOT NULL,
    "L20" BIT CONSTRAINT "DF_ResourceNavigationRules_L20" DEFAULT ((0)) NOT NULL,
    "L21" BIT CONSTRAINT "DF_ResourceNavigationRules_L21" DEFAULT ((0)) NOT NULL,
    "L22" BIT CONSTRAINT "DF_ResourceNavigationRules_L22" DEFAULT ((0)) NOT NULL,
    "L23" BIT CONSTRAINT "DF_ResourceNavigationRules_L23" DEFAULT ((0)) NOT NULL,
    "L24" BIT CONSTRAINT "DF_ResourceNavigationRules_L24" DEFAULT ((0)) NOT NULL,
    "L25" BIT CONSTRAINT "DF_ResourceNavigationRules_L25" DEFAULT ((0)) NOT NULL,
    "L26" BIT CONSTRAINT "DF_ResourceNavigationRules_L26" DEFAULT ((0)) NOT NULL,
    "L27" BIT CONSTRAINT "DF_ResourceNavigationRules_L27" DEFAULT ((0)) NOT NULL,
    "L28" BIT CONSTRAINT "DF_ResourceNavigationRules_L28" DEFAULT ((0)) NOT NULL,
    "L29" BIT CONSTRAINT "DF_ResourceNavigationRules_L29" DEFAULT ((0)) NOT NULL,
    "L2A" BIT CONSTRAINT "DF_ResourceNavigationRules_L2A" DEFAULT ((0)) NOT NULL,
    "L2B" BIT CONSTRAINT "DF_ResourceNavigationRules_L2B" DEFAULT ((0)) NOT NULL,
    "L2C" BIT CONSTRAINT "DF_ResourceNavigationRules_L2C" DEFAULT ((0)) NOT NULL,
    "L2D" BIT CONSTRAINT "DF_ResourceNavigationRules_L2D" DEFAULT ((0)) NOT NULL,
    "L2E" BIT CONSTRAINT "DF_ResourceNavigationRules_L2E" DEFAULT ((0)) NOT NULL,
    "L2F" BIT CONSTRAINT "DF_ResourceNavigationRules_L2F" DEFAULT ((0)) NOT NULL,
    "L2G" BIT CONSTRAINT "DF_ResourceNavigationRules_L2G" DEFAULT ((0)) NOT NULL,
    "L2H" BIT CONSTRAINT "DF_ResourceNavigationRules_L2H" DEFAULT ((0)) NOT NULL,
    "L2I" BIT CONSTRAINT "DF_ResourceNavigationRules_L2I" DEFAULT ((0)) NOT NULL,
    "L2J" BIT CONSTRAINT "DF_ResourceNavigationRules_L2J" DEFAULT ((0)) NOT NULL,
    "L2K" BIT CONSTRAINT "DF_ResourceNavigationRules_L2K" DEFAULT ((0)) NOT NULL,
    "L2L" BIT CONSTRAINT "DF_ResourceNavigationRules_L2L" DEFAULT ((0)) NOT NULL,
    "L2M" BIT CONSTRAINT "DF_ResourceNavigationRules_L2M" DEFAULT ((0)) NOT NULL,
    "L2N" BIT CONSTRAINT "DF_ResourceNavigationRules_L2N" DEFAULT ((0)) NOT NULL,
    "L2O" BIT CONSTRAINT "DF_ResourceNavigationRules_L2O" DEFAULT ((0)) NOT NULL,
    "L2P" BIT CONSTRAINT "DF_ResourceNavigationRules_L2P" DEFAULT ((0)) NOT NULL,
    "L2Q" BIT CONSTRAINT "DF_ResourceNavigationRules_L2Q" DEFAULT ((0)) NOT NULL,
    "L2R" BIT CONSTRAINT "DF_ResourceNavigationRules_L2R" DEFAULT ((0)) NOT NULL,
    "L2S" BIT CONSTRAINT "DF_ResourceNavigationRules_L2S" DEFAULT ((0)) NOT NULL,
    "L2T" BIT CONSTRAINT "DF_ResourceNavigationRules_L2T" DEFAULT ((0)) NOT NULL,
    "L2U" BIT CONSTRAINT "DF_ResourceNavigationRules_L2U" DEFAULT ((0)) NOT NULL,
    "L2V" BIT CONSTRAINT "DF_ResourceNavigationRules_L2V" DEFAULT ((0)) NOT NULL,
    "L30" BIT CONSTRAINT "DF_ResourceNavigationRules_L30" DEFAULT ((0)) NOT NULL,
    "L31" BIT CONSTRAINT "DF_ResourceNavigationRules_L31" DEFAULT ((0)) NOT NULL,
    "L32" BIT CONSTRAINT "DF_ResourceNavigationRules_L32" DEFAULT ((0)) NOT NULL,
    "L33" BIT CONSTRAINT "DF_ResourceNavigationRules_L33" DEFAULT ((0)) NOT NULL,
    "L34" BIT CONSTRAINT "DF_ResourceNavigationRules_L34" DEFAULT ((0)) NOT NULL,
    "L35" BIT CONSTRAINT "DF_ResourceNavigationRules_L35" DEFAULT ((0)) NOT NULL,
    "L36" BIT CONSTRAINT "DF_ResourceNavigationRules_L36" DEFAULT ((0)) NOT NULL,
    "L37" BIT CONSTRAINT "DF_ResourceNavigationRules_L37" DEFAULT ((0)) NOT NULL,
    "L38" BIT CONSTRAINT "DF_ResourceNavigationRules_L38" DEFAULT ((0)) NOT NULL,
    "L39" BIT CONSTRAINT "DF_ResourceNavigationRules_L39" DEFAULT ((0)) NOT NULL,
    "L3A" BIT CONSTRAINT "DF_ResourceNavigationRules_L3A" DEFAULT ((0)) NOT NULL,
    "L3B" BIT CONSTRAINT "DF_ResourceNavigationRules_L3B" DEFAULT ((0)) NOT NULL,
    "L3C" BIT CONSTRAINT "DF_ResourceNavigationRules_L3C" DEFAULT ((0)) NOT NULL,
    "L3D" BIT CONSTRAINT "DF_ResourceNavigationRules_L3D" DEFAULT ((0)) NOT NULL,
    "L3E" BIT CONSTRAINT "DF_ResourceNavigationRules_L3E" DEFAULT ((0)) NOT NULL,
    "L3F" BIT CONSTRAINT "DF_ResourceNavigationRules_L3F" DEFAULT ((0)) NOT NULL,
    "L3G" BIT CONSTRAINT "DF_ResourceNavigationRules_L3G" DEFAULT ((0)) NOT NULL,
    "L3H" BIT CONSTRAINT "DF_ResourceNavigationRules_L3H" DEFAULT ((0)) NOT NULL,
    "L3I" BIT CONSTRAINT "DF_ResourceNavigationRules_L3I" DEFAULT ((0)) NOT NULL,
    "L3J" BIT CONSTRAINT "DF_ResourceNavigationRules_L3J" DEFAULT ((0)) NOT NULL,
    "L3K" BIT CONSTRAINT "DF_ResourceNavigationRules_L3K" DEFAULT ((0)) NOT NULL,
    "L3L" BIT CONSTRAINT "DF_ResourceNavigationRules_L3L" DEFAULT ((0)) NOT NULL,
    "L3M" BIT CONSTRAINT "DF_ResourceNavigationRules_L3M" DEFAULT ((0)) NOT NULL,
    "L3N" BIT CONSTRAINT "DF_ResourceNavigationRules_L3N" DEFAULT ((0)) NOT NULL,
    "L3O" BIT CONSTRAINT "DF_ResourceNavigationRules_L3O" DEFAULT ((0)) NOT NULL,
    "L3P" BIT CONSTRAINT "DF_ResourceNavigationRules_L3P" DEFAULT ((0)) NOT NULL,
    "L3Q" BIT CONSTRAINT "DF_ResourceNavigationRules_L3Q" DEFAULT ((0)) NOT NULL,
    "L3R" BIT CONSTRAINT "DF_ResourceNavigationRules_L3R" DEFAULT ((0)) NOT NULL,
    "L3S" BIT CONSTRAINT "DF_ResourceNavigationRules_L3S" DEFAULT ((0)) NOT NULL,
    "L3T" BIT CONSTRAINT "DF_ResourceNavigationRules_L3T" DEFAULT ((0)) NOT NULL,
    "L3U" BIT CONSTRAINT "DF_ResourceNavigationRules_L3U" DEFAULT ((0)) NOT NULL,
    "L3V" BIT CONSTRAINT "DF_ResourceNavigationRules_L3V" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
	"BaseRule_Id" BIGINT DEFAULT((0)) NULL,
    CONSTRAINT "PK_ResourceNavigationRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceNavigationRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceNavigationRules_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_ResourceNavigationRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceNavigationRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ResourceNavigationRules_SingleRole" FOREIGN KEY ("SingleRole_Id") REFERENCES "UP_SingleRoles" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_ResourceNavigationRules" ON "UP_ResourceNavigationRules" ("EntityType_Id" ASC, "ResourceType_Id" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_ResourceQueryRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "TargetMatchedConfidenceLevel" INT CONSTRAINT "DF_ResourceQueryRules_TargetMatchedConfidenceLevel" DEFAULT ((0)) NOT NULL,
    "TimeOffsetReference" INT CONSTRAINT "DF_ResourceQueryRules_TimeOffsetReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetBeforeReference" INT CONSTRAINT "DF_ResourceQueryRules_TimeOffsetBeforeReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetAfterReference" INT CONSTRAINT "DF_ResourceQueryRules_TimeOffsetAfterReference" DEFAULT ((0)) NOT NULL,
    "SourceBinding_Id" BIGINT NULL,
    "SourceExpression" VARCHAR(4000) NULL,
    "TargetBinding_Id" BIGINT NULL,
    "TargetExpression" VARCHAR(4000) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_ResourceQueryRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceQueryRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceQueryRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceQueryRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ResourceQueryRules_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_ResourceQueryRules_TargetBinding" FOREIGN KEY ("TargetBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ResourceQueryRules_SourceBinding" FOREIGN KEY ("SourceBinding_Id") REFERENCES "UM_Bindings" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_ResourceQueryRules" ON "UP_ResourceQueryRules" ("EntityType_Id" ASC, "ResourceType_Id" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_ResourceScalarRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "TimeOffsetReference" INT CONSTRAINT "DF_ResourceScalarRules_TimeOffsetReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetBeforeReference" INT CONSTRAINT "DF_ResourceScalarRules_TimeOffsetBeforeReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetAfterReference" INT CONSTRAINT "DF_ResourceScalarRules_TimeOffsetAfterReference" DEFAULT ((0)) NOT NULL,
    "ComparisonType" INT CONSTRAINT "DF_ResourceScalarRules_ComparisonType" DEFAULT ((0)) NOT NULL,
    "IsMapped" BIT CONSTRAINT "DF_ResourceScalarRules_IsMapped" DEFAULT ((1)) NOT NULL,
    "Binding_Id" BIGINT NULL,
    "Expression" VARCHAR(4000) NULL,
    "SingleRole_Id" BIGINT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "BaseRule_Id" BIGINT CONSTRAINT "DF_ResourceScalarRules_BaseRuleId" DEFAULT((0)) NULL,
    CONSTRAINT "PK_ResourceScalarRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceScalarRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceScalarRules_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_ResourceScalarRules_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ResourceScalarRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceScalarRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ResourceScalarRules_SingleRole" FOREIGN KEY ("SingleRole_Id") REFERENCES "UP_SingleRoles" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_ResourceScalarRules" ON "UP_ResourceScalarRules" ("EntityType_Id" ASC, "Id" ASC);

   GO
   CREATE TABLE "UP_ResourceTypeRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "Type" INT CONSTRAINT "DF_ResourceTypeRules_Type" DEFAULT((0)) NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_ResourceTypeRules_IsDenied" DEFAULT ((0)) NOT NULL,
    "TimeOffsetReference" INT CONSTRAINT "DF_ResourceTypeRules_TimeOffsetReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetBeforeReference" INT CONSTRAINT "DF_ResourceTypeRules_TimeOffsetBeforeReference" DEFAULT ((0)) NOT NULL,
    "TimeOffsetAfterReference" INT CONSTRAINT "DF_ResourceTypeRules_TimeOffsetAfterReference" DEFAULT ((0)) NOT NULL,
    "SingleRole_Id" BIGINT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "L0" BIT CONSTRAINT "DF_ResourceTypeRules_L0" DEFAULT ((0)) NOT NULL,
    "L1" BIT CONSTRAINT "DF_ResourceTypeRules_L1" DEFAULT ((0)) NOT NULL,
    "L2" BIT CONSTRAINT "DF_ResourceTypeRules_L2" DEFAULT ((0)) NOT NULL,
    "L3" BIT CONSTRAINT "DF_ResourceTypeRules_L3" DEFAULT ((0)) NOT NULL,
    "L4" BIT CONSTRAINT "DF_ResourceTypeRules_L4" DEFAULT ((0)) NOT NULL,
    "L5" BIT CONSTRAINT "DF_ResourceTypeRules_L5" DEFAULT ((0)) NOT NULL,
    "L6" BIT CONSTRAINT "DF_ResourceTypeRules_L6" DEFAULT ((0)) NOT NULL,
    "L7" BIT CONSTRAINT "DF_ResourceTypeRules_L7" DEFAULT ((0)) NOT NULL,
    "L8" BIT CONSTRAINT "DF_ResourceTypeRules_L8" DEFAULT ((0)) NOT NULL,
    "L9" BIT CONSTRAINT "DF_ResourceTypeRules_L9" DEFAULT ((0)) NOT NULL,
    "LA" BIT CONSTRAINT "DF_ResourceTypeRules_LA" DEFAULT ((0)) NOT NULL,
    "LB" BIT CONSTRAINT "DF_ResourceTypeRules_LB" DEFAULT ((0)) NOT NULL,
    "LC" BIT CONSTRAINT "DF_ResourceTypeRules_LC" DEFAULT ((0)) NOT NULL,
    "LD" BIT CONSTRAINT "DF_ResourceTypeRules_LD" DEFAULT ((0)) NOT NULL,
    "LE" BIT CONSTRAINT "DF_ResourceTypeRules_LE" DEFAULT ((0)) NOT NULL,
    "LF" BIT CONSTRAINT "DF_ResourceTypeRules_LF" DEFAULT ((0)) NOT NULL,
    "LG" BIT CONSTRAINT "DF_ResourceTypeRules_LG" DEFAULT ((0)) NOT NULL,
    "LH" BIT CONSTRAINT "DF_ResourceTypeRules_LH" DEFAULT ((0)) NOT NULL,
    "LI" BIT CONSTRAINT "DF_ResourceTypeRules_LI" DEFAULT ((0)) NOT NULL,
    "LJ" BIT CONSTRAINT "DF_ResourceTypeRules_LJ" DEFAULT ((0)) NOT NULL,
    "LK" BIT CONSTRAINT "DF_ResourceTypeRules_LK" DEFAULT ((0)) NOT NULL,
    "LL" BIT CONSTRAINT "DF_ResourceTypeRules_LL" DEFAULT ((0)) NOT NULL,
    "LM" BIT CONSTRAINT "DF_ResourceTypeRules_LM" DEFAULT ((0)) NOT NULL,
    "LN" BIT CONSTRAINT "DF_ResourceTypeRules_LN" DEFAULT ((0)) NOT NULL,
    "LO" BIT CONSTRAINT "DF_ResourceTypeRules_LO" DEFAULT ((0)) NOT NULL,
    "LP" BIT CONSTRAINT "DF_ResourceTypeRules_LP" DEFAULT ((0)) NOT NULL,
    "LQ" BIT CONSTRAINT "DF_ResourceTypeRules_LQ" DEFAULT ((0)) NOT NULL,
    "LR" BIT CONSTRAINT "DF_ResourceTypeRules_LR" DEFAULT ((0)) NOT NULL,
    "LS" BIT CONSTRAINT "DF_ResourceTypeRules_LS" DEFAULT ((0)) NOT NULL,
    "LT" BIT CONSTRAINT "DF_ResourceTypeRules_LT" DEFAULT ((0)) NOT NULL,
    "LU" BIT CONSTRAINT "DF_ResourceTypeRules_LU" DEFAULT ((0)) NOT NULL,
    "LV" BIT CONSTRAINT "DF_ResourceTypeRules_LV" DEFAULT ((0)) NOT NULL,
    "L10" BIT CONSTRAINT "DF_ResourceTypeRules_L10" DEFAULT ((0)) NOT NULL,
    "L11" BIT CONSTRAINT "DF_ResourceTypeRules_L11" DEFAULT ((0)) NOT NULL,
    "L12" BIT CONSTRAINT "DF_ResourceTypeRules_L12" DEFAULT ((0)) NOT NULL,
    "L13" BIT CONSTRAINT "DF_ResourceTypeRules_L13" DEFAULT ((0)) NOT NULL,
    "L14" BIT CONSTRAINT "DF_ResourceTypeRules_L14" DEFAULT ((0)) NOT NULL,
    "L15" BIT CONSTRAINT "DF_ResourceTypeRules_L15" DEFAULT ((0)) NOT NULL,
    "L16" BIT CONSTRAINT "DF_ResourceTypeRules_L16" DEFAULT ((0)) NOT NULL,
    "L17" BIT CONSTRAINT "DF_ResourceTypeRules_L17" DEFAULT ((0)) NOT NULL,
    "L18" BIT CONSTRAINT "DF_ResourceTypeRules_L18" DEFAULT ((0)) NOT NULL,
    "L19" BIT CONSTRAINT "DF_ResourceTypeRules_L19" DEFAULT ((0)) NOT NULL,
    "L1A" BIT CONSTRAINT "DF_ResourceTypeRules_L1A" DEFAULT ((0)) NOT NULL,
    "L1B" BIT CONSTRAINT "DF_ResourceTypeRules_L1B" DEFAULT ((0)) NOT NULL,
    "L1C" BIT CONSTRAINT "DF_ResourceTypeRules_L1C" DEFAULT ((0)) NOT NULL,
    "L1D" BIT CONSTRAINT "DF_ResourceTypeRules_L1D" DEFAULT ((0)) NOT NULL,
    "L1E" BIT CONSTRAINT "DF_ResourceTypeRules_L1E" DEFAULT ((0)) NOT NULL,
    "L1F" BIT CONSTRAINT "DF_ResourceTypeRules_L1F" DEFAULT ((0)) NOT NULL,
    "L1G" BIT CONSTRAINT "DF_ResourceTypeRules_L1G" DEFAULT ((0)) NOT NULL,
    "L1H" BIT CONSTRAINT "DF_ResourceTypeRules_L1H" DEFAULT ((0)) NOT NULL,
    "L1I" BIT CONSTRAINT "DF_ResourceTypeRules_L1I" DEFAULT ((0)) NOT NULL,
    "L1J" BIT CONSTRAINT "DF_ResourceTypeRules_L1J" DEFAULT ((0)) NOT NULL,
    "L1K" BIT CONSTRAINT "DF_ResourceTypeRules_L1K" DEFAULT ((0)) NOT NULL,
    "L1L" BIT CONSTRAINT "DF_ResourceTypeRules_L1L" DEFAULT ((0)) NOT NULL,
    "L1M" BIT CONSTRAINT "DF_ResourceTypeRules_L1M" DEFAULT ((0)) NOT NULL,
    "L1N" BIT CONSTRAINT "DF_ResourceTypeRules_L1N" DEFAULT ((0)) NOT NULL,
    "L1O" BIT CONSTRAINT "DF_ResourceTypeRules_L1O" DEFAULT ((0)) NOT NULL,
    "L1P" BIT CONSTRAINT "DF_ResourceTypeRules_L1P" DEFAULT ((0)) NOT NULL,
    "L1Q" BIT CONSTRAINT "DF_ResourceTypeRules_L1Q" DEFAULT ((0)) NOT NULL,
    "L1R" BIT CONSTRAINT "DF_ResourceTypeRules_L1R" DEFAULT ((0)) NOT NULL,
    "L1S" BIT CONSTRAINT "DF_ResourceTypeRules_L1S" DEFAULT ((0)) NOT NULL,
    "L1T" BIT CONSTRAINT "DF_ResourceTypeRules_L1T" DEFAULT ((0)) NOT NULL,
    "L1U" BIT CONSTRAINT "DF_ResourceTypeRules_L1U" DEFAULT ((0)) NOT NULL,
    "L1V" BIT CONSTRAINT "DF_ResourceTypeRules_L1V" DEFAULT ((0)) NOT NULL,
    "L20" BIT CONSTRAINT "DF_ResourceTypeRules_L20" DEFAULT ((0)) NOT NULL,
    "L21" BIT CONSTRAINT "DF_ResourceTypeRules_L21" DEFAULT ((0)) NOT NULL,
    "L22" BIT CONSTRAINT "DF_ResourceTypeRules_L22" DEFAULT ((0)) NOT NULL,
    "L23" BIT CONSTRAINT "DF_ResourceTypeRules_L23" DEFAULT ((0)) NOT NULL,
    "L24" BIT CONSTRAINT "DF_ResourceTypeRules_L24" DEFAULT ((0)) NOT NULL,
    "L25" BIT CONSTRAINT "DF_ResourceTypeRules_L25" DEFAULT ((0)) NOT NULL,
    "L26" BIT CONSTRAINT "DF_ResourceTypeRules_L26" DEFAULT ((0)) NOT NULL,
    "L27" BIT CONSTRAINT "DF_ResourceTypeRules_L27" DEFAULT ((0)) NOT NULL,
    "L28" BIT CONSTRAINT "DF_ResourceTypeRules_L28" DEFAULT ((0)) NOT NULL,
    "L29" BIT CONSTRAINT "DF_ResourceTypeRules_L29" DEFAULT ((0)) NOT NULL,
    "L2A" BIT CONSTRAINT "DF_ResourceTypeRules_L2A" DEFAULT ((0)) NOT NULL,
    "L2B" BIT CONSTRAINT "DF_ResourceTypeRules_L2B" DEFAULT ((0)) NOT NULL,
    "L2C" BIT CONSTRAINT "DF_ResourceTypeRules_L2C" DEFAULT ((0)) NOT NULL,
    "L2D" BIT CONSTRAINT "DF_ResourceTypeRules_L2D" DEFAULT ((0)) NOT NULL,
    "L2E" BIT CONSTRAINT "DF_ResourceTypeRules_L2E" DEFAULT ((0)) NOT NULL,
    "L2F" BIT CONSTRAINT "DF_ResourceTypeRules_L2F" DEFAULT ((0)) NOT NULL,
    "L2G" BIT CONSTRAINT "DF_ResourceTypeRules_L2G" DEFAULT ((0)) NOT NULL,
    "L2H" BIT CONSTRAINT "DF_ResourceTypeRules_L2H" DEFAULT ((0)) NOT NULL,
    "L2I" BIT CONSTRAINT "DF_ResourceTypeRules_L2I" DEFAULT ((0)) NOT NULL,
    "L2J" BIT CONSTRAINT "DF_ResourceTypeRules_L2J" DEFAULT ((0)) NOT NULL,
    "L2K" BIT CONSTRAINT "DF_ResourceTypeRules_L2K" DEFAULT ((0)) NOT NULL,
    "L2L" BIT CONSTRAINT "DF_ResourceTypeRules_L2L" DEFAULT ((0)) NOT NULL,
    "L2M" BIT CONSTRAINT "DF_ResourceTypeRules_L2M" DEFAULT ((0)) NOT NULL,
    "L2N" BIT CONSTRAINT "DF_ResourceTypeRules_L2N" DEFAULT ((0)) NOT NULL,
    "L2O" BIT CONSTRAINT "DF_ResourceTypeRules_L2O" DEFAULT ((0)) NOT NULL,
    "L2P" BIT CONSTRAINT "DF_ResourceTypeRules_L2P" DEFAULT ((0)) NOT NULL,
    "L2Q" BIT CONSTRAINT "DF_ResourceTypeRules_L2Q" DEFAULT ((0)) NOT NULL,
    "L2R" BIT CONSTRAINT "DF_ResourceTypeRules_L2R" DEFAULT ((0)) NOT NULL,
    "L2S" BIT CONSTRAINT "DF_ResourceTypeRules_L2S" DEFAULT ((0)) NOT NULL,
    "L2T" BIT CONSTRAINT "DF_ResourceTypeRules_L2T" DEFAULT ((0)) NOT NULL,
    "L2U" BIT CONSTRAINT "DF_ResourceTypeRules_L2U" DEFAULT ((0)) NOT NULL,
    "L2V" BIT CONSTRAINT "DF_ResourceTypeRules_L2V" DEFAULT ((0)) NOT NULL,
    "L30" BIT CONSTRAINT "DF_ResourceTypeRules_L30" DEFAULT ((0)) NOT NULL,
    "L31" BIT CONSTRAINT "DF_ResourceTypeRules_L31" DEFAULT ((0)) NOT NULL,
    "L32" BIT CONSTRAINT "DF_ResourceTypeRules_L32" DEFAULT ((0)) NOT NULL,
    "L33" BIT CONSTRAINT "DF_ResourceTypeRules_L33" DEFAULT ((0)) NOT NULL,
    "L34" BIT CONSTRAINT "DF_ResourceTypeRules_L34" DEFAULT ((0)) NOT NULL,
    "L35" BIT CONSTRAINT "DF_ResourceTypeRules_L35" DEFAULT ((0)) NOT NULL,
    "L36" BIT CONSTRAINT "DF_ResourceTypeRules_L36" DEFAULT ((0)) NOT NULL,
    "L37" BIT CONSTRAINT "DF_ResourceTypeRules_L37" DEFAULT ((0)) NOT NULL,
    "L38" BIT CONSTRAINT "DF_ResourceTypeRules_L38" DEFAULT ((0)) NOT NULL,
    "L39" BIT CONSTRAINT "DF_ResourceTypeRules_L39" DEFAULT ((0)) NOT NULL,
    "L3A" BIT CONSTRAINT "DF_ResourceTypeRules_L3A" DEFAULT ((0)) NOT NULL,
    "L3B" BIT CONSTRAINT "DF_ResourceTypeRules_L3B" DEFAULT ((0)) NOT NULL,
    "L3C" BIT CONSTRAINT "DF_ResourceTypeRules_L3C" DEFAULT ((0)) NOT NULL,
    "L3D" BIT CONSTRAINT "DF_ResourceTypeRules_L3D" DEFAULT ((0)) NOT NULL,
    "L3E" BIT CONSTRAINT "DF_ResourceTypeRules_L3E" DEFAULT ((0)) NOT NULL,
    "L3F" BIT CONSTRAINT "DF_ResourceTypeRules_L3F" DEFAULT ((0)) NOT NULL,
    "L3G" BIT CONSTRAINT "DF_ResourceTypeRules_L3G" DEFAULT ((0)) NOT NULL,
    "L3H" BIT CONSTRAINT "DF_ResourceTypeRules_L3H" DEFAULT ((0)) NOT NULL,
    "L3I" BIT CONSTRAINT "DF_ResourceTypeRules_L3I" DEFAULT ((0)) NOT NULL,
    "L3J" BIT CONSTRAINT "DF_ResourceTypeRules_L3J" DEFAULT ((0)) NOT NULL,
    "L3K" BIT CONSTRAINT "DF_ResourceTypeRules_L3K" DEFAULT ((0)) NOT NULL,
    "L3L" BIT CONSTRAINT "DF_ResourceTypeRules_L3L" DEFAULT ((0)) NOT NULL,
    "L3M" BIT CONSTRAINT "DF_ResourceTypeRules_L3M" DEFAULT ((0)) NOT NULL,
    "L3N" BIT CONSTRAINT "DF_ResourceTypeRules_L3N" DEFAULT ((0)) NOT NULL,
    "L3O" BIT CONSTRAINT "DF_ResourceTypeRules_L3O" DEFAULT ((0)) NOT NULL,
    "L3P" BIT CONSTRAINT "DF_ResourceTypeRules_L3P" DEFAULT ((0)) NOT NULL,
    "L3Q" BIT CONSTRAINT "DF_ResourceTypeRules_L3Q" DEFAULT ((0)) NOT NULL,
    "L3R" BIT CONSTRAINT "DF_ResourceTypeRules_L3R" DEFAULT ((0)) NOT NULL,
    "L3S" BIT CONSTRAINT "DF_ResourceTypeRules_L3S" DEFAULT ((0)) NOT NULL,
    "L3T" BIT CONSTRAINT "DF_ResourceTypeRules_L3T" DEFAULT ((0)) NOT NULL,
    "L3U" BIT CONSTRAINT "DF_ResourceTypeRules_L3U" DEFAULT ((0)) NOT NULL,
    "L3V" BIT CONSTRAINT "DF_ResourceTypeRules_L3V" DEFAULT ((0)) NOT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    "BaseRule_Id" BIGINT CONSTRAINT "DF_ResourceTypeRules_BaseRule" DEFAULT((0)) NULL,
    CONSTRAINT "PK_ResourceTypeRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourceTypeRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_ResourceTypeRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_ResourceTypeRules_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_ResourceTypeRules_SingleRole0" FOREIGN KEY ("SingleRole_Id") REFERENCES "UP_SingleRoles" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_ResourceTypeRules" ON "UP_ResourceTypeRules" ("EntityType_Id" ASC, "ResourceType_Id" ASC, "Id" ASC);
GO

   GO
   CREATE TABLE "UP_ResourceTypesCategories" (
    "ResourceType_Id" BIGINT NOT NULL,
    "Category_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_ResourceTypesCategories" PRIMARY KEY CLUSTERED ("ResourceType_Id" ASC, "Category_Id" ASC),
    CONSTRAINT "FK_ResourceTypesCategories_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_ResourceTypesCategories_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id")
);

   GO
   CREATE TABLE "UP_RiskRuleItems" (
    "Id" BIGINT NOT NULL,
    "Risk_Id" BIGINT NOT NULL,
    "Rule_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "Resource_Id" BIGINT NULL,
    "Value" NVARCHAR(4000) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "CK_RiskRuleItems" UNIQUE CLUSTERED ("EntityType_Id" ASC, "Risk_Id" ASC, "Rule_Id" ASC, "Id" ASC),
    CONSTRAINT "PK_RiskRuleItems" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_RiskRuleItems_Risk" FOREIGN KEY ("Risk_Id") REFERENCES "UP_Risks" ("Id"),
    CONSTRAINT "FK_RiskRuleItems_Rule" FOREIGN KEY ("Rule_Id") REFERENCES "UP_RiskRules" ("Id"),
    CONSTRAINT "FK_RiskRuleItems_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_RiskRuleItems_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_RiskRuleItems_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
);

   GO
   CREATE TABLE "UP_RoleMappings"
(
	"Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,

    "ResourceType_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,

    "ImplicitApproval" TINYINT CONSTRAINT "DF_RoleMappings_ImplicitApproval" DEFAULT ((0)) NOT NULL,
    "ApprovalWorkflowType" INT CONSTRAINT "DF_RoleMappings_ApprovalWorkflowType" DEFAULT ((0)) NOT NULL,
    "HideOnSimplifiedView" BIT CONSTRAINT "DF_RoleMappings_HideOnSimplifiedView" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnRequest" TINYINT CONSTRAINT "DF_RoleMappings_CommentActivationOnRequest" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnApproveInReview" TINYINT CONSTRAINT "DF_RoleMappings_CommentActivationOnApproveInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeclineInReview" TINYINT CONSTRAINT "DF_RoleMappings_CommentActivationOnDeclineInReview" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnDeleteGapInReconciliation" TINYINT CONSTRAINT "DF_RoleMappings_CommentActivationOnDeleteGapInReconciliation" DEFAULT ((0)) NOT NULL,
    "CommentActivationOnKeepGapInReconciliation" TINYINT CONSTRAINT "DF_RoleMappings_CommentActivationOnKeepGapInReconciliation" DEFAULT ((0)) NOT NULL,

    "ApprovalRequired" BIT CONSTRAINT "DF_RoleMapping_ApprovalRequired" DEFAULT ((0)) NOT NULL,
    "WhereExpression" VARCHAR(4000) NULL,

    "Category_Id" BIGINT NULL,
    "CategoryIdentifierBinding_Id" BIGINT NULL,
    "CategoryIdentifierExpression" VARCHAR(4000) NULL,
    "CategoryDisplayNameBinding_Id" BIGINT NULL,
    "CategoryDisplayNameExpression" VARCHAR(4000) NULL,
    "ParentCategoryIdentifierBinding_Id" BIGINT NULL,
    "ParentCategoryIdentifierExpression" VARCHAR(4000) NULL,

    "IdentifierBinding_Id" BIGINT NULL,
    "IdentifierExpression" VARCHAR(4000) NULL,
    "DisplayNameBinding_Id" BIGINT NULL,
    "DisplayNameExpression" VARCHAR(4000) NULL,

    "RolePolicy_Id" BIGINT NULL,

    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,

    CONSTRAINT "PK_RoleMappings" PRIMARY KEY NONCLUSTERED ("Id" ASC),
--    CONSTRAINT "FK_RoleMappings_Connector" FOREIGN KEY ("Connector_Id") REFERENCES "UC_Connectors" ("Id"),
    CONSTRAINT "FK_RoleMappings_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_RoleMappings_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_RoleMappings_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_RoleMappings_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_RoleMappings_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_RoleMappings_IdentifierBinding" FOREIGN KEY ("IdentifierBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_RoleMappings_DisplayNameBinding" FOREIGN KEY ("DisplayNameBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_RoleMappings_RolePolicy" FOREIGN KEY ("RolePolicy_Id") REFERENCES "UP_Policies" ("Id"),
);

   GO
   CREATE TABLE "UP_SingleRoleRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "Type" INT CONSTRAINT "DF_SingleRoleRules_Type" DEFAULT((0)) NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Role_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_SingleRoleRules_IsDenied" DEFAULT ((0)) NOT NULL,
    "Priority" INT CONSTRAINT "DF_SingleRoleRules_Priority" DEFAULT((0)) NOT NULL,
    "CompositeRole_Id" BIGINT NULL,
    "L0" BIT CONSTRAINT "DF_SingleRoleRules_L0" DEFAULT ((0)) NOT NULL,
    "L1" BIT CONSTRAINT "DF_SingleRoleRules_L1" DEFAULT ((0)) NOT NULL,
    "L2" BIT CONSTRAINT "DF_SingleRoleRules_L2" DEFAULT ((0)) NOT NULL,
    "L3" BIT CONSTRAINT "DF_SingleRoleRules_L3" DEFAULT ((0)) NOT NULL,
    "L4" BIT CONSTRAINT "DF_SingleRoleRules_L4" DEFAULT ((0)) NOT NULL,
    "L5" BIT CONSTRAINT "DF_SingleRoleRules_L5" DEFAULT ((0)) NOT NULL,
    "L6" BIT CONSTRAINT "DF_SingleRoleRules_L6" DEFAULT ((0)) NOT NULL,
    "L7" BIT CONSTRAINT "DF_SingleRoleRules_L7" DEFAULT ((0)) NOT NULL,
    "L8" BIT CONSTRAINT "DF_SingleRoleRules_L8" DEFAULT ((0)) NOT NULL,
    "L9" BIT CONSTRAINT "DF_SingleRoleRules_L9" DEFAULT ((0)) NOT NULL,
    "LA" BIT CONSTRAINT "DF_SingleRoleRules_LA" DEFAULT ((0)) NOT NULL,
    "LB" BIT CONSTRAINT "DF_SingleRoleRules_LB" DEFAULT ((0)) NOT NULL,
    "LC" BIT CONSTRAINT "DF_SingleRoleRules_LC" DEFAULT ((0)) NOT NULL,
    "LD" BIT CONSTRAINT "DF_SingleRoleRules_LD" DEFAULT ((0)) NOT NULL,
    "LE" BIT CONSTRAINT "DF_SingleRoleRules_LE" DEFAULT ((0)) NOT NULL,
    "LF" BIT CONSTRAINT "DF_SingleRoleRules_LF" DEFAULT ((0)) NOT NULL,
    "LG" BIT CONSTRAINT "DF_SingleRoleRules_LG" DEFAULT ((0)) NOT NULL,
    "LH" BIT CONSTRAINT "DF_SingleRoleRules_LH" DEFAULT ((0)) NOT NULL,
    "LI" BIT CONSTRAINT "DF_SingleRoleRules_LI" DEFAULT ((0)) NOT NULL,
    "LJ" BIT CONSTRAINT "DF_SingleRoleRules_LJ" DEFAULT ((0)) NOT NULL,
    "LK" BIT CONSTRAINT "DF_SingleRoleRules_LK" DEFAULT ((0)) NOT NULL,
    "LL" BIT CONSTRAINT "DF_SingleRoleRules_LL" DEFAULT ((0)) NOT NULL,
    "LM" BIT CONSTRAINT "DF_SingleRoleRules_LM" DEFAULT ((0)) NOT NULL,
    "LN" BIT CONSTRAINT "DF_SingleRoleRules_LN" DEFAULT ((0)) NOT NULL,
    "LO" BIT CONSTRAINT "DF_SingleRoleRules_LO" DEFAULT ((0)) NOT NULL,
    "LP" BIT CONSTRAINT "DF_SingleRoleRules_LP" DEFAULT ((0)) NOT NULL,
    "LQ" BIT CONSTRAINT "DF_SingleRoleRules_LQ" DEFAULT ((0)) NOT NULL,
    "LR" BIT CONSTRAINT "DF_SingleRoleRules_LR" DEFAULT ((0)) NOT NULL,
    "LS" BIT CONSTRAINT "DF_SingleRoleRules_LS" DEFAULT ((0)) NOT NULL,
    "LT" BIT CONSTRAINT "DF_SingleRoleRules_LT" DEFAULT ((0)) NOT NULL,
    "LU" BIT CONSTRAINT "DF_SingleRoleRules_LU" DEFAULT ((0)) NOT NULL,
    "LV" BIT CONSTRAINT "DF_SingleRoleRules_LV" DEFAULT ((0)) NOT NULL,
    "L10" BIT CONSTRAINT "DF_SingleRoleRules_L10" DEFAULT ((0)) NOT NULL,
    "L11" BIT CONSTRAINT "DF_SingleRoleRules_L11" DEFAULT ((0)) NOT NULL,
    "L12" BIT CONSTRAINT "DF_SingleRoleRules_L12" DEFAULT ((0)) NOT NULL,
    "L13" BIT CONSTRAINT "DF_SingleRoleRules_L13" DEFAULT ((0)) NOT NULL,
    "L14" BIT CONSTRAINT "DF_SingleRoleRules_L14" DEFAULT ((0)) NOT NULL,
    "L15" BIT CONSTRAINT "DF_SingleRoleRules_L15" DEFAULT ((0)) NOT NULL,
    "L16" BIT CONSTRAINT "DF_SingleRoleRules_L16" DEFAULT ((0)) NOT NULL,
    "L17" BIT CONSTRAINT "DF_SingleRoleRules_L17" DEFAULT ((0)) NOT NULL,
    "L18" BIT CONSTRAINT "DF_SingleRoleRules_L18" DEFAULT ((0)) NOT NULL,
    "L19" BIT CONSTRAINT "DF_SingleRoleRules_L19" DEFAULT ((0)) NOT NULL,
    "L1A" BIT CONSTRAINT "DF_SingleRoleRules_L1A" DEFAULT ((0)) NOT NULL,
    "L1B" BIT CONSTRAINT "DF_SingleRoleRules_L1B" DEFAULT ((0)) NOT NULL,
    "L1C" BIT CONSTRAINT "DF_SingleRoleRules_L1C" DEFAULT ((0)) NOT NULL,
    "L1D" BIT CONSTRAINT "DF_SingleRoleRules_L1D" DEFAULT ((0)) NOT NULL,
    "L1E" BIT CONSTRAINT "DF_SingleRoleRules_L1E" DEFAULT ((0)) NOT NULL,
    "L1F" BIT CONSTRAINT "DF_SingleRoleRules_L1F" DEFAULT ((0)) NOT NULL,
    "L1G" BIT CONSTRAINT "DF_SingleRoleRules_L1G" DEFAULT ((0)) NOT NULL,
    "L1H" BIT CONSTRAINT "DF_SingleRoleRules_L1H" DEFAULT ((0)) NOT NULL,
    "L1I" BIT CONSTRAINT "DF_SingleRoleRules_L1I" DEFAULT ((0)) NOT NULL,
    "L1J" BIT CONSTRAINT "DF_SingleRoleRules_L1J" DEFAULT ((0)) NOT NULL,
    "L1K" BIT CONSTRAINT "DF_SingleRoleRules_L1K" DEFAULT ((0)) NOT NULL,
    "L1L" BIT CONSTRAINT "DF_SingleRoleRules_L1L" DEFAULT ((0)) NOT NULL,
    "L1M" BIT CONSTRAINT "DF_SingleRoleRules_L1M" DEFAULT ((0)) NOT NULL,
    "L1N" BIT CONSTRAINT "DF_SingleRoleRules_L1N" DEFAULT ((0)) NOT NULL,
    "L1O" BIT CONSTRAINT "DF_SingleRoleRules_L1O" DEFAULT ((0)) NOT NULL,
    "L1P" BIT CONSTRAINT "DF_SingleRoleRules_L1P" DEFAULT ((0)) NOT NULL,
    "L1Q" BIT CONSTRAINT "DF_SingleRoleRules_L1Q" DEFAULT ((0)) NOT NULL,
    "L1R" BIT CONSTRAINT "DF_SingleRoleRules_L1R" DEFAULT ((0)) NOT NULL,
    "L1S" BIT CONSTRAINT "DF_SingleRoleRules_L1S" DEFAULT ((0)) NOT NULL,
    "L1T" BIT CONSTRAINT "DF_SingleRoleRules_L1T" DEFAULT ((0)) NOT NULL,
    "L1U" BIT CONSTRAINT "DF_SingleRoleRules_L1U" DEFAULT ((0)) NOT NULL,
    "L1V" BIT CONSTRAINT "DF_SingleRoleRules_L1V" DEFAULT ((0)) NOT NULL,
    "L20" BIT CONSTRAINT "DF_SingleRoleRules_L20" DEFAULT ((0)) NOT NULL,
    "L21" BIT CONSTRAINT "DF_SingleRoleRules_L21" DEFAULT ((0)) NOT NULL,
    "L22" BIT CONSTRAINT "DF_SingleRoleRules_L22" DEFAULT ((0)) NOT NULL,
    "L23" BIT CONSTRAINT "DF_SingleRoleRules_L23" DEFAULT ((0)) NOT NULL,
    "L24" BIT CONSTRAINT "DF_SingleRoleRules_L24" DEFAULT ((0)) NOT NULL,
    "L25" BIT CONSTRAINT "DF_SingleRoleRules_L25" DEFAULT ((0)) NOT NULL,
    "L26" BIT CONSTRAINT "DF_SingleRoleRules_L26" DEFAULT ((0)) NOT NULL,
    "L27" BIT CONSTRAINT "DF_SingleRoleRules_L27" DEFAULT ((0)) NOT NULL,
    "L28" BIT CONSTRAINT "DF_SingleRoleRules_L28" DEFAULT ((0)) NOT NULL,
    "L29" BIT CONSTRAINT "DF_SingleRoleRules_L29" DEFAULT ((0)) NOT NULL,
    "L2A" BIT CONSTRAINT "DF_SingleRoleRules_L2A" DEFAULT ((0)) NOT NULL,
    "L2B" BIT CONSTRAINT "DF_SingleRoleRules_L2B" DEFAULT ((0)) NOT NULL,
    "L2C" BIT CONSTRAINT "DF_SingleRoleRules_L2C" DEFAULT ((0)) NOT NULL,
    "L2D" BIT CONSTRAINT "DF_SingleRoleRules_L2D" DEFAULT ((0)) NOT NULL,
    "L2E" BIT CONSTRAINT "DF_SingleRoleRules_L2E" DEFAULT ((0)) NOT NULL,
    "L2F" BIT CONSTRAINT "DF_SingleRoleRules_L2F" DEFAULT ((0)) NOT NULL,
    "L2G" BIT CONSTRAINT "DF_SingleRoleRules_L2G" DEFAULT ((0)) NOT NULL,
    "L2H" BIT CONSTRAINT "DF_SingleRoleRules_L2H" DEFAULT ((0)) NOT NULL,
    "L2I" BIT CONSTRAINT "DF_SingleRoleRules_L2I" DEFAULT ((0)) NOT NULL,
    "L2J" BIT CONSTRAINT "DF_SingleRoleRules_L2J" DEFAULT ((0)) NOT NULL,
    "L2K" BIT CONSTRAINT "DF_SingleRoleRules_L2K" DEFAULT ((0)) NOT NULL,
    "L2L" BIT CONSTRAINT "DF_SingleRoleRules_L2L" DEFAULT ((0)) NOT NULL,
    "L2M" BIT CONSTRAINT "DF_SingleRoleRules_L2M" DEFAULT ((0)) NOT NULL,
    "L2N" BIT CONSTRAINT "DF_SingleRoleRules_L2N" DEFAULT ((0)) NOT NULL,
    "L2O" BIT CONSTRAINT "DF_SingleRoleRules_L2O" DEFAULT ((0)) NOT NULL,
    "L2P" BIT CONSTRAINT "DF_SingleRoleRules_L2P" DEFAULT ((0)) NOT NULL,
    "L2Q" BIT CONSTRAINT "DF_SingleRoleRules_L2Q" DEFAULT ((0)) NOT NULL,
    "L2R" BIT CONSTRAINT "DF_SingleRoleRules_L2R" DEFAULT ((0)) NOT NULL,
    "L2S" BIT CONSTRAINT "DF_SingleRoleRules_L2S" DEFAULT ((0)) NOT NULL,
    "L2T" BIT CONSTRAINT "DF_SingleRoleRules_L2T" DEFAULT ((0)) NOT NULL,
    "L2U" BIT CONSTRAINT "DF_SingleRoleRules_L2U" DEFAULT ((0)) NOT NULL,
    "L2V" BIT CONSTRAINT "DF_SingleRoleRules_L2V" DEFAULT ((0)) NOT NULL,
    "L30" BIT CONSTRAINT "DF_SingleRoleRules_L30" DEFAULT ((0)) NOT NULL,
    "L31" BIT CONSTRAINT "DF_SingleRoleRules_L31" DEFAULT ((0)) NOT NULL,
    "L32" BIT CONSTRAINT "DF_SingleRoleRules_L32" DEFAULT ((0)) NOT NULL,
    "L33" BIT CONSTRAINT "DF_SingleRoleRules_L33" DEFAULT ((0)) NOT NULL,
    "L34" BIT CONSTRAINT "DF_SingleRoleRules_L34" DEFAULT ((0)) NOT NULL,
    "L35" BIT CONSTRAINT "DF_SingleRoleRules_L35" DEFAULT ((0)) NOT NULL,
    "L36" BIT CONSTRAINT "DF_SingleRoleRules_L36" DEFAULT ((0)) NOT NULL,
    "L37" BIT CONSTRAINT "DF_SingleRoleRules_L37" DEFAULT ((0)) NOT NULL,
    "L38" BIT CONSTRAINT "DF_SingleRoleRules_L38" DEFAULT ((0)) NOT NULL,
    "L39" BIT CONSTRAINT "DF_SingleRoleRules_L39" DEFAULT ((0)) NOT NULL,
    "L3A" BIT CONSTRAINT "DF_SingleRoleRules_L3A" DEFAULT ((0)) NOT NULL,
    "L3B" BIT CONSTRAINT "DF_SingleRoleRules_L3B" DEFAULT ((0)) NOT NULL,
    "L3C" BIT CONSTRAINT "DF_SingleRoleRules_L3C" DEFAULT ((0)) NOT NULL,
    "L3D" BIT CONSTRAINT "DF_SingleRoleRules_L3D" DEFAULT ((0)) NOT NULL,
    "L3E" BIT CONSTRAINT "DF_SingleRoleRules_L3E" DEFAULT ((0)) NOT NULL,
    "L3F" BIT CONSTRAINT "DF_SingleRoleRules_L3F" DEFAULT ((0)) NOT NULL,
    "L3G" BIT CONSTRAINT "DF_SingleRoleRules_L3G" DEFAULT ((0)) NOT NULL,
    "L3H" BIT CONSTRAINT "DF_SingleRoleRules_L3H" DEFAULT ((0)) NOT NULL,
    "L3I" BIT CONSTRAINT "DF_SingleRoleRules_L3I" DEFAULT ((0)) NOT NULL,
    "L3J" BIT CONSTRAINT "DF_SingleRoleRules_L3J" DEFAULT ((0)) NOT NULL,
    "L3K" BIT CONSTRAINT "DF_SingleRoleRules_L3K" DEFAULT ((0)) NOT NULL,
    "L3L" BIT CONSTRAINT "DF_SingleRoleRules_L3L" DEFAULT ((0)) NOT NULL,
    "L3M" BIT CONSTRAINT "DF_SingleRoleRules_L3M" DEFAULT ((0)) NOT NULL,
    "L3N" BIT CONSTRAINT "DF_SingleRoleRules_L3N" DEFAULT ((0)) NOT NULL,
    "L3O" BIT CONSTRAINT "DF_SingleRoleRules_L3O" DEFAULT ((0)) NOT NULL,
    "L3P" BIT CONSTRAINT "DF_SingleRoleRules_L3P" DEFAULT ((0)) NOT NULL,
    "L3Q" BIT CONSTRAINT "DF_SingleRoleRules_L3Q" DEFAULT ((0)) NOT NULL,
    "L3R" BIT CONSTRAINT "DF_SingleRoleRules_L3R" DEFAULT ((0)) NOT NULL,
    "L3S" BIT CONSTRAINT "DF_SingleRoleRules_L3S" DEFAULT ((0)) NOT NULL,
    "L3T" BIT CONSTRAINT "DF_SingleRoleRules_L3T" DEFAULT ((0)) NOT NULL,
    "L3U" BIT CONSTRAINT "DF_SingleRoleRules_L3U" DEFAULT ((0)) NOT NULL,
    "L3V" BIT CONSTRAINT "DF_SingleRoleRules_L3V" DEFAULT ((0)) NOT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    "D0_Id" BIGINT NULL,
    "D1_Id" BIGINT NULL,
    "D2_Id" BIGINT NULL,
    "D3_Id" BIGINT NULL,
    "D4_Id" BIGINT NULL,
    "D5_Id" BIGINT NULL,
    "D6_Id" BIGINT NULL,
    "D7_Id" BIGINT NULL,
    "D8_Id" BIGINT NULL,
    "D9_Id" BIGINT NULL,
    "DA_Id" BIGINT NULL,
    "DB_Id" BIGINT NULL,
    "DC_Id" BIGINT NULL,
    "DD_Id" BIGINT NULL,
    "DE_Id" BIGINT NULL,
    "DF_Id" BIGINT NULL,
    "DG_Id" BIGINT NULL,
    "DH_Id" BIGINT NULL,
    "DI_Id" BIGINT NULL,
    "DJ_Id" BIGINT NULL,
    "DK_Id" BIGINT NULL,
    "DL_Id" BIGINT NULL,
    "DM_Id" BIGINT NULL,
    "DN_Id" BIGINT NULL,
    "DO_Id" BIGINT NULL,
    "DP_Id" BIGINT NULL,
    "DQ_Id" BIGINT NULL,
    "DR_Id" BIGINT NULL,
    "DS_Id" BIGINT NULL,
    "DT_Id" BIGINT NULL,
    "DU_Id" BIGINT NULL,
    "DV_Id" BIGINT NULL,
    "D10_Id" BIGINT NULL,
    "D11_Id" BIGINT NULL,
    "D12_Id" BIGINT NULL,
    "D13_Id" BIGINT NULL,
    "D14_Id" BIGINT NULL,
    "D15_Id" BIGINT NULL,
    "D16_Id" BIGINT NULL,
    "D17_Id" BIGINT NULL,
    "D18_Id" BIGINT NULL,
    "D19_Id" BIGINT NULL,
    "D1A_Id" BIGINT NULL,
    "D1B_Id" BIGINT NULL,
    "D1C_Id" BIGINT NULL,
    "D1D_Id" BIGINT NULL,
    "D1E_Id" BIGINT NULL,
    "D1F_Id" BIGINT NULL,
    "D1G_Id" BIGINT NULL,
    "D1H_Id" BIGINT NULL,
    "D1I_Id" BIGINT NULL,
    "D1J_Id" BIGINT NULL,
    "D1K_Id" BIGINT NULL,
    "D1L_Id" BIGINT NULL,
    "D1M_Id" BIGINT NULL,
    "D1N_Id" BIGINT NULL,
    "D1O_Id" BIGINT NULL,
    "D1P_Id" BIGINT NULL,
    "D1Q_Id" BIGINT NULL,
    "D1R_Id" BIGINT NULL,
    "D1S_Id" BIGINT NULL,
    "D1T_Id" BIGINT NULL,
    "D1U_Id" BIGINT NULL,
    "D1V_Id" BIGINT NULL,
    "D20_Id" BIGINT NULL,
    "D21_Id" BIGINT NULL,
    "D22_Id" BIGINT NULL,
    "D23_Id" BIGINT NULL,
    "D24_Id" BIGINT NULL,
    "D25_Id" BIGINT NULL,
    "D26_Id" BIGINT NULL,
    "D27_Id" BIGINT NULL,
    "D28_Id" BIGINT NULL,
    "D29_Id" BIGINT NULL,
    "D2A_Id" BIGINT NULL,
    "D2B_Id" BIGINT NULL,
    "D2C_Id" BIGINT NULL,
    "D2D_Id" BIGINT NULL,
    "D2E_Id" BIGINT NULL,
    "D2F_Id" BIGINT NULL,
    "D2G_Id" BIGINT NULL,
    "D2H_Id" BIGINT NULL,
    "D2I_Id" BIGINT NULL,
    "D2J_Id" BIGINT NULL,
    "D2K_Id" BIGINT NULL,
    "D2L_Id" BIGINT NULL,
    "D2M_Id" BIGINT NULL,
    "D2N_Id" BIGINT NULL,
    "D2O_Id" BIGINT NULL,
    "D2P_Id" BIGINT NULL,
    "D2Q_Id" BIGINT NULL,
    "D2R_Id" BIGINT NULL,
    "D2S_Id" BIGINT NULL,
    "D2T_Id" BIGINT NULL,
    "D2U_Id" BIGINT NULL,
    "D2V_Id" BIGINT NULL,
    "D30_Id" BIGINT NULL,
    "D31_Id" BIGINT NULL,
    "D32_Id" BIGINT NULL,
    "D33_Id" BIGINT NULL,
    "D34_Id" BIGINT NULL,
    "D35_Id" BIGINT NULL,
    "D36_Id" BIGINT NULL,
    "D37_Id" BIGINT NULL,
    "D38_Id" BIGINT NULL,
    "D39_Id" BIGINT NULL,
    "D3A_Id" BIGINT NULL,
    "D3B_Id" BIGINT NULL,
    "D3C_Id" BIGINT NULL,
    "D3D_Id" BIGINT NULL,
    "D3E_Id" BIGINT NULL,
    "D3F_Id" BIGINT NULL,
    "D3G_Id" BIGINT NULL,
    "D3H_Id" BIGINT NULL,
    "D3I_Id" BIGINT NULL,
    "D3J_Id" BIGINT NULL,
    "D3K_Id" BIGINT NULL,
    "D3L_Id" BIGINT NULL,
    "D3M_Id" BIGINT NULL,
    "D3N_Id" BIGINT NULL,
    "D3O_Id" BIGINT NULL,
    "D3P_Id" BIGINT NULL,
    "D3Q_Id" BIGINT NULL,
    "D3R_Id" BIGINT NULL,
    "D3S_Id" BIGINT NULL,
    "D3T_Id" BIGINT NULL,
    "D3U_Id" BIGINT NULL,
    "D3V_Id" BIGINT NULL,
    "BaseRule_Id" BIGINT CONSTRAINT "DF_SingleRoleRules_BaseRule" DEFAULT((0)) NULL,
    CONSTRAINT "PK_SingleRoleRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_SingleRoleRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_SingleRoleRules_CompositeRole" FOREIGN KEY ("CompositeRole_Id") REFERENCES "UP_CompositeRoles" ("Id"),
    CONSTRAINT "FK_SingleRoleRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_SingleRoleRules_Role" FOREIGN KEY ("Role_Id") REFERENCES "UP_SingleRoles" ("Id")
);
GO
CREATE CLUSTERED INDEX "IX_SingleRoleRules" ON "UP_SingleRoleRules" ("EntityType_Id" ASC, "Role_Id" ASC, "Id" ASC);
GO

   GO
   CREATE TABLE "UP_SingleRolesCategories" (
    "SingleRole_Id" BIGINT NOT NULL,
    "Category_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_SingleRolesCategories" PRIMARY KEY CLUSTERED ("SingleRole_Id" ASC, "Category_Id" ASC),
    CONSTRAINT "FK_SingleRolesCategories_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_SingleRolesCategories_SingleRole" FOREIGN KEY ("SingleRole_Id") REFERENCES "UP_SingleRoles" ("Id")
);

   GO
   CREATE TABLE "UR_ResourceLinks" (
    "R1_Id" BIGINT NOT NULL,
    "R2_Id" BIGINT NOT NULL,
    "Type" BIGINT NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_ResourceLinks_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_ResourceLinks_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    CONSTRAINT "FK_ResourceLinks_Type" FOREIGN KEY ("Type") REFERENCES "UM_EntityAssociations" ("Id"),
);


GO
CREATE UNIQUE NONCLUSTERED INDEX "IX_ResourceLinks_2"
    ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R2_Id" ASC, "R1_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON);


GO
CREATE UNIQUE CLUSTERED INDEX "IX_ResourceLinks_1"
    ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R1_Id" ASC, "R2_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON);

GO
ALTER TABLE "UR_ResourceLinks" NOCHECK CONSTRAINT "FK_ResourceLinks_Type";
GO
CREATE STATISTICS "S_ResourceLinks_TypeR1" ON "UR_ResourceLinks"("Type","R1_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE STATISTICS "S_ResourceLinks_TypeR2" ON "UR_ResourceLinks"("Type","R2_Id") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;

   GO
   CREATE TABLE "US_AccessCertificationDataFilters" (
    "Id" BIGINT NOT NULL,
    "Campaign_Id" BIGINT NOT NULL,
    "IncludeCompositeRoles" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeCompositeRoles" DEFAULT ((0)) NOT NULL,
    "IncludeSingleRoles" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeSingleRoles" DEFAULT ((0)) NOT NULL,
    "IncludeResourceTypes" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeResourceTypes" DEFAULT ((0)) NOT NULL,
    "IncludeResourceNavigations" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeResourceNavigations" DEFAULT ((0)) NOT NULL,
    "IncludeResourceScalars" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeCResourceScalars" DEFAULT ((0)) NOT NULL,
    "IncludeWorkflowStatePolicyApproved" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeWorkflowStatePolicyApproved" DEFAULT ((1)) NOT NULL,
    "IncludeWorkflowStateApproved" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeWorkflowStateApproved" DEFAULT ((1)) NOT NULL,
    "IncludeWorkflowStateFound" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeWorkflowStateFound" DEFAULT ((1)) NOT NULL,
    "IncludeWorkflowStateHistory" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeWorkflowStateHistory" DEFAULT ((1)) NOT NULL,

    "IncludeNoValidation" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeNoValidation" DEFAULT ((1)) NOT NULL,
    "IncludeSimpleValidation" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeSimpleValidation" DEFAULT ((1)) NOT NULL,
    "IncludeDoubleValidation" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeDoubleValidation" DEFAULT ((1)) NOT NULL,
    "IncludeTripleValidation" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeTripleValidation" DEFAULT ((1)) NOT NULL,
    "IncludeManualAssignmentNotAllowed" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeManualAssignmentNotAllowed" DEFAULT ((1)) NOT NULL,
    "IncludeDeniedPermissions" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeDeniedPermissions" DEFAULT ((1)) NOT NULL,

    "IncludeNestedCategories" BIT CONSTRAINT "DF_AccessCertificationDataFilters_IncludeNestedCategories" DEFAULT ((0)) NOT NULL,
    "Category_Id" BIGINT NULL,
    "ResourceType_Id" BIGINT NULL,
    "LatestCertifiedLimitDate" SMALLDATETIME NULL,
    "TargetedRisk_Id" BIGINT NULL,
    "Tags" NVARCHAR(442) NULL,

    CONSTRAINT "PK_AccessCertificationDataFilters" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AccessCertificationDataFilters_Campaign" FOREIGN KEY ("Campaign_Id") REFERENCES "US_AccessCertificationCampaigns" ("Id"),
    CONSTRAINT "FK_AccessCertificationDataFilters_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
    CONSTRAINT "FK_AccessCertificationDataFilters_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
);

   GO
   CREATE TABLE "US_ForwardedAccessCertificationItems"
(
    "Id" BIGINT NOT NULL,
    "Item_Id" BIGINT NOT NULL,
    "Date" SMALLDATETIME NOT NULL,
    "From_Id" BIGINT NOT NULL,
    "To_Id" BIGINT NOT NULL,
    "Comment" NVARCHAR(442) NULL,
    CONSTRAINT "PK_ForwardedAccessCertificationItem" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_ForwardedAccessCertificationItem_Item" FOREIGN KEY ("Item_Id") REFERENCES "US_AccessCertificationItems" ("Id"),
);

   GO
   CREATE TABLE "UU_EntityInstances"
(
    "Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Universe_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "IsHidden" BIT CONSTRAINT "DF_EntityInstances_IsHidden" DEFAULT ((0)) NOT NULL,
    "FilterEntityInstance_Id" BIGINT NULL,
    "FilterProperty_Id" BIGINT NULL,
    "FilterResourceType_Id" BIGINT NULL,
    "FilterEntityType_Id" BIGINT NULL,
    "FilterEntityProperty_Id" BIGINT NULL,
    "FilterValue" NVARCHAR(442) NULL,
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
    CONSTRAINT "PK_EntityInstances" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_EntityInstances_Identifier" UNIQUE ("Identifier", "Universe_Id"),
    CONSTRAINT "FK_EntityInstances_EntityType" FOREIGN KEY("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_EntityInstances_Universe" FOREIGN KEY("Universe_Id") REFERENCES "UU_Universes" ("Id"),
    CONSTRAINT "FK_EntityInstances_FilterEntityInstance" FOREIGN KEY("FilterEntityInstance_Id") REFERENCES "UU_EntityInstances" ("Id"),
    CONSTRAINT "FK_EntityInstances_FilterProperty" FOREIGN KEY("FilterProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_EntityInstances_FilterResourceType" FOREIGN KEY("FilterResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_EntityInstances_FilterEntityType" FOREIGN KEY("FilterEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_EntityInstances_FilterEntityProperty" FOREIGN KEY("FilterEntityProperty_Id") REFERENCES "UM_EntityProperties" ("Id"),
);
GO
ALTER TABLE "UU_EntityInstances" NOCHECK CONSTRAINT "FK_EntityInstances_FilterEntityInstance";


   GO
   CREATE TABLE "UW_PointCuts" (
    "Id" BIGINT NOT NULL,
    "Activity_Id" BIGINT NOT NULL,
    "ActivityState_Id" BIGINT NOT NULL,
    "Aspect_Id" BIGINT NOT NULL,
    "Mode" INT CONSTRAINT "DF_PointCuts_Mode" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "PK_PointCuts" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_PointCuts_Activity" FOREIGN KEY ("Activity_Id") REFERENCES "UW_Activities" ("Id"),
    CONSTRAINT "FK_PointCuts_ActivityState" FOREIGN KEY ("ActivityState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id"),
    CONSTRAINT "FK_PointCuts_Aspect" FOREIGN KEY ("Aspect_Id") REFERENCES "UW_Aspects" ("Id"),
);

   GO
   CREATE TABLE "UW_Recipients" (
    "Id" BIGINT NOT NULL,
    "Type" INT NOT NULL,
    "IsCC" BIT CONSTRAINT "DF_Recipients_IsCC" DEFAULT ((0)) NOT NULL,
    "Aspect_Id" BIGINT NOT NULL,
    "Activity_Id" BIGINT NULL,
    "ActivityState_Id" BIGINT NULL,
    "Binding_Id" BIGINT NULL,
    "EmailAddresses" NVARCHAR(4000) NULL,
    "Expression" NVARCHAR(MAX) NULL,
    CONSTRAINT "PK_Recipients" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_Recipients_Aspect" FOREIGN KEY ("Aspect_Id") REFERENCES "UW_Aspects" ("Id"),
    CONSTRAINT "FK_Recipients_Activity" FOREIGN KEY ("Activity_Id") REFERENCES "UW_Activities" ("Id"),
    CONSTRAINT "FK_Recipients_ActivityState" FOREIGN KEY ("ActivityState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id"),
    CONSTRAINT "FK_Recipients_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
);

   GO
   CREATE TABLE "UW_WorkflowInstances" (
    "Id" BIGINT NOT NULL,
    "Workflow_Id" BIGINT NOT NULL,
    "CurrentActivity_Id" BIGINT NOT NULL,
    "CurrentState_Id" BIGINT NOT NULL,
    "CurrentTransition_Id" BIGINT NOT NULL,
    "CurrentActivityInstance_Id" BIGINT NULL,
    "Identifier" VARCHAR(442) NOT NULL,
    "Type" BIGINT NOT NULL,
    "IsCompleted" BIT CONSTRAINT "DF_WorkflowInstances_IsCompleted" DEFAULT ((0)) NOT NULL,
    "WhenCompleted" DATETIME NULL,
    "C0" NVARCHAR(442) NULL,
    "C1" NVARCHAR(442) NULL,
    "I40" BIGINT NULL,
    "I41" BIGINT NULL,
    CONSTRAINT "PK_WorkflowInstances" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_WorkflowInstances_Workflow" FOREIGN KEY ("Workflow_Id") REFERENCES "UW_Workflows" ("Id"),
    CONSTRAINT "FK_WorkflowInstances_CurrentActivity" FOREIGN KEY ("CurrentActivity_Id") REFERENCES "UW_Activities" ("Id"),
    CONSTRAINT "FK_WorkflowInstances_CurrentState" FOREIGN KEY ("CurrentState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id"),
    CONSTRAINT "FK_WorkflowInstances_CurrentTransition" FOREIGN KEY ("CurrentTransition_Id") REFERENCES "UW_ActivityTemplateTransitions" ("Id"),
    CONSTRAINT "FK_WorkflowInstances_Type" FOREIGN KEY ("Type") REFERENCES "UM_EntityTypes" ("Id")
);

   GO
   CREATE TABLE "UA_AssignedProfiles" (
    "Id" BIGINT NOT NULL,
    "Profile_Id" BIGINT NOT NULL,
    "User_Id" BIGINT NOT NULL,
    "Context_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_AssignedProfiles_IsDenied" DEFAULT ((0)) NOT NULL,
    "AccessState" INT CONSTRAINT "DF_AssignedProfiles_AccessState" DEFAULT ((0)) NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_AssignedProfiles_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_AssignedProfiles_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "Email" NVARCHAR(442) NULL,
    CONSTRAINT "PK_AssignedProfiles" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AssignedProfiles_Profile" FOREIGN KEY ("Profile_Id") REFERENCES "UA_Profiles" ("Id"),
    CONSTRAINT "FK_AssignedProfiles_Context" FOREIGN KEY ("Context_Id") REFERENCES "UA_ProfileContexts" ("Id"),
);
GO
CREATE NONCLUSTERED INDEX "IX_AssignedProfiles_UserInfos"
ON "UA_AssignedProfiles" ("User_Id","StartDate","EndDate")
INCLUDE ("Profile_Id","Context_Id")
WHERE "IsDenied"=0 AND "AccessState" IN (16,18);
GO

   GO
   CREATE TABLE "UA_OpenIdClients"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "HashedSecret" VARCHAR(442) NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "ExpirationDate" DATETIME NULL,
    "Profile_Id" BIGINT NOT NULL,
    "Context_Id" BIGINT NULL,
    CONSTRAINT "PK_OpenIdClients" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_OpenIdClients_Profile" FOREIGN KEY ("Profile_Id") REFERENCES "UA_Profiles" ("Id"),
    CONSTRAINT "FK_OpenIdClients_ProfileContext" FOREIGN KEY ("Context_Id") REFERENCES "UA_ProfileContexts" ("Id"),
    CONSTRAINT "U_OpenIdClients_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UA_ProfileRules" (
    "Id" BIGINT NOT NULL,
    "Profile_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_ProfileRules_IsDenied" DEFAULT ((0)) NOT NULL,
    "Context_Id" BIGINT NOT NULL,
    "RootExpression" NVARCHAR(4000) NULL,
    "SubExpression" NVARCHAR(4000) NULL,
    "B0_Id" BIGINT NULL,
    "B1_Id" BIGINT NULL,
    "B2_Id" BIGINT NULL,
    "B3_Id" BIGINT NULL,
    "B4_Id" BIGINT NULL,
    "B5_Id" BIGINT NULL,
    "B6_Id" BIGINT NULL,
    "B7_Id" BIGINT NULL,
    "B8_Id" BIGINT NULL,
    "B9_Id" BIGINT NULL,
    "BA_Id" BIGINT NULL,
    "BB_Id" BIGINT NULL,
    "BC_Id" BIGINT NULL,
    "BD_Id" BIGINT NULL,
    "BE_Id" BIGINT NULL,
    "BF_Id" BIGINT NULL,
    "BG_Id" BIGINT NULL,
    "BH_Id" BIGINT NULL,
    "BI_Id" BIGINT NULL,
    "BJ_Id" BIGINT NULL,
    "BK_Id" BIGINT NULL,
    "BL_Id" BIGINT NULL,
    "BM_Id" BIGINT NULL,
    "BN_Id" BIGINT NULL,
    "BO_Id" BIGINT NULL,
    "BP_Id" BIGINT NULL,
    "BQ_Id" BIGINT NULL,
    "BR_Id" BIGINT NULL,
    "BS_Id" BIGINT NULL,
    "BT_Id" BIGINT NULL,
    "BU_Id" BIGINT NULL,
    "BV_Id" BIGINT NULL,
    "B10_Id" BIGINT NULL,
    "B11_Id" BIGINT NULL,
    "B12_Id" BIGINT NULL,
    "B13_Id" BIGINT NULL,
    "B14_Id" BIGINT NULL,
    "B15_Id" BIGINT NULL,
    "B16_Id" BIGINT NULL,
    "B17_Id" BIGINT NULL,
    "B18_Id" BIGINT NULL,
    "B19_Id" BIGINT NULL,
    "B1A_Id" BIGINT NULL,
    "B1B_Id" BIGINT NULL,
    "B1C_Id" BIGINT NULL,
    "B1D_Id" BIGINT NULL,
    "B1E_Id" BIGINT NULL,
    "B1F_Id" BIGINT NULL,
    "B1G_Id" BIGINT NULL,
    "B1H_Id" BIGINT NULL,
    "B1I_Id" BIGINT NULL,
    "B1J_Id" BIGINT NULL,
    "B1K_Id" BIGINT NULL,
    "B1L_Id" BIGINT NULL,
    "B1M_Id" BIGINT NULL,
    "B1N_Id" BIGINT NULL,
    "B1O_Id" BIGINT NULL,
    "B1P_Id" BIGINT NULL,
    "B1Q_Id" BIGINT NULL,
    "B1R_Id" BIGINT NULL,
    "B1S_Id" BIGINT NULL,
    "B1T_Id" BIGINT NULL,
    "B1U_Id" BIGINT NULL,
    "B1V_Id" BIGINT NULL,
    "B20_Id" BIGINT NULL,
    "B21_Id" BIGINT NULL,
    "B22_Id" BIGINT NULL,
    "B23_Id" BIGINT NULL,
    "B24_Id" BIGINT NULL,
    "B25_Id" BIGINT NULL,
    "B26_Id" BIGINT NULL,
    "B27_Id" BIGINT NULL,
    "B28_Id" BIGINT NULL,
    "B29_Id" BIGINT NULL,
    "B2A_Id" BIGINT NULL,
    "B2B_Id" BIGINT NULL,
    "B2C_Id" BIGINT NULL,
    "B2D_Id" BIGINT NULL,
    "B2E_Id" BIGINT NULL,
    "B2F_Id" BIGINT NULL,
    "B2G_Id" BIGINT NULL,
    "B2H_Id" BIGINT NULL,
    "B2I_Id" BIGINT NULL,
    "B2J_Id" BIGINT NULL,
    "B2K_Id" BIGINT NULL,
    "B2L_Id" BIGINT NULL,
    "B2M_Id" BIGINT NULL,
    "B2N_Id" BIGINT NULL,
    "B2O_Id" BIGINT NULL,
    "B2P_Id" BIGINT NULL,
    "B2Q_Id" BIGINT NULL,
    "B2R_Id" BIGINT NULL,
    "B2S_Id" BIGINT NULL,
    "B2T_Id" BIGINT NULL,
    "B2U_Id" BIGINT NULL,
    "B2V_Id" BIGINT NULL,
    "B30_Id" BIGINT NULL,
    "B31_Id" BIGINT NULL,
    "B32_Id" BIGINT NULL,
    "B33_Id" BIGINT NULL,
    "B34_Id" BIGINT NULL,
    "B35_Id" BIGINT NULL,
    "B36_Id" BIGINT NULL,
    "B37_Id" BIGINT NULL,
    "B38_Id" BIGINT NULL,
    "B39_Id" BIGINT NULL,
    "B3A_Id" BIGINT NULL,
    "B3B_Id" BIGINT NULL,
    "B3C_Id" BIGINT NULL,
    "B3D_Id" BIGINT NULL,
    "B3E_Id" BIGINT NULL,
    "B3F_Id" BIGINT NULL,
    "B3G_Id" BIGINT NULL,
    "B3H_Id" BIGINT NULL,
    "B3I_Id" BIGINT NULL,
    "B3J_Id" BIGINT NULL,
    "B3K_Id" BIGINT NULL,
    "B3L_Id" BIGINT NULL,
    "B3M_Id" BIGINT NULL,
    "B3N_Id" BIGINT NULL,
    "B3O_Id" BIGINT NULL,
    "B3P_Id" BIGINT NULL,
    "B3Q_Id" BIGINT NULL,
    "B3R_Id" BIGINT NULL,
    "B3S_Id" BIGINT NULL,
    "B3T_Id" BIGINT NULL,
    "B3U_Id" BIGINT NULL,
    "B3V_Id" BIGINT NULL,
    CONSTRAINT "PK_ProfileRules" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ProfileRules_Profile" FOREIGN KEY ("Profile_Id") REFERENCES "UA_Profiles" ("Id"),
    CONSTRAINT "FK_ProfileRules_Context" FOREIGN KEY ("Context_Id") REFERENCES "UA_ProfileRuleContexts" ("Id"),
    CONSTRAINT "FK_ProfileRules_B0_Id" FOREIGN KEY ("B0_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1_Id" FOREIGN KEY ("B1_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2_Id" FOREIGN KEY ("B2_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3_Id" FOREIGN KEY ("B3_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B4_Id" FOREIGN KEY ("B4_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B5_Id" FOREIGN KEY ("B5_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B6_Id" FOREIGN KEY ("B6_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B7_Id" FOREIGN KEY ("B7_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B8_Id" FOREIGN KEY ("B8_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B9_Id" FOREIGN KEY ("B9_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BA_Id" FOREIGN KEY ("BA_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BB_Id" FOREIGN KEY ("BB_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BC_Id" FOREIGN KEY ("BC_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BD_Id" FOREIGN KEY ("BD_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BE_Id" FOREIGN KEY ("BE_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BF_Id" FOREIGN KEY ("BF_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BG_Id" FOREIGN KEY ("BG_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BH_Id" FOREIGN KEY ("BH_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BI_Id" FOREIGN KEY ("BI_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BJ_Id" FOREIGN KEY ("BJ_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BK_Id" FOREIGN KEY ("BK_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BL_Id" FOREIGN KEY ("BL_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BM_Id" FOREIGN KEY ("BM_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BN_Id" FOREIGN KEY ("BN_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BO_Id" FOREIGN KEY ("BO_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BP_Id" FOREIGN KEY ("BP_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BQ_Id" FOREIGN KEY ("BQ_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BR_Id" FOREIGN KEY ("BR_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BS_Id" FOREIGN KEY ("BS_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BT_Id" FOREIGN KEY ("BT_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BU_Id" FOREIGN KEY ("BU_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_BV_Id" FOREIGN KEY ("BV_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B10_Id" FOREIGN KEY ("B10_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B11_Id" FOREIGN KEY ("B11_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B12_Id" FOREIGN KEY ("B12_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B13_Id" FOREIGN KEY ("B13_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B14_Id" FOREIGN KEY ("B14_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B15_Id" FOREIGN KEY ("B15_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B16_Id" FOREIGN KEY ("B16_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B17_Id" FOREIGN KEY ("B17_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B18_Id" FOREIGN KEY ("B18_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B19_Id" FOREIGN KEY ("B19_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1A_Id" FOREIGN KEY ("B1A_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1B_Id" FOREIGN KEY ("B1B_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1C_Id" FOREIGN KEY ("B1C_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1D_Id" FOREIGN KEY ("B1D_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1E_Id" FOREIGN KEY ("B1E_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1F_Id" FOREIGN KEY ("B1F_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1G_Id" FOREIGN KEY ("B1G_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1H_Id" FOREIGN KEY ("B1H_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1I_Id" FOREIGN KEY ("B1I_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1J_Id" FOREIGN KEY ("B1J_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1K_Id" FOREIGN KEY ("B1K_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1L_Id" FOREIGN KEY ("B1L_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1M_Id" FOREIGN KEY ("B1M_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1N_Id" FOREIGN KEY ("B1N_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1O_Id" FOREIGN KEY ("B1O_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1P_Id" FOREIGN KEY ("B1P_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1Q_Id" FOREIGN KEY ("B1Q_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1R_Id" FOREIGN KEY ("B1R_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1S_Id" FOREIGN KEY ("B1S_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1T_Id" FOREIGN KEY ("B1T_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1U_Id" FOREIGN KEY ("B1U_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B1V_Id" FOREIGN KEY ("B1V_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B20_Id" FOREIGN KEY ("B20_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B21_Id" FOREIGN KEY ("B21_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B22_Id" FOREIGN KEY ("B22_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B23_Id" FOREIGN KEY ("B23_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B24_Id" FOREIGN KEY ("B24_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B25_Id" FOREIGN KEY ("B25_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B26_Id" FOREIGN KEY ("B26_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B27_Id" FOREIGN KEY ("B27_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B28_Id" FOREIGN KEY ("B28_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B29_Id" FOREIGN KEY ("B29_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2A_Id" FOREIGN KEY ("B2A_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2B_Id" FOREIGN KEY ("B2B_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2C_Id" FOREIGN KEY ("B2C_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2D_Id" FOREIGN KEY ("B2D_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2E_Id" FOREIGN KEY ("B2E_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2F_Id" FOREIGN KEY ("B2F_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2G_Id" FOREIGN KEY ("B2G_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2H_Id" FOREIGN KEY ("B2H_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2I_Id" FOREIGN KEY ("B2I_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2J_Id" FOREIGN KEY ("B2J_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2K_Id" FOREIGN KEY ("B2K_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2L_Id" FOREIGN KEY ("B2L_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2M_Id" FOREIGN KEY ("B2M_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2N_Id" FOREIGN KEY ("B2N_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2O_Id" FOREIGN KEY ("B2O_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2P_Id" FOREIGN KEY ("B2P_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2Q_Id" FOREIGN KEY ("B2Q_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2R_Id" FOREIGN KEY ("B2R_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2S_Id" FOREIGN KEY ("B2S_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2T_Id" FOREIGN KEY ("B2T_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2U_Id" FOREIGN KEY ("B2U_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B2V_Id" FOREIGN KEY ("B2V_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B30_Id" FOREIGN KEY ("B30_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B31_Id" FOREIGN KEY ("B31_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B32_Id" FOREIGN KEY ("B32_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B33_Id" FOREIGN KEY ("B33_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B34_Id" FOREIGN KEY ("B34_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B35_Id" FOREIGN KEY ("B35_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B36_Id" FOREIGN KEY ("B36_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B37_Id" FOREIGN KEY ("B37_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B38_Id" FOREIGN KEY ("B38_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B39_Id" FOREIGN KEY ("B39_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3A_Id" FOREIGN KEY ("B3A_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3B_Id" FOREIGN KEY ("B3B_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3C_Id" FOREIGN KEY ("B3C_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3D_Id" FOREIGN KEY ("B3D_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3E_Id" FOREIGN KEY ("B3E_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3F_Id" FOREIGN KEY ("B3F_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3G_Id" FOREIGN KEY ("B3G_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3H_Id" FOREIGN KEY ("B3H_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3I_Id" FOREIGN KEY ("B3I_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3J_Id" FOREIGN KEY ("B3J_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3K_Id" FOREIGN KEY ("B3K_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3L_Id" FOREIGN KEY ("B3L_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3M_Id" FOREIGN KEY ("B3M_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3N_Id" FOREIGN KEY ("B3N_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3O_Id" FOREIGN KEY ("B3O_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3P_Id" FOREIGN KEY ("B3P_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3Q_Id" FOREIGN KEY ("B3Q_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3R_Id" FOREIGN KEY ("B3R_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3S_Id" FOREIGN KEY ("B3S_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3T_Id" FOREIGN KEY ("B3T_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3U_Id" FOREIGN KEY ("B3U_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_ProfileRules_B3V_Id" FOREIGN KEY ("B3V_Id") REFERENCES "UM_Bindings" ("Id"),
);

   GO
   CREATE TABLE "UC_ConnectionColumns" (
    "Id" BIGINT NOT NULL,
    "Table_Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "KeyType" TINYINT CONSTRAINT "DF_ConnectionColumns_KeyType" DEFAULT ((0)) NOT NULL,
    "ValueType" TINYINT CONSTRAINT "DF_ConnectionColumns_ValueType" DEFAULT ((0)) NOT NULL,
    "ValueLength" INT CONSTRAINT "DF_ConnectionColumns_ValueLength" DEFAULT ((0)) NOT NULL,
    "IsMultivalued" BIT CONSTRAINT "DF_ConnectionColumns_IsMultivalued" DEFAULT ((0)) NOT NULL,
    "DisplayName" NVARCHAR(442) NULL,
    "Path" NVARCHAR(442) NULL,
    "UpdateDate" DATETIME NULL,
    "ForeignColumn_Id" BIGINT NULL,
    CONSTRAINT "PK_ConnectionColumns" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "U_ConnectionColumns_Identifier" UNIQUE ("Table_Id","Identifier"),
    CONSTRAINT "FK_ConnectionColumns_Table" FOREIGN KEY ("Table_Id") REFERENCES "UC_ConnectionTables" ("Id"),
    CONSTRAINT "FK_ConnectionColumns_ForeignColumn" FOREIGN KEY ("ForeignColumn_Id") REFERENCES "UC_ConnectionColumns" ("Id"),
);

   GO
   CREATE TABLE "UC_ResourcePropertyMappings" (
    "Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "ResourceTypeMapping_Id" BIGINT NOT NULL,
    "C0" NVARCHAR(442) NULL,
    "C1" NVARCHAR(442) NULL,
    "C2" NVARCHAR(442) NULL,
    "C3" NVARCHAR(442) NULL,
    "C4" NVARCHAR(442) NULL,
    "C5" NVARCHAR(442) NULL,
    "C6" NVARCHAR(442) NULL,
    "C7" NVARCHAR(442) NULL,
    "C8" NVARCHAR(442) NULL,
    "C9" NVARCHAR(442) NULL,
    "C10" NVARCHAR(442) NULL,
    CONSTRAINT "PK_ResourcePropertyMappings" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ResourcePropertyMappings_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_ResourcePropertyMappings_ResourceTypeMapping" FOREIGN KEY ("ResourceTypeMapping_Id") REFERENCES "UC_ResourceTypeMappings" ("Id"),
);

   GO
   CREATE TABLE "UI_FormControls"
(
    "Id" BIGINT NOT NULL,
    "Form_Id" BIGINT NOT NULL,
    "ParentControl_Id" BIGINT NULL,
    "DisplayOrder" INT NOT NULL,
    "OutputType_Id" BIGINT NOT NULL,
    "InputType_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NULL,
    "ColumnSize" INT NULL,
    "EmbeddedForm_Id" BIGINT NULL,
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
    "Binding_Id" BIGINT NULL,
    "Binding2_Id" BIGINT NULL,
    "Binding3_Id" BIGINT NULL,
    "Tile_Id" BIGINT NULL,
    "DisplayTable_Id" BIGINT NULL,
    "IsRequired" BIT NULL,
    "IsReadOnly" BIT NULL,
    "FilterBinding1_Id" BIGINT NULL,
    "LinkedBinding1_Id" BIGINT NULL,
    "FilterBinding2_Id" BIGINT NULL,
    "LinkedBinding2_Id" BIGINT NULL,
    "NavigationBinding_Id" BIGINT NULL,
    "PlaceHolderText_L1" NVARCHAR(64) NULL,
    "PlaceHolderText_L2" NVARCHAR(64) NULL,
    "PlaceHolderText_L3" NVARCHAR(64) NULL,
    "PlaceHolderText_L4" NVARCHAR(64) NULL,
    "PlaceHolderText_L5" NVARCHAR(64) NULL,
    "PlaceHolderText_L6" NVARCHAR(64) NULL,
    "PlaceHolderText_L7" NVARCHAR(64) NULL,
    "PlaceHolderText_L8" NVARCHAR(64) NULL,
    "PlaceHolderText_L9" NVARCHAR(64) NULL,
    "PlaceHolderText_L10" NVARCHAR(64) NULL,
    "PlaceHolderText_L11" NVARCHAR(64) NULL,
    "PlaceHolderText_L12" NVARCHAR(64) NULL,
    "PlaceHolderText_L13" NVARCHAR(64) NULL,
    "PlaceHolderText_L14" NVARCHAR(64) NULL,
    "PlaceHolderText_L15" NVARCHAR(64) NULL,
    "PlaceHolderText_L16" NVARCHAR(64) NULL,
    "ExtensionIdentifier" NVARCHAR(128) NULL,
    "Name" NVARCHAR(442) NULL,
    "HomonymEntityLink_Id" BIGINT NULL,
    "AddedMinutes" INT NULL,
    "DefaultValueBinding_Id" BIGINT NULL,
    CONSTRAINT "PK_FormControls" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_FormControls_Form" FOREIGN KEY ("Form_Id") REFERENCES "UI_Forms" ("Id"),
    CONSTRAINT "FK_FormControls_EmbeddedForm" FOREIGN KEY ("EmbeddedForm_Id") REFERENCES "UI_Forms" ("Id"),
    CONSTRAINT "FK_FormControls_OutputType" FOREIGN KEY ("OutputType_Id") REFERENCES "UI_OutputTypes" ("Id"),
    CONSTRAINT "FK_FormControls_InputType" FOREIGN KEY ("InputType_Id") REFERENCES "UI_InputTypes" ("Id"),
    CONSTRAINT "FK_FormControls_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_FormControls_ParentControl" FOREIGN KEY ("ParentControl_Id") REFERENCES "UI_FormControls" ("Id"),
    CONSTRAINT "FK_FormControls_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_Binding2" FOREIGN KEY ("Binding2_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_Binding3" FOREIGN KEY ("Binding3_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_FilterBinding1" FOREIGN KEY ("FilterBinding1_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_LinkedBinding1" FOREIGN KEY ("LinkedBinding1_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_FilterBinding2" FOREIGN KEY ("FilterBinding2_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_LinkedBinding2" FOREIGN KEY ("LinkedBinding2_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_NavigationBinding" FOREIGN KEY ("NavigationBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_DefaultValueBinding" FOREIGN KEY ("DefaultValueBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_FormControls_Tile" FOREIGN KEY ("Tile_Id") REFERENCES "UI_Tiles" ("Id"),
    CONSTRAINT "FK_FormControls_DisplayTable" FOREIGN KEY ("DisplayTable_Id") REFERENCES "UI_DisplayTables" ("Id"),
    CONSTRAINT "FK_FormControls_HomonymEntityLink" FOREIGN KEY ("HomonymEntityLink_Id") REFERENCES "UW_HomonymEntityLinks" ("Id"),
    CONSTRAINT "CHK_FormControls_ColumnSize" CHECK ("ColumnSize" IS NULL OR ("ColumnSize" >= 0 AND "ColumnSize" <= 12)),
);

   GO
   CREATE TABLE "UI_SearchBarCriteria"
(
    "Id" BIGINT NOT NULL,
    "SearchBar_Id" BIGINT NOT NULL,
    "Binding1_Id" BIGINT NOT NULL,
    "OptimizedBinding1_Id" BIGINT NULL,
    "Binding2_Id" BIGINT NULL,
    "OptimizedBinding2_Id" BIGINT NULL,
    "Binding3_Id" BIGINT NULL,
    "OptimizedBinding3_Id" BIGINT NULL,
    "Binding4_Id" BIGINT NULL,
    "OptimizedBinding4_Id" BIGINT NULL,
    "InputType_Id" BIGINT NOT NULL,
    "DisplayOrder" INT NOT NULL,
    "ColumnSize" INT NOT NULL,
    "IsVisibleInAdvancedView" BIT CONSTRAINT "DF_SearchBarCriteria_IsAdvanced" DEFAULT ((0)) NOT NULL,
    "Operator" TINYINT CONSTRAINT "DF_SearchBarCriteria_Operator" DEFAULT ((0)) NOT NULL,
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
    "PlaceHolderText_L1" NVARCHAR(64) NULL,
    "PlaceHolderText_L2" NVARCHAR(64) NULL,
    "PlaceHolderText_L3" NVARCHAR(64) NULL,
    "PlaceHolderText_L4" NVARCHAR(64) NULL,
    "PlaceHolderText_L5" NVARCHAR(64) NULL,
    "PlaceHolderText_L6" NVARCHAR(64) NULL,
    "PlaceHolderText_L7" NVARCHAR(64) NULL,
    "PlaceHolderText_L8" NVARCHAR(64) NULL,
    "PlaceHolderText_L9" NVARCHAR(64) NULL,
    "PlaceHolderText_L10" NVARCHAR(64) NULL,
    "PlaceHolderText_L11" NVARCHAR(64) NULL,
    "PlaceHolderText_L12" NVARCHAR(64) NULL,
    "PlaceHolderText_L13" NVARCHAR(64) NULL,
    "PlaceHolderText_L14" NVARCHAR(64) NULL,
    "PlaceHolderText_L15" NVARCHAR(64) NULL,
    "PlaceHolderText_L16" NVARCHAR(64) NULL,
    "ToolTipText_L1" NVARCHAR(1024) NULL,
    "ToolTipText_L2" NVARCHAR(1024) NULL,
    "ToolTipText_L3" NVARCHAR(1024) NULL,
    "ToolTipText_L4" NVARCHAR(1024) NULL,
    "ToolTipText_L5" NVARCHAR(1024) NULL,
    "ToolTipText_L6" NVARCHAR(1024) NULL,
    "ToolTipText_L7" NVARCHAR(1024) NULL,
    "ToolTipText_L8" NVARCHAR(1024) NULL,
    "ToolTipText_L9" NVARCHAR(1024) NULL,
    "ToolTipText_L10" NVARCHAR(1024) NULL,
    "ToolTipText_L11" NVARCHAR(1024) NULL,
    "ToolTipText_L12" NVARCHAR(1024) NULL,
    "ToolTipText_L13" NVARCHAR(1024) NULL,
    "ToolTipText_L14" NVARCHAR(1024) NULL,
    "ToolTipText_L15" NVARCHAR(1024) NULL,
    "ToolTipText_L16" NVARCHAR(1024) NULL,
    "DefaultValue" NVARCHAR(442) NULL,
    CONSTRAINT "PK_SearchBarCriteria" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_SearchBarCriteria_SearchBar" FOREIGN KEY ("SearchBar_Id") REFERENCES "UI_SearchBars" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_Binding1" FOREIGN KEY ("Binding1_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding1" FOREIGN KEY ("OptimizedBinding1_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_Binding2" FOREIGN KEY ("Binding2_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding2" FOREIGN KEY ("OptimizedBinding2_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_Binding3" FOREIGN KEY ("Binding3_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding3" FOREIGN KEY ("OptimizedBinding3_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_Binding4" FOREIGN KEY ("Binding4_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_OptimizedBinding4" FOREIGN KEY ("OptimizedBinding4_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_SearchBarCriteria_InputType" FOREIGN KEY ("InputType_Id") REFERENCES "UI_InputTypes" ("Id"),
    CONSTRAINT "CHK_SearchBarCriteria_ColumnSize" CHECK ("ColumnSize" >= 1 AND "ColumnSize" <= 12),
);

   GO
   CREATE TABLE "UP_AssignedCompositeRoles" (
    "Id" BIGINT NOT NULL,
    "Role_Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NOT NULL,
    "ParametersContext_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_AssignedCompositeRoles_IsDenied" DEFAULT ((0)) NOT NULL,
    "IsInferred" BIT CONSTRAINT "DF_AssignedCompositeRoles_IsInferred" DEFAULT ((0)) NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AssignedCompositeRoles_WorkflowState" DEFAULT ((0)) NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_AssignedCompositeRoles_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_AssignedCompositeRoles_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_AssignedCompositeRoles_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_AssignedCompositeRoles_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "WhenCreated" SMALLDATETIME CONSTRAINT "DF_AssignedCompositeRoles_WhenCreated" DEFAULT CONVERT(SMALLDATETIME,GETUTCDATE(),112) NOT NULL,
    "IsIndirect" BIT CONSTRAINT "DF_AssignedCompositeRoles_IsIndirect" DEFAULT ((0)) NOT NULL,
    "RedundantAssignment" BIT CONSTRAINT "DF_AssignedCompositeRoles_IsAutoEligible" DEFAULT ((0)) NOT NULL,
    "WorkflowInstance_Id" BIGINT NULL,
    "WhenPerformed" SMALLDATETIME NULL,
    "Performer_Id" BIGINT NULL,
    "Requester_Id" BIGINT NULL,
    "WhenReviewed1" SMALLDATETIME NULL,
    "Reviewer1_Id" BIGINT NULL,
    "WhenReviewed2" SMALLDATETIME NULL,
    "Reviewer2_Id" BIGINT NULL,
    "WhenReviewed3" SMALLDATETIME NULL,
    "Reviewer3_Id" BIGINT NULL,
    "WhenRiskReviewed" SMALLDATETIME NULL,
    "RiskReviewer_Id" BIGINT NULL,
    "RequestComment" NVARCHAR(442) NULL,
    "ReconciliationComment" NVARCHAR(442) NULL,
    "ReviewComment1" NVARCHAR(442) NULL,
    "ReviewComment2" NVARCHAR(442) NULL,
    "ReviewComment3" NVARCHAR(442) NULL,
    "RiskReviewComment" NVARCHAR(442) NULL,
    CONSTRAINT "PK_AssignedCompositeRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
    CONSTRAINT "UK_AssignedCompositeRoles" UNIQUE ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_AssignedCompositeRoles_ParametersContext" FOREIGN KEY ("ParametersContext_Id") REFERENCES "UP_Contexts" ("Id"),
    CONSTRAINT "FK_AssignedCompositeRoles_Role" FOREIGN KEY ("Role_Id") REFERENCES "UP_CompositeRoles" ("Id"),
    CONSTRAINT "FK_AssignedCompositeRoles_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id")
);
GO

ALTER TABLE "UP_AssignedCompositeRoles" NOCHECK CONSTRAINT "FK_AssignedCompositeRoles_ParametersContext";
GO
ALTER TABLE "UP_AssignedCompositeRoles" NOCHECK CONSTRAINT "FK_AssignedCompositeRoles_WorkflowInstance";
GO
ALTER TABLE "UP_AssignedCompositeRoles" NOCHECK CONSTRAINT "FK_AssignedCompositeRoles_Role";
GO
CREATE STATISTICS "S_AssignedCompositeRoles_Type" ON "UP_AssignedCompositeRoles"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_AssignedCompositeRoles_RoleReview" ON "UP_AssignedCompositeRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","ReconciliationComment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25,27)
GO
CREATE INDEX "IX_AssignedCompositeRoles_RoleReconciliation" ON "UP_AssignedCompositeRoles" ("OwnerType","WhenCreated","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","ParametersContext_Id","Role_Id") WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "Role_Id" IS NOT NULL AND "WorkflowState" IN (1,3)
GO
CREATE INDEX "IX_AssignedCompositeRoles_DashboardCounter_ReviewRoles_V1" ON "UP_AssignedCompositeRoles" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "WorkflowState" IN (8,9,10,11,12,13,25))
GO
CREATE INDEX "IX_AssignedCompositeRoles_DashboardCounter_ReconciliateRoles_V1" ON "UP_AssignedCompositeRoles" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "WorkflowState"=1)
GO
CREATE NONCLUSTERED INDEX "IX_AssignedCompositeRoles_History" ON "UP_AssignedCompositeRoles" ("OwnerType", "Owner_Id", "Id", "ValidTo") INCLUDE ("ValidFrom", "StartDate", "EndDate");
GO

   GO
   CREATE TABLE "UP_AssignedResourceBinaries"
(
    "Id" BIGINT NOT NULL,
    "AssignedResourceType_Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL,
    "Property_Id" BIGINT NOT NULL,
    "ResourceFile_Id" BIGINT NOT NULL,
    "ResourceFileHash" INT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_AssignedResourceBinaries_IsDenied" DEFAULT ((0)) NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AssignedResourceBinaries_WorkflowState" DEFAULT ((0)) NOT NULL,
    "ProvisioningState" TINYINT CONSTRAINT "DF_AssignedResourceBinaries_ProvisioningState" DEFAULT ((0)) NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceBinaries_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceBinaries_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_AssignedResourceBinaries_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_AssignedResourceBinaries_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "WhenCreated" SMALLDATETIME CONSTRAINT "DF_AssignedResourceBinaries_WhenCreated" DEFAULT CONVERT(SMALLDATETIME,GETUTCDATE(),112) NOT NULL,
    "WhenPerformed" SMALLDATETIME NULL,
    "WhenTransmitted" SMALLDATETIME NULL,
    "Performer_Id" BIGINT NULL,
    "WorkflowInstance_Id" BIGINT NULL,
    "PolicyResourceFile_Id" BIGINT NULL,
    "IsPending" BIT CONSTRAINT "DF_AssignedResourceBinaries_IsPending" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "CK_AssignedResourceBinaries" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "ResourceFile_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
    CONSTRAINT "PK_AssignedResourceBinaries" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_AssignedResourceBinaries_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_AssignedResourceBinaries_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id")
);
GO
ALTER TABLE "UP_AssignedResourceBinaries" NOCHECK CONSTRAINT "FK_AssignedResourceBinaries_WorkflowInstance";
GO
ALTER TABLE "UP_AssignedResourceBinaries" NOCHECK CONSTRAINT "FK_AssignedResourceBinaries_Property";
GO
ALTER TABLE "UP_AssignedResourceBinaries" NOCHECK CONSTRAINT "FK_AssignedResourceBinaries_WorkflowInstance";
GO
CREATE STATISTICS "S_AssignedResourceBinaries_Type" ON "UP_AssignedResourceBinaries"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_AssignedResourceBinaries_PendingOrders" ON "UP_AssignedResourceBinaries" ("OwnerType", "StartDate") INCLUDE ("IsPending") WHERE "ProvisioningState"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_AssignedResourceBinaries_IsPending" ON "UP_AssignedResourceBinaries" ("OwnerType") WHERE "IsPending"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO

   GO
   CREATE TABLE "UP_AssignedResourceNavigations"
(
    "Id" BIGINT NOT NULL,
    "AssignedResourceType_Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL,
    "Property_Id" BIGINT NOT NULL,
    "Resource_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_AssignedResourceNavigations_IsDenied" DEFAULT ((0)) NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AssignedResourceNavigations_WorkflowState" DEFAULT ((0)) NOT NULL,
    "ProvisioningState" TINYINT CONSTRAINT "DF_AssignedResourceNavigations_ProvisioningState" DEFAULT ((0)) NOT NULL,
    "ConfidenceLevel" TINYINT CONSTRAINT "DF_AssignedResourceNavigations_ConfidenceLevel" DEFAULT ((0)) NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceNavigations_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceNavigations_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_AssignedResourceNavigations_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_AssignedResourceNavigations_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "WhenCreated" SMALLDATETIME CONSTRAINT "DF_AssignedResourceNavigations_WhenCreated" DEFAULT CONVERT(SMALLDATETIME,GETUTCDATE(),112) NOT NULL,
    "IsPending" BIT CONSTRAINT "DF_AssignedResourceNavigations_IsPending" DEFAULT ((0)) NOT NULL,
    "IsIndirect" BIT CONSTRAINT "DF_AssignedResourceNavigations_IsIndirect" DEFAULT ((0)) NOT NULL,
    "IsInferred" BIT CONSTRAINT "DF_AssignedResourceNavigations_IsInferred" DEFAULT ((0)) NOT NULL,
    "WhenPerformed" SMALLDATETIME NULL,
    "WhenTransmitted" SMALLDATETIME NULL,
    "Performer_Id" BIGINT NULL,
    "WorkflowInstance_Id" BIGINT NULL,
    "PolicyResource_Id" BIGINT NULL,
    CONSTRAINT "CK_AssignedResourceNavigations" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "Resource_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
    CONSTRAINT "PK_AssignedResourceNavigations" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_AssignedResourceNavigations_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_AssignedResourceNavigations_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id")
);
GO
ALTER TABLE "UP_AssignedResourceNavigations" NOCHECK CONSTRAINT "FK_AssignedResourceNavigations_WorkflowInstance";
GO
ALTER TABLE "UP_AssignedResourceNavigations" NOCHECK CONSTRAINT "FK_AssignedResourceNavigations_Property";
GO
ALTER TABLE "UP_AssignedResourceNavigations" NOCHECK CONSTRAINT "FK_AssignedResourceNavigations_WorkflowInstance";
GO
CREATE STATISTICS "S_AssignedResourceNavigations_Type" ON "UP_AssignedResourceNavigations"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE NONCLUSTERED INDEX "IX_AssignedResourceNavigations_History" ON "UP_AssignedResourceNavigations" ("OwnerType", "Owner_Id", "Id", "ValidTo") INCLUDE ("ValidFrom", "StartDate", "EndDate");
GO
CREATE INDEX "IX_AssignedResourceNavigations_PendingOrders" ON "UP_AssignedResourceNavigations" ("OwnerType", "StartDate") INCLUDE ("IsPending") WHERE "ProvisioningState"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_AssignedResourceNavigations_IsPending" ON "UP_AssignedResourceNavigations" ("OwnerType") WHERE "IsPending"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO

   GO
   CREATE TABLE "UP_AssignedResourceScalars"
(
    "Id" BIGINT NOT NULL,
    "AssignedResourceType_Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL,
    "Property_Id" BIGINT NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AssignedResourceScalars_WorkflowState" DEFAULT ((0)) NOT NULL,
    "ProvisioningState" TINYINT CONSTRAINT "DF_AssignedResourceScalars_ProvisioningState" DEFAULT ((0)) NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceScalars_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceScalars_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_AssignedResourceScalars_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_AssignedResourceScalars_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "WhenCreated" SMALLDATETIME CONSTRAINT "DF_AssignedResourceScalars_WhenCreated" DEFAULT CONVERT(SMALLDATETIME,GETUTCDATE(),112) NOT NULL,
    "WhenPerformed" SMALLDATETIME NULL,
    "WhenTransmitted" SMALLDATETIME NULL,
    "Performer_Id" BIGINT NULL,
    "WorkflowInstance_Id" BIGINT NULL,
    "Value" NVARCHAR(4000) NULL,
    "PolicyValue" NVARCHAR(4000) NULL,
    "IsPending" BIT CONSTRAINT "DF_AssignedResourceScalars_IsPending" DEFAULT ((0)) NOT NULL,
    CONSTRAINT "CK_AssignedResourceScalar" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
    CONSTRAINT "PK_AssignedResourceScalar" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_AssignedResourceScalars_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_AssignedResourceScalars_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id")
);
GO
ALTER TABLE "UP_AssignedResourceScalars" NOCHECK CONSTRAINT "FK_AssignedResourceScalars_WorkflowInstance";
GO
ALTER TABLE "UP_AssignedResourceScalars" NOCHECK CONSTRAINT "FK_AssignedResourceScalars_Property";
GO
ALTER TABLE "UP_AssignedResourceScalars" NOCHECK CONSTRAINT "FK_AssignedResourceScalars_WorkflowInstance";
GO
CREATE STATISTICS "S_AssignedResourceScalars_Type" ON "UP_AssignedResourceScalars"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_AssignedResourceScalars_PendingOrders" ON "UP_AssignedResourceScalars" ("OwnerType", "StartDate") INCLUDE ("IsPending") WHERE "ProvisioningState"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_AssignedResourceScalars_IsPending" ON "UP_AssignedResourceScalars" ("OwnerType") WHERE "IsPending"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO

   GO
   CREATE TABLE "UP_AssignedResourceTypes" (
    "Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NULL,
    "Resource_Id" BIGINT NULL,
    "ParametersContext_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_AssignedResourceTypes_IsDenied" DEFAULT ((0)) NOT NULL,
    "IsInferred" BIT CONSTRAINT "DF_AssignedResourceTypes_IsInferred" DEFAULT ((0)) NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AssignedResourceTypes_WorkflowState" DEFAULT ((0)) NOT NULL,
    "ProvisioningState" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ProvisioningState" DEFAULT ((0)) NOT NULL,
    "SourceMatchedConfidenceLevel" TINYINT CONSTRAINT "DF_AssignedResourceTypes_SourceMatchedConfidenceLevel" DEFAULT ((0)) NOT NULL,
    "ResourceTypeIdentificationConfidenceLevel" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ResourceTypeIdentificationConfidenceLevel" DEFAULT ((0)) NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceTypes_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_AssignedResourceTypes_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "NeedsPolicyApplication" BIT CONSTRAINT "DF_AssignedResourceTypes_NeedsPolicyApplication" DEFAULT ((0)) NOT NULL,
    "ConsolidatedWorkflowBlockedState" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedState" DEFAULT ((0)) NOT NULL,
    "ConsolidatedWorkflowBlockedCount" SMALLINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedWorkflowBlockedCount" DEFAULT ((0)) NOT NULL,
    "ConsolidatedWorkflowFoundState" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedWorkflowFoundState" DEFAULT ((0)) NOT NULL,
    "ConsolidatedWorkflowFoundCount" SMALLINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedWorkflowFoundCount" DEFAULT ((0)) NOT NULL,
    "ConsolidatedWorkflowReviewState" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedWorkflowReviewState" DEFAULT ((0)) NOT NULL,
    "ConsolidatedWorkflowReviewCount" SMALLINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedWorkflowReviewCount" DEFAULT ((0)) NOT NULL,
    "ConsolidatedProvisioningState" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeState" DEFAULT ((0)) NOT NULL,
    "ConsolidatedAssignedResourceTypeCountError" SMALLINT CONSTRAINT "DF_AssignedResourceTypes_ConsolidatedAssignedResourceTypeCountError" DEFAULT ((0)) NOT NULL,
    "ManualProvisioningState" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ManualProvisioningState" DEFAULT ((0)) NOT NULL,
    "HasPendingOrders" BIT CONSTRAINT "DF_AssignedResourceTypes_HasPendingOrders" DEFAULT ((0)) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_AssignedResourceTypes_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_AssignedResourceTypes_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "WhenCreated" SMALLDATETIME CONSTRAINT "DF_AssignedResourceTypes_WhenCreated" DEFAULT CONVERT(SMALLDATETIME,GETUTCDATE(),112) NOT NULL,
    "ProvisioningReviewFilter" TINYINT CONSTRAINT "DF_AssignedResourceTypes_ProvisioningReviewFilter" DEFAULT ((0)) NOT NULL,
    "RedundantAssignment" BIT CONSTRAINT "DF_AssignedResourceTypes_IsAutoEligible" DEFAULT ((0)) NOT NULL,
    "WorkflowInstance_Id" BIGINT NULL,
    "WhenPerformed" SMALLDATETIME NULL,
    "Performer_Id" BIGINT NULL,
    "Requester_Id" BIGINT NULL,
    "WhenReviewed1" SMALLDATETIME NULL,
    "Reviewer1_Id" BIGINT NULL,
    "WhenReviewed2" SMALLDATETIME NULL,
    "Reviewer2_Id" BIGINT NULL,
    "WhenReviewed3" SMALLDATETIME NULL,
    "Reviewer3_Id" BIGINT NULL,
    "RequestComment" NVARCHAR(442) NULL,
    "ReconciliationComment" NVARCHAR(442) NULL,
    "ReviewComment1" NVARCHAR(442) NULL,
    "ReviewComment2" NVARCHAR(442) NULL,
    "ReviewComment3" NVARCHAR(442) NULL,
    "WhenTransmitted" SMALLDATETIME NULL,
    "Arguments" NVARCHAR(4000) NULL,
    CONSTRAINT "PK_AssignedResourceTypes" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "CK_AssignedResourceTypes" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
    CONSTRAINT "FK_AssignedResourceTypes_ParametersContext" FOREIGN KEY ("ParametersContext_Id") REFERENCES "UP_Contexts" ("Id"),
    CONSTRAINT "FK_AssignedResourceTypes_ResourceType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
    CONSTRAINT "FK_AssignedResourceTypes_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id")
);
GO

ALTER TABLE "UP_AssignedResourceTypes" NOCHECK CONSTRAINT "FK_AssignedResourceTypes_ParametersContext";
GO
ALTER TABLE "UP_AssignedResourceTypes" NOCHECK CONSTRAINT "FK_AssignedResourceTypes_WorkflowInstance";
GO
ALTER TABLE "UP_AssignedResourceTypes" NOCHECK CONSTRAINT "FK_AssignedResourceTypes_ResourceType";
GO
CREATE INDEX "IX_AssignedResourceTypes_Resource" ON "UP_AssignedResourceTypes" ("Resource_Id") WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_AssignedResourceTypes_NeedsPolicyApplication" ON "UP_AssignedResourceTypes" ("NeedsPolicyApplication") INCLUDE ("ValidTo", "OwnerType", "Owner_Id", "Id") WHERE "NeedsPolicyApplication"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_AssignedResourceTypes_HasPendingOrders" ON "UP_AssignedResourceTypes" ("HasPendingOrders" ASC) INCLUDE ("ValidTo", "OwnerType", "Owner_Id", "Id","ResourceType_Id","Resource_Id","WorkflowInstance_Id","IsDenied","ProvisioningState") WHERE "HasPendingOrders"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
GO
CREATE INDEX "IX_AssignedResourceTypes_ProvisioningReview" ON "UP_AssignedResourceTypes" ("OwnerType","WorkflowInstance_Id" DESC,"Owner_Id" DESC,"Id" DESC)
INCLUDE ("ProvisioningReviewFilter","WorkflowState","IsDenied","ProvisioningState","StartDate","EndDate","ParametersContext_Id","Resource_Id","ConsolidatedWorkflowBlockedState","ConsolidatedProvisioningState","ResourceType_Id")
WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121) AND "ProvisioningReviewFilter">0
GO
CREATE INDEX "IX_AssignedResourceTypes_ResourceReconciliation" ON "UP_AssignedResourceTypes" ("OwnerType","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","ProvisioningState","ParametersContext_Id","ResourceType_Id","Resource_Id","ConsolidatedWorkflowFoundState","ConsolidatedWorkflowFoundCount","ConsolidatedProvisioningState") WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "ProvisioningReviewFilter"<>2 AND "ProvisioningReviewFilter"<>16 AND "ConsolidatedWorkflowFoundState" IN (1,2,3)
GO
CREATE INDEX "IX_AssignedResourceTypes_ResourceReconciliation_OrderByIsInferred" ON "UP_AssignedResourceTypes" ("OwnerType","IsInferred","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","ProvisioningState","ParametersContext_Id","ResourceType_Id","Resource_Id","ConsolidatedWorkflowFoundState","ConsolidatedWorkflowFoundCount","ConsolidatedProvisioningState") WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "ProvisioningReviewFilter"<>2 AND "ProvisioningReviewFilter"<>16 AND "ConsolidatedWorkflowFoundState" IN (1,2,3)
GO
CREATE INDEX "IX_AssignedResourceTypes_DashboardCounter_ReviewProvisioning_V1" ON "UP_AssignedResourceTypes" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "ProvisioningReviewFilter" IN (1,33,2,34,3,35,4,36,5,37,6,38,7,39,8,40,9,41,10,42,11,43,12,44,13,45,14,46,15,47))
GO
CREATE INDEX "IX_AssignedResourceTypes_DashboardCounter_PerformManualProvisioning_V1" ON "UP_AssignedResourceTypes" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "ManualProvisioningState"=1)
GO
CREATE INDEX "IX_AssignedResourceTypes_DashboardCounter_ReconciliateResources_V1" ON "UP_AssignedResourceTypes" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "Resource_Id" IS NOT NULL AND "ConsolidatedWorkflowFoundState" IN (1,3) AND "IsInferred"=0)
GO
CREATE STATISTICS "S_AssignedResourceTypes_Type" ON "UP_AssignedResourceTypes"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE NONCLUSTERED INDEX "IX_AssignedResourceTypes_History" ON "UP_AssignedResourceTypes" ("OwnerType", "Owner_Id", "Id", "ValidTo") INCLUDE ("ValidFrom", "StartDate", "EndDate");
GO

   GO
   CREATE TABLE "UP_AssignedSingleRoles" (
    "Id" BIGINT NOT NULL,
    "Role_Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NOT NULL,
    "ParametersContext_Id" BIGINT NOT NULL,
    "IsDenied" BIT CONSTRAINT "DF_AssignedSingleRoles_IsDenied" DEFAULT ((0)) NOT NULL,
    "IsInferred" BIT CONSTRAINT "DF_AssignedSingleRoles_IsInferred" DEFAULT ((0)) NOT NULL,
    "WorkflowState" TINYINT CONSTRAINT "DF_AssignedSingleRoles_WorkflowState" DEFAULT ((0)) NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_AssignedSingleRoles_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_AssignedSingleRoles_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_AssignedSingleRoles_ValidFrom" DEFAULT (GETUTCDATE()) NOT NULL ,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_AssignedSingleRoles_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    "WhenCreated" SMALLDATETIME CONSTRAINT "DF_AssignedSingleRoles_WhenCreated" DEFAULT CONVERT(SMALLDATETIME,GETUTCDATE(),112) NOT NULL,
    "IsIndirect" BIT CONSTRAINT "DF_AssignedSingleRoles_IsIndirect" DEFAULT ((0)) NOT NULL,
    "RedundantAssignment" BIT CONSTRAINT "DF_AssignedSingleRoles_IsAutoEligible" DEFAULT ((0)) NOT NULL,
    "WorkflowInstance_Id" BIGINT NULL,
    "WhenPerformed" SMALLDATETIME NULL,
    "Performer_Id" BIGINT NULL,
    "Requester_Id" BIGINT NULL,
    "WhenReviewed1" SMALLDATETIME NULL,
    "Reviewer1_Id" BIGINT NULL,
    "WhenReviewed2" SMALLDATETIME NULL,
    "Reviewer2_Id" BIGINT NULL,
    "WhenReviewed3" SMALLDATETIME NULL,
    "Reviewer3_Id" BIGINT NULL,
    "WhenRiskReviewed" SMALLDATETIME NULL,
    "RiskReviewer_Id" BIGINT NULL,
    "RequestComment" NVARCHAR(442) NULL,
    "ReconciliationComment" NVARCHAR(442) NULL,
    "ReviewComment1" NVARCHAR(442) NULL,
    "ReviewComment2" NVARCHAR(442) NULL,
    "ReviewComment3" NVARCHAR(442) NULL,
    "RiskReviewComment" NVARCHAR(442) NULL,
    CONSTRAINT "PK_AssignedSingleRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
    CONSTRAINT "UK_AssignedSingleRoles" UNIQUE ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_AssignedSingleRoles_ParametersContext" FOREIGN KEY ("ParametersContext_Id") REFERENCES "UP_Contexts" ("Id"),
    CONSTRAINT "FK_AssignedSingleRoles_Role" FOREIGN KEY ("Role_Id") REFERENCES "UP_SingleRoles" ("Id"),
    CONSTRAINT "FK_AssignedSingleRoles_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id")
);
GO

ALTER TABLE "UP_AssignedSingleRoles" NOCHECK CONSTRAINT "FK_AssignedSingleRoles_ParametersContext";
GO
ALTER TABLE "UP_AssignedSingleRoles" NOCHECK CONSTRAINT "FK_AssignedSingleRoles_WorkflowInstance";
GO
ALTER TABLE "UP_AssignedSingleRoles" NOCHECK CONSTRAINT "FK_AssignedSingleRoles_Role";
GO
CREATE STATISTICS "S_AssignedSingleRoles_Type" ON "UP_AssignedSingleRoles"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;
GO
CREATE INDEX "IX_AssignedSingleRoles_RoleReview" ON "UP_AssignedSingleRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","ReconciliationComment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25)
GO
CREATE INDEX "IX_AssignedSingleRoles_RoleReconciliation" ON "UP_AssignedSingleRoles" ("OwnerType","WhenCreated","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","ParametersContext_Id","Role_Id") WHERE ValidTo=CONVERT(datetime2(2),'9999-12-31 23:59:59.99') AND "Role_Id" IS NOT NULL AND "WorkflowState" IN (1,3)
GO
CREATE INDEX "IX_AssignedSingleRoles_DashboardCounter_ReviewRoles_V1" ON "UP_AssignedSingleRoles" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "WorkflowState" IN (8,9,10,11,12,13,25,27))
GO
CREATE INDEX "IX_AssignedSingleRoles_DashboardCounter_ReconciliateRoles_V1" ON "UP_AssignedSingleRoles" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "WorkflowState"=1)
GO
CREATE NONCLUSTERED INDEX "IX_AssignedSingleRoles_History" ON "UP_AssignedSingleRoles" ("OwnerType", "Owner_Id", "Id", "ValidTo") INCLUDE ("ValidFrom", "StartDate", "EndDate");
GO

   GO
   CREATE TABLE "UP_IdentifiedRisks" (
    "Id" BIGINT NOT NULL,
    "OwnerType" BIGINT NOT NULL,
    "Owner_Id" BIGINT NOT NULL,
    "Risk_Id" BIGINT NOT NULL,
    "StartDate" SMALLDATETIME CONSTRAINT "DF_IdentifiedRisks_StartDate" DEFAULT CONVERT(SMALLDATETIME,'19000101',112) NOT NULL,
    "EndDate" SMALLDATETIME CONSTRAINT "DF_IdentifiedRisks_EndDate" DEFAULT CONVERT(SMALLDATETIME,'20790606',112) NOT NULL,
    "WorkflowInstance_Id" BIGINT NULL,
    "AssignedSingleRole1_Id" BIGINT NULL,
    "AssignedSingleRole2_Id" BIGINT NULL,
    "AssignedCompositeRole1_Id" BIGINT NULL,
    "AssignedCompositeRole2_Id" BIGINT NULL,
    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_IdentifiedRisks_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_IdentifiedRisks_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,
    CONSTRAINT "CK_IdentifiedRisks" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC),
    CONSTRAINT "PK_IdentifiedRisks" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC),
    CONSTRAINT "FK_IdentifiedRisks_Risk" FOREIGN KEY ("Risk_Id") REFERENCES "UP_Risks" ("Id"),
    CONSTRAINT "FK_IdentifiedRisks_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id"),
);
GO
ALTER TABLE "UP_IdentifiedRisks" NOCHECK CONSTRAINT "FK_IdentifiedRisks_WorkflowInstance";
GO
CREATE STATISTICS "S_IdentifiedRisks_Type" ON "UP_IdentifiedRisks"("OwnerType") WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH FULLSCAN;

   GO
   CREATE TABLE "UP_RoleMappingRules" (
    "Id" BIGINT NOT NULL,
    "RoleMapping_Id" BIGINT NOT NULL,
    "Order" INT NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,

    CONSTRAINT "PK_RoleMappingRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_RoleMappingRules_RoleMapping" FOREIGN KEY ("RoleMapping_Id") REFERENCES "UP_RoleMappings" ("Id")
);

   GO
   CREATE TABLE "UU_AssociationInstances"
(
    "Id" BIGINT NOT NULL,
    "Instance1_Id" BIGINT NOT NULL,
    "Instance2_Id" BIGINT NOT NULL,
    "Association_Id" BIGINT NOT NULL,
    "Direction" TINYINT CONSTRAINT "DF_AssociationInstances_Direction" DEFAULT ((0)) NOT NULL,
    "Universe_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_AssociationInstances" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_AssociationInstances_Association" FOREIGN KEY("Association_Id") REFERENCES "UM_EntityAssociations" ("Id"),
    CONSTRAINT "FK_AssociationInstances_Instance1" FOREIGN KEY("Instance1_Id") REFERENCES "UU_EntityInstances" ("Id"),
    CONSTRAINT "FK_AssociationInstances_Instance2" FOREIGN KEY("Instance2_Id") REFERENCES "UU_EntityInstances" ("Id"),
    CONSTRAINT "FK_AssociationInstances_Universe" FOREIGN KEY("Universe_Id") REFERENCES "UU_Universes" ("Id"),
);

   GO
   CREATE TABLE "UJ_Tasks"
(
    "Id" BIGINT NOT NULL,
    "Identifier" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    "DisplayName_L1" NVARCHAR(442) NOT NULL,
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
    "State" INT CONSTRAINT "DF_Job_State" DEFAULT ((0)) NOT NULL,
    "TaskType" INT CONSTRAINT "DF_Job_TaskType" DEFAULT ((0)) NOT NULL,
    "HttpCommand" SMALLINT CONSTRAINT "DF_Job_HttpCommand" DEFAULT ((0)) NOT NULL,
    "Agent_Id" BIGINT NULL,
    "OpenIdClient_Id" BIGINT NULL,
    "SessionOff" BIT NULL,
    "IgnoreCookieFile" BIT NULL,
    "BatchSize" int NULL,
    "Mode" INT NULL,
    "Connector_Id" BIGINT NULL,
    "Check" BIT NULL,
    "SplitSize" INT NULL,
    "InputPath" NVARCHAR(4000) NULL,
    "OutputPath" NVARCHAR(4000) NULL,
    "SynchronizationJobIdentifier" NVARCHAR(442) NULL,
    "ProvisioningJobIdentifier" NVARCHAR(442) NULL,
    "Dirty" BIT NULL,
    "BlockProvisioning" BIT NULL,
    "DoNotDeleteChanges" BIT NULL,
    "IgnoreHistorization" BIT NULL,
    "AllEntityType" BIT NULL,
    "BatchSelectSize" INT NULL,
    "BatchUpdateSize" INT NULL,
    "BatchInsertSize" INT NULL,
    "ConnectionIdentifier" NVARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InformationSystemIdentifier" NVARCHAR(442) NULL,
    "GeneratedFile" NVARCHAR(442) NULL,
    "GeneratedCodePath" NVARCHAR(442) NULL,
    "GeneratedCodeNamespace" NVARCHAR(442) NULL,
    "AssignedResourceTypeSQL" NVARCHAR(4000) NULL,
    "AssignedResourceScalarSQL" NVARCHAR(4000) NULL,
    "AssignedResourceNavigationSQL" NVARCHAR(4000) NULL,
    "ApiUrl" NVARCHAR(442) NULL,
    "ContinueOnError" Bit CONSTRAINT "DF_Task_ContinueOnError" DEFAULT ((0)) NOT NULL,
    "LogLevel" INT CONSTRAINT "DF_Task_LogLevel" DEFAULT ((6)) NOT NULL,
    "Level" INT CONSTRAINT "DF_Task_Level" DEFAULT ((-1)) NOT NULL,
    CONSTRAINT "PK_Tasks" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_Tasks_Agent" FOREIGN KEY ("Agent_Id") REFERENCES "UC_Agents" ("Id"),
    CONSTRAINT "FK_Tasks_OpenIdClient" FOREIGN KEY ("OpenIdClient_Id") REFERENCES "UA_OpenIdClients" ("Id"),
    CONSTRAINT "FK_Tasks_Connector" FOREIGN KEY ("Connector_Id") REFERENCES "UC_Connectors" ("Id"),
    CONSTRAINT "U_Tasks_Identifier" UNIQUE ("Identifier"),
);

   GO
   CREATE TABLE "UP_RoleMappingRuleItems"
(
	"Id" BIGINT NOT NULL,
    "RoleMappingRule_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "Operator" TINYINT CONSTRAINT "DF_RoleMappingRuleItems_Operator" DEFAULT ((0)) NOT NULL,
    "Value" NVARCHAR(4000) NULL,
    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,

    CONSTRAINT "PK_RoleMappingRuleItems" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_RoleMappingRuleItems_RoleMappingRule" FOREIGN KEY ("RoleMappingRule_Id") REFERENCES "UP_RoleMappingRules" ("Id"),
    CONSTRAINT "FK_RoleMappingRuleItems_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
);

   GO
   CREATE TABLE "UW_ActivityInstances" (
    "Id" BIGINT NOT NULL,
    "WorkflowInstance_Id" BIGINT NOT NULL,
    "Activity_Id" BIGINT NOT NULL,
    "ActivityState_Id" BIGINT NOT NULL,
    "CreationDate" DATETIME NOT NULL,
    "TriggerMode" INT NOT NULL,
    "Performer_Id" BIGINT NULL,
    "AssignedTo_Id" BIGINT NULL,
    "OpenIdClient_Id" BIGINT NULL,
    "ExpectedDate" SMALLDATETIME NULL,
    "Subject" NVARCHAR(442) NULL,
    "Body" NVARCHAR(4000) NULL,
    "PrivateBody" NVARCHAR(4000) NULL,
    "CC" NVARCHAR(4000) NULL,
    "ChangeSetSummary" NVARCHAR(442) NULL, 
    CONSTRAINT "PK_ActivityInstances" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ActivityInstances_WorkflowInstance" FOREIGN KEY ("WorkflowInstance_Id") REFERENCES "UW_WorkflowInstances" ("Id"),
    CONSTRAINT "FK_ActivityInstances_Activity" FOREIGN KEY ("Activity_Id") REFERENCES "UW_Activities" ("Id"),
    CONSTRAINT "FK_ActivityInstances_ActivityState" FOREIGN KEY ("ActivityState_Id") REFERENCES "UW_ActivityTemplateStates" ("Id"),
    CONSTRAINT "FK_ActivityInstances_OpenIdClient" FOREIGN KEY ("OpenIdClient_Id") REFERENCES "UA_OpenIdClients" ("Id"),
);
GO

CREATE NONCLUSTERED INDEX "IX_ActivityInstances_WorkflowInstance" ON "UW_ActivityInstances" ("WorkflowInstance_Id");
GO

/* FK loop */
ALTER TABLE "UW_WorkflowInstances" ADD CONSTRAINT "FK_WorkflowInstances_CurrentActivityInstance" FOREIGN KEY ("CurrentActivityInstance_Id") REFERENCES "UW_ActivityInstances" ("Id");
GO
ALTER TABLE "UW_WorkflowInstances" NOCHECK CONSTRAINT "FK_WorkflowInstances_CurrentActivityInstance";

   GO
   CREATE TABLE "UJ_JobSteps"
(
    "Id" BIGINT NOT NULL,
    "Task_Id" BIGINT NOT NULL,
    "Job_Id" BIGINT NOT NULL,
    "LaunchOrder" INT NOT NULL,
    "Level" INT CONSTRAINT "DF_JobSteps_Level" DEFAULT ((-1)) NOT NULL,
    CONSTRAINT "PK_JobSteps" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_JobSteps_Task" FOREIGN KEY ("Task_Id") REFERENCES "UJ_Tasks" ("Id"),
    CONSTRAINT "FK_JobSteps_Job" FOREIGN KEY ("Job_Id") REFERENCES "UJ_Jobs" ("Id"),
);

   GO
   CREATE TABLE "UJ_TaskDependOnTasks"
(
	"Id" BIGINT NOT NULL,
    "ChildTask_Id" BIGINT NOT NULL,
    "ParentTask_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_TaskDependOnTasks" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_TaskDependOnTasks_Child_Task" FOREIGN KEY ("ChildTask_Id") REFERENCES "UJ_Tasks" ("Id"),
    CONSTRAINT "FK_TaskDependOnTasks_Parent_Task" FOREIGN KEY ("ParentTask_Id") REFERENCES "UJ_Tasks" ("Id"),
)

   GO
   CREATE TABLE UJ_TaskDimensions
(
    "Id" BIGINT NOT NULL,
    "Task_Id" BIGINT NOT NULL,
    "Dimension_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_TaskDimensions" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_TaskDimensions_Job" FOREIGN KEY ("Task_Id") REFERENCES "UJ_Tasks" ("Id"),
    CONSTRAINT "FK_TaskDimensions_Dimension" FOREIGN KEY ("Dimension_Id") REFERENCES "UM_Dimensions" ("Id"),
);

   GO
   CREATE TABLE "UJ_TaskEntityTypes"
(
    "Id" BIGINT NOT NULL,
    "Task_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_TaskEntityTypes" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_TaskEntityTypes_Job" FOREIGN KEY ("Task_Id") REFERENCES "UJ_Tasks" ("Id"),
    CONSTRAINT "FK_TaskEntityTypes_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
);

   GO
   CREATE TABLE "UJ_TaskInstances"
(
    "Id" BIGINT NOT NULL,
    "Task_Id" BIGINT NOT NULL,
    "JobInstance_Id" BIGINT NULL,
    "StartDate" DATETIME NOT NULL,
    "EndDate" DATETIME NULL,
    "LastProgressUpdate" DATETIME NOT NULL,
    "State" SMALLINT CONSTRAINT "DF_TaskInstance_State" DEFAULT ((0)) NOT NULL,
    "IsChild" BIT CONSTRAINT "DF_TaskInstance_IsChild" DEFAULT ((0)) NOT NULL,
    "IsValidation" BIT CONSTRAINT "DF_TaskInstance_IsValidation" DEFAULT ((0)) NOT NULL,
    "Agent_Id" BIGINT NULL,
    "C0" INT NULL,
    "C1" INT NULL,
    "C2" INT NULL,
    "C3" INT NULL,
    "C4" INT NULL,
    "C5" INT NULL,
    "C6" INT NULL,
    "C7" INT NULL,
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
    "WrappedProgress" VARCHAR(8000) NULL,
    CONSTRAINT "PK_TaskInstances_JobTaskInstances" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_TaskInstances_Jobs" FOREIGN KEY ("Task_Id") REFERENCES "UJ_Tasks" ("Id"),
    CONSTRAINT "FK_TaskInstances_JobInstances" FOREIGN KEY ("JobInstance_Id") REFERENCES "UJ_JobInstances" ("Id"),
    CONSTRAINT "FK_TaskInstances_Agent" FOREIGN KEY ("Agent_Id") REFERENCES "UC_Agents" ("Id"),
);
GO
CREATE INDEX "IX_TaskInstances_JobInstance" ON "UJ_TaskInstances" ("JobInstance_Id","Id");
GO


   GO
   CREATE TABLE "UJ_TaskResourceTypes"
(
    "Id" BIGINT NOT NULL,
    "Task_Id" BIGINT NOT NULL,
    "ResourceType_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_TaskResourceTypes" PRIMARY KEY ("Id" ASC),
    CONSTRAINT "FK_TaskResourceTypes_Job" FOREIGN KEY ("Task_Id") REFERENCES "UJ_Tasks" ("Id"),
    CONSTRAINT "FK_TaskResourceTypes_EntityType" FOREIGN KEY ("ResourceType_Id") REFERENCES "UP_ResourceTypes" ("Id"),
);

   GO
   CREATE TABLE "UW_ActivityInstanceCCs" (
    "ActivityInstance_Id" BIGINT NOT NULL,
    "Resource_Id" BIGINT NOT NULL,
    CONSTRAINT "PK_ActivityInstanceCCs" PRIMARY KEY CLUSTERED ("ActivityInstance_Id" ASC, "Resource_Id" ASC),
    CONSTRAINT "FK_ActivityInstanceCCs_ActivityInstance" FOREIGN KEY ("ActivityInstance_Id") REFERENCES "UW_ActivityInstances" ("Id"),
);

   GO
   CREATE TABLE "UW_ActivityInstancesActors" (
    "ActivityInstance_Id" BIGINT NOT NULL,
    "Actor_Id" BIGINT NOT NULL,
    CONSTRAINT "FK_ActivityInstancesPerformers_ActivityInstance" FOREIGN KEY ("ActivityInstance_Id") REFERENCES "UW_ActivityInstances" ("Id"),
);
GO

CREATE NONCLUSTERED INDEX "IX_ActivityInstancesActors_ActivityInstance"
    ON "UW_ActivityInstancesActors"("ActivityInstance_Id" ASC, "Actor_Id" ASC);

GO
CREATE CLUSTERED INDEX "IX_ActivityInstancesPerformers_Performer"
    ON "UW_ActivityInstancesActors"("Actor_Id" ASC, "ActivityInstance_Id" ASC);

   GO
   CREATE TABLE "UW_Changes" (
    "ActivityInstance_Id" BIGINT NOT NULL,
    "Object_Id" BIGINT NOT NULL,
    "Property_Id" BIGINT NOT NULL,
    "Operation" INT NOT NULL,
    "Linked_Id" BIGINT NOT NULL,
    "Value" NVARCHAR(4000) NULL,
    CONSTRAINT "PK_Changes" PRIMARY KEY CLUSTERED ("ActivityInstance_Id" ASC, "Object_Id" ASC, "Property_Id" ASC, "Operation" ASC, "Linked_Id" ASC),
    CONSTRAINT "FK_Changes_ActivityInstance" FOREIGN KEY ("ActivityInstance_Id") REFERENCES "UW_ActivityInstances" ("Id"),
    CONSTRAINT "FK_Changes_Property" FOREIGN KEY ("Property_Id") REFERENCES "UM_EntityProperties" ("Id"),
);

   GO
   CREATE TABLE "UC_SynchronizationHistory"
(
    "Connector_Id" BIGINT NOT NULL,
    "TaskInstance_Id" BIGINT NOT NULL,
    "HistorizationDate" DATETIME2(2) NOT NULL,
    "ExecutionDate" DATETIME2(2) NOT NULL,
    "State" TINYINT NOT NULL,
    CONSTRAINT "UK_SynchronizationHistory" UNIQUE CLUSTERED ("TaskInstance_Id"),
    CONSTRAINT "PK_SynchronizationHistory" PRIMARY KEY NONCLUSTERED ("Connector_Id" ASC, "HistorizationDate" ASC),
    CONSTRAINT "FK_SynchronizationHistory_Connector" FOREIGN KEY ("Connector_Id") REFERENCES "UC_Connectors" ("Id"),
    CONSTRAINT "FK_SynchronizationHistory_TaskInstance" FOREIGN KEY ("TaskInstance_Id") REFERENCES "UJ_TaskInstances" ("Id")
);

   GO
   CREATE TABLE "UP_AssignedResourceErrors"
(
    "Id" BIGINT NOT NULL,
    "JobInstance_Id" BIGINT NOT NULL,
    "ErrorCode" INT CONSTRAINT "DF_AssignedResourceErrors_ErrorCode" DEFAULT ((0)) NOT NULL,
    "AssignedResourceType_Id" BIGINT NULL,
    "Message" NVARCHAR(4000) NULL,
    CONSTRAINT "PK_AssignedResourceErrors" PRIMARY KEY ("Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON),
    CONSTRAINT "FK_AssignedResourceErrors_JobInstance" FOREIGN KEY ("JobInstance_Id") REFERENCES "UJ_TaskInstances" ("Id"),
);
GO
ALTER TABLE "UP_AssignedResourceErrors" NOCHECK CONSTRAINT "FK_AssignedResourceErrors_JobInstance";
GO
CREATE INDEX "IX_TAssignedResourceErrors_JobInstance" ON "UP_AssignedResourceErrors" ("JobInstance_Id","Id");
GO

   GO
   IF CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'SQL Azure%'
    OR CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'Enterprise%'
    OR CAST(SERVERPROPERTY('Edition') AS varchar(30)) LIKE 'Developer%'
    OR CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 4) AS int) > 13 --SQL 2017 and later
    OR (CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 4) AS int) = 13 --SQL 2016
    AND CAST(PARSENAME(CAST(SERVERPROPERTY('ProductVersion') AS varchar(30)), 2) AS int) >= 4001) --SP1 or greater
BEGIN
IF NOT EXISTS(select 1 from sys.partition_schemes WHERE name='HistoryScheme')
BEGIN
EXEC sp_executesql N'CREATE PARTITION FUNCTION "HistoryFunction"(DateTime2(2)) AS RANGE RIGHT FOR VALUES (CONVERT(DATETIME2(2),''9999-12-31 23:59:59.999'',121));
CREATE PARTITION SCHEME "HistoryScheme" AS PARTITION "HistoryFunction" TO ("PRIMARY", "PRIMARY");';
END;
--- Start UR_Resources ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_Resources'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='HistoryScheme'
where p.object_id =OBJECT_ID('ur_resources'))
BEGIN
DROP INDEX "IX_Resources" ON "UR_Resources";
CREATE UNIQUE CLUSTERED INDEX "IX_Resources" ON "UR_Resources"("ValidTo" ASC, "Type" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='pk_resources'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('ur_resources'))
BEGIN
ALTER TABLE "UR_Resources" DROP CONSTRAINT "PK_Resources";
ALTER TABLE "UR_Resources" ADD CONSTRAINT "PK_Resources" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- Start UR_ResourceLinks ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceLinks_1'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceLinks'))
BEGIN
DROP INDEX "IX_ResourceLinks_1" ON "UR_ResourceLinks";
CREATE UNIQUE CLUSTERED INDEX "IX_ResourceLinks_1" ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R1_Id" ASC, "R2_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceLinks_2'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceLinks'))
BEGIN
DROP INDEX "IX_ResourceLinks_2" ON "UR_ResourceLinks";
CREATE UNIQUE NONCLUSTERED INDEX "IX_ResourceLinks_2" ON "UR_ResourceLinks"("ValidTo" ASC, "Type" ASC, "R2_Id" ASC, "R1_Id" ASC, "ValidFrom" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;

--- Start UR_ResourceFiles ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceFiles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceFiles'))
BEGIN
DROP INDEX "IX_ResourceFiles" ON "UR_ResourceFiles";
CREATE CLUSTERED INDEX "IX_ResourceFiles"
    ON "UR_ResourceFiles"("ValidTo" ASC, "Property_Id" ASC, "Resource_Id" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_ResourceFiles2'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceFiles'))
BEGIN
DROP INDEX "IX_ResourceFiles2" ON "UR_ResourceFiles";
CREATE INDEX "IX_ResourceFiles2"
    ON "UR_ResourceFiles"("Property_Id" ASC,"Resource_Id" ASC, "ValidFrom" DESC)
	INCLUDE (Id, "ValidTo","MimeType","FileName") ON "HistoryScheme"("ValidTo");
END;




IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_ResourceFiles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UR_ResourceFiles'))
BEGIN
ALTER TABLE "UR_ResourceFiles" DROP CONSTRAINT "PK_ResourceFiles";
ALTER TABLE "UR_ResourceFiles" ADD CONSTRAINT "PK_ResourceFiles" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedCompositeRoles---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedCompositeRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedCompositeRoles'))
BEGIN
ALTER TABLE "UP_AssignedCompositeRoles" DROP CONSTRAINT "PK_AssignedCompositeRoles";
ALTER TABLE "UP_AssignedCompositeRoles" ADD CONSTRAINT "PK_AssignedCompositeRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='UK_AssignedCompositeRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedCompositeRoles'))
BEGIN
ALTER TABLE "UP_AssignedCompositeRoles" DROP CONSTRAINT "UK_AssignedCompositeRoles";
ALTER TABLE "UP_AssignedCompositeRoles" ADD CONSTRAINT "UK_AssignedCompositeRoles" UNIQUE ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedSingleRoles---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedSingleRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedSingleRoles'))
BEGIN
ALTER TABLE "UP_AssignedSingleRoles" DROP CONSTRAINT "PK_AssignedSingleRoles";
ALTER TABLE "UP_AssignedSingleRoles" ADD CONSTRAINT "PK_AssignedSingleRoles" PRIMARY KEY CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Role_Id" ASC, "ParametersContext_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='UK_AssignedSingleRoles'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedSingleRoles'))
BEGIN
ALTER TABLE "UP_AssignedSingleRoles" DROP CONSTRAINT "UK_AssignedSingleRoles";
ALTER TABLE "UP_AssignedSingleRoles" ADD CONSTRAINT "UK_AssignedSingleRoles" UNIQUE ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceTypes ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceTypes'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceTypes'))
BEGIN
ALTER TABLE "UP_AssignedResourceTypes" DROP CONSTRAINT "PK_AssignedResourceTypes";
ALTER TABLE "UP_AssignedResourceTypes" ADD CONSTRAINT "PK_AssignedResourceTypes" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceTypes'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceTypes'))
BEGIN
ALTER TABLE "UP_AssignedResourceTypes" DROP CONSTRAINT "CK_AssignedResourceTypes";
ALTER TABLE "UP_AssignedResourceTypes" ADD CONSTRAINT "CK_AssignedResourceTypes" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='IX_AssignedResourceTypes_Resource'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceTypes'))
BEGIN
DROP INDEX "IX_AssignedResourceTypes_Resource" ON "UP_AssignedResourceTypes";
CREATE INDEX "IX_AssignedResourceTypes_Resource" ON "UP_AssignedResourceTypes" ("Resource_Id") WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceScalars ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceScalar'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceScalars'))
BEGIN
ALTER TABLE "UP_AssignedResourceScalars" DROP CONSTRAINT "CK_AssignedResourceScalar" ;
ALTER TABLE "UP_AssignedResourceScalars" ADD CONSTRAINT "CK_AssignedResourceScalar" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceScalar'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceScalars'))
BEGIN
ALTER TABLE "UP_AssignedResourceScalars" DROP CONSTRAINT "PK_AssignedResourceScalar";
ALTER TABLE "UP_AssignedResourceScalars" ADD CONSTRAINT "PK_AssignedResourceScalar" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceNavigations ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceNavigations'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceNavigations'))
BEGIN
ALTER TABLE "UP_AssignedResourceNavigations" DROP CONSTRAINT "CK_AssignedResourceNavigations";
ALTER TABLE "UP_AssignedResourceNavigations" ADD CONSTRAINT "CK_AssignedResourceNavigations" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "Resource_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)  ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceNavigations'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceNavigations'))
BEGIN
ALTER TABLE "UP_AssignedResourceNavigations" DROP CONSTRAINT "PK_AssignedResourceNavigations";
ALTER TABLE "UP_AssignedResourceNavigations" ADD CONSTRAINT "PK_AssignedResourceNavigations" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC)  ON "HistoryScheme"("ValidTo");
END;

--- UP AssignedResourceBinaries ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_AssignedResourceBinaries'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceBinaries'))
BEGIN
ALTER TABLE "UP_AssignedResourceBinaries" DROP CONSTRAINT "CK_AssignedResourceBinaries";
ALTER TABLE "UP_AssignedResourceBinaries" ADD CONSTRAINT "CK_AssignedResourceBinaries" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "AssignedResourceType_Id" ASC, "Property_Id" ASC, "ResourceFile_Id" ASC, "StartDate" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON)  ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_AssignedResourceBinaries'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_AssignedResourceBinaries'))
BEGIN
ALTER TABLE "UP_AssignedResourceBinaries" DROP CONSTRAINT "PK_AssignedResourceBinaries";
ALTER TABLE "UP_AssignedResourceBinaries" ADD CONSTRAINT "PK_AssignedResourceBinaries" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP IdentifiedRisks ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_IdentifiedRisks'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_IdentifiedRisks'))
BEGIN
ALTER TABLE "UP_IdentifiedRisks" DROP CONSTRAINT "CK_IdentifiedRisks";
ALTER TABLE "UP_IdentifiedRisks" ADD CONSTRAINT "CK_IdentifiedRisks" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_IdentifiedRisks'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_IdentifiedRisks'))
BEGIN
ALTER TABLE "UP_IdentifiedRisks" DROP CONSTRAINT "PK_IdentifiedRisks";
ALTER TABLE "UP_IdentifiedRisks" ADD CONSTRAINT "PK_IdentifiedRisks" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC,"Id" ASC) ON "HistoryScheme"("ValidTo");
END;

--- UP ResourceRiskScores ---

IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='CK_ResourceRiskScores'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_ResourceRiskScores'))
BEGIN
ALTER TABLE "UP_ResourceRiskScores" DROP CONSTRAINT "CK_ResourceRiskScores";
ALTER TABLE "UP_ResourceRiskScores" ADD CONSTRAINT "CK_ResourceRiskScores" UNIQUE CLUSTERED ("ValidTo" ASC, "OwnerType" ASC, "Owner_Id" ASC, "Id" ASC) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON "HistoryScheme"("ValidTo");
END;



IF NOT EXISTS(select 1 from sys.partitions p
		join sys.indexes i on p.object_id = i.object_id and p.index_id = i.index_id and  i.name='PK_ResourceRiskScores'
		join sys.partition_schemes ps on i.data_space_id = ps.data_space_id and ps.name='historyscheme'
where p.object_id =OBJECT_ID('UP_ResourceRiskScores'))
BEGIN
ALTER TABLE "UP_ResourceRiskScores" DROP CONSTRAINT "PK_ResourceRiskScores";
ALTER TABLE "UP_ResourceRiskScores" ADD CONSTRAINT "PK_ResourceRiskScores" PRIMARY KEY NONCLUSTERED ("ValidTo" ASC, "Id" ASC) ON "HistoryScheme"("ValidTo");
END;

END;
/*
-----------------------------------------------------------------------------
****       THIS SCRIPT IS AUTO GENERATED, DO NOT MODIFY MANUALLY.        ****
-----------------------------------------------------------------------------
*/

CREATE TABLE #tmp_ua_accesscontrolpermissions(Id BIGINT NOT NULL PRIMARY KEY, Identifier NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS  NOT NULL, tablename NVARCHAR(443) NULL);INSERT INTO "#tmp_ua_accesscontrolpermissions"("Id","Identifier") VALUES
 (4611686018427387903, '/')
,(4611686018427388133, '/AccessCertification')
,(4611686018427414503, '/AccessCertification/AccessCertificationCampaign')
,(4611686018427414505, '/AccessCertification/AccessCertificationCampaign/Create')
,(4611686018427414507, '/AccessCertification/AccessCertificationCampaign/Delete')
,(4611686018427388228, '/AccessCertification/AccessCertificationCampaign/Process')
,(4611686018427414504, '/AccessCertification/AccessCertificationCampaign/Query')
,(4611686018427414506, '/AccessCertification/AccessCertificationCampaign/Update')
,(4611686018427415703, '/AccessCertification/AccessCertificationCampaignPolicy')
,(4611686018427415704, '/AccessCertification/AccessCertificationCampaignPolicy/Query')
,(4611686018427388053, '/AccessControl')
,(4611686018427421303, '/AccessControl/AccessControlEntry')
,(4611686018427421305, '/AccessControl/AccessControlEntry/Create')
,(4611686018427421307, '/AccessControl/AccessControlEntry/Delete')
,(4611686018427421304, '/AccessControl/AccessControlEntry/Query')
,(4611686018427421306, '/AccessControl/AccessControlEntry/Update')
,(4611686018427421403, '/AccessControl/AccessControlFilter')
,(4611686018427421405, '/AccessControl/AccessControlFilter/Create')
,(4611686018427421407, '/AccessControl/AccessControlFilter/Delete')
,(4611686018427421404, '/AccessControl/AccessControlFilter/Query')
,(4611686018427421406, '/AccessControl/AccessControlFilter/Update')
,(4611686018427421503, '/AccessControl/AccessControlPermission')
,(4611686018427421504, '/AccessControl/AccessControlPermission/Query')
,(4611686018427421603, '/AccessControl/AccessControlRule')
,(4611686018427421605, '/AccessControl/AccessControlRule/Create')
,(4611686018427421607, '/AccessControl/AccessControlRule/Delete')
,(4611686018427421604, '/AccessControl/AccessControlRule/Query')
,(4611686018427421606, '/AccessControl/AccessControlRule/Update')
,(4611686018427404103, '/AccessControl/AssignedProfile')
,(4611686018427404105, '/AccessControl/AssignedProfile/Create')
,(4611686018427404107, '/AccessControl/AssignedProfile/Delete')
,(4611686018427404104, '/AccessControl/AssignedProfile/Query')
,(4611686018427404106, '/AccessControl/AssignedProfile/Update')
,(4611686018427414303, '/AccessControl/OpenIdClient')
,(4611686018427414305, '/AccessControl/OpenIdClient/Create')
,(4611686018427414307, '/AccessControl/OpenIdClient/Delete')
,(4611686018427414304, '/AccessControl/OpenIdClient/Query')
,(4611686018427414306, '/AccessControl/OpenIdClient/Update')
,(4611686018427404003, '/AccessControl/Profile')
,(4611686018427404005, '/AccessControl/Profile/Create')
,(4611686018427404007, '/AccessControl/Profile/Delete')
,(4611686018427404004, '/AccessControl/Profile/Query')
,(4611686018427404006, '/AccessControl/Profile/Update')
,(4611686018427422203, '/AccessControl/ProfileRuleContext')
,(4611686018427422204, '/AccessControl/ProfileRuleContext/Query')
,(4611686018427387904, '/Connectors')
,(4611686018427387905, '/Connectors/Agent')
,(4611686018427404505, '/Connectors/Agent/Create')
,(4611686018427404507, '/Connectors/Agent/Delete')
,(4611686018427387906, '/Connectors/Agent/Query')
,(4611686018427404506, '/Connectors/Agent/Update')
,(4611686018427415903, '/Connectors/Connection')
,(4611686018427415905, '/Connectors/Connection/Create')
,(4611686018427415907, '/Connectors/Connection/Delete')
,(4611686018427415904, '/Connectors/Connection/Query')
,(4611686018427415906, '/Connectors/Connection/Update')
,(4611686018427416103, '/Connectors/ConnectionColumn')
,(4611686018427416104, '/Connectors/ConnectionColumn/Query')
,(4611686018427416203, '/Connectors/ConnectionPackage')
,(4611686018427416204, '/Connectors/ConnectionPackage/Query')
,(4611686018427416003, '/Connectors/ConnectionTable')
,(4611686018427416004, '/Connectors/ConnectionTable/Query')
,(4611686018427390603, '/Connectors/Connector')
,(4611686018427390605, '/Connectors/Connector/Create')
,(4611686018427390607, '/Connectors/Connector/Delete')
,(4611686018427390604, '/Connectors/Connector/Query')
,(4611686018427390606, '/Connectors/Connector/Update')
,(4611686018427403503, '/Connectors/EntityAssociationMapping')
,(4611686018427403505, '/Connectors/EntityAssociationMapping/Create')
,(4611686018427403507, '/Connectors/EntityAssociationMapping/Delete')
,(4611686018427403504, '/Connectors/EntityAssociationMapping/Query')
,(4611686018427403506, '/Connectors/EntityAssociationMapping/Update')
,(4611686018427403403, '/Connectors/EntityPropertyMapping')
,(4611686018427403405, '/Connectors/EntityPropertyMapping/Create')
,(4611686018427403407, '/Connectors/EntityPropertyMapping/Delete')
,(4611686018427403404, '/Connectors/EntityPropertyMapping/Query')
,(4611686018427403406, '/Connectors/EntityPropertyMapping/Update')
,(4611686018427403303, '/Connectors/EntityTypeMapping')
,(4611686018427403305, '/Connectors/EntityTypeMapping/Create')
,(4611686018427403307, '/Connectors/EntityTypeMapping/Delete')
,(4611686018427403304, '/Connectors/EntityTypeMapping/Query')
,(4611686018427403306, '/Connectors/EntityTypeMapping/Update')
,(4611686018427387912, '/Connectors/EntityTypeMappingByConnectorIdQuery')
,(4611686018427387911, '/Connectors/EntityTypeMappingByConnectorIdQuery/Query')
,(4611686018427387914, '/Connectors/PasswordResetContextsByIdsQuery')
,(4611686018427387915, '/Connectors/PasswordResetContextsByIdsQuery/Query')
,(4611686018427387916, '/Connectors/ProvisionerResourceTypeMapping')
,(4611686018427387917, '/Connectors/ProvisionerResourceTypeMapping/Query')
,(4611686018427387907, '/Connectors/ProvisioningSession')
,(4611686018427387918, '/Connectors/ResourceTypeMapping')
,(4611686018427387919, '/Connectors/ResourceTypeMapping/Query')
,(4611686018427387910, '/Connectors/SynchronizeSession')
,(4611686018427388033, '/Custom')
,(4611686018427388123, '/Custom/AccessCertification')
,(4611686018427388124, '/Custom/AccessCertification/AutoAssigned')
,(4611686018427388125, '/Custom/AccessCertification/ManualAssigned')
,(4611686018427388227, '/Custom/ManageAccounts')
,(4611686018427388037, '/Custom/ProvisioningPolicy')
,(4611686018427388259, '/Custom/ProvisioningPolicy/BulkPerformManualProvisioning')
,(4611686018427388257, '/Custom/ProvisioningPolicy/BulkReconciliateResources')
,(4611686018427388258, '/Custom/ProvisioningPolicy/BulkReviewProvisioning')
,(4611686018427388260, '/Custom/ProvisioningPolicy/BulkRoleReconciliation')
,(4611686018427388052, '/Custom/ProvisioningPolicy/PendingAssignedResourceTypes')
,(4611686018427388042, '/Custom/ProvisioningPolicy/PerformManualProvisioning')
,(4611686018427388041, '/Custom/ProvisioningPolicy/ReconciliateResources')
,(4611686018427388040, '/Custom/ProvisioningPolicy/ReconciliateRoles')
,(4611686018427388039, '/Custom/ProvisioningPolicy/ReviewProvisioning')
,(4611686018427388038, '/Custom/ProvisioningPolicy/ReviewRoles')
,(4611686018427388036, '/Custom/Reports')
,(4611686018427388056, '/Custom/ResourceChanges')
,(4611686018427388057, '/Custom/ResourceFileChanges')
,(4611686018427388253, '/Custom/ResourceFiles')
,(4611686018427388058, '/Custom/ResourceLinkChanges')
,(4611686018427388034, '/Custom/Resources')
,(4611686018427388035, '/Custom/Workflows')
,(4611686018427388153, '/Custom/Workflows/Supervise')
,(4611686018427388226, '/Custom/WorkflowsNotifications')
,(4611686018427388093, '/EntityTypeMappings')
,(4611686018427388073, '/Jobs')
,(4611686018427407803, '/Jobs/Job')
,(4611686018427407805, '/Jobs/Job/Create')
,(4611686018427407807, '/Jobs/Job/Delete')
,(4611686018427407804, '/Jobs/Job/Query')
,(4611686018427407806, '/Jobs/Job/Update')
,(4611686018427408203, '/Jobs/JobInstance')
,(4611686018427408205, '/Jobs/JobInstance/Create')
,(4611686018427408207, '/Jobs/JobInstance/Delete')
,(4611686018427408204, '/Jobs/JobInstance/Query')
,(4611686018427408206, '/Jobs/JobInstance/Update')
,(4611686018427407903, '/Jobs/JobStep')
,(4611686018427407905, '/Jobs/JobStep/Create')
,(4611686018427407907, '/Jobs/JobStep/Delete')
,(4611686018427407904, '/Jobs/JobStep/Query')
,(4611686018427407906, '/Jobs/JobStep/Update')
,(4611686018427388144, '/Jobs/RunJob')
,(4611686018427388147, '/Jobs/RunJob/GetLog')
,(4611686018427388143, '/Jobs/RunJob/Launch')
,(4611686018427388163, '/Jobs/RunJob/Launch/Aborted')
,(4611686018427388167, '/Jobs/RunJob/Launch/Blocked')
,(4611686018427388165, '/Jobs/RunJob/Launch/Completed')
,(4611686018427388169, '/Jobs/RunJob/Launch/Errored')
,(4611686018427388171, '/Jobs/RunJob/Launch/Warning')
,(4611686018427388148, '/Jobs/RunJob/Repair')
,(4611686018427388164, '/Jobs/RunJob/Repair/Aborted')
,(4611686018427388168, '/Jobs/RunJob/Repair/Blocked')
,(4611686018427388166, '/Jobs/RunJob/Repair/Completed')
,(4611686018427388170, '/Jobs/RunJob/Repair/Errored')
,(4611686018427388172, '/Jobs/RunJob/Repair/Warning')
,(4611686018427404403, '/Jobs/Task')
,(4611686018427404405, '/Jobs/Task/Create')
,(4611686018427404407, '/Jobs/Task/Delete')
,(4611686018427404404, '/Jobs/Task/Query')
,(4611686018427404406, '/Jobs/Task/Update')
,(4611686018427408503, '/Jobs/TaskDependOnTask')
,(4611686018427408505, '/Jobs/TaskDependOnTask/Create')
,(4611686018427408507, '/Jobs/TaskDependOnTask/Delete')
,(4611686018427408504, '/Jobs/TaskDependOnTask/Query')
,(4611686018427408506, '/Jobs/TaskDependOnTask/Update')
,(4611686018427408403, '/Jobs/TaskDimension')
,(4611686018427408405, '/Jobs/TaskDimension/Create')
,(4611686018427408407, '/Jobs/TaskDimension/Delete')
,(4611686018427408404, '/Jobs/TaskDimension/Query')
,(4611686018427408406, '/Jobs/TaskDimension/Update')
,(4611686018427408003, '/Jobs/TaskEntityType')
,(4611686018427408005, '/Jobs/TaskEntityType/Create')
,(4611686018427408007, '/Jobs/TaskEntityType/Delete')
,(4611686018427408004, '/Jobs/TaskEntityType/Query')
,(4611686018427408006, '/Jobs/TaskEntityType/Update')
,(4611686018427388146, '/Jobs/TaskIdByIdentifiersQuery')
,(4611686018427388145, '/Jobs/TaskIdByIdentifiersQuery/Query')
,(4611686018427408303, '/Jobs/TaskInstance')
,(4611686018427408305, '/Jobs/TaskInstance/Create')
,(4611686018427408307, '/Jobs/TaskInstance/Delete')
,(4611686018427408304, '/Jobs/TaskInstance/Query')
,(4611686018427408306, '/Jobs/TaskInstance/Update')
,(4611686018427408103, '/Jobs/TaskResourceType')
,(4611686018427408105, '/Jobs/TaskResourceType/Create')
,(4611686018427408107, '/Jobs/TaskResourceType/Delete')
,(4611686018427408104, '/Jobs/TaskResourceType/Query')
,(4611686018427408106, '/Jobs/TaskResourceType/Update')
,(4611686018427387933, '/Metadata')
,(4611686018427392303, '/Metadata/Binding')
,(4611686018427392305, '/Metadata/Binding/Create')
,(4611686018427392307, '/Metadata/Binding/Delete')
,(4611686018427392304, '/Metadata/Binding/Query')
,(4611686018427392306, '/Metadata/Binding/Update')
,(4611686018427392403, '/Metadata/BindingItem')
,(4611686018427392404, '/Metadata/BindingItem/Query')
,(4611686018427391803, '/Metadata/Dimension')
,(4611686018427391805, '/Metadata/Dimension/Create')
,(4611686018427391807, '/Metadata/Dimension/Delete')
,(4611686018427391804, '/Metadata/Dimension/Query')
,(4611686018427391806, '/Metadata/Dimension/Update')
,(4611686018427391003, '/Metadata/EntityAssociation')
,(4611686018427391005, '/Metadata/EntityAssociation/Create')
,(4611686018427391007, '/Metadata/EntityAssociation/Delete')
,(4611686018427391004, '/Metadata/EntityAssociation/Query')
,(4611686018427391006, '/Metadata/EntityAssociation/Update')
,(4611686018427390903, '/Metadata/EntityProperty')
,(4611686018427390905, '/Metadata/EntityProperty/Create')
;
INSERT INTO "#tmp_ua_accesscontrolpermissions"("Id","Identifier") VALUES
 (4611686018427390907, '/Metadata/EntityProperty/Delete')
,(4611686018427390904, '/Metadata/EntityProperty/Query')
,(4611686018427390906, '/Metadata/EntityProperty/Update')
,(4611686018427390803, '/Metadata/EntityType')
,(4611686018427390805, '/Metadata/EntityType/Create')
,(4611686018427390807, '/Metadata/EntityType/Delete')
,(4611686018427390804, '/Metadata/EntityType/Query')
,(4611686018427390806, '/Metadata/EntityType/Update')
,(4611686018427414703, '/Metadata/Language')
,(4611686018427414704, '/Metadata/Language/Query')
,(4611686018427403803, '/Metadata/Setting')
,(4611686018427403805, '/Metadata/Setting/Create')
,(4611686018427403807, '/Metadata/Setting/Delete')
,(4611686018427403804, '/Metadata/Setting/Query')
,(4611686018427403806, '/Metadata/Setting/Update')
,(4611686018427388149, '/Monitoring')
,(4611686018427387953, '/ProvisioningPolicy')
,(4611686018427388603, '/ProvisioningPolicy/AssignedCompositeRole')
,(4611686018427388047, '/ProvisioningPolicy/AssignedCompositeRole/Comment')
,(4611686018427388605, '/ProvisioningPolicy/AssignedCompositeRole/Create')
,(4611686018427388607, '/ProvisioningPolicy/AssignedCompositeRole/Delete')
,(4611686018427388604, '/ProvisioningPolicy/AssignedCompositeRole/Query')
,(4611686018427388606, '/ProvisioningPolicy/AssignedCompositeRole/Update')
,(4611686018427410203, '/ProvisioningPolicy/AssignedResourceBinary')
,(4611686018427410205, '/ProvisioningPolicy/AssignedResourceBinary/Create')
,(4611686018427410207, '/ProvisioningPolicy/AssignedResourceBinary/Delete')
,(4611686018427410204, '/ProvisioningPolicy/AssignedResourceBinary/Query')
,(4611686018427410206, '/ProvisioningPolicy/AssignedResourceBinary/Update')
,(4611686018427388703, '/ProvisioningPolicy/AssignedResourceNavigation')
,(4611686018427388705, '/ProvisioningPolicy/AssignedResourceNavigation/Create')
,(4611686018427388707, '/ProvisioningPolicy/AssignedResourceNavigation/Delete')
,(4611686018427388704, '/ProvisioningPolicy/AssignedResourceNavigation/Query')
,(4611686018427388706, '/ProvisioningPolicy/AssignedResourceNavigation/Update')
,(4611686018427388803, '/ProvisioningPolicy/AssignedResourceScalar')
,(4611686018427388805, '/ProvisioningPolicy/AssignedResourceScalar/Create')
,(4611686018427388807, '/ProvisioningPolicy/AssignedResourceScalar/Delete')
,(4611686018427388804, '/ProvisioningPolicy/AssignedResourceScalar/Query')
,(4611686018427388806, '/ProvisioningPolicy/AssignedResourceScalar/Update')
,(4611686018427388903, '/ProvisioningPolicy/AssignedResourceType')
,(4611686018427388049, '/ProvisioningPolicy/AssignedResourceType/Comment')
,(4611686018427388905, '/ProvisioningPolicy/AssignedResourceType/Create')
,(4611686018427388907, '/ProvisioningPolicy/AssignedResourceType/Delete')
,(4611686018427387956, '/ProvisioningPolicy/AssignedResourceType/ManualProvisioningReview')
,(4611686018427388904, '/ProvisioningPolicy/AssignedResourceType/Query')
,(4611686018427388906, '/ProvisioningPolicy/AssignedResourceType/Update')
,(4611686018427389003, '/ProvisioningPolicy/AssignedSingleRole')
,(4611686018427388048, '/ProvisioningPolicy/AssignedSingleRole/Comment')
,(4611686018427389005, '/ProvisioningPolicy/AssignedSingleRole/Create')
,(4611686018427389007, '/ProvisioningPolicy/AssignedSingleRole/Delete')
,(4611686018427389004, '/ProvisioningPolicy/AssignedSingleRole/Query')
,(4611686018427389006, '/ProvisioningPolicy/AssignedSingleRole/Update')
,(4611686018427515903, '/ProvisioningPolicy/AutomationRule')
,(4611686018427515905, '/ProvisioningPolicy/AutomationRule/Create')
,(4611686018427388461, '/ProvisioningPolicy/AutomationRule/CreateSimulation')
,(4611686018427515907, '/ProvisioningPolicy/AutomationRule/Delete')
,(4611686018427388463, '/ProvisioningPolicy/AutomationRule/DeleteSimulation')
,(4611686018427515904, '/ProvisioningPolicy/AutomationRule/Query')
,(4611686018427388478, '/ProvisioningPolicy/AutomationRule/RevertSimulation')
,(4611686018427388460, '/ProvisioningPolicy/AutomationRule/Simulation')
,(4611686018427515906, '/ProvisioningPolicy/AutomationRule/Update')
,(4611686018427388462, '/ProvisioningPolicy/AutomationRule/UpdateSimulation')
,(4611686018427390103, '/ProvisioningPolicy/Category')
,(4611686018427390105, '/ProvisioningPolicy/Category/Create')
,(4611686018427390107, '/ProvisioningPolicy/Category/Delete')
,(4611686018427390104, '/ProvisioningPolicy/Category/Query')
,(4611686018427390106, '/ProvisioningPolicy/Category/Update')
,(4611686018427392603, '/ProvisioningPolicy/CompositeRole')
,(4611686018427392605, '/ProvisioningPolicy/CompositeRole/Create')
,(4611686018427388453, '/ProvisioningPolicy/CompositeRole/CreateSimulation')
,(4611686018427392607, '/ProvisioningPolicy/CompositeRole/Delete')
,(4611686018427388455, '/ProvisioningPolicy/CompositeRole/DeleteSimulation')
,(4611686018427392604, '/ProvisioningPolicy/CompositeRole/Query')
,(4611686018427388476, '/ProvisioningPolicy/CompositeRole/RevertSimulation')
,(4611686018427388452, '/ProvisioningPolicy/CompositeRole/Simulation')
,(4611686018427392606, '/ProvisioningPolicy/CompositeRole/Update')
,(4611686018427388454, '/ProvisioningPolicy/CompositeRole/UpdateSimulation')
,(4611686018427391303, '/ProvisioningPolicy/CompositeRoleRule')
,(4611686018427391305, '/ProvisioningPolicy/CompositeRoleRule/Create')
,(4611686018427388413, '/ProvisioningPolicy/CompositeRoleRule/CreateSimulation')
,(4611686018427391307, '/ProvisioningPolicy/CompositeRoleRule/Delete')
,(4611686018427388415, '/ProvisioningPolicy/CompositeRoleRule/DeleteSimulation')
,(4611686018427391304, '/ProvisioningPolicy/CompositeRoleRule/Query')
,(4611686018427388466, '/ProvisioningPolicy/CompositeRoleRule/RevertSimulation')
,(4611686018427388412, '/ProvisioningPolicy/CompositeRoleRule/Simulation')
,(4611686018427391306, '/ProvisioningPolicy/CompositeRoleRule/Update')
,(4611686018427388414, '/ProvisioningPolicy/CompositeRoleRule/UpdateSimulation')
,(4611686018427414803, '/ProvisioningPolicy/ContextRule')
,(4611686018427414805, '/ProvisioningPolicy/ContextRule/Create')
,(4611686018427388417, '/ProvisioningPolicy/ContextRule/CreateSimulation')
,(4611686018427414807, '/ProvisioningPolicy/ContextRule/Delete')
,(4611686018427388419, '/ProvisioningPolicy/ContextRule/DeleteSimulation')
,(4611686018427414804, '/ProvisioningPolicy/ContextRule/Query')
,(4611686018427388467, '/ProvisioningPolicy/ContextRule/RevertSimulation')
,(4611686018427388416, '/ProvisioningPolicy/ContextRule/Simulation')
,(4611686018427414806, '/ProvisioningPolicy/ContextRule/Update')
,(4611686018427388418, '/ProvisioningPolicy/ContextRule/UpdateSimulation')
,(4611686018427389203, '/ProvisioningPolicy/IdentifiedRisk')
,(4611686018427389204, '/ProvisioningPolicy/IdentifiedRisk/Query')
,(4611686018427421803, '/ProvisioningPolicy/MiningRule')
,(4611686018427421805, '/ProvisioningPolicy/MiningRule/Create')
,(4611686018427421807, '/ProvisioningPolicy/MiningRule/Delete')
,(4611686018427421804, '/ProvisioningPolicy/MiningRule/Query')
,(4611686018427421806, '/ProvisioningPolicy/MiningRule/Update')
,(4611686018427390203, '/ProvisioningPolicy/Policy')
,(4611686018427390205, '/ProvisioningPolicy/Policy/Create')
,(4611686018427388405, '/ProvisioningPolicy/Policy/CreateSimulation')
,(4611686018427390207, '/ProvisioningPolicy/Policy/Delete')
,(4611686018427388407, '/ProvisioningPolicy/Policy/DeleteSimulation')
,(4611686018427390204, '/ProvisioningPolicy/Policy/Query')
,(4611686018427388464, '/ProvisioningPolicy/Policy/RevertSimulation')
,(4611686018427388404, '/ProvisioningPolicy/Policy/Simulation')
,(4611686018427390206, '/ProvisioningPolicy/Policy/Update')
,(4611686018427388406, '/ProvisioningPolicy/Policy/UpdateSimulation')
,(4611686018427388243, '/ProvisioningPolicy/PolicySimulation')
,(4611686018427388245, '/ProvisioningPolicy/PolicySimulation/Create')
,(4611686018427388247, '/ProvisioningPolicy/PolicySimulation/Delete')
,(4611686018427388244, '/ProvisioningPolicy/PolicySimulation/Query')
,(4611686018427388250, '/ProvisioningPolicy/PolicySimulation/Start')
,(4611686018427388249, '/ProvisioningPolicy/PolicySimulation/Update')
,(4611686018427388043, '/ProvisioningPolicy/PredefinedFunctionQuery')
,(4611686018427388044, '/ProvisioningPolicy/PredefinedFunctionQuery/Query')
,(4611686018427387954, '/ProvisioningPolicy/Provisioning')
,(4611686018427387955, '/ProvisioningPolicy/Provisioning/Start')
,(4611686018427388254, '/ProvisioningPolicy/RedundantAssignment')
,(4611686018427388256, '/ProvisioningPolicy/RedundantAssignment/Query')
,(4611686018427388255, '/ProvisioningPolicy/RedundantAssignment/Start')
,(4611686018428123303, '/ProvisioningPolicy/ResourceBinaryRule')
,(4611686018428123305, '/ProvisioningPolicy/ResourceBinaryRule/Create')
,(4611686018427388421, '/ProvisioningPolicy/ResourceBinaryRule/CreateSimulation')
,(4611686018428123307, '/ProvisioningPolicy/ResourceBinaryRule/Delete')
,(4611686018427388423, '/ProvisioningPolicy/ResourceBinaryRule/DeleteSimulation')
,(4611686018428123304, '/ProvisioningPolicy/ResourceBinaryRule/Query')
,(4611686018427388468, '/ProvisioningPolicy/ResourceBinaryRule/RevertSimulation')
,(4611686018427388420, '/ProvisioningPolicy/ResourceBinaryRule/Simulation')
,(4611686018428123306, '/ProvisioningPolicy/ResourceBinaryRule/Update')
,(4611686018427388422, '/ProvisioningPolicy/ResourceBinaryRule/UpdateSimulation')
,(4611686018427416803, '/ProvisioningPolicy/ResourceClassificationRule')
,(4611686018427416805, '/ProvisioningPolicy/ResourceClassificationRule/Create')
,(4611686018427388425, '/ProvisioningPolicy/ResourceClassificationRule/CreateSimulation')
,(4611686018427416807, '/ProvisioningPolicy/ResourceClassificationRule/Delete')
,(4611686018427388427, '/ProvisioningPolicy/ResourceClassificationRule/DeleteSimulation')
,(4611686018427416804, '/ProvisioningPolicy/ResourceClassificationRule/Query')
,(4611686018427388469, '/ProvisioningPolicy/ResourceClassificationRule/RevertSimulation')
,(4611686018427388424, '/ProvisioningPolicy/ResourceClassificationRule/Simulation')
,(4611686018427416806, '/ProvisioningPolicy/ResourceClassificationRule/Update')
,(4611686018427388426, '/ProvisioningPolicy/ResourceClassificationRule/UpdateSimulation')
,(4611686018427414403, '/ProvisioningPolicy/ResourceCorrelationRule')
,(4611686018427414405, '/ProvisioningPolicy/ResourceCorrelationRule/Create')
,(4611686018427388429, '/ProvisioningPolicy/ResourceCorrelationRule/CreateSimulation')
,(4611686018427414407, '/ProvisioningPolicy/ResourceCorrelationRule/Delete')
,(4611686018427388431, '/ProvisioningPolicy/ResourceCorrelationRule/DeleteSimulation')
,(4611686018427414404, '/ProvisioningPolicy/ResourceCorrelationRule/Query')
,(4611686018427388470, '/ProvisioningPolicy/ResourceCorrelationRule/RevertSimulation')
,(4611686018427388428, '/ProvisioningPolicy/ResourceCorrelationRule/Simulation')
,(4611686018427414406, '/ProvisioningPolicy/ResourceCorrelationRule/Update')
,(4611686018427388430, '/ProvisioningPolicy/ResourceCorrelationRule/UpdateSimulation')
,(4611686018427388251, '/ProvisioningPolicy/ResourceHistory')
,(4611686018427388252, '/ProvisioningPolicy/ResourceHistory/Query')
,(4611686018427388051, '/ProvisioningPolicy/ResourceManageableAccounts')
,(4611686018427388050, '/ProvisioningPolicy/ResourceManageableAccounts/Query')
,(4611686018427391603, '/ProvisioningPolicy/ResourceNavigationRule')
,(4611686018427391605, '/ProvisioningPolicy/ResourceNavigationRule/Create')
,(4611686018427388433, '/ProvisioningPolicy/ResourceNavigationRule/CreateSimulation')
,(4611686018427391607, '/ProvisioningPolicy/ResourceNavigationRule/Delete')
,(4611686018427388435, '/ProvisioningPolicy/ResourceNavigationRule/DeleteSimulation')
,(4611686018427391604, '/ProvisioningPolicy/ResourceNavigationRule/Query')
,(4611686018427388471, '/ProvisioningPolicy/ResourceNavigationRule/RevertSimulation')
,(4611686018427388432, '/ProvisioningPolicy/ResourceNavigationRule/Simulation')
,(4611686018427391606, '/ProvisioningPolicy/ResourceNavigationRule/Update')
,(4611686018427388434, '/ProvisioningPolicy/ResourceNavigationRule/UpdateSimulation')
,(4611686018427415103, '/ProvisioningPolicy/ResourceQueryRule')
,(4611686018427415105, '/ProvisioningPolicy/ResourceQueryRule/Create')
,(4611686018427388437, '/ProvisioningPolicy/ResourceQueryRule/CreateSimulation')
,(4611686018427415107, '/ProvisioningPolicy/ResourceQueryRule/Delete')
,(4611686018427388439, '/ProvisioningPolicy/ResourceQueryRule/DeleteSimulation')
,(4611686018427415104, '/ProvisioningPolicy/ResourceQueryRule/Query')
,(4611686018427388472, '/ProvisioningPolicy/ResourceQueryRule/RevertSimulation')
,(4611686018427388436, '/ProvisioningPolicy/ResourceQueryRule/Simulation')
,(4611686018427415106, '/ProvisioningPolicy/ResourceQueryRule/Update')
,(4611686018427388438, '/ProvisioningPolicy/ResourceQueryRule/UpdateSimulation')
,(4611686018427403903, '/ProvisioningPolicy/ResourceScalarRule')
,(4611686018427403905, '/ProvisioningPolicy/ResourceScalarRule/Create')
,(4611686018427388441, '/ProvisioningPolicy/ResourceScalarRule/CreateSimulation')
,(4611686018427403907, '/ProvisioningPolicy/ResourceScalarRule/Delete')
,(4611686018427388443, '/ProvisioningPolicy/ResourceScalarRule/DeleteSimulation')
,(4611686018427403904, '/ProvisioningPolicy/ResourceScalarRule/Query')
,(4611686018427388473, '/ProvisioningPolicy/ResourceScalarRule/RevertSimulation')
,(4611686018427388440, '/ProvisioningPolicy/ResourceScalarRule/Simulation')
,(4611686018427403906, '/ProvisioningPolicy/ResourceScalarRule/Update')
,(4611686018427388442, '/ProvisioningPolicy/ResourceScalarRule/UpdateSimulation')
,(4611686018427390403, '/ProvisioningPolicy/ResourceType')
,(4611686018427390405, '/ProvisioningPolicy/ResourceType/Create')
,(4611686018427388457, '/ProvisioningPolicy/ResourceType/CreateSimulation')
,(4611686018427390407, '/ProvisioningPolicy/ResourceType/Delete')
,(4611686018427388459, '/ProvisioningPolicy/ResourceType/DeleteSimulation')
,(4611686018427390404, '/ProvisioningPolicy/ResourceType/Query')
,(4611686018427388477, '/ProvisioningPolicy/ResourceType/RevertSimulation')
,(4611686018427388456, '/ProvisioningPolicy/ResourceType/Simulation')
,(4611686018427390406, '/ProvisioningPolicy/ResourceType/Update')
,(4611686018427388458, '/ProvisioningPolicy/ResourceType/UpdateSimulation')
;
INSERT INTO "#tmp_ua_accesscontrolpermissions"("Id","Identifier") VALUES
 (4611686018427391503, '/ProvisioningPolicy/ResourceTypeRule')
,(4611686018427391505, '/ProvisioningPolicy/ResourceTypeRule/Create')
,(4611686018427388445, '/ProvisioningPolicy/ResourceTypeRule/CreateSimulation')
,(4611686018427391507, '/ProvisioningPolicy/ResourceTypeRule/Delete')
,(4611686018427388447, '/ProvisioningPolicy/ResourceTypeRule/DeleteSimulation')
,(4611686018427391504, '/ProvisioningPolicy/ResourceTypeRule/Query')
,(4611686018427388474, '/ProvisioningPolicy/ResourceTypeRule/RevertSimulation')
,(4611686018427388444, '/ProvisioningPolicy/ResourceTypeRule/Simulation')
,(4611686018427391506, '/ProvisioningPolicy/ResourceTypeRule/Update')
,(4611686018427388446, '/ProvisioningPolicy/ResourceTypeRule/UpdateSimulation')
,(4611686018427389303, '/ProvisioningPolicy/Risk')
,(4611686018427389305, '/ProvisioningPolicy/Risk/Create')
,(4611686018427389307, '/ProvisioningPolicy/Risk/Delete')
,(4611686018427388055, '/ProvisioningPolicy/Risk/OverrideApproval')
,(4611686018427388054, '/ProvisioningPolicy/Risk/OverrideBlocking')
,(4611686018427389304, '/ProvisioningPolicy/Risk/Query')
,(4611686018427389306, '/ProvisioningPolicy/Risk/Update')
,(4611686018427416303, '/ProvisioningPolicy/RoleMapping')
,(4611686018427416305, '/ProvisioningPolicy/RoleMapping/Create')
,(4611686018427416307, '/ProvisioningPolicy/RoleMapping/Delete')
,(4611686018427416304, '/ProvisioningPolicy/RoleMapping/Query')
,(4611686018427416306, '/ProvisioningPolicy/RoleMapping/Update')
,(4611686018427390003, '/ProvisioningPolicy/SingleRole')
,(4611686018427390005, '/ProvisioningPolicy/SingleRole/Create')
,(4611686018427388449, '/ProvisioningPolicy/SingleRole/CreateSimulation')
,(4611686018427390007, '/ProvisioningPolicy/SingleRole/Delete')
,(4611686018427388451, '/ProvisioningPolicy/SingleRole/DeleteSimulation')
,(4611686018427390004, '/ProvisioningPolicy/SingleRole/Query')
,(4611686018427388475, '/ProvisioningPolicy/SingleRole/RevertSimulation')
,(4611686018427388448, '/ProvisioningPolicy/SingleRole/Simulation')
,(4611686018427390006, '/ProvisioningPolicy/SingleRole/Update')
,(4611686018427388450, '/ProvisioningPolicy/SingleRole/UpdateSimulation')
,(4611686018427391403, '/ProvisioningPolicy/SingleRoleRule')
,(4611686018427391405, '/ProvisioningPolicy/SingleRoleRule/Create')
,(4611686018427388409, '/ProvisioningPolicy/SingleRoleRule/CreateSimulation')
,(4611686018427391407, '/ProvisioningPolicy/SingleRoleRule/Delete')
,(4611686018427388411, '/ProvisioningPolicy/SingleRoleRule/DeleteSimulation')
,(4611686018427391404, '/ProvisioningPolicy/SingleRoleRule/Query')
,(4611686018427388465, '/ProvisioningPolicy/SingleRoleRule/RevertSimulation')
,(4611686018427388408, '/ProvisioningPolicy/SingleRoleRule/Simulation')
,(4611686018427391406, '/ProvisioningPolicy/SingleRoleRule/Update')
,(4611686018427388410, '/ProvisioningPolicy/SingleRoleRule/UpdateSimulation')
,(4611686018427388113, '/Report')
,(4611686018427388114, '/Report/GenerateReportFileFromQuery')
,(4611686018427388115, '/Report/GenerateReportFileFromQuery/Query')
,(4611686018427388116, '/Report/GenerateReportFileFromReportQuery')
,(4611686018427388117, '/Report/GenerateReportFileFromReportQuery/Query')
,(4611686018427413303, '/Report/ReportQuery')
,(4611686018427413305, '/Report/ReportQuery/Create')
,(4611686018427413307, '/Report/ReportQuery/Delete')
,(4611686018427413304, '/Report/ReportQuery/Query')
,(4611686018427413306, '/Report/ReportQuery/Update')
,(4611686018427387973, '/Resources')
,(4611686018427387974, '/Resources/Incremental')
,(4611686018427387975, '/Resources/Incremental/Query')
,(4611686018427390303, '/Resources/Resource')
,(4611686018427390305, '/Resources/Resource/Create')
,(4611686018427390307, '/Resources/Resource/Delete')
,(4611686018427390304, '/Resources/Resource/Query')
,(4611686018427390306, '/Resources/Resource/Update')
,(4611686018427388263, '/Settings')
,(4611686018427388264, '/Settings/Manage')
,(4611686018427388223, '/Universes')
,(4611686018427415403, '/Universes/EntityInstance')
,(4611686018427415404, '/Universes/EntityInstance/Query')
,(4611686018427415303, '/Universes/Universe')
,(4611686018427415304, '/Universes/Universe/Query')
,(4611686018427388224, '/Universes/UniverseData')
,(4611686018427388225, '/Universes/UniverseData/Query')
,(4611686018427388013, '/UserInterface')
,(4611686018427388026, '/UserInterface/ActivityFormNameByWorkflowInstanceIdQuery')
,(4611686018427388027, '/UserInterface/ActivityFormNameByWorkflowInstanceIdQuery/Query')
,(4611686018427388201, '/UserInterface/ApplicationInformationsQuery')
,(4611686018427388202, '/UserInterface/ApplicationInformationsQuery/Query')
,(4611686018427388206, '/UserInterface/ConnectorResourceType')
,(4611686018427388207, '/UserInterface/ConnectorResourceType/Create')
,(4611686018427388209, '/UserInterface/ConnectorResourceType/Delete')
,(4611686018427388208, '/UserInterface/ConnectorResourceType/Update')
,(4611686018427394903, '/UserInterface/DisplayEntityAssociation')
,(4611686018427394905, '/UserInterface/DisplayEntityAssociation/Create')
,(4611686018427394907, '/UserInterface/DisplayEntityAssociation/Delete')
,(4611686018427394904, '/UserInterface/DisplayEntityAssociation/Query')
,(4611686018427394906, '/UserInterface/DisplayEntityAssociation/Update')
,(4611686018427395003, '/UserInterface/DisplayEntityProperty')
,(4611686018427395005, '/UserInterface/DisplayEntityProperty/Create')
,(4611686018427395007, '/UserInterface/DisplayEntityProperty/Delete')
,(4611686018427395004, '/UserInterface/DisplayEntityProperty/Query')
,(4611686018427395006, '/UserInterface/DisplayEntityProperty/Update')
,(4611686018427394803, '/UserInterface/DisplayEntityType')
,(4611686018427394805, '/UserInterface/DisplayEntityType/Create')
,(4611686018427394807, '/UserInterface/DisplayEntityType/Delete')
,(4611686018427394804, '/UserInterface/DisplayEntityType/Query')
,(4611686018427394806, '/UserInterface/DisplayEntityType/Update')
,(4611686018427422003, '/UserInterface/DisplayPropertyGroup')
,(4611686018427422005, '/UserInterface/DisplayPropertyGroup/Create')
,(4611686018427422007, '/UserInterface/DisplayPropertyGroup/Delete')
,(4611686018427422004, '/UserInterface/DisplayPropertyGroup/Query')
,(4611686018427422006, '/UserInterface/DisplayPropertyGroup/Update')
,(4611686018427392003, '/UserInterface/DisplayTable')
,(4611686018427392005, '/UserInterface/DisplayTable/Create')
,(4611686018427392007, '/UserInterface/DisplayTable/Delete')
,(4611686018427392004, '/UserInterface/DisplayTable/Query')
,(4611686018427392006, '/UserInterface/DisplayTable/Update')
,(4611686018427392203, '/UserInterface/DisplayTableColumn')
,(4611686018427392205, '/UserInterface/DisplayTableColumn/Create')
,(4611686018427392207, '/UserInterface/DisplayTableColumn/Delete')
,(4611686018427392204, '/UserInterface/DisplayTableColumn/Query')
,(4611686018427392206, '/UserInterface/DisplayTableColumn/Update')
,(4611686018427393803, '/UserInterface/DisplayTableDesignElement')
,(4611686018427393804, '/UserInterface/DisplayTableDesignElement/Query')
,(4611686018427388030, '/UserInterface/EntityTypeMappingByUiContextQuery')
,(4611686018427388031, '/UserInterface/EntityTypeMappingByUiContextQuery/Query')
,(4611686018427403603, '/UserInterface/Form')
,(4611686018427403605, '/UserInterface/Form/Create')
,(4611686018427403607, '/UserInterface/Form/Delete')
,(4611686018427403604, '/UserInterface/Form/Query')
,(4611686018427403606, '/UserInterface/Form/Update')
,(4611686018427403703, '/UserInterface/FormControl')
,(4611686018427403705, '/UserInterface/FormControl/Create')
,(4611686018427403707, '/UserInterface/FormControl/Delete')
,(4611686018427403704, '/UserInterface/FormControl/Query')
,(4611686018427403706, '/UserInterface/FormControl/Update')
,(4611686018427388029, '/UserInterface/HierarchyDataByEntityTypeIdQuery')
,(4611686018427388028, '/UserInterface/HierarchyDataByEntityTypeIdQuery/Query')
,(4611686018427405203, '/UserInterface/Indicator')
,(4611686018427405205, '/UserInterface/Indicator/Create')
,(4611686018427405207, '/UserInterface/Indicator/Delete')
,(4611686018427405204, '/UserInterface/Indicator/Query')
,(4611686018427405206, '/UserInterface/Indicator/Update')
,(4611686018427405303, '/UserInterface/IndicatorItem')
,(4611686018427405305, '/UserInterface/IndicatorItem/Create')
,(4611686018427405307, '/UserInterface/IndicatorItem/Delete')
,(4611686018427405304, '/UserInterface/IndicatorItem/Query')
,(4611686018427405306, '/UserInterface/IndicatorItem/Update')
,(4611686018427388024, '/UserInterface/PersonasByFilterQuery')
,(4611686018427388025, '/UserInterface/PersonasByFilterQuery/Query')
,(4611686018427388248, '/UserInterface/Reload')
,(4611686018427388014, '/UserInterface/ResourceReadForm')
,(4611686018427388015, '/UserInterface/ResourceReadForm/Query')
,(4611686018427388205, '/UserInterface/ResourceReadFormActions')
,(4611686018427388204, '/UserInterface/ResourceReadFormActions/Query')
,(4611686018427388016, '/UserInterface/ResourceSearchForm')
,(4611686018427388017, '/UserInterface/ResourceSearchForm/Query')
,(4611686018427388032, '/UserInterface/ResourceSelfForm')
,(4611686018427388203, '/UserInterface/ResourceSelfForm/Query')
,(4611686018427394003, '/UserInterface/SearchBar')
,(4611686018427394005, '/UserInterface/SearchBar/Create')
,(4611686018427394007, '/UserInterface/SearchBar/Delete')
,(4611686018427394004, '/UserInterface/SearchBar/Query')
,(4611686018427394006, '/UserInterface/SearchBar/Update')
,(4611686018427394103, '/UserInterface/SearchBarCriterion')
,(4611686018427394105, '/UserInterface/SearchBarCriterion/Create')
,(4611686018427394107, '/UserInterface/SearchBarCriterion/Delete')
,(4611686018427394104, '/UserInterface/SearchBarCriterion/Query')
,(4611686018427394106, '/UserInterface/SearchBarCriterion/Update')
,(4611686018427393103, '/UserInterface/Tile')
,(4611686018427393105, '/UserInterface/Tile/Create')
,(4611686018427393107, '/UserInterface/Tile/Delete')
,(4611686018427393104, '/UserInterface/Tile/Query')
,(4611686018427393106, '/UserInterface/Tile/Update')
,(4611686018427393003, '/UserInterface/TileDesignElement')
,(4611686018427393004, '/UserInterface/TileDesignElement/Query')
,(4611686018427393203, '/UserInterface/TileItem')
,(4611686018427393205, '/UserInterface/TileItem/Create')
,(4611686018427393207, '/UserInterface/TileItem/Delete')
,(4611686018427393204, '/UserInterface/TileItem/Query')
,(4611686018427393206, '/UserInterface/TileItem/Update')
,(4611686018427388018, '/UserInterface/UserByIdentityQuery')
,(4611686018427388019, '/UserInterface/UserByIdentityQuery/Query')
,(4611686018427388020, '/UserInterface/WorkflowFormByNameQuery')
,(4611686018427388021, '/UserInterface/WorkflowFormByNameQuery/Query')
,(4611686018427388022, '/UserInterface/WorkflowFormByWorkflowIdQuery')
,(4611686018427388023, '/UserInterface/WorkflowFormByWorkflowIdQuery/Query')
,(4611686018427387993, '/Workflows')
,(4611686018427393303, '/Workflows/Activity')
,(4611686018427393305, '/Workflows/Activity/Create')
,(4611686018427393307, '/Workflows/Activity/Delete')
,(4611686018427393304, '/Workflows/Activity/Query')
,(4611686018427393306, '/Workflows/Activity/Update')
,(4611686018427394203, '/Workflows/ActivityInstance')
,(4611686018427394204, '/Workflows/ActivityInstance/Query')
,(4611686018427388006, '/Workflows/ActivityInstanceAspectsQuery')
,(4611686018427388007, '/Workflows/ActivityInstanceAspectsQuery/Query')
,(4611686018427393503, '/Workflows/ActivityTemplate')
,(4611686018427393504, '/Workflows/ActivityTemplate/Query')
,(4611686018427393603, '/Workflows/ActivityTemplateState')
,(4611686018427393604, '/Workflows/ActivityTemplateState/Query')
,(4611686018427393703, '/Workflows/ActivityTemplateTransition')
,(4611686018427393704, '/Workflows/ActivityTemplateTransition/Query')
,(4611686018427388004, '/Workflows/HistorizedResourceFileByWorkflowInstanceIdQuery')
,(4611686018427388005, '/Workflows/HistorizedResourceFileByWorkflowInstanceIdQuery/Query')
,(4611686018427395303, '/Workflows/HomonymEntityLink')
,(4611686018427395305, '/Workflows/HomonymEntityLink/Create')
,(4611686018427395307, '/Workflows/HomonymEntityLink/Delete')
,(4611686018427395304, '/Workflows/HomonymEntityLink/Query')
,(4611686018427395306, '/Workflows/HomonymEntityLink/Update')
,(4611686018427387997, '/Workflows/UserActivityInstance')
,(4611686018427388008, '/Workflows/UserActivityInstance/AssignedTo')
,(4611686018427388009, '/Workflows/UserActivityInstance/ExpectedDate')
,(4611686018427387998, '/Workflows/UserActivityInstance/Query')
;
INSERT INTO "#tmp_ua_accesscontrolpermissions"("Id","Identifier") VALUES
 (4611686018427388001, '/Workflows/UserActivityInstanceCountQuery')
,(4611686018427388002, '/Workflows/UserActivityInstanceCountQuery/Query')
,(4611686018427393403, '/Workflows/Workflow')
,(4611686018427393405, '/Workflows/Workflow/Create')
,(4611686018427393407, '/Workflows/Workflow/Delete')
,(4611686018427393404, '/Workflows/Workflow/Query')
,(4611686018427393406, '/Workflows/Workflow/Update')
,(4611686018427387994, '/Workflows/WorkflowInstance')
,(4611686018427393904, '/Workflows/WorkflowInstance/Query')
,(4611686018427387995, '/Workflows/WorkflowInstance/Resume')
,(4611686018427387996, '/Workflows/WorkflowInstance/Start')
,(4611686018427388003, '/Workflows/WorkflowInstance/Supervise')
,(4611686018427387999, '/Workflows/WorkflowInstanceData')
,(4611686018427388000, '/Workflows/WorkflowInstanceData/Query')
DELETE e FROM "UA_AccessControlEntries" e JOIN "UA_AccessControlPermissions" p ON p."Id"=e."Permission_Id" WHERE p."Identifier" NOT LIKE '/Custom/%'  AND p."Id" NOT IN (SELECT Id FROM #tmp_ua_accesscontrolpermissions);
DELETE p FROM "UA_AccessControlPermissions" p WHERE p."Identifier" NOT LIKE '/Custom/%'  AND p."Id" NOT IN (SELECT Id FROM #tmp_ua_accesscontrolpermissions);

UPDATE t SET Identifier=s.Identifier FROM UA_AccessControlPermissions t JOIN #tmp_ua_accesscontrolpermissions s ON s.Id=t.Id;
INSERT INTO UA_AccessControlPermissions(Id,Identifier) SELECT Id,Identifier FROM #tmp_ua_accesscontrolpermissions WHERE Id NOT IN (select Id from UA_AccessControlPermissions);

DROP TABLE #tmp_ua_accesscontrolpermissions;
GO
/* disable parallelism OnPremise */
IF CHARINDEX('Microsoft SQL Azure', @@VERSION) = 0
BEGIN
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 1;
END
GO
/*
-----------------------------------------------------------------------------
****       THIS SCRIPT IS AUTO GENERATED, DO NOT MODIFY MANUALLY.        ****
-----------------------------------------------------------------------------
*/

/*
User Interface
*/
MERGE "UI_TileDesignElements" AS TARGET USING (values(-1,'picture-text','Person identity with photo','Identité personne avec photo')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
MERGE "UI_TileDesignElements" AS TARGET USING (values(-2,'inline data-icon','Inline data with icon','Données en ligne avec icône')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
DELETE "UI_TileDesignElements" WHERE "Id" NOT IN (-1,-2);
GO
DELETE "UI_DisplayTableDesignElements" WHERE "Id" NOT IN (-1,-2,-3,-4);
MERGE "UI_DisplayTableDesignElements" AS TARGET USING (values(-1,'table','Table view','Vue tableau')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
MERGE "UI_DisplayTableDesignElements" AS TARGET USING (values(-2,'list','List view','Vue liste')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
MERGE "UI_DisplayTableDesignElements" AS TARGET USING (values(-3,'resourcetable','Table view with an Owner/Type column','Vue tableau avec une colonne Propriétaire/Type')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
MERGE "UI_DisplayTableDesignElements" AS TARGET USING (values(-4,'adaptable','Table view with an Owner/Type column only if the entity type is the target of a resource type, otherwise table view without said column','Vue tableau avec une colonne Propriétaire/Type seulement si l''entité type est la cible d''une resource type, sinon vue tableau sans ladite colonne')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
GO
DELETE "UI_InputTypes" WHERE "Id" NOT IN (-7,-1,-2,-3,-4,-8,-6,-9,-10,-11,-12,-13);
MERGE "UI_InputTypes" AS TARGET USING (values(-7,'Inherited')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-1,'Auto')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-2,'Text')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-3,'TextArea')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-4,'Combobox')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-8,'ComboboxMultiSelection')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-6,'Picker')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-9,'Hidden')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-10,'Checkbox')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-11,'Date')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-12,'Image')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_InputTypes" AS TARGET USING (values(-13,'Attachment')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
GO
DELETE "UI_OutputTypes" WHERE "Id" NOT IN (-12,-1,-2,-3,-4,-5,-9,-10,-11,-13,-14,-15,-16,-17);
MERGE "UI_OutputTypes" AS TARGET USING (values(-12,'Inherited')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-1,'Auto')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-2,'LayoutFieldset')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-3,'LayoutRowset')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-4,'Text')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-5,'TextArea')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-9,'LayoutContainer')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-10,'TransformImport')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-11,'BasicCollection')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-13,'Date')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-14,'Image')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-15,'ReactExtension')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-16,'Tree')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_OutputTypes" AS TARGET USING (values(-17,'Attachment')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
GO
DELETE "UI_FormTypes" WHERE "Id" NOT IN (-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12);
MERGE "UI_FormTypes" AS TARGET USING (values(-1,'Auto')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-2,'WorkflowCreateEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-3,'WorkflowEditEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-4,'WorkflowUpdateRecordEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-5,'WorkflowAddRecordEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-6,'WorkflowAddAndEndRecordEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-7,'ResourceViewEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-8,'ResourceViewRecordEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-9,'WorkflowCreateRecordEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-10,'WorkflowCreateSeveralRecordsEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-11,'WorkflowUpdateSeveralRecordsEntity')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
MERGE "UI_FormTypes" AS TARGET USING (values(-12,'WorkflowUpdateRecordEntities')) AS SOURCE("Id","Identifier") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier") VALUES(SOURCE."Id", SOURCE."Identifier");
GO
DELETE "UI_SearchBarDesignElements" WHERE "Id" NOT IN (-1,-2);
MERGE "UI_SearchBarDesignElements" AS TARGET USING (values(-1,'Block','Vertical display','Affichage vertical')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
MERGE "UI_SearchBarDesignElements" AS TARGET USING (values(-2,'Inline','Horizontal display','Affichage horizontal')) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayName_L2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayName_L2"=SOURCE."DisplayName_L2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayName_L2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayName_L2");
GO
/*
Workflows
*/
DELETE "UW_ActivityTemplates" WHERE "Id" NOT IN (-1,-2,-3,-4,-5,-6,-7);
MERGE "UW_ActivityTemplates" AS TARGET USING (values(-1,'Action','Action')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UW_ActivityTemplates" AS TARGET USING (values(-2,'ActionWithRefine','Action with refine')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UW_ActivityTemplates" AS TARGET USING (values(-3,'Review','Review')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UW_ActivityTemplates" AS TARGET USING (values(-4,'ReviewWithFeedback','Review with feedback')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UW_ActivityTemplates" AS TARGET USING (values(-5,'ContinueWith','Continue with other workflow')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UW_ActivityTemplates" AS TARGET USING (values(-6,'Persist','Persist')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UW_ActivityTemplates" AS TARGET USING (values(-7,'PersistOnlyResources','Persist only resources')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
DELETE "UW_ActivityTemplateStates" WHERE "Id" NOT IN (-100,-101,-107,-108,-200,-201,-202,-207,-208,-300,-301,-302,-307,-308,-400,-401,-402,-403,-407,-408,-500,-600,-700);
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-100,-1,'Action-ActionPending','Action Pending','ActionPending',1)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-101,-1,'Action-Executed','Done','Executed',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-107,-1,'Action-Aborted','Aborted','Aborted',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-108,-1,'Action-Purged','Purged','Purged',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-200,-2,'ActionWithRefine-ActionPending','Action Pending','ActionPending',1)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-201,-2,'ActionWithRefine-Executed','Done','Executed',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-202,-2,'ActionWithRefine-RefinePending','Refine Pending','RefinePending',1)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-207,-2,'ActionWithRefine-Aborted','Aborted','Aborted',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-208,-2,'ActionWithRefine-Purged','Purged','Purged',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-300,-3,'Review-ReviewPending','Review Pending','ReviewPending',1)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-301,-3,'Review-Approved','Approved','Approved',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-302,-3,'Review-Declined','Declined','Declined',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-307,-3,'Review-Aborted','Aborted','Aborted',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-308,-3,'Review-Purged','Purged','Purged',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-400,-4,'ReviewWithFeedback-ReviewPending','Review Pending','ReviewPending',1)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-401,-4,'ReviewWithFeedback-Approved','Approved','Approved',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-402,-4,'ReviewWithFeedback-Declined','Declined','Declined',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-403,-4,'ReviewWithFeedback-RefinePending','Refine Pending','RefinePending',1)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-407,-4,'ReviewWithFeedback-Aborted','Aborted','Aborted',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-408,-4,'ReviewWithFeedback-Purged','Purged','Purged',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-500,-5,'ContinueWith-Invoked','Invoked','Invoked',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-600,-6,'Persist-Invoked','Executed','Invoked',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
MERGE "UW_ActivityTemplateStates" AS TARGET USING (values(-700,-7,'PersistOnlyResources-Invoked','Executed','Invoked',0)) AS SOURCE("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "ActivityTemplate_Id"=SOURCE."ActivityTemplate_Id","Identifier"=SOURCE."Identifier","ShortIdentifier"=SOURCE."ShortIdentifier","Interactive"=SOURCE."Interactive" WHEN NOT MATCHED THEN INSERT("Id","ActivityTemplate_Id","Identifier","DisplayName_L1","ShortIdentifier","Interactive") VALUES(SOURCE."Id", SOURCE."ActivityTemplate_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."ShortIdentifier",SOURCE."Interactive");
UPDATE "UW_ActivityTemplates" SET "FirstState_Id" = -100 WHERE "Id" = -1;
UPDATE "UW_ActivityTemplates" SET "FirstState_Id" = -200 WHERE "Id" = -2;
UPDATE "UW_ActivityTemplates" SET "FirstState_Id" = -300 WHERE "Id" = -3;
UPDATE "UW_ActivityTemplates" SET "FirstState_Id" = -400 WHERE "Id" = -4;
DELETE "UW_ActivityTemplateTransitions" WHERE "Id" NOT IN (-100,-101,-107,-108,-200,-201,-202,-203,-204,-205,-206,-207,-208,-300,-301,-302,-307,-308,-400,-401,-402,-403,-404,-405,-406,-407,-408,-500,-600,-700);
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-100,-100,-100,'Action-ActionPending-Save','Save',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-101,-100,-101,'Action-ActionPending-Execute','Execute',1)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-107,-100,-107,'Action-ActionPending-Abort','Abort',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-108,-107,-108,'Action-Aborted-Purge','Purge',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-200,-200,-200,'ActionWithRefine-ActionPending-Save','Save',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-201,-200,-201,'ActionWithRefine-ActionPending-Execute','Execute',1)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-202,-200,-202,'ActionWithRefine-ActionPending-Delegate','Delegate',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-203,-200,-207,'ActionWithRefine-ActionPending-Abort','Abort',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-204,-202,-202,'ActionWithRefine-RefinePending-Save','Save',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-205,-202,-202,'ActionWithRefine-RefinePending-Delegate','Delegate',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-206,-202,-201,'ActionWithRefine-RefinePending-Execute','Execute',1)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-207,-202,-207,'ActionWithRefine-RefinePending-Abort','Abort',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-208,-207,-208,'ActionWithRefine-Aborted-Purge','Purge',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-300,-300,-300,'Review-ReviewPending-Save','Save',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-301,-300,-301,'Review-ReviewPending-Approve','Approve',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-302,-300,-302,'Review-ReviewPending-Decline','Decline',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-307,-300,-307,'Review-ReviewPending-Abort','Abort',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-308,-307,-308,'Review-Aborted-Purge','Purge',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-400,-400,-400,'ReviewWithFeedback-ReviewPending-Save','Save',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-401,-400,-401,'ReviewWithFeedback-ReviewPending-Approve','Approve',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-402,-400,-402,'ReviewWithFeedback-ReviewPending-Decline','Decline',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-403,-400,-403,'ReviewWithFeedback-ReviewPending-Refine','Refine',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-404,-403,-403,'ReviewWithFeedback-RefinePending-Save','Save',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-405,-403,-403,'ReviewWithFeedback-RefinePending-Delegate','Delegate',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-406,-403,-400,'ReviewWithFeedback-RefinePending-Execute','Execute',1)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-407,-400,-407,'ReviewWithFeedback-ReviewPending-Abort','Abort',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-408,-407,-408,'ReviewWithFeedback-Aborted-Purge','Purge',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-500,-500,-500,'ContinueWith-Invoked-Invoke','Invoke',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-600,-600,-600,'Persist-Invoked-Invoke','Invoke',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
MERGE "UW_ActivityTemplateTransitions" AS TARGET USING (values(-700,-700,-700,'PersistOnlyResources-Invoked-Invoke','Invoke',0)) AS SOURCE("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "FromState_Id"=SOURCE."FromState_Id","ToState_Id"=SOURCE."ToState_Id","Identifier"=SOURCE."Identifier","IsBatchActor"=SOURCE."IsBatchActor" WHEN NOT MATCHED THEN INSERT("Id","FromState_Id","ToState_Id","Identifier","DisplayName_L1","IsBatchActor") VALUES(SOURCE."Id", SOURCE."FromState_Id",SOURCE."ToState_Id",SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."IsBatchActor");
GO
/*
Menus
*/
MERGE "UI_MenuItems" AS TARGET USING (values(-1,'Dashboard','Dashboard',0)) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayOrder") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayOrder"=SOURCE."DisplayOrder" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayOrder") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayOrder");
MERGE "UI_MenuItems" AS TARGET USING (values(-2,'Nav','Nav',0)) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayOrder") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayOrder"=SOURCE."DisplayOrder" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayOrder") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayOrder");
MERGE "UI_MenuItems" AS TARGET USING (values(-3,'UserMenu','UserMenu',0)) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayOrder") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayOrder"=SOURCE."DisplayOrder" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayOrder") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayOrder");
MERGE "UI_MenuItems" AS TARGET USING (values(-4,'Reports','Reports',0)) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayOrder") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayOrder"=SOURCE."DisplayOrder" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayOrder") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayOrder");
MERGE "UI_MenuItems" AS TARGET USING (values(-5,'Top','Top',0)) AS SOURCE("Id","Identifier","DisplayName_L1","DisplayOrder") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","DisplayOrder"=SOURCE."DisplayOrder" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1","DisplayOrder") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1",SOURCE."DisplayOrder");
GO
/*
Access Controls
*/
MERGE "UA_ProfileContexts" AS TARGET USING (values(-1,0)) AS SOURCE("Id","IsAutomatic") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "IsAutomatic"=SOURCE."IsAutomatic" WHEN NOT MATCHED THEN INSERT("Id","IsAutomatic") VALUES(SOURCE."Id", SOURCE."IsAutomatic");
GO
/*
Connection package
*/
DELETE "UC_ConnectionPackages" WHERE "Id" NOT IN (-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-22,-23,-25,-26,-27,-28,-29,-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-44,-45,-47,-48,-49,-50,-51,-52);
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-1,'Usercube.AD@0000001','True','True','False','1','1','0','AD,Active Directory,LDAP,Microsoft','USERCUBE','Directory/Active Directory','Manages users and groups in Active Directory. This package supports incremental synchronization with the DirSync mechanism.','True','https://www.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-2,'Usercube.LDAP@0000001','True','True','False','3','1','0','Directory,LDAP','USERCUBE','Directory/Generic LDAP','Manages entries in an LDAP compliant directory.','False','')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-3,'Usercube.AzureAD@0000001','True','True','False','2','2','0','Azure,Azure Active Directory,Microsoft,Entra','USERCUBE','Directory/Microsoft Entra ID','Manages users and groups in Microsoft Entra ID. This package supports incremental synchronization with the delta API.','True','https://azure.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-4,'Usercube.OpenLDAP@0000001','True','True','False','5','1','0','Directory,LDAP,Open LDAP','USERCUBE','Directory/Open LDAP','Manages entries in Open LDAP. This package supports incremental synchronization with the sysrepl mechanism.','True','')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-5,'Usercube.SnowTicket@0000001','False','True','False','0','9','10','Ticket,ServiceNow,Manual','USERCUBE','Ticket/ServiceNow','Opens tickets in ServiceNow for the manual provisioning.','True','https://www.servicenow.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-6,'Usercube.Manual@0000001','False','True','False','0','13','0','Ticket,Usercube,Manual','USERCUBE','Ticket/Usercube','Opens manual provisioning tickets in Usercube.','False','https://www.netwrix.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-7,'Usercube.Powershell@0000001','False','True','False','0','6','0','','USERCUBE','Custom/PowerShellProv','Fulfills an external system with a custom PowerShell script.','False','https://azure.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-8,'Usercube.SCIM@0000001','True','True','False','8','7','0','','USERCUBE','Custom/SCIM','Manages entities in SCIM compatible application.','True','https://www.simplecloud.info/img/logo/SCIM_B-and-W_72x24.png')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-9,'Usercube.RACF@0000001','True','False','False','6','0','0','Mainframe,RACF,IBM,AS400,ZOS,z/OS','USERCUBE','Mainframe/RACF','Exports the RACF users and profiles.','False','https://www.ibm.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-10,'Usercube.TSS@0000001','True','False','False','11','0','0','Mainframe,TSS,Top Secret,CA,Computer Associate,AS400,ZOS,z/OS','USERCUBE','Mainframe/Top Secret','Exports the Top Secret users and profiles.','False','https://www.broadcom.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-11,'Usercube.SAP@0000001','True','True','False','7','5','0','ERP,SAP,Netweaver','USERCUBE','ERP/SAP Netweaver','Manages users and roles in SAP Netweaver.','False','https://www.sap.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-12,'Usercube.Workday@0000001','True','False','False','13','0','0','','USERCUBE','ERP/Workday','Manages users and groups in Workday.','False','https://www.workday.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-13,'Usercube.SharedFolder@0000001','True','False','False','12','0','0','','USERCUBE','Storage/Shared Folders','Manages users and permissions in Shared Folders.','False','https://azure.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-14,'Usercube.LDIF@0000001','True','False','False','4','0','0','','USERCUBE','Directory/LDIF','Exports entries from a LDIF file.','False','')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-15,'Usercube.SQL@0000001','True','False','False','17','0','0','','USERCUBE','Database/Generic SQL','Exports data from a SQL database.','False','')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-16,'Usercube.FulfillToFile@0000001','False','True','False','0','11','0','','USERCUBE','Custom/JSON','Generate JSON files for each provisioning order. These JSON can then be used by custom scripts.','False','https://www.netwrix.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-17,'Usercube.FulfillWorkflow@0000001','False','True','False','0','3','0','','USERCUBE','Usercube/Workflow','Triggers workflows in Usercube for each provisioning order.','False','https://www.netwrix.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-18,'Usercube.SharePoint@0000001','True','True','False','10','8','0','','USERCUBE','Storage/SharePoint','Exports sites, folders, SharePoint groups and permissions.','True','https://azure.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-19,'Usercube.ServiceNow@0000001','True','True','False','9','4','0','','USERCUBE','ITSM/ServiceNow','Manages any data in the CMDB, including users and roles. This package supports incremental synchronization.','True','https://www.servicenow.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-20,'Usercube.CSV@0000001','True','False','False','15','0','0','','USERCUBE','File/CSV','Exports CSV to prepare synchronization.','True','')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-22,'Usercube.MicrosoftExchange@0000001','True','True','False','14','6','0','','USERCUBE','Server/Microsoft Exchange','Manages Microsoft Exchange mailboxes. This package supports incremental synchronization.','True','https://www.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-23,'Usercube.Excel@0000001','True','False','False','16','0','0','','USERCUBE','File/Excel','Exports Excel data sheets.','True','https://www.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-25,'Usercube.LDAP.Oracle@0000001','True','True','False','3','1','0','','USERCUBE','Directory/Oracle LDAP','Manages entries in Oracle Internet Directory.','False','https://www.oracle.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-26,'Usercube.LDAP.Apache@0000001','True','True','False','3','1','0','','USERCUBE','Directory/Apache Directory','Manages users and groups in Apache Directory.','False','https://apache.org/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-27,'Usercube.LDAP.RedHat@0000001','True','True','False','3','1','0','','USERCUBE','Directory/Red Hat Directory Server','Manages entries in a Red Hat Directory Server.','False','https://www.redhat.com/misc/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-28,'Usercube.SQL.Oracle@0000001','True','False','False','17','0','0','','USERCUBE','Database/Oracle','Exports data from an Oracle database.','False','https://www.oracle.com/asset/web/favicons/favicon-128.png')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-29,'Usercube.SQL.MySQL@0000001','True','False','False','17','0','0','','USERCUBE','Database/MySQL','Exports data from a MySQL database.','False','https://labs.mysql.com/common/themes/sakila/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-30,'Usercube.SQL.ODBC@0000001','True','False','False','17','0','0','','USERCUBE','Database/ODBC','Exports data from a generic ODBC compatible database.','False','')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-31,'Usercube.SQL.PostgreSQL@0000001','True','False','False','17','0','0','','USERCUBE','Database/PostgreSQL','Exports data from a PostgreSQL database.','False','https://www.postgresql.org/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-32,'Usercube.SQL.SQLServer@0000001','True','False','False','17','0','0','Microsoft,SQL,Server,Database','USERCUBE','Database/Microsoft SQL Server','Exports data from a Microsoft SQL Server database.','False','https://www.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-33,'Usercube.SCIM.Salesforce@0000001','True','True','False','8','7','0','','USERCUBE','CRM/Salesforce','Manages Salesforce entities.','True','https://www.salesforce.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-34,'Usercube.SCIM.CyberArk@0000001','True','True','False','8','7','0','','USERCUBE','PAM/CyberArk','Manages CyberArk entities, including user and group assignments.','False','https://www.cyberark.com/wp-content/themes/understrap-child/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-35,'Usercube.Custom@0000001','False','False','False','0','0','0','','USERCUBE','Custom/Unplugged','Manages an unplugged system with a completely custom data model.','False','https://www.netwrix.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-36,'Usercube.FulfillDatabase@0000001','False','True','False','0','12','0','','USERCUBE','Usercube/Database','Updates the Usercube database for each provisioning order. This package is used for HR systems, master data or other Usercube instances.','False','https://www.netwrix.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-37,'Usercube.RobotFramework@0000001','False','True','False','0','14','0','','USERCUBE','Custom/Robot Framework','Fulfills an external system using a Robot Framework script.','False','https://robotframework.org/img/icons/favicon-32x32.png')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-38,'Usercube.UpdateManualProvisioningTicket@0000001','False','True','False','0','15','13','Ticket,Usercube,Manual','USERCUBE','Ticket/Usercube And Create/Update/Delete resources','Opens manual provisioning tickets in Usercube.','False','https://www.netwrix.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-39,'Usercube.SQL.SQLServerEntitlements@0000001','True','False','False','18','0','0','SQL,Server,Entitlements,Microsoft','USERCUBE','Database/Microsoft SQL Server Entitlements','Exports Microsoft SQL Server Entitlements','False','https://www.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-40,'Usercube.HomeFolder@0000001','True','False','False','19','0','0','','USERCUBE','Storage/Home Folders','Manages Home Folders.','False','https://www.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-41,'Usercube.SQL.SAPAse@0000001','True','False','False','17','0','0','SQL,Server,ASE,ERP,Sysbase,SAP','USERCUBE','Database/SAP ASE','Exports data from a SAP ASE database.','False','https://www.sap.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-42,'Usercube.SAP.ERP60@0000001','True','True','False','20','16','0','ERP,SAP,HANA','USERCUBE','ERP/SAP ERP 6.0 and S/4HANA','Manages users and roles in SAP ERP 6.0 and SAP S/4HANA.','False','https://www.sap.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-43,'Usercube.EasyVista@0000001','True','True','False','21','19','0','EasyVista','USERCUBE','ITSM/EasyVista','Manages users in EasyVista.','True','https://www.easyvista.com/hs-fs/hubfs/Website%20Images/Logos/EV%20-%20Icon@4x.png')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-44,'Usercube.EasyVistaTicket@0000001','False','True','False','0','17','18','Ticket,EasyVista,Manual','USERCUBE','Ticket/EasyVista','Opens tickets in EasyVista for the manual provisioning.','False','https://www.easyvista.com/hs-fs/hubfs/Website%20Images/Logos/EV%20-%20Icon@4x.png')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-45,'Usercube.Azure@0000001','True','False','False','22','0','0','','USERCUBE','Cloud/Azure','Retrieve Azure resources and roles.','False','https://azure.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-47,'Usercube.SCIM.Slack@0000001','True','True','False','8','7','0','','USERCUBE','Messaging/Slack','Manage Slack entities.','True','https://www.slack.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-48,'Usercube.GoogleWorkspace@0000001','True','True','False','23','20','0','','USERCUBE','Directory/Google Workspace','Manage Google Workspace entities.','False','https://workspace.google.fr/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-49,'Usercube.OData@0000001','True','False','False','24','0','0','','USERCUBE','Custom/OData','Manage entities through OData protocol','False','https://www.odata.org/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-50,'Usercube.PowershellSync@0000001','True','False','False','25','0','0','','USERCUBE','Custom/PowerShellSync','Use a Powershell script to generate CSV export.','True','https://azure.microsoft.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-51,'Usercube.Okta@0000001','True','True','False','26','21','0','Okta','USERCUBE','Directory/Okta','Manages users, groups and apps in Okta. This package supports incremental synchronization based on last update dates.','True','https://www.okta.com/favicon.ico')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
MERGE "UC_ConnectionPackages" AS TARGET USING (values(-52,'Usercube.SCIM.Wallix@0000001','True','True','False','8','7','0','','USERCUBE','PAM/Wallix','Manages Wallix entities, including user and group assignments.','False','https://www.wallix.com/wp-content/uploads/2024/02/cropped-LOGO_X_WALLIX-32x32.png')) AS SOURCE("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","ImplementsEntityTypeMapping"=SOURCE."ImplementsEntityTypeMapping","ImplementsResourceTypeMapping"=SOURCE."ImplementsResourceTypeMapping","ImplementsConfiguration"=SOURCE."ImplementsConfiguration","ExportType"=SOURCE."ExportType","FulfillmentType"=SOURCE."FulfillmentType","InducedFulfillment"=SOURCE."InducedFulfillment","Keywords"=SOURCE."Keywords","Publisher"=SOURCE."Publisher","Description_L1"=SOURCE."Description_L1","HasIncrementalMode"=SOURCE."HasIncrementalMode","LogoUrl"=SOURCE."LogoUrl" WHEN NOT MATCHED THEN INSERT("Id","Identifier","ImplementsEntityTypeMapping","ImplementsResourceTypeMapping","ImplementsConfiguration","ExportType","FulfillmentType","InducedFulfillment","Keywords","Publisher","DisplayName_L1","Description_L1","HasIncrementalMode","LogoUrl") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."ImplementsEntityTypeMapping",SOURCE."ImplementsResourceTypeMapping",SOURCE."ImplementsConfiguration",SOURCE."ExportType",SOURCE."FulfillmentType",SOURCE."InducedFulfillment",SOURCE."Keywords",SOURCE."Publisher",SOURCE."DisplayName_L1",SOURCE."Description_L1",SOURCE."HasIncrementalMode",SOURCE."LogoUrl");
GO
/*
Provisioning Policy
*/
MERGE "UP_Contexts" AS TARGET USING (values(1,0)) AS SOURCE("Id","Automatic") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Automatic"=SOURCE."Automatic" WHEN NOT MATCHED THEN INSERT("Id","Automatic") VALUES(SOURCE."Id", SOURCE."Automatic");
GO
/*
WorkflowState
*/
MERGE "UP_WorkflowStates" AS TARGET USING (values(0,'None','None')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(1,'Found','Found')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(2,'RequestedWithMissingParameters','RequestedWithMissingParameters')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(3,'Historic','Historic')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(4,'Requested','Requested')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(5,'PolicyWithMissingParameters','PolicyWithMissingParameters')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(8,'PendingApproval','PendingApproval')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(9,'PendingApproval1','PendingApproval1')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(10,'PendingApproval2','PendingApproval2')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(11,'PendingApproval13','PendingApproval13')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(12,'PendingApproval23','PendingApproval23')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(13,'PendingApproval33','PendingApproval33')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(16,'Approved','Approved')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(17,'Declined','Declined')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(18,'PolicyApproved','PolicyApproved')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(19,'Inactive','Inactive')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(20,'Cancellation','Cancellation')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(21,'Suggested','Suggested')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(22,'Suggested2','Suggested2')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(23,'RequestedAutomatically','RequestedAutomatically')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(24,'ApprovedWithChanges','ApprovedWithChanges')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(25,'PendingRiskApproval','PendingRiskApproval')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(26,'Blocked','Blocked')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
MERGE "UP_WorkflowStates" AS TARGET USING (values(27,'Prolonged','Prolonged')) AS SOURCE("Id","Identifier","DisplayName_L1") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier" WHEN NOT MATCHED THEN INSERT("Id","Identifier","DisplayName_L1") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."DisplayName_L1");
GO
DELETE "UP_WorkflowStates" WHERE "Id" NOT IN(0,1,2,3,4,5,8,9,10,11,12,13,16,17,18,19,20,21,22,23,24,25,26,27)
GO
/*
Product Version
*/
MERGE "UM_Settings" AS TARGET USING (values(-1,'ProductVersion','6.1.005','','')) AS SOURCE("Id","Identifier","C0","C1","C2") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","C0"=SOURCE."C0","C1"=SOURCE."C1","C2"=SOURCE."C2" WHEN NOT MATCHED THEN INSERT("Id","Identifier","C0","C1","C2") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."C0",SOURCE."C1",SOURCE."C2");
GO
MERGE "UM_Settings" AS t USING (SELECT 'MigrationVersion',20240411cleanup ) AS s ("Identifier","C0") ON (t."Identifier"=s."Identifier") WHEN MATCHED THEN UPDATE SET "C0"=s."C0" WHEN NOT MATCHED THEN INSERT ("Id","Identifier","C0") VALUES ((SELECT MIN(Id) FROM UM_Settings)-1,s."Identifier",s."C0");
GO
/*
OpenIdClientApplyProfile flag
*/
MERGE "UM_Settings" AS TARGET USING (values(-1000,'OpenIdClientApplyProfile',1)) AS SOURCE("Id","Identifier","C0") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "Identifier"=SOURCE."Identifier","C0"=SOURCE."C0" WHEN NOT MATCHED THEN INSERT("Id","Identifier","C0") VALUES(SOURCE."Id", SOURCE."Identifier",SOURCE."C0");
GO
/*
Sequences for resources
*/
INSERT INTO "UM_Sequences"("Id","Value") SELECT 2147483670, 1 WHERE NOT EXISTS (SELECT "Id" FROM "UM_Sequences" WHERE "Id"=2147483670);
GO
/*
Sequences for policy contexts
*/
INSERT INTO "UM_Sequences"("Id","Value") SELECT 2147483662, 100 WHERE NOT EXISTS (SELECT "Id" FROM "UM_Sequences" WHERE "Id"=2147483662);
GO
/*
-----------------------------------------------------------------------------
****       THIS SCRIPT IS AUTO GENERATED, DO NOT MODIFY MANUALLY.        ****
-----------------------------------------------------------------------------
*/


CREATE TABLE #tmp_um_entitytypes(id BIGINT NOT NULL PRIMARY KEY, identifier NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS  NOT NULL, tablename NVARCHAR(443) NULL);
CREATE TABLE #tmp_um_entityproperties(id BIGINT NOT NULL PRIMARY KEY, entitytype_id BIGINT NOT NULL, identifier NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL, [type] INT NOT NULL, targetcolumnindex INT NOT NULL, neutralproperty_id BIGINT NULL, targetentitytype BIGINT NULL);
CREATE TABLE #tmp_um_entityassociations(id BIGINT NOT NULL PRIMARY KEY,property1_id BIGINT NOT NULL,property2_id BIGINT NOT NULL,identifier NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,isproperty1collection BIT NOT NULL,isproperty2collection BIT NOT NULL);
CREATE TABLE #tmp_uj_jobs(id BIGINT NOT NULL PRIMARY KEY, identifier NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL, displayname_l1 NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL, userstartdenied BIT, loglevel INT);
CREATE TABLE #tmp_uj_tasks(id BIGINT NOT NULL PRIMARY KEY, identifier NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL, displayname_l1 NVARCHAR(443) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL, tasktype INT, inputpath NVARCHAR(4000), loglevel INT);
CREATE TABLE #tmp_uj_jobsteps(id BIGINT NOT NULL PRIMARY KEY, task_id BIGINT NOT NULL, job_id BIGINT NOT NULL, launchorder INT, level INT);
INSERT INTO "#tmp_um_entitytypes"("id","identifier","tablename") VALUES
 (2147483653, 'AssignedCompositeRole','UP_AssignedCompositeRoles')
,(2147483654, 'AssignedResourceNavigation','UP_AssignedResourceNavigations')
,(2147483655, 'AssignedResourceScalar','UP_AssignedResourceScalars')
,(2147483656, 'AssignedResourceType','UP_AssignedResourceTypes')
,(2147483657, 'AssignedSingleRole','UP_AssignedSingleRoles')
,(2147483658, 'AssignedResourceError',NULL)
,(2147483659, 'IdentifiedRisk','UP_IdentifiedRisks')
,(2147483660, 'Risk','UP_Risks')
,(2147483662, 'Context',NULL)
,(2147483667, 'SingleRole','UP_SingleRoles')
,(2147483668, 'Category','UP_Categories')
,(2147483669, 'Policy','UP_Policies')
,(2147483670, 'Resource','UR_Resources')
,(2147483671, 'ResourceType','UP_ResourceTypes')
,(2147483672, 'ResourceFile','UR_ResourceFiles')
,(2147483673, 'Connector',NULL)
,(2147483675, 'EntityType',NULL)
,(2147483676, 'EntityProperty',NULL)
,(2147483677, 'EntityAssociation',NULL)
,(2147483680, 'CompositeRoleRule','UP_CompositeRoleRules')
,(2147483681, 'SingleRoleRule','UP_SingleRoleRules')
,(2147483682, 'ResourceTypeRule','UP_ResourceTypeRules')
,(2147483683, 'ResourceNavigationRule',NULL)
,(2147483685, 'Dimension',NULL)
,(2147483687, 'DisplayTable',NULL)
,(2147483689, 'DisplayTableColumn',NULL)
,(2147483690, 'Binding',NULL)
,(2147483691, 'BindingItem',NULL)
,(2147483693, 'CompositeRole','UP_CompositeRoles')
,(2147483694, 'RoleCounter',NULL)
,(2147483697, 'TileDesignElement',NULL)
,(2147483698, 'Tile',NULL)
,(2147483699, 'TileItem',NULL)
,(2147483700, 'Activity',NULL)
,(2147483701, 'Workflow',NULL)
,(2147483702, 'ActivityTemplate',NULL)
,(2147483703, 'ActivityTemplateState',NULL)
,(2147483704, 'ActivityTemplateTransition',NULL)
,(2147483705, 'DisplayTableDesignElement',NULL)
,(2147483706, 'WorkflowInstance',NULL)
,(2147483707, 'SearchBar',NULL)
,(2147483708, 'SearchBarCriterion',NULL)
,(2147483709, 'ActivityInstance',NULL)
,(2147483710, 'PointCut',NULL)
,(2147483711, 'Aspect',NULL)
,(2147483715, 'DisplayEntityType',NULL)
,(2147483716, 'DisplayEntityAssociation',NULL)
,(2147483717, 'DisplayEntityProperty',NULL)
,(2147483720, 'HomonymEntityLink',NULL)
,(2147483721, 'ResourceTypeMapping',NULL)
,(2147483722, 'ResourcePropertyMapping',NULL)
,(2147483723, 'PasswordResetSetting',NULL)
,(2147483800, 'EntityTypeMapping',NULL)
,(2147483801, 'EntityPropertyMapping',NULL)
,(2147483802, 'EntityAssociationMapping',NULL)
,(2147483803, 'Form',NULL)
,(2147483804, 'FormControl',NULL)
,(2147483805, 'Setting',NULL)
,(2147483806, 'ResourceScalarRule','UP_ResourceScalarRules')
,(2147483807, 'Profile',NULL)
,(2147483808, 'AssignedProfile',NULL)
,(2147483809, 'ProfileContext',NULL)
,(2147483811, 'Task',NULL)
,(2147483812, 'Agent',NULL)
,(2147483819, 'Indicator',NULL)
,(2147483820, 'IndicatorItem',NULL)
,(2147483845, 'Job',NULL)
,(2147483846, 'JobStep',NULL)
,(2147483847, 'TaskEntityType',NULL)
,(2147483848, 'TaskResourceType',NULL)
,(2147483849, 'JobInstance',NULL)
,(2147483850, 'TaskInstance',NULL)
,(2147483851, 'TaskDimension',NULL)
,(2147483852, 'TaskDependOnTask',NULL)
,(2147483869, 'AssignedResourceBinary',NULL)
,(2147483900, 'ReportQuery',NULL)
,(2147483910, 'OpenIdClient',NULL)
,(2147483911, 'ResourceCorrelationRule',NULL)
,(2147483912, 'AccessCertificationCampaign','US_AccessCertificationCampaigns')
,(2147483913, 'AccessCertificationItem','US_AccessCertificationItems')
,(2147483914, 'Language',NULL)
,(2147483915, 'ContextRule',NULL)
,(2147483916, 'AccessCertificationOwnerFilter',NULL)
,(2147483917, 'AccessCertificationDataFilter',NULL)
,(2147483918, 'ResourceQueryRule',NULL)
,(2147483919, 'ForwardedCertificationItem',NULL)
,(2147483920, 'Universe',NULL)
,(2147483921, 'EntityInstance',NULL)
,(2147483922, 'RiskRule','UP_RiskRules')
,(2147483923, 'RiskRuleItem','UP_RiskRuleItems')
,(2147483924, 'AccessCertificationCampaignPolicy','US_AccessCertificationCampaignPolicies')
,(2147483925, 'ResourceRiskScore','UP_ResourceRiskScores')
,(2147483926, 'Connection',NULL)
,(2147483927, 'ConnectionTable',NULL)
,(2147483928, 'ConnectionColumn',NULL)
,(2147483929, 'ConnectionPackage',NULL)
,(2147483930, 'RoleMapping','UP_RoleMappings')
,(2147483931, 'RoleMappingRule',NULL)
,(2147483932, 'RoleMappingRuleItem',NULL)
,(2147483933, 'EntityPropertyExpression',NULL)
,(2147483934, 'AssociationInstance',NULL)
,(2147483935, 'ResourceClassificationRule','UP_ResourceClassificationRules')
,(2147483936, 'ConnectionTransformation',NULL)
,(2147483980, 'AccessControlEntry',NULL)
,(2147483981, 'AccessControlFilter',NULL)
,(2147483982, 'AccessControlPermission',NULL)
,(2147483983, 'AccessControlRule',NULL)
,(2147483984, 'PolicySimulation',NULL)
,(2147483985, 'MiningRule','UP_MiningRules')
,(2147483986, 'HomonymEntityLinkFilter',NULL)
,(2147483987, 'DisplayPropertyGroup',NULL)
,(2147483989, 'ProfileRuleContext',NULL)
,(2147484926, 'AutomationRule','UP_AutomationRules')
,(2147491000, 'ResourceBinaryRule',NULL)
,(2147491100, 'PendingWork',NULL)
;INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223372015379939328, 2147483653,'Id',3,-1,NULL,NULL)
,(-9223372015379939327, 2147483653,'Role',12,-1,NULL,2147483693)
,(-9223372015379939326, 2147483653,'Owner',12,-1,NULL,2147483670)
,(-9223372015379939325, 2147483653,'ParametersContext',12,-1,NULL,2147483662)
,(-9223372015379939324, 2147483653,'WorkflowState',9,-1,NULL,NULL)
,(-9223372015379939322, 2147483653,'IsDenied',5,-1,NULL,NULL)
,(-9223372015379939320, 2147483653,'StartDate',4,-1,NULL,NULL)
,(-9223372015379939319, 2147483653,'EndDate',4,-1,NULL,NULL)
,(-9223372015379939318, 2147483653,'RoleId',3,-1,NULL,NULL)
,(-9223372015379939317, 2147483653,'OwnerId',3,-1,NULL,NULL)
,(-9223372015379939316, 2147483653,'ParametersContextId',3,-1,NULL,NULL)
,(-9223372015379939313, 2147483653,'WorkflowInstance',12,-1,NULL,NULL)
,(-9223372015379939312, 2147483653,'WorkflowInstanceId',3,-1,NULL,NULL)
,(-9223372015379939311, 2147483653,'WhenCreated',4,-1,NULL,NULL)
,(-9223372015379939310, 2147483653,'WhenPerformed',4,-1,NULL,NULL)
,(-9223372015379939309, 2147483653,'Performer',12,-1,NULL,2147483670)
,(-9223372015379939308, 2147483653,'PerformerId',3,-1,NULL,NULL)
,(-9223372015379939307, 2147483653,'IsInferred',5,-1,NULL,NULL)
,(-9223372015379939306, 2147483653,'AccessCertificationItems',12,-1,NULL,NULL)
,(-9223372015379939305, 2147483653,'ReconciliationComment',0,-1,NULL,NULL)
,(-9223372015379939278, 2147483653,'Requester',12,-1,NULL,2147483670)
,(-9223372015379939277, 2147483653,'RequesterId',3,-1,NULL,NULL)
,(-9223372015379939276, 2147483653,'WhenReviewed1',4,-1,NULL,NULL)
,(-9223372015379939275, 2147483653,'Reviewer1',3,-1,NULL,2147483670)
,(-9223372015379939274, 2147483653,'Reviewer1Id',-1,-1,NULL,NULL)
,(-9223372015379939273, 2147483653,'WhenReviewed2',4,-1,NULL,NULL)
,(-9223372015379939272, 2147483653,'Reviewer2',3,-1,NULL,2147483670)
,(-9223372015379939271, 2147483653,'Reviewer2Id',-1,-1,NULL,NULL)
,(-9223372015379939270, 2147483653,'WhenReviewed3',4,-1,NULL,NULL)
,(-9223372015379939269, 2147483653,'Reviewer3',3,-1,NULL,2147483670)
,(-9223372015379939268, 2147483653,'Reviewer3Id',-1,-1,NULL,NULL)
,(-9223372015379939267, 2147483653,'ReviewComment1',0,-1,NULL,NULL)
,(-9223372015379939266, 2147483653,'ReviewComment2',0,-1,NULL,NULL)
,(-9223372015379939265, 2147483653,'ReviewComment3',0,-1,NULL,NULL)
,(-9223372015379939264, 2147483653,'OwnerType',3,-1,NULL,NULL)
,(-9223372015379939263, 2147483653,'WhenRiskReviewed',4,-1,NULL,NULL)
,(-9223372015379939262, 2147483653,'RiskReviewer',3,-1,NULL,2147483670)
,(-9223372015379939261, 2147483653,'RiskReviewerId',-1,-1,NULL,NULL)
,(-9223372015379939260, 2147483653,'RiskReviewComment',0,-1,NULL,NULL)
,(-9223372015379939259, 2147483653,'IsIndirect',5,-1,NULL,NULL)
,(-9223372015379939258, 2147483653,'RequestComment',0,-1,NULL,NULL)
,(-9223372015379939257, 2147483653,'RedundantAssignment',5,-1,NULL,NULL)
,(-9223372011084972032, 2147483654,'Id',3,-1,NULL,NULL)
,(-9223372011084972031, 2147483654,'AssignedResourceType',12,-1,NULL,2147483656)
,(-9223372011084972030, 2147483654,'Property',12,-1,NULL,2147483676)
,(-9223372011084972029, 2147483654,'Resource',12,-1,NULL,2147483670)
,(-9223372011084972028, 2147483654,'WorkflowState',9,-1,NULL,NULL)
,(-9223372011084972027, 2147483654,'IsDenied',5,-1,NULL,NULL)
,(-9223372011084972026, 2147483654,'ProvisioningState',9,-1,NULL,NULL)
,(-9223372011084972025, 2147483654,'StartDate',4,-1,NULL,NULL)
,(-9223372011084972024, 2147483654,'EndDate',4,-1,NULL,NULL)
,(-9223372011084972023, 2147483654,'AssignedResourceTypeId',3,-1,NULL,NULL)
,(-9223372011084972022, 2147483654,'PropertyId',3,-1,NULL,NULL)
,(-9223372011084972021, 2147483654,'ResourceId',3,-1,NULL,NULL)
,(-9223372011084972020, 2147483654,'ConfidenceLevel',9,-1,NULL,NULL)
,(-9223372011084972015, 2147483654,'WhenCreated',4,-1,NULL,NULL)
,(-9223372011084972014, 2147483654,'WhenPerformed',4,-1,NULL,NULL)
,(-9223372011084972013, 2147483654,'Performer',12,-1,NULL,2147483670)
,(-9223372011084972012, 2147483654,'PerformerId',3,-1,NULL,NULL)
,(-9223372011084972011, 2147483654,'PolicyResource',12,-1,NULL,2147483670)
,(-9223372011084972010, 2147483654,'AccessCertificationItems',12,-1,NULL,NULL)
,(-9223372011084972009, 2147483654,'PolicyResourceId',3,-1,NULL,NULL)
,(-9223372011084971966, 2147483654,'OwnerId',3,-1,NULL,NULL)
,(-9223372011084971965, 2147483654,'OwnerType',3,-1,NULL,NULL)
,(-9223372011084971964, 2147483654,'Owner',12,-1,NULL,2147483670)
,(-9223372011084971963, 2147483654,'IsIndirect',5,-1,NULL,NULL)
,(-9223372011084971962, 2147483654,'IsInferred',5,-1,NULL,NULL)
,(-9223372006790004736, 2147483655,'Id',3,-1,NULL,NULL)
,(-9223372006790004735, 2147483655,'AssignedResourceType',12,-1,NULL,2147483656)
,(-9223372006790004734, 2147483655,'Property',12,-1,NULL,2147483676)
,(-9223372006790004733, 2147483655,'Value',0,-1,NULL,NULL)
,(-9223372006790004732, 2147483655,'WorkflowState',9,-1,NULL,NULL)
,(-9223372006790004731, 2147483655,'ProvisioningState',9,-1,NULL,NULL)
,(-9223372006790004730, 2147483655,'StartDate',4,-1,NULL,NULL)
,(-9223372006790004729, 2147483655,'EndDate',4,-1,NULL,NULL)
,(-9223372006790004728, 2147483655,'AssignedResourceTypeId',3,-1,NULL,NULL)
,(-9223372006790004727, 2147483655,'PropertyId',3,-1,NULL,NULL)
,(-9223372006790004719, 2147483655,'WhenCreated',4,-1,NULL,NULL)
,(-9223372006790004718, 2147483655,'WhenPerformed',4,-1,NULL,NULL)
,(-9223372006790004717, 2147483655,'Performer',12,-1,NULL,2147483670)
,(-9223372006790004716, 2147483655,'PerformerId',3,-1,NULL,NULL)
,(-9223372006790004715, 2147483655,'PolicyValue',0,-1,NULL,NULL)
,(-9223372006790004714, 2147483655,'AccessCertificationItems',12,-1,NULL,NULL)
,(-9223372006790004670, 2147483655,'OwnerId',3,-1,NULL,NULL)
,(-9223372006790004669, 2147483655,'OwnerType',3,-1,NULL,NULL)
,(-9223372006790004668, 2147483655,'Owner',12,-1,NULL,2147483670)
,(-9223372002495037440, 2147483656,'Id',3,-1,NULL,NULL)
,(-9223372002495037439, 2147483656,'Role',12,-1,NULL,2147483671)
,(-9223372002495037438, 2147483656,'Owner',12,-1,NULL,2147483670)
,(-9223372002495037437, 2147483656,'Resource',12,-1,NULL,2147483670)
,(-9223372002495037436, 2147483656,'ParametersContext',12,-1,NULL,2147483662)
,(-9223372002495037435, 2147483656,'WorkflowState',9,-1,NULL,NULL)
,(-9223372002495037434, 2147483656,'IsDenied',5,-1,NULL,NULL)
,(-9223372002495037433, 2147483656,'ProvisioningState',9,-1,NULL,NULL)
,(-9223372002495037432, 2147483656,'StartDate',4,-1,NULL,NULL)
,(-9223372002495037431, 2147483656,'EndDate',4,-1,NULL,NULL)
,(-9223372002495037430, 2147483656,'AssignedResourceNavigations',12,-1,NULL,NULL)
,(-9223372002495037429, 2147483656,'AssignedResourceScalars',12,-1,NULL,NULL)
,(-9223372002495037428, 2147483656,'RoleId',3,-1,NULL,NULL)
,(-9223372002495037427, 2147483656,'ParametersContextId',3,-1,NULL,NULL)
,(-9223372002495037426, 2147483656,'OwnerId',3,-1,NULL,NULL)
,(-9223372002495037425, 2147483656,'ResourceId',3,-1,NULL,NULL)
,(-9223372002495037424, 2147483656,'SourceMatchedConfidenceLevel',9,-1,NULL,NULL)
,(-9223372002495037423, 2147483656,'ResourceTypeIdentificationConfidenceLevel',9,-1,NULL,NULL)
,(-9223372002495037422, 2147483656,'NeedsPolicyApplication',5,-1,NULL,NULL)
,(-9223372002495037421, 2147483656,'OwnerType',3,-1,NULL,NULL)
,(-9223372002495037420, 2147483656,'WorkflowInstance',12,-1,NULL,NULL)
,(-9223372002495037419, 2147483656,'WorkflowInstanceId',3,-1,NULL,NULL)
,(-9223372002495037418, 2147483656,'ConsolidatedWorkflowBlockedState',9,-1,NULL,NULL)
,(-9223372002495037417, 2147483656,'ConsolidatedWorkflowBlockedCount',10,-1,NULL,NULL)
,(-9223372002495037416, 2147483656,'WhenCreated',4,-1,NULL,NULL)
,(-9223372002495037415, 2147483656,'WhenPerformed',4,-1,NULL,NULL)
,(-9223372002495037414, 2147483656,'Performer',12,-1,NULL,2147483670)
,(-9223372002495037413, 2147483656,'PerformerId',3,-1,NULL,NULL)
,(-9223372002495037412, 2147483656,'ManualProvisioningState',9,-1,NULL,NULL)
,(-9223372002495037411, 2147483656,'ConsolidatedWorkflowFoundState',9,-1,NULL,NULL)
,(-9223372002495037410, 2147483656,'ConsolidatedWorkflowFoundCount',10,-1,NULL,NULL)
,(-9223372002495037409, 2147483656,'ConsolidatedWorkflowReviewState',9,-1,NULL,NULL)
,(-9223372002495037408, 2147483656,'ConsolidatedWorkflowReviewCount',10,-1,NULL,NULL)
,(-9223372002495037407, 2147483656,'AssignedResourceErrors',12,-1,NULL,NULL)
,(-9223372002495037406, 2147483656,'AccessCertificationItems',12,-1,NULL,NULL)
,(-9223372002495037404, 2147483656,'ConsolidatedProvisioningState',9,-1,NULL,NULL)
,(-9223372002495037403, 2147483656,'ConsolidatedAssignedResourceTypeErrorCount',10,-1,NULL,NULL)
,(-9223372002495037402, 2147483656,'IsInferred',5,-1,NULL,NULL)
,(-9223372002495037401, 2147483656,'HasPendingOrders',5,-1,NULL,NULL)
,(-9223372002495037400, 2147483656,'ReconciliationComment',0,-1,NULL,NULL)
,(-9223372002495037390, 2147483656,'Requester',12,-1,NULL,2147483670)
,(-9223372002495037389, 2147483656,'RequesterId',3,-1,NULL,NULL)
,(-9223372002495037388, 2147483656,'WhenReviewed1',4,-1,NULL,NULL)
,(-9223372002495037387, 2147483656,'Reviewer1',3,-1,NULL,2147483670)
,(-9223372002495037386, 2147483656,'Reviewer1Id',-1,-1,NULL,NULL)
,(-9223372002495037385, 2147483656,'WhenReviewed2',4,-1,NULL,NULL)
,(-9223372002495037384, 2147483656,'Reviewer2',3,-1,NULL,2147483670)
,(-9223372002495037383, 2147483656,'Reviewer2Id',-1,-1,NULL,NULL)
,(-9223372002495037382, 2147483656,'WhenReviewed3',4,-1,NULL,NULL)
,(-9223372002495037381, 2147483656,'Reviewer3',3,-1,NULL,2147483670)
,(-9223372002495037380, 2147483656,'Reviewer3Id',-1,-1,NULL,NULL)
,(-9223372002495037379, 2147483656,'ReviewComment1',0,-1,NULL,NULL)
,(-9223372002495037378, 2147483656,'ReviewComment2',0,-1,NULL,NULL)
,(-9223372002495037377, 2147483656,'ReviewComment3',0,-1,NULL,NULL)
,(-9223372002495037370, 2147483656,'Arguments',0,-1,NULL,NULL)
,(-9223372002495037369, 2147483656,'ProvisioningReviewFilter',9,-1,NULL,NULL)
,(-9223372002495037368, 2147483656,'RequestComment',0,-1,NULL,NULL)
,(-9223372002495037367, 2147483656,'RedundantAssignment',5,-1,NULL,NULL)
,(-9223372002495037321, 2147483656,'AssignedResourceBinaries',12,-1,NULL,NULL)
,(-9223371998200070144, 2147483657,'Id',3,-1,NULL,NULL)
,(-9223371998200070143, 2147483657,'Role',12,-1,NULL,2147483667)
,(-9223371998200070142, 2147483657,'Owner',12,-1,NULL,2147483670)
,(-9223371998200070141, 2147483657,'ParametersContext',12,-1,NULL,2147483662)
,(-9223371998200070140, 2147483657,'WorkflowState',9,-1,NULL,NULL)
,(-9223371998200070138, 2147483657,'IsDenied',5,-1,NULL,NULL)
,(-9223371998200070136, 2147483657,'StartDate',4,-1,NULL,NULL)
,(-9223371998200070135, 2147483657,'EndDate',4,-1,NULL,NULL)
,(-9223371998200070134, 2147483657,'RoleId',3,-1,NULL,NULL)
,(-9223371998200070133, 2147483657,'OwnerId',3,-1,NULL,NULL)
,(-9223371998200070132, 2147483657,'ParametersContextId',3,-1,NULL,NULL)
,(-9223371998200070130, 2147483657,'WorkflowInstance',12,-1,NULL,NULL)
,(-9223371998200070129, 2147483657,'WorkflowInstanceId',3,-1,NULL,NULL)
,(-9223371998200070128, 2147483657,'WhenCreated',4,-1,NULL,NULL)
,(-9223371998200070127, 2147483657,'WhenPerformed',4,-1,NULL,NULL)
,(-9223371998200070126, 2147483657,'Performer',12,-1,NULL,2147483670)
,(-9223371998200070125, 2147483657,'PerformerId',3,-1,NULL,NULL)
,(-9223371998200070124, 2147483657,'IsInferred',5,-1,NULL,NULL)
,(-9223371998200070123, 2147483657,'ReconciliationComment',0,-1,NULL,NULL)
,(-9223371998200070122, 2147483657,'AccessCertificationItems',12,-1,NULL,NULL)
,(-9223371998200070094, 2147483657,'Requester',12,-1,NULL,2147483670)
,(-9223371998200070093, 2147483657,'RequesterId',3,-1,NULL,NULL)
,(-9223371998200070092, 2147483657,'WhenReviewed1',4,-1,NULL,NULL)
,(-9223371998200070091, 2147483657,'Reviewer1',3,-1,NULL,2147483670)
,(-9223371998200070090, 2147483657,'Reviewer1Id',-1,-1,NULL,NULL)
,(-9223371998200070089, 2147483657,'WhenReviewed2',4,-1,NULL,NULL)
,(-9223371998200070088, 2147483657,'Reviewer2',3,-1,NULL,2147483670)
,(-9223371998200070087, 2147483657,'Reviewer2Id',-1,-1,NULL,NULL)
,(-9223371998200070086, 2147483657,'WhenReviewed3',4,-1,NULL,NULL)
,(-9223371998200070085, 2147483657,'Reviewer3',3,-1,NULL,2147483670)
,(-9223371998200070084, 2147483657,'Reviewer3Id',-1,-1,NULL,NULL)
,(-9223371998200070083, 2147483657,'ReviewComment1',0,-1,NULL,NULL)
,(-9223371998200070082, 2147483657,'ReviewComment2',0,-1,NULL,NULL)
,(-9223371998200070081, 2147483657,'ReviewComment3',0,-1,NULL,NULL)
,(-9223371998200070080, 2147483657,'OwnerType',3,-1,NULL,NULL)
,(-9223371998200070079, 2147483657,'WhenRiskReviewed',4,-1,NULL,NULL)
,(-9223371998200070078, 2147483657,'RiskReviewer',3,-1,NULL,2147483670)
,(-9223371998200070077, 2147483657,'RiskReviewerId',-1,-1,NULL,NULL)
,(-9223371998200070076, 2147483657,'RiskReviewComment',0,-1,NULL,NULL)
,(-9223371998200070075, 2147483657,'IsIndirect',5,-1,NULL,NULL)
,(-9223371998200070074, 2147483657,'RequestComment',0,-1,NULL,NULL)
,(-9223371998200070073, 2147483657,'RedundantAssignment',5,-1,NULL,NULL)
,(-9223371993905102848, 2147483658,'Id',3,-1,NULL,NULL)
,(-9223371993905102847, 2147483658,'AssignedResourceTypeId',3,-1,NULL,NULL)
,(-9223371993905102846, 2147483658,'JobInstanceId',3,-1,NULL,NULL)
,(-9223371993905102845, 2147483658,'ErrorCode',2,-1,NULL,NULL)
,(-9223371993905102844, 2147483658,'ErrorMessage',0,-1,NULL,NULL)
,(-9223371993905102843, 2147483658,'AssignedResourceType',12,-1,NULL,2147483656)
,(-9223371993905102842, 2147483658,'JobInstance',-1,-1,NULL,NULL)
,(-9223371989610135552, 2147483659,'Id',3,-1,NULL,NULL)
,(-9223371989610135551, 2147483659,'RiskId',3,-1,NULL,NULL)
,(-9223371989610135550, 2147483659,'Risk',12,-1,NULL,2147483660)
,(-9223371989610135549, 2147483659,'OwnerId',3,-1,NULL,NULL)
,(-9223371989610135548, 2147483659,'Owner',12,-1,NULL,2147483670)
,(-9223371989610135547, 2147483659,'StartDate',4,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371989610135546, 2147483659,'EndDate',4,-1,NULL,NULL)
,(-9223371989610135545, 2147483659,'WorkflowInstanceId',3,-1,NULL,NULL)
,(-9223371989610135544, 2147483659,'WorkflowInstance',-1,-1,NULL,NULL)
,(-9223371989610135543, 2147483659,'OwnerType',3,-1,NULL,NULL)
,(-9223371985315168256, 2147483660,'Id',3,-1,NULL,NULL)
,(-9223371985315168255, 2147483660,'DisplayName',0,-1,NULL,NULL)
,(-9223371985315168254, 2147483660,'Description',0,-1,NULL,NULL)
,(-9223371985315168253, 2147483660,'Level',2,-1,NULL,NULL)
,(-9223371985315168252, 2147483660,'IdentifiedRisks',12,-1,NULL,NULL)
,(-9223371985315168251, 2147483660,'PolicyId',3,-1,NULL,NULL)
,(-9223371985315168250, 2147483660,'Policy',12,-1,NULL,2147483669)
,(-9223371985315168249, 2147483660,'RiskType',9,-1,NULL,NULL)
,(-9223371985315168248, 2147483660,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371985315168247, 2147483660,'EntityType',12,-1,NULL,2147483675)
,(-9223371985315168246, 2147483660,'RulesId',-1,-1,NULL,NULL)
,(-9223371985315168245, 2147483660,'Rules',12,-1,NULL,NULL)
,(-9223371985315168243, 2147483660,'ExemptionPolicy',9,-1,NULL,NULL)
,(-9223371985315168239, 2147483660,'Identifier',0,-1,NULL,NULL)
,(-9223371985315168237, 2147483660,'DisplayName_L1',0,-1,-9223371985315168255,NULL)
,(-9223371985315168236, 2147483660,'DisplayName_L2',0,-1,-9223371985315168255,NULL)
,(-9223371985315168235, 2147483660,'DisplayName_L3',0,-1,-9223371985315168255,NULL)
,(-9223371985315168234, 2147483660,'DisplayName_L4',0,-1,-9223371985315168255,NULL)
,(-9223371985315168233, 2147483660,'DisplayName_L5',0,-1,-9223371985315168255,NULL)
,(-9223371985315168232, 2147483660,'DisplayName_L6',0,-1,-9223371985315168255,NULL)
,(-9223371985315168231, 2147483660,'DisplayName_L7',0,-1,-9223371985315168255,NULL)
,(-9223371985315168230, 2147483660,'DisplayName_L8',0,-1,-9223371985315168255,NULL)
,(-9223371985315168227, 2147483660,'Description_L1',0,-1,-9223371985315168254,NULL)
,(-9223371985315168226, 2147483660,'Description_L2',0,-1,-9223371985315168254,NULL)
,(-9223371985315168225, 2147483660,'Description_L3',0,-1,-9223371985315168254,NULL)
,(-9223371985315168224, 2147483660,'Description_L4',0,-1,-9223371985315168254,NULL)
,(-9223371985315168223, 2147483660,'Description_L5',0,-1,-9223371985315168254,NULL)
,(-9223371985315168222, 2147483660,'Description_L6',0,-1,-9223371985315168254,NULL)
,(-9223371985315168221, 2147483660,'Description_L7',0,-1,-9223371985315168254,NULL)
,(-9223371985315168220, 2147483660,'Description_L8',0,-1,-9223371985315168254,NULL)
,(-9223371985315168219, 2147483660,'Remediation',0,-1,NULL,NULL)
,(-9223371985315168218, 2147483660,'Remediation_L1',0,-1,-9223371985315168219,NULL)
,(-9223371985315168217, 2147483660,'Remediation_L2',0,-1,-9223371985315168219,NULL)
,(-9223371985315168216, 2147483660,'Remediation_L3',0,-1,-9223371985315168219,NULL)
,(-9223371985315168215, 2147483660,'Remediation_L4',0,-1,-9223371985315168219,NULL)
,(-9223371985315168214, 2147483660,'Remediation_L5',0,-1,-9223371985315168219,NULL)
,(-9223371985315168213, 2147483660,'Remediation_L6',0,-1,-9223371985315168219,NULL)
,(-9223371985315168212, 2147483660,'Remediation_L7',0,-1,-9223371985315168219,NULL)
,(-9223371985315168211, 2147483660,'Remediation_L8',0,-1,-9223371985315168219,NULL)
,(-9223371985315168210, 2147483660,'RuleItems',12,-1,NULL,NULL)
,(-9223371985315168209, 2147483660,'AccessCertificationDataFilter',12,-1,NULL,2147483917)
,(-9223371985315168208, 2147483660,'AccessCertificationOwnerFilter',12,-1,NULL,2147483916)
,(-9223371985315168186, 2147483660,'Description_L9',0,-1,-9223371985315168254,NULL)
,(-9223371985315168185, 2147483660,'Description_L10',0,-1,-9223371985315168254,NULL)
,(-9223371985315168184, 2147483660,'Description_L11',0,-1,-9223371985315168254,NULL)
,(-9223371985315168183, 2147483660,'Description_L12',0,-1,-9223371985315168254,NULL)
,(-9223371985315168182, 2147483660,'Description_L13',0,-1,-9223371985315168254,NULL)
,(-9223371985315168181, 2147483660,'Description_L14',0,-1,-9223371985315168254,NULL)
,(-9223371985315168180, 2147483660,'Description_L15',0,-1,-9223371985315168254,NULL)
,(-9223371985315168179, 2147483660,'Description_L16',0,-1,-9223371985315168254,NULL)
,(-9223371985315168176, 2147483660,'DisplayName_L9',0,-1,-9223371985315168255,NULL)
,(-9223371985315168175, 2147483660,'DisplayName_L10',0,-1,-9223371985315168255,NULL)
,(-9223371985315168174, 2147483660,'DisplayName_L11',0,-1,-9223371985315168255,NULL)
,(-9223371985315168173, 2147483660,'DisplayName_L12',0,-1,-9223371985315168255,NULL)
,(-9223371985315168172, 2147483660,'DisplayName_L13',0,-1,-9223371985315168255,NULL)
,(-9223371985315168171, 2147483660,'DisplayName_L14',0,-1,-9223371985315168255,NULL)
,(-9223371985315168170, 2147483660,'DisplayName_L15',0,-1,-9223371985315168255,NULL)
,(-9223371985315168169, 2147483660,'DisplayName_L16',0,-1,-9223371985315168255,NULL)
,(-9223371985315168166, 2147483660,'Remediation_L9',0,-1,-9223371985315168219,NULL)
,(-9223371985315168165, 2147483660,'Remediation_L10',0,-1,-9223371985315168219,NULL)
,(-9223371985315168164, 2147483660,'Remediation_L11',0,-1,-9223371985315168219,NULL)
,(-9223371985315168163, 2147483660,'Remediation_L12',0,-1,-9223371985315168219,NULL)
,(-9223371985315168162, 2147483660,'Remediation_L13',0,-1,-9223371985315168219,NULL)
,(-9223371985315168161, 2147483660,'Remediation_L14',0,-1,-9223371985315168219,NULL)
,(-9223371985315168160, 2147483660,'Remediation_L15',0,-1,-9223371985315168219,NULL)
,(-9223371985315168159, 2147483660,'Remediation_L16',0,-1,-9223371985315168219,NULL)
,(-9223371985315168128, 2147483660,'WhenCreated',4,-1,NULL,NULL)
,(-9223371985315168127, 2147483660,'CreatedById',3,-1,NULL,NULL)
,(-9223371985315168126, 2147483660,'CreatedBy',12,-1,NULL,NULL)
,(-9223371985315168125, 2147483660,'WhenChanged',4,-1,NULL,NULL)
,(-9223371985315168124, 2147483660,'ChangedById',3,-1,NULL,NULL)
,(-9223371985315168123, 2147483660,'ChangedBy',12,-1,NULL,NULL)
,(-9223371976725233664, 2147483662,'Id',3,-1,NULL,NULL)
,(-9223371976725233663, 2147483662,'Automatic',5,-1,NULL,NULL)
,(-9223371976725233659, 2147483662,'ParametersAssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371976725233657, 2147483662,'ParametersAssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371976725233655, 2147483662,'ParametersAssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371976725233654, 2147483662,'DisplayName',0,-1,NULL,NULL)
,(-9223371976725233653, 2147483662,'DisplayName_L1',0,-1,-9223371976725233654,NULL)
,(-9223371976725233652, 2147483662,'DisplayName_L2',0,-1,-9223371976725233654,NULL)
,(-9223371976725233651, 2147483662,'DisplayName_L3',0,-1,-9223371976725233654,NULL)
,(-9223371976725233650, 2147483662,'DisplayName_L4',0,-1,-9223371976725233654,NULL)
,(-9223371976725233649, 2147483662,'DisplayName_L5',0,-1,-9223371976725233654,NULL)
,(-9223371976725233648, 2147483662,'DisplayName_L6',0,-1,-9223371976725233654,NULL)
,(-9223371976725233647, 2147483662,'DisplayName_L7',0,-1,-9223371976725233654,NULL)
,(-9223371976725233646, 2147483662,'DisplayName_L8',0,-1,-9223371976725233654,NULL)
,(-9223371976725233645, 2147483662,'DisplayName_L9',0,-1,-9223371976725233654,NULL)
,(-9223371976725233644, 2147483662,'DisplayName_L10',0,-1,-9223371976725233654,NULL)
,(-9223371976725233643, 2147483662,'DisplayName_L11',0,-1,-9223371976725233654,NULL)
,(-9223371976725233642, 2147483662,'DisplayName_L12',0,-1,-9223371976725233654,NULL)
,(-9223371976725233641, 2147483662,'DisplayName_L13',0,-1,-9223371976725233654,NULL)
,(-9223371976725233640, 2147483662,'DisplayName_L14',0,-1,-9223371976725233654,NULL)
,(-9223371976725233639, 2147483662,'DisplayName_L15',0,-1,-9223371976725233654,NULL)
,(-9223371976725233638, 2147483662,'DisplayName_L16',0,-1,-9223371976725233654,NULL)
,(-9223371955250397184, 2147483667,'Id',3,-1,NULL,NULL)
,(-9223371955250397183, 2147483667,'DisplayName',0,-1,NULL,NULL)
,(-9223371955250397182, 2147483667,'Description',0,-1,NULL,NULL)
,(-9223371955250397181, 2147483667,'Category',12,-1,NULL,2147483668)
,(-9223371955250397180, 2147483667,'CategoryId',3,-1,NULL,NULL)
,(-9223371955250397179, 2147483667,'Policy',12,-1,NULL,2147483669)
,(-9223371955250397178, 2147483667,'PolicyId',3,-1,NULL,NULL)
,(-9223371955250397177, 2147483667,'EntityType',12,-1,NULL,2147483675)
,(-9223371955250397176, 2147483667,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371955250397175, 2147483667,'AssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371955250397173, 2147483667,'SingleRoleRules',12,-1,NULL,NULL)
,(-9223371955250397172, 2147483667,'SingleRoleRulesId',-1,-1,NULL,NULL)
,(-9223371955250397171, 2147483667,'ResourceTypeRules',12,-1,NULL,NULL)
,(-9223371955250397170, 2147483667,'ResourceTypeRulesId',-1,-1,NULL,NULL)
,(-9223371955250397169, 2147483667,'ResourceNavigationRules',12,-1,NULL,NULL)
,(-9223371955250397168, 2147483667,'ResourceNavigationRulesId',-1,-1,NULL,NULL)
,(-9223371955250397167, 2147483667,'Identifier',0,-1,NULL,NULL)
,(-9223371955250397166, 2147483667,'ApprovalWorkflowType',2,-1,NULL,NULL)
,(-9223371955250397165, 2147483667,'DisplayName_L1',0,-1,-9223371955250397183,NULL)
,(-9223371955250397164, 2147483667,'DisplayName_L2',0,-1,-9223371955250397183,NULL)
,(-9223371955250397163, 2147483667,'DisplayName_L3',0,-1,-9223371955250397183,NULL)
,(-9223371955250397162, 2147483667,'DisplayName_L4',0,-1,-9223371955250397183,NULL)
,(-9223371955250397161, 2147483667,'DisplayName_L5',0,-1,-9223371955250397183,NULL)
,(-9223371955250397160, 2147483667,'DisplayName_L6',0,-1,-9223371955250397183,NULL)
,(-9223371955250397159, 2147483667,'DisplayName_L7',0,-1,-9223371955250397183,NULL)
,(-9223371955250397158, 2147483667,'DisplayName_L8',0,-1,-9223371955250397183,NULL)
,(-9223371955250397156, 2147483667,'SecondaryCategories',12,-1,NULL,2147483668)
,(-9223371955250397155, 2147483667,'Description_L1',0,-1,-9223371955250397182,NULL)
,(-9223371955250397154, 2147483667,'Description_L2',0,-1,-9223371955250397182,NULL)
,(-9223371955250397153, 2147483667,'Description_L3',0,-1,-9223371955250397182,NULL)
,(-9223371955250397152, 2147483667,'Description_L4',0,-1,-9223371955250397182,NULL)
,(-9223371955250397151, 2147483667,'Description_L5',0,-1,-9223371955250397182,NULL)
,(-9223371955250397150, 2147483667,'Description_L6',0,-1,-9223371955250397182,NULL)
,(-9223371955250397149, 2147483667,'Description_L7',0,-1,-9223371955250397182,NULL)
,(-9223371955250397148, 2147483667,'Description_L8',0,-1,-9223371955250397182,NULL)
,(-9223371955250397147, 2147483667,'ProfileContexts',12,-1,NULL,NULL)
,(-9223371955250397146, 2147483667,'ResourceScalarRules',12,-1,NULL,NULL)
,(-9223371955250397145, 2147483667,'ResourceScalarRulesId',-1,-1,NULL,NULL)
,(-9223371955250397144, 2147483667,'FullName',0,-1,NULL,NULL)
,(-9223371955250397143, 2147483667,'FullName_L1',0,-1,-9223371955250397144,NULL)
,(-9223371955250397142, 2147483667,'FullName_L2',0,-1,-9223371955250397144,NULL)
,(-9223371955250397141, 2147483667,'FullName_L3',0,-1,-9223371955250397144,NULL)
,(-9223371955250397140, 2147483667,'FullName_L4',0,-1,-9223371955250397144,NULL)
,(-9223371955250397139, 2147483667,'FullName_L5',0,-1,-9223371955250397144,NULL)
,(-9223371955250397138, 2147483667,'FullName_L6',0,-1,-9223371955250397144,NULL)
,(-9223371955250397137, 2147483667,'FullName_L7',0,-1,-9223371955250397144,NULL)
,(-9223371955250397136, 2147483667,'FullName_L8',0,-1,-9223371955250397144,NULL)
,(-9223371955250397134, 2147483667,'HideOnSimplifiedView',5,-1,NULL,NULL)
,(-9223371955250397133, 2147483667,'CommentActivationOnApproveInReview',9,-1,NULL,NULL)
,(-9223371955250397132, 2147483667,'CommentActivationOnDeclineInReview',9,-1,NULL,NULL)
,(-9223371955250397131, 2147483667,'CommentActivationOnDeleteGapInReconciliation',9,-1,NULL,NULL)
,(-9223371955250397130, 2147483667,'CommentActivationOnKeepGapInReconciliation',9,-1,NULL,NULL)
,(-9223371955250397129, 2147483667,'State',9,-1,NULL,NULL)
,(-9223371955250397128, 2147483667,'ImplicitApproval',9,-1,NULL,NULL)
,(-9223371955250397127, 2147483667,'BaseRoleId',-1,-1,NULL,NULL)
,(-9223371955250397126, 2147483667,'BaseRole',12,-1,NULL,2147483667)
,(-9223371955250397125, 2147483667,'RoleBase',12,-1,NULL,NULL)
,(-9223371955250397124, 2147483667,'MaxDuration',2,-1,NULL,NULL)
,(-9223371955250397123, 2147483667,'GracePeriod',2,-1,NULL,NULL)
,(-9223371955250397122, 2147483667,'ProlongationWithoutApproval',9,-1,NULL,NULL)
,(-9223371955250397114, 2147483667,'Description_L9',0,-1,-9223371955250397182,NULL)
,(-9223371955250397113, 2147483667,'Description_L10',0,-1,-9223371955250397182,NULL)
,(-9223371955250397112, 2147483667,'Description_L11',0,-1,-9223371955250397182,NULL)
,(-9223371955250397111, 2147483667,'Description_L12',0,-1,-9223371955250397182,NULL)
,(-9223371955250397110, 2147483667,'Description_L13',0,-1,-9223371955250397182,NULL)
,(-9223371955250397109, 2147483667,'Description_L14',0,-1,-9223371955250397182,NULL)
,(-9223371955250397108, 2147483667,'Description_L15',0,-1,-9223371955250397182,NULL)
,(-9223371955250397107, 2147483667,'Description_L16',0,-1,-9223371955250397182,NULL)
,(-9223371955250397104, 2147483667,'DisplayName_L9',0,-1,-9223371955250397183,NULL)
,(-9223371955250397103, 2147483667,'DisplayName_L10',0,-1,-9223371955250397183,NULL)
,(-9223371955250397102, 2147483667,'DisplayName_L11',0,-1,-9223371955250397183,NULL)
,(-9223371955250397101, 2147483667,'DisplayName_L12',0,-1,-9223371955250397183,NULL)
,(-9223371955250397100, 2147483667,'DisplayName_L13',0,-1,-9223371955250397183,NULL)
,(-9223371955250397099, 2147483667,'DisplayName_L14',0,-1,-9223371955250397183,NULL)
,(-9223371955250397098, 2147483667,'DisplayName_L15',0,-1,-9223371955250397183,NULL)
,(-9223371955250397097, 2147483667,'DisplayName_L16',0,-1,-9223371955250397183,NULL)
,(-9223371955250397094, 2147483667,'AutomationRules',12,-1,NULL,NULL)
,(-9223371955250397089, 2147483667,'ResourceBinaryRules',12,-1,NULL,NULL)
,(-9223371955250397074, 2147483667,'FullName_L9',0,-1,-9223371955250397144,NULL)
,(-9223371955250397073, 2147483667,'FullName_L10',0,-1,-9223371955250397144,NULL)
,(-9223371955250397072, 2147483667,'FullName_L11',0,-1,-9223371955250397144,NULL)
,(-9223371955250397071, 2147483667,'FullName_L12',0,-1,-9223371955250397144,NULL)
,(-9223371955250397070, 2147483667,'FullName_L13',0,-1,-9223371955250397144,NULL)
,(-9223371955250397069, 2147483667,'FullName_L14',0,-1,-9223371955250397144,NULL)
,(-9223371955250397068, 2147483667,'FullName_L15',0,-1,-9223371955250397144,NULL)
,(-9223371955250397067, 2147483667,'FullName_L16',0,-1,-9223371955250397144,NULL)
,(-9223371955250397066, 2147483667,'Tags',0,-1,NULL,NULL)
,(-9223371955250397064, 2147483667,'CommentActivationOnRequest',9,-1,NULL,NULL)
,(-9223371955250396672, 2147483667,'WhenCreated',4,-1,NULL,NULL)
,(-9223371955250396671, 2147483667,'CreatedById',3,-1,NULL,NULL)
,(-9223371955250396670, 2147483667,'CreatedBy',12,-1,NULL,NULL)
,(-9223371955250396669, 2147483667,'WhenChanged',4,-1,NULL,NULL)
,(-9223371955250396668, 2147483667,'ChangedById',3,-1,NULL,NULL)
,(-9223371955250396667, 2147483667,'ChangedBy',12,-1,NULL,NULL)
,(-9223371950955429888, 2147483668,'Id',3,-1,NULL,NULL)
,(-9223371950955429887, 2147483668,'DisplayName',0,-1,NULL,NULL)
,(-9223371950955429886, 2147483668,'Description',0,-1,NULL,NULL)
,(-9223371950955429885, 2147483668,'Categories',12,-1,NULL,2147483668)
,(-9223371950955429884, 2147483668,'CategoriesId',-1,-1,NULL,NULL)
,(-9223371950955429883, 2147483668,'Parent',12,-1,NULL,NULL)
,(-9223371950955429882, 2147483668,'ParentId',3,-1,NULL,NULL)
,(-9223371950955429881, 2147483668,'SingleRoles',12,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371950955429880, 2147483668,'SingleRolesId',-1,-1,NULL,NULL)
,(-9223371950955429879, 2147483668,'CurrentNodeIndex',-1,-1,NULL,NULL)
,(-9223371950955429878, 2147483668,'Policy',12,-1,NULL,2147483669)
,(-9223371950955429877, 2147483668,'PolicyId',3,-1,NULL,NULL)
,(-9223371950955429876, 2147483668,'CompositeRoles',12,-1,NULL,NULL)
,(-9223371950955429875, 2147483668,'CompositeRolesId',-1,-1,NULL,NULL)
,(-9223371950955429874, 2147483668,'ResourceTypes',12,-1,NULL,NULL)
,(-9223371950955429873, 2147483668,'ResourceTypesId',-1,-1,NULL,NULL)
,(-9223371950955429872, 2147483668,'Ancestors',12,-1,NULL,2147483668)
,(-9223371950955429871, 2147483668,'Descendants',12,-1,NULL,NULL)
,(-9223371950955429870, 2147483668,'SingleRoleCounter',-1,-1,NULL,NULL)
,(-9223371950955429869, 2147483668,'CompositeRoleCounter',-1,-1,NULL,NULL)
,(-9223371950955429868, 2147483668,'ResourceTypeCounter',-1,-1,NULL,NULL)
,(-9223371950955429867, 2147483668,'RoleCounters',12,-1,NULL,NULL)
,(-9223371950955429866, 2147483668,'Identifier',0,-1,NULL,NULL)
,(-9223371950955429865, 2147483668,'ProfileContexts',12,-1,NULL,NULL)
,(-9223371950955429864, 2147483668,'DisplayName_L1',0,-1,-9223371950955429887,NULL)
,(-9223371950955429863, 2147483668,'DisplayName_L2',0,-1,-9223371950955429887,NULL)
,(-9223371950955429862, 2147483668,'DisplayName_L3',0,-1,-9223371950955429887,NULL)
,(-9223371950955429861, 2147483668,'DisplayName_L4',0,-1,-9223371950955429887,NULL)
,(-9223371950955429860, 2147483668,'DisplayName_L5',0,-1,-9223371950955429887,NULL)
,(-9223371950955429859, 2147483668,'DisplayName_L6',0,-1,-9223371950955429887,NULL)
,(-9223371950955429858, 2147483668,'DisplayName_L7',0,-1,-9223371950955429887,NULL)
,(-9223371950955429857, 2147483668,'DisplayName_L8',0,-1,-9223371950955429887,NULL)
,(-9223371950955429856, 2147483668,'SecondaryResourceTypes',12,-1,NULL,NULL)
,(-9223371950955429855, 2147483668,'SecondarySingleRoles',12,-1,NULL,NULL)
,(-9223371950955429854, 2147483668,'SecondaryCompositeRoles',12,-1,NULL,NULL)
,(-9223371950955429853, 2147483668,'Description_L1',0,-1,-9223371950955429886,NULL)
,(-9223371950955429852, 2147483668,'Description_L2',0,-1,-9223371950955429886,NULL)
,(-9223371950955429851, 2147483668,'Description_L3',0,-1,-9223371950955429886,NULL)
,(-9223371950955429850, 2147483668,'Description_L4',0,-1,-9223371950955429886,NULL)
,(-9223371950955429849, 2147483668,'Description_L5',0,-1,-9223371950955429886,NULL)
,(-9223371950955429848, 2147483668,'Description_L6',0,-1,-9223371950955429886,NULL)
,(-9223371950955429847, 2147483668,'Description_L7',0,-1,-9223371950955429886,NULL)
,(-9223371950955429846, 2147483668,'Description_L8',0,-1,-9223371950955429886,NULL)
,(-9223371950955429845, 2147483668,'AccessCertificationDataFilters',12,-1,NULL,2147483917)
,(-9223371950955429844, 2147483668,'IsCollapsed',5,-1,NULL,NULL)
,(-9223371950955429843, 2147483668,'FullName_L1',0,-1,-9223371950955429835,NULL)
,(-9223371950955429842, 2147483668,'FullName_L2',0,-1,-9223371950955429835,NULL)
,(-9223371950955429841, 2147483668,'FullName_L3',0,-1,-9223371950955429835,NULL)
,(-9223371950955429840, 2147483668,'FullName_L4',0,-1,-9223371950955429835,NULL)
,(-9223371950955429839, 2147483668,'FullName_L5',0,-1,-9223371950955429835,NULL)
,(-9223371950955429838, 2147483668,'FullName_L6',0,-1,-9223371950955429835,NULL)
,(-9223371950955429837, 2147483668,'FullName_L7',0,-1,-9223371950955429835,NULL)
,(-9223371950955429836, 2147483668,'FullName_L8',0,-1,-9223371950955429835,NULL)
,(-9223371950955429835, 2147483668,'FullName',0,-1,NULL,NULL)
,(-9223371950955429834, 2147483668,'SelfAndAncestors',12,-1,NULL,2147483668)
,(-9223371950955429833, 2147483668,'SelfAndDescendants',12,-1,NULL,NULL)
,(-9223371950955429828, 2147483668,'RoleMappings',12,-1,NULL,NULL)
,(-9223371950955429818, 2147483668,'Description_L9',0,-1,-9223371950955429886,NULL)
,(-9223371950955429817, 2147483668,'Description_L10',0,-1,-9223371950955429886,NULL)
,(-9223371950955429816, 2147483668,'Description_L11',0,-1,-9223371950955429886,NULL)
,(-9223371950955429815, 2147483668,'Description_L12',0,-1,-9223371950955429886,NULL)
,(-9223371950955429814, 2147483668,'Description_L13',0,-1,-9223371950955429886,NULL)
,(-9223371950955429813, 2147483668,'Description_L14',0,-1,-9223371950955429886,NULL)
,(-9223371950955429812, 2147483668,'Description_L15',0,-1,-9223371950955429886,NULL)
,(-9223371950955429811, 2147483668,'Description_L16',0,-1,-9223371950955429886,NULL)
,(-9223371950955429808, 2147483668,'DisplayName_L9',0,-1,-9223371950955429887,NULL)
,(-9223371950955429807, 2147483668,'DisplayName_L10',0,-1,-9223371950955429887,NULL)
,(-9223371950955429806, 2147483668,'DisplayName_L11',0,-1,-9223371950955429887,NULL)
,(-9223371950955429805, 2147483668,'DisplayName_L12',0,-1,-9223371950955429887,NULL)
,(-9223371950955429804, 2147483668,'DisplayName_L13',0,-1,-9223371950955429887,NULL)
,(-9223371950955429803, 2147483668,'DisplayName_L14',0,-1,-9223371950955429887,NULL)
,(-9223371950955429802, 2147483668,'DisplayName_L15',0,-1,-9223371950955429887,NULL)
,(-9223371950955429801, 2147483668,'DisplayName_L16',0,-1,-9223371950955429887,NULL)
,(-9223371950955429798, 2147483668,'AutomationRules',12,-1,NULL,NULL)
,(-9223371950955429788, 2147483668,'FullName_L9',0,-1,-9223371950955429835,NULL)
,(-9223371950955429787, 2147483668,'FullName_L10',0,-1,-9223371950955429835,NULL)
,(-9223371950955429786, 2147483668,'FullName_L11',0,-1,-9223371950955429835,NULL)
,(-9223371950955429785, 2147483668,'FullName_L12',0,-1,-9223371950955429835,NULL)
,(-9223371950955429784, 2147483668,'FullName_L13',0,-1,-9223371950955429835,NULL)
,(-9223371950955429783, 2147483668,'FullName_L14',0,-1,-9223371950955429835,NULL)
,(-9223371950955429782, 2147483668,'FullName_L15',0,-1,-9223371950955429835,NULL)
,(-9223371950955429781, 2147483668,'FullName_L16',0,-1,-9223371950955429835,NULL)
,(-9223371950955429760, 2147483668,'WhenCreated',4,-1,NULL,NULL)
,(-9223371950955429759, 2147483668,'CreatedById',3,-1,NULL,NULL)
,(-9223371950955429758, 2147483668,'CreatedBy',12,-1,NULL,NULL)
,(-9223371950955429757, 2147483668,'WhenChanged',4,-1,NULL,NULL)
,(-9223371950955429756, 2147483668,'ChangedById',3,-1,NULL,NULL)
,(-9223371950955429755, 2147483668,'ChangedBy',12,-1,NULL,NULL)
,(-9223371950955429754, 2147483668,'MiningRules',12,-1,NULL,NULL)
,(-9223371946660462592, 2147483669,'Id',3,-1,NULL,NULL)
,(-9223371946660462591, 2147483669,'Identifier',0,-1,NULL,NULL)
,(-9223371946660462590, 2147483669,'IsProvisioningEnabled',5,-1,NULL,NULL)
,(-9223371946660462589, 2147483669,'Categories',12,-1,NULL,NULL)
,(-9223371946660462588, 2147483669,'CategoriesId',-1,-1,NULL,NULL)
,(-9223371946660462587, 2147483669,'SingleRoles',12,-1,NULL,NULL)
,(-9223371946660462586, 2147483669,'SingleRolesId',-1,-1,NULL,NULL)
,(-9223371946660462585, 2147483669,'CompositeRoles',12,-1,NULL,NULL)
,(-9223371946660462584, 2147483669,'CompositeRolesId',-1,-1,NULL,NULL)
,(-9223371946660462583, 2147483669,'ResourceTypes',12,-1,NULL,NULL)
,(-9223371946660462582, 2147483669,'ResourceTypesId',-1,-1,NULL,NULL)
,(-9223371946660462581, 2147483669,'CompositeRoleRules',12,-1,NULL,NULL)
,(-9223371946660462580, 2147483669,'CompositeRoleRulesId',-1,-1,NULL,NULL)
,(-9223371946660462579, 2147483669,'SingleRoleRules',12,-1,NULL,NULL)
,(-9223371946660462578, 2147483669,'SingleRoleRulesId',-1,-1,NULL,NULL)
,(-9223371946660462577, 2147483669,'ResourceTypeRules',12,-1,NULL,NULL)
,(-9223371946660462576, 2147483669,'ResourceTypeRulesId',-1,-1,NULL,NULL)
,(-9223371946660462575, 2147483669,'ResourceNavigationRules',12,-1,NULL,NULL)
,(-9223371946660462574, 2147483669,'ResourceNavigationRulesId',-1,-1,NULL,NULL)
,(-9223371946660462573, 2147483669,'DisplayName',0,-1,NULL,NULL)
,(-9223371946660462572, 2147483669,'ResourceScalarRules',12,-1,NULL,NULL)
,(-9223371946660462571, 2147483669,'ResourceScalarRulesId',-1,-1,NULL,NULL)
,(-9223371946660462570, 2147483669,'ResourceCorrelationRules',12,-1,NULL,NULL)
,(-9223371946660462569, 2147483669,'RoleCounters',12,-1,NULL,NULL)
,(-9223371946660462568, 2147483669,'IsSimulationEnabled',5,-1,NULL,NULL)
,(-9223371946660462567, 2147483669,'Risks',12,-1,NULL,NULL)
,(-9223371946660462566, 2147483669,'RisksId',-1,-1,NULL,NULL)
,(-9223371946660462565, 2147483669,'RiskRules',12,-1,NULL,NULL)
,(-9223371946660462564, 2147483669,'RiskRulesId',-1,-1,NULL,NULL)
,(-9223371946660462563, 2147483669,'IsExternal',5,-1,NULL,NULL)
,(-9223371946660462562, 2147483669,'CommentActivationOnApproveInReview',9,-1,NULL,NULL)
,(-9223371946660462561, 2147483669,'CommentActivationOnDeclineInReview',9,-1,NULL,NULL)
,(-9223371946660462560, 2147483669,'CommentActivationOnDeleteGapInReconciliation',9,-1,NULL,NULL)
,(-9223371946660462559, 2147483669,'CommentActivationOnKeepGapInReconciliation',9,-1,NULL,NULL)
,(-9223371946660462558, 2147483669,'HasImplicitApproval',5,-1,NULL,NULL)
,(-9223371946660462557, 2147483669,'PolicyProvisioningId',3,-1,NULL,NULL)
,(-9223371946660462556, 2147483669,'PolicyProvisioning',12,-1,NULL,2147483669)
,(-9223371946660462555, 2147483669,'ProvisioningPolicy',12,-1,NULL,NULL)
,(-9223371946660462554, 2147483669,'PolicySimulationId',3,-1,NULL,NULL)
,(-9223371946660462553, 2147483669,'PolicySimulation',12,-1,NULL,2147483669)
,(-9223371946660462552, 2147483669,'SimulationPolicy',12,-1,NULL,NULL)
,(-9223371946660462551, 2147483669,'AutomationRules',12,-1,NULL,NULL)
,(-9223371946660462550, 2147483669,'DisplayName_L14',0,-1,-9223371946660462573,NULL)
,(-9223371946660462549, 2147483669,'DisplayName_L15',0,-1,-9223371946660462573,NULL)
,(-9223371946660462548, 2147483669,'PolicyPolicySimulations',12,-1,NULL,NULL)
,(-9223371946660462547, 2147483669,'ResourceClassificationRules',12,-1,NULL,NULL)
,(-9223371946660462546, 2147483669,'DisplayName_L1',0,-1,-9223371946660462573,NULL)
,(-9223371946660462545, 2147483669,'DisplayName_L2',0,-1,-9223371946660462573,NULL)
,(-9223371946660462544, 2147483669,'DisplayName_L3',0,-1,-9223371946660462573,NULL)
,(-9223371946660462543, 2147483669,'DisplayName_L4',0,-1,-9223371946660462573,NULL)
,(-9223371946660462542, 2147483669,'DisplayName_L5',0,-1,-9223371946660462573,NULL)
,(-9223371946660462541, 2147483669,'DisplayName_L6',0,-1,-9223371946660462573,NULL)
,(-9223371946660462540, 2147483669,'DisplayName_L7',0,-1,-9223371946660462573,NULL)
,(-9223371946660462539, 2147483669,'DisplayName_L8',0,-1,-9223371946660462573,NULL)
,(-9223371946660462538, 2147483669,'ContextRules',12,-1,NULL,NULL)
,(-9223371946660462537, 2147483669,'ResourceQueryRules',12,-1,NULL,NULL)
,(-9223371946660462536, 2147483669,'DisplayName_L11',0,-1,-9223371946660462573,NULL)
,(-9223371946660462535, 2147483669,'DisplayName_L12',0,-1,-9223371946660462573,NULL)
,(-9223371946660462534, 2147483669,'DisplayName_L13',0,-1,-9223371946660462573,NULL)
,(-9223371946660462533, 2147483669,'ResourceBinaryRules',12,-1,NULL,NULL)
,(-9223371946660462532, 2147483669,'RoleMappings',12,-1,NULL,NULL)
,(-9223371946660462531, 2147483669,'DisplayName_L16',0,-1,-9223371946660462573,NULL)
,(-9223371946660462530, 2147483669,'DisplayName_L9',0,-1,-9223371946660462573,NULL)
,(-9223371946660462529, 2147483669,'DisplayName_L10',0,-1,-9223371946660462573,NULL)
,(-9223371946660462272, 2147483669,'MaxDuration',2,-1,NULL,NULL)
,(-9223371946660462271, 2147483669,'GracePeriod',2,-1,NULL,NULL)
,(-9223371946660462270, 2147483669,'ProlongationWithoutApproval',5,-1,NULL,NULL)
,(-9223371946660462269, 2147483669,'CommentActivationOnRequest',9,-1,NULL,NULL)
,(-9223371946660462080, 2147483669,'WhenCreated',4,-1,NULL,NULL)
,(-9223371946660462079, 2147483669,'CreatedById',3,-1,NULL,NULL)
,(-9223371946660462078, 2147483669,'CreatedBy',12,-1,NULL,NULL)
,(-9223371946660462077, 2147483669,'WhenChanged',4,-1,NULL,NULL)
,(-9223371946660462076, 2147483669,'ChangedById',3,-1,NULL,NULL)
,(-9223371946660462075, 2147483669,'ChangedBy',12,-1,NULL,NULL)
,(-9223371946660462074, 2147483669,'RoleRoleMappings',12,-1,NULL,NULL)
,(-9223371946660462073, 2147483669,'MiningRules',12,-1,NULL,NULL)
,(-9223371946660462072, 2147483669,'MiningRuleRules',12,-1,NULL,NULL)
,(-9223371942365495296, 2147483670,'Id',3,-1,NULL,NULL)
,(-9223371942365495295, 2147483670,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371942365495294, 2147483670,'InternalDisplayName',0,-1,NULL,NULL)
,(-9223371942365495293, 2147483670,'InternalDirty',5,-1,NULL,NULL)
,(-9223371942365495291, 2147483670,'ResourceAssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371942365495290, 2147483670,'OwnerAssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371942365495289, 2147483670,'AssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371942365495288, 2147483670,'AssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371942365495287, 2147483670,'CCActivityInstances',12,-1,NULL,NULL)
,(-9223371942365495286, 2147483670,'AssignedResourceNavigations',12,-1,NULL,NULL)
,(-9223371942365495285, 2147483670,'ResourceNavigationRules',12,-1,NULL,NULL)
,(-9223371942365495284, 2147483670,'ResourceNavigationRulesId',-1,-1,NULL,NULL)
,(-9223371942365495281, 2147483670,'PerformedActivityInstances',12,-1,NULL,NULL)
,(-9223371942365495280, 2147483670,'InvolvedActivityInstances',12,-1,NULL,NULL)
,(-9223371942365495279, 2147483670,'PerformerAssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371942365495278, 2147483670,'PerformerAssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371942365495277, 2147483670,'PerformerAssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371942365495276, 2147483670,'PerformerAssignedResourceNavigations',12,-1,NULL,NULL)
,(-9223371942365495275, 2147483670,'PerformerAssignedResourceScalars',12,-1,NULL,NULL)
,(-9223371942365495274, 2147483670,'IdentifiedRisks',12,-1,NULL,NULL)
,(-9223371942365495273, 2147483670,'PolicyAssignedResourceNavigations',12,-1,NULL,NULL)
,(-9223371942365495271, 2147483670,'ResourceRiskScore',12,-1,NULL,2147483925)
,(-9223371942365495270, 2147483670,'AssignedToActivityInstances',12,-1,NULL,NULL)
,(-9223371942365495269, 2147483670,'RiskRuleItems',12,-1,NULL,NULL)
,(-9223371942365495266, 2147483670,'AssignedProfiles',12,-1,NULL,NULL)
,(-9223371942365495265, 2147483670,'ReviewedAccessCertificationItems',12,-1,NULL,NULL)
,(-9223371942365495264, 2147483670,'AdministratedAccessCertificationItems',12,-1,NULL,NULL)
,(-9223371942365495263, 2147483670,'OwnedAccessCertificationItems',12,-1,NULL,NULL)
,(-9223371942365495262, 2147483670,'InternalDisplayName_L1',0,-1,-9223371942365495294,NULL)
,(-9223371942365495261, 2147483670,'InternalDisplayName_L2',0,-1,-9223371942365495294,NULL)
,(-9223371942365495260, 2147483670,'InternalDisplayName_L3',0,-1,-9223371942365495294,NULL)
,(-9223371942365495259, 2147483670,'InternalDisplayName_L4',0,-1,-9223371942365495294,NULL)
,(-9223371942365495258, 2147483670,'InternalDisplayName_L5',0,-1,-9223371942365495294,NULL)
,(-9223371942365495257, 2147483670,'InternalDisplayName_L6',0,-1,-9223371942365495294,NULL)
,(-9223371942365495256, 2147483670,'InternalDisplayName_L7',0,-1,-9223371942365495294,NULL)
,(-9223371942365495255, 2147483670,'InternalDisplayName_L8',0,-1,-9223371942365495294,NULL)
,(-9223371942365495254, 2147483670,'FromForwardedCertificationItems',12,-1,NULL,NULL)
,(-9223371942365495253, 2147483670,'ToForwardedCertificationItems',12,-1,NULL,NULL)
,(-9223371942365495252, 2147483670,'IndividualAccessCertificationOwnerFilters',12,-1,NULL,2147483916)
,(-9223371942365495246, 2147483670,'JobGroupInstance',12,-1,NULL,NULL)
,(-9223371942365495236, 2147483670,'RequesterAssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371942365495235, 2147483670,'RequesterAssignedSingleRoles',12,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371942365495234, 2147483670,'RequesterAssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371942365495233, 2147483670,'Reviewer1AssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371942365495232, 2147483670,'Reviewer1AssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371942365495231, 2147483670,'Reviewer1AssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371942365495230, 2147483670,'Reviewer2AssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371942365495229, 2147483670,'Reviewer2AssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371942365495228, 2147483670,'Reviewer2AssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371942365495227, 2147483670,'Reviewer3AssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371942365495226, 2147483670,'Reviewer3AssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371942365495225, 2147483670,'Reviewer3AssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371942365495224, 2147483670,'RiskReviewerAssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371942365495223, 2147483670,'RiskReviewerAssignedSingleRoles',12,-1,NULL,NULL)
,(-9223371942365495216, 2147483670,'InternalDisplayName_L9',0,-1,-9223371942365495294,NULL)
,(-9223371942365495215, 2147483670,'InternalDisplayName_L10',0,-1,-9223371942365495294,NULL)
,(-9223371942365495214, 2147483670,'InternalDisplayName_L11',0,-1,-9223371942365495294,NULL)
,(-9223371942365495213, 2147483670,'InternalDisplayName_L12',0,-1,-9223371942365495294,NULL)
,(-9223371942365495212, 2147483670,'InternalDisplayName_L13',0,-1,-9223371942365495294,NULL)
,(-9223371942365495211, 2147483670,'InternalDisplayName_L14',0,-1,-9223371942365495294,NULL)
,(-9223371942365495210, 2147483670,'InternalDisplayName_L15',0,-1,-9223371942365495294,NULL)
,(-9223371942365495209, 2147483670,'InternalDisplayName_L16',0,-1,-9223371942365495294,NULL)
,(-9223371942365495201, 2147483670,'PerformerAssignedResourceBinaries',12,-1,NULL,NULL)
,(-9223371942365495200, 2147483670,'OwnerAssignedResourceNavigations',12,-1,NULL,NULL)
,(-9223371942365495199, 2147483670,'OwnerAssignedResourceScalars',12,-1,NULL,NULL)
,(-9223371942365495198, 2147483670,'OwnerAssignedResourceBinaries',12,-1,NULL,NULL)
,(-9223371942365495041, 2147483670,'StartedPolicySimulations',12,-1,NULL,NULL)
,(-9223371942365495040, 2147483670,'categoriesCreated',12,-1,NULL,2147483668)
,(-9223371942365495039, 2147483670,'categoriesChanged',12,-1,NULL,2147483668)
,(-9223371942365495038, 2147483670,'compositerolesCreated',12,-1,NULL,2147483693)
,(-9223371942365495037, 2147483670,'compositerolesChanged',12,-1,NULL,2147483693)
,(-9223371942365495036, 2147483670,'compositerolerulesCreated',12,-1,NULL,2147483680)
,(-9223371942365495035, 2147483670,'compositerolerulesChanged',12,-1,NULL,2147483680)
,(-9223371942365495034, 2147483670,'contextrulesCreated',12,-1,NULL,2147483915)
,(-9223371942365495033, 2147483670,'contextrulesChanged',12,-1,NULL,2147483915)
,(-9223371942365495032, 2147483670,'policiesCreated',12,-1,NULL,2147483669)
,(-9223371942365495031, 2147483670,'policiesChanged',12,-1,NULL,2147483669)
,(-9223371942365495030, 2147483670,'resourcebinaryrulesCreated',12,-1,NULL,2147491000)
,(-9223371942365495029, 2147483670,'resourcebinaryrulesChanged',12,-1,NULL,2147491000)
,(-9223371942365495028, 2147483670,'resourceclassificationrulesCreated',12,-1,NULL,2147483935)
,(-9223371942365495027, 2147483670,'resourceclassificationrulesChanged',12,-1,NULL,2147483935)
,(-9223371942365495026, 2147483670,'resourcecorrelationrulesCreated',12,-1,NULL,2147483911)
,(-9223371942365495025, 2147483670,'resourcecorrelationrulesChanged',12,-1,NULL,2147483911)
,(-9223371942365495024, 2147483670,'resourcenavigationrulesCreated',12,-1,NULL,2147483683)
,(-9223371942365495023, 2147483670,'resourcenavigationrulesChanged',12,-1,NULL,2147483683)
,(-9223371942365495022, 2147483670,'resourcequeryrulesCreated',12,-1,NULL,2147483918)
,(-9223371942365495021, 2147483670,'resourcequeryrulesChanged',12,-1,NULL,2147483918)
,(-9223371942365495020, 2147483670,'resourcescalarrulesCreated',12,-1,NULL,2147483806)
,(-9223371942365495019, 2147483670,'resourcescalarrulesChanged',12,-1,NULL,2147483806)
,(-9223371942365495018, 2147483670,'resourcetypesCreated',12,-1,NULL,2147483671)
,(-9223371942365495017, 2147483670,'resourcetypesChanged',12,-1,NULL,2147483671)
,(-9223371942365495016, 2147483670,'resourcetyperulesCreated',12,-1,NULL,2147483682)
,(-9223371942365495015, 2147483670,'resourcetyperulesChanged',12,-1,NULL,2147483682)
,(-9223371942365495014, 2147483670,'risksCreated',12,-1,NULL,2147483660)
,(-9223371942365495013, 2147483670,'risksChanged',12,-1,NULL,2147483660)
,(-9223371942365495012, 2147483670,'rolemappingsCreated',12,-1,NULL,2147483930)
,(-9223371942365495011, 2147483670,'rolemappingsChanged',12,-1,NULL,2147483930)
,(-9223371942365495010, 2147483670,'rolemappingrulesCreated',12,-1,NULL,2147483931)
,(-9223371942365495009, 2147483670,'rolemappingrulesChanged',12,-1,NULL,2147483931)
,(-9223371942365495008, 2147483670,'rolemappingruleitemsCreated',12,-1,NULL,2147483932)
,(-9223371942365495007, 2147483670,'rolemappingruleitemsChanged',12,-1,NULL,2147483932)
,(-9223371942365495006, 2147483670,'singlerolesCreated',12,-1,NULL,2147483667)
,(-9223371942365495005, 2147483670,'singlerolesChanged',12,-1,NULL,2147483667)
,(-9223371942365495004, 2147483670,'singlerolerulesCreated',12,-1,NULL,2147483681)
,(-9223371942365495003, 2147483670,'singlerolerulesChanged',12,-1,NULL,2147483681)
,(-9223371942365495002, 2147483670,'automationrulesCreated',12,-1,NULL,2147484926)
,(-9223371942365495001, 2147483670,'automationrulesChanged',12,-1,NULL,2147484926)
,(-9223371938070528000, 2147483671,'Id',3,-1,NULL,NULL)
,(-9223371938070527999, 2147483671,'DisplayName',0,-1,NULL,NULL)
,(-9223371938070527998, 2147483671,'Description',0,-1,NULL,NULL)
,(-9223371938070527997, 2147483671,'Category',12,-1,NULL,2147483668)
,(-9223371938070527996, 2147483671,'CategoryId',3,-1,NULL,NULL)
,(-9223371938070527995, 2147483671,'Policy',12,-1,NULL,2147483669)
,(-9223371938070527994, 2147483671,'PolicyId',3,-1,NULL,NULL)
,(-9223371938070527993, 2147483671,'SourceEntityType',12,-1,NULL,2147483675)
,(-9223371938070527992, 2147483671,'SourceEntityTypeId',3,-1,NULL,NULL)
,(-9223371938070527991, 2147483671,'TargetEntityType',12,-1,NULL,2147483675)
,(-9223371938070527990, 2147483671,'TargetEntityTypeId',3,-1,NULL,NULL)
,(-9223371938070527989, 2147483671,'AssignedResourceTypes',12,-1,NULL,NULL)
,(-9223371938070527988, 2147483671,'ResourceTypeRules',12,-1,NULL,NULL)
,(-9223371938070527987, 2147483671,'ResourceTypeRulesId',-1,-1,NULL,NULL)
,(-9223371938070527986, 2147483671,'ResourceNavigationRules',12,-1,NULL,NULL)
,(-9223371938070527985, 2147483671,'ResourceNavigationRulesId',-1,-1,NULL,NULL)
,(-9223371938070527984, 2147483671,'Identifier',0,-1,NULL,NULL)
,(-9223371938070527983, 2147483671,'ResourceScalarRules',12,-1,NULL,NULL)
,(-9223371938070527982, 2147483671,'ResourceScalarRulesId',-1,-1,NULL,NULL)
,(-9223371938070527981, 2147483671,'ApprovalWorkflowType',2,-1,NULL,NULL)
,(-9223371938070527980, 2147483671,'ResourceCorrelationRules',12,-1,NULL,NULL)
,(-9223371938070527979, 2147483671,'DisplayName_L1',0,-1,-9223371938070527999,NULL)
,(-9223371938070527978, 2147483671,'DisplayName_L2',0,-1,-9223371938070527999,NULL)
,(-9223371938070527977, 2147483671,'DisplayName_L3',0,-1,-9223371938070527999,NULL)
,(-9223371938070527976, 2147483671,'DisplayName_L4',0,-1,-9223371938070527999,NULL)
,(-9223371938070527975, 2147483671,'DisplayName_L5',0,-1,-9223371938070527999,NULL)
,(-9223371938070527974, 2147483671,'DisplayName_L6',0,-1,-9223371938070527999,NULL)
,(-9223371938070527973, 2147483671,'DisplayName_L7',0,-1,-9223371938070527999,NULL)
,(-9223371938070527972, 2147483671,'DisplayName_L8',0,-1,-9223371938070527999,NULL)
,(-9223371938070527971, 2147483671,'SecondaryCategories',12,-1,NULL,2147483668)
,(-9223371938070527970, 2147483671,'ResourceType',12,-1,NULL,NULL)
,(-9223371938070527969, 2147483671,'Description_L1',0,-1,-9223371938070527998,NULL)
,(-9223371938070527968, 2147483671,'Description_L2',0,-1,-9223371938070527998,NULL)
,(-9223371938070527967, 2147483671,'Description_L3',0,-1,-9223371938070527998,NULL)
,(-9223371938070527966, 2147483671,'Description_L4',0,-1,-9223371938070527998,NULL)
,(-9223371938070527965, 2147483671,'Description_L5',0,-1,-9223371938070527998,NULL)
,(-9223371938070527964, 2147483671,'Description_L6',0,-1,-9223371938070527998,NULL)
,(-9223371938070527963, 2147483671,'Description_L7',0,-1,-9223371938070527998,NULL)
,(-9223371938070527962, 2147483671,'Description_L8',0,-1,-9223371938070527998,NULL)
,(-9223371938070527961, 2147483671,'AccessCertificationDataFilters',12,-1,NULL,2147483917)
,(-9223371938070527960, 2147483671,'ResourceQueryRules',12,-1,NULL,NULL)
,(-9223371938070527959, 2147483671,'BlockProvisioning',5,-1,NULL,NULL)
,(-9223371938070527958, 2147483671,'DiscardManualAssignments',5,-1,NULL,NULL)
,(-9223371938070527957, 2147483671,'ProfileContexts',12,-1,NULL,NULL)
,(-9223371938070527956, 2147483671,'HideOnSimplifiedView',5,-1,NULL,NULL)
,(-9223371938070527955, 2147483671,'TaskResourceType',12,-1,NULL,NULL)
,(-9223371938070527954, 2147483671,'FullName',0,-1,NULL,NULL)
,(-9223371938070527953, 2147483671,'FullName_L1',0,-1,-9223371938070527954,NULL)
,(-9223371938070527952, 2147483671,'FullName_L2',0,-1,-9223371938070527954,NULL)
,(-9223371938070527951, 2147483671,'FullName_L3',0,-1,-9223371938070527954,NULL)
,(-9223371938070527950, 2147483671,'FullName_L4',0,-1,-9223371938070527954,NULL)
,(-9223371938070527949, 2147483671,'FullName_L5',0,-1,-9223371938070527954,NULL)
,(-9223371938070527948, 2147483671,'FullName_L6',0,-1,-9223371938070527954,NULL)
,(-9223371938070527947, 2147483671,'FullName_L7',0,-1,-9223371938070527954,NULL)
,(-9223371938070527946, 2147483671,'FullName_L8',0,-1,-9223371938070527954,NULL)
,(-9223371938070527945, 2147483671,'RiskRuleItems',12,-1,NULL,NULL)
,(-9223371938070527944, 2147483671,'ArgumentsExpression',0,-1,NULL,NULL)
,(-9223371938070527943, 2147483671,'SourceEntityTypeMapping',12,-1,NULL,2147483800)
,(-9223371938070527942, 2147483671,'TargetEntityTypeMapping',12,-1,NULL,2147483800)
,(-9223371938070527941, 2147483671,'AssignmentCount',2,-1,NULL,NULL)
,(-9223371938070527940, 2147483671,'ResourceClassificationRules',12,-1,NULL,NULL)
,(-9223371938070527939, 2147483671,'OrphanCount',2,-1,NULL,NULL)
,(-9223371938070527938, 2147483671,'ImplicitApproval',2,-1,NULL,NULL)
,(-9223371938070527937, 2147483671,'BaseRoleId',-1,-1,NULL,NULL)
,(-9223371938070527936, 2147483671,'BaseRole',12,-1,NULL,2147483671)
,(-9223371938070527935, 2147483671,'RoleBase',12,-1,NULL,NULL)
,(-9223371938070527934, 2147483671,'AllowAdd',5,-1,NULL,NULL)
,(-9223371938070527933, 2147483671,'AllowRemove',5,-1,NULL,NULL)
,(-9223371938070527932, 2147483671,'RemoveOrphans',5,-1,NULL,NULL)
,(-9223371938070527931, 2147483671,'CorrelateMultipleResources',5,-1,NULL,NULL)
,(-9223371938070527930, 2147483671,'Tasks',12,-1,NULL,NULL)
,(-9223371938070527929, 2147483671,'RoleMappings',12,-1,NULL,NULL)
,(-9223371938070527928, 2147483671,'ProlongationWithoutApproval',9,-1,NULL,NULL)
,(-9223371938070527926, 2147483671,'GracePeriod',2,-1,NULL,NULL)
,(-9223371938070527925, 2147483671,'DependsOn',12,-1,NULL,2147483671)
,(-9223371938070527924, 2147483671,'DependsOnId',3,-1,NULL,NULL)
,(-9223371938070527923, 2147483671,'DependsOnChildren',12,-1,NULL,NULL)
,(-9223371938070527922, 2147483671,'MaxDuration',2,-1,NULL,NULL)
,(-9223371938070527921, 2147483671,'TransmittedStateValidityPeriod',2,-1,NULL,NULL)
,(-9223371938070527920, 2147483671,'DisplayName_L9',0,-1,-9223371938070527999,NULL)
,(-9223371938070527919, 2147483671,'DisplayName_L10',0,-1,-9223371938070527999,NULL)
,(-9223371938070527918, 2147483671,'DisplayName_L11',0,-1,-9223371938070527999,NULL)
,(-9223371938070527917, 2147483671,'DisplayName_L12',0,-1,-9223371938070527999,NULL)
,(-9223371938070527916, 2147483671,'DisplayName_L13',0,-1,-9223371938070527999,NULL)
,(-9223371938070527915, 2147483671,'DisplayName_L14',0,-1,-9223371938070527999,NULL)
,(-9223371938070527914, 2147483671,'DisplayName_L15',0,-1,-9223371938070527999,NULL)
,(-9223371938070527913, 2147483671,'DisplayName_L16',0,-1,-9223371938070527999,NULL)
,(-9223371938070527910, 2147483671,'AutomationRules',12,-1,NULL,NULL)
,(-9223371938070527905, 2147483671,'ResourceBinaryRules',12,-1,NULL,NULL)
,(-9223371938070527900, 2147483671,'FullName_L9',0,-1,-9223371938070527954,NULL)
,(-9223371938070527899, 2147483671,'FullName_L10',0,-1,-9223371938070527954,NULL)
,(-9223371938070527898, 2147483671,'FullName_L11',0,-1,-9223371938070527954,NULL)
,(-9223371938070527897, 2147483671,'FullName_L12',0,-1,-9223371938070527954,NULL)
,(-9223371938070527896, 2147483671,'FullName_L13',0,-1,-9223371938070527954,NULL)
,(-9223371938070527895, 2147483671,'FullName_L14',0,-1,-9223371938070527954,NULL)
,(-9223371938070527894, 2147483671,'FullName_L15',0,-1,-9223371938070527954,NULL)
,(-9223371938070527893, 2147483671,'FullName_L16',0,-1,-9223371938070527954,NULL)
,(-9223371938070527890, 2147483671,'Description_L9',0,-1,-9223371938070527998,NULL)
,(-9223371938070527889, 2147483671,'Description_L10',0,-1,-9223371938070527998,NULL)
,(-9223371938070527888, 2147483671,'Description_L11',0,-1,-9223371938070527998,NULL)
,(-9223371938070527887, 2147483671,'Description_L12',0,-1,-9223371938070527998,NULL)
,(-9223371938070527886, 2147483671,'Description_L13',0,-1,-9223371938070527998,NULL)
,(-9223371938070527885, 2147483671,'Description_L14',0,-1,-9223371938070527998,NULL)
,(-9223371938070527884, 2147483671,'Description_L15',0,-1,-9223371938070527998,NULL)
,(-9223371938070527883, 2147483671,'Description_L16',0,-1,-9223371938070527998,NULL)
,(-9223371938070527882, 2147483671,'ProfileRuleContexts',12,-1,NULL,NULL)
,(-9223371938070527880, 2147483671,'DependsOnOwnerProperty',12,-1,NULL,2147483676)
,(-9223371938070527879, 2147483671,'DependsOnOwnerPropertyId',3,-1,NULL,NULL)
,(-9223371938070527488, 2147483671,'WhenCreated',4,-1,NULL,NULL)
,(-9223371938070527487, 2147483671,'CreatedById',3,-1,NULL,NULL)
,(-9223371938070527486, 2147483671,'CreatedBy',12,-1,NULL,NULL)
,(-9223371938070527485, 2147483671,'WhenChanged',4,-1,NULL,NULL)
,(-9223371938070527484, 2147483671,'ChangedById',3,-1,NULL,NULL)
,(-9223371938070527483, 2147483671,'ChangedBy',12,-1,NULL,NULL)
,(-9223371933775560704, 2147483672,'Id',3,-1,NULL,NULL)
,(-9223371933775560703, 2147483672,'PropertyId',3,-1,NULL,NULL)
,(-9223371933775560702, 2147483672,'FileName',0,-1,NULL,NULL)
,(-9223371933775560701, 2147483672,'MimeType',0,-1,NULL,NULL)
,(-9223371933775560700, 2147483672,'Data',1,-1,NULL,NULL)
,(-9223371933775560699, 2147483672,'ResourceId',3,-1,NULL,NULL)
,(-9223371933775560698, 2147483672,'DataHash',2,-1,NULL,NULL)
,(-9223371933775560697, 2147483672,'AssignedResourceBinaries',12,-1,NULL,NULL)
,(-9223371933775560696, 2147483672,'PolicyAssignedResourceBinaries',12,-1,NULL,NULL)
,(-9223371929480593408, 2147483673,'Id',3,-1,NULL,NULL)
,(-9223371929480593407, 2147483673,'Identifier',0,-1,NULL,NULL)
,(-9223371929480593405, 2147483673,'DisplayName',0,-1,NULL,NULL)
,(-9223371929480593404, 2147483673,'AgentId',3,-1,NULL,NULL)
,(-9223371929480593403, 2147483673,'Agent',12,-1,NULL,NULL)
,(-9223371929480593398, 2147483673,'MaximumInsertedLines',3,-1,NULL,NULL)
,(-9223371929480593397, 2147483673,'MaximumDeletedLines',3,-1,NULL,NULL)
,(-9223371929480593396, 2147483673,'MaximumUpdatedLines',3,-1,NULL,NULL)
,(-9223371929480593395, 2147483673,'MaxPercentageInsertedLines',3,-1,NULL,NULL)
,(-9223371929480593394, 2147483673,'MaxPercentageDeletedLines',3,-1,NULL,NULL)
,(-9223371929480593393, 2147483673,'MaxPercentageUpdatedLines',3,-1,NULL,NULL)
,(-9223371929480593392, 2147483673,'MaximumLinkInsertedLines',3,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371929480593391, 2147483673,'MaximumLinkDeletedLines',3,-1,NULL,NULL)
,(-9223371929480593390, 2147483673,'MaxLinkPercentageInsertedLines',3,-1,NULL,NULL)
,(-9223371929480593389, 2147483673,'MaxLinkPercentageDeletedLines',3,-1,NULL,NULL)
,(-9223371929480593388, 2147483673,'EntityTypeMappings',12,-1,NULL,NULL)
,(-9223371929480593387, 2147483673,'EntityAssociationMappings',12,-1,NULL,NULL)
,(-9223371929480593386, 2147483673,'DisplayName_L1',0,-1,-9223371929480593405,NULL)
,(-9223371929480593385, 2147483673,'DisplayName_L2',0,-1,-9223371929480593405,NULL)
,(-9223371929480593384, 2147483673,'DisplayName_L3',0,-1,-9223371929480593405,NULL)
,(-9223371929480593383, 2147483673,'DisplayName_L4',0,-1,-9223371929480593405,NULL)
,(-9223371929480593382, 2147483673,'DisplayName_L5',0,-1,-9223371929480593405,NULL)
,(-9223371929480593381, 2147483673,'DisplayName_L6',0,-1,-9223371929480593405,NULL)
,(-9223371929480593380, 2147483673,'DisplayName_L7',0,-1,-9223371929480593405,NULL)
,(-9223371929480593379, 2147483673,'DisplayName_L8',0,-1,-9223371929480593405,NULL)
,(-9223371929480593378, 2147483673,'Tasks',12,-1,NULL,2147483811)
,(-9223371929480593377, 2147483673,'Connections',12,-1,NULL,2147483926)
,(-9223371929480593376, 2147483673,'IsDeactivated',5,-1,NULL,NULL)
,(-9223371929480593375, 2147483673,'CompleteJob',9,-1,NULL,NULL)
,(-9223371929480593374, 2147483673,'IncrementalJob',9,-1,NULL,NULL)
,(-9223371929480593328, 2147483673,'DisplayName_L9',0,-1,-9223371929480593405,NULL)
,(-9223371929480593327, 2147483673,'DisplayName_L10',0,-1,-9223371929480593405,NULL)
,(-9223371929480593326, 2147483673,'DisplayName_L11',0,-1,-9223371929480593405,NULL)
,(-9223371929480593325, 2147483673,'DisplayName_L12',0,-1,-9223371929480593405,NULL)
,(-9223371929480593324, 2147483673,'DisplayName_L13',0,-1,-9223371929480593405,NULL)
,(-9223371929480593323, 2147483673,'DisplayName_L14',0,-1,-9223371929480593405,NULL)
,(-9223371929480593322, 2147483673,'DisplayName_L15',0,-1,-9223371929480593405,NULL)
,(-9223371929480593321, 2147483673,'DisplayName_L16',0,-1,-9223371929480593405,NULL)
,(-9223371920890658816, 2147483675,'Id',3,-1,NULL,NULL)
,(-9223371920890658815, 2147483675,'Identifier',0,-1,NULL,NULL)
,(-9223371920890658814, 2147483675,'DisplayName',0,-1,NULL,NULL)
,(-9223371920890658813, 2147483675,'Properties',12,-1,NULL,NULL)
,(-9223371920890658812, 2147483675,'PropertiesId',-1,-1,NULL,NULL)
,(-9223371920890658811, 2147483675,'UnclassifiedCount',2,-1,NULL,NULL)
,(-9223371920890658809, 2147483675,'Dimensions',12,-1,NULL,NULL)
,(-9223371920890658808, 2147483675,'SingleRoles',12,-1,NULL,NULL)
,(-9223371920890658807, 2147483675,'SingleRolesId',-1,-1,NULL,NULL)
,(-9223371920890658806, 2147483675,'DisplayTables',12,-1,NULL,NULL)
,(-9223371920890658804, 2147483675,'CompositeRoles',12,-1,NULL,NULL)
,(-9223371920890658803, 2147483675,'CompositeRolesId',-1,-1,NULL,NULL)
,(-9223371920890658802, 2147483675,'ResourceTypes',12,-1,NULL,NULL)
,(-9223371920890658801, 2147483675,'ResourceTypesId',-1,-1,NULL,NULL)
,(-9223371920890658800, 2147483675,'TargetResourceTypes',12,-1,NULL,NULL)
,(-9223371920890658799, 2147483675,'TargetResourceTypesId',12,-1,NULL,NULL)
,(-9223371920890658798, 2147483675,'OwnerAccessCertificationCampaigns',12,-1,NULL,2147483912)
,(-9223371920890658793, 2147483675,'Tiles',12,-1,NULL,NULL)
,(-9223371920890658792, 2147483675,'RoleCounters',12,-1,NULL,NULL)
,(-9223371920890658789, 2147483675,'Forms',-1,-1,NULL,NULL)
,(-9223371920890658788, 2147483675,'SearchBars',12,-1,NULL,NULL)
,(-9223371920890658787, 2147483675,'SearchBarsFromSearchedEntityType',12,-1,NULL,NULL)
,(-9223371920890658786, 2147483675,'DisplayEntityTypes',12,-1,NULL,NULL)
,(-9223371920890658785, 2147483675,'EntityTypeMapping',12,-1,NULL,NULL)
,(-9223371920890658784, 2147483675,'DisplayName_L1',0,-1,-9223371920890658814,NULL)
,(-9223371920890658783, 2147483675,'DisplayName_L2',0,-1,-9223371920890658814,NULL)
,(-9223371920890658782, 2147483675,'DisplayName_L3',0,-1,-9223371920890658814,NULL)
,(-9223371920890658781, 2147483675,'DisplayName_L4',0,-1,-9223371920890658814,NULL)
,(-9223371920890658780, 2147483675,'DisplayName_L5',0,-1,-9223371920890658814,NULL)
,(-9223371920890658779, 2147483675,'DisplayName_L6',0,-1,-9223371920890658814,NULL)
,(-9223371920890658778, 2147483675,'DisplayName_L7',0,-1,-9223371920890658814,NULL)
,(-9223371920890658777, 2147483675,'DisplayName_L8',0,-1,-9223371920890658814,NULL)
,(-9223371920890658776, 2147483675,'ContextRules',12,-1,NULL,NULL)
,(-9223371920890658775, 2147483675,'PolicySimulations',12,-1,NULL,NULL)
,(-9223371920890658771, 2147483675,'TaskEntityType',12,-1,NULL,NULL)
,(-9223371920890658770, 2147483675,'EntityInstances',12,-1,NULL,NULL)
,(-9223371920890658769, 2147483675,'Risks',12,-1,NULL,NULL)
,(-9223371920890658768, 2147483675,'RisksId',-1,-1,NULL,NULL)
,(-9223371920890658766, 2147483675,'Tasks',12,-1,NULL,NULL)
,(-9223371920890658764, 2147483675,'RoleMappings',12,-1,NULL,NULL)
,(-9223371920890658763, 2147483675,'Workflows',12,-1,NULL,NULL)
,(-9223371920890658746, 2147483675,'EntityType',12,-1,NULL,NULL)
,(-9223371920890658745, 2147483675,'EntityPropertyExpressions',12,-1,NULL,NULL)
,(-9223371920890658744, 2147483675,'EntityPropertyExpressionsId',-1,-1,NULL,NULL)
,(-9223371920890658736, 2147483675,'DisplayName_L9',0,-1,-9223371920890658814,NULL)
,(-9223371920890658735, 2147483675,'DisplayName_L10',0,-1,-9223371920890658814,NULL)
,(-9223371920890658734, 2147483675,'DisplayName_L11',0,-1,-9223371920890658814,NULL)
,(-9223371920890658733, 2147483675,'DisplayName_L12',0,-1,-9223371920890658814,NULL)
,(-9223371920890658732, 2147483675,'DisplayName_L13',0,-1,-9223371920890658814,NULL)
,(-9223371920890658731, 2147483675,'DisplayName_L14',0,-1,-9223371920890658814,NULL)
,(-9223371920890658730, 2147483675,'DisplayName_L15',0,-1,-9223371920890658814,NULL)
,(-9223371920890658729, 2147483675,'DisplayName_L16',0,-1,-9223371920890658814,NULL)
,(-9223371920890658728, 2147483675,'Indicators',12,-1,NULL,NULL)
,(-9223371920890658727, 2147483675,'MiningRules',12,-1,NULL,NULL)
,(-9223371920890658716, 2147483675,'ProfileRuleContexts',12,-1,NULL,NULL)
,(-9223371916595691520, 2147483676,'Id',3,-1,NULL,NULL)
,(-9223371916595691519, 2147483676,'Identifier',0,-1,NULL,NULL)
,(-9223371916595691518, 2147483676,'TargetColumnIndex',2,-1,NULL,NULL)
,(-9223371916595691517, 2147483676,'Type',2,-1,NULL,NULL)
,(-9223371916595691516, 2147483676,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371916595691515, 2147483676,'EntityType',12,-1,NULL,2147483675)
,(-9223371916595691514, 2147483676,'Association1Id',3,-1,NULL,NULL)
,(-9223371916595691513, 2147483676,'Association1',12,-1,NULL,2147483677)
,(-9223371916595691512, 2147483676,'Association2Id',3,-1,NULL,NULL)
,(-9223371916595691511, 2147483676,'Association2',12,-1,NULL,2147483677)
,(-9223371916595691510, 2147483676,'DisplayName',0,-1,NULL,NULL)
,(-9223371916595691509, 2147483676,'ResourceNavigationRules',12,-1,NULL,NULL)
,(-9223371916595691508, 2147483676,'ResourceNavigationRulesId',-1,-1,NULL,NULL)
,(-9223371916595691507, 2147483676,'BindingItems',12,-1,NULL,NULL)
,(-9223371916595691506, 2147483676,'DisplayName_L1',0,-1,-9223371916595691510,NULL)
,(-9223371916595691505, 2147483676,'DisplayName_L2',0,-1,-9223371916595691510,NULL)
,(-9223371916595691504, 2147483676,'DisplayName_L3',0,-1,-9223371916595691510,NULL)
,(-9223371916595691503, 2147483676,'DisplayName_L4',0,-1,-9223371916595691510,NULL)
,(-9223371916595691502, 2147483676,'DisplayName_L5',0,-1,-9223371916595691510,NULL)
,(-9223371916595691501, 2147483676,'DisplayName_L6',0,-1,-9223371916595691510,NULL)
,(-9223371916595691500, 2147483676,'DisplayName_L7',0,-1,-9223371916595691510,NULL)
,(-9223371916595691499, 2147483676,'DisplayName_L8',0,-1,-9223371916595691510,NULL)
,(-9223371916595691498, 2147483676,'NeutralPropertyId',3,-1,NULL,NULL)
,(-9223371916595691497, 2147483676,'NeutralProperty',12,-1,NULL,2147483676)
,(-9223371916595691496, 2147483676,'AssociatedLocalizedProperties',12,-1,NULL,NULL)
,(-9223371916595691495, 2147483676,'LanguageId',3,-1,NULL,NULL)
,(-9223371916595691494, 2147483676,'Language',12,-1,NULL,2147483914)
,(-9223371916595691492, 2147483676,'ResourcePropertyMappings',12,-1,NULL,NULL)
,(-9223371916595691490, 2147483676,'AssignedResourceNavigations',12,-1,NULL,NULL)
,(-9223371916595691489, 2147483676,'AssignedResourceScalars',12,-1,NULL,NULL)
,(-9223371916595691488, 2147483676,'ResourceScalarRules',12,-1,NULL,NULL)
,(-9223371916595691487, 2147483676,'ResourceScalarRulesId',-1,-1,NULL,NULL)
,(-9223371916595691486, 2147483676,'ResourceQueryRules',12,-1,NULL,NULL)
,(-9223371916595691485, 2147483676,'FlexibleComparisonExpression',0,-1,NULL,NULL)
,(-9223371916595691480, 2147483676,'HistoryPrecision',3,-1,NULL,NULL)
,(-9223371916595691479, 2147483676,'IsKey',5,-1,NULL,NULL)
,(-9223371916595691475, 2147483676,'AssignedResourceBinaries',12,-1,NULL,NULL)
,(-9223371916595691470, 2147483676,'EntityPropertyMapping',12,-1,NULL,NULL)
,(-9223371916595691469, 2147483676,'DisplayEntityProperty',12,-1,NULL,NULL)
,(-9223371916595691468, 2147483676,'RoleMappingRuleItems',12,-1,NULL,NULL)
,(-9223371916595691467, 2147483676,'RoleMappings',12,-1,NULL,NULL)
,(-9223371916595691460, 2147483676,'ParentPropertyDimensions',12,-1,NULL,NULL)
,(-9223371916595691457, 2147483676,'Expression',12,-1,NULL,NULL)
,(-9223371916595691456, 2147483676,'ExpressionId',-1,-1,NULL,NULL)
,(-9223371916595691455, 2147483676,'ExpressionCriteria',12,-1,NULL,NULL)
,(-9223371916595691454, 2147483676,'ExpressionCriteriaId',-1,-1,NULL,NULL)
,(-9223371916595691453, 2147483676,'HomonymEntityLinkFiltersComparisonProperty1',12,-1,NULL,NULL)
,(-9223371916595691452, 2147483676,'HomonymEntityLinkFiltersComparisonProperty2',12,-1,NULL,NULL)
,(-9223371916595691451, 2147483676,'HomonymEntityLinkFiltersComparisonProperty3',12,-1,NULL,NULL)
,(-9223371916595691450, 2147483676,'HomonymEntityLinkFiltersComparisonProperty4',12,-1,NULL,NULL)
,(-9223371916595691449, 2147483676,'HomonymEntityLinkFiltersComparisonProperty5',12,-1,NULL,NULL)
,(-9223371916595691448, 2147483676,'HomonymEntityLinkFiltersProperty1',12,-1,NULL,NULL)
,(-9223371916595691447, 2147483676,'HomonymEntityLinkFiltersProperty2',12,-1,NULL,NULL)
,(-9223371916595691446, 2147483676,'HomonymEntityLinkFiltersProperty3',12,-1,NULL,NULL)
,(-9223371916595691445, 2147483676,'HomonymEntityLinkFiltersProperty4',12,-1,NULL,NULL)
,(-9223371916595691444, 2147483676,'HomonymEntityLinkFiltersProperty5',12,-1,NULL,NULL)
,(-9223371916595691440, 2147483676,'DisplayName_L9',0,-1,-9223371916595691510,NULL)
,(-9223371916595691439, 2147483676,'DisplayName_L10',0,-1,-9223371916595691510,NULL)
,(-9223371916595691438, 2147483676,'DisplayName_L11',0,-1,-9223371916595691510,NULL)
,(-9223371916595691437, 2147483676,'DisplayName_L12',0,-1,-9223371916595691510,NULL)
,(-9223371916595691436, 2147483676,'DisplayName_L13',0,-1,-9223371916595691510,NULL)
,(-9223371916595691435, 2147483676,'DisplayName_L14',0,-1,-9223371916595691510,NULL)
,(-9223371916595691434, 2147483676,'DisplayName_L15',0,-1,-9223371916595691510,NULL)
,(-9223371916595691433, 2147483676,'DisplayName_L16',0,-1,-9223371916595691510,NULL)
,(-9223371916595691403, 2147483676,'ResourceTypeDependsOn',12,-1,NULL,NULL)
,(-9223371916595691402, 2147483676,'ParentDisplayTables',12,-1,NULL,NULL)
,(-9223371916595691401, 2147483676,'ResourceBinaryRules',12,-1,NULL,NULL)
,(-9223371916595690519, 2147483676,'RiskRuleItems',12,-1,NULL,NULL)
,(-9223371912300724224, 2147483677,'Id',3,-1,NULL,NULL)
,(-9223371912300724223, 2147483677,'Identifier',0,-1,NULL,NULL)
,(-9223371912300724222, 2147483677,'DisplayName',0,-1,NULL,NULL)
,(-9223371912300724221, 2147483677,'Property1',12,-1,NULL,NULL)
,(-9223371912300724220, 2147483677,'Property1Id',3,-1,NULL,NULL)
,(-9223371912300724219, 2147483677,'Property2',12,-1,NULL,NULL)
,(-9223371912300724218, 2147483677,'Property2Id',3,-1,NULL,NULL)
,(-9223371912300724215, 2147483677,'IsProperty1Collection',5,-1,NULL,NULL)
,(-9223371912300724214, 2147483677,'IsProperty2Collection',5,-1,NULL,NULL)
,(-9223371912300724213, 2147483677,'DisplayName_L1',0,-1,-9223371912300724222,NULL)
,(-9223371912300724212, 2147483677,'DisplayName_L2',0,-1,-9223371912300724222,NULL)
,(-9223371912300724211, 2147483677,'DisplayName_L3',0,-1,-9223371912300724222,NULL)
,(-9223371912300724210, 2147483677,'DisplayName_L4',0,-1,-9223371912300724222,NULL)
,(-9223371912300724209, 2147483677,'DisplayName_L5',0,-1,-9223371912300724222,NULL)
,(-9223371912300724208, 2147483677,'DisplayName_L6',0,-1,-9223371912300724222,NULL)
,(-9223371912300724207, 2147483677,'DisplayName_L7',0,-1,-9223371912300724222,NULL)
,(-9223371912300724206, 2147483677,'DisplayName_L8',0,-1,-9223371912300724222,NULL)
,(-9223371912300724197, 2147483677,'EntityAssociationMapping',12,-1,NULL,NULL)
,(-9223371912300724196, 2147483677,'DisplayEntityAssociation',12,-1,NULL,NULL)
,(-9223371912300724195, 2147483677,'AssociationInstances',12,-1,NULL,NULL)
,(-9223371912300724144, 2147483677,'DisplayName_L9',0,-1,-9223371912300724222,NULL)
,(-9223371912300724143, 2147483677,'DisplayName_L10',0,-1,-9223371912300724222,NULL)
,(-9223371912300724142, 2147483677,'DisplayName_L11',0,-1,-9223371912300724222,NULL)
,(-9223371912300724141, 2147483677,'DisplayName_L12',0,-1,-9223371912300724222,NULL)
,(-9223371912300724140, 2147483677,'DisplayName_L13',0,-1,-9223371912300724222,NULL)
,(-9223371912300724139, 2147483677,'DisplayName_L14',0,-1,-9223371912300724222,NULL)
,(-9223371912300724138, 2147483677,'DisplayName_L15',0,-1,-9223371912300724222,NULL)
,(-9223371912300724137, 2147483677,'DisplayName_L16',0,-1,-9223371912300724222,NULL)
,(-9223371899415822336, 2147483680,'Id',3,-1,NULL,NULL)
,(-9223371899415822335, 2147483680,'IsDenied',5,-1,NULL,NULL)
,(-9223371899415822333, 2147483680,'Role',12,-1,NULL,2147483693)
,(-9223371899415822332, 2147483680,'RoleId',3,-1,NULL,NULL)
,(-9223371899415822331, 2147483680,'Policy',12,-1,NULL,2147483669)
,(-9223371899415822330, 2147483680,'PolicyId',3,-1,NULL,NULL)
,(-9223371899415822329, 2147483680,'Type',2,-1,NULL,NULL)
,(-9223371899415822328, 2147483680,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371899415822323, 2147483680,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223371899415822322, 2147483680,'BaseRule',12,-1,NULL,2147483680)
,(-9223371899415822321, 2147483680,'RuleBase',12,-1,NULL,NULL)
,(-9223371899415822320, 2147483680,'ParentRole',12,-1,NULL,2147483693)
,(-9223371899415822319, 2147483680,'ParentRoleId',3,-1,NULL,NULL)
,(-9223371899415822318, 2147483680,'Priority',2,-1,NULL,NULL)
,(-9223371899415821824, 2147483680,'WhenCreated',4,-1,NULL,NULL)
,(-9223371899415821823, 2147483680,'CreatedById',3,-1,NULL,NULL)
,(-9223371899415821822, 2147483680,'CreatedBy',12,-1,NULL,NULL)
,(-9223371899415821821, 2147483680,'WhenChanged',4,-1,NULL,NULL)
,(-9223371899415821820, 2147483680,'ChangedById',3,-1,NULL,NULL)
,(-9223371899415821819, 2147483680,'ChangedBy',12,-1,NULL,NULL)
,(-9223371895120855040, 2147483681,'Id',3,-1,NULL,NULL)
,(-9223371895120855039, 2147483681,'IsDenied',5,-1,NULL,NULL)
,(-9223371895120855037, 2147483681,'Role',12,-1,NULL,2147483667)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371895120855036, 2147483681,'RoleId',3,-1,NULL,NULL)
,(-9223371895120855035, 2147483681,'Policy',12,-1,NULL,2147483669)
,(-9223371895120855034, 2147483681,'PolicyId',3,-1,NULL,NULL)
,(-9223371895120855033, 2147483681,'CompositeRole',12,-1,NULL,2147483693)
,(-9223371895120855032, 2147483681,'CompositeRoleId',3,-1,NULL,NULL)
,(-9223371895120855031, 2147483681,'Type',2,-1,NULL,NULL)
,(-9223371895120855030, 2147483681,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371895120855025, 2147483681,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223371895120855024, 2147483681,'BaseRule',12,-1,NULL,2147483681)
,(-9223371895120855023, 2147483681,'RuleBase',12,-1,NULL,NULL)
,(-9223371895120855022, 2147483681,'Priority',2,-1,NULL,NULL)
,(-9223371895120854528, 2147483681,'WhenCreated',4,-1,NULL,NULL)
,(-9223371895120854527, 2147483681,'CreatedById',3,-1,NULL,NULL)
,(-9223371895120854526, 2147483681,'CreatedBy',12,-1,NULL,NULL)
,(-9223371895120854525, 2147483681,'WhenChanged',4,-1,NULL,NULL)
,(-9223371895120854524, 2147483681,'ChangedById',3,-1,NULL,NULL)
,(-9223371895120854523, 2147483681,'ChangedBy',12,-1,NULL,NULL)
,(-9223371890825887744, 2147483682,'Id',3,-1,NULL,NULL)
,(-9223371890825887743, 2147483682,'IsDenied',5,-1,NULL,NULL)
,(-9223371890825887741, 2147483682,'Role',12,-1,NULL,2147483671)
,(-9223371890825887740, 2147483682,'RoleId',3,-1,NULL,NULL)
,(-9223371890825887739, 2147483682,'Policy',12,-1,NULL,2147483669)
,(-9223371890825887738, 2147483682,'PolicyId',3,-1,NULL,NULL)
,(-9223371890825887737, 2147483682,'SingleRole',12,-1,NULL,2147483667)
,(-9223371890825887736, 2147483682,'SingleRoleId',3,-1,NULL,NULL)
,(-9223371890825887735, 2147483682,'TimeOffsetReference',2,-1,NULL,NULL)
,(-9223371890825887734, 2147483682,'TimeOffsetBeforeReference',2,-1,NULL,NULL)
,(-9223371890825887733, 2147483682,'TimeOffsetAfterReference',2,-1,NULL,NULL)
,(-9223371890825887732, 2147483682,'Type',2,-1,NULL,NULL)
,(-9223371890825887727, 2147483682,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223371890825887726, 2147483682,'BaseRule',12,-1,NULL,2147483682)
,(-9223371890825887725, 2147483682,'RuleBase',12,-1,NULL,NULL)
,(-9223371890825887724, 2147483682,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371890825887232, 2147483682,'WhenCreated',4,-1,NULL,NULL)
,(-9223371890825887231, 2147483682,'CreatedById',3,-1,NULL,NULL)
,(-9223371890825887230, 2147483682,'CreatedBy',12,-1,NULL,NULL)
,(-9223371890825887229, 2147483682,'WhenChanged',4,-1,NULL,NULL)
,(-9223371890825887228, 2147483682,'ChangedById',3,-1,NULL,NULL)
,(-9223371890825887227, 2147483682,'ChangedBy',12,-1,NULL,NULL)
,(-9223371886530920448, 2147483683,'Id',3,-1,NULL,NULL)
,(-9223371886530920447, 2147483683,'IsDenied',5,-1,NULL,NULL)
,(-9223371886530920446, 2147483683,'Policy',12,-1,NULL,2147483669)
,(-9223371886530920445, 2147483683,'PolicyId',3,-1,NULL,NULL)
,(-9223371886530920444, 2147483683,'Resource',12,-1,NULL,2147483670)
,(-9223371886530920443, 2147483683,'ResourceId',3,-1,NULL,NULL)
,(-9223371886530920442, 2147483683,'ResourceType',12,-1,NULL,2147483671)
,(-9223371886530920441, 2147483683,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223371886530920440, 2147483683,'Property',12,-1,NULL,2147483676)
,(-9223371886530920439, 2147483683,'PropertyId',3,-1,NULL,NULL)
,(-9223371886530920438, 2147483683,'SingleRole',12,-1,NULL,2147483667)
,(-9223371886530920437, 2147483683,'SingleRoleId',3,-1,NULL,NULL)
,(-9223371886530920436, 2147483683,'TimeOffsetReference',2,-1,NULL,NULL)
,(-9223371886530920435, 2147483683,'TimeOffsetBeforeReference',2,-1,NULL,NULL)
,(-9223371886530920434, 2147483683,'TimeOffsetAfterReference',2,-1,NULL,NULL)
,(-9223371886530920433, 2147483683,'Type',2,-1,NULL,NULL)
,(-9223371886530920429, 2147483683,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223371886530920428, 2147483683,'BaseRule',12,-1,NULL,2147483683)
,(-9223371886530920427, 2147483683,'RuleBase',12,-1,NULL,NULL)
,(-9223371886530920418, 2147483683,'RiskRuleItems',12,-1,NULL,NULL)
,(-9223371886530920417, 2147483683,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371886530919936, 2147483683,'WhenCreated',4,-1,NULL,NULL)
,(-9223371886530919935, 2147483683,'CreatedById',3,-1,NULL,NULL)
,(-9223371886530919934, 2147483683,'CreatedBy',12,-1,NULL,NULL)
,(-9223371886530919933, 2147483683,'WhenChanged',4,-1,NULL,NULL)
,(-9223371886530919932, 2147483683,'ChangedById',3,-1,NULL,NULL)
,(-9223371886530919931, 2147483683,'ChangedBy',12,-1,NULL,NULL)
,(-9223371877940985856, 2147483685,'Id',3,-1,NULL,NULL)
,(-9223371877940985855, 2147483685,'DisplayName',0,-1,NULL,NULL)
,(-9223371877940985854, 2147483685,'Identifier',0,-1,NULL,NULL)
,(-9223371877940985853, 2147483685,'ColumnMapping',2,-1,NULL,NULL)
,(-9223371877940985852, 2147483685,'EntityType',12,-1,NULL,2147483675)
,(-9223371877940985851, 2147483685,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371877940985850, 2147483685,'DisplayName_L1',0,-1,-9223371877940985855,NULL)
,(-9223371877940985849, 2147483685,'DisplayName_L2',0,-1,-9223371877940985855,NULL)
,(-9223371877940985848, 2147483685,'DisplayName_L3',0,-1,-9223371877940985855,NULL)
,(-9223371877940985847, 2147483685,'DisplayName_L4',0,-1,-9223371877940985855,NULL)
,(-9223371877940985846, 2147483685,'DisplayName_L5',0,-1,-9223371877940985855,NULL)
,(-9223371877940985845, 2147483685,'DisplayName_L6',0,-1,-9223371877940985855,NULL)
,(-9223371877940985844, 2147483685,'DisplayName_L7',0,-1,-9223371877940985855,NULL)
,(-9223371877940985843, 2147483685,'DisplayName_L8',0,-1,-9223371877940985855,NULL)
,(-9223371877940985842, 2147483685,'IsHierarchical',5,-1,NULL,NULL)
,(-9223371877940985841, 2147483685,'ParentProperty',12,-1,NULL,2147483676)
,(-9223371877940985840, 2147483685,'ParentPropertyId',3,-1,NULL,NULL)
,(-9223371877940985837, 2147483685,'AccessControlFilters',12,-1,NULL,NULL)
,(-9223371877940985806, 2147483685,'TaskDimension',12,-1,NULL,NULL)
,(-9223371877940985776, 2147483685,'Tasks',12,-1,NULL,NULL)
,(-9223371877940985746, 2147483685,'DisplayName_L9',0,-1,-9223371877940985855,NULL)
,(-9223371877940985745, 2147483685,'DisplayName_L10',0,-1,-9223371877940985855,NULL)
,(-9223371877940985744, 2147483685,'DisplayName_L11',0,-1,-9223371877940985855,NULL)
,(-9223371877940985743, 2147483685,'DisplayName_L12',0,-1,-9223371877940985855,NULL)
,(-9223371877940985742, 2147483685,'DisplayName_L13',0,-1,-9223371877940985855,NULL)
,(-9223371877940985741, 2147483685,'DisplayName_L14',0,-1,-9223371877940985855,NULL)
,(-9223371877940985740, 2147483685,'DisplayName_L15',0,-1,-9223371877940985855,NULL)
,(-9223371877940985739, 2147483685,'DisplayName_L16',0,-1,-9223371877940985855,NULL)
,(-9223371869351051264, 2147483687,'Id',3,-1,NULL,NULL)
,(-9223371869351051263, 2147483687,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371869351051262, 2147483687,'EntityType',12,-1,NULL,2147483675)
,(-9223371869351051261, 2147483687,'DisplayTableDesignElementId',3,-1,NULL,NULL)
,(-9223371869351051260, 2147483687,'DisplayTableDesignElement',12,-1,NULL,2147483705)
,(-9223371869351051259, 2147483687,'Columns',12,-1,NULL,NULL)
,(-9223371869351051258, 2147483687,'LinesPerPage',2,-1,NULL,NULL)
,(-9223371869351051257, 2147483687,'Controls',12,-1,NULL,NULL)
,(-9223371869351051253, 2147483687,'IsEntityTypeDefault',5,-1,NULL,NULL)
,(-9223371869351051252, 2147483687,'Identifier',0,-1,NULL,NULL)
,(-9223371869351051251, 2147483687,'DisplayEntityProperties',12,-1,NULL,NULL)
,(-9223371869351051250, 2147483687,'HomonymWorflowLinkId',3,-1,NULL,NULL)
,(-9223371869351051249, 2147483687,'HomonymWorflowLink',12,-1,NULL,2147483720)
,(-9223371869351051247, 2147483687,'ParentPropertyId',3,-1,NULL,NULL)
,(-9223371869351051246, 2147483687,'ParentProperty',12,-1,NULL,2147483676)
,(-9223371860761116672, 2147483689,'Id',3,-1,NULL,NULL)
,(-9223371860761116671, 2147483689,'DisplayOrder',2,-1,NULL,NULL)
,(-9223371860761116670, 2147483689,'IsResizable',5,-1,NULL,NULL)
,(-9223371860761116669, 2147483689,'IsSortable',5,-1,NULL,NULL)
,(-9223371860761116668, 2147483689,'CanBeFiltered',5,-1,NULL,NULL)
,(-9223371860761116667, 2147483689,'DefaultSortPriority',2,-1,NULL,NULL)
,(-9223371860761116666, 2147483689,'DisplayName',0,-1,NULL,NULL)
,(-9223371860761116665, 2147483689,'DisplayTableId',3,-1,NULL,NULL)
,(-9223371860761116664, 2147483689,'DisplayTable',12,-1,NULL,2147483687)
,(-9223371860761116663, 2147483689,'DisplayBindingId',3,-1,NULL,NULL)
,(-9223371860761116662, 2147483689,'DisplayBinding',12,-1,NULL,2147483690)
,(-9223371860761116661, 2147483689,'SortBindingId',3,-1,NULL,NULL)
,(-9223371860761116660, 2147483689,'SortBinding',12,-1,NULL,2147483690)
,(-9223371860761116659, 2147483689,'IsDisplayInSummaryView',5,-1,NULL,NULL)
,(-9223371860761116658, 2147483689,'IsDisplayInDropDownList',5,-1,NULL,NULL)
,(-9223371860761116657, 2147483689,'TileId',3,-1,NULL,NULL)
,(-9223371860761116656, 2147483689,'Tile',12,-1,NULL,2147483698)
,(-9223371860761116655, 2147483689,'ColumnSize',2,-1,NULL,NULL)
,(-9223371860761116654, 2147483689,'SearchOperator',9,-1,NULL,NULL)
,(-9223371860761116653, 2147483689,'DisplayName_L1',0,-1,-9223371860761116666,NULL)
,(-9223371860761116652, 2147483689,'DisplayName_L2',0,-1,-9223371860761116666,NULL)
,(-9223371860761116651, 2147483689,'DisplayName_L3',0,-1,-9223371860761116666,NULL)
,(-9223371860761116650, 2147483689,'DisplayName_L4',0,-1,-9223371860761116666,NULL)
,(-9223371860761116649, 2147483689,'DisplayName_L5',0,-1,-9223371860761116666,NULL)
,(-9223371860761116648, 2147483689,'DisplayName_L6',0,-1,-9223371860761116666,NULL)
,(-9223371860761116647, 2147483689,'DisplayName_L7',0,-1,-9223371860761116666,NULL)
,(-9223371860761116646, 2147483689,'DisplayName_L8',0,-1,-9223371860761116666,NULL)
,(-9223371860761116645, 2147483689,'AddedMinutes',2,-1,NULL,NULL)
,(-9223371860761116644, 2147483689,'OptimizedDisplayBindingId',3,-1,NULL,NULL)
,(-9223371860761116643, 2147483689,'OptimizedDisplayBinding',12,-1,NULL,2147483690)
,(-9223371860761116642, 2147483689,'OptimizedSortBindingId',3,-1,NULL,NULL)
,(-9223371860761116641, 2147483689,'OptimizedSortBinding',12,-1,NULL,2147483690)
,(-9223371860761116592, 2147483689,'DisplayName_L9',0,-1,-9223371860761116666,NULL)
,(-9223371860761116591, 2147483689,'DisplayName_L10',0,-1,-9223371860761116666,NULL)
,(-9223371860761116590, 2147483689,'DisplayName_L11',0,-1,-9223371860761116666,NULL)
,(-9223371860761116589, 2147483689,'DisplayName_L12',0,-1,-9223371860761116666,NULL)
,(-9223371860761116588, 2147483689,'DisplayName_L13',0,-1,-9223371860761116666,NULL)
,(-9223371860761116587, 2147483689,'DisplayName_L14',0,-1,-9223371860761116666,NULL)
,(-9223371860761116586, 2147483689,'DisplayName_L15',0,-1,-9223371860761116666,NULL)
,(-9223371860761116585, 2147483689,'DisplayName_L16',0,-1,-9223371860761116666,NULL)
,(-9223371856466149376, 2147483690,'Id',3,-1,NULL,NULL)
,(-9223371856466149375, 2147483690,'Controls',12,-1,NULL,NULL)
,(-9223371856466149374, 2147483690,'BindingItems',12,-1,NULL,NULL)
,(-9223371856466149373, 2147483690,'DisplayedDisplayTableColumns',12,-1,NULL,NULL)
,(-9223371856466149372, 2147483690,'SortedDisplayTableColumns',12,-1,NULL,NULL)
,(-9223371856466149371, 2147483690,'TileItems',12,-1,NULL,NULL)
,(-9223371856466149370, 2147483690,'SearchCriteria1',12,-1,NULL,NULL)
,(-9223371856466149369, 2147483690,'SearchCriteria2',12,-1,NULL,NULL)
,(-9223371856466149368, 2147483690,'SearchCriteria3',12,-1,NULL,NULL)
,(-9223371856466149367, 2147483690,'SearchCriteria4',12,-1,NULL,NULL)
,(-9223371856466149366, 2147483690,'FilterFormControls1',12,-1,NULL,NULL)
,(-9223371856466149365, 2147483690,'ResourceScalarRules',12,-1,NULL,NULL)
,(-9223371856466149364, 2147483690,'ResourceScalarRulesId',-1,-1,NULL,NULL)
,(-9223371856466149363, 2147483690,'LinkedFormControls2',12,-1,NULL,NULL)
,(-9223371856466149362, 2147483690,'LinkedFormControls1',12,-1,NULL,NULL)
,(-9223371856466149361, 2147483690,'FilterFormControls2',12,-1,NULL,NULL)
,(-9223371856466149360, 2147483690,'ResourceCorrelationRules',12,-1,NULL,NULL)
,(-9223371856466149359, 2147483690,'TargetResourceCorrelationRules',12,-1,NULL,NULL)
,(-9223371856466149358, 2147483690,'ResourceQueryRules',12,-1,NULL,NULL)
,(-9223371856466149357, 2147483690,'TargetResourceQueryRules',12,-1,NULL,NULL)
,(-9223371856466149356, 2147483690,'Path',0,-1,NULL,NULL)
,(-9223371856466149355, 2147483690,'DefaultValueFormControls',12,-1,NULL,NULL)
,(-9223371856466149347, 2147483690,'SearchBarsFromSearchedBinding',12,-1,NULL,NULL)
,(-9223371856466149346, 2147483690,'NavigationFormControls',12,-1,NULL,NULL)
,(-9223371856466149345, 2147483690,'NavigationDisplayEntityProperties',12,-1,NULL,NULL)
,(-9223371856466149344, 2147483690,'Dimension0ContextRules',12,-1,NULL,NULL)
,(-9223371856466149343, 2147483690,'Dimension1ContextRules',12,-1,NULL,NULL)
,(-9223371856466149342, 2147483690,'Dimension2ContextRules',12,-1,NULL,NULL)
,(-9223371856466149341, 2147483690,'Dimension3ContextRules',12,-1,NULL,NULL)
,(-9223371856466149340, 2147483690,'Dimension4ContextRules',12,-1,NULL,NULL)
,(-9223371856466149339, 2147483690,'Dimension5ContextRules',12,-1,NULL,NULL)
,(-9223371856466149338, 2147483690,'Dimension6ContextRules',12,-1,NULL,NULL)
,(-9223371856466149337, 2147483690,'Dimension7ContextRules',12,-1,NULL,NULL)
,(-9223371856466149336, 2147483690,'ResourcesContextRules',12,-1,NULL,NULL)
,(-9223371856466149335, 2147483690,'ResourcesStartContextRules',12,-1,NULL,NULL)
,(-9223371856466149334, 2147483690,'ResourcesEndContextRules',12,-1,NULL,NULL)
,(-9223371856466149331, 2147483690,'AccessCertificationOwnerFilter',12,-1,NULL,2147483916)
,(-9223371856466149330, 2147483690,'AutocompleteBindingDisplayEntityProperties',12,-1,NULL,NULL)
,(-9223371856466149329, 2147483690,'AutocompleteBindingDisplayEntityTypes',12,-1,NULL,NULL)
,(-9223371856466149328, 2147483690,'EntityPropertyExpressions',12,-1,NULL,NULL)
,(-9223371856466149327, 2147483690,'EntityPropertyExpressionsId',-1,-1,NULL,NULL)
,(-9223371856466149326, 2147483690,'RoleMappingDisplayNames',12,-1,NULL,NULL)
,(-9223371856466149325, 2147483690,'AccessControlFilters',12,-1,NULL,NULL)
,(-9223371856466149324, 2147483690,'Aspects',12,-1,NULL,NULL)
,(-9223371856466149323, 2147483690,'ExpressionAspects',12,-1,NULL,NULL)
,(-9223371856466149322, 2147483690,'HistorizeBindingAspects',12,-1,NULL,NULL)
,(-9223371856466149321, 2147483690,'RoleMappingIdentifiers',12,-1,NULL,NULL)
,(-9223371856466149320, 2147483690,'RoleMappingCategoryIdentifiers',12,-1,NULL,NULL)
,(-9223371856466149319, 2147483690,'RoleMappingParentCategoryIdentifiers',12,-1,NULL,NULL)
,(-9223371856466149318, 2147483690,'RoleMappingCategoryDisplayNames',12,-1,NULL,NULL)
,(-9223371856466149317, 2147483690,'OptimizedTileItems',12,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371856466149316, 2147483690,'OptimizedDisplayedDisplayTableColumns',12,-1,NULL,NULL)
,(-9223371856466149314, 2147483690,'OptimizedSortedDisplayTableColumns',12,-1,NULL,NULL)
,(-9223371856466149313, 2147483690,'OptimizedSearchCriteria1',12,-1,NULL,NULL)
,(-9223371856466149312, 2147483690,'OptimizedSearchCriteria2',12,-1,NULL,NULL)
,(-9223371856466149311, 2147483690,'OptimizedSearchCriteria3',12,-1,NULL,NULL)
,(-9223371856466149310, 2147483690,'OptimizedSearchCriteria4',12,-1,NULL,NULL)
,(-9223371856466149288, 2147483690,'Indicators',12,-1,NULL,NULL)
,(-9223371856466149287, 2147483690,'OptimizedIndicators',12,-1,NULL,NULL)
,(-9223371856466149281, 2147483690,'ResourceBinaryRules',12,-1,NULL,NULL)
,(-9223371856466149264, 2147483690,'Controls2',12,-1,NULL,NULL)
,(-9223371856466149262, 2147483690,'Controls3',12,-1,NULL,NULL)
,(-9223371852171182080, 2147483691,'Id',3,-1,NULL,NULL)
,(-9223371852171182079, 2147483691,'Order',2,-1,NULL,NULL)
,(-9223371852171182078, 2147483691,'Binding',12,-1,NULL,2147483690)
,(-9223371852171182077, 2147483691,'BindingId',3,-1,NULL,NULL)
,(-9223371852171182076, 2147483691,'Property',12,-1,NULL,2147483676)
,(-9223371852171182075, 2147483691,'PropertyId',3,-1,NULL,NULL)
,(-9223371843581247488, 2147483693,'Id',3,-1,NULL,NULL)
,(-9223371843581247487, 2147483693,'DisplayName',0,-1,NULL,NULL)
,(-9223371843581247486, 2147483693,'Description',0,-1,NULL,NULL)
,(-9223371843581247485, 2147483693,'Category',12,-1,NULL,2147483668)
,(-9223371843581247484, 2147483693,'CategoryId',3,-1,NULL,NULL)
,(-9223371843581247483, 2147483693,'Policy',12,-1,NULL,2147483669)
,(-9223371843581247482, 2147483693,'PolicyId',3,-1,NULL,NULL)
,(-9223371843581247481, 2147483693,'EntityType',12,-1,NULL,2147483675)
,(-9223371843581247480, 2147483693,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371843581247479, 2147483693,'CompositeRoleRules',12,-1,NULL,NULL)
,(-9223371843581247478, 2147483693,'CompositeRoleRulesId',-1,-1,NULL,NULL)
,(-9223371843581247477, 2147483693,'SingleRoleRules',12,-1,NULL,NULL)
,(-9223371843581247476, 2147483693,'SingleRoleRulesId',-1,-1,NULL,NULL)
,(-9223371843581247475, 2147483693,'Identifier',0,-1,NULL,NULL)
,(-9223371843581247474, 2147483693,'AssignedCompositeRoles',12,-1,NULL,NULL)
,(-9223371843581247473, 2147483693,'ApprovalWorkflowType',2,-1,NULL,NULL)
,(-9223371843581247472, 2147483693,'DisplayName_L1',0,-1,-9223371843581247487,NULL)
,(-9223371843581247471, 2147483693,'DisplayName_L2',0,-1,-9223371843581247487,NULL)
,(-9223371843581247470, 2147483693,'DisplayName_L3',0,-1,-9223371843581247487,NULL)
,(-9223371843581247469, 2147483693,'DisplayName_L4',0,-1,-9223371843581247487,NULL)
,(-9223371843581247468, 2147483693,'DisplayName_L5',0,-1,-9223371843581247487,NULL)
,(-9223371843581247467, 2147483693,'DisplayName_L6',0,-1,-9223371843581247487,NULL)
,(-9223371843581247466, 2147483693,'DisplayName_L7',0,-1,-9223371843581247487,NULL)
,(-9223371843581247465, 2147483693,'DisplayName_L8',0,-1,-9223371843581247487,NULL)
,(-9223371843581247462, 2147483693,'SecondaryCategories',12,-1,NULL,2147483668)
,(-9223371843581247461, 2147483693,'Description_L1',0,-1,-9223371843581247486,NULL)
,(-9223371843581247460, 2147483693,'Description_L2',0,-1,-9223371843581247486,NULL)
,(-9223371843581247459, 2147483693,'Description_L3',0,-1,-9223371843581247486,NULL)
,(-9223371843581247458, 2147483693,'Description_L4',0,-1,-9223371843581247486,NULL)
,(-9223371843581247457, 2147483693,'Description_L5',0,-1,-9223371843581247486,NULL)
,(-9223371843581247456, 2147483693,'Description_L6',0,-1,-9223371843581247486,NULL)
,(-9223371843581247455, 2147483693,'Description_L7',0,-1,-9223371843581247486,NULL)
,(-9223371843581247454, 2147483693,'Description_L8',0,-1,-9223371843581247486,NULL)
,(-9223371843581247453, 2147483693,'ProfileContexts',12,-1,NULL,NULL)
,(-9223371843581247452, 2147483693,'FullName',0,-1,NULL,NULL)
,(-9223371843581247451, 2147483693,'FullName_L1',0,-1,-9223371843581247452,NULL)
,(-9223371843581247450, 2147483693,'FullName_L2',0,-1,-9223371843581247452,NULL)
,(-9223371843581247449, 2147483693,'FullName_L3',0,-1,-9223371843581247452,NULL)
,(-9223371843581247448, 2147483693,'FullName_L4',0,-1,-9223371843581247452,NULL)
,(-9223371843581247447, 2147483693,'FullName_L5',0,-1,-9223371843581247452,NULL)
,(-9223371843581247446, 2147483693,'FullName_L6',0,-1,-9223371843581247452,NULL)
,(-9223371843581247445, 2147483693,'FullName_L7',0,-1,-9223371843581247452,NULL)
,(-9223371843581247444, 2147483693,'FullName_L8',0,-1,-9223371843581247452,NULL)
,(-9223371843581247443, 2147483693,'HideOnSimplifiedView',5,-1,NULL,NULL)
,(-9223371843581247442, 2147483693,'CommentActivationOnApproveInReview',9,-1,NULL,NULL)
,(-9223371843581247441, 2147483693,'CommentActivationOnDeclineInReview',9,-1,NULL,NULL)
,(-9223371843581247440, 2147483693,'CommentActivationOnDeleteGapInReconciliation',9,-1,NULL,NULL)
,(-9223371843581247439, 2147483693,'CommentActivationOnKeepGapInReconciliation',9,-1,NULL,NULL)
,(-9223371843581247438, 2147483693,'ImplicitApproval',9,-1,NULL,NULL)
,(-9223371843581247437, 2147483693,'BaseRoleId',-1,-1,NULL,NULL)
,(-9223371843581247436, 2147483693,'BaseRole',12,-1,NULL,2147483693)
,(-9223371843581247435, 2147483693,'RoleBase',12,-1,NULL,NULL)
,(-9223371843581247434, 2147483693,'MaxDuration',2,-1,NULL,NULL)
,(-9223371843581247433, 2147483693,'GracePeriod',2,-1,NULL,NULL)
,(-9223371843581247432, 2147483693,'ProlongationWithoutApproval',9,-1,NULL,NULL)
,(-9223371843581247428, 2147483693,'FullName_L9',0,-1,-9223371843581247452,NULL)
,(-9223371843581247427, 2147483693,'FullName_L10',0,-1,-9223371843581247452,NULL)
,(-9223371843581247426, 2147483693,'FullName_L11',0,-1,-9223371843581247452,NULL)
,(-9223371843581247425, 2147483693,'FullName_L12',0,-1,-9223371843581247452,NULL)
,(-9223371843581247424, 2147483693,'FullName_L13',0,-1,-9223371843581247452,NULL)
,(-9223371843581247423, 2147483693,'FullName_L14',0,-1,-9223371843581247452,NULL)
,(-9223371843581247422, 2147483693,'FullName_L15',0,-1,-9223371843581247452,NULL)
,(-9223371843581247421, 2147483693,'FullName_L16',0,-1,-9223371843581247452,NULL)
,(-9223371843581247418, 2147483693,'Description_L9',0,-1,-9223371843581247486,NULL)
,(-9223371843581247417, 2147483693,'Description_L10',0,-1,-9223371843581247486,NULL)
,(-9223371843581247416, 2147483693,'Description_L11',0,-1,-9223371843581247486,NULL)
,(-9223371843581247415, 2147483693,'Description_L12',0,-1,-9223371843581247486,NULL)
,(-9223371843581247414, 2147483693,'Description_L13',0,-1,-9223371843581247486,NULL)
,(-9223371843581247413, 2147483693,'Description_L14',0,-1,-9223371843581247486,NULL)
,(-9223371843581247412, 2147483693,'Description_L15',0,-1,-9223371843581247486,NULL)
,(-9223371843581247411, 2147483693,'Description_L16',0,-1,-9223371843581247486,NULL)
,(-9223371843581247410, 2147483693,'Tags',0,-1,NULL,NULL)
,(-9223371843581247409, 2147483693,'CommentActivationOnRequest',9,-1,NULL,NULL)
,(-9223371843581247408, 2147483693,'DisplayName_L9',0,-1,-9223371843581247487,NULL)
,(-9223371843581247407, 2147483693,'DisplayName_L10',0,-1,-9223371843581247487,NULL)
,(-9223371843581247406, 2147483693,'DisplayName_L11',0,-1,-9223371843581247487,NULL)
,(-9223371843581247405, 2147483693,'DisplayName_L12',0,-1,-9223371843581247487,NULL)
,(-9223371843581247404, 2147483693,'DisplayName_L13',0,-1,-9223371843581247487,NULL)
,(-9223371843581247403, 2147483693,'DisplayName_L14',0,-1,-9223371843581247487,NULL)
,(-9223371843581247402, 2147483693,'DisplayName_L15',0,-1,-9223371843581247487,NULL)
,(-9223371843581247401, 2147483693,'DisplayName_L16',0,-1,-9223371843581247487,NULL)
,(-9223371843581247398, 2147483693,'AutomationRules',12,-1,NULL,NULL)
,(-9223371843581247397, 2147483693,'CompositeRoleParentRules',12,-1,NULL,NULL)
,(-9223371843581247396, 2147483693,'CompositeRoleParentRulesId',-1,-1,NULL,NULL)
,(-9223371843581246976, 2147483693,'WhenCreated',4,-1,NULL,NULL)
,(-9223371843581246975, 2147483693,'CreatedById',3,-1,NULL,NULL)
,(-9223371843581246974, 2147483693,'CreatedBy',12,-1,NULL,NULL)
,(-9223371843581246973, 2147483693,'WhenChanged',4,-1,NULL,NULL)
,(-9223371843581246972, 2147483693,'ChangedById',3,-1,NULL,NULL)
,(-9223371843581246971, 2147483693,'ChangedBy',12,-1,NULL,NULL)
,(-9223371839286280192, 2147483694,'Id',3,-1,NULL,NULL)
,(-9223371839286280191, 2147483694,'CategoryId',3,-1,NULL,NULL)
,(-9223371839286280190, 2147483694,'Category',12,-1,NULL,2147483668)
,(-9223371839286280189, 2147483694,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371839286280188, 2147483694,'EntityType',12,-1,NULL,2147483675)
,(-9223371839286280187, 2147483694,'SingleRoleCounter',2,-1,NULL,NULL)
,(-9223371839286280186, 2147483694,'CompositeRoleCounter',2,-1,NULL,NULL)
,(-9223371839286280185, 2147483694,'ResourceTypeCounter',2,-1,NULL,NULL)
,(-9223371839286280184, 2147483694,'PolicyId',3,-1,NULL,NULL)
,(-9223371839286280183, 2147483694,'Policy',12,-1,NULL,2147483669)
,(-9223371826401378304, 2147483697,'Id',3,-1,NULL,NULL)
,(-9223371826401378303, 2147483697,'Identifier',0,-1,NULL,NULL)
,(-9223371826401378302, 2147483697,'Tiles',12,-1,NULL,NULL)
,(-9223371826401378301, 2147483697,'DisplayName',0,-1,NULL,NULL)
,(-9223371826401378300, 2147483697,'DisplayName_L1',0,-1,-9223371826401378301,NULL)
,(-9223371826401378299, 2147483697,'DisplayName_L2',0,-1,-9223371826401378301,NULL)
,(-9223371826401378298, 2147483697,'DisplayName_L3',0,-1,-9223371826401378301,NULL)
,(-9223371826401378297, 2147483697,'DisplayName_L4',0,-1,-9223371826401378301,NULL)
,(-9223371826401378296, 2147483697,'DisplayName_L5',0,-1,-9223371826401378301,NULL)
,(-9223371826401378295, 2147483697,'DisplayName_L6',0,-1,-9223371826401378301,NULL)
,(-9223371826401378294, 2147483697,'DisplayName_L7',0,-1,-9223371826401378301,NULL)
,(-9223371826401378293, 2147483697,'DisplayName_L8',0,-1,-9223371826401378301,NULL)
,(-9223371826401378224, 2147483697,'DisplayName_L9',0,-1,-9223371826401378301,NULL)
,(-9223371826401378223, 2147483697,'DisplayName_L10',0,-1,-9223371826401378301,NULL)
,(-9223371826401378222, 2147483697,'DisplayName_L11',0,-1,-9223371826401378301,NULL)
,(-9223371826401378221, 2147483697,'DisplayName_L12',0,-1,-9223371826401378301,NULL)
,(-9223371826401378220, 2147483697,'DisplayName_L13',0,-1,-9223371826401378301,NULL)
,(-9223371826401378219, 2147483697,'DisplayName_L14',0,-1,-9223371826401378301,NULL)
,(-9223371826401378218, 2147483697,'DisplayName_L15',0,-1,-9223371826401378301,NULL)
,(-9223371826401378217, 2147483697,'DisplayName_L16',0,-1,-9223371826401378301,NULL)
,(-9223371822106411008, 2147483698,'Id',3,-1,NULL,NULL)
,(-9223371822106411007, 2147483698,'Identifier',0,-1,NULL,NULL)
,(-9223371822106411006, 2147483698,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371822106411005, 2147483698,'EntityType',12,-1,NULL,2147483675)
,(-9223371822106411004, 2147483698,'TileDesignElementId',3,-1,NULL,NULL)
,(-9223371822106411003, 2147483698,'TileDesignElement',12,-1,NULL,2147483697)
,(-9223371822106411002, 2147483698,'Items',12,-1,NULL,NULL)
,(-9223371822106411001, 2147483698,'DisplayName',0,-1,NULL,NULL)
,(-9223371822106411000, 2147483698,'Controls',12,-1,NULL,NULL)
,(-9223371822106410999, 2147483698,'DisplayName_L1',0,-1,-9223371822106411001,NULL)
,(-9223371822106410998, 2147483698,'DisplayName_L2',0,-1,-9223371822106411001,NULL)
,(-9223371822106410997, 2147483698,'DisplayName_L3',0,-1,-9223371822106411001,NULL)
,(-9223371822106410996, 2147483698,'DisplayName_L4',0,-1,-9223371822106411001,NULL)
,(-9223371822106410995, 2147483698,'DisplayName_L5',0,-1,-9223371822106411001,NULL)
,(-9223371822106410994, 2147483698,'DisplayName_L6',0,-1,-9223371822106411001,NULL)
,(-9223371822106410993, 2147483698,'DisplayName_L7',0,-1,-9223371822106411001,NULL)
,(-9223371822106410992, 2147483698,'DisplayName_L8',0,-1,-9223371822106411001,NULL)
,(-9223371822106410928, 2147483698,'DisplayName_L9',0,-1,-9223371822106411001,NULL)
,(-9223371822106410927, 2147483698,'DisplayName_L10',0,-1,-9223371822106411001,NULL)
,(-9223371822106410926, 2147483698,'DisplayName_L11',0,-1,-9223371822106411001,NULL)
,(-9223371822106410925, 2147483698,'DisplayName_L12',0,-1,-9223371822106411001,NULL)
,(-9223371822106410924, 2147483698,'DisplayName_L13',0,-1,-9223371822106411001,NULL)
,(-9223371822106410923, 2147483698,'DisplayName_L14',0,-1,-9223371822106411001,NULL)
,(-9223371822106410922, 2147483698,'DisplayName_L15',0,-1,-9223371822106411001,NULL)
,(-9223371822106410921, 2147483698,'DisplayName_L16',0,-1,-9223371822106411001,NULL)
,(-9223371817811443712, 2147483699,'Id',3,-1,NULL,NULL)
,(-9223371817811443711, 2147483699,'LineNumber',2,-1,NULL,NULL)
,(-9223371817811443710, 2147483699,'LineDisplayOrderIndicator',2,-1,NULL,NULL)
,(-9223371817811443709, 2147483699,'TileId',3,-1,NULL,NULL)
,(-9223371817811443708, 2147483699,'Tile',12,-1,NULL,2147483698)
,(-9223371817811443707, 2147483699,'BindingId',3,-1,NULL,NULL)
,(-9223371817811443706, 2147483699,'Binding',12,-1,NULL,2147483690)
,(-9223371817811443705, 2147483699,'AddedMinutes',2,-1,NULL,NULL)
,(-9223371817811443704, 2147483699,'OptimizedBindingId',3,-1,NULL,NULL)
,(-9223371817811443703, 2147483699,'OptimizedBinding',12,-1,NULL,2147483690)
,(-9223371813516476416, 2147483700,'Id',3,-1,NULL,NULL)
,(-9223371813516476415, 2147483700,'Workflow',12,-1,NULL,2147483701)
,(-9223371813516476414, 2147483700,'WorkflowId',3,-1,NULL,NULL)
,(-9223371813516476413, 2147483700,'ActivityTemplate',12,-1,NULL,2147483702)
,(-9223371813516476412, 2147483700,'ActivityTemplateId',3,-1,NULL,NULL)
,(-9223371813516476411, 2147483700,'Order',2,-1,NULL,NULL)
,(-9223371813516476410, 2147483700,'ArgumentCalledWorkflowId',3,-1,NULL,NULL)
,(-9223371813516476409, 2147483700,'Identifier',0,-1,NULL,NULL)
,(-9223371813516476408, 2147483700,'DisplayName',0,-1,NULL,NULL)
,(-9223371813516476407, 2147483700,'CurrentWorkflowInstances',12,-1,NULL,NULL)
,(-9223371813516476406, 2147483700,'Instances',12,-1,NULL,NULL)
,(-9223371813516476405, 2147483700,'PointCuts',12,-1,NULL,NULL)
,(-9223371813516476404, 2147483700,'ArgumentBlockProvisioning',5,-1,NULL,NULL)
,(-9223371813516476403, 2147483700,'DisplayName_L1',0,-1,-9223371813516476408,NULL)
,(-9223371813516476402, 2147483700,'DisplayName_L2',0,-1,-9223371813516476408,NULL)
,(-9223371813516476401, 2147483700,'DisplayName_L3',0,-1,-9223371813516476408,NULL)
,(-9223371813516476400, 2147483700,'DisplayName_L4',0,-1,-9223371813516476408,NULL)
,(-9223371813516476399, 2147483700,'DisplayName_L5',0,-1,-9223371813516476408,NULL)
,(-9223371813516476398, 2147483700,'DisplayName_L6',0,-1,-9223371813516476408,NULL)
,(-9223371813516476397, 2147483700,'DisplayName_L7',0,-1,-9223371813516476408,NULL)
,(-9223371813516476396, 2147483700,'DisplayName_L8',0,-1,-9223371813516476408,NULL)
,(-9223371813516476385, 2147483700,'WorkflowOverviewDisable',5,-1,NULL,NULL)
,(-9223371813516476336, 2147483700,'DisplayName_L9',0,-1,-9223371813516476408,NULL)
,(-9223371813516476335, 2147483700,'DisplayName_L10',0,-1,-9223371813516476408,NULL)
,(-9223371813516476334, 2147483700,'DisplayName_L11',0,-1,-9223371813516476408,NULL)
,(-9223371813516476333, 2147483700,'DisplayName_L12',0,-1,-9223371813516476408,NULL)
,(-9223371813516476332, 2147483700,'DisplayName_L13',0,-1,-9223371813516476408,NULL)
,(-9223371813516476331, 2147483700,'DisplayName_L14',0,-1,-9223371813516476408,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371813516476330, 2147483700,'DisplayName_L15',0,-1,-9223371813516476408,NULL)
,(-9223371813516476329, 2147483700,'DisplayName_L16',0,-1,-9223371813516476408,NULL)
,(-9223371809221509120, 2147483701,'Id',3,-1,NULL,NULL)
,(-9223371809221509119, 2147483701,'Identifier',0,-1,NULL,NULL)
,(-9223371809221509118, 2147483701,'Activities',12,-1,NULL,NULL)
,(-9223371809221509117, 2147483701,'VariablesTypeId',3,-1,NULL,NULL)
,(-9223371809221509116, 2147483701,'DisplayName',0,-1,NULL,NULL)
,(-9223371809221509113, 2147483701,'IdentifierPrefix',0,-1,NULL,NULL)
,(-9223371809221509112, 2147483701,'Instances',12,-1,NULL,NULL)
,(-9223371809221509111, 2147483701,'DisplayName_L1',0,-1,-9223371809221509116,NULL)
,(-9223371809221509110, 2147483701,'DisplayName_L2',0,-1,-9223371809221509116,NULL)
,(-9223371809221509109, 2147483701,'DisplayName_L3',0,-1,-9223371809221509116,NULL)
,(-9223371809221509108, 2147483701,'DisplayName_L4',0,-1,-9223371809221509116,NULL)
,(-9223371809221509107, 2147483701,'DisplayName_L5',0,-1,-9223371809221509116,NULL)
,(-9223371809221509106, 2147483701,'DisplayName_L6',0,-1,-9223371809221509116,NULL)
,(-9223371809221509105, 2147483701,'DisplayName_L7',0,-1,-9223371809221509116,NULL)
,(-9223371809221509104, 2147483701,'DisplayName_L8',0,-1,-9223371809221509116,NULL)
,(-9223371809221509095, 2147483701,'VariablesType',12,-1,NULL,2147483675)
,(-9223371809221509040, 2147483701,'DisplayName_L9',0,-1,-9223371809221509116,NULL)
,(-9223371809221509039, 2147483701,'DisplayName_L10',0,-1,-9223371809221509116,NULL)
,(-9223371809221509038, 2147483701,'DisplayName_L11',0,-1,-9223371809221509116,NULL)
,(-9223371809221509037, 2147483701,'DisplayName_L12',0,-1,-9223371809221509116,NULL)
,(-9223371809221509036, 2147483701,'DisplayName_L13',0,-1,-9223371809221509116,NULL)
,(-9223371809221509035, 2147483701,'DisplayName_L14',0,-1,-9223371809221509116,NULL)
,(-9223371809221509034, 2147483701,'DisplayName_L15',0,-1,-9223371809221509116,NULL)
,(-9223371809221509033, 2147483701,'DisplayName_L16',0,-1,-9223371809221509116,NULL)
,(-9223371804926541824, 2147483702,'Id',3,-1,NULL,NULL)
,(-9223371804926541823, 2147483702,'Name',0,-1,NULL,NULL)
,(-9223371804926541822, 2147483702,'Activities',12,-1,NULL,NULL)
,(-9223371804926541821, 2147483702,'States',12,-1,NULL,NULL)
,(-9223371804926541820, 2147483702,'Transitions',-1,-1,NULL,NULL)
,(-9223371804926541819, 2147483702,'DisplayName',0,-1,NULL,NULL)
,(-9223371804926541818, 2147483702,'DisplayName_L1',0,-1,-9223371804926541819,NULL)
,(-9223371804926541817, 2147483702,'DisplayName_L2',0,-1,-9223371804926541819,NULL)
,(-9223371804926541816, 2147483702,'DisplayName_L3',0,-1,-9223371804926541819,NULL)
,(-9223371804926541815, 2147483702,'DisplayName_L4',0,-1,-9223371804926541819,NULL)
,(-9223371804926541814, 2147483702,'DisplayName_L5',0,-1,-9223371804926541819,NULL)
,(-9223371804926541813, 2147483702,'DisplayName_L6',0,-1,-9223371804926541819,NULL)
,(-9223371804926541812, 2147483702,'DisplayName_L7',0,-1,-9223371804926541819,NULL)
,(-9223371804926541811, 2147483702,'DisplayName_L8',0,-1,-9223371804926541819,NULL)
,(-9223371804926541744, 2147483702,'DisplayName_L9',0,-1,-9223371804926541819,NULL)
,(-9223371804926541743, 2147483702,'DisplayName_L10',0,-1,-9223371804926541819,NULL)
,(-9223371804926541742, 2147483702,'DisplayName_L11',0,-1,-9223371804926541819,NULL)
,(-9223371804926541741, 2147483702,'DisplayName_L12',0,-1,-9223371804926541819,NULL)
,(-9223371804926541740, 2147483702,'DisplayName_L13',0,-1,-9223371804926541819,NULL)
,(-9223371804926541739, 2147483702,'DisplayName_L14',0,-1,-9223371804926541819,NULL)
,(-9223371804926541738, 2147483702,'DisplayName_L15',0,-1,-9223371804926541819,NULL)
,(-9223371804926541737, 2147483702,'DisplayName_L16',0,-1,-9223371804926541819,NULL)
,(-9223371800631574528, 2147483703,'Id',3,-1,NULL,NULL)
,(-9223371800631574527, 2147483703,'Identifier',0,-1,NULL,NULL)
,(-9223371800631574526, 2147483703,'Template',12,-1,NULL,2147483702)
,(-9223371800631574525, 2147483703,'TemplateId',3,-1,NULL,NULL)
,(-9223371800631574524, 2147483703,'FromTransitions',-1,-1,NULL,NULL)
,(-9223371800631574523, 2147483703,'ToTransitions',-1,-1,NULL,NULL)
,(-9223371800631574522, 2147483703,'DisplayName',0,-1,NULL,NULL)
,(-9223371800631574521, 2147483703,'Instances',12,-1,NULL,NULL)
,(-9223371800631574520, 2147483703,'ShortIdentifier',0,-1,NULL,NULL)
,(-9223371800631574519, 2147483703,'IsInteractive',5,-1,NULL,NULL)
,(-9223371800631574518, 2147483703,'DisplayName_L1',0,-1,-9223371800631574522,NULL)
,(-9223371800631574517, 2147483703,'DisplayName_L2',0,-1,-9223371800631574522,NULL)
,(-9223371800631574516, 2147483703,'DisplayName_L3',0,-1,-9223371800631574522,NULL)
,(-9223371800631574515, 2147483703,'DisplayName_L4',0,-1,-9223371800631574522,NULL)
,(-9223371800631574514, 2147483703,'DisplayName_L5',0,-1,-9223371800631574522,NULL)
,(-9223371800631574513, 2147483703,'DisplayName_L6',0,-1,-9223371800631574522,NULL)
,(-9223371800631574512, 2147483703,'DisplayName_L7',0,-1,-9223371800631574522,NULL)
,(-9223371800631574511, 2147483703,'DisplayName_L8',0,-1,-9223371800631574522,NULL)
,(-9223371800631574448, 2147483703,'DisplayName_L9',0,-1,-9223371800631574522,NULL)
,(-9223371800631574447, 2147483703,'DisplayName_L10',0,-1,-9223371800631574522,NULL)
,(-9223371800631574446, 2147483703,'DisplayName_L11',0,-1,-9223371800631574522,NULL)
,(-9223371800631574445, 2147483703,'DisplayName_L12',0,-1,-9223371800631574522,NULL)
,(-9223371800631574444, 2147483703,'DisplayName_L13',0,-1,-9223371800631574522,NULL)
,(-9223371800631574443, 2147483703,'DisplayName_L14',0,-1,-9223371800631574522,NULL)
,(-9223371800631574442, 2147483703,'DisplayName_L15',0,-1,-9223371800631574522,NULL)
,(-9223371800631574441, 2147483703,'DisplayName_L16',0,-1,-9223371800631574522,NULL)
,(-9223371796336607232, 2147483704,'Id',3,-1,NULL,NULL)
,(-9223371796336607231, 2147483704,'Name',0,-1,NULL,NULL)
,(-9223371796336607230, 2147483704,'Fromstate',12,-1,NULL,2147483703)
,(-9223371796336607229, 2147483704,'FromstateId',3,-1,NULL,NULL)
,(-9223371796336607228, 2147483704,'Tostate',12,-1,NULL,2147483703)
,(-9223371796336607227, 2147483704,'TostateId',3,-1,NULL,NULL)
,(-9223371796336607226, 2147483704,'IsBatchActor',5,-1,NULL,NULL)
,(-9223371796336607225, 2147483704,'CurrentWorkflowInstances',12,-1,NULL,NULL)
,(-9223371796336607224, 2147483704,'DisplayName',0,-1,NULL,NULL)
,(-9223371796336607223, 2147483704,'DisplayName_L1',0,-1,-9223371796336607224,NULL)
,(-9223371796336607222, 2147483704,'DisplayName_L2',0,-1,-9223371796336607224,NULL)
,(-9223371796336607221, 2147483704,'DisplayName_L3',0,-1,-9223371796336607224,NULL)
,(-9223371796336607220, 2147483704,'DisplayName_L4',0,-1,-9223371796336607224,NULL)
,(-9223371796336607219, 2147483704,'DisplayName_L5',0,-1,-9223371796336607224,NULL)
,(-9223371796336607218, 2147483704,'DisplayName_L6',0,-1,-9223371796336607224,NULL)
,(-9223371796336607217, 2147483704,'DisplayName_L7',0,-1,-9223371796336607224,NULL)
,(-9223371796336607216, 2147483704,'DisplayName_L8',0,-1,-9223371796336607224,NULL)
,(-9223371796336607215, 2147483704,'Identifier',0,-1,NULL,NULL)
,(-9223371796336607152, 2147483704,'DisplayName_L9',0,-1,-9223371796336607224,NULL)
,(-9223371796336607151, 2147483704,'DisplayName_L10',0,-1,-9223371796336607224,NULL)
,(-9223371796336607150, 2147483704,'DisplayName_L11',0,-1,-9223371796336607224,NULL)
,(-9223371796336607149, 2147483704,'DisplayName_L12',0,-1,-9223371796336607224,NULL)
,(-9223371796336607148, 2147483704,'DisplayName_L13',0,-1,-9223371796336607224,NULL)
,(-9223371796336607147, 2147483704,'DisplayName_L14',0,-1,-9223371796336607224,NULL)
,(-9223371796336607146, 2147483704,'DisplayName_L15',0,-1,-9223371796336607224,NULL)
,(-9223371796336607145, 2147483704,'DisplayName_L16',0,-1,-9223371796336607224,NULL)
,(-9223371792041639936, 2147483705,'Id',3,-1,NULL,NULL)
,(-9223371792041639935, 2147483705,'Identifier',0,-1,NULL,NULL)
,(-9223371792041639926, 2147483705,'DisplayTables',12,-1,NULL,NULL)
,(-9223371787746672640, 2147483706,'Id',3,-1,NULL,NULL)
,(-9223371787746672639, 2147483706,'Workflow',12,-1,NULL,2147483701)
,(-9223371787746672638, 2147483706,'WorkflowId',3,-1,NULL,NULL)
,(-9223371787746672637, 2147483706,'Identifier',0,-1,NULL,NULL)
,(-9223371787746672636, 2147483706,'CurrentActivity',12,-1,NULL,2147483700)
,(-9223371787746672635, 2147483706,'CurrentActivityId',3,-1,NULL,NULL)
,(-9223371787746672634, 2147483706,'CurrentStateId',3,-1,NULL,NULL)
,(-9223371787746672633, 2147483706,'ActivityInstances',12,-1,NULL,NULL)
,(-9223371787746672632, 2147483706,'AssignedCompositeRoles',12,-1,NULL,2147483653)
,(-9223371787746672631, 2147483706,'AssignedSingleRoles',12,-1,NULL,2147483657)
,(-9223371787746672630, 2147483706,'AssignedResourceTypes',12,-1,NULL,2147483656)
,(-9223371787746672629, 2147483706,'CurrentActivityInstanceId',3,-1,NULL,NULL)
,(-9223371787746672628, 2147483706,'CurrentTransition',12,-1,NULL,2147483704)
,(-9223371787746672627, 2147483706,'CurrentTransitionId',3,-1,NULL,NULL)
,(-9223371787746672626, 2147483706,'CurrentActivityInstance',12,-1,NULL,2147483709)
,(-9223371787746672625, 2147483706,'IsCompleted',5,-1,NULL,NULL)
,(-9223371787746672624, 2147483706,'WhenCompleted',4,-1,NULL,NULL)
,(-9223371783451705344, 2147483707,'Id',3,-1,NULL,NULL)
,(-9223371783451705341, 2147483707,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371783451705340, 2147483707,'EntityType',12,-1,NULL,2147483675)
,(-9223371783451705339, 2147483707,'SearchBarDesignElement',3,-1,NULL,NULL)
,(-9223371783451705337, 2147483707,'SearchBarCriteria',12,-1,NULL,NULL)
,(-9223371783451705336, 2147483707,'SearchedBindingId',3,-1,NULL,NULL)
,(-9223371783451705335, 2147483707,'SearchedBinding',12,-1,NULL,2147483690)
,(-9223371783451705334, 2147483707,'SearchedEntityTypeId',3,-1,NULL,NULL)
,(-9223371783451705333, 2147483707,'SearchedEntityType',12,-1,NULL,2147483675)
,(-9223371783451705332, 2147483707,'MenuId',3,-1,NULL,NULL)
,(-9223371779156738048, 2147483708,'Id',3,-1,NULL,NULL)
,(-9223371779156738047, 2147483708,'Binding1Id',3,-1,NULL,NULL)
,(-9223371779156738046, 2147483708,'Binding1',12,-1,NULL,2147483690)
,(-9223371779156738045, 2147483708,'InputType',3,-1,NULL,NULL)
,(-9223371779156738043, 2147483708,'SearchBarId',3,-1,NULL,NULL)
,(-9223371779156738042, 2147483708,'SearchBar',12,-1,NULL,2147483707)
,(-9223371779156738041, 2147483708,'DisplayOrder',2,-1,NULL,NULL)
,(-9223371779156738040, 2147483708,'ColumnSize',2,-1,NULL,NULL)
,(-9223371779156738039, 2147483708,'IsVisibleInAdvancedView',5,-1,NULL,NULL)
,(-9223371779156738038, 2147483708,'PlaceHolderText',0,-1,NULL,NULL)
,(-9223371779156738037, 2147483708,'ToolTipText',0,-1,NULL,NULL)
,(-9223371779156738036, 2147483708,'Binding2Id',3,-1,NULL,NULL)
,(-9223371779156738035, 2147483708,'Binding2',12,-1,NULL,2147483690)
,(-9223371779156738034, 2147483708,'Binding3Id',3,-1,NULL,NULL)
,(-9223371779156738033, 2147483708,'Binding3',12,-1,NULL,2147483690)
,(-9223371779156738032, 2147483708,'Binding4Id',3,-1,NULL,NULL)
,(-9223371779156738031, 2147483708,'Binding4',12,-1,NULL,2147483690)
,(-9223371779156738030, 2147483708,'DisplayName',0,-1,NULL,NULL)
,(-9223371779156738029, 2147483708,'DefaultValue',0,-1,NULL,NULL)
,(-9223371779156738028, 2147483708,'Operator',9,-1,NULL,NULL)
,(-9223371779156738027, 2147483708,'DisplayName_L1',0,-1,-9223371779156738030,NULL)
,(-9223371779156738026, 2147483708,'DisplayName_L2',0,-1,-9223371779156738030,NULL)
,(-9223371779156738025, 2147483708,'DisplayName_L3',0,-1,-9223371779156738030,NULL)
,(-9223371779156738024, 2147483708,'DisplayName_L4',0,-1,-9223371779156738030,NULL)
,(-9223371779156738023, 2147483708,'DisplayName_L5',0,-1,-9223371779156738030,NULL)
,(-9223371779156738022, 2147483708,'DisplayName_L6',0,-1,-9223371779156738030,NULL)
,(-9223371779156738021, 2147483708,'DisplayName_L7',0,-1,-9223371779156738030,NULL)
,(-9223371779156738020, 2147483708,'DisplayName_L8',0,-1,-9223371779156738030,NULL)
,(-9223371779156738019, 2147483708,'PlaceHolderText_L1',0,-1,-9223371779156738038,NULL)
,(-9223371779156738018, 2147483708,'PlaceHolderText_L2',0,-1,-9223371779156738038,NULL)
,(-9223371779156738017, 2147483708,'PlaceHolderText_L3',0,-1,-9223371779156738038,NULL)
,(-9223371779156738016, 2147483708,'PlaceHolderText_L4',0,-1,-9223371779156738038,NULL)
,(-9223371779156738015, 2147483708,'PlaceHolderText_L5',0,-1,-9223371779156738038,NULL)
,(-9223371779156738014, 2147483708,'PlaceHolderText_L6',0,-1,-9223371779156738038,NULL)
,(-9223371779156738013, 2147483708,'PlaceHolderText_L7',0,-1,-9223371779156738038,NULL)
,(-9223371779156738012, 2147483708,'PlaceHolderText_L8',0,-1,-9223371779156738038,NULL)
,(-9223371779156738011, 2147483708,'ToolTipText_L1',0,-1,-9223371779156738037,NULL)
,(-9223371779156738010, 2147483708,'ToolTipText_L2',0,-1,-9223371779156738037,NULL)
,(-9223371779156738009, 2147483708,'ToolTipText_L3',0,-1,-9223371779156738037,NULL)
,(-9223371779156738008, 2147483708,'ToolTipText_L4',0,-1,-9223371779156738037,NULL)
,(-9223371779156738007, 2147483708,'ToolTipText_L5',0,-1,-9223371779156738037,NULL)
,(-9223371779156738006, 2147483708,'ToolTipText_L6',0,-1,-9223371779156738037,NULL)
,(-9223371779156738005, 2147483708,'ToolTipText_L7',0,-1,-9223371779156738037,NULL)
,(-9223371779156738004, 2147483708,'ToolTipText_L8',0,-1,-9223371779156738037,NULL)
,(-9223371779156737998, 2147483708,'OptimizedBinding1Id',3,-1,NULL,NULL)
,(-9223371779156737997, 2147483708,'OptimizedBinding1',12,-1,NULL,2147483690)
,(-9223371779156737996, 2147483708,'OptimizedBinding2Id',3,-1,NULL,NULL)
,(-9223371779156737995, 2147483708,'OptimizedBinding2',12,-1,NULL,2147483690)
,(-9223371779156737994, 2147483708,'OptimizedBinding3Id',3,-1,NULL,NULL)
,(-9223371779156737993, 2147483708,'OptimizedBinding3',12,-1,NULL,2147483690)
,(-9223371779156737992, 2147483708,'OptimizedBinding4Id',3,-1,NULL,NULL)
,(-9223371779156737991, 2147483708,'OptimizedBinding4',12,-1,NULL,2147483690)
,(-9223371779156737978, 2147483708,'PlaceHolderText_L9',0,-1,-9223371779156738038,NULL)
,(-9223371779156737977, 2147483708,'PlaceHolderText_L10',0,-1,-9223371779156738038,NULL)
,(-9223371779156737976, 2147483708,'PlaceHolderText_L11',0,-1,-9223371779156738038,NULL)
,(-9223371779156737975, 2147483708,'PlaceHolderText_L12',0,-1,-9223371779156738038,NULL)
,(-9223371779156737974, 2147483708,'PlaceHolderText_L13',0,-1,-9223371779156738038,NULL)
,(-9223371779156737973, 2147483708,'PlaceHolderText_L14',0,-1,-9223371779156738038,NULL)
,(-9223371779156737972, 2147483708,'PlaceHolderText_L15',0,-1,-9223371779156738038,NULL)
,(-9223371779156737971, 2147483708,'PlaceHolderText_L16',0,-1,-9223371779156738038,NULL)
,(-9223371779156737968, 2147483708,'DisplayName_L9',0,-1,-9223371779156738030,NULL)
,(-9223371779156737967, 2147483708,'DisplayName_L10',0,-1,-9223371779156738030,NULL)
,(-9223371779156737966, 2147483708,'DisplayName_L11',0,-1,-9223371779156738030,NULL)
,(-9223371779156737965, 2147483708,'DisplayName_L12',0,-1,-9223371779156738030,NULL)
,(-9223371779156737964, 2147483708,'DisplayName_L13',0,-1,-9223371779156738030,NULL)
,(-9223371779156737963, 2147483708,'DisplayName_L14',0,-1,-9223371779156738030,NULL)
,(-9223371779156737962, 2147483708,'DisplayName_L15',0,-1,-9223371779156738030,NULL)
,(-9223371779156737961, 2147483708,'DisplayName_L16',0,-1,-9223371779156738030,NULL)
,(-9223371779156737958, 2147483708,'ToolTipText_L9',0,-1,-9223371779156738037,NULL)
,(-9223371779156737957, 2147483708,'ToolTipText_L10',0,-1,-9223371779156738037,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371779156737956, 2147483708,'ToolTipText_L11',0,-1,-9223371779156738037,NULL)
,(-9223371779156737955, 2147483708,'ToolTipText_L12',0,-1,-9223371779156738037,NULL)
,(-9223371779156737954, 2147483708,'ToolTipText_L13',0,-1,-9223371779156738037,NULL)
,(-9223371779156737953, 2147483708,'ToolTipText_L14',0,-1,-9223371779156738037,NULL)
,(-9223371779156737952, 2147483708,'ToolTipText_L15',0,-1,-9223371779156738037,NULL)
,(-9223371779156737951, 2147483708,'ToolTipText_L16',0,-1,-9223371779156738037,NULL)
,(-9223371774861770752, 2147483709,'Id',3,-1,NULL,NULL)
,(-9223371774861770751, 2147483709,'Subject',0,-1,NULL,NULL)
,(-9223371774861770750, 2147483709,'Body',0,-1,NULL,NULL)
,(-9223371774861770749, 2147483709,'PrivateBody',0,-1,NULL,NULL)
,(-9223371774861770748, 2147483709,'WorkflowInstanceId',3,-1,NULL,NULL)
,(-9223371774861770747, 2147483709,'WorkflowInstance',12,-1,NULL,2147483706)
,(-9223371774861770746, 2147483709,'CreationDate',4,-1,NULL,NULL)
,(-9223371774861770745, 2147483709,'PerformerId',3,-1,NULL,NULL)
,(-9223371774861770744, 2147483709,'Performer',12,-1,NULL,2147483670)
,(-9223371774861770743, 2147483709,'CC',0,-1,NULL,NULL)
,(-9223371774861770742, 2147483709,'CCResources',12,-1,NULL,2147483670)
,(-9223371774861770741, 2147483709,'ActivityId',3,-1,NULL,NULL)
,(-9223371774861770740, 2147483709,'Activity',12,-1,NULL,2147483700)
,(-9223371774861770739, 2147483709,'StateId',3,-1,NULL,NULL)
,(-9223371774861770738, 2147483709,'Actors',12,-1,NULL,2147483670)
,(-9223371774861770737, 2147483709,'State',12,-1,NULL,2147483703)
,(-9223371774861770736, 2147483709,'TriggerMode',2,-1,NULL,NULL)
,(-9223371774861770732, 2147483709,'OpenIdClient',12,-1,NULL,2147483910)
,(-9223371774861770730, 2147483709,'ChangeSetSummary',0,-1,NULL,NULL)
,(-9223371774861770729, 2147483709,'ActivityInstance_WorkflowInstanceForWhichItIsCurrent',12,-1,NULL,NULL)
,(-9223371774861770728, 2147483709,'AssignedToId',3,-1,NULL,NULL)
,(-9223371774861770727, 2147483709,'AssignedTo',12,-1,NULL,2147483670)
,(-9223371774861770726, 2147483709,'ExpectedDate',4,-1,NULL,NULL)
,(-9223371770566803456, 2147483710,'Id',3,-1,NULL,NULL)
,(-9223371770566803455, 2147483710,'Activity',12,-1,NULL,2147483700)
,(-9223371770566803454, 2147483710,'ActivityId',3,-1,NULL,NULL)
,(-9223371770566803453, 2147483710,'ActivityState',-1,-1,NULL,NULL)
,(-9223371770566803452, 2147483710,'ActivityStateId',3,-1,NULL,NULL)
,(-9223371770566803451, 2147483710,'Aspect',12,-1,NULL,2147483711)
,(-9223371770566803450, 2147483710,'AspectId',3,-1,NULL,NULL)
,(-9223371770566803449, 2147483710,'Mode',2,-1,NULL,NULL)
,(-9223371766271836160, 2147483711,'Id',3,-1,NULL,NULL)
,(-9223371766271836159, 2147483711,'Identifier',0,-1,NULL,NULL)
,(-9223371766271836158, 2147483711,'Type',2,-1,NULL,NULL)
,(-9223371766271836157, 2147483711,'Priority',2,-1,NULL,NULL)
,(-9223371766271836156, 2147483711,'PointCuts',12,-1,NULL,NULL)
,(-9223371766271836155, 2147483711,'Binding',12,-1,NULL,2147483690)
,(-9223371766271836154, 2147483711,'BindingId',3,-1,NULL,NULL)
,(-9223371766271836153, 2147483711,'ExpressionBinding',12,-1,NULL,2147483690)
,(-9223371766271836152, 2147483711,'ExpressionBindingId',3,-1,NULL,NULL)
,(-9223371766271836151, 2147483711,'IfExpression',0,-1,NULL,NULL)
,(-9223371766271836150, 2147483711,'P0',0,-1,NULL,NULL)
,(-9223371766271836149, 2147483711,'P1',0,-1,NULL,NULL)
,(-9223371766271836148, 2147483711,'P2',0,-1,NULL,NULL)
,(-9223371766271836147, 2147483711,'P3',0,-1,NULL,NULL)
,(-9223371766271836146, 2147483711,'P4',0,-1,NULL,NULL)
,(-9223371766271836145, 2147483711,'P5',0,-1,NULL,NULL)
,(-9223371766271836144, 2147483711,'P6',0,-1,NULL,NULL)
,(-9223371766271836143, 2147483711,'P7',0,-1,NULL,NULL)
,(-9223371766271836142, 2147483711,'P8',0,-1,NULL,NULL)
,(-9223371766271836141, 2147483711,'P9',0,-1,NULL,NULL)
,(-9223371766271836140, 2147483711,'P10',0,-1,NULL,NULL)
,(-9223371766271836139, 2147483711,'P11',0,-1,NULL,NULL)
,(-9223371766271836138, 2147483711,'P12',0,-1,NULL,NULL)
,(-9223371766271836137, 2147483711,'P13',0,-1,NULL,NULL)
,(-9223371766271836136, 2147483711,'P14',0,-1,NULL,NULL)
,(-9223371766271836135, 2147483711,'P15',0,-1,NULL,NULL)
,(-9223371766271836134, 2147483711,'P16',0,-1,NULL,NULL)
,(-9223371766271836133, 2147483711,'P17',0,-1,NULL,NULL)
,(-9223371766271836132, 2147483711,'P18',0,-1,NULL,NULL)
,(-9223371766271836131, 2147483711,'P19',0,-1,NULL,NULL)
,(-9223371766271836130, 2147483711,'P20',0,-1,NULL,NULL)
,(-9223371766271836129, 2147483711,'P21',0,-1,NULL,NULL)
,(-9223371766271836128, 2147483711,'P22',0,-1,NULL,NULL)
,(-9223371766271836127, 2147483711,'P23',0,-1,NULL,NULL)
,(-9223371766271836126, 2147483711,'P24',0,-1,NULL,NULL)
,(-9223371766271836125, 2147483711,'P25',0,-1,NULL,NULL)
,(-9223371766271836124, 2147483711,'P26',0,-1,NULL,NULL)
,(-9223371766271836123, 2147483711,'P27',0,-1,NULL,NULL)
,(-9223371766271836122, 2147483711,'P28',0,-1,NULL,NULL)
,(-9223371766271836121, 2147483711,'P29',0,-1,NULL,NULL)
,(-9223371766271836120, 2147483711,'P30',0,-1,NULL,NULL)
,(-9223371766271836119, 2147483711,'P31',0,-1,NULL,NULL)
,(-9223371766271836118, 2147483711,'P32',0,-1,NULL,NULL)
,(-9223371766271836117, 2147483711,'P33',0,-1,NULL,NULL)
,(-9223371766271836116, 2147483711,'HistorizeBinding',12,-1,NULL,2147483690)
,(-9223371766271836115, 2147483711,'HistorizeBindingId',3,-1,NULL,NULL)
,(-9223371749091966976, 2147483715,'Id',3,-1,NULL,NULL)
,(-9223371749091966975, 2147483715,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371749091966974, 2147483715,'EntityType',12,-1,NULL,2147483675)
,(-9223371749091966973, 2147483715,'IconCode',0,-1,NULL,NULL)
,(-9223371749091966972, 2147483715,'IsHierarchical',5,-1,NULL,NULL)
,(-9223371749091966971, 2147483715,'PluralDisplayName',0,-1,NULL,NULL)
,(-9223371749091966970, 2147483715,'Priority',2,-1,NULL,NULL)
,(-9223371749091966969, 2147483715,'Color',0,-1,NULL,NULL)
,(-9223371749091966968, 2147483715,'HideRoles',5,-1,NULL,NULL)
,(-9223371749091966962, 2147483715,'DisplayEntityProperties',12,-1,NULL,NULL)
,(-9223371749091966961, 2147483715,'PluralDisplayName_L1',0,-1,-9223371749091966971,NULL)
,(-9223371749091966960, 2147483715,'PluralDisplayName_L2',0,-1,-9223371749091966971,NULL)
,(-9223371749091966959, 2147483715,'PluralDisplayName_L3',0,-1,-9223371749091966971,NULL)
,(-9223371749091966958, 2147483715,'PluralDisplayName_L4',0,-1,-9223371749091966971,NULL)
,(-9223371749091966957, 2147483715,'PluralDisplayName_L5',0,-1,-9223371749091966971,NULL)
,(-9223371749091966956, 2147483715,'PluralDisplayName_L6',0,-1,-9223371749091966971,NULL)
,(-9223371749091966955, 2147483715,'PluralDisplayName_L7',0,-1,-9223371749091966971,NULL)
,(-9223371749091966954, 2147483715,'PluralDisplayName_L8',0,-1,-9223371749091966971,NULL)
,(-9223371749091966953, 2147483715,'AutocompleteBindingId',3,-1,NULL,NULL)
,(-9223371749091966952, 2147483715,'AutocompleteBinding',12,-1,NULL,2147483690)
,(-9223371749091966951, 2147483715,'MinSearchLength',2,-1,NULL,NULL)
,(-9223371749091966950, 2147483715,'PluralDisplayName_L9',0,-1,-9223371749091966971,NULL)
,(-9223371749091966949, 2147483715,'PluralDisplayName_L10',0,-1,-9223371749091966971,NULL)
,(-9223371749091966948, 2147483715,'PluralDisplayName_L11',0,-1,-9223371749091966971,NULL)
,(-9223371749091966947, 2147483715,'PluralDisplayName_L12',0,-1,-9223371749091966971,NULL)
,(-9223371749091966946, 2147483715,'PluralDisplayName_L13',0,-1,-9223371749091966971,NULL)
,(-9223371749091966945, 2147483715,'PluralDisplayName_L14',0,-1,-9223371749091966971,NULL)
,(-9223371749091966944, 2147483715,'PluralDisplayName_L15',0,-1,-9223371749091966971,NULL)
,(-9223371749091966943, 2147483715,'PluralDisplayName_L16',0,-1,-9223371749091966971,NULL)
,(-9223371744796999680, 2147483716,'Id',3,-1,NULL,NULL)
,(-9223371744796999679, 2147483716,'EntityAssociationId',3,-1,NULL,NULL)
,(-9223371744796999678, 2147483716,'EntityAssociation',12,-1,NULL,2147483677)
,(-9223371744796999677, 2147483716,'ParentTreeNavDisplayPropertyId',3,-1,NULL,NULL)
,(-9223371744796999676, 2147483716,'ParentTreeNavDisplayProperty',12,-1,NULL,2147483717)
,(-9223371744796999673, 2147483716,'IsHierarchical',5,-1,NULL,NULL)
,(-9223371740502032384, 2147483717,'Id',3,-1,NULL,NULL)
,(-9223371740502032383, 2147483717,'EntityPropertyId',3,-1,NULL,NULL)
,(-9223371740502032382, 2147483717,'EntityProperty',12,-1,NULL,2147483676)
,(-9223371740502032379, 2147483717,'TileId',3,-1,NULL,NULL)
,(-9223371740502032378, 2147483717,'Tile',-1,-1,NULL,NULL)
,(-9223371740502032377, 2147483717,'DisplayTableId',3,-1,NULL,NULL)
,(-9223371740502032376, 2147483717,'DisplayTable',12,-1,NULL,2147483687)
,(-9223371740502032375, 2147483717,'InputType',3,-1,NULL,NULL)
,(-9223371740502032374, 2147483717,'OutputType',3,-1,NULL,NULL)
,(-9223371740502032373, 2147483717,'IsRequired',5,-1,NULL,NULL)
,(-9223371740502032372, 2147483717,'IsHidden',5,-1,NULL,NULL)
,(-9223371740502032371, 2147483717,'DisplayOrder',2,-1,NULL,NULL)
,(-9223371740502032370, 2147483717,'IsReadOnly',5,-1,NULL,NULL)
,(-9223371740502032369, 2147483717,'IconCode',0,-1,NULL,NULL)
,(-9223371740502032368, 2147483717,'PlaceHolderText',0,-1,NULL,NULL)
,(-9223371740502032367, 2147483717,'ToolTipText',0,-1,NULL,NULL)
,(-9223371740502032365, 2147483717,'DisplayEntityType',12,-1,NULL,2147483715)
,(-9223371740502032364, 2147483717,'NavigationBindingId',3,-1,NULL,NULL)
,(-9223371740502032363, 2147483717,'NavigationBinding',12,-1,NULL,2147483690)
,(-9223371740502032362, 2147483717,'Format',0,-1,NULL,NULL)
,(-9223371740502032361, 2147483717,'GroupId',3,-1,NULL,NULL)
,(-9223371740502032360, 2147483717,'Group',12,-1,NULL,NULL)
,(-9223371740502032354, 2147483717,'AssociationParentTreeNavDisplays',12,-1,NULL,NULL)
,(-9223371740502032353, 2147483717,'PlaceHolderText_L1',0,-1,-9223371740502032368,NULL)
,(-9223371740502032352, 2147483717,'PlaceHolderText_L2',0,-1,-9223371740502032368,NULL)
,(-9223371740502032351, 2147483717,'PlaceHolderText_L3',0,-1,-9223371740502032368,NULL)
,(-9223371740502032350, 2147483717,'PlaceHolderText_L4',0,-1,-9223371740502032368,NULL)
,(-9223371740502032349, 2147483717,'PlaceHolderText_L5',0,-1,-9223371740502032368,NULL)
,(-9223371740502032348, 2147483717,'PlaceHolderText_L6',0,-1,-9223371740502032368,NULL)
,(-9223371740502032347, 2147483717,'PlaceHolderText_L7',0,-1,-9223371740502032368,NULL)
,(-9223371740502032346, 2147483717,'PlaceHolderText_L8',0,-1,-9223371740502032368,NULL)
,(-9223371740502032345, 2147483717,'ToolTipText_L1',0,-1,-9223371740502032367,NULL)
,(-9223371740502032344, 2147483717,'ToolTipText_L2',0,-1,-9223371740502032367,NULL)
,(-9223371740502032343, 2147483717,'ToolTipText_L3',0,-1,-9223371740502032367,NULL)
,(-9223371740502032342, 2147483717,'ToolTipText_L4',0,-1,-9223371740502032367,NULL)
,(-9223371740502032341, 2147483717,'ToolTipText_L5',0,-1,-9223371740502032367,NULL)
,(-9223371740502032340, 2147483717,'ToolTipText_L6',0,-1,-9223371740502032367,NULL)
,(-9223371740502032339, 2147483717,'ToolTipText_L7',0,-1,-9223371740502032367,NULL)
,(-9223371740502032338, 2147483717,'ToolTipText_L8',0,-1,-9223371740502032367,NULL)
,(-9223371740502032327, 2147483717,'AutocompleteBindingId',3,-1,NULL,NULL)
,(-9223371740502032326, 2147483717,'AutocompleteBinding',12,-1,NULL,2147483690)
,(-9223371740502032325, 2147483717,'MinSearchLength',2,-1,NULL,NULL)
,(-9223371740502032324, 2147483717,'AddedMinutes',2,-1,NULL,NULL)
,(-9223371740502032304, 2147483717,'PlaceHolderText_L9',0,-1,-9223371740502032368,NULL)
,(-9223371740502032303, 2147483717,'PlaceHolderText_L10',0,-1,-9223371740502032368,NULL)
,(-9223371740502032302, 2147483717,'PlaceHolderText_L11',0,-1,-9223371740502032368,NULL)
,(-9223371740502032301, 2147483717,'PlaceHolderText_L12',0,-1,-9223371740502032368,NULL)
,(-9223371740502032300, 2147483717,'PlaceHolderText_L13',0,-1,-9223371740502032368,NULL)
,(-9223371740502032299, 2147483717,'PlaceHolderText_L14',0,-1,-9223371740502032368,NULL)
,(-9223371740502032298, 2147483717,'PlaceHolderText_L15',0,-1,-9223371740502032368,NULL)
,(-9223371740502032297, 2147483717,'PlaceHolderText_L16',0,-1,-9223371740502032368,NULL)
,(-9223371740502032294, 2147483717,'ToolTipText_L9',0,-1,-9223371740502032367,NULL)
,(-9223371740502032293, 2147483717,'ToolTipText_L10',0,-1,-9223371740502032367,NULL)
,(-9223371740502032292, 2147483717,'ToolTipText_L11',0,-1,-9223371740502032367,NULL)
,(-9223371740502032291, 2147483717,'ToolTipText_L12',0,-1,-9223371740502032367,NULL)
,(-9223371740502032290, 2147483717,'ToolTipText_L13',0,-1,-9223371740502032367,NULL)
,(-9223371740502032289, 2147483717,'ToolTipText_L14',0,-1,-9223371740502032367,NULL)
,(-9223371740502032288, 2147483717,'ToolTipText_L15',0,-1,-9223371740502032367,NULL)
,(-9223371740502032287, 2147483717,'ToolTipText_L16',0,-1,-9223371740502032367,NULL)
,(-9223371727617130496, 2147483720,'Id',3,-1,NULL,NULL)
,(-9223371727617130495, 2147483720,'Identifier',0,-1,NULL,NULL)
,(-9223371727617130494, 2147483720,'Workflow1Id',3,-1,NULL,NULL)
,(-9223371727617130493, 2147483720,'Workflow1',12,-1,NULL,2147483675)
,(-9223371727617130492, 2147483720,'Filters',12,-1,NULL,NULL)
,(-9223371727617130480, 2147483720,'DisplayTables',12,-1,NULL,NULL)
,(-9223371727617130464, 2147483720,'Controls',12,-1,NULL,NULL)
,(-9223371723322163200, 2147483721,'Id',3,-1,NULL,NULL)
,(-9223371723322163193, 2147483721,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223371723322163192, 2147483721,'ResourceType',12,-1,NULL,2147483671)
,(-9223371723322163171, 2147483721,'ResourcePropertyMappings',12,-1,NULL,NULL)
,(-9223371723322163160, 2147483721,'ConnectionId',3,-1,NULL,NULL)
,(-9223371723322163159, 2147483721,'Connection',12,-1,NULL,2147483926)
,(-9223371723322163157, 2147483721,'PasswordResetSettingId',3,-1,NULL,NULL)
,(-9223371723322163156, 2147483721,'PasswordResetSetting',12,-1,NULL,2147483723)
,(-9223371723322163150, 2147483721,'C0',0,-1,NULL,NULL)
,(-9223371723322163149, 2147483721,'C1',0,-1,NULL,NULL)
,(-9223371723322163148, 2147483721,'C2',0,-1,NULL,NULL)
,(-9223371723322163147, 2147483721,'C3',0,-1,NULL,NULL)
,(-9223371723322163146, 2147483721,'C4',0,-1,NULL,NULL)
,(-9223371723322163145, 2147483721,'C5',0,-1,NULL,NULL)
,(-9223371723322163144, 2147483721,'C6',0,-1,NULL,NULL)
,(-9223371723322163143, 2147483721,'C7',0,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371723322163142, 2147483721,'C8',0,-1,NULL,NULL)
,(-9223371723322163141, 2147483721,'C9',0,-1,NULL,NULL)
,(-9223371723322163140, 2147483721,'C10',0,-1,NULL,NULL)
,(-9223371719027195904, 2147483722,'Id',3,-1,NULL,NULL)
,(-9223371719027195903, 2147483722,'ResourceTypeMappingId',3,-1,NULL,NULL)
,(-9223371719027195902, 2147483722,'ResourceTypeMapping',12,-1,NULL,2147483721)
,(-9223371719027195901, 2147483722,'PropertyId',3,-1,NULL,NULL)
,(-9223371719027195900, 2147483722,'Property',12,-1,NULL,2147483676)
,(-9223371719027195899, 2147483722,'PropertyMappingId',3,-1,NULL,NULL)
,(-9223371719027195898, 2147483722,'PropertyMapping',12,-1,NULL,2147483801)
,(-9223371719027195874, 2147483722,'C0',0,-1,NULL,NULL)
,(-9223371719027195873, 2147483722,'C1',0,-1,NULL,NULL)
,(-9223371719027195872, 2147483722,'C2',0,-1,NULL,NULL)
,(-9223371719027195871, 2147483722,'C3',0,-1,NULL,NULL)
,(-9223371719027195870, 2147483722,'C4',0,-1,NULL,NULL)
,(-9223371719027195869, 2147483722,'C5',0,-1,NULL,NULL)
,(-9223371719027195868, 2147483722,'C6',0,-1,NULL,NULL)
,(-9223371719027195867, 2147483722,'C7',0,-1,NULL,NULL)
,(-9223371719027195866, 2147483722,'C8',0,-1,NULL,NULL)
,(-9223371719027195865, 2147483722,'C9',0,-1,NULL,NULL)
,(-9223371719027195864, 2147483722,'C10',0,-1,NULL,NULL)
,(-9223371714732228608, 2147483723,'Id',3,-1,NULL,NULL)
,(-9223371714732228607, 2147483723,'Identifier',0,-1,NULL,NULL)
,(-9223371714732228606, 2147483723,'Mode',3,-1,NULL,NULL)
,(-9223371714732228605, 2147483723,'MustChange',5,-1,NULL,NULL)
,(-9223371714732228604, 2147483723,'AutoGenerate',5,-1,NULL,NULL)
,(-9223371714732228603, 2147483723,'DisableNotifications',5,-1,NULL,NULL)
,(-9223371714732228602, 2147483723,'GeneratedLength',2,-1,NULL,NULL)
,(-9223371714732228601, 2147483723,'NotifiedFullNameBindingId',3,-1,NULL,NULL)
,(-9223371714732228600, 2147483723,'NotifiedFullNameBinding',-1,-1,NULL,NULL)
,(-9223371714732228599, 2147483723,'NotifiedEmailBindingId',3,-1,NULL,NULL)
,(-9223371714732228598, 2147483723,'NotifiedEmailBinding',-1,-1,NULL,NULL)
,(-9223371714732228597, 2147483723,'BeneficiaryFullNameBindingId',3,-1,NULL,NULL)
,(-9223371714732228596, 2147483723,'BeneficiaryFullNameBinding',-1,-1,NULL,NULL)
,(-9223371714732228595, 2147483723,'BeneficiaryEmailBindingId',3,-1,NULL,NULL)
,(-9223371714732228594, 2147483723,'BeneficiaryEmailBinding',-1,-1,NULL,NULL)
,(-9223371714732228593, 2147483723,'DefaultPassword',0,-1,NULL,NULL)
,(-9223371714732228592, 2147483723,'StrengthCheck',0,-1,NULL,NULL)
,(-9223371714732228591, 2147483723,'NotificationCC',0,-1,NULL,NULL)
,(-9223371714732228590, 2147483723,'GeneratedLowerCaseCharsCount',2,-1,NULL,NULL)
,(-9223371714732228589, 2147483723,'GeneratedUpperCaseCharsCount',2,-1,NULL,NULL)
,(-9223371714732228588, 2147483723,'PasswordResetSetting',12,-1,NULL,NULL)
,(-9223371714732228587, 2147483723,'GeneratedDigitCharsCount',2,-1,NULL,NULL)
,(-9223371714732228586, 2147483723,'GeneratedSymbolCharsCount',2,-1,NULL,NULL)
,(-9223371384019746816, 2147483800,'Id',3,-1,NULL,NULL)
,(-9223371384019746814, 2147483800,'ConnectorId',3,-1,NULL,NULL)
,(-9223371384019746812, 2147483800,'Connector',12,-1,NULL,2147483673)
,(-9223371384019746811, 2147483800,'EntityPropertyMappings',12,-1,NULL,2147483801)
,(-9223371384019746810, 2147483800,'EntityAssociationMappings',-1,-1,NULL,NULL)
,(-9223371384019746809, 2147483800,'MaximumInsertedLines',2,-1,NULL,NULL)
,(-9223371384019746808, 2147483800,'MaximumDeletedLines',2,-1,NULL,NULL)
,(-9223371384019746807, 2147483800,'MaximumUpdatedLines',2,-1,NULL,NULL)
,(-9223371384019746806, 2147483800,'MaxPercentageInsertedLines',2,-1,NULL,NULL)
,(-9223371384019746805, 2147483800,'MaxPercentageDeletedLines',2,-1,NULL,NULL)
,(-9223371384019746804, 2147483800,'MaxPercentageUpdatedLines',2,-1,NULL,NULL)
,(-9223371384019746803, 2147483800,'EntityType',12,-1,NULL,2147483675)
,(-9223371384019746802, 2147483800,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371384019746796, 2147483800,'ResourceCount',2,-1,NULL,NULL)
,(-9223371384019746795, 2147483800,'C0',0,-1,NULL,NULL)
,(-9223371384019746794, 2147483800,'ResourceTypes',12,-1,NULL,NULL)
,(-9223371384019746793, 2147483800,'TargetResourceTypes',12,-1,NULL,NULL)
,(-9223371384019746782, 2147483800,'ConnectionTable',0,-1,NULL,NULL)
,(-9223371379724779520, 2147483801,'Id',3,-1,NULL,NULL)
,(-9223371379724779519, 2147483801,'ConnectionColumn',0,-1,NULL,NULL)
,(-9223371379724779517, 2147483801,'IsPrimaryKey',5,-1,NULL,NULL)
,(-9223371379724779516, 2147483801,'EntityPropertyId',3,-1,NULL,NULL)
,(-9223371379724779514, 2147483801,'EntityProperty',12,-1,NULL,2147483676)
,(-9223371379724779513, 2147483801,'EntityAssociationMappings1',12,-1,NULL,2147483802)
,(-9223371379724779512, 2147483801,'EntityAssociationMappings2',12,-1,NULL,2147483802)
,(-9223371379724779511, 2147483801,'EntityTypeMappingId',-1,-1,NULL,NULL)
,(-9223371379724779510, 2147483801,'EntityTypeMapping',12,-1,NULL,2147483800)
,(-9223371379724779507, 2147483801,'Format',0,-1,NULL,NULL)
,(-9223371379724779506, 2147483801,'IsUniqueKey',5,-1,NULL,NULL)
,(-9223371379724779505, 2147483801,'UniqueKeyOrder',3,-1,NULL,NULL)
,(-9223371379724779493, 2147483801,'ResourcePropertyMappings',12,-1,NULL,NULL)
,(-9223371375429812224, 2147483802,'Id',3,-1,NULL,NULL)
,(-9223371375429812221, 2147483802,'EntityAssociationId',3,-1,NULL,NULL)
,(-9223371375429812220, 2147483802,'EntityPropertyMapping1Id',3,-1,NULL,NULL)
,(-9223371375429812219, 2147483802,'EntityPropertyMapping2Id',3,-1,NULL,NULL)
,(-9223371375429812218, 2147483802,'Column1',3,-1,NULL,NULL)
,(-9223371375429812217, 2147483802,'Column2',3,-1,NULL,NULL)
,(-9223371375429812215, 2147483802,'EntityPropertyMapping1',12,-1,NULL,2147483801)
,(-9223371375429812214, 2147483802,'EntityPropertyMapping2',12,-1,NULL,2147483801)
,(-9223371375429812211, 2147483802,'MaximumInsertedLines',2,-1,NULL,NULL)
,(-9223371375429812210, 2147483802,'MaximumDeletedLines',2,-1,NULL,NULL)
,(-9223371375429812208, 2147483802,'MaxPercentageInsertedLines',2,-1,NULL,NULL)
,(-9223371375429812207, 2147483802,'MaxPercentageDeletedLines',2,-1,NULL,NULL)
,(-9223371375429812206, 2147483802,'EntityAssociation',12,-1,NULL,2147483677)
,(-9223371375429812204, 2147483802,'ConnectorId',3,-1,NULL,NULL)
,(-9223371375429812203, 2147483802,'Connector',12,-1,NULL,2147483673)
,(-9223371375429812202, 2147483802,'C0',0,-1,NULL,NULL)
,(-9223371375429812200, 2147483802,'ConnectionTable',0,-1,NULL,NULL)
,(-9223371371134844928, 2147483803,'Id',3,-1,NULL,NULL)
,(-9223371371134844927, 2147483803,'Identifier',0,-1,NULL,NULL)
,(-9223371371134844926, 2147483803,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371371134844925, 2147483803,'Controls',12,-1,NULL,NULL)
,(-9223371371134844924, 2147483803,'IsEntityTypeReadForm',5,-1,NULL,NULL)
,(-9223371371134844923, 2147483803,'Title',0,-1,NULL,NULL)
,(-9223371371134844922, 2147483803,'WorkflowRequestType',2,-1,NULL,NULL)
,(-9223371371134844921, 2147483803,'MainPropertyId',3,-1,NULL,NULL)
,(-9223371371134844920, 2147483803,'MainPropertyLabel',0,-1,NULL,NULL)
,(-9223371371134844919, 2147483803,'RecordPropertyId',3,-1,NULL,NULL)
,(-9223371371134844918, 2147483803,'IsDelete',5,-1,NULL,NULL)
,(-9223371371134844917, 2147483803,'FormType',2,-1,NULL,NULL)
,(-9223371371134844916, 2147483803,'MenuId',3,-1,NULL,NULL)
,(-9223371371134844915, 2147483803,'HideRoles',5,-1,NULL,NULL)
,(-9223371371134844914, 2147483803,'RecordStartPropertyId',3,-1,NULL,NULL)
,(-9223371371134844913, 2147483803,'RecordEndPropertyId',3,-1,NULL,NULL)
,(-9223371371134844912, 2147483803,'RecordSortPropertyId',3,-1,NULL,NULL)
,(-9223371371134844911, 2147483803,'RecordFilter',2,-1,NULL,NULL)
,(-9223371371134844910, 2147483803,'RecordTableId',3,-1,NULL,NULL)
,(-9223371371134844909, 2147483803,'HideRecordAddButton',5,-1,NULL,NULL)
,(-9223371371134844908, 2147483803,'HideRecordRemoveButton',5,-1,NULL,NULL)
,(-9223371371134844907, 2147483803,'Title_L1',0,-1,-9223371371134844923,NULL)
,(-9223371371134844906, 2147483803,'Title_L2',0,-1,-9223371371134844923,NULL)
,(-9223371371134844905, 2147483803,'Title_L3',0,-1,-9223371371134844923,NULL)
,(-9223371371134844904, 2147483803,'Title_L4',0,-1,-9223371371134844923,NULL)
,(-9223371371134844903, 2147483803,'Title_L5',0,-1,-9223371371134844923,NULL)
,(-9223371371134844902, 2147483803,'Title_L6',0,-1,-9223371371134844923,NULL)
,(-9223371371134844901, 2147483803,'Title_L7',0,-1,-9223371371134844923,NULL)
,(-9223371371134844900, 2147483803,'Title_L8',0,-1,-9223371371134844923,NULL)
,(-9223371371134844899, 2147483803,'MainPropertyLabel_L1',0,-1,-9223371371134844920,NULL)
,(-9223371371134844898, 2147483803,'MainPropertyLabel_L2',0,-1,-9223371371134844920,NULL)
,(-9223371371134844897, 2147483803,'MainPropertyLabel_L3',0,-1,-9223371371134844920,NULL)
,(-9223371371134844896, 2147483803,'MainPropertyLabel_L4',0,-1,-9223371371134844920,NULL)
,(-9223371371134844895, 2147483803,'MainPropertyLabel_L5',0,-1,-9223371371134844920,NULL)
,(-9223371371134844894, 2147483803,'MainPropertyLabel_L6',0,-1,-9223371371134844920,NULL)
,(-9223371371134844893, 2147483803,'MainPropertyLabel_L7',0,-1,-9223371371134844920,NULL)
,(-9223371371134844892, 2147483803,'MainPropertyLabel_L8',0,-1,-9223371371134844920,NULL)
,(-9223371371134844848, 2147483803,'Title_L9',0,-1,-9223371371134844923,NULL)
,(-9223371371134844847, 2147483803,'Title_L10',0,-1,-9223371371134844923,NULL)
,(-9223371371134844846, 2147483803,'Title_L11',0,-1,-9223371371134844923,NULL)
,(-9223371371134844845, 2147483803,'Title_L12',0,-1,-9223371371134844923,NULL)
,(-9223371371134844844, 2147483803,'Title_L13',0,-1,-9223371371134844923,NULL)
,(-9223371371134844843, 2147483803,'Title_L14',0,-1,-9223371371134844923,NULL)
,(-9223371371134844842, 2147483803,'Title_L15',0,-1,-9223371371134844923,NULL)
,(-9223371371134844841, 2147483803,'Title_L16',0,-1,-9223371371134844923,NULL)
,(-9223371371134844838, 2147483803,'MainPropertyLabel_L9',0,-1,-9223371371134844920,NULL)
,(-9223371371134844837, 2147483803,'MainPropertyLabel_L10',0,-1,-9223371371134844920,NULL)
,(-9223371371134844836, 2147483803,'MainPropertyLabel_L11',0,-1,-9223371371134844920,NULL)
,(-9223371371134844835, 2147483803,'MainPropertyLabel_L12',0,-1,-9223371371134844920,NULL)
,(-9223371371134844834, 2147483803,'MainPropertyLabel_L13',0,-1,-9223371371134844920,NULL)
,(-9223371371134844833, 2147483803,'MainPropertyLabel_L14',0,-1,-9223371371134844920,NULL)
,(-9223371371134844832, 2147483803,'MainPropertyLabel_L15',0,-1,-9223371371134844920,NULL)
,(-9223371371134844831, 2147483803,'MainPropertyLabel_L16',0,-1,-9223371371134844920,NULL)
,(-9223371371134844828, 2147483803,'TableTitle',0,-1,NULL,NULL)
,(-9223371371134844827, 2147483803,'TableTitle_L1',0,-1,-9223371371134844828,NULL)
,(-9223371371134844826, 2147483803,'TableTitle_L2',0,-1,-9223371371134844828,NULL)
,(-9223371371134844825, 2147483803,'TableTitle_L3',0,-1,-9223371371134844828,NULL)
,(-9223371371134844824, 2147483803,'TableTitle_L4',0,-1,-9223371371134844828,NULL)
,(-9223371371134844823, 2147483803,'TableTitle_L5',0,-1,-9223371371134844828,NULL)
,(-9223371371134844822, 2147483803,'TableTitle_L6',0,-1,-9223371371134844828,NULL)
,(-9223371371134844821, 2147483803,'TableTitle_L7',0,-1,-9223371371134844828,NULL)
,(-9223371371134844820, 2147483803,'TableTitle_L8',0,-1,-9223371371134844828,NULL)
,(-9223371371134844819, 2147483803,'TableTitle_L9',0,-1,-9223371371134844828,NULL)
,(-9223371371134844818, 2147483803,'TableTitle_L10',0,-1,-9223371371134844828,NULL)
,(-9223371371134844817, 2147483803,'TableTitle_L11',0,-1,-9223371371134844828,NULL)
,(-9223371371134844816, 2147483803,'TableTitle_L12',0,-1,-9223371371134844828,NULL)
,(-9223371371134844815, 2147483803,'TableTitle_L13',0,-1,-9223371371134844828,NULL)
,(-9223371371134844814, 2147483803,'TableTitle_L14',0,-1,-9223371371134844828,NULL)
,(-9223371371134844813, 2147483803,'TableTitle_L15',0,-1,-9223371371134844828,NULL)
,(-9223371371134844812, 2147483803,'TableTitle_L16',0,-1,-9223371371134844828,NULL)
,(-9223371371134844811, 2147483803,'AddRowLabel',0,-1,NULL,NULL)
,(-9223371371134844810, 2147483803,'AddRowLabel_L1',0,-1,-9223371371134844811,NULL)
,(-9223371371134844809, 2147483803,'AddRowLabel_L2',0,-1,-9223371371134844811,NULL)
,(-9223371371134844808, 2147483803,'AddRowLabel_L3',0,-1,-9223371371134844811,NULL)
,(-9223371371134844807, 2147483803,'AddRowLabel_L4',0,-1,-9223371371134844811,NULL)
,(-9223371371134844806, 2147483803,'AddRowLabel_L5',0,-1,-9223371371134844811,NULL)
,(-9223371371134844805, 2147483803,'AddRowLabel_L6',0,-1,-9223371371134844811,NULL)
,(-9223371371134844804, 2147483803,'AddRowLabel_L7',0,-1,-9223371371134844811,NULL)
,(-9223371371134844803, 2147483803,'AddRowLabel_L8',0,-1,-9223371371134844811,NULL)
,(-9223371371134844802, 2147483803,'AddRowLabel_L9',0,-1,-9223371371134844811,NULL)
,(-9223371371134844801, 2147483803,'AddRowLabel_L10',0,-1,-9223371371134844811,NULL)
,(-9223371371134844800, 2147483803,'AddRowLabel_L11',0,-1,-9223371371134844811,NULL)
,(-9223371371134844799, 2147483803,'AddRowLabel_L12',0,-1,-9223371371134844811,NULL)
,(-9223371371134844798, 2147483803,'AddRowLabel_L13',0,-1,-9223371371134844811,NULL)
,(-9223371371134844797, 2147483803,'AddRowLabel_L14',0,-1,-9223371371134844811,NULL)
,(-9223371371134844796, 2147483803,'AddRowLabel_L15',0,-1,-9223371371134844811,NULL)
,(-9223371371134844795, 2147483803,'AddRowLabel_L16',0,-1,-9223371371134844811,NULL)
,(-9223371371134844794, 2147483803,'RemoveRowLabel',0,-1,NULL,NULL)
,(-9223371371134844793, 2147483803,'RemoveRowLabel_L1',0,-1,-9223371371134844794,NULL)
,(-9223371371134844792, 2147483803,'RemoveRowLabel_L2',0,-1,-9223371371134844794,NULL)
,(-9223371371134844791, 2147483803,'RemoveRowLabel_L3',0,-1,-9223371371134844794,NULL)
,(-9223371371134844790, 2147483803,'RemoveRowLabel_L4',0,-1,-9223371371134844794,NULL)
,(-9223371371134844789, 2147483803,'RemoveRowLabel_L5',0,-1,-9223371371134844794,NULL)
,(-9223371371134844788, 2147483803,'RemoveRowLabel_L6',0,-1,-9223371371134844794,NULL)
,(-9223371371134844787, 2147483803,'RemoveRowLabel_L7',0,-1,-9223371371134844794,NULL)
,(-9223371371134844786, 2147483803,'RemoveRowLabel_L8',0,-1,-9223371371134844794,NULL)
,(-9223371371134844785, 2147483803,'RemoveRowLabel_L9',0,-1,-9223371371134844794,NULL)
,(-9223371371134844784, 2147483803,'RemoveRowLabel_L10',0,-1,-9223371371134844794,NULL)
,(-9223371371134844783, 2147483803,'RemoveRowLabel_L11',0,-1,-9223371371134844794,NULL)
,(-9223371371134844782, 2147483803,'RemoveRowLabel_L12',0,-1,-9223371371134844794,NULL)
,(-9223371371134844781, 2147483803,'RemoveRowLabel_L13',0,-1,-9223371371134844794,NULL)
,(-9223371371134844780, 2147483803,'RemoveRowLabel_L14',0,-1,-9223371371134844794,NULL)
,(-9223371371134844779, 2147483803,'RemoveRowLabel_L15',0,-1,-9223371371134844794,NULL)
,(-9223371371134844778, 2147483803,'RemoveRowLabel_L16',0,-1,-9223371371134844794,NULL)
,(-9223371366839877632, 2147483804,'Id',3,-1,NULL,NULL)
,(-9223371366839877630, 2147483804,'DisplayName',0,-1,NULL,NULL)
,(-9223371366839877629, 2147483804,'OutputType',2,-1,NULL,NULL)
,(-9223371366839877628, 2147483804,'FormId',3,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371366839877627, 2147483804,'Form',12,-1,NULL,2147483803)
,(-9223371366839877626, 2147483804,'ParentId',3,-1,NULL,NULL)
,(-9223371366839877625, 2147483804,'Parent',12,-1,NULL,2147483804)
,(-9223371366839877624, 2147483804,'Children',12,-1,NULL,NULL)
,(-9223371366839877623, 2147483804,'BindingId',3,-1,NULL,NULL)
,(-9223371366839877622, 2147483804,'Binding',12,-1,NULL,2147483690)
,(-9223371366839877621, 2147483804,'DisplayOrder',2,-1,NULL,NULL)
,(-9223371366839877620, 2147483804,'InputType',2,-1,NULL,NULL)
,(-9223371366839877619, 2147483804,'IsRequired',5,-1,NULL,NULL)
,(-9223371366839877618, 2147483804,'IsReadOnly',5,-1,NULL,NULL)
,(-9223371366839877617, 2147483804,'PlaceHolderText',0,-1,NULL,NULL)
,(-9223371366839877616, 2147483804,'TileId',-1,-1,NULL,NULL)
,(-9223371366839877615, 2147483804,'Tile',12,-1,NULL,2147483698)
,(-9223371366839877614, 2147483804,'DisplayTableId',-1,-1,NULL,NULL)
,(-9223371366839877613, 2147483804,'DisplayTable',12,-1,NULL,2147483687)
,(-9223371366839877612, 2147483804,'EmbeddedFormId',3,-1,NULL,NULL)
,(-9223371366839877611, 2147483804,'ColumnSize',2,-1,NULL,NULL)
,(-9223371366839877610, 2147483804,'FilterBinding1Id',3,-1,NULL,NULL)
,(-9223371366839877609, 2147483804,'FilterBinding1',12,-1,NULL,2147483690)
,(-9223371366839877608, 2147483804,'LinkedBinding1Id',3,-1,NULL,NULL)
,(-9223371366839877607, 2147483804,'LinkedBinding1',12,-1,NULL,2147483690)
,(-9223371366839877606, 2147483804,'FilterBinding2Id',3,-1,NULL,NULL)
,(-9223371366839877605, 2147483804,'FilterBinding2',12,-1,NULL,2147483690)
,(-9223371366839877604, 2147483804,'LinkedBinding2Id',3,-1,NULL,NULL)
,(-9223371366839877603, 2147483804,'LinkedBinding2',12,-1,NULL,2147483690)
,(-9223371366839877602, 2147483804,'ExtensionIdentifier',0,-1,NULL,NULL)
,(-9223371366839877601, 2147483804,'HomonymEntityLinkId',3,-1,NULL,2147483720)
,(-9223371366839877599, 2147483804,'NavigationBinding',12,-1,NULL,2147483690)
,(-9223371366839877598, 2147483804,'NavigationBindingId',3,-1,NULL,NULL)
,(-9223371366839877597, 2147483804,'DefaultValueBindingId',3,-1,NULL,NULL)
,(-9223371366839877596, 2147483804,'DefaultValueBinding',12,-1,NULL,2147483690)
,(-9223371366839877593, 2147483804,'Name',0,-1,NULL,NULL)
,(-9223371366839877592, 2147483804,'AddedMinutes',2,-1,NULL,NULL)
,(-9223371366839877591, 2147483804,'DisplayName_L1',0,-1,-9223371366839877630,NULL)
,(-9223371366839877590, 2147483804,'DisplayName_L2',0,-1,-9223371366839877630,NULL)
,(-9223371366839877589, 2147483804,'DisplayName_L3',0,-1,-9223371366839877630,NULL)
,(-9223371366839877588, 2147483804,'DisplayName_L4',0,-1,-9223371366839877630,NULL)
,(-9223371366839877587, 2147483804,'DisplayName_L5',0,-1,-9223371366839877630,NULL)
,(-9223371366839877586, 2147483804,'DisplayName_L6',0,-1,-9223371366839877630,NULL)
,(-9223371366839877585, 2147483804,'DisplayName_L7',0,-1,-9223371366839877630,NULL)
,(-9223371366839877584, 2147483804,'DisplayName_L8',0,-1,-9223371366839877630,NULL)
,(-9223371366839877583, 2147483804,'PlaceHolderText_L1',0,-1,-9223371366839877617,NULL)
,(-9223371366839877582, 2147483804,'PlaceHolderText_L2',0,-1,-9223371366839877617,NULL)
,(-9223371366839877581, 2147483804,'PlaceHolderText_L3',0,-1,-9223371366839877617,NULL)
,(-9223371366839877580, 2147483804,'PlaceHolderText_L4',0,-1,-9223371366839877617,NULL)
,(-9223371366839877579, 2147483804,'PlaceHolderText_L5',0,-1,-9223371366839877617,NULL)
,(-9223371366839877578, 2147483804,'PlaceHolderText_L6',0,-1,-9223371366839877617,NULL)
,(-9223371366839877577, 2147483804,'PlaceHolderText_L7',0,-1,-9223371366839877617,NULL)
,(-9223371366839877576, 2147483804,'PlaceHolderText_L8',0,-1,-9223371366839877617,NULL)
,(-9223371366839877562, 2147483804,'DisplayName_L9',0,-1,-9223371366839877630,NULL)
,(-9223371366839877561, 2147483804,'DisplayName_L10',0,-1,-9223371366839877630,NULL)
,(-9223371366839877560, 2147483804,'DisplayName_L11',0,-1,-9223371366839877630,NULL)
,(-9223371366839877559, 2147483804,'DisplayName_L12',0,-1,-9223371366839877630,NULL)
,(-9223371366839877558, 2147483804,'DisplayName_L13',0,-1,-9223371366839877630,NULL)
,(-9223371366839877557, 2147483804,'DisplayName_L14',0,-1,-9223371366839877630,NULL)
,(-9223371366839877556, 2147483804,'DisplayName_L15',0,-1,-9223371366839877630,NULL)
,(-9223371366839877555, 2147483804,'DisplayName_L16',0,-1,-9223371366839877630,NULL)
,(-9223371366839877532, 2147483804,'PlaceHolderText_L9',0,-1,-9223371366839877617,NULL)
,(-9223371366839877531, 2147483804,'PlaceHolderText_L10',0,-1,-9223371366839877617,NULL)
,(-9223371366839877530, 2147483804,'PlaceHolderText_L11',0,-1,-9223371366839877617,NULL)
,(-9223371366839877529, 2147483804,'PlaceHolderText_L12',0,-1,-9223371366839877617,NULL)
,(-9223371366839877528, 2147483804,'PlaceHolderText_L13',0,-1,-9223371366839877617,NULL)
,(-9223371366839877527, 2147483804,'PlaceHolderText_L14',0,-1,-9223371366839877617,NULL)
,(-9223371366839877526, 2147483804,'PlaceHolderText_L15',0,-1,-9223371366839877617,NULL)
,(-9223371366839877525, 2147483804,'PlaceHolderText_L16',0,-1,-9223371366839877617,NULL)
,(-9223371366839877524, 2147483804,'Binding2Id',3,-1,NULL,NULL)
,(-9223371366839877523, 2147483804,'Binding2',12,-1,NULL,2147483690)
,(-9223371366839877522, 2147483804,'Binding3Id',3,-1,NULL,NULL)
,(-9223371366839877521, 2147483804,'Binding3',12,-1,NULL,2147483690)
,(-9223371362544910336, 2147483805,'Id',3,-1,NULL,NULL)
,(-9223371362544910335, 2147483805,'Identifier',0,-1,NULL,NULL)
,(-9223371362544910334, 2147483805,'C0',0,-1,NULL,NULL)
,(-9223371362544910333, 2147483805,'C1',0,-1,NULL,NULL)
,(-9223371362544910332, 2147483805,'C2',0,-1,NULL,NULL)
,(-9223371362544910331, 2147483805,'C3',0,-1,NULL,NULL)
,(-9223371362544910330, 2147483805,'C4',0,-1,NULL,NULL)
,(-9223371362544910329, 2147483805,'C5',0,-1,NULL,NULL)
,(-9223371362544910328, 2147483805,'C6',0,-1,NULL,NULL)
,(-9223371362544910327, 2147483805,'C7',0,-1,NULL,NULL)
,(-9223371358249943040, 2147483806,'Id',3,-1,NULL,NULL)
,(-9223371358249943039, 2147483806,'Policy',12,-1,NULL,2147483669)
,(-9223371358249943038, 2147483806,'PolicyId',3,-1,NULL,NULL)
,(-9223371358249943037, 2147483806,'ResourceType',12,-1,NULL,2147483671)
,(-9223371358249943036, 2147483806,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223371358249943035, 2147483806,'Property',12,-1,NULL,2147483676)
,(-9223371358249943034, 2147483806,'PropertyId',3,-1,NULL,NULL)
,(-9223371358249943033, 2147483806,'Binding',12,-1,NULL,2147483690)
,(-9223371358249943032, 2147483806,'BindingId',3,-1,NULL,NULL)
,(-9223371358249943031, 2147483806,'Expression',0,-1,NULL,NULL)
,(-9223371358249943030, 2147483806,'TimeOffsetReference',2,-1,NULL,NULL)
,(-9223371358249943029, 2147483806,'TimeOffsetBeforeReference',2,-1,NULL,NULL)
,(-9223371358249943028, 2147483806,'TimeOffsetAfterReference',2,-1,NULL,NULL)
,(-9223371358249943027, 2147483806,'ComparisonType',2,-1,NULL,NULL)
,(-9223371358249943026, 2147483806,'IsMapped',5,-1,NULL,NULL)
,(-9223371358249943025, 2147483806,'SingleRoleId',3,-1,NULL,NULL)
,(-9223371358249943024, 2147483806,'SingleRole',12,-1,NULL,2147483667)
,(-9223371358249943000, 2147483806,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371358249942999, 2147483806,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223371358249942998, 2147483806,'BaseRule',12,-1,NULL,2147483806)
,(-9223371358249942997, 2147483806,'RuleBase',12,-1,NULL,NULL)
,(-9223371358249942912, 2147483806,'WhenCreated',4,-1,NULL,NULL)
,(-9223371358249942911, 2147483806,'CreatedById',3,-1,NULL,NULL)
,(-9223371358249942910, 2147483806,'CreatedBy',12,-1,NULL,NULL)
,(-9223371358249942909, 2147483806,'WhenChanged',4,-1,NULL,NULL)
,(-9223371358249942908, 2147483806,'ChangedById',3,-1,NULL,NULL)
,(-9223371358249942907, 2147483806,'ChangedBy',12,-1,NULL,NULL)
,(-9223371353954975744, 2147483807,'Id',3,-1,NULL,NULL)
,(-9223371353954975743, 2147483807,'Identifier',0,-1,NULL,NULL)
,(-9223371353954975742, 2147483807,'AssignedProfiles',12,-1,NULL,NULL)
,(-9223371353954975741, 2147483807,'DisplayName',0,-1,NULL,NULL)
,(-9223371353954975740, 2147483807,'DisplayName_L1',0,-1,-9223371353954975741,NULL)
,(-9223371353954975739, 2147483807,'DisplayName_L2',0,-1,-9223371353954975741,NULL)
,(-9223371353954975738, 2147483807,'DisplayName_L3',0,-1,-9223371353954975741,NULL)
,(-9223371353954975737, 2147483807,'DisplayName_L4',0,-1,-9223371353954975741,NULL)
,(-9223371353954975736, 2147483807,'DisplayName_L5',0,-1,-9223371353954975741,NULL)
,(-9223371353954975735, 2147483807,'DisplayName_L6',0,-1,-9223371353954975741,NULL)
,(-9223371353954975734, 2147483807,'DisplayName_L7',0,-1,-9223371353954975741,NULL)
,(-9223371353954975733, 2147483807,'DisplayName_L8',0,-1,-9223371353954975741,NULL)
,(-9223371353954975732, 2147483807,'Rules',12,-1,NULL,NULL)
,(-9223371353954975664, 2147483807,'DisplayName_L9',0,-1,-9223371353954975741,NULL)
,(-9223371353954975663, 2147483807,'DisplayName_L10',0,-1,-9223371353954975741,NULL)
,(-9223371353954975662, 2147483807,'DisplayName_L11',0,-1,-9223371353954975741,NULL)
,(-9223371353954975661, 2147483807,'DisplayName_L12',0,-1,-9223371353954975741,NULL)
,(-9223371353954975660, 2147483807,'DisplayName_L13',0,-1,-9223371353954975741,NULL)
,(-9223371353954975659, 2147483807,'DisplayName_L14',0,-1,-9223371353954975741,NULL)
,(-9223371353954975658, 2147483807,'DisplayName_L15',0,-1,-9223371353954975741,NULL)
,(-9223371353954975657, 2147483807,'DisplayName_L16',0,-1,-9223371353954975741,NULL)
,(-9223371353954975656, 2147483807,'IsComponent',5,-1,NULL,NULL)
,(-9223371349660008448, 2147483808,'Id',3,-1,NULL,NULL)
,(-9223371349660008447, 2147483808,'ProfileId',3,-1,NULL,NULL)
,(-9223371349660008446, 2147483808,'UserId',3,-1,NULL,NULL)
,(-9223371349660008445, 2147483808,'ContextId',3,-1,NULL,NULL)
,(-9223371349660008444, 2147483808,'IsDenied',5,-1,NULL,NULL)
,(-9223371349660008443, 2147483808,'AccessState',2,-1,NULL,NULL)
,(-9223371349660008442, 2147483808,'Profile',12,-1,NULL,2147483807)
,(-9223371349660008441, 2147483808,'Context',12,-1,NULL,2147483809)
,(-9223371349660008440, 2147483808,'User',12,-1,NULL,2147483670)
,(-9223371349660008439, 2147483808,'StartDate',4,-1,NULL,NULL)
,(-9223371349660008438, 2147483808,'EndDate',4,-1,NULL,NULL)
,(-9223371349660008437, 2147483808,'Email',0,-1,NULL,NULL)
,(-9223371345365041152, 2147483809,'Id',3,-1,NULL,NULL)
,(-9223371345365041151, 2147483809,'AssignedProfiles',12,-1,NULL,2147483808)
,(-9223371345365041150, 2147483809,'IsAutomatic',5,-1,NULL,NULL)
,(-9223371345365041149, 2147483809,'CategoryId',3,-1,NULL,NULL)
,(-9223371345365041148, 2147483809,'Category',12,-1,NULL,2147483668)
,(-9223371345365041147, 2147483809,'CompositeRole',12,-1,NULL,2147483693)
,(-9223371345365041146, 2147483809,'CompositeRoleId',3,-1,NULL,NULL)
,(-9223371345365041145, 2147483809,'SingleRole',12,-1,NULL,2147483667)
,(-9223371345365041144, 2147483809,'SingleRoleId',3,-1,NULL,NULL)
,(-9223371345365041143, 2147483809,'ResourceType',12,-1,NULL,2147483671)
,(-9223371345365041142, 2147483809,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223371336775106560, 2147483811,'Id',3,-1,NULL,NULL)
,(-9223371336775106559, 2147483811,'Identifier',0,-1,NULL,NULL)
,(-9223371336775106558, 2147483811,'State',2,-1,NULL,NULL)
,(-9223371336775106556, 2147483811,'DisplayName',0,-1,NULL,NULL)
,(-9223371336775106554, 2147483811,'TaskType',2,-1,NULL,NULL)
,(-9223371336775106553, 2147483811,'Agent',12,-1,NULL,NULL)
,(-9223371336775106552, 2147483811,'AgentId',3,-1,NULL,NULL)
,(-9223371336775106551, 2147483811,'OpenIdClient_Id',3,-1,NULL,NULL)
,(-9223371336775106550, 2147483811,'OpenIdClient',12,-1,NULL,NULL)
,(-9223371336775106549, 2147483811,'SessionOff',5,-1,NULL,NULL)
,(-9223371336775106547, 2147483811,'BatchSize',2,-1,NULL,NULL)
,(-9223371336775106546, 2147483811,'Mode',2,-1,NULL,NULL)
,(-9223371336775106545, 2147483811,'Connector_Id',3,-1,NULL,NULL)
,(-9223371336775106544, 2147483811,'Check',5,-1,NULL,NULL)
,(-9223371336775106543, 2147483811,'SplitSize',2,-1,NULL,NULL)
,(-9223371336775106542, 2147483811,'InputPath',0,-1,NULL,NULL)
,(-9223371336775106541, 2147483811,'OutputPath',0,-1,NULL,NULL)
,(-9223371336775106540, 2147483811,'SynchronizationJobIdentifier',0,-1,NULL,NULL)
,(-9223371336775106539, 2147483811,'ProvisioningJobIdentifier',0,-1,NULL,NULL)
,(-9223371336775106538, 2147483811,'Dirty',5,-1,NULL,NULL)
,(-9223371336775106537, 2147483811,'BlockProvisioning',5,-1,NULL,NULL)
,(-9223371336775106536, 2147483811,'DoNotDeleteChanges',5,-1,NULL,NULL)
,(-9223371336775106535, 2147483811,'AllEntityType',5,-1,NULL,NULL)
,(-9223371336775106533, 2147483811,'BatchSelectSize',2,-1,NULL,NULL)
,(-9223371336775106532, 2147483811,'BatchUpdateSize',2,-1,NULL,NULL)
,(-9223371336775106531, 2147483811,'BatchInsertSize',2,-1,NULL,NULL)
,(-9223371336775106530, 2147483811,'DisplayName_L1',0,-1,-9223371336775106556,NULL)
,(-9223371336775106529, 2147483811,'DisplayName_L2',0,-1,-9223371336775106556,NULL)
,(-9223371336775106528, 2147483811,'DisplayName_L3',0,-1,-9223371336775106556,NULL)
,(-9223371336775106527, 2147483811,'DisplayName_L4',0,-1,-9223371336775106556,NULL)
,(-9223371336775106526, 2147483811,'DisplayName_L5',0,-1,-9223371336775106556,NULL)
,(-9223371336775106525, 2147483811,'DisplayName_L6',0,-1,-9223371336775106556,NULL)
,(-9223371336775106524, 2147483811,'DisplayName_L7',0,-1,-9223371336775106556,NULL)
,(-9223371336775106523, 2147483811,'DisplayName_L8',0,-1,-9223371336775106556,NULL)
,(-9223371336775106519, 2147483811,'InformationSystemIdentifier',0,-1,NULL,NULL)
,(-9223371336775106518, 2147483811,'IgnoreCookieFile',5,-1,NULL,NULL)
,(-9223371336775106515, 2147483811,'GeneratedFile',0,-1,NULL,NULL)
,(-9223371336775106514, 2147483811,'GeneratedCodePath',0,-1,NULL,NULL)
,(-9223371336775106513, 2147483811,'GeneratedCodeNamespace',0,-1,NULL,NULL)
,(-9223371336775106512, 2147483811,'AssignedResourceTypeSQL',0,-1,NULL,NULL)
,(-9223371336775106511, 2147483811,'AssignedResourceScalarSQL',0,-1,NULL,NULL)
,(-9223371336775106510, 2147483811,'AssignedResourceNavigationSQL',0,-1,NULL,NULL)
,(-9223371336775106509, 2147483811,'HttpCommand',10,-1,NULL,NULL)
,(-9223371336775106508, 2147483811,'ApiUrl',0,-1,NULL,NULL)
,(-9223371336775106507, 2147483811,'ContinueOnError',5,-1,NULL,NULL)
,(-9223371336775106506, 2147483811,'IgnoreHistorization',5,-1,NULL,NULL)
,(-9223371336775106503, 2147483811,'LogLevel',2,-1,NULL,NULL)
,(-9223371336775106502, 2147483811,'Level',2,-1,NULL,NULL)
,(-9223371336775106480, 2147483811,'DisplayName_L9',0,-1,-9223371336775106556,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371336775106479, 2147483811,'DisplayName_L10',0,-1,-9223371336775106556,NULL)
,(-9223371336775106478, 2147483811,'DisplayName_L11',0,-1,-9223371336775106556,NULL)
,(-9223371336775106477, 2147483811,'DisplayName_L12',0,-1,-9223371336775106556,NULL)
,(-9223371336775106476, 2147483811,'DisplayName_L13',0,-1,-9223371336775106556,NULL)
,(-9223371336775106475, 2147483811,'DisplayName_L14',0,-1,-9223371336775106556,NULL)
,(-9223371336775106474, 2147483811,'DisplayName_L15',0,-1,-9223371336775106556,NULL)
,(-9223371336775106473, 2147483811,'DisplayName_L16',0,-1,-9223371336775106556,NULL)
,(-9223371336775106470, 2147483811,'JobStep',12,-1,NULL,2147483846)
,(-9223371336775106469, 2147483811,'TaskEntityType',12,-1,NULL,NULL)
,(-9223371336775106468, 2147483811,'TaskResourceType',12,-1,NULL,NULL)
,(-9223371336775106467, 2147483811,'TaskInstance',12,-1,NULL,NULL)
,(-9223371336775106466, 2147483811,'TaskDimension',12,-1,NULL,NULL)
,(-9223371336775106464, 2147483811,'DependOnChildTask',12,-1,NULL,NULL)
,(-9223371336775106463, 2147483811,'DependOnParentTask',12,-1,NULL,NULL)
,(-9223371336775106462, 2147483811,'Child',-1,-1,NULL,NULL)
,(-9223371336775106461, 2147483811,'Parent',12,-1,NULL,2147483811)
,(-9223371336775106460, 2147483811,'DependOnChild',-1,-1,NULL,NULL)
,(-9223371336775106459, 2147483811,'DependOnParent',12,-1,NULL,NULL)
,(-9223371336775106458, 2147483811,'ResourceTypes',12,-1,NULL,2147483671)
,(-9223371336775106457, 2147483811,'EntityTypes',12,-1,NULL,2147483675)
,(-9223371336775106456, 2147483811,'Dimensions',12,-1,NULL,2147483685)
,(-9223371336775106455, 2147483811,'Connector',12,-1,NULL,NULL)
,(-9223371336775106454, 2147483811,'ConnectionIdentifier',0,-1,NULL,NULL)
,(-9223371332480139264, 2147483812,'Id',3,-1,NULL,NULL)
,(-9223371332480139263, 2147483812,'Identifier',0,-1,NULL,NULL)
,(-9223371332480139262, 2147483812,'DisplayName',0,-1,NULL,NULL)
,(-9223371332480139260, 2147483812,'URI',0,-1,NULL,NULL)
,(-9223371332480139259, 2147483812,'Connectors',12,-1,NULL,2147483673)
,(-9223371332480139258, 2147483812,'Tasks',12,-1,NULL,2147483811)
,(-9223371332480139257, 2147483812,'DisplayName_L1',0,-1,-9223371332480139262,NULL)
,(-9223371332480139256, 2147483812,'DisplayName_L2',0,-1,-9223371332480139262,NULL)
,(-9223371332480139255, 2147483812,'DisplayName_L3',0,-1,-9223371332480139262,NULL)
,(-9223371332480139254, 2147483812,'DisplayName_L4',0,-1,-9223371332480139262,NULL)
,(-9223371332480139253, 2147483812,'DisplayName_L5',0,-1,-9223371332480139262,NULL)
,(-9223371332480139252, 2147483812,'DisplayName_L6',0,-1,-9223371332480139262,NULL)
,(-9223371332480139251, 2147483812,'DisplayName_L7',0,-1,-9223371332480139262,NULL)
,(-9223371332480139250, 2147483812,'DisplayName_L8',0,-1,-9223371332480139262,NULL)
,(-9223371332480139249, 2147483812,'Jobs',12,-1,NULL,2147483845)
,(-9223371332480139248, 2147483812,'TaskInstances',12,-1,NULL,NULL)
,(-9223371332480139184, 2147483812,'DisplayName_L9',0,-1,-9223371332480139262,NULL)
,(-9223371332480139183, 2147483812,'DisplayName_L10',0,-1,-9223371332480139262,NULL)
,(-9223371332480139182, 2147483812,'DisplayName_L11',0,-1,-9223371332480139262,NULL)
,(-9223371332480139181, 2147483812,'DisplayName_L12',0,-1,-9223371332480139262,NULL)
,(-9223371332480139180, 2147483812,'DisplayName_L13',0,-1,-9223371332480139262,NULL)
,(-9223371332480139179, 2147483812,'DisplayName_L14',0,-1,-9223371332480139262,NULL)
,(-9223371332480139178, 2147483812,'DisplayName_L15',0,-1,-9223371332480139262,NULL)
,(-9223371332480139177, 2147483812,'DisplayName_L16',0,-1,-9223371332480139262,NULL)
,(-9223371302415368192, 2147483819,'Id',3,-1,NULL,NULL)
,(-9223371302415368191, 2147483819,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371302415368189, 2147483819,'BindingId',3,-1,NULL,NULL)
,(-9223371302415368188, 2147483819,'ComparisonOperator',9,-1,NULL,NULL)
,(-9223371302415368186, 2147483819,'EntityType',12,-1,NULL,2147483675)
,(-9223371302415368185, 2147483819,'Binding',12,-1,NULL,2147483690)
,(-9223371302415368184, 2147483819,'Items',12,-1,NULL,NULL)
,(-9223371302415368183, 2147483819,'Order',2,-1,NULL,NULL)
,(-9223371302415368182, 2147483819,'OptimizedBindingId',3,-1,NULL,NULL)
,(-9223371302415368181, 2147483819,'OptimizedBinding',12,-1,NULL,2147483690)
,(-9223371298120400896, 2147483820,'Id',3,-1,NULL,NULL)
,(-9223371298120400895, 2147483820,'IndicatorId',3,-1,NULL,NULL)
,(-9223371298120400893, 2147483820,'Value',0,-1,NULL,NULL)
,(-9223371298120400890, 2147483820,'Indicator',12,-1,NULL,2147483819)
,(-9223371298120400889, 2147483820,'Color',0,-1,NULL,NULL)
,(-9223371298120400888, 2147483820,'Priority',2,-1,NULL,NULL)
,(-9223371298120400878, 2147483820,'DisplayName',0,-1,NULL,NULL)
,(-9223371298120400877, 2147483820,'DisplayName_L1',0,-1,-9223371298120400878,NULL)
,(-9223371298120400876, 2147483820,'DisplayName_L2',0,-1,-9223371298120400878,NULL)
,(-9223371298120400875, 2147483820,'DisplayName_L3',0,-1,-9223371298120400878,NULL)
,(-9223371298120400874, 2147483820,'DisplayName_L4',0,-1,-9223371298120400878,NULL)
,(-9223371298120400873, 2147483820,'DisplayName_L5',0,-1,-9223371298120400878,NULL)
,(-9223371298120400872, 2147483820,'DisplayName_L6',0,-1,-9223371298120400878,NULL)
,(-9223371298120400871, 2147483820,'DisplayName_L7',0,-1,-9223371298120400878,NULL)
,(-9223371298120400870, 2147483820,'DisplayName_L8',0,-1,-9223371298120400878,NULL)
,(-9223371298120400816, 2147483820,'DisplayName_L9',0,-1,-9223371298120400878,NULL)
,(-9223371298120400815, 2147483820,'DisplayName_L10',0,-1,-9223371298120400878,NULL)
,(-9223371298120400814, 2147483820,'DisplayName_L11',0,-1,-9223371298120400878,NULL)
,(-9223371298120400813, 2147483820,'DisplayName_L12',0,-1,-9223371298120400878,NULL)
,(-9223371298120400812, 2147483820,'DisplayName_L13',0,-1,-9223371298120400878,NULL)
,(-9223371298120400811, 2147483820,'DisplayName_L14',0,-1,-9223371298120400878,NULL)
,(-9223371298120400810, 2147483820,'DisplayName_L15',0,-1,-9223371298120400878,NULL)
,(-9223371298120400809, 2147483820,'DisplayName_L16',0,-1,-9223371298120400878,NULL)
,(-9223371190746218496, 2147483845,'Id',3,-1,NULL,NULL)
,(-9223371190746218495, 2147483845,'DisplayName',0,-1,NULL,NULL)
,(-9223371190746218494, 2147483845,'Identifier',0,-1,NULL,NULL)
,(-9223371190746218493, 2147483845,'DisplayName_L1',0,-1,-9223371190746218495,NULL)
,(-9223371190746218492, 2147483845,'DisplayName_L2',0,-1,-9223371190746218495,NULL)
,(-9223371190746218491, 2147483845,'DisplayName_L3',0,-1,-9223371190746218495,NULL)
,(-9223371190746218490, 2147483845,'DisplayName_L4',0,-1,-9223371190746218495,NULL)
,(-9223371190746218489, 2147483845,'DisplayName_L5',0,-1,-9223371190746218495,NULL)
,(-9223371190746218488, 2147483845,'DisplayName_L6',0,-1,-9223371190746218495,NULL)
,(-9223371190746218487, 2147483845,'DisplayName_L7',0,-1,-9223371190746218495,NULL)
,(-9223371190746218486, 2147483845,'DisplayName_L8',0,-1,-9223371190746218495,NULL)
,(-9223371190746218485, 2147483845,'CronTabExpression',0,-1,NULL,NULL)
,(-9223371190746218484, 2147483845,'UserStartDenied',5,-1,NULL,NULL)
,(-9223371190746218483, 2147483845,'Agent',12,-1,NULL,NULL)
,(-9223371190746218482, 2147483845,'AgentId',3,-1,NULL,NULL)
,(-9223371190746218481, 2147483845,'LastJobInstanceId',3,-1,NULL,NULL)
,(-9223371190746218480, 2147483845,'LastJobInstance',12,-1,NULL,NULL)
,(-9223371190746218479, 2147483845,'LogLevel',2,-1,NULL,NULL)
,(-9223371190746218478, 2147483845,'CronTimeZone',2,-1,NULL,NULL)
,(-9223371190746218477, 2147483845,'IsIncremental',5,-1,NULL,NULL)
,(-9223371190746218476, 2147483845,'JobStep',12,-1,NULL,2147483846)
,(-9223371190746218475, 2147483845,'JobInstance',12,-1,NULL,NULL)
,(-9223371190746218471, 2147483845,'IsConnectorJob',5,-1,NULL,NULL)
,(-9223371190746218470, 2147483845,'IsInitializationJob',5,-1,NULL,NULL)
,(-9223371190746218469, 2147483845,'HasHighFrequencyCrontab',5,-1,NULL,NULL)
,(-9223371190746218468, 2147483845,'HasHighFrequencyExecution',5,-1,NULL,NULL)
,(-9223371190746218467, 2147483845,'IsInQuotaWhitelist',5,-1,NULL,NULL)
,(-9223371190746218416, 2147483845,'DisplayName_L9',0,-1,-9223371190746218495,NULL)
,(-9223371190746218415, 2147483845,'DisplayName_L10',0,-1,-9223371190746218495,NULL)
,(-9223371190746218414, 2147483845,'DisplayName_L11',0,-1,-9223371190746218495,NULL)
,(-9223371190746218413, 2147483845,'DisplayName_L12',0,-1,-9223371190746218495,NULL)
,(-9223371190746218412, 2147483845,'DisplayName_L13',0,-1,-9223371190746218495,NULL)
,(-9223371190746218411, 2147483845,'DisplayName_L14',0,-1,-9223371190746218495,NULL)
,(-9223371190746218410, 2147483845,'DisplayName_L15',0,-1,-9223371190746218495,NULL)
,(-9223371190746218409, 2147483845,'DisplayName_L16',0,-1,-9223371190746218495,NULL)
,(-9223371186451251200, 2147483846,'Id',3,-1,NULL,NULL)
,(-9223371186451251199, 2147483846,'Job',12,-1,NULL,NULL)
,(-9223371186451251198, 2147483846,'Task',12,-1,NULL,NULL)
,(-9223371186451251197, 2147483846,'LaunchOrder',2,-1,NULL,NULL)
,(-9223371186451251196, 2147483846,'JobId',3,-1,NULL,NULL)
,(-9223371186451251195, 2147483846,'TaskId',3,-1,NULL,NULL)
,(-9223371186451251194, 2147483846,'Level',2,-1,NULL,NULL)
,(-9223371182156283904, 2147483847,'Id',3,-1,NULL,NULL)
,(-9223371182156283903, 2147483847,'TaskId',3,-1,NULL,NULL)
,(-9223371182156283902, 2147483847,'Task',12,-1,NULL,2147483811)
,(-9223371182156283901, 2147483847,'EntityTypeId',3,-1,NULL,NULL)
,(-9223371182156283900, 2147483847,'EntityType',12,-1,NULL,2147483675)
,(-9223371177861316608, 2147483848,'Id',3,-1,NULL,NULL)
,(-9223371177861316607, 2147483848,'TaskId',3,-1,NULL,NULL)
,(-9223371177861316606, 2147483848,'Task',12,-1,NULL,2147483811)
,(-9223371177861316605, 2147483848,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223371177861316604, 2147483848,'ResourceType',12,-1,NULL,2147483671)
,(-9223371173566349312, 2147483849,'Id',3,-1,NULL,NULL)
,(-9223371173566349311, 2147483849,'Job',12,-1,NULL,2147483845)
,(-9223371173566349310, 2147483849,'JobId',3,-1,NULL,NULL)
,(-9223371173566349309, 2147483849,'User',12,-1,NULL,2147483670)
,(-9223371173566349308, 2147483849,'UserId',3,-1,NULL,NULL)
,(-9223371173566349307, 2147483849,'StartDate',4,-1,NULL,NULL)
,(-9223371173566349306, 2147483849,'EndDate',4,-1,NULL,NULL)
,(-9223371173566349305, 2147483849,'State',10,-1,NULL,NULL)
,(-9223371173566349304, 2147483849,'CurrentLaunch',2,-1,NULL,NULL)
,(-9223371173566349303, 2147483849,'TotalLaunch',2,-1,NULL,NULL)
,(-9223371173566349302, 2147483849,'CancelRequested',5,-1,NULL,NULL)
,(-9223371173566349301, 2147483849,'TaskInstance',12,-1,NULL,NULL)
,(-9223371173566349300, 2147483849,'LastProgressUpdate',4,-1,NULL,NULL)
,(-9223371173566349299, 2147483849,'Retry',5,-1,NULL,NULL)
,(-9223371173566349297, 2147483849,'JobDefinition',0,-1,NULL,NULL)
,(-9223371173566349292, 2147483849,'LastJob',12,-1,NULL,2147483845)
,(-9223371169271382016, 2147483850,'Id',3,-1,NULL,NULL)
,(-9223371169271382015, 2147483850,'TaskId',3,-1,NULL,NULL)
,(-9223371169271382014, 2147483850,'JobInstanceId',3,-1,NULL,NULL)
,(-9223371169271382013, 2147483850,'StartDate',4,-1,NULL,NULL)
,(-9223371169271382012, 2147483850,'EndDate',4,-1,NULL,NULL)
,(-9223371169271382011, 2147483850,'Task',12,-1,NULL,2147483811)
,(-9223371169271382010, 2147483850,'State',10,-1,NULL,NULL)
,(-9223371169271382009, 2147483850,'JobInstance',12,-1,NULL,2147483849)
,(-9223371169271382008, 2147483850,'IsChild',5,-1,NULL,NULL)
,(-9223371169271382007, 2147483850,'IsValidation',5,-1,NULL,NULL)
,(-9223371169271382006, 2147483850,'LastProgressUpdate',4,-1,NULL,NULL)
,(-9223371169271382005, 2147483850,'Agent',12,-1,NULL,2147483812)
,(-9223371169271382004, 2147483850,'AgentId',3,-1,NULL,NULL)
,(-9223371169271381996, 2147483850,'C0',10,-1,NULL,NULL)
,(-9223371169271381995, 2147483850,'C1',2,-1,NULL,NULL)
,(-9223371169271381994, 2147483850,'C2',2,-1,NULL,NULL)
,(-9223371169271381993, 2147483850,'C3',2,-1,NULL,NULL)
,(-9223371169271381992, 2147483850,'C4',2,-1,NULL,NULL)
,(-9223371169271381991, 2147483850,'C5',2,-1,NULL,NULL)
,(-9223371169271381990, 2147483850,'C6',2,-1,NULL,NULL)
,(-9223371169271381989, 2147483850,'C7',2,-1,NULL,NULL)
,(-9223371169271381988, 2147483850,'WrappedProgress',0,-1,NULL,NULL)
,(-9223371164976414720, 2147483851,'Id',3,-1,NULL,NULL)
,(-9223371164976414719, 2147483851,'TaskId',3,-1,NULL,NULL)
,(-9223371164976414718, 2147483851,'Task',12,-1,NULL,2147483811)
,(-9223371164976414717, 2147483851,'DimensionId',3,-1,NULL,NULL)
,(-9223371164976414716, 2147483851,'Dimension',12,-1,NULL,2147483685)
,(-9223371160681447424, 2147483852,'Id',3,-1,NULL,NULL)
,(-9223371160681447423, 2147483852,'ChildTaskId',3,-1,NULL,NULL)
,(-9223371160681447422, 2147483852,'ChildTask',12,-1,NULL,2147483811)
,(-9223371160681447421, 2147483852,'ParentTaskId',3,-1,NULL,NULL)
,(-9223371160681447420, 2147483852,'ParentTask',12,-1,NULL,2147483811)
,(-9223371087667003392, 2147483869,'Id',3,-1,NULL,NULL)
,(-9223371087667003391, 2147483869,'AssignedResourceType',12,-1,NULL,2147483656)
,(-9223371087667003390, 2147483869,'Property',12,-1,NULL,2147483676)
,(-9223371087667003389, 2147483869,'Resource',12,-1,NULL,2147483672)
,(-9223371087667003388, 2147483869,'WorkflowState',9,-1,NULL,NULL)
,(-9223371087667003387, 2147483869,'IsDenied',5,-1,NULL,NULL)
,(-9223371087667003386, 2147483869,'ProvisioningState',9,-1,NULL,NULL)
,(-9223371087667003385, 2147483869,'StartDate',4,-1,NULL,NULL)
,(-9223371087667003384, 2147483869,'EndDate',4,-1,NULL,NULL)
,(-9223371087667003383, 2147483869,'AssignedResourceTypeId',3,-1,NULL,NULL)
,(-9223371087667003382, 2147483869,'PropertyId',3,-1,NULL,NULL)
,(-9223371087667003381, 2147483869,'ResourceFileId',3,-1,NULL,NULL)
,(-9223371087667003380, 2147483869,'ResourceFileHashCode',2,-1,NULL,NULL)
,(-9223371087667003375, 2147483869,'WhenCreated',4,-1,NULL,NULL)
,(-9223371087667003374, 2147483869,'WhenPerformed',4,-1,NULL,NULL)
,(-9223371087667003373, 2147483869,'Performer',12,-1,NULL,2147483670)
,(-9223371087667003372, 2147483869,'PerformerId',3,-1,NULL,NULL)
,(-9223371087667003371, 2147483869,'PolicyResource',12,-1,NULL,2147483672)
,(-9223371087667003369, 2147483869,'PolicyResourceId',3,-1,NULL,NULL)
,(-9223371087667003326, 2147483869,'OwnerId',3,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223371087667003325, 2147483869,'OwnerType',3,-1,NULL,NULL)
,(-9223371087667003324, 2147483869,'Owner',12,-1,NULL,2147483670)
,(-9223370954523017216, 2147483900,'Id',3,-1,NULL,NULL)
,(-9223370954523017215, 2147483900,'Identifier',0,-1,NULL,NULL)
,(-9223370954523017214, 2147483900,'Query',0,-1,NULL,NULL)
,(-9223370954523017213, 2147483900,'ReturnedEntityTypeId',3,-1,NULL,NULL)
,(-9223370954523017212, 2147483900,'DisplayName',0,-1,NULL,NULL)
,(-9223370954523017211, 2147483900,'DisplayName_L1',0,-1,-9223370954523017212,NULL)
,(-9223370954523017210, 2147483900,'DisplayName_L2',0,-1,-9223370954523017212,NULL)
,(-9223370954523017209, 2147483900,'DisplayName_L3',0,-1,-9223370954523017212,NULL)
,(-9223370954523017208, 2147483900,'DisplayName_L4',0,-1,-9223370954523017212,NULL)
,(-9223370954523017207, 2147483900,'DisplayName_L5',0,-1,-9223370954523017212,NULL)
,(-9223370954523017206, 2147483900,'DisplayName_L6',0,-1,-9223370954523017212,NULL)
,(-9223370954523017205, 2147483900,'DisplayName_L7',0,-1,-9223370954523017212,NULL)
,(-9223370954523017204, 2147483900,'DisplayName_L8',0,-1,-9223370954523017212,NULL)
,(-9223370954523017136, 2147483900,'DisplayName_L9',0,-1,-9223370954523017212,NULL)
,(-9223370954523017135, 2147483900,'DisplayName_L10',0,-1,-9223370954523017212,NULL)
,(-9223370954523017134, 2147483900,'DisplayName_L11',0,-1,-9223370954523017212,NULL)
,(-9223370954523017133, 2147483900,'DisplayName_L12',0,-1,-9223370954523017212,NULL)
,(-9223370954523017132, 2147483900,'DisplayName_L13',0,-1,-9223370954523017212,NULL)
,(-9223370954523017131, 2147483900,'DisplayName_L14',0,-1,-9223370954523017212,NULL)
,(-9223370954523017130, 2147483900,'DisplayName_L15',0,-1,-9223370954523017212,NULL)
,(-9223370954523017129, 2147483900,'DisplayName_L16',0,-1,-9223370954523017212,NULL)
,(-9223370911573344256, 2147483910,'Id',3,-1,NULL,NULL)
,(-9223370911573344255, 2147483910,'HashedSecret',0,-1,NULL,NULL)
,(-9223370911573344254, 2147483910,'DisplayName',0,-1,NULL,NULL)
,(-9223370911573344253, 2147483910,'ExpirationDate',4,-1,NULL,NULL)
,(-9223370911573344252, 2147483910,'Profile_Id',3,-1,NULL,NULL)
,(-9223370911573344251, 2147483910,'Context_Id',3,-1,NULL,NULL)
,(-9223370911573344250, 2147483910,'DisplayName_L1',0,-1,-9223370911573344254,NULL)
,(-9223370911573344249, 2147483910,'DisplayName_L2',0,-1,-9223370911573344254,NULL)
,(-9223370911573344248, 2147483910,'DisplayName_L3',0,-1,-9223370911573344254,NULL)
,(-9223370911573344247, 2147483910,'DisplayName_L4',0,-1,-9223370911573344254,NULL)
,(-9223370911573344246, 2147483910,'DisplayName_L5',0,-1,-9223370911573344254,NULL)
,(-9223370911573344245, 2147483910,'DisplayName_L6',0,-1,-9223370911573344254,NULL)
,(-9223370911573344244, 2147483910,'DisplayName_L7',0,-1,-9223370911573344254,NULL)
,(-9223370911573344243, 2147483910,'DisplayName_L8',0,-1,-9223370911573344254,NULL)
,(-9223370911573344242, 2147483910,'OpenIdClient',12,-1,NULL,NULL)
,(-9223370911573344236, 2147483910,'Identifier',0,-1,NULL,NULL)
,(-9223370911573344235, 2147483910,'Tasks',12,-1,NULL,2147483811)
,(-9223370911573344176, 2147483910,'DisplayName_L9',0,-1,-9223370911573344254,NULL)
,(-9223370911573344175, 2147483910,'DisplayName_L10',0,-1,-9223370911573344254,NULL)
,(-9223370911573344174, 2147483910,'DisplayName_L11',0,-1,-9223370911573344254,NULL)
,(-9223370911573344173, 2147483910,'DisplayName_L12',0,-1,-9223370911573344254,NULL)
,(-9223370911573344172, 2147483910,'DisplayName_L13',0,-1,-9223370911573344254,NULL)
,(-9223370911573344171, 2147483910,'DisplayName_L14',0,-1,-9223370911573344254,NULL)
,(-9223370911573344170, 2147483910,'DisplayName_L15',0,-1,-9223370911573344254,NULL)
,(-9223370911573344169, 2147483910,'DisplayName_L16',0,-1,-9223370911573344254,NULL)
,(-9223370907278376960, 2147483911,'Id',3,-1,NULL,NULL)
,(-9223370907278376959, 2147483911,'PolicyId',3,-1,NULL,NULL)
,(-9223370907278376958, 2147483911,'Policy',12,-1,NULL,2147483669)
,(-9223370907278376957, 2147483911,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223370907278376956, 2147483911,'ResourceType',12,-1,NULL,2147483671)
,(-9223370907278376955, 2147483911,'SourceBindingId',3,-1,NULL,NULL)
,(-9223370907278376954, 2147483911,'SourceBinding',12,-1,NULL,2147483690)
,(-9223370907278376953, 2147483911,'SourceExpression',0,-1,NULL,NULL)
,(-9223370907278376952, 2147483911,'TargetBindingId',3,-1,NULL,NULL)
,(-9223370907278376951, 2147483911,'TargetBinding',12,-1,NULL,2147483690)
,(-9223370907278376950, 2147483911,'TargetExpression',0,-1,NULL,NULL)
,(-9223370907278376949, 2147483911,'SourceMatchedConfidenceLevel',2,-1,NULL,NULL)
,(-9223370907278376948, 2147483911,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370907278376947, 2147483911,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223370907278376946, 2147483911,'BaseRule',12,-1,NULL,2147483911)
,(-9223370907278376945, 2147483911,'RuleBase',12,-1,NULL,NULL)
,(-9223370907278376832, 2147483911,'WhenCreated',4,-1,NULL,NULL)
,(-9223370907278376831, 2147483911,'CreatedById',3,-1,NULL,NULL)
,(-9223370907278376830, 2147483911,'CreatedBy',12,-1,NULL,NULL)
,(-9223370907278376829, 2147483911,'WhenChanged',4,-1,NULL,NULL)
,(-9223370907278376828, 2147483911,'ChangedById',3,-1,NULL,NULL)
,(-9223370907278376827, 2147483911,'ChangedBy',12,-1,NULL,NULL)
,(-9223370902983409664, 2147483912,'Id',3,-1,NULL,NULL)
,(-9223370902983409663, 2147483912,'Identifier',0,-1,NULL,NULL)
,(-9223370902983409662, 2147483912,'DisplayName',0,-1,NULL,NULL)
,(-9223370902983409661, 2147483912,'Items',12,-1,NULL,NULL)
,(-9223370902983409660, 2147483912,'StartDate',4,-1,NULL,NULL)
,(-9223370902983409659, 2147483912,'CertificationEndDate',4,-1,NULL,NULL)
,(-9223370902983409658, 2147483912,'State',9,-1,NULL,NULL)
,(-9223370902983409657, 2147483912,'OwnerEntityTypeId',3,-1,NULL,NULL)
,(-9223370902983409656, 2147483912,'DataFilters',12,-1,NULL,2147483917)
,(-9223370902983409655, 2147483912,'OwnerFilters',12,-1,NULL,2147483916)
,(-9223370902983409654, 2147483912,'DisplayName_L1',0,-1,-9223370902983409662,NULL)
,(-9223370902983409653, 2147483912,'DisplayName_L2',0,-1,-9223370902983409662,NULL)
,(-9223370902983409652, 2147483912,'DisplayName_L3',0,-1,-9223370902983409662,NULL)
,(-9223370902983409651, 2147483912,'DisplayName_L4',0,-1,-9223370902983409662,NULL)
,(-9223370902983409650, 2147483912,'DisplayName_L5',0,-1,-9223370902983409662,NULL)
,(-9223370902983409649, 2147483912,'DisplayName_L6',0,-1,-9223370902983409662,NULL)
,(-9223370902983409648, 2147483912,'DisplayName_L7',0,-1,-9223370902983409662,NULL)
,(-9223370902983409647, 2147483912,'DisplayName_L8',0,-1,-9223370902983409662,NULL)
,(-9223370902983409646, 2147483912,'ItemsCount',2,-1,NULL,NULL)
,(-9223370902983409645, 2147483912,'CompletedItemsCount',2,-1,NULL,NULL)
,(-9223370902983409644, 2147483912,'OwnerEntityType',12,-1,NULL,NULL)
,(-9223370902983409643, 2147483912,'LastNotificationDate',4,-1,NULL,NULL)
,(-9223370902983409642, 2147483912,'NotificationNeeded',5,-1,NULL,NULL)
,(-9223370902983409641, 2147483912,'PolicyId',-1,-1,NULL,NULL)
,(-9223370902983409640, 2147483912,'Policy',12,-1,NULL,2147483924)
,(-9223370902983409584, 2147483912,'DisplayName_L9',0,-1,-9223370902983409662,NULL)
,(-9223370902983409583, 2147483912,'DisplayName_L10',0,-1,-9223370902983409662,NULL)
,(-9223370902983409582, 2147483912,'DisplayName_L11',0,-1,-9223370902983409662,NULL)
,(-9223370902983409581, 2147483912,'DisplayName_L12',0,-1,-9223370902983409662,NULL)
,(-9223370902983409580, 2147483912,'DisplayName_L13',0,-1,-9223370902983409662,NULL)
,(-9223370902983409579, 2147483912,'DisplayName_L14',0,-1,-9223370902983409662,NULL)
,(-9223370902983409578, 2147483912,'DisplayName_L15',0,-1,-9223370902983409662,NULL)
,(-9223370902983409577, 2147483912,'DisplayName_L16',0,-1,-9223370902983409662,NULL)
,(-9223370898688442368, 2147483913,'Id',3,-1,NULL,NULL)
,(-9223370898688442367, 2147483913,'CampaignId',3,-1,NULL,NULL)
,(-9223370898688442366, 2147483913,'Campaign',12,-1,NULL,2147483912)
,(-9223370898688442365, 2147483913,'ReviewerId',3,-1,NULL,NULL)
,(-9223370898688442364, 2147483913,'Reviewer',12,-1,NULL,2147483670)
,(-9223370898688442363, 2147483913,'ReviewDate',4,-1,NULL,NULL)
,(-9223370898688442362, 2147483913,'ReviewDecision',9,-1,NULL,NULL)
,(-9223370898688442361, 2147483913,'AdministratorId',3,-1,NULL,NULL)
,(-9223370898688442360, 2147483913,'Administrator',12,-1,NULL,2147483670)
,(-9223370898688442359, 2147483913,'AdministratorDate',4,-1,NULL,NULL)
,(-9223370898688442358, 2147483913,'AdministratorDecision',9,-1,NULL,NULL)
,(-9223370898688442357, 2147483913,'Owner',12,-1,NULL,2147483670)
,(-9223370898688442356, 2147483913,'OwnerId',3,-1,NULL,NULL)
,(-9223370898688442355, 2147483913,'AssignedCompositeRole',12,-1,NULL,2147483653)
,(-9223370898688442354, 2147483913,'AssignedCompositeRoleId',3,-1,NULL,NULL)
,(-9223370898688442353, 2147483913,'AssignedSingleRole',12,-1,NULL,2147483657)
,(-9223370898688442352, 2147483913,'AssignedSingleRoleId',3,-1,NULL,NULL)
,(-9223370898688442351, 2147483913,'AssignedResourceType',12,-1,NULL,2147483656)
,(-9223370898688442350, 2147483913,'AssignedResourceTypeId',3,-1,NULL,NULL)
,(-9223370898688442349, 2147483913,'AssignedResourceNavigation',12,-1,NULL,2147483654)
,(-9223370898688442348, 2147483913,'AssignedResourceNavigationId',3,-1,NULL,NULL)
,(-9223370898688442347, 2147483913,'AssignedResourceScalar',12,-1,NULL,2147483655)
,(-9223370898688442346, 2147483913,'AssignedResourceScalarId',3,-1,NULL,NULL)
,(-9223370898688442344, 2147483913,'IsTransferred',5,-1,NULL,NULL)
,(-9223370898688442343, 2147483913,'ReviewComment',0,-1,NULL,NULL)
,(-9223370898688442342, 2147483913,'AdministratorComment',0,-1,NULL,NULL)
,(-9223370898688442341, 2147483913,'ForwardedItems',12,-1,NULL,NULL)
,(-9223370898688442340, 2147483913,'SetReviewerDate',4,-1,NULL,NULL)
,(-9223370898688442339, 2147483913,'CertificationState',9,-1,NULL,NULL)
,(-9223370898688442338, 2147483913,'WorkflowState',9,-1,NULL,NULL)
,(-9223370898688442337, 2147483913,'IsDenied',5,-1,NULL,NULL)
,(-9223370898688442336, 2147483913,'OwnerType',3,-1,NULL,NULL)
,(-9223370894393475072, 2147483914,'Id',3,-1,NULL,NULL)
,(-9223370894393475071, 2147483914,'Code',3,-1,NULL,NULL)
,(-9223370894393475070, 2147483914,'IndicatorNumber',3,-1,NULL,NULL)
,(-9223370894393475045, 2147483914,'Properties',12,-1,NULL,NULL)
,(-9223370890098507776, 2147483915,'Id',3,-1,NULL,NULL)
,(-9223370890098507775, 2147483915,'PolicyId',3,-1,NULL,NULL)
,(-9223370890098507774, 2147483915,'Policy',12,-1,NULL,2147483669)
,(-9223370890098507773, 2147483915,'SourceEntityTypeId',3,-1,NULL,NULL)
,(-9223370890098507772, 2147483915,'SourceEntityType',12,-1,NULL,2147483675)
,(-9223370890098507771, 2147483915,'Dimension0BindingId',3,-1,NULL,NULL)
,(-9223370890098507770, 2147483915,'Dimension0Binding',12,-1,NULL,2147483690)
,(-9223370890098507769, 2147483915,'Dimension1BindingId',3,-1,NULL,NULL)
,(-9223370890098507768, 2147483915,'Dimension1Binding',12,-1,NULL,2147483690)
,(-9223370890098507767, 2147483915,'Dimension2BindingId',3,-1,NULL,NULL)
,(-9223370890098507766, 2147483915,'Dimension2Binding',12,-1,NULL,2147483690)
,(-9223370890098507765, 2147483915,'Dimension3BindingId',3,-1,NULL,NULL)
,(-9223370890098507764, 2147483915,'Dimension3Binding',12,-1,NULL,2147483690)
,(-9223370890098507763, 2147483915,'Dimension4BindingId',3,-1,NULL,NULL)
,(-9223370890098507762, 2147483915,'Dimension4Binding',12,-1,NULL,2147483690)
,(-9223370890098507761, 2147483915,'Dimension5BindingId',3,-1,NULL,NULL)
,(-9223370890098507760, 2147483915,'Dimension5Binding',12,-1,NULL,2147483690)
,(-9223370890098507759, 2147483915,'Dimension6BindingId',3,-1,NULL,NULL)
,(-9223370890098507758, 2147483915,'Dimension6Binding',12,-1,NULL,2147483690)
,(-9223370890098507757, 2147483915,'Dimension7BindingId',3,-1,NULL,NULL)
,(-9223370890098507756, 2147483915,'Dimension7Binding',12,-1,NULL,2147483690)
,(-9223370890098507755, 2147483915,'ResourcesBindingId',3,-1,NULL,NULL)
,(-9223370890098507754, 2147483915,'ResourcesBinding',12,-1,NULL,2147483690)
,(-9223370890098507753, 2147483915,'ResourcesExpression',0,-1,NULL,NULL)
,(-9223370890098507752, 2147483915,'ResourcesStartBindingId',3,-1,NULL,NULL)
,(-9223370890098507751, 2147483915,'ResourcesStartBinding',12,-1,NULL,2147483690)
,(-9223370890098507750, 2147483915,'ResourcesStartExpression',0,-1,NULL,NULL)
,(-9223370890098507749, 2147483915,'ResourcesEndBindingId',3,-1,NULL,NULL)
,(-9223370890098507748, 2147483915,'ResourcesEndBinding',12,-1,NULL,2147483690)
,(-9223370890098507747, 2147483915,'ResourcesEndExpression',0,-1,NULL,NULL)
,(-9223370890098507746, 2147483915,'ExcludeExpression',0,-1,NULL,NULL)
,(-9223370890098507264, 2147483915,'WhenCreated',4,-1,NULL,NULL)
,(-9223370890098507263, 2147483915,'CreatedById',3,-1,NULL,NULL)
,(-9223370890098507262, 2147483915,'CreatedBy',12,-1,NULL,NULL)
,(-9223370890098507261, 2147483915,'WhenChanged',4,-1,NULL,NULL)
,(-9223370890098507260, 2147483915,'ChangedById',3,-1,NULL,NULL)
,(-9223370890098507259, 2147483915,'ChangedBy',12,-1,NULL,NULL)
,(-9223370885803540480, 2147483916,'Id',3,-1,NULL,NULL)
,(-9223370885803540479, 2147483916,'CampaignId',3,-1,NULL,NULL)
,(-9223370885803540478, 2147483916,'Campaign',12,-1,NULL,NULL)
,(-9223370885803540477, 2147483916,'IndividualOwnerId',3,-1,NULL,NULL)
,(-9223370885803540476, 2147483916,'IndividualOwner',12,-1,NULL,NULL)
,(-9223370885803540475, 2147483916,'OwnerLastModificationDate',-1,-1,NULL,NULL)
,(-9223370885803540474, 2147483916,'OwnerLastModificationDateBindingId',-1,-1,NULL,NULL)
,(-9223370885803540473, 2147483916,'OwnerLastModificationDateBinding',12,-1,NULL,NULL)
,(-9223370885803540472, 2147483916,'OwnerTargetRiskId',3,-1,NULL,NULL)
,(-9223370885803540471, 2147483916,'OwnerTargetRisk',12,-1,NULL,NULL)
,(-9223370885803540470, 2147483916,'MinimalRiskScore',-1,-1,NULL,NULL)
,(-9223370881508573184, 2147483917,'Id',3,-1,NULL,NULL)
,(-9223370881508573183, 2147483917,'CampaignId',3,-1,NULL,NULL)
,(-9223370881508573182, 2147483917,'Campaign',12,-1,NULL,NULL)
,(-9223370881508573181, 2147483917,'IncludeCompositeRoles',5,-1,NULL,NULL)
,(-9223370881508573180, 2147483917,'IncludeSingleRoles',5,-1,NULL,NULL)
,(-9223370881508573179, 2147483917,'IncludeResourceTypes',5,-1,NULL,NULL)
,(-9223370881508573178, 2147483917,'IncludeResourceNavigations',5,-1,NULL,NULL)
,(-9223370881508573177, 2147483917,'IncludeResourceScalars',5,-1,NULL,NULL)
,(-9223370881508573176, 2147483917,'IncludeWorkflowStatePolicyApproved',5,-1,NULL,NULL)
,(-9223370881508573175, 2147483917,'IncludeWorkflowStateApproved',5,-1,NULL,NULL)
,(-9223370881508573174, 2147483917,'IncludeWorkflowStateFound',5,-1,NULL,NULL)
,(-9223370881508573173, 2147483917,'IncludeWorkflowStateHistory',5,-1,NULL,NULL)
,(-9223370881508573172, 2147483917,'CategoryId',3,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223370881508573171, 2147483917,'Category',12,-1,NULL,NULL)
,(-9223370881508573170, 2147483917,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223370881508573169, 2147483917,'ResourceType',12,-1,NULL,NULL)
,(-9223370881508573168, 2147483917,'IncludeNoValidation',-1,-1,NULL,NULL)
,(-9223370881508573167, 2147483917,'IncludeSimpleValidation',-1,-1,NULL,NULL)
,(-9223370881508573166, 2147483917,'IncludeDoubleValidation',-1,-1,NULL,NULL)
,(-9223370881508573165, 2147483917,'IncludeTripleValidation',-1,-1,NULL,NULL)
,(-9223370881508573164, 2147483917,'LatestCertifiedLimitDate',-1,-1,NULL,NULL)
,(-9223370881508573163, 2147483917,'TargetRiskId',3,-1,NULL,NULL)
,(-9223370881508573162, 2147483917,'TargetRisk',12,-1,NULL,NULL)
,(-9223370881508573161, 2147483917,'IncludeDeniedPermissions',5,-1,NULL,NULL)
,(-9223370881508573160, 2147483917,'IncludeNestedCategories',5,-1,NULL,NULL)
,(-9223370881508573159, 2147483917,'Tags',0,-1,NULL,NULL)
,(-9223370881508573158, 2147483917,'IncludeManualAssignmentNotAllowed',-1,-1,NULL,NULL)
,(-9223370877213605888, 2147483918,'Id',3,-1,NULL,NULL)
,(-9223370877213605887, 2147483918,'PolicyId',3,-1,NULL,NULL)
,(-9223370877213605886, 2147483918,'Policy',12,-1,NULL,2147483669)
,(-9223370877213605885, 2147483918,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223370877213605884, 2147483918,'ResourceType',12,-1,NULL,2147483671)
,(-9223370877213605883, 2147483918,'PropertyId',3,-1,NULL,NULL)
,(-9223370877213605882, 2147483918,'Property',12,-1,NULL,2147483676)
,(-9223370877213605881, 2147483918,'TargetBindingId',3,-1,NULL,NULL)
,(-9223370877213605880, 2147483918,'TargetBinding',12,-1,NULL,2147483690)
,(-9223370877213605879, 2147483918,'TargetMatchedConfidenceLevel',2,-1,NULL,NULL)
,(-9223370877213605878, 2147483918,'TimeOffsetReference',2,-1,NULL,NULL)
,(-9223370877213605877, 2147483918,'TimeOffsetBeforeReference',2,-1,NULL,NULL)
,(-9223370877213605876, 2147483918,'TimeOffsetAfterReference',2,-1,NULL,NULL)
,(-9223370877213605875, 2147483918,'SourceBindingId',3,-1,NULL,NULL)
,(-9223370877213605874, 2147483918,'SourceBinding',12,-1,NULL,2147483690)
,(-9223370877213605873, 2147483918,'SourceExpression',0,-1,NULL,NULL)
,(-9223370877213605872, 2147483918,'TargetExpression',0,-1,NULL,NULL)
,(-9223370877213605871, 2147483918,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370877213605760, 2147483918,'WhenCreated',4,-1,NULL,NULL)
,(-9223370877213605759, 2147483918,'CreatedById',3,-1,NULL,NULL)
,(-9223370877213605758, 2147483918,'CreatedBy',12,-1,NULL,NULL)
,(-9223370877213605757, 2147483918,'WhenChanged',4,-1,NULL,NULL)
,(-9223370877213605756, 2147483918,'ChangedById',3,-1,NULL,NULL)
,(-9223370877213605755, 2147483918,'ChangedBy',12,-1,NULL,NULL)
,(-9223370872918638592, 2147483919,'Id',3,-1,NULL,NULL)
,(-9223370872918638591, 2147483919,'ItemId',3,-1,NULL,NULL)
,(-9223370872918638590, 2147483919,'Item',12,-1,NULL,2147483913)
,(-9223370872918638589, 2147483919,'Date',4,-1,NULL,NULL)
,(-9223370872918638588, 2147483919,'FromId',3,-1,NULL,NULL)
,(-9223370872918638587, 2147483919,'From',12,-1,NULL,2147483670)
,(-9223370872918638586, 2147483919,'ToId',3,-1,NULL,NULL)
,(-9223370872918638585, 2147483919,'To',12,-1,NULL,2147483670)
,(-9223370872918638584, 2147483919,'Comment',0,-1,NULL,NULL)
,(-9223370868623671296, 2147483920,'Id',3,-1,NULL,NULL)
,(-9223370868623671295, 2147483920,'Identifier',0,-1,NULL,NULL)
,(-9223370868623671292, 2147483920,'DisplayName',0,-1,NULL,NULL)
,(-9223370868623671291, 2147483920,'DisplayName_L1',0,-1,-9223370868623671292,NULL)
,(-9223370868623671290, 2147483920,'DisplayName_L2',0,-1,-9223370868623671292,NULL)
,(-9223370868623671289, 2147483920,'DisplayName_L3',0,-1,-9223370868623671292,NULL)
,(-9223370868623671288, 2147483920,'DisplayName_L4',0,-1,-9223370868623671292,NULL)
,(-9223370868623671287, 2147483920,'DisplayName_L5',0,-1,-9223370868623671292,NULL)
,(-9223370868623671286, 2147483920,'DisplayName_L6',0,-1,-9223370868623671292,NULL)
,(-9223370868623671285, 2147483920,'DisplayName_L7',0,-1,-9223370868623671292,NULL)
,(-9223370868623671284, 2147483920,'DisplayName_L8',0,-1,-9223370868623671292,NULL)
,(-9223370868623671283, 2147483920,'EntityInstances',12,-1,NULL,NULL)
,(-9223370868623671282, 2147483920,'IsHistoryDisabled',5,-1,NULL,NULL)
,(-9223370868623671281, 2147483920,'AssociationInstances',12,-1,NULL,NULL)
,(-9223370868623671280, 2147483920,'ColumnNamesMode',9,-1,NULL,NULL)
,(-9223370868623671216, 2147483920,'DisplayName_L9',0,-1,-9223370868623671292,NULL)
,(-9223370868623671215, 2147483920,'DisplayName_L10',0,-1,-9223370868623671292,NULL)
,(-9223370868623671214, 2147483920,'DisplayName_L11',0,-1,-9223370868623671292,NULL)
,(-9223370868623671213, 2147483920,'DisplayName_L12',0,-1,-9223370868623671292,NULL)
,(-9223370868623671212, 2147483920,'DisplayName_L13',0,-1,-9223370868623671292,NULL)
,(-9223370868623671211, 2147483920,'DisplayName_L14',0,-1,-9223370868623671292,NULL)
,(-9223370868623671210, 2147483920,'DisplayName_L15',0,-1,-9223370868623671292,NULL)
,(-9223370868623671209, 2147483920,'DisplayName_L16',0,-1,-9223370868623671292,NULL)
,(-9223370864328704000, 2147483921,'Id',3,-1,NULL,NULL)
,(-9223370864328703999, 2147483921,'Identifier',0,-1,NULL,NULL)
,(-9223370864328703998, 2147483921,'UniverseId',3,-1,NULL,NULL)
,(-9223370864328703997, 2147483921,'Universe',12,-1,NULL,2147483920)
,(-9223370864328703996, 2147483921,'DisplayName',0,-1,NULL,NULL)
,(-9223370864328703995, 2147483921,'DisplayName_L1',0,-1,-9223370864328703996,NULL)
,(-9223370864328703994, 2147483921,'DisplayName_L2',0,-1,-9223370864328703996,NULL)
,(-9223370864328703993, 2147483921,'DisplayName_L3',0,-1,-9223370864328703996,NULL)
,(-9223370864328703992, 2147483921,'DisplayName_L4',0,-1,-9223370864328703996,NULL)
,(-9223370864328703991, 2147483921,'DisplayName_L5',0,-1,-9223370864328703996,NULL)
,(-9223370864328703990, 2147483921,'DisplayName_L6',0,-1,-9223370864328703996,NULL)
,(-9223370864328703989, 2147483921,'DisplayName_L7',0,-1,-9223370864328703996,NULL)
,(-9223370864328703988, 2147483921,'DisplayName_L8',0,-1,-9223370864328703996,NULL)
,(-9223370864328703987, 2147483921,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370864328703986, 2147483921,'EntityType',12,-1,NULL,2147483675)
,(-9223370864328703985, 2147483921,'IsHidden',5,-1,NULL,NULL)
,(-9223370864328703984, 2147483921,'FilterPropertyId',3,-1,NULL,NULL)
,(-9223370864328703983, 2147483921,'FilterValue',0,-1,NULL,NULL)
,(-9223370864328703982, 2147483921,'FilterEntityTypeId',3,-1,NULL,NULL)
,(-9223370864328703981, 2147483921,'FilterEntityPropertyId',3,-1,NULL,NULL)
,(-9223370864328703980, 2147483921,'FilterResourceTypeId',3,-1,NULL,NULL)
,(-9223370864328703979, 2147483921,'Associations1',12,-1,NULL,NULL)
,(-9223370864328703978, 2147483921,'Associations2',12,-1,NULL,NULL)
,(-9223370864328703920, 2147483921,'DisplayName_L9',0,-1,-9223370864328703996,NULL)
,(-9223370864328703919, 2147483921,'DisplayName_L10',0,-1,-9223370864328703996,NULL)
,(-9223370864328703918, 2147483921,'DisplayName_L11',0,-1,-9223370864328703996,NULL)
,(-9223370864328703917, 2147483921,'DisplayName_L12',0,-1,-9223370864328703996,NULL)
,(-9223370864328703916, 2147483921,'DisplayName_L13',0,-1,-9223370864328703996,NULL)
,(-9223370864328703915, 2147483921,'DisplayName_L14',0,-1,-9223370864328703996,NULL)
,(-9223370864328703914, 2147483921,'DisplayName_L15',0,-1,-9223370864328703996,NULL)
,(-9223370864328703913, 2147483921,'DisplayName_L16',0,-1,-9223370864328703996,NULL)
,(-9223370860033736704, 2147483922,'Id',3,-1,NULL,NULL)
,(-9223370860033736701, 2147483922,'RiskId',3,-1,NULL,NULL)
,(-9223370860033736700, 2147483922,'Risk',12,-1,NULL,2147483660)
,(-9223370860033736699, 2147483922,'PolicyId',3,-1,NULL,NULL)
,(-9223370860033736698, 2147483922,'Policy',12,-1,NULL,2147483669)
,(-9223370860033736696, 2147483922,'Items',12,-1,NULL,NULL)
,(-9223370860033736695, 2147483922,'Order',2,-1,NULL,NULL)
,(-9223370855738769408, 2147483923,'Id',3,-1,NULL,NULL)
,(-9223370855738769407, 2147483923,'RuleId',3,-1,NULL,NULL)
,(-9223370855738769406, 2147483923,'Rule',12,-1,NULL,2147483922)
,(-9223370855738769405, 2147483923,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223370855738769404, 2147483923,'ResourceType',12,-1,NULL,2147483671)
,(-9223370855738769403, 2147483923,'PropertyId',3,-1,NULL,NULL)
,(-9223370855738769402, 2147483923,'Property',12,-1,NULL,2147483676)
,(-9223370855738769401, 2147483923,'ResourceId',3,-1,NULL,NULL)
,(-9223370855738769400, 2147483923,'Resource',12,-1,NULL,2147483670)
,(-9223370855738769399, 2147483923,'Value',0,-1,NULL,NULL)
,(-9223370855738769398, 2147483923,'ResourceNavigationRule',12,-1,NULL,2147483683)
,(-9223370855738769397, 2147483923,'Risk',12,-1,NULL,2147483660)
,(-9223370855738769395, 2147483923,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370851443802112, 2147483924,'Id',3,-1,NULL,NULL)
,(-9223370851443802111, 2147483924,'Identifier',0,-1,NULL,NULL)
,(-9223370851443802110, 2147483924,'Campaigns',12,-1,NULL,NULL)
,(-9223370851443802109, 2147483924,'DisplayName',0,-1,NULL,NULL)
,(-9223370851443802108, 2147483924,'DisplayName_L1',0,-1,-9223370851443802109,NULL)
,(-9223370851443802107, 2147483924,'DisplayName_L2',0,-1,-9223370851443802109,NULL)
,(-9223370851443802106, 2147483924,'DisplayName_L3',0,-1,-9223370851443802109,NULL)
,(-9223370851443802105, 2147483924,'DisplayName_L4',0,-1,-9223370851443802109,NULL)
,(-9223370851443802104, 2147483924,'DisplayName_L5',0,-1,-9223370851443802109,NULL)
,(-9223370851443802103, 2147483924,'DisplayName_L6',0,-1,-9223370851443802109,NULL)
,(-9223370851443802102, 2147483924,'DisplayName_L7',0,-1,-9223370851443802109,NULL)
,(-9223370851443802101, 2147483924,'DisplayName_L8',0,-1,-9223370851443802109,NULL)
,(-9223370851443802032, 2147483924,'DisplayName_L9',0,-1,-9223370851443802109,NULL)
,(-9223370851443802031, 2147483924,'DisplayName_L10',0,-1,-9223370851443802109,NULL)
,(-9223370851443802030, 2147483924,'DisplayName_L11',0,-1,-9223370851443802109,NULL)
,(-9223370851443802029, 2147483924,'DisplayName_L12',0,-1,-9223370851443802109,NULL)
,(-9223370851443802028, 2147483924,'DisplayName_L13',0,-1,-9223370851443802109,NULL)
,(-9223370851443802027, 2147483924,'DisplayName_L14',0,-1,-9223370851443802109,NULL)
,(-9223370851443802026, 2147483924,'DisplayName_L15',0,-1,-9223370851443802109,NULL)
,(-9223370851443802025, 2147483924,'DisplayName_L16',0,-1,-9223370851443802109,NULL)
,(-9223370847148834816, 2147483925,'Id',3,-1,NULL,NULL)
,(-9223370847148834815, 2147483925,'OwnerId',3,-1,NULL,NULL)
,(-9223370847148834814, 2147483925,'Owner',12,-1,NULL,2147483670)
,(-9223370847148834813, 2147483925,'Score',2,-1,NULL,NULL)
,(-9223370847148834812, 2147483925,'Rating',2,-1,NULL,NULL)
,(-9223370847148834811, 2147483925,'OwnerType',3,-1,NULL,NULL)
,(-9223370842853867520, 2147483926,'Id',3,-1,NULL,NULL)
,(-9223370842853867519, 2147483926,'Identifier',0,-1,NULL,NULL)
,(-9223370842853867517, 2147483926,'DisplayName',0,-1,NULL,NULL)
,(-9223370842853867516, 2147483926,'ConnectorId',3,-1,NULL,NULL)
,(-9223370842853867515, 2147483926,'Connector',12,-1,NULL,NULL)
,(-9223370842853867514, 2147483926,'RefreshSchemaDate',4,-1,NULL,NULL)
,(-9223370842853867513, 2147483926,'Tables',12,-1,NULL,2147483927)
,(-9223370842853867512, 2147483926,'PackageId',3,-1,NULL,NULL)
,(-9223370842853867511, 2147483926,'Package',12,-1,NULL,NULL)
,(-9223370842853867510, 2147483926,'DeactivationExportFulfill',2,-1,NULL,NULL)
,(-9223370842853867509, 2147483926,'HasRefreshSchemaFailed',5,-1,NULL,NULL)
,(-9223370842853867507, 2147483926,'Transformations',12,-1,NULL,2147483936)
,(-9223370842853867498, 2147483926,'DisplayName_L1',0,-1,-9223370842853867517,NULL)
,(-9223370842853867497, 2147483926,'DisplayName_L2',0,-1,-9223370842853867517,NULL)
,(-9223370842853867496, 2147483926,'DisplayName_L3',0,-1,-9223370842853867517,NULL)
,(-9223370842853867495, 2147483926,'DisplayName_L4',0,-1,-9223370842853867517,NULL)
,(-9223370842853867494, 2147483926,'DisplayName_L5',0,-1,-9223370842853867517,NULL)
,(-9223370842853867493, 2147483926,'DisplayName_L6',0,-1,-9223370842853867517,NULL)
,(-9223370842853867492, 2147483926,'DisplayName_L7',0,-1,-9223370842853867517,NULL)
,(-9223370842853867491, 2147483926,'DisplayName_L8',0,-1,-9223370842853867517,NULL)
,(-9223370842853867478, 2147483926,'Connection',12,-1,NULL,NULL)
,(-9223370842853867440, 2147483926,'DisplayName_L9',0,-1,-9223370842853867517,NULL)
,(-9223370842853867439, 2147483926,'DisplayName_L10',0,-1,-9223370842853867517,NULL)
,(-9223370842853867438, 2147483926,'DisplayName_L11',0,-1,-9223370842853867517,NULL)
,(-9223370842853867437, 2147483926,'DisplayName_L12',0,-1,-9223370842853867517,NULL)
,(-9223370842853867436, 2147483926,'DisplayName_L13',0,-1,-9223370842853867517,NULL)
,(-9223370842853867435, 2147483926,'DisplayName_L14',0,-1,-9223370842853867517,NULL)
,(-9223370842853867434, 2147483926,'DisplayName_L15',0,-1,-9223370842853867517,NULL)
,(-9223370842853867433, 2147483926,'DisplayName_L16',0,-1,-9223370842853867517,NULL)
,(-9223370838558900224, 2147483927,'Id',3,-1,NULL,NULL)
,(-9223370838558900223, 2147483927,'Identifier',0,-1,NULL,NULL)
,(-9223370838558900221, 2147483927,'DisplayName',0,-1,NULL,NULL)
,(-9223370838558900220, 2147483927,'ConnectionId',3,-1,NULL,NULL)
,(-9223370838558900219, 2147483927,'Connection',12,-1,NULL,NULL)
,(-9223370838558900218, 2147483927,'UpdateDate',4,-1,NULL,NULL)
,(-9223370838558900217, 2147483927,'Path',0,-1,NULL,NULL)
,(-9223370838558900216, 2147483927,'Columns',12,-1,NULL,2147483928)
,(-9223370834263932928, 2147483928,'Id',3,-1,NULL,NULL)
,(-9223370834263932927, 2147483928,'Identifier',0,-1,NULL,NULL)
,(-9223370834263932925, 2147483928,'DisplayName',0,-1,NULL,NULL)
,(-9223370834263932924, 2147483928,'TableId',3,-1,NULL,NULL)
,(-9223370834263932923, 2147483928,'Table',12,-1,NULL,NULL)
,(-9223370834263932922, 2147483928,'UpdateDate',4,-1,NULL,NULL)
,(-9223370834263932921, 2147483928,'Path',0,-1,NULL,NULL)
,(-9223370834263932920, 2147483928,'KeyType',9,-1,NULL,NULL)
,(-9223370834263932919, 2147483928,'ValueType',9,-1,NULL,NULL)
,(-9223370834263932918, 2147483928,'ValueLength',2,-1,NULL,NULL)
,(-9223370834263932917, 2147483928,'ForeignColumnId',3,-1,NULL,NULL)
,(-9223370834263932916, 2147483928,'IsMultivalued',5,-1,NULL,NULL)
,(-9223370829968965632, 2147483929,'Id',3,-1,NULL,NULL)
,(-9223370829968965631, 2147483929,'Identifier',0,-1,NULL,NULL)
,(-9223370829968965630, 2147483929,'DisplayName',0,-1,NULL,NULL)
,(-9223370829968965629, 2147483929,'Description',0,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223370829968965628, 2147483929,'Keywords',0,-1,NULL,NULL)
,(-9223370829968965627, 2147483929,'Publisher',0,-1,NULL,NULL)
,(-9223370829968965626, 2147483929,'Connections',12,-1,NULL,2147483926)
,(-9223370829968965625, 2147483929,'DisplayName_L1',0,-1,-9223370829968965630,NULL)
,(-9223370829968965624, 2147483929,'DisplayName_L2',0,-1,-9223370829968965630,NULL)
,(-9223370829968965623, 2147483929,'DisplayName_L3',0,-1,-9223370829968965630,NULL)
,(-9223370829968965622, 2147483929,'DisplayName_L4',0,-1,-9223370829968965630,NULL)
,(-9223370829968965621, 2147483929,'DisplayName_L5',0,-1,-9223370829968965630,NULL)
,(-9223370829968965620, 2147483929,'DisplayName_L6',0,-1,-9223370829968965630,NULL)
,(-9223370829968965619, 2147483929,'DisplayName_L7',0,-1,-9223370829968965630,NULL)
,(-9223370829968965618, 2147483929,'DisplayName_L8',0,-1,-9223370829968965630,NULL)
,(-9223370829968965617, 2147483929,'Description_L1',0,-1,-9223370829968965629,NULL)
,(-9223370829968965616, 2147483929,'Description_L2',0,-1,-9223370829968965629,NULL)
,(-9223370829968965615, 2147483929,'Description_L3',0,-1,-9223370829968965629,NULL)
,(-9223370829968965614, 2147483929,'Description_L4',0,-1,-9223370829968965629,NULL)
,(-9223370829968965613, 2147483929,'Description_L5',0,-1,-9223370829968965629,NULL)
,(-9223370829968965612, 2147483929,'Description_L6',0,-1,-9223370829968965629,NULL)
,(-9223370829968965611, 2147483929,'Description_L7',0,-1,-9223370829968965629,NULL)
,(-9223370829968965610, 2147483929,'Description_L8',0,-1,-9223370829968965629,NULL)
,(-9223370829968965609, 2147483929,'ImplementsEntityTypeMapping',5,-1,NULL,NULL)
,(-9223370829968965608, 2147483929,'ImplementsResourceTypeMapping',5,-1,NULL,NULL)
,(-9223370829968965607, 2147483929,'ExportType',2,-1,NULL,NULL)
,(-9223370829968965606, 2147483929,'FulfillmentType',2,-1,NULL,NULL)
,(-9223370829968965605, 2147483929,'ImplementsConfiguration',5,-1,NULL,NULL)
,(-9223370829968965604, 2147483929,'HasIncrementalMode',5,-1,NULL,NULL)
,(-9223370829968965603, 2147483929,'LogoUrl',0,-1,NULL,NULL)
,(-9223370829968965602, 2147483929,'WebsiteUrl',0,-1,NULL,NULL)
,(-9223370829968965601, 2147483929,'DocumentationUrl',0,-1,NULL,NULL)
,(-9223370829968965600, 2147483929,'License',0,-1,NULL,NULL)
,(-9223370829968965599, 2147483929,'InducedFulfillment',2,-1,NULL,NULL)
,(-9223370829968965562, 2147483929,'Description_L9',0,-1,-9223370829968965629,NULL)
,(-9223370829968965561, 2147483929,'Description_L10',0,-1,-9223370829968965629,NULL)
,(-9223370829968965560, 2147483929,'Description_L11',0,-1,-9223370829968965629,NULL)
,(-9223370829968965559, 2147483929,'Description_L12',0,-1,-9223370829968965629,NULL)
,(-9223370829968965558, 2147483929,'Description_L13',0,-1,-9223370829968965629,NULL)
,(-9223370829968965557, 2147483929,'Description_L14',0,-1,-9223370829968965629,NULL)
,(-9223370829968965556, 2147483929,'Description_L15',0,-1,-9223370829968965629,NULL)
,(-9223370829968965555, 2147483929,'Description_L16',0,-1,-9223370829968965629,NULL)
,(-9223370829968965552, 2147483929,'DisplayName_L9',0,-1,-9223370829968965630,NULL)
,(-9223370829968965551, 2147483929,'DisplayName_L10',0,-1,-9223370829968965630,NULL)
,(-9223370829968965550, 2147483929,'DisplayName_L11',0,-1,-9223370829968965630,NULL)
,(-9223370829968965549, 2147483929,'DisplayName_L12',0,-1,-9223370829968965630,NULL)
,(-9223370829968965548, 2147483929,'DisplayName_L13',0,-1,-9223370829968965630,NULL)
,(-9223370829968965547, 2147483929,'DisplayName_L14',0,-1,-9223370829968965630,NULL)
,(-9223370829968965546, 2147483929,'DisplayName_L15',0,-1,-9223370829968965630,NULL)
,(-9223370829968965545, 2147483929,'DisplayName_L16',0,-1,-9223370829968965630,NULL)
,(-9223370825673998336, 2147483930,'Id',3,-1,NULL,NULL)
,(-9223370825673998335, 2147483930,'Identifier',0,-1,NULL,NULL)
,(-9223370825673998334, 2147483930,'WhereExpression',0,-1,NULL,NULL)
,(-9223370825673998331, 2147483930,'EntityType',12,-1,NULL,2147483675)
,(-9223370825673998330, 2147483930,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370825673998329, 2147483930,'PolicyId',3,-1,NULL,NULL)
,(-9223370825673998328, 2147483930,'CategoryId',3,-1,NULL,NULL)
,(-9223370825673998327, 2147483930,'Policy',12,-1,NULL,2147483669)
,(-9223370825673998326, 2147483930,'Rules',12,-1,NULL,NULL)
,(-9223370825673998325, 2147483930,'Category',12,-1,NULL,2147483668)
,(-9223370825673998324, 2147483930,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223370825673998323, 2147483930,'ResourceType',12,-1,NULL,2147483671)
,(-9223370825673998322, 2147483930,'PropertyId',3,-1,NULL,NULL)
,(-9223370825673998321, 2147483930,'Property',12,-1,NULL,2147483676)
,(-9223370825673998320, 2147483930,'ApprovalWorkflowType',2,-1,NULL,NULL)
,(-9223370825673998319, 2147483930,'HideOnSimplifiedView',5,-1,NULL,NULL)
,(-9223370825673998318, 2147483930,'CommentActivationOnApproveInReview',9,-1,NULL,NULL)
,(-9223370825673998317, 2147483930,'CommentActivationOnDeclineInReview',9,-1,NULL,NULL)
,(-9223370825673998316, 2147483930,'CommentActivationOnDeleteGapInReconciliation',9,-1,NULL,NULL)
,(-9223370825673998315, 2147483930,'CommentActivationOnKeepGapInReconciliation',9,-1,NULL,NULL)
,(-9223370825673998314, 2147483930,'DisplayNameBindingId',3,-1,NULL,NULL)
,(-9223370825673998313, 2147483930,'DisplayNameExpression',0,-1,NULL,NULL)
,(-9223370825673998312, 2147483930,'DisplayNameBinding',12,-1,NULL,2147483690)
,(-9223370825673998311, 2147483930,'ApprovalRequired',5,-1,NULL,NULL)
,(-9223370825673998310, 2147483930,'IdentifierExpression',0,-1,NULL,NULL)
,(-9223370825673998309, 2147483930,'IdentifierBindingId',3,-1,NULL,NULL)
,(-9223370825673998308, 2147483930,'ImplicitApproval',9,-1,NULL,NULL)
,(-9223370825673998307, 2147483930,'CategoryIdentifierExpression',0,-1,NULL,NULL)
,(-9223370825673998306, 2147483930,'CategoryIdentifierBindingId',3,-1,NULL,NULL)
,(-9223370825673998305, 2147483930,'CategoryDisplayNameBindingId',3,-1,NULL,NULL)
,(-9223370825673998304, 2147483930,'CategoryDisplayNameExpression',0,-1,NULL,NULL)
,(-9223370825673998303, 2147483930,'ParentCategoryIdentifierExpression',0,-1,NULL,NULL)
,(-9223370825673998302, 2147483930,'ParentCategoryIdentifierBindingId',3,-1,NULL,NULL)
,(-9223370825673998301, 2147483930,'IdentifierBinding',12,-1,NULL,2147483690)
,(-9223370825673998300, 2147483930,'CategoryIdentifierBinding',12,-1,NULL,2147483690)
,(-9223370825673998299, 2147483930,'ParentCategoryIdentifierBinding',12,-1,NULL,2147483690)
,(-9223370825673998298, 2147483930,'CategoryDisplayNameBinding',12,-1,NULL,2147483690)
,(-9223370825673998297, 2147483930,'RolePolicy',12,-1,NULL,2147483669)
,(-9223370825673998296, 2147483930,'RolePolicyId',3,-1,NULL,NULL)
,(-9223370825673998295, 2147483930,'CommentActivationOnRequest',9,-1,NULL,NULL)
,(-9223370825673997824, 2147483930,'WhenCreated',4,-1,NULL,NULL)
,(-9223370825673997823, 2147483930,'CreatedById',3,-1,NULL,NULL)
,(-9223370825673997822, 2147483930,'CreatedBy',12,-1,NULL,NULL)
,(-9223370825673997821, 2147483930,'WhenChanged',4,-1,NULL,NULL)
,(-9223370825673997820, 2147483930,'ChangedById',3,-1,NULL,NULL)
,(-9223370825673997819, 2147483930,'ChangedBy',12,-1,NULL,NULL)
,(-9223370821379031040, 2147483931,'Id',3,-1,NULL,NULL)
,(-9223370821379031039, 2147483931,'RoleMapping',12,-1,NULL,2147483930)
,(-9223370821379031038, 2147483931,'RoleMappingId',3,-1,NULL,NULL)
,(-9223370821379031037, 2147483931,'Order',2,-1,NULL,NULL)
,(-9223370821379031036, 2147483931,'Items',12,-1,NULL,NULL)
,(-9223370821379030528, 2147483931,'WhenCreated',4,-1,NULL,NULL)
,(-9223370821379030527, 2147483931,'CreatedById',3,-1,NULL,NULL)
,(-9223370821379030526, 2147483931,'CreatedBy',12,-1,NULL,NULL)
,(-9223370821379030525, 2147483931,'WhenChanged',4,-1,NULL,NULL)
,(-9223370821379030524, 2147483931,'ChangedById',3,-1,NULL,NULL)
,(-9223370821379030523, 2147483931,'ChangedBy',12,-1,NULL,NULL)
,(-9223370817084063744, 2147483932,'Id',3,-1,NULL,NULL)
,(-9223370817084063743, 2147483932,'Operator',10,-1,NULL,NULL)
,(-9223370817084063742, 2147483932,'Value',0,-1,NULL,NULL)
,(-9223370817084063741, 2147483932,'PropertyId',3,-1,NULL,NULL)
,(-9223370817084063740, 2147483932,'Property',12,-1,NULL,2147483676)
,(-9223370817084063739, 2147483932,'RuleId',3,-1,NULL,NULL)
,(-9223370817084063738, 2147483932,'Rule',12,-1,NULL,2147483931)
,(-9223370817084063232, 2147483932,'WhenCreated',4,-1,NULL,NULL)
,(-9223370817084063231, 2147483932,'CreatedById',3,-1,NULL,NULL)
,(-9223370817084063230, 2147483932,'CreatedBy',12,-1,NULL,NULL)
,(-9223370817084063229, 2147483932,'WhenChanged',4,-1,NULL,NULL)
,(-9223370817084063228, 2147483932,'ChangedById',3,-1,NULL,NULL)
,(-9223370817084063227, 2147483932,'ChangedBy',12,-1,NULL,NULL)
,(-9223370812789096448, 2147483933,'Id',3,-1,NULL,NULL)
,(-9223370812789096447, 2147483933,'Identifier',0,-1,NULL,NULL)
,(-9223370812789096446, 2147483933,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370812789096445, 2147483933,'EntityType',12,-1,NULL,2147483675)
,(-9223370812789096444, 2147483933,'PropertyId',3,-1,NULL,NULL)
,(-9223370812789096443, 2147483933,'Property',12,-1,NULL,2147483676)
,(-9223370812789096442, 2147483933,'Priority',2,-1,NULL,NULL)
,(-9223370812789096441, 2147483933,'BindingId',3,-1,NULL,NULL)
,(-9223370812789096440, 2147483933,'Binding',12,-1,NULL,2147483690)
,(-9223370812789096439, 2147483933,'PropertyCriterionId',3,-1,NULL,NULL)
,(-9223370812789096438, 2147483933,'PropertyCriterion',12,-1,NULL,2147483676)
,(-9223370812789096437, 2147483933,'Expression',0,-1,NULL,NULL)
,(-9223370808494129152, 2147483934,'Id',3,-1,NULL,NULL)
,(-9223370808494129150, 2147483934,'Universe',12,-1,NULL,2147483920)
,(-9223370808494129149, 2147483934,'Direction',9,-1,NULL,NULL)
,(-9223370808494129147, 2147483934,'Instance1',12,-1,NULL,2147483921)
,(-9223370808494129145, 2147483934,'Instance2',12,-1,NULL,2147483921)
,(-9223370808494129143, 2147483934,'Association',12,-1,NULL,2147483677)
,(-9223370804199161856, 2147483935,'Id',3,-1,NULL,NULL)
,(-9223370804199161855, 2147483935,'PolicyId',3,-1,NULL,NULL)
,(-9223370804199161854, 2147483935,'Policy',12,-1,NULL,2147483669)
,(-9223370804199161853, 2147483935,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223370804199161852, 2147483935,'ResourceType',12,-1,NULL,2147483671)
,(-9223370804199161851, 2147483935,'ResourceTypeIdentificationConfidenceLevel',2,-1,NULL,NULL)
,(-9223370804199161850, 2147483935,'SourceMatchedConfidenceLevel',5,-1,NULL,NULL)
,(-9223370804199161849, 2147483935,'TargetExpression',0,-1,NULL,NULL)
,(-9223370804199161848, 2147483935,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370804199161847, 2147483935,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223370804199161846, 2147483935,'BaseRule',12,-1,NULL,2147483935)
,(-9223370804199161845, 2147483935,'RuleBase',12,-1,NULL,NULL)
,(-9223370804199161728, 2147483935,'WhenCreated',4,-1,NULL,NULL)
,(-9223370804199161727, 2147483935,'CreatedById',3,-1,NULL,NULL)
,(-9223370804199161726, 2147483935,'CreatedBy',12,-1,NULL,NULL)
,(-9223370804199161725, 2147483935,'WhenChanged',4,-1,NULL,NULL)
,(-9223370804199161724, 2147483935,'ChangedById',3,-1,NULL,NULL)
,(-9223370804199161723, 2147483935,'ChangedBy',12,-1,NULL,NULL)
,(-9223370799904194560, 2147483936,'Id',3,-1,NULL,NULL)
,(-9223370799904194558, 2147483936,'TransformationOrder',2,-1,NULL,NULL)
,(-9223370799904194557, 2147483936,'ConnectionId',3,-1,NULL,NULL)
,(-9223370799904194556, 2147483936,'Connection',12,-1,NULL,NULL)
,(-9223370799904194555, 2147483936,'Type',2,-1,NULL,NULL)
,(-9223370799904194554, 2147483936,'Table',0,-1,NULL,NULL)
,(-9223370799904194553, 2147483936,'Column',0,-1,NULL,NULL)
,(-9223370799904194552, 2147483936,'InputColumn',0,-1,NULL,NULL)
,(-9223370799904194551, 2147483936,'InputColumn2',0,-1,NULL,NULL)
,(-9223370799904194550, 2147483936,'InputColumn3',0,-1,NULL,NULL)
,(-9223370799904194549, 2147483936,'InputColumn4',0,-1,NULL,NULL)
,(-9223370799904194548, 2147483936,'InputColumn5',0,-1,NULL,NULL)
,(-9223370799904194547, 2147483936,'WhereOperator',2,-1,NULL,NULL)
,(-9223370799904194546, 2147483936,'WhereValue',0,-1,NULL,NULL)
,(-9223370799904194545, 2147483936,'DatePattern',0,-1,NULL,NULL)
,(-9223370799904194544, 2147483936,'AddedDays',7,-1,NULL,NULL)
,(-9223370799904194543, 2147483936,'MinYear',2,-1,NULL,NULL)
,(-9223370799904194542, 2147483936,'MaxYear',2,-1,NULL,NULL)
,(-9223370799904194541, 2147483936,'ConcatSeparator',0,-1,NULL,NULL)
,(-9223370799904194540, 2147483936,'RemoveEmpty',5,-1,NULL,NULL)
,(-9223370799904194539, 2147483936,'RemoveDuplicates',5,-1,NULL,NULL)
,(-9223370799904194538, 2147483936,'SortValues',5,-1,NULL,NULL)
,(-9223370610925633536, 2147483980,'Id',3,-1,NULL,NULL)
,(-9223370610925633535, 2147483980,'Rule',12,-1,NULL,2147483983)
,(-9223370610925633534, 2147483980,'RuleId',3,-1,NULL,NULL)
,(-9223370610925633533, 2147483980,'Permission',12,-1,NULL,2147483982)
,(-9223370610925633532, 2147483980,'PermissionId',3,-1,NULL,NULL)
,(-9223370610925633530, 2147483980,'IsPreCondition',5,-1,NULL,NULL)
,(-9223370610925633529, 2147483980,'IsPostCondition',5,-1,NULL,NULL)
,(-9223370610925633528, 2147483980,'CanExecute',5,-1,NULL,NULL)
,(-9223370610925633527, 2147483980,'Notify',5,-1,NULL,NULL)
,(-9223370610925633526, 2147483980,'Priority',2,-1,NULL,NULL)
,(-9223370610925633525, 2147483980,'FullAccessProperties',5,-1,NULL,NULL)
,(-9223370606630666240, 2147483981,'Id',3,-1,NULL,NULL)
,(-9223370606630666239, 2147483981,'Rule',12,-1,NULL,2147483983)
,(-9223370606630666238, 2147483981,'RuleId',3,-1,NULL,NULL)
,(-9223370606630666237, 2147483981,'Binding',12,-1,NULL,2147483690)
,(-9223370606630666236, 2147483981,'BindingId',3,-1,NULL,NULL)
,(-9223370606630666235, 2147483981,'CompositeRole',5,-1,NULL,NULL)
,(-9223370606630666234, 2147483981,'SingleRole',5,-1,NULL,NULL)
,(-9223370606630666233, 2147483981,'ResourceType',5,-1,NULL,NULL)
,(-9223370606630666232, 2147483981,'Category',5,-1,NULL,NULL)
,(-9223370606630666231, 2147483981,'Dimension',12,-1,NULL,2147483685)
,(-9223370606630666230, 2147483981,'DimensionId',3,-1,NULL,NULL)
,(-9223370606630666229, 2147483981,'Value',0,-1,NULL,NULL)
,(-9223370602335698944, 2147483982,'Id',3,-1,NULL,NULL)
,(-9223370602335698943, 2147483982,'Identifier',0,-1,NULL,NULL)
,(-9223370602335698942, 2147483982,'BlockInheritance',5,-1,NULL,NULL)
;
INSERT INTO "#tmp_um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
 (-9223370602335698941, 2147483982,'Entries',12,-1,NULL,NULL)
,(-9223370598040731648, 2147483983,'Id',3,-1,NULL,NULL)
,(-9223370598040731647, 2147483983,'Identifier',0,-1,NULL,NULL)
,(-9223370598040731645, 2147483983,'DisplayName',0,-1,NULL,NULL)
,(-9223370598040731644, 2147483983,'DisplayName_L1',0,-1,-9223370598040731645,NULL)
,(-9223370598040731643, 2147483983,'DisplayName_L2',0,-1,-9223370598040731645,NULL)
,(-9223370598040731642, 2147483983,'DisplayName_L3',0,-1,-9223370598040731645,NULL)
,(-9223370598040731641, 2147483983,'DisplayName_L4',0,-1,-9223370598040731645,NULL)
,(-9223370598040731640, 2147483983,'DisplayName_L5',0,-1,-9223370598040731645,NULL)
,(-9223370598040731639, 2147483983,'DisplayName_L6',0,-1,-9223370598040731645,NULL)
,(-9223370598040731638, 2147483983,'DisplayName_L7',0,-1,-9223370598040731645,NULL)
,(-9223370598040731637, 2147483983,'DisplayName_L8',0,-1,-9223370598040731645,NULL)
,(-9223370598040731636, 2147483983,'Profile',12,-1,NULL,2147483807)
,(-9223370598040731635, 2147483983,'ProfileId',3,-1,NULL,NULL)
,(-9223370598040731634, 2147483983,'EntityType',12,-1,NULL,2147483675)
,(-9223370598040731633, 2147483983,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370598040731632, 2147483983,'Entries',12,-1,NULL,NULL)
,(-9223370598040731631, 2147483983,'Filters',12,-1,NULL,NULL)
,(-9223370598040731568, 2147483983,'DisplayName_L9',0,-1,-9223370598040731645,NULL)
,(-9223370598040731567, 2147483983,'DisplayName_L10',0,-1,-9223370598040731645,NULL)
,(-9223370598040731566, 2147483983,'DisplayName_L11',0,-1,-9223370598040731645,NULL)
,(-9223370598040731565, 2147483983,'DisplayName_L12',0,-1,-9223370598040731645,NULL)
,(-9223370598040731564, 2147483983,'DisplayName_L13',0,-1,-9223370598040731645,NULL)
,(-9223370598040731563, 2147483983,'DisplayName_L14',0,-1,-9223370598040731645,NULL)
,(-9223370598040731562, 2147483983,'DisplayName_L15',0,-1,-9223370598040731645,NULL)
,(-9223370598040731561, 2147483983,'DisplayName_L16',0,-1,-9223370598040731645,NULL)
,(-9223370593745764352, 2147483984,'Id',3,-1,NULL,NULL)
,(-9223370593745764351, 2147483984,'Identifier',0,-1,NULL,NULL)
,(-9223370593745764350, 2147483984,'EntityType',12,-1,NULL,2147483675)
,(-9223370593745764349, 2147483984,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370593745764346, 2147483984,'WhenStarted',4,-1,NULL,NULL)
,(-9223370593745764345, 2147483984,'StartedBy',12,-1,NULL,2147483670)
,(-9223370593745764344, 2147483984,'StartedById',3,-1,NULL,NULL)
,(-9223370593745764343, 2147483984,'WhenCompleted',4,-1,NULL,NULL)
,(-9223370593745764342, 2147483984,'CompositeRoleAddedAutomaticCount',2,-1,NULL,NULL)
,(-9223370593745764341, 2147483984,'CompositeRoleAddedBlockedCount',2,-1,NULL,NULL)
,(-9223370593745764340, 2147483984,'CompositeRoleAddedFoundOrHistoryCount',2,-1,NULL,NULL)
,(-9223370593745764339, 2147483984,'CompositeRoleDeletedCount',2,-1,NULL,NULL)
,(-9223370593745764338, 2147483984,'CompositeRoleUpdatedCount',2,-1,NULL,NULL)
,(-9223370593745764337, 2147483984,'SingleRoleAddedAutomaticCount',2,-1,NULL,NULL)
,(-9223370593745764336, 2147483984,'SingleRoleAddedBlockedCount',2,-1,NULL,NULL)
,(-9223370593745764335, 2147483984,'SingleRoleAddedFoundOrHistoryCount',2,-1,NULL,NULL)
,(-9223370593745764334, 2147483984,'SingleRoleDeletedCount',2,-1,NULL,NULL)
,(-9223370593745764333, 2147483984,'SingleRoleUpdatedCount',2,-1,NULL,NULL)
,(-9223370593745764332, 2147483984,'ResourceTypeAddedAutomaticCount',2,-1,NULL,NULL)
,(-9223370593745764331, 2147483984,'ResourceTypeAddedBlockedCount',2,-1,NULL,NULL)
,(-9223370593745764330, 2147483984,'ResourceTypeAddedFoundOrHistoryCount',2,-1,NULL,NULL)
,(-9223370593745764329, 2147483984,'ResourceTypeDeletedCount',2,-1,NULL,NULL)
,(-9223370593745764328, 2147483984,'ResourceTypeUpdatedCount',2,-1,NULL,NULL)
,(-9223370593745764327, 2147483984,'ResourceNavigationAddedAutomaticCount',2,-1,NULL,NULL)
,(-9223370593745764326, 2147483984,'ResourceNavigationAddedBlockedCount',2,-1,NULL,NULL)
,(-9223370593745764325, 2147483984,'ResourceNavigationAddedFoundOrHistoryCount',2,-1,NULL,NULL)
,(-9223370593745764324, 2147483984,'ResourceNavigationDeletedCount',2,-1,NULL,NULL)
,(-9223370593745764323, 2147483984,'ResourceNavigationUpdatedCount',2,-1,NULL,NULL)
,(-9223370593745764322, 2147483984,'ResourceScalarAddedAutomaticCount',2,-1,NULL,NULL)
,(-9223370593745764321, 2147483984,'ResourceScalarAddedBlockedCount',2,-1,NULL,NULL)
,(-9223370593745764320, 2147483984,'ResourceScalarAddedFoundOrHistoryCount',2,-1,NULL,NULL)
,(-9223370593745764319, 2147483984,'ResourceScalarDeletedCount',2,-1,NULL,NULL)
,(-9223370593745764318, 2147483984,'ResourceScalarUpdatedCount',2,-1,NULL,NULL)
,(-9223370593745764312, 2147483984,'BlockProvisioning',5,-1,NULL,NULL)
,(-9223370593745764311, 2147483984,'State',9,-1,NULL,NULL)
,(-9223370593745764310, 2147483984,'RiskAddedCount',2,-1,NULL,NULL)
,(-9223370593745764309, 2147483984,'RiskDeletedCount',2,-1,NULL,NULL)
,(-9223370593745764308, 2147483984,'Policy',12,-1,NULL,2147483669)
,(-9223370593745764307, 2147483984,'PolicyId',3,-1,NULL,NULL)
,(-9223370589450797056, 2147483985,'Id',3,-1,NULL,NULL)
,(-9223370589450797055, 2147483985,'PolicyId',3,-1,NULL,NULL)
,(-9223370589450797054, 2147483985,'Policy',12,-1,NULL,2147483669)
,(-9223370589450797053, 2147483985,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370589450797052, 2147483985,'EntityType',12,-1,NULL,2147483675)
,(-9223370589450797049, 2147483985,'IncludeNoValidation',5,-1,NULL,NULL)
,(-9223370589450797048, 2147483985,'IncludeSimpleValidation',5,-1,NULL,NULL)
,(-9223370589450797047, 2147483985,'IncludeDoubleValidation',5,-1,NULL,NULL)
,(-9223370589450797046, 2147483985,'IncludeTripleValidation',5,-1,NULL,NULL)
,(-9223370589450797045, 2147483985,'RuleType',2,-1,NULL,NULL)
,(-9223370589450797044, 2147483985,'RulePolicyId',3,-1,NULL,NULL)
,(-9223370589450797043, 2147483985,'RulePolicy',12,-1,NULL,2147483669)
,(-9223370589450797042, 2147483985,'PrecisionMinPercentage',7,-1,NULL,NULL)
,(-9223370589450797041, 2147483985,'FalsePositiveMaxPercentage',7,-1,NULL,NULL)
,(-9223370589450797040, 2147483985,'Priority',2,-1,NULL,NULL)
,(-9223370589450797039, 2147483985,'CategoryId',3,-1,NULL,NULL)
,(-9223370589450797038, 2147483985,'Category',12,-1,NULL,2147483668)
,(-9223370589450797037, 2147483985,'ExcludeRole',5,-1,NULL,NULL)
,(-9223370585155829760, 2147483986,'Id',3,-1,NULL,NULL)
,(-9223370585155829759, 2147483986,'Operator1',9,-1,NULL,NULL)
,(-9223370585155829758, 2147483986,'Operator2',9,-1,NULL,NULL)
,(-9223370585155829757, 2147483986,'Operator3',9,-1,NULL,NULL)
,(-9223370585155829756, 2147483986,'Operator4',9,-1,NULL,NULL)
,(-9223370585155829755, 2147483986,'Operator5',9,-1,NULL,NULL)
,(-9223370585155829754, 2147483986,'ComparisonProperty1Id',3,-1,NULL,NULL)
,(-9223370585155829753, 2147483986,'ComparisonProperty2Id',3,-1,NULL,NULL)
,(-9223370585155829752, 2147483986,'ComparisonProperty3Id',3,-1,NULL,NULL)
,(-9223370585155829751, 2147483986,'ComparisonProperty4Id',3,-1,NULL,NULL)
,(-9223370585155829750, 2147483986,'ComparisonProperty5Id',3,-1,NULL,NULL)
,(-9223370585155829749, 2147483986,'Property1Id',3,-1,NULL,NULL)
,(-9223370585155829748, 2147483986,'Property2Id',3,-1,NULL,NULL)
,(-9223370585155829747, 2147483986,'Property3Id',3,-1,NULL,NULL)
,(-9223370585155829746, 2147483986,'Property4Id',3,-1,NULL,NULL)
,(-9223370585155829745, 2147483986,'Property5Id',3,-1,NULL,NULL)
,(-9223370585155829744, 2147483986,'Expression1',0,-1,NULL,NULL)
,(-9223370585155829743, 2147483986,'Expression2',0,-1,NULL,NULL)
,(-9223370585155829742, 2147483986,'Expression3',0,-1,NULL,NULL)
,(-9223370585155829741, 2147483986,'Expression4',0,-1,NULL,NULL)
,(-9223370585155829740, 2147483986,'Expression5',0,-1,NULL,NULL)
,(-9223370585155829739, 2147483986,'HomonymEntityLinkId',3,-1,NULL,NULL)
,(-9223370585155829738, 2147483986,'HomonymEntityLink',12,-1,NULL,2147483720)
,(-9223370585155829737, 2147483986,'ComparisonProperty1',12,-1,NULL,2147483676)
,(-9223370585155829736, 2147483986,'ComparisonProperty2',12,-1,NULL,2147483676)
,(-9223370585155829735, 2147483986,'ComparisonProperty3',12,-1,NULL,2147483676)
,(-9223370585155829734, 2147483986,'ComparisonProperty4',12,-1,NULL,2147483676)
,(-9223370585155829733, 2147483986,'ComparisonProperty5',12,-1,NULL,2147483676)
,(-9223370585155829732, 2147483986,'Property1',12,-1,NULL,2147483676)
,(-9223370585155829731, 2147483986,'Property2',12,-1,NULL,2147483676)
,(-9223370585155829730, 2147483986,'Property3',12,-1,NULL,2147483676)
,(-9223370585155829729, 2147483986,'Property4',12,-1,NULL,2147483676)
,(-9223370585155829728, 2147483986,'Property5',12,-1,NULL,2147483676)
,(-9223370580860862464, 2147483987,'Id',3,-1,NULL,NULL)
,(-9223370580860862463, 2147483987,'Identifier',0,-1,NULL,NULL)
,(-9223370580860862457, 2147483987,'DisplayName',0,-1,NULL,NULL)
,(-9223370580860862455, 2147483987,'DisplayName_L1',0,-1,-9223370580860862457,NULL)
,(-9223370580860862454, 2147483987,'DisplayName_L2',0,-1,-9223370580860862457,NULL)
,(-9223370580860862453, 2147483987,'DisplayName_L3',0,-1,-9223370580860862457,NULL)
,(-9223370580860862452, 2147483987,'DisplayName_L4',0,-1,-9223370580860862457,NULL)
,(-9223370580860862451, 2147483987,'DisplayName_L5',0,-1,-9223370580860862457,NULL)
,(-9223370580860862450, 2147483987,'DisplayName_L6',0,-1,-9223370580860862457,NULL)
,(-9223370580860862449, 2147483987,'DisplayName_L7',0,-1,-9223370580860862457,NULL)
,(-9223370580860862448, 2147483987,'DisplayName_L8',0,-1,-9223370580860862457,NULL)
,(-9223370580860862384, 2147483987,'DisplayName_L9',0,-1,-9223370580860862457,NULL)
,(-9223370580860862383, 2147483987,'DisplayName_L10',0,-1,-9223370580860862457,NULL)
,(-9223370580860862382, 2147483987,'DisplayName_L11',0,-1,-9223370580860862457,NULL)
,(-9223370580860862381, 2147483987,'DisplayName_L12',0,-1,-9223370580860862457,NULL)
,(-9223370580860862380, 2147483987,'DisplayName_L13',0,-1,-9223370580860862457,NULL)
,(-9223370580860862379, 2147483987,'DisplayName_L14',0,-1,-9223370580860862457,NULL)
,(-9223370580860862378, 2147483987,'DisplayName_L15',0,-1,-9223370580860862457,NULL)
,(-9223370580860862377, 2147483987,'DisplayName_L16',0,-1,-9223370580860862457,NULL)
,(-9223370580860862364, 2147483987,'Properties',12,-1,NULL,2147483717)
,(-9223370572270927872, 2147483989,'Id',3,-1,NULL,NULL)
,(-9223370572270927871, 2147483989,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223370572270927870, 2147483989,'ResourceType',12,-1,NULL,2147483671)
,(-9223370572270927869, 2147483989,'EntityTypeId',3,-1,NULL,NULL)
,(-9223370572270927868, 2147483989,'EntityType',12,-1,NULL,2147483675)
,(-9223366547886571520, 2147484926,'Id',3,-1,NULL,NULL)
,(-9223366547886571515, 2147484926,'Policy',12,-1,NULL,2147483669)
,(-9223366547886571514, 2147484926,'PolicyId',3,-1,NULL,NULL)
,(-9223366547886571513, 2147484926,'CompositeRole',12,-1,NULL,2147483693)
,(-9223366547886571512, 2147484926,'CompositeRoleId',3,-1,NULL,NULL)
,(-9223366547886571511, 2147484926,'SingleRole',12,-1,NULL,2147483667)
,(-9223366547886571510, 2147484926,'SingleRoleId',3,-1,NULL,NULL)
,(-9223366547886571509, 2147484926,'ResourceType',12,-1,NULL,2147483671)
,(-9223366547886571508, 2147484926,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223366547886571507, 2147484926,'Category',12,-1,NULL,2147483668)
,(-9223366547886571506, 2147484926,'CategoryId',3,-1,NULL,NULL)
,(-9223366547886571505, 2147484926,'Type',9,-1,NULL,NULL)
,(-9223366547886571504, 2147484926,'EntityTypeId',3,-1,NULL,NULL)
,(-9223366547886571502, 2147484926,'WorkflowState',9,-1,NULL,NULL)
,(-9223366547886571501, 2147484926,'HoursToWait',2,-1,NULL,NULL)
,(-9223366547886571500, 2147484926,'Decision',9,-1,NULL,NULL)
,(-9223366547886571008, 2147484926,'WhenCreated',4,-1,NULL,NULL)
,(-9223366547886571007, 2147484926,'CreatedById',3,-1,NULL,NULL)
,(-9223366547886571006, 2147484926,'CreatedBy',12,-1,NULL,NULL)
,(-9223366547886571005, 2147484926,'WhenChanged',4,-1,NULL,NULL)
,(-9223366547886571004, 2147484926,'ChangedById',3,-1,NULL,NULL)
,(-9223366547886571003, 2147484926,'ChangedBy',12,-1,NULL,NULL)
,(-9223340460255215616, 2147491000,'Id',3,-1,NULL,NULL)
,(-9223340460255215615, 2147491000,'Policy',12,-1,NULL,2147483669)
,(-9223340460255215614, 2147491000,'PolicyId',3,-1,NULL,NULL)
,(-9223340460255215613, 2147491000,'ResourceType',12,-1,NULL,2147483671)
,(-9223340460255215612, 2147491000,'ResourceTypeId',3,-1,NULL,NULL)
,(-9223340460255215611, 2147491000,'Property',12,-1,NULL,2147483676)
,(-9223340460255215610, 2147491000,'PropertyId',3,-1,NULL,NULL)
,(-9223340460255215609, 2147491000,'Binding',12,-1,NULL,2147483690)
,(-9223340460255215608, 2147491000,'BindingId',3,-1,NULL,NULL)
,(-9223340460255215606, 2147491000,'TimeOffsetReference',2,-1,NULL,NULL)
,(-9223340460255215605, 2147491000,'TimeOffsetBeforeReference',2,-1,NULL,NULL)
,(-9223340460255215604, 2147491000,'TimeOffsetAfterReference',2,-1,NULL,NULL)
,(-9223340460255215601, 2147491000,'SingleRoleId',3,-1,NULL,NULL)
,(-9223340460255215600, 2147491000,'SingleRole',12,-1,NULL,2147483667)
,(-9223340460255215576, 2147491000,'EntityTypeId',3,-1,NULL,NULL)
,(-9223340460255215488, 2147491000,'WhenCreated',4,-1,NULL,NULL)
,(-9223340460255215487, 2147491000,'CreatedById',3,-1,NULL,NULL)
,(-9223340460255215486, 2147491000,'CreatedBy',12,-1,NULL,NULL)
,(-9223340460255215485, 2147491000,'WhenChanged',4,-1,NULL,NULL)
,(-9223340460255215484, 2147491000,'ChangedById',3,-1,NULL,NULL)
,(-9223340460255215483, 2147491000,'ChangedBy',12,-1,NULL,NULL)
,(-9223340030758486016, 2147491100,'Id',3,-1,NULL,NULL)
,(-9223340030758486015, 2147491100,'State',10,-1,NULL,NULL)
,(-9223340030758486014, 2147491100,'Payload',0,-1,NULL,NULL)
,(-9223340030758486013, 2147491100,'CompletionRedirectUri',0,-1,NULL,NULL)
,(-9223340030758486012, 2147491100,'EventId',3,-1,NULL,NULL)
,(-9223340030758486011, 2147491100,'ActualCompletionDate',4,-1,NULL,NULL)
,(-9223340030758486010, 2147491100,'EstimatedCompletionDate',4,-1,NULL,NULL)
,(-9223340030758486009, 2147491100,'LaunchDate',4,-1,NULL,NULL)
;INSERT INTO "#tmp_um_entityassociations"("id","property1_id","property2_id","identifier","isproperty1collection","isproperty2collection") VALUES
 (-9223372015379939327, -9223372015379939327,-9223371843581247474,'AssignedCompositeRole.Role',0,1)
,(-9223372015379939326, -9223372015379939326,-9223371942365495289,'AssignedCompositeRole.Owner',0,1)
,(-9223372015379939325, -9223372015379939325,-9223371976725233659,'AssignedCompositeRole.ParametersContext',0,1)
,(-9223372015379939313, -9223372015379939313,-9223371787746672632,'AssignedCompositeRole.WorkflowInstance',0,1)
,(-9223372015379939309, -9223372015379939309,-9223371942365495279,'AssignedCompositeRole.Performer',0,1)
,(-9223372015379939278, -9223372015379939278,-9223371942365495236,'AssignedCompositeRole.Requester',0,1)
,(-9223372015379939275, -9223372015379939275,-9223371942365495233,'AssignedCompositeRole.Reviewer1',0,1)
,(-9223372015379939272, -9223372015379939272,-9223371942365495230,'AssignedCompositeRole.Reviewer2',0,1)
,(-9223372015379939269, -9223372015379939269,-9223371942365495227,'AssignedCompositeRole.Reviewer3',0,1)
,(-9223372015379939262, -9223372015379939262,-9223371942365495224,'AssignedCompositeRole.RiskReviewer',0,1)
,(-9223372011084972031, -9223372011084972031,-9223372002495037430,'AssignedResourceNavigation.AssignedResourceType',0,1)
,(-9223372011084972030, -9223372011084972030,-9223371916595691490,'AssignedResourceNavigation.Property',0,1)
,(-9223372011084972029, -9223372011084972029,-9223371942365495286,'AssignedResourceNavigation.Resource',0,1)
,(-9223372011084972013, -9223372011084972013,-9223371942365495276,'AssignedResourceNavigation.Performer',0,1)
,(-9223372011084972011, -9223372011084972011,-9223371942365495273,'AssignedResourceNavigation.PolicyResource',0,1)
,(-9223372011084971964, -9223372011084971964,-9223371942365495200,'AssignedResourceNavigation.Owner',0,1)
,(-9223372006790004735, -9223372006790004735,-9223372002495037429,'AssignedResourceScalar.AssignedResourceType',0,1)
,(-9223372006790004734, -9223372006790004734,-9223371916595691489,'AssignedResourceScalar.Property',0,1)
,(-9223372006790004717, -9223372006790004717,-9223371942365495275,'AssignedResourceScalar.Performer',0,1)
,(-9223372006790004668, -9223372006790004668,-9223371942365495199,'AssignedResourceScalar.Owner',0,1)
,(-9223372002495037439, -9223372002495037439,-9223371938070527989,'AssignedResourceType.Role',0,1)
,(-9223372002495037438, -9223372002495037438,-9223371942365495290,'AssignedResourceType.Owner',0,1)
,(-9223372002495037437, -9223372002495037437,-9223371942365495291,'AssignedResourceType.Resource',0,1)
,(-9223372002495037436, -9223372002495037436,-9223371976725233655,'AssignedResourceType.ParametersContext',0,1)
,(-9223372002495037420, -9223372002495037420,-9223371787746672630,'AssignedResourceType.WorkflowInstance',0,1)
,(-9223372002495037414, -9223372002495037414,-9223371942365495277,'AssignedResourceType.Performer',0,1)
,(-9223372002495037390, -9223372002495037390,-9223371942365495234,'AssignedResourceType.Requester',0,1)
,(-9223372002495037387, -9223372002495037387,-9223371942365495231,'AssignedResourceType.Reviewer1',0,1)
,(-9223372002495037384, -9223372002495037384,-9223371942365495228,'AssignedResourceType.Reviewer2',0,1)
,(-9223372002495037381, -9223372002495037381,-9223371942365495225,'AssignedResourceType.Reviewer3',0,1)
,(-9223371998200070143, -9223371998200070143,-9223371955250397175,'AssignedSingleRole.Role',0,1)
,(-9223371998200070142, -9223371998200070142,-9223371942365495288,'AssignedSingleRole.Owner',0,1)
,(-9223371998200070141, -9223371998200070141,-9223371976725233657,'AssignedSingleRole.ParametersContext',0,1)
,(-9223371998200070130, -9223371998200070130,-9223371787746672631,'AssignedSingleRole.WorkflowInstance',0,1)
,(-9223371998200070126, -9223371998200070126,-9223371942365495278,'AssignedSingleRole.Performer',0,1)
,(-9223371998200070094, -9223371998200070094,-9223371942365495235,'AssignedSingleRole.Requester',0,1)
,(-9223371998200070091, -9223371998200070091,-9223371942365495232,'AssignedSingleRole.Reviewer1',0,1)
,(-9223371998200070088, -9223371998200070088,-9223371942365495229,'AssignedSingleRole.Reviewer2',0,1)
,(-9223371998200070085, -9223371998200070085,-9223371942365495226,'AssignedSingleRole.Reviewer3',0,1)
,(-9223371998200070078, -9223371998200070078,-9223371942365495223,'AssignedSingleRole.RiskReviewer',0,1)
,(-9223371993905102843, -9223371993905102843,-9223372002495037407,'AssignedResourceError.AssignedResourceType',0,1)
,(-9223371989610135550, -9223371989610135550,-9223371985315168252,'IdentifiedRisk.Risk',0,1)
,(-9223371989610135548, -9223371989610135548,-9223371942365495274,'IdentifiedRisk.Owner',0,1)
,(-9223371985315168250, -9223371985315168250,-9223371946660462567,'Risk.Policy',0,1)
,(-9223371985315168247, -9223371985315168247,-9223371920890658769,'Risk.EntityType',0,1)
,(-9223371985315168126, -9223371985315168126,-9223371942365495014,'Risk.CreatedBy',0,1)
,(-9223371985315168123, -9223371985315168123,-9223371942365495013,'Risk.ChangedBy',0,1)
,(-9223371955250397181, -9223371955250397181,-9223371950955429881,'SingleRole.Category',0,1)
,(-9223371955250397179, -9223371955250397179,-9223371946660462587,'SingleRole.Policy',0,1)
,(-9223371955250397177, -9223371955250397177,-9223371920890658808,'SingleRole.EntityType',0,1)
,(-9223371955250397156, -9223371955250397156,-9223371950955429855,'SingleRole.SecondaryCategories',1,1)
,(-9223371955250397125, -9223371955250397125,-9223371955250397126,'SingleRole.RoleBase',0,1)
,(-9223371955250396670, -9223371955250396670,-9223371942365495006,'SingleRole.CreatedBy',0,1)
,(-9223371955250396667, -9223371955250396667,-9223371942365495005,'SingleRole.ChangedBy',0,1)
,(-9223371950955429883, -9223371950955429883,-9223371950955429885,'Category.Parent',0,1)
,(-9223371950955429878, -9223371950955429878,-9223371946660462589,'Category.Policy',0,1)
,(-9223371950955429872, -9223371950955429872,-9223371950955429871,'Category.Ancestors',1,1)
,(-9223371950955429834, -9223371950955429834,-9223371950955429833,'Category.SelfAndAncestors',1,1)
,(-9223371950955429758, -9223371950955429758,-9223371942365495040,'Category.CreatedBy',0,1)
,(-9223371950955429755, -9223371950955429755,-9223371942365495039,'Category.ChangedBy',0,1)
,(-9223371946660462555, -9223371946660462555,-9223371946660462556,'Policy.ProvisioningPolicy',0,1)
,(-9223371946660462552, -9223371946660462552,-9223371946660462553,'Policy.SimulationPolicy',0,1)
,(-9223371946660462078, -9223371946660462078,-9223371942365495032,'Policy.CreatedBy',0,1)
,(-9223371946660462075, -9223371946660462075,-9223371942365495031,'Policy.ChangedBy',0,1)
,(-9223371938070527997, -9223371938070527997,-9223371950955429874,'ResourceType.Category',0,1)
,(-9223371938070527995, -9223371938070527995,-9223371946660462583,'ResourceType.Policy',0,1)
,(-9223371938070527993, -9223371938070527993,-9223371920890658802,'ResourceType.SourceEntityType',0,1)
,(-9223371938070527991, -9223371938070527991,-9223371920890658800,'ResourceType.TargetEntityType',0,1)
,(-9223371938070527971, -9223371938070527971,-9223371950955429856,'ResourceType.SecondaryCategories',1,1)
,(-9223371938070527943, -9223371938070527943,-9223371384019746794,'ResourceType.SourceEntityTypeMapping',0,1)
,(-9223371938070527942, -9223371938070527942,-9223371384019746793,'ResourceType.TargetEntityTypeMapping',0,1)
,(-9223371938070527935, -9223371938070527935,-9223371938070527936,'ResourceType.RoleBase',0,1)
,(-9223371938070527925, -9223371938070527925,-9223371938070527923,'ResourceType.DependsOn',0,1)
,(-9223371938070527880, -9223371938070527880,-9223371916595691403,'ResourceType.DependsOnOwnerProperty',0,1)
,(-9223371938070527486, -9223371938070527486,-9223371942365495018,'ResourceType.CreatedBy',0,1)
,(-9223371938070527483, -9223371938070527483,-9223371942365495017,'ResourceType.ChangedBy',0,1)
,(-9223371929480593403, -9223371929480593403,-9223371332480139259,'Connector.Agent',0,1)
,(-9223371916595691515, -9223371916595691515,-9223371920890658813,'EntityProperty.EntityType',0,1)
,(-9223371916595691513, -9223371916595691513,-9223371912300724221,'EntityProperty.Association1',0,0)
,(-9223371916595691511, -9223371916595691511,-9223371912300724219,'EntityProperty.Association2',0,0)
,(-9223371916595691497, -9223371916595691497,-9223371916595691496,'EntityProperty.NeutralProperty',0,1)
,(-9223371916595691494, -9223371916595691494,-9223370894393475045,'EntityProperty.Language',0,1)
,(-9223371899415822333, -9223371899415822333,-9223371843581247479,'CompositeRoleRule.Role',0,1)
,(-9223371899415822331, -9223371899415822331,-9223371946660462581,'CompositeRoleRule.Policy',0,1)
,(-9223371899415822321, -9223371899415822321,-9223371899415822322,'CompositeRoleRule.RuleBase',0,1)
,(-9223371899415822320, -9223371899415822320,-9223371843581247397,'CompositeRoleRule.ParentRole',0,1)
,(-9223371899415821822, -9223371899415821822,-9223371942365495036,'CompositeRoleRule.CreatedBy',0,1)
,(-9223371899415821819, -9223371899415821819,-9223371942365495035,'CompositeRoleRule.ChangedBy',0,1)
,(-9223371895120855037, -9223371895120855037,-9223371955250397173,'SingleRoleRule.Role',0,1)
,(-9223371895120855035, -9223371895120855035,-9223371946660462579,'SingleRoleRule.Policy',0,1)
,(-9223371895120855033, -9223371895120855033,-9223371843581247477,'SingleRoleRule.CompositeRole',0,1)
,(-9223371895120855024, -9223371895120855024,-9223371895120855023,'SingleRoleRule.BaseRule',1,1)
,(-9223371895120854526, -9223371895120854526,-9223371942365495004,'SingleRoleRule.CreatedBy',0,1)
,(-9223371895120854523, -9223371895120854523,-9223371942365495003,'SingleRoleRule.ChangedBy',0,1)
,(-9223371890825887741, -9223371890825887741,-9223371938070527988,'ResourceTypeRule.Role',0,1)
,(-9223371890825887739, -9223371890825887739,-9223371946660462577,'ResourceTypeRule.Policy',0,1)
,(-9223371890825887737, -9223371890825887737,-9223371955250397171,'ResourceTypeRule.SingleRole',0,1)
,(-9223371890825887726, -9223371890825887726,-9223371890825887725,'ResourceTypeRule.BaseRule',1,1)
,(-9223371890825887230, -9223371890825887230,-9223371942365495016,'ResourceTypeRule.CreatedBy',0,1)
,(-9223371890825887227, -9223371890825887227,-9223371942365495015,'ResourceTypeRule.ChangedBy',0,1)
,(-9223371886530920446, -9223371886530920446,-9223371946660462575,'ResourceNavigationRule.Policy',0,1)
,(-9223371886530920444, -9223371886530920444,-9223371942365495285,'ResourceNavigationRule.Resource',0,1)
,(-9223371886530920442, -9223371886530920442,-9223371938070527986,'ResourceNavigationRule.ResourceType',0,1)
,(-9223371886530920440, -9223371886530920440,-9223371916595691509,'ResourceNavigationRule.Property',0,1)
,(-9223371886530920438, -9223371886530920438,-9223371955250397169,'ResourceNavigationRule.SingleRole',0,1)
,(-9223371886530920427, -9223371886530920427,-9223371886530920428,'ResourceNavigationRule.RuleBase',0,1)
,(-9223371886530919934, -9223371886530919934,-9223371942365495024,'ResourceNavigationRule.CreatedBy',0,1)
,(-9223371886530919931, -9223371886530919931,-9223371942365495023,'ResourceNavigationRule.ChangedBy',0,1)
,(-9223371877940985852, -9223371877940985852,-9223371920890658809,'Dimension.EntityType',0,1)
,(-9223371877940985841, -9223371877940985841,-9223371916595691460,'Dimension.ParentProperty',0,1)
,(-9223371869351051262, -9223371869351051262,-9223371920890658806,'DisplayTable.EntityType',0,1)
,(-9223371869351051260, -9223371869351051260,-9223371792041639926,'DisplayTable.DisplayTableDesignElement',0,1)
,(-9223371869351051249, -9223371869351051249,-9223371727617130480,'DisplayTable.HomonymWorflowLink',0,1)
,(-9223371869351051246, -9223371869351051246,-9223371916595691402,'DisplayTable.ParentProperty',0,1)
,(-9223371860761116664, -9223371860761116664,-9223371869351051259,'DisplayTableColumn.DisplayTable',0,1)
,(-9223371860761116662, -9223371860761116662,-9223371856466149373,'DisplayTableColumn.DisplayBinding',0,1)
,(-9223371860761116660, -9223371860761116660,-9223371856466149372,'DisplayTableColumn.SortBinding',0,1)
,(-9223371860761116643, -9223371860761116643,-9223371856466149316,'DisplayTableColumn.OptimizedDisplayBinding',0,1)
,(-9223371860761116641, -9223371860761116641,-9223371856466149314,'DisplayTableColumn.OptimizedSortBinding',0,1)
,(-9223371852171182078, -9223371852171182078,-9223371856466149374,'BindingItem.Binding',0,1)
,(-9223371852171182076, -9223371852171182076,-9223371916595691507,'BindingItem.Property',0,1)
,(-9223371843581247485, -9223371843581247485,-9223371950955429876,'CompositeRole.Category',0,1)
,(-9223371843581247483, -9223371843581247483,-9223371946660462585,'CompositeRole.Policy',0,1)
,(-9223371843581247481, -9223371843581247481,-9223371920890658804,'CompositeRole.EntityType',0,1)
,(-9223371843581247462, -9223371843581247462,-9223371950955429854,'CompositeRole.SecondaryCategories',1,1)
,(-9223371843581247435, -9223371843581247435,-9223371843581247436,'CompositeRole.RoleBase',0,1)
,(-9223371843581246974, -9223371843581246974,-9223371942365495038,'CompositeRole.CreatedBy',0,1)
,(-9223371843581246971, -9223371843581246971,-9223371942365495037,'CompositeRole.ChangedBy',0,1)
,(-9223371839286280190, -9223371839286280190,-9223371950955429867,'RoleCounter.Category',0,1)
,(-9223371839286280188, -9223371839286280188,-9223371920890658792,'RoleCounter.EntityType',0,1)
,(-9223371839286280183, -9223371839286280183,-9223371946660462569,'RoleCounter.Policy',0,1)
,(-9223371822106411005, -9223371822106411005,-9223371920890658793,'Tile.EntityType',0,0)
,(-9223371822106411003, -9223371822106411003,-9223371826401378302,'Tile.TileDesignElement',0,1)
,(-9223371817811443708, -9223371817811443708,-9223371822106411002,'TileItem.Tile',0,1)
,(-9223371817811443706, -9223371817811443706,-9223371856466149371,'TileItem.Binding',0,1)
,(-9223371817811443703, -9223371817811443703,-9223371856466149317,'TileItem.OptimizedBinding',0,1)
,(-9223371813516476415, -9223371813516476415,-9223371809221509118,'Activity.Workflow',0,1)
,(-9223371813516476413, -9223371813516476413,-9223371804926541822,'Activity.ActivityTemplate',0,1)
,(-9223371809221509095, -9223371809221509095,-9223371920890658763,'Workflow.VariablesType',0,1)
,(-9223371800631574526, -9223371800631574526,-9223371804926541821,'ActivityTemplateState.Template',0,1)
,(-9223371796336607230, -9223371796336607230,-9223371800631574525,'ActivityTemplateTransition.Fromstate',1,1)
,(-9223371787746672639, -9223371787746672639,-9223371809221509112,'WorkflowInstance.Workflow',0,1)
,(-9223371787746672636, -9223371787746672636,-9223371813516476407,'WorkflowInstance.CurrentActivity',0,1)
,(-9223371787746672628, -9223371787746672628,-9223371796336607225,'WorkflowInstance.CurrentTransition',0,1)
,(-9223371787746672626, -9223371787746672626,-9223371774861770729,'WorkflowInstance.CurrentActivityInstance',0,0)
,(-9223371783451705340, -9223371783451705340,-9223371920890658788,'SearchBar.EntityType',0,1)
,(-9223371783451705335, -9223371783451705335,-9223371856466149347,'SearchBar.SearchedBinding',0,1)
,(-9223371783451705333, -9223371783451705333,-9223371920890658787,'SearchBar.SearchedEntityType',0,1)
,(-9223371779156738046, -9223371779156738046,-9223371856466149370,'SearchBarCriterion.Binding1',0,1)
,(-9223371779156738042, -9223371779156738042,-9223371783451705337,'SearchBarCriterion.SearchBar',1,1)
,(-9223371779156738035, -9223371779156738035,-9223371856466149369,'SearchBarCriterion.Binding2',0,1)
,(-9223371779156738033, -9223371779156738033,-9223371856466149368,'SearchBarCriterion.Binding3',0,1)
,(-9223371779156738031, -9223371779156738031,-9223371856466149367,'SearchBarCriterion.Binding4',0,1)
,(-9223371779156737997, -9223371779156737997,-9223371856466149313,'SearchBarCriterion.OptimizedBinding1',0,1)
,(-9223371779156737995, -9223371779156737995,-9223371856466149312,'SearchBarCriterion.OptimizedBinding2',0,1)
,(-9223371779156737993, -9223371779156737993,-9223371856466149311,'SearchBarCriterion.OptimizedBinding3',0,1)
,(-9223371779156737991, -9223371779156737991,-9223371856466149310,'SearchBarCriterion.OptimizedBinding4',0,1)
,(-9223371774861770747, -9223371774861770747,-9223371787746672633,'ActivityInstance.WorkflowInstance',0,1)
,(-9223371774861770744, -9223371774861770744,-9223371942365495281,'ActivityInstance.Performer',0,1)
,(-9223371774861770742, -9223371774861770742,-9223371942365495287,'ActivityInstance.CCResources',1,1)
,(-9223371774861770740, -9223371774861770740,-9223371813516476406,'ActivityInstance.Activity',0,1)
,(-9223371774861770738, -9223371774861770738,-9223371942365495280,'ActivityInstance.Actors',1,1)
,(-9223371774861770737, -9223371774861770737,-9223371800631574521,'ActivityInstance.State',0,1)
,(-9223371774861770732, -9223371774861770732,-9223370911573344242,'ActivityInstance.OpenIdClient',0,1)
,(-9223371774861770727, -9223371774861770727,-9223371942365495270,'ActivityInstance.AssignedTo',0,1)
,(-9223371770566803455, -9223371770566803455,-9223371813516476405,'PointCut.Activity',0,1)
,(-9223371770566803451, -9223371770566803451,-9223371766271836156,'PointCut.Aspect',0,1)
,(-9223371766271836155, -9223371766271836155,-9223371856466149324,'Aspect.Binding',0,1)
,(-9223371766271836153, -9223371766271836153,-9223371856466149323,'Aspect.ExpressionBinding',0,1)
,(-9223371766271836116, -9223371766271836116,-9223371856466149322,'Aspect.HistorizeBinding',1,1)
,(-9223371749091966974, -9223371749091966974,-9223371920890658786,'DisplayEntityType.EntityType',0,1)
,(-9223371749091966952, -9223371749091966952,-9223371856466149329,'DisplayEntityType.AutocompleteBinding',0,1)
,(-9223371744796999678, -9223371744796999678,-9223371912300724196,'DisplayEntityAssociation.EntityAssociation',1,1)
,(-9223371744796999676, -9223371744796999676,-9223371740502032354,'DisplayEntityAssociation.ParentTreeNavDisplayProperty',0,1)
,(-9223371740502032382, -9223371740502032382,-9223371916595691469,'DisplayEntityProperty.EntityProperty',0,1)
,(-9223371740502032376, -9223371740502032376,-9223371869351051251,'DisplayEntityProperty.DisplayTable',1,1)
,(-9223371740502032365, -9223371740502032365,-9223371749091966962,'DisplayEntityProperty.DisplayEntityType',1,1)
,(-9223371740502032363, -9223371740502032363,-9223371856466149345,'DisplayEntityProperty.NavigationBinding',0,1)
,(-9223371740502032360, -9223371740502032360,-9223370580860862364,'DisplayEntityProperty.Group',0,1)
,(-9223371740502032326, -9223371740502032326,-9223371856466149330,'DisplayEntityProperty.AutocompleteBinding',0,1)
,(-9223371727617130493, -9223371727617130493,-9223371920890658746,'HomonymEntityLink.Workflow1',1,1)
,(-9223371723322163192, -9223371723322163192,-9223371938070527970,'ResourceTypeMapping.ResourceType',0,1)
,(-9223371723322163159, -9223371723322163159,-9223370842853867478,'ResourceTypeMapping.Connection',0,1)
,(-9223371723322163156, -9223371723322163156,-9223371714732228588,'ResourceTypeMapping.PasswordResetSetting',0,1)
,(-9223371719027195902, -9223371719027195902,-9223371723322163171,'ResourcePropertyMapping.ResourceTypeMapping',0,1)
,(-9223371719027195900, -9223371719027195900,-9223371916595691492,'ResourcePropertyMapping.Property',0,1)
,(-9223371719027195898, -9223371719027195898,-9223371379724779493,'ResourcePropertyMapping.PropertyMapping',0,1)
,(-9223371384019746812, -9223371384019746812,-9223371929480593388,'EntityTypeMapping.Connector',0,1)
,(-9223371384019746803, -9223371384019746803,-9223371920890658785,'EntityTypeMapping.EntityType',0,1)
,(-9223371379724779514, -9223371379724779514,-9223371916595691470,'EntityPropertyMapping.EntityProperty',0,1)
,(-9223371379724779510, -9223371379724779510,-9223371384019746811,'EntityPropertyMapping.EntityTypeMapping',0,1)
,(-9223371375429812215, -9223371375429812215,-9223371379724779513,'EntityAssociationMapping.EntityPropertyMapping1',0,1)
,(-9223371375429812214, -9223371375429812214,-9223371379724779512,'EntityAssociationMapping.EntityPropertyMapping2',0,1)
,(-9223371375429812206, -9223371375429812206,-9223371912300724197,'EntityAssociationMapping.EntityAssociation',0,1)
,(-9223371375429812203, -9223371375429812203,-9223371929480593387,'EntityAssociationMapping.Connector',0,1)
,(-9223371366839877627, -9223371366839877627,-9223371371134844925,'FormControl.Form',0,1)
,(-9223371366839877625, -9223371366839877625,-9223371366839877624,'FormControl.Parent',0,1)
,(-9223371366839877622, -9223371366839877622,-9223371856466149375,'FormControl.Binding',0,1)
,(-9223371366839877615, -9223371366839877615,-9223371822106411000,'FormControl.Tile',0,1)
,(-9223371366839877613, -9223371366839877613,-9223371869351051257,'FormControl.DisplayTable',0,1)
;
INSERT INTO "#tmp_um_entityassociations"("id","property1_id","property2_id","identifier","isproperty1collection","isproperty2collection") VALUES
 (-9223371366839877609, -9223371366839877609,-9223371856466149366,'FormControl.FilterBinding1',0,1)
,(-9223371366839877607, -9223371366839877607,-9223371856466149362,'FormControl.LinkedBinding1',0,1)
,(-9223371366839877605, -9223371366839877605,-9223371856466149361,'FormControl.FilterBinding2',0,1)
,(-9223371366839877603, -9223371366839877603,-9223371856466149363,'FormControl.LinkedBinding2',0,1)
,(-9223371366839877601, -9223371366839877601,-9223371727617130464,'FormControl.HomonymEntityLinkId',0,1)
,(-9223371366839877599, -9223371366839877599,-9223371856466149346,'FormControl.NavigationBinding',0,1)
,(-9223371366839877596, -9223371366839877596,-9223371856466149355,'FormControl.DefaultValueBinding',0,1)
,(-9223371366839877523, -9223371366839877523,-9223371856466149264,'FormControl.Binding2',0,1)
,(-9223371366839877521, -9223371366839877521,-9223371856466149262,'FormControl.Binding3',0,1)
,(-9223371358249943039, -9223371358249943039,-9223371946660462572,'ResourceScalarRule.Policy',0,1)
,(-9223371358249943037, -9223371358249943037,-9223371938070527983,'ResourceScalarRule.ResourceType',0,1)
,(-9223371358249943035, -9223371358249943035,-9223371916595691488,'ResourceScalarRule.Property',0,1)
,(-9223371358249943033, -9223371358249943033,-9223371856466149365,'ResourceScalarRule.Binding',0,1)
,(-9223371358249943024, -9223371358249943024,-9223371955250397146,'ResourceScalarRule.SingleRole',0,1)
,(-9223371358249942997, -9223371358249942997,-9223371358249942998,'ResourceScalarRule.RuleBase',0,1)
,(-9223371358249942910, -9223371358249942910,-9223371942365495020,'ResourceScalarRule.CreatedBy',0,1)
,(-9223371358249942907, -9223371358249942907,-9223371942365495019,'ResourceScalarRule.ChangedBy',0,1)
,(-9223371349660008442, -9223371349660008442,-9223371353954975742,'AssignedProfile.Profile',0,1)
,(-9223371349660008441, -9223371349660008441,-9223371345365041151,'AssignedProfile.Context',0,1)
,(-9223371349660008440, -9223371349660008440,-9223371942365495266,'AssignedProfile.User',0,1)
,(-9223371345365041148, -9223371345365041148,-9223371950955429865,'ProfileContext.Category',0,1)
,(-9223371345365041147, -9223371345365041147,-9223371843581247453,'ProfileContext.CompositeRole',0,1)
,(-9223371345365041145, -9223371345365041145,-9223371955250397147,'ProfileContext.SingleRole',0,1)
,(-9223371345365041143, -9223371345365041143,-9223371938070527957,'ProfileContext.ResourceType',0,1)
,(-9223371336775106553, -9223371336775106553,-9223371332480139258,'Task.Agent',0,1)
,(-9223371336775106550, -9223371336775106550,-9223370911573344235,'Task.OpenIdClient',0,1)
,(-9223371336775106461, -9223371336775106461,-9223371336775106459,'Task.Parent',1,1)
,(-9223371336775106458, -9223371336775106458,-9223371938070527930,'Task.ResourceTypes',1,1)
,(-9223371336775106457, -9223371336775106457,-9223371920890658766,'Task.EntityTypes',1,1)
,(-9223371336775106456, -9223371336775106456,-9223371877940985776,'Task.Dimensions',1,1)
,(-9223371336775106455, -9223371336775106455,-9223371929480593378,'Task.Connector',0,1)
,(-9223371302415368186, -9223371302415368186,-9223371920890658728,'Indicator.EntityType',0,1)
,(-9223371302415368185, -9223371302415368185,-9223371856466149288,'Indicator.Binding',0,1)
,(-9223371302415368181, -9223371302415368181,-9223371856466149287,'Indicator.OptimizedBinding',0,1)
,(-9223371298120400890, -9223371298120400890,-9223371302415368184,'IndicatorItem.Indicator',0,1)
,(-9223371190746218483, -9223371190746218483,-9223371332480139249,'Job.Agent',0,1)
,(-9223371190746218480, -9223371190746218480,-9223371173566349292,'Job.LastJobInstance',0,1)
,(-9223371186451251199, -9223371186451251199,-9223371190746218476,'JobStep.Job',0,1)
,(-9223371186451251198, -9223371186451251198,-9223371336775106470,'JobStep.Task',0,1)
,(-9223371182156283902, -9223371182156283902,-9223371336775106469,'TaskEntityType.Task',0,1)
,(-9223371182156283900, -9223371182156283900,-9223371920890658771,'TaskEntityType.EntityType',0,1)
,(-9223371177861316606, -9223371177861316606,-9223371336775106468,'TaskResourceType.Task',0,1)
,(-9223371177861316604, -9223371177861316604,-9223371938070527955,'TaskResourceType.ResourceType',0,1)
,(-9223371173566349311, -9223371173566349311,-9223371190746218475,'JobInstance.Job',0,1)
,(-9223371173566349309, -9223371173566349309,-9223371942365495246,'JobInstance.User',0,1)
,(-9223371169271382011, -9223371169271382011,-9223371336775106467,'TaskInstance.Task',0,1)
,(-9223371169271382009, -9223371169271382009,-9223371173566349301,'TaskInstance.JobInstance',0,1)
,(-9223371169271382005, -9223371169271382005,-9223371332480139248,'TaskInstance.Agent',0,1)
,(-9223371164976414718, -9223371164976414718,-9223371336775106466,'TaskDimension.Task',0,1)
,(-9223371164976414716, -9223371164976414716,-9223371877940985806,'TaskDimension.Dimension',0,1)
,(-9223371160681447422, -9223371160681447422,-9223371336775106464,'TaskDependOnTask.ChildTask',0,1)
,(-9223371160681447420, -9223371160681447420,-9223371336775106463,'TaskDependOnTask.ParentTask',0,1)
,(-9223371087667003391, -9223371087667003391,-9223372002495037321,'AssignedResourceBinary.AssignedResourceType',0,1)
,(-9223371087667003390, -9223371087667003390,-9223371916595691475,'AssignedResourceBinary.Property',0,1)
,(-9223371087667003389, -9223371087667003389,-9223371933775560697,'AssignedResourceBinary.Resource',0,1)
,(-9223371087667003373, -9223371087667003373,-9223371942365495201,'AssignedResourceBinary.Performer',0,1)
,(-9223371087667003371, -9223371087667003371,-9223371933775560696,'AssignedResourceBinary.PolicyResource',0,1)
,(-9223371087667003324, -9223371087667003324,-9223371942365495198,'AssignedResourceBinary.Owner',0,1)
,(-9223370907278376958, -9223370907278376958,-9223371946660462570,'ResourceCorrelationRule.Policy',0,1)
,(-9223370907278376956, -9223370907278376956,-9223371938070527980,'ResourceCorrelationRule.ResourceType',0,1)
,(-9223370907278376954, -9223370907278376954,-9223371856466149360,'ResourceCorrelationRule.SourceBinding',0,1)
,(-9223370907278376951, -9223370907278376951,-9223371856466149359,'ResourceCorrelationRule.TargetBinding',0,1)
,(-9223370907278376945, -9223370907278376945,-9223370907278376946,'ResourceCorrelationRule.RuleBase',0,1)
,(-9223370907278376830, -9223370907278376830,-9223371942365495026,'ResourceCorrelationRule.CreatedBy',0,1)
,(-9223370907278376827, -9223370907278376827,-9223371942365495025,'ResourceCorrelationRule.ChangedBy',0,1)
,(-9223370902983409644, -9223370902983409644,-9223371920890658798,'AccessCertificationCampaign.OwnerEntityType',0,1)
,(-9223370902983409640, -9223370902983409640,-9223370851443802110,'AccessCertificationCampaign.Policy',0,1)
,(-9223370898688442366, -9223370898688442366,-9223370902983409661,'AccessCertificationItem.Campaign',0,1)
,(-9223370898688442364, -9223370898688442364,-9223371942365495265,'AccessCertificationItem.Reviewer',0,1)
,(-9223370898688442360, -9223370898688442360,-9223371942365495264,'AccessCertificationItem.Administrator',0,1)
,(-9223370898688442357, -9223370898688442357,-9223371942365495263,'AccessCertificationItem.Owner',0,1)
,(-9223370898688442355, -9223370898688442355,-9223372015379939306,'AccessCertificationItem.AssignedCompositeRole',0,1)
,(-9223370898688442353, -9223370898688442353,-9223371998200070122,'AccessCertificationItem.AssignedSingleRole',0,1)
,(-9223370898688442351, -9223370898688442351,-9223372002495037406,'AccessCertificationItem.AssignedResourceType',0,1)
,(-9223370898688442349, -9223370898688442349,-9223372011084972010,'AccessCertificationItem.AssignedResourceNavigation',0,1)
,(-9223370898688442347, -9223370898688442347,-9223372006790004714,'AccessCertificationItem.AssignedResourceScalar',0,1)
,(-9223370890098507774, -9223370890098507774,-9223371946660462538,'ContextRule.Policy',0,1)
,(-9223370890098507772, -9223370890098507772,-9223371920890658776,'ContextRule.SourceEntityType',0,1)
,(-9223370890098507770, -9223370890098507770,-9223371856466149344,'ContextRule.Dimension0Binding',0,1)
,(-9223370890098507768, -9223370890098507768,-9223371856466149343,'ContextRule.Dimension1Binding',0,1)
,(-9223370890098507766, -9223370890098507766,-9223371856466149342,'ContextRule.Dimension2Binding',0,1)
,(-9223370890098507764, -9223370890098507764,-9223371856466149341,'ContextRule.Dimension3Binding',0,1)
,(-9223370890098507762, -9223370890098507762,-9223371856466149340,'ContextRule.Dimension4Binding',0,1)
,(-9223370890098507760, -9223370890098507760,-9223371856466149339,'ContextRule.Dimension5Binding',0,1)
,(-9223370890098507758, -9223370890098507758,-9223371856466149338,'ContextRule.Dimension6Binding',0,1)
,(-9223370890098507756, -9223370890098507756,-9223371856466149337,'ContextRule.Dimension7Binding',0,1)
,(-9223370890098507754, -9223370890098507754,-9223371856466149336,'ContextRule.ResourcesBinding',0,1)
,(-9223370890098507751, -9223370890098507751,-9223371856466149335,'ContextRule.ResourcesStartBinding',0,1)
,(-9223370890098507748, -9223370890098507748,-9223371856466149334,'ContextRule.ResourcesEndBinding',0,1)
,(-9223370890098507262, -9223370890098507262,-9223371942365495034,'ContextRule.CreatedBy',0,1)
,(-9223370890098507259, -9223370890098507259,-9223371942365495033,'ContextRule.ChangedBy',0,1)
,(-9223370885803540478, -9223370885803540478,-9223370902983409655,'AccessCertificationOwnerFilter.Campaign',0,1)
,(-9223370885803540476, -9223370885803540476,-9223371942365495252,'AccessCertificationOwnerFilter.IndividualOwner',0,1)
,(-9223370885803540473, -9223370885803540473,-9223371856466149331,'AccessCertificationOwnerFilter.OwnerLastModificationDateBinding',0,1)
,(-9223370885803540471, -9223370885803540471,-9223371985315168208,'AccessCertificationOwnerFilter.OwnerTargetRisk',0,1)
,(-9223370881508573182, -9223370881508573182,-9223370902983409656,'AccessCertificationDataFilter.Campaign',0,1)
,(-9223370881508573171, -9223370881508573171,-9223371950955429845,'AccessCertificationDataFilter.Category',0,1)
,(-9223370881508573169, -9223370881508573169,-9223371938070527961,'AccessCertificationDataFilter.ResourceType',0,1)
,(-9223370881508573162, -9223370881508573162,-9223371985315168209,'AccessCertificationDataFilter.TargetRisk',0,1)
,(-9223370877213605886, -9223370877213605886,-9223371946660462537,'ResourceQueryRule.Policy',0,1)
,(-9223370877213605884, -9223370877213605884,-9223371938070527960,'ResourceQueryRule.ResourceType',0,1)
,(-9223370877213605882, -9223370877213605882,-9223371916595691486,'ResourceQueryRule.Property',0,1)
,(-9223370877213605880, -9223370877213605880,-9223371856466149357,'ResourceQueryRule.TargetBinding',0,1)
,(-9223370877213605874, -9223370877213605874,-9223371856466149358,'ResourceQueryRule.SourceBinding',0,1)
,(-9223370877213605758, -9223370877213605758,-9223371942365495022,'ResourceQueryRule.CreatedBy',0,1)
,(-9223370877213605755, -9223370877213605755,-9223371942365495021,'ResourceQueryRule.ChangedBy',0,1)
,(-9223370872918638590, -9223370872918638590,-9223370898688442341,'ForwardedCertificationItem.Item',0,1)
,(-9223370872918638587, -9223370872918638587,-9223371942365495254,'ForwardedCertificationItem.From',0,1)
,(-9223370872918638585, -9223370872918638585,-9223371942365495253,'ForwardedCertificationItem.To',0,1)
,(-9223370864328703997, -9223370864328703997,-9223370868623671283,'EntityInstance.Universe',0,1)
,(-9223370864328703986, -9223370864328703986,-9223371920890658770,'EntityInstance.EntityType',0,1)
,(-9223370860033736700, -9223370860033736700,-9223371985315168245,'RiskRule.Risk',0,1)
,(-9223370860033736698, -9223370860033736698,-9223371946660462565,'RiskRule.Policy',0,1)
,(-9223370855738769406, -9223370855738769406,-9223370860033736696,'RiskRuleItem.Rule',0,1)
,(-9223370855738769404, -9223370855738769404,-9223371938070527945,'RiskRuleItem.ResourceType',0,1)
,(-9223370855738769402, -9223370855738769402,-9223371916595690519,'RiskRuleItem.Property',0,1)
,(-9223370855738769400, -9223370855738769400,-9223371942365495269,'RiskRuleItem.Resource',0,1)
,(-9223370855738769398, -9223370855738769398,-9223371886530920418,'RiskRuleItem.ResourceNavigationRule',1,1)
,(-9223370855738769397, -9223370855738769397,-9223371985315168210,'RiskRuleItem.Risk',0,1)
,(-9223370847148834814, -9223370847148834814,-9223371942365495271,'ResourceRiskScore.Owner',0,0)
,(-9223370842853867515, -9223370842853867515,-9223371929480593377,'Connection.Connector',0,1)
,(-9223370842853867511, -9223370842853867511,-9223370829968965626,'Connection.Package',0,1)
,(-9223370838558900219, -9223370838558900219,-9223370842853867513,'ConnectionTable.Connection',0,1)
,(-9223370834263932923, -9223370834263932923,-9223370838558900216,'ConnectionColumn.Table',0,1)
,(-9223370825673998331, -9223370825673998331,-9223371920890658764,'RoleMapping.EntityType',0,1)
,(-9223370825673998327, -9223370825673998327,-9223371946660462532,'RoleMapping.Policy',0,1)
,(-9223370825673998325, -9223370825673998325,-9223371950955429828,'RoleMapping.Category',0,1)
,(-9223370825673998323, -9223370825673998323,-9223371938070527929,'RoleMapping.ResourceType',0,1)
,(-9223370825673998321, -9223370825673998321,-9223371916595691467,'RoleMapping.Property',0,1)
,(-9223370825673998312, -9223370825673998312,-9223371856466149326,'RoleMapping.DisplayNameBinding',0,1)
,(-9223370825673998301, -9223370825673998301,-9223371856466149321,'RoleMapping.IdentifierBinding',0,1)
,(-9223370825673998300, -9223370825673998300,-9223371856466149320,'RoleMapping.CategoryIdentifierBinding',0,1)
,(-9223370825673998299, -9223370825673998299,-9223371856466149319,'RoleMapping.ParentCategoryIdentifierBinding',0,1)
,(-9223370825673998298, -9223370825673998298,-9223371856466149318,'RoleMapping.CategoryDisplayNameBinding',0,1)
,(-9223370825673998297, -9223370825673998297,-9223371946660462074,'RoleMapping.RolePolicy',0,1)
,(-9223370825673997822, -9223370825673997822,-9223371942365495012,'RoleMapping.CreatedBy',0,1)
,(-9223370825673997819, -9223370825673997819,-9223371942365495011,'RoleMapping.ChangedBy',0,1)
,(-9223370821379031039, -9223370821379031039,-9223370825673998326,'RoleMappingRule.RoleMapping',1,1)
,(-9223370821379030526, -9223370821379030526,-9223371942365495010,'RoleMappingRule.CreatedBy',0,1)
,(-9223370821379030523, -9223370821379030523,-9223371942365495009,'RoleMappingRule.ChangedBy',0,1)
,(-9223370817084063740, -9223370817084063740,-9223371916595691468,'RoleMappingRuleItem.Property',0,1)
,(-9223370817084063738, -9223370817084063738,-9223370821379031036,'RoleMappingRuleItem.Rule',1,1)
,(-9223370817084063230, -9223370817084063230,-9223371942365495008,'RoleMappingRuleItem.CreatedBy',0,1)
,(-9223370817084063227, -9223370817084063227,-9223371942365495007,'RoleMappingRuleItem.ChangedBy',0,1)
,(-9223370812789096445, -9223370812789096445,-9223371920890658745,'EntityPropertyExpression.EntityType',0,1)
,(-9223370812789096443, -9223370812789096443,-9223371916595691457,'EntityPropertyExpression.Property',0,0)
,(-9223370812789096440, -9223370812789096440,-9223371856466149328,'EntityPropertyExpression.Binding',0,1)
,(-9223370812789096438, -9223370812789096438,-9223371916595691455,'EntityPropertyExpression.PropertyCriterion',0,1)
,(-9223370808494129150, -9223370808494129150,-9223370868623671281,'AssociationInstance.Universe',0,1)
,(-9223370808494129147, -9223370808494129147,-9223370864328703979,'AssociationInstance.Instance1',0,1)
,(-9223370808494129145, -9223370808494129145,-9223370864328703978,'AssociationInstance.Instance2',0,1)
,(-9223370808494129143, -9223370808494129143,-9223371912300724195,'AssociationInstance.Association',0,1)
,(-9223370804199161854, -9223370804199161854,-9223371946660462547,'ResourceClassificationRule.Policy',0,1)
,(-9223370804199161852, -9223370804199161852,-9223371938070527940,'ResourceClassificationRule.ResourceType',0,1)
,(-9223370804199161845, -9223370804199161845,-9223370804199161846,'ResourceClassificationRule.RuleBase',0,1)
,(-9223370804199161726, -9223370804199161726,-9223371942365495028,'ResourceClassificationRule.CreatedBy',0,1)
,(-9223370804199161723, -9223370804199161723,-9223371942365495027,'ResourceClassificationRule.ChangedBy',0,1)
,(-9223370799904194556, -9223370799904194556,-9223370842853867507,'ConnectionTransformation.Connection',0,1)
,(-9223370610925633535, -9223370610925633535,-9223370598040731632,'AccessControlEntry.Rule',0,1)
,(-9223370610925633533, -9223370610925633533,-9223370602335698941,'AccessControlEntry.Permission',0,1)
,(-9223370606630666239, -9223370606630666239,-9223370598040731631,'AccessControlFilter.Rule',0,1)
,(-9223370606630666237, -9223370606630666237,-9223371856466149325,'AccessControlFilter.Binding',0,1)
,(-9223370606630666231, -9223370606630666231,-9223371877940985837,'AccessControlFilter.Dimension',0,1)
,(-9223370598040731636, -9223370598040731636,-9223371353954975732,'AccessControlRule.Profile',0,1)
,(-9223370598040731634, -9223370598040731634,-9223371920890658799,'AccessControlRule.EntityType',0,1)
,(-9223370593745764350, -9223370593745764350,-9223371920890658775,'PolicySimulation.EntityType',0,1)
,(-9223370593745764345, -9223370593745764345,-9223371942365495041,'PolicySimulation.StartedBy',0,1)
,(-9223370593745764308, -9223370593745764308,-9223371946660462548,'PolicySimulation.Policy',0,1)
,(-9223370589450797054, -9223370589450797054,-9223371946660462073,'MiningRule.Policy',0,1)
,(-9223370589450797052, -9223370589450797052,-9223371920890658727,'MiningRule.EntityType',0,1)
,(-9223370589450797043, -9223370589450797043,-9223371946660462072,'MiningRule.RulePolicy',0,1)
,(-9223370589450797038, -9223370589450797038,-9223371950955429754,'MiningRule.Category',0,1)
,(-9223370585155829738, -9223370585155829738,-9223371727617130492,'HomonymEntityLinkFilter.HomonymEntityLink',0,1)
,(-9223370585155829737, -9223370585155829737,-9223371916595691453,'HomonymEntityLinkFilter.ComparisonProperty1',0,1)
,(-9223370585155829736, -9223370585155829736,-9223371916595691452,'HomonymEntityLinkFilter.ComparisonProperty2',0,1)
,(-9223370585155829735, -9223370585155829735,-9223371916595691451,'HomonymEntityLinkFilter.ComparisonProperty3',0,1)
,(-9223370585155829734, -9223370585155829734,-9223371916595691450,'HomonymEntityLinkFilter.ComparisonProperty4',0,1)
,(-9223370585155829733, -9223370585155829733,-9223371916595691449,'HomonymEntityLinkFilter.ComparisonProperty5',0,1)
,(-9223370585155829732, -9223370585155829732,-9223371916595691448,'HomonymEntityLinkFilter.Property1',0,1)
,(-9223370585155829731, -9223370585155829731,-9223371916595691447,'HomonymEntityLinkFilter.Property2',0,1)
,(-9223370585155829730, -9223370585155829730,-9223371916595691446,'HomonymEntityLinkFilter.Property3',0,1)
,(-9223370585155829729, -9223370585155829729,-9223371916595691445,'HomonymEntityLinkFilter.Property4',0,1)
,(-9223370585155829728, -9223370585155829728,-9223371916595691444,'HomonymEntityLinkFilter.Property5',0,1)
,(-9223370572270927870, -9223370572270927870,-9223371938070527882,'ProfileRuleContext.ResourceType',0,1)
,(-9223370572270927868, -9223370572270927868,-9223371920890658716,'ProfileRuleContext.EntityType',0,1)
,(-9223366547886571515, -9223366547886571515,-9223371946660462551,'AutomationRule.Policy',0,1)
,(-9223366547886571513, -9223366547886571513,-9223371843581247398,'AutomationRule.CompositeRole',0,1)
,(-9223366547886571511, -9223366547886571511,-9223371955250397094,'AutomationRule.SingleRole',0,1)
,(-9223366547886571509, -9223366547886571509,-9223371938070527910,'AutomationRule.ResourceType',0,1)
,(-9223366547886571507, -9223366547886571507,-9223371950955429798,'AutomationRule.Category',0,1)
,(-9223366547886571006, -9223366547886571006,-9223371942365495002,'AutomationRule.CreatedBy',0,1)
,(-9223366547886571003, -9223366547886571003,-9223371942365495001,'AutomationRule.ChangedBy',0,1)
,(-9223340460255215615, -9223340460255215615,-9223371946660462533,'ResourceBinaryRule.Policy',0,1)
,(-9223340460255215613, -9223340460255215613,-9223371938070527905,'ResourceBinaryRule.ResourceType',0,1)
,(-9223340460255215611, -9223340460255215611,-9223371916595691401,'ResourceBinaryRule.Property',0,1)
,(-9223340460255215609, -9223340460255215609,-9223371856466149281,'ResourceBinaryRule.Binding',0,1)
,(-9223340460255215600, -9223340460255215600,-9223371955250397089,'ResourceBinaryRule.SingleRole',0,1)
,(-9223340460255215486, -9223340460255215486,-9223371942365495030,'ResourceBinaryRule.CreatedBy',0,1)
,(-9223340460255215483, -9223340460255215483,-9223371942365495029,'ResourceBinaryRule.ChangedBy',0,1)
;

INSERT INTO #tmp_uj_jobs(id, identifier, displayname_l1, userstartdenied, loglevel) VALUES (2147483647, 'DeployProductGeneratedConfiguration', 'Deploy configuration generated by the product', 1, 6);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, inputpath, loglevel) VALUES (2147483647, 'DeployProductGeneratedConfiguration', 'Deploy configuration generated by the product', 41, '../Temp', 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483647,2147483647,2147483647, 0, 0);

INSERT INTO #tmp_uj_jobs(id, identifier, displayname_l1, userstartdenied, loglevel) VALUES (2147483648, 'PolicySimulationJob', 'Policy simulation job', 1, 6);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483648, 'PolicySimulationJob', 'Policy simulation job', 1, 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483648,2147483648,2147483648, 0, 0);

INSERT INTO #tmp_uj_jobs(id, identifier, displayname_l1, userstartdenied, loglevel) VALUES (2147483649, 'RoleMiningSimulationJob', 'Role mining simulation job', 1, 6);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483649, 'RoleMiningSimulationJob', 'Role mining simulation', 45, 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483649,2147483649,2147483649, 0, 0);

INSERT INTO #tmp_uj_jobs(id, identifier, displayname_l1, userstartdenied, loglevel) VALUES (2147483650, 'zz_AccessCertificationJob', 'Administration/Trigger Access Reviews', 1, 6);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483650, 'zz_AccessCertificationJob_UpdateAccessCertificationCampaign', 'Update Access Certification Campaign', 26, 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483650, 2147483650, 2147483650, 0, 0);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483651, 'zz_AccessCertificationJob_SetAccessCertificationReviewer', 'Set Access Certification Reviewer', 25, 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483651, 2147483651, 2147483650, 1, 1);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483652, 'zz_AccessCertificationJob_SendAccessCertificationNotification', 'Send Access Certification Notifications', 27, 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483652, 2147483652, 2147483650, 2, 2);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483653, 'zz_AccessCertificationJob_SendAccessCertificationNotification_ProcessAccessCertificationItems', 'Process Access Certification Decisions', 51, 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483653, 2147483653, 2147483650, 3, 3);

INSERT INTO #tmp_uj_jobs(id, identifier, displayname_l1, userstartdenied, loglevel) VALUES (2147483651, 'zz_InternalUserProfileJob', 'Set Automatic Assigned Profiles', 1, 6);

INSERT INTO #tmp_uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483654, 'zz_AccessCertificationJob_SetAutomaticAssignedProfiles', 'Set Automatic Assigned Profiles', 9, 6);

INSERT INTO #tmp_uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483654, 2147483654, 2147483651, 0, 0);


DELETE "UM_EntityAssociations" FROM "UM_EntityAssociations" a LEFT JOIN "UD_ConfigurationFileItems" fi ON a."Id" = fi."Item_Id" and fi."TableName" = 'UM_EntityAssociations' WHERE fi."Item_Id" IS NULL AND (a."Id" < 0 OR a."Id" >= 9223372032559808512) AND a."Id" NOT IN(SELECT "id" FROM "#tmp_um_entityassociations");
DELETE "UM_BindingItems" FROM "UM_BindingItems" b LEFT JOIN "UD_ConfigurationFileItems" fi ON b."Property_Id" = fi."Item_Id" and fi."TableName" = 'UM_EntityProperties' WHERE fi."Item_Id" IS NULL AND (b."Property_Id" < 0 OR b."Property_Id" >= 9223372032559808512) AND b."Property_Id" NOT IN(SELECT "id" FROM "#tmp_um_entityproperties");
UPDATE p SET "validto"=CURRENT_TIMESTAMP FROM "UM_EntityProperties" p LEFT JOIN "UD_ConfigurationFileItems" fi ON p."Id" = fi."Item_Id" and fi."TableName" = 'UM_EntityProperties' WHERE fi."Item_Id" IS NULL AND (p."Id" < 0 OR p."Id" >= 9223372032559808512) AND p."Id" NOT IN(SELECT "id" FROM "#tmp_um_entityproperties");
DELETE ae FROM "UA_AccessControlEntries" ae JOIN "UA_AccessControlRules" ar ON ar."Id" = ae."Rule_Id" WHERE(ar."EntityType_Id" < 0 OR ar."EntityType_Id" >= 2147483647) AND ar."EntityType_Id" NOT IN(SELECT "id" FROM "#tmp_um_entitytypes");
DELETE "UM_EntityTypes" WHERE("Id" < 0 OR "Id" >= 2147483647) AND "Id" NOT IN(SELECT "id" FROM "#tmp_um_entitytypes");
DELETE FROM "UJ_TaskEntityTypes" WHERE("Task_Id" >= 2147483647) AND "Task_Id" NOT IN(SELECT "id" FROM "#tmp_uj_tasks");
DELETE FROM "UJ_TaskResourceTypes" WHERE("Task_Id" >= 2147483647) AND "Task_Id" NOT IN(SELECT "id" FROM "#tmp_uj_tasks");
DELETE FROM "UC_SynchronizationHistory" WHERE("TaskInstance_Id" IN(SELECT Id from "UJ_TaskInstances" WHERE("Task_Id" >= 2147483647) AND "Task_Id" NOT IN(SELECT "id" FROM "#tmp_uj_tasks")));
DELETE FROM "UJ_TaskInstances" WHERE("Task_Id" >= 2147483647) AND "Task_Id" NOT IN(SELECT "id" FROM "#tmp_uj_tasks");
DELETE FROM "UJ_JobInstances" WHERE("Job_Id" >= 2147483647) AND "Job_Id" NOT IN(SELECT "id" FROM "#tmp_uj_jobs");
DELETE "UJ_JobSteps" WHERE("Id" >= 2147483647) AND "Id" NOT IN(SELECT "id" FROM "#tmp_uj_jobsteps");
DELETE "UJ_Tasks" WHERE("Id" >= 2147483647) AND "Id" NOT IN(SELECT "id" FROM "#tmp_uj_tasks");
DELETE "UJ_Jobs" WHERE("Id" >= 2147483647) AND "Id" NOT IN(SELECT "id" FROM "#tmp_uj_jobs");

UPDATE t SET Identifier = s.identifier, TableName = s.tablename FROM "UM_EntityTypes" t JOIN "#tmp_um_entitytypes" s ON t.Id=s.id;
UPDATE t SET EntityType_Id = s.entitytype_id, Identifier = s.identifier,[Type] = s.[type], TargetColumnIndex = s.targetcolumnindex, NeutralProperty_Id = s.neutralproperty_id, TargetEntityType = s.targetentitytype FROM "UM_EntityProperties" t JOIN "#tmp_um_entityproperties" s ON t.Id=s.id;
UPDATE t SET Property1_Id = s.property1_id, Property2_Id = s.property2_id, Identifier = s.identifier, IsProperty1Collection = s.isproperty1collection, IsProperty2Collection = s.isproperty2collection FROM "UM_EntityAssociations" t JOIN "#tmp_um_entityassociations" s ON t.Id=s.id;
UPDATE t SET Identifier = s.identifier, DisplayName_L1 = s.displayname_l1, UserStartDenied = s.userstartdenied, LogLevel = s.loglevel FROM "UJ_Jobs" t JOIN "#tmp_uj_jobs" s ON t.Id=s.id;
UPDATE t SET Identifier = s.identifier, DisplayName_L1 = s.displayname_l1, TaskType = s.tasktype, InputPath = s.inputpath, LogLevel = s.loglevel FROM "UJ_Tasks" t JOIN "#tmp_uj_tasks" s ON t.Id=s.id;
UPDATE t SET Task_Id = s.task_id, Job_Id = s.job_id, LaunchOrder = s.launchorder, Level = s.level FROM "UJ_JobSteps" t JOIN "#tmp_uj_jobsteps" s ON t.Id=s.id;

INSERT INTO UM_EntityTypes(Id, Identifier, TableName) SELECT id, identifier, tablename FROM #tmp_um_entitytypes WHERE id NOT IN (SELECT Id FROM UM_EntityTypes);
INSERT INTO UM_EntityProperties(Id, EntityType_Id, Identifier,[Type], TargetColumnIndex, NeutralProperty_Id, TargetEntityType) SELECT id, entitytype_id, identifier,[type], targetcolumnindex, neutralproperty_id, targetentitytype FROM #tmp_um_entityproperties WHERE id NOT IN (SELECT Id FROM UM_EntityProperties);
INSERT INTO UM_EntityAssociations(Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection) SELECT id, property1_id, property2_id, identifier, isproperty1collection, isproperty2collection FROM #tmp_um_entityassociations WHERE id NOT IN (SELECT Id FROM UM_EntityAssociations);
INSERT INTO UJ_Jobs(Id, Identifier, DisplayName_L1, UserStartDenied, LogLevel) SELECT id, identifier, displayname_l1, userstartdenied, loglevel FROM #tmp_uj_jobs WHERE id NOT IN (SELECT Id FROM UJ_Jobs);
INSERT INTO UJ_Tasks(Id, Identifier, DisplayName_L1, TaskType, InputPath, LogLevel) SELECT id, identifier, displayname_l1, tasktype, inputpath, loglevel FROM #tmp_uj_tasks WHERE id NOT IN (SELECT Id FROM UJ_Tasks);
INSERT INTO UJ_JobSteps(Id, Task_Id, Job_Id, LaunchOrder, Level) SELECT id, task_id, job_id, launchorder, level FROM #tmp_uj_jobsteps WHERE id NOT IN (SELECT Id FROM UJ_JobSteps);

DROP TABLE #tmp_um_entitytypes;
DROP TABLE #tmp_um_entityproperties;
DROP TABLE #tmp_um_entityassociations;
DROP TABLE #tmp_uj_jobs;
DROP TABLE #tmp_uj_tasks;
DROP TABLE #tmp_uj_jobsteps;
GO
