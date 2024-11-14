GO
PRINT N'Dropping [dbo].[FK_Connections_Connector]...';


GO
ALTER TABLE [dbo].[UC_Connections] DROP CONSTRAINT [FK_Connections_Connector];


GO
PRINT N'Dropping [dbo].[FK_ConnectionTables_Connection]...';


GO
ALTER TABLE [dbo].[UC_ConnectionTables] DROP CONSTRAINT [FK_ConnectionTables_Connection];


GO
/*
The column [dbo].[UC_Connections].[Package_Id] on table [dbo].[UC_Connections] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[UC_Connections]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UC_Connections] (
    [Id]                        BIGINT         NOT NULL,
    [Connector_Id]              BIGINT         NOT NULL,
    [Package_Id]                BIGINT         NOT NULL,
    [Identifier]                VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]            NVARCHAR (442) NOT NULL,
    [DisplayName_L2]            NVARCHAR (442) NULL,
    [DisplayName_L3]            NVARCHAR (442) NULL,
    [DisplayName_L4]            NVARCHAR (442) NULL,
    [DisplayName_L5]            NVARCHAR (442) NULL,
    [DisplayName_L6]            NVARCHAR (442) NULL,
    [DisplayName_L7]            NVARCHAR (442) NULL,
    [DisplayName_L8]            NVARCHAR (442) NULL,
    [RefreshDate]               DATETIME       NULL,
    [DeactivationExportFulfill] INT            CONSTRAINT [DF_Connections_DeactivationExportFulfill] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Connections1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Connections_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UC_Connections])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UC_Connections] ([Id], [Connector_Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [RefreshDate])
        SELECT   [Id],
                 [Connector_Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [RefreshDate]
        FROM     [dbo].[UC_Connections]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UC_Connections];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UC_Connections]', N'UC_Connections';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Connections1]', N'PK_Connections', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Connections_Identifier1]', N'U_Connections_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UC_ConnectionPackages]...';


GO
CREATE TABLE [dbo].[UC_ConnectionPackages] (
    [Id]                            BIGINT          NOT NULL,
    [Identifier]                    VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ImplementsEntityTypeMapping]   BIT             NOT NULL,
    [ImplementsResourceTypeMapping] BIT             NOT NULL,
    [ImplementsConfiguration]       BIT             NOT NULL,
    [HasIncrementalMode]            BIT             NOT NULL,
    [ExportType]                    INT             NOT NULL,
    [FulfillmentType]               INT             NOT NULL,
    [InducedFulfillment]            INT             NULL,
    [DisplayName_L1]                NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]                NVARCHAR (442)  NULL,
    [DisplayName_L3]                NVARCHAR (442)  NULL,
    [DisplayName_L4]                NVARCHAR (442)  NULL,
    [DisplayName_L5]                NVARCHAR (442)  NULL,
    [DisplayName_L6]                NVARCHAR (442)  NULL,
    [DisplayName_L7]                NVARCHAR (442)  NULL,
    [DisplayName_L8]                NVARCHAR (442)  NULL,
    [Description_L1]                NVARCHAR (442)  NULL,
    [Description_L2]                NVARCHAR (442)  NULL,
    [Description_L3]                NVARCHAR (442)  NULL,
    [Description_L4]                NVARCHAR (442)  NULL,
    [Description_L5]                NVARCHAR (442)  NULL,
    [Description_L6]                NVARCHAR (442)  NULL,
    [Description_L7]                NVARCHAR (442)  NULL,
    [Description_L8]                NVARCHAR (442)  NULL,
    [Keywords]                      NVARCHAR (442)  NULL,
    [Publisher]                     NVARCHAR (442)  NULL,
    [LogoUrl]                       NVARCHAR (4000) NULL,
    [WebsiteUrl]                    NVARCHAR (442)  NULL,
    [DocumentationUrl]              NVARCHAR (442)  NULL,
    [License]                       NVARCHAR (442)  NULL,
    CONSTRAINT [PK_ConnectionPackges] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_ConnectionPackages_Identifier] UNIQUE NONCLUSTERED ([Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[UC_PasswordResetSettings]...';


GO
CREATE TABLE [dbo].[UC_PasswordResetSettings] (
    [Id]                            BIGINT         NOT NULL,
    [Identifier]                    VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [Mode]                          BIGINT         NOT NULL,
    [MustChange]                    BIT            NOT NULL,
    [AutoGenerate]                  BIT            NOT NULL,
    [DisableNotifications]          BIT            NOT NULL,
    [GeneratedLength]               INT            NOT NULL,
    [NotifiedFullNameBinding_Id]    BIGINT         NULL,
    [NotifiedEmailBinding_Id]       BIGINT         NULL,
    [BeneficiaryFullNameBinding_Id] BIGINT         NULL,
    [BeneficiaryEmailBinding_Id]    BIGINT         NULL,
    [DefaultPassword]               NVARCHAR (32)  NULL,
    [StrengthCheck]                 NVARCHAR (128) NULL,
    [NotificationCC]                NVARCHAR (256) NULL,
    CONSTRAINT [PK_PasswordResetSettings] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_PasswordResetSettings_Identifier] UNIQUE NONCLUSTERED ([Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[UC_ResourcePropertyMappings]...';


GO
CREATE TABLE [dbo].[UC_ResourcePropertyMappings] (
    [Id]                     BIGINT         NOT NULL,
    [Property_Id]            BIGINT         NOT NULL,
    [ResourceTypeMapping_Id] BIGINT         NOT NULL,
    [C0]                     NVARCHAR (442) NULL,
    [C1]                     NVARCHAR (442) NULL,
    [C2]                     NVARCHAR (442) NULL,
    [C3]                     NVARCHAR (442) NULL,
    [C4]                     NVARCHAR (442) NULL,
    [C5]                     NVARCHAR (442) NULL,
    [C6]                     NVARCHAR (442) NULL,
    [C7]                     NVARCHAR (442) NULL,
    [C8]                     NVARCHAR (442) NULL,
    [C9]                     NVARCHAR (442) NULL,
    [C10]                    NVARCHAR (442) NULL,
    CONSTRAINT [PK_ResourcePropertyMappings] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_PendingApprovalRules]...';


GO
CREATE TABLE [dbo].[UP_PendingApprovalRules] (
    [Id]               BIGINT  NOT NULL,
    [Type]             TINYINT NOT NULL,
    [EntityType_Id]    BIGINT  NOT NULL,
    [WorkflowState]    TINYINT NOT NULL,
    [HoursToWait]      INT     NOT NULL,
    [Decision]         TINYINT NOT NULL,
    [CompositeRole_Id] BIGINT  NULL,
    [SingleRole_Id]    BIGINT  NULL,
    [ResourceType_Id]  BIGINT  NULL,
    [Category_Id]      BIGINT  NULL,
    [Policy_Id]        BIGINT  NULL,
    [L0]               BIT     NOT NULL,
    [L1]               BIT     NOT NULL,
    [L2]               BIT     NOT NULL,
    [L3]               BIT     NOT NULL,
    [L4]               BIT     NOT NULL,
    [L5]               BIT     NOT NULL,
    [L6]               BIT     NOT NULL,
    [L7]               BIT     NOT NULL,
    [L8]               BIT     NOT NULL,
    [L9]               BIT     NOT NULL,
    [LA]               BIT     NOT NULL,
    [LB]               BIT     NOT NULL,
    [LC]               BIT     NOT NULL,
    [LD]               BIT     NOT NULL,
    [LE]               BIT     NOT NULL,
    [LF]               BIT     NOT NULL,
    [LG]               BIT     NOT NULL,
    [LH]               BIT     NOT NULL,
    [LI]               BIT     NOT NULL,
    [LJ]               BIT     NOT NULL,
    [LK]               BIT     NOT NULL,
    [LL]               BIT     NOT NULL,
    [LM]               BIT     NOT NULL,
    [LN]               BIT     NOT NULL,
    [LO]               BIT     NOT NULL,
    [LP]               BIT     NOT NULL,
    [LQ]               BIT     NOT NULL,
    [LR]               BIT     NOT NULL,
    [LS]               BIT     NOT NULL,
    [LT]               BIT     NOT NULL,
    [LU]               BIT     NOT NULL,
    [LV]               BIT     NOT NULL,
    [L10]              BIT     NOT NULL,
    [L11]              BIT     NOT NULL,
    [L12]              BIT     NOT NULL,
    [L13]              BIT     NOT NULL,
    [L14]              BIT     NOT NULL,
    [L15]              BIT     NOT NULL,
    [L16]              BIT     NOT NULL,
    [L17]              BIT     NOT NULL,
    [L18]              BIT     NOT NULL,
    [L19]              BIT     NOT NULL,
    [L1A]              BIT     NOT NULL,
    [L1B]              BIT     NOT NULL,
    [L1C]              BIT     NOT NULL,
    [L1D]              BIT     NOT NULL,
    [L1E]              BIT     NOT NULL,
    [L1F]              BIT     NOT NULL,
    [L1G]              BIT     NOT NULL,
    [L1H]              BIT     NOT NULL,
    [L1I]              BIT     NOT NULL,
    [L1J]              BIT     NOT NULL,
    [L1K]              BIT     NOT NULL,
    [L1L]              BIT     NOT NULL,
    [L1M]              BIT     NOT NULL,
    [L1N]              BIT     NOT NULL,
    [L1O]              BIT     NOT NULL,
    [L1P]              BIT     NOT NULL,
    [L1Q]              BIT     NOT NULL,
    [L1R]              BIT     NOT NULL,
    [L1S]              BIT     NOT NULL,
    [L1T]              BIT     NOT NULL,
    [L1U]              BIT     NOT NULL,
    [L1V]              BIT     NOT NULL,
    [L20]              BIT     NOT NULL,
    [L21]              BIT     NOT NULL,
    [L22]              BIT     NOT NULL,
    [L23]              BIT     NOT NULL,
    [L24]              BIT     NOT NULL,
    [L25]              BIT     NOT NULL,
    [L26]              BIT     NOT NULL,
    [L27]              BIT     NOT NULL,
    [L28]              BIT     NOT NULL,
    [L29]              BIT     NOT NULL,
    [L2A]              BIT     NOT NULL,
    [L2B]              BIT     NOT NULL,
    [L2C]              BIT     NOT NULL,
    [L2D]              BIT     NOT NULL,
    [L2E]              BIT     NOT NULL,
    [L2F]              BIT     NOT NULL,
    [L2G]              BIT     NOT NULL,
    [L2H]              BIT     NOT NULL,
    [L2I]              BIT     NOT NULL,
    [L2J]              BIT     NOT NULL,
    [L2K]              BIT     NOT NULL,
    [L2L]              BIT     NOT NULL,
    [L2M]              BIT     NOT NULL,
    [L2N]              BIT     NOT NULL,
    [L2O]              BIT     NOT NULL,
    [L2P]              BIT     NOT NULL,
    [L2Q]              BIT     NOT NULL,
    [L2R]              BIT     NOT NULL,
    [L2S]              BIT     NOT NULL,
    [L2T]              BIT     NOT NULL,
    [L2U]              BIT     NOT NULL,
    [L2V]              BIT     NOT NULL,
    [L30]              BIT     NOT NULL,
    [L31]              BIT     NOT NULL,
    [L32]              BIT     NOT NULL,
    [L33]              BIT     NOT NULL,
    [L34]              BIT     NOT NULL,
    [L35]              BIT     NOT NULL,
    [L36]              BIT     NOT NULL,
    [L37]              BIT     NOT NULL,
    [L38]              BIT     NOT NULL,
    [L39]              BIT     NOT NULL,
    [L3A]              BIT     NOT NULL,
    [L3B]              BIT     NOT NULL,
    [L3C]              BIT     NOT NULL,
    [L3D]              BIT     NOT NULL,
    [L3E]              BIT     NOT NULL,
    [L3F]              BIT     NOT NULL,
    [L3G]              BIT     NOT NULL,
    [L3H]              BIT     NOT NULL,
    [L3I]              BIT     NOT NULL,
    [L3J]              BIT     NOT NULL,
    [L3K]              BIT     NOT NULL,
    [L3L]              BIT     NOT NULL,
    [L3M]              BIT     NOT NULL,
    [L3N]              BIT     NOT NULL,
    [L3O]              BIT     NOT NULL,
    [L3P]              BIT     NOT NULL,
    [L3Q]              BIT     NOT NULL,
    [L3R]              BIT     NOT NULL,
    [L3S]              BIT     NOT NULL,
    [L3T]              BIT     NOT NULL,
    [L3U]              BIT     NOT NULL,
    [L3V]              BIT     NOT NULL,
    [D0_Id]            BIGINT  NULL,
    [D1_Id]            BIGINT  NULL,
    [D2_Id]            BIGINT  NULL,
    [D3_Id]            BIGINT  NULL,
    [D4_Id]            BIGINT  NULL,
    [D5_Id]            BIGINT  NULL,
    [D6_Id]            BIGINT  NULL,
    [D7_Id]            BIGINT  NULL,
    [D8_Id]            BIGINT  NULL,
    [D9_Id]            BIGINT  NULL,
    [DA_Id]            BIGINT  NULL,
    [DB_Id]            BIGINT  NULL,
    [DC_Id]            BIGINT  NULL,
    [DD_Id]            BIGINT  NULL,
    [DE_Id]            BIGINT  NULL,
    [DF_Id]            BIGINT  NULL,
    [DG_Id]            BIGINT  NULL,
    [DH_Id]            BIGINT  NULL,
    [DI_Id]            BIGINT  NULL,
    [DJ_Id]            BIGINT  NULL,
    [DK_Id]            BIGINT  NULL,
    [DL_Id]            BIGINT  NULL,
    [DM_Id]            BIGINT  NULL,
    [DN_Id]            BIGINT  NULL,
    [DO_Id]            BIGINT  NULL,
    [DP_Id]            BIGINT  NULL,
    [DQ_Id]            BIGINT  NULL,
    [DR_Id]            BIGINT  NULL,
    [DS_Id]            BIGINT  NULL,
    [DT_Id]            BIGINT  NULL,
    [DU_Id]            BIGINT  NULL,
    [DV_Id]            BIGINT  NULL,
    [D10_Id]           BIGINT  NULL,
    [D11_Id]           BIGINT  NULL,
    [D12_Id]           BIGINT  NULL,
    [D13_Id]           BIGINT  NULL,
    [D14_Id]           BIGINT  NULL,
    [D15_Id]           BIGINT  NULL,
    [D16_Id]           BIGINT  NULL,
    [D17_Id]           BIGINT  NULL,
    [D18_Id]           BIGINT  NULL,
    [D19_Id]           BIGINT  NULL,
    [D1A_Id]           BIGINT  NULL,
    [D1B_Id]           BIGINT  NULL,
    [D1C_Id]           BIGINT  NULL,
    [D1D_Id]           BIGINT  NULL,
    [D1E_Id]           BIGINT  NULL,
    [D1F_Id]           BIGINT  NULL,
    [D1G_Id]           BIGINT  NULL,
    [D1H_Id]           BIGINT  NULL,
    [D1I_Id]           BIGINT  NULL,
    [D1J_Id]           BIGINT  NULL,
    [D1K_Id]           BIGINT  NULL,
    [D1L_Id]           BIGINT  NULL,
    [D1M_Id]           BIGINT  NULL,
    [D1N_Id]           BIGINT  NULL,
    [D1O_Id]           BIGINT  NULL,
    [D1P_Id]           BIGINT  NULL,
    [D1Q_Id]           BIGINT  NULL,
    [D1R_Id]           BIGINT  NULL,
    [D1S_Id]           BIGINT  NULL,
    [D1T_Id]           BIGINT  NULL,
    [D1U_Id]           BIGINT  NULL,
    [D1V_Id]           BIGINT  NULL,
    [D20_Id]           BIGINT  NULL,
    [D21_Id]           BIGINT  NULL,
    [D22_Id]           BIGINT  NULL,
    [D23_Id]           BIGINT  NULL,
    [D24_Id]           BIGINT  NULL,
    [D25_Id]           BIGINT  NULL,
    [D26_Id]           BIGINT  NULL,
    [D27_Id]           BIGINT  NULL,
    [D28_Id]           BIGINT  NULL,
    [D29_Id]           BIGINT  NULL,
    [D2A_Id]           BIGINT  NULL,
    [D2B_Id]           BIGINT  NULL,
    [D2C_Id]           BIGINT  NULL,
    [D2D_Id]           BIGINT  NULL,
    [D2E_Id]           BIGINT  NULL,
    [D2F_Id]           BIGINT  NULL,
    [D2G_Id]           BIGINT  NULL,
    [D2H_Id]           BIGINT  NULL,
    [D2I_Id]           BIGINT  NULL,
    [D2J_Id]           BIGINT  NULL,
    [D2K_Id]           BIGINT  NULL,
    [D2L_Id]           BIGINT  NULL,
    [D2M_Id]           BIGINT  NULL,
    [D2N_Id]           BIGINT  NULL,
    [D2O_Id]           BIGINT  NULL,
    [D2P_Id]           BIGINT  NULL,
    [D2Q_Id]           BIGINT  NULL,
    [D2R_Id]           BIGINT  NULL,
    [D2S_Id]           BIGINT  NULL,
    [D2T_Id]           BIGINT  NULL,
    [D2U_Id]           BIGINT  NULL,
    [D2V_Id]           BIGINT  NULL,
    [D30_Id]           BIGINT  NULL,
    [D31_Id]           BIGINT  NULL,
    [D32_Id]           BIGINT  NULL,
    [D33_Id]           BIGINT  NULL,
    [D34_Id]           BIGINT  NULL,
    [D35_Id]           BIGINT  NULL,
    [D36_Id]           BIGINT  NULL,
    [D37_Id]           BIGINT  NULL,
    [D38_Id]           BIGINT  NULL,
    [D39_Id]           BIGINT  NULL,
    [D3A_Id]           BIGINT  NULL,
    [D3B_Id]           BIGINT  NULL,
    [D3C_Id]           BIGINT  NULL,
    [D3D_Id]           BIGINT  NULL,
    [D3E_Id]           BIGINT  NULL,
    [D3F_Id]           BIGINT  NULL,
    [D3G_Id]           BIGINT  NULL,
    [D3H_Id]           BIGINT  NULL,
    [D3I_Id]           BIGINT  NULL,
    [D3J_Id]           BIGINT  NULL,
    [D3K_Id]           BIGINT  NULL,
    [D3L_Id]           BIGINT  NULL,
    [D3M_Id]           BIGINT  NULL,
    [D3N_Id]           BIGINT  NULL,
    [D3O_Id]           BIGINT  NULL,
    [D3P_Id]           BIGINT  NULL,
    [D3Q_Id]           BIGINT  NULL,
    [D3R_Id]           BIGINT  NULL,
    [D3S_Id]           BIGINT  NULL,
    [D3T_Id]           BIGINT  NULL,
    [D3U_Id]           BIGINT  NULL,
    [D3V_Id]           BIGINT  NULL,
    CONSTRAINT [PK_PendingApprovalRules] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_PolicySimulations]...';


GO
CREATE TABLE [dbo].[UP_PolicySimulations] (
    [Id]                                         BIGINT        NOT NULL,
    [Identifier]                                 VARCHAR (442) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [State]                                      TINYINT       NOT NULL,
    [BlockProvisioning]                          BIT           NOT NULL,
    [EntityType_Id]                              BIGINT        NOT NULL,
    [EntityType2_Id]                             BIGINT        NULL,
    [WhenStarted]                                SMALLDATETIME NOT NULL,
    [StartedBy_Id]                               BIGINT        NULL,
    [WhenCompleted]                              SMALLDATETIME NULL,
    [CompositeRoleAddedAutomaticCount]           INT           NULL,
    [CompositeRoleAddedBlockedCount]             INT           NULL,
    [CompositeRoleAddedFoundOrHistoryCount]      INT           NULL,
    [CompositeRoleDeletedCount]                  INT           NULL,
    [CompositeRoleUpdatedCount]                  INT           NULL,
    [SingleRoleAddedAutomaticCount]              INT           NULL,
    [SingleRoleAddedBlockedCount]                INT           NULL,
    [SingleRoleAddedFoundOrHistoryCount]         INT           NULL,
    [SingleRoleDeletedCount]                     INT           NULL,
    [SingleRoleUpdatedCount]                     INT           NULL,
    [ResourceTypeAddedAutomaticCount]            INT           NULL,
    [ResourceTypeAddedBlockedCount]              INT           NULL,
    [ResourceTypeAddedFoundOrHistoryCount]       INT           NULL,
    [ResourceTypeDeletedCount]                   INT           NULL,
    [ResourceTypeUpdatedCount]                   INT           NULL,
    [ResourceNavigationAddedAutomaticCount]      INT           NULL,
    [ResourceNavigationAddedBlockedCount]        INT           NULL,
    [ResourceNavigationAddedFoundOrHistoryCount] INT           NULL,
    [ResourceNavigationDeletedCount]             INT           NULL,
    [ResourceNavigationUpdatedCount]             INT           NULL,
    [ResourceScalarAddedAutomaticCount]          INT           NULL,
    [ResourceScalarAddedBlockedCount]            INT           NULL,
    [ResourceScalarAddedFoundOrHistoryCount]     INT           NULL,
    [ResourceScalarDeletedCount]                 INT           NULL,
    [ResourceScalarUpdatedCount]                 INT           NULL,
    CONSTRAINT [PK_PolicySimulations] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [U_PolicySimulations_Identifier] UNIQUE NONCLUSTERED ([Identifier] ASC)
);


GO
PRINT N'Creating [dbo].[UP_RoleMappingRuleItems]...';


GO
CREATE TABLE [dbo].[UP_RoleMappingRuleItems] (
    [Id]                 BIGINT          NOT NULL,
    [RoleMappingRule_Id] BIGINT          NOT NULL,
    [Property_Id]        BIGINT          NOT NULL,
    [Operator]           TINYINT         NOT NULL,
    [Value]              NVARCHAR (4000) NULL,
    [WhenCreated]        SMALLDATETIME   NULL,
    [CreatedBy_Id]       BIGINT          NULL,
    [WhenChanged]        SMALLDATETIME   NULL,
    [ChangedBy_Id]       BIGINT          NULL,
    CONSTRAINT [PK_RoleMappingRuleItems] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_RoleMappingRules]...';


GO
CREATE TABLE [dbo].[UP_RoleMappingRules] (
    [Id]             BIGINT        NOT NULL,
    [RoleMapping_Id] BIGINT        NOT NULL,
    [Order]          INT           NULL,
    [WhenCreated]    SMALLDATETIME NULL,
    [CreatedBy_Id]   BIGINT        NULL,
    [WhenChanged]    SMALLDATETIME NULL,
    [ChangedBy_Id]   BIGINT        NULL,
    CONSTRAINT [PK_RoleMappingRules] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UP_RoleMappings]...';


GO
CREATE TABLE [dbo].[UP_RoleMappings] (
    [Id]                                           BIGINT         NOT NULL,
    [Connector_Id]                                 BIGINT         NOT NULL,
    [EntityType_Id]                                BIGINT         NOT NULL,
    [Policy_Id]                                    BIGINT         NOT NULL,
    [Category_Id]                                  BIGINT         NOT NULL,
    [ResourceType_Id]                              BIGINT         NOT NULL,
    [Property_Id]                                  BIGINT         NOT NULL,
    [Identifier]                                   VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ApprovalWorkflowType]                         INT            NOT NULL,
    [HideOnSimplifiedView]                         BIT            NOT NULL,
    [CommentActivationOnApproveInReview]           TINYINT        NOT NULL,
    [CommentActivationOnDeclineInReview]           TINYINT        NOT NULL,
    [CommentActivationOnDeleteGapInReconciliation] TINYINT        NOT NULL,
    [CommentActivationOnKeepGapInReconciliation]   TINYINT        NOT NULL,
    [NeedApprovalSingleRole]                       BIT            NOT NULL,
    [Expression]                                   VARCHAR (4000) NULL,
    [DisplayNameExpression]                        VARCHAR (4000) NULL,
    [IdentifierExpression]                         VARCHAR (4000) NULL,
    [Binding_Id]                                   BIGINT         NULL,
    [WhenCreated]                                  SMALLDATETIME  NULL,
    [CreatedBy_Id]                                 BIGINT         NULL,
    [WhenChanged]                                  SMALLDATETIME  NULL,
    [ChangedBy_Id]                                 BIGINT         NULL,
    CONSTRAINT [PK_RoleMappings] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

GO
PRINT N'Creating [dbo].[DF_ConnectionPackages_ImplementsEntityTypeMapping]...';


GO
ALTER TABLE [dbo].[UC_ConnectionPackages]
    ADD CONSTRAINT [DF_ConnectionPackages_ImplementsEntityTypeMapping] DEFAULT ((0)) FOR [ImplementsEntityTypeMapping];


GO
PRINT N'Creating [dbo].[DF_ConnectionPackages_ImplementsResourceTypeMapping]...';


GO
ALTER TABLE [dbo].[UC_ConnectionPackages]
    ADD CONSTRAINT [DF_ConnectionPackages_ImplementsResourceTypeMapping] DEFAULT ((0)) FOR [ImplementsResourceTypeMapping];


GO
PRINT N'Creating [dbo].[DF_ConnectionPackages_ImplementsConfiguration]...';


GO
ALTER TABLE [dbo].[UC_ConnectionPackages]
    ADD CONSTRAINT [DF_ConnectionPackages_ImplementsConfiguration] DEFAULT ((0)) FOR [ImplementsConfiguration];


GO
PRINT N'Creating [dbo].[DF_ConnectionPackages_HasIncrementalMode]...';


GO
ALTER TABLE [dbo].[UC_ConnectionPackages]
    ADD CONSTRAINT [DF_ConnectionPackages_HasIncrementalMode] DEFAULT ((0)) FOR [HasIncrementalMode];


GO
PRINT N'Creating [dbo].[DF_ConnectionPackages_ExportType]...';


GO
ALTER TABLE [dbo].[UC_ConnectionPackages]
    ADD CONSTRAINT [DF_ConnectionPackages_ExportType] DEFAULT ((0)) FOR [ExportType];


GO
PRINT N'Creating [dbo].[DF_ConnectionPackages_FulfillmentType]...';


GO
ALTER TABLE [dbo].[UC_ConnectionPackages]
    ADD CONSTRAINT [DF_ConnectionPackages_FulfillmentType] DEFAULT ((0)) FOR [FulfillmentType];


GO
PRINT N'Creating [dbo].[DF_ConnectionPackages_InducedFulfillment]...';


GO
ALTER TABLE [dbo].[UC_ConnectionPackages]
    ADD CONSTRAINT [DF_ConnectionPackages_InducedFulfillment] DEFAULT ((0)) FOR [InducedFulfillment];


GO
PRINT N'Creating [dbo].[DF_PasswordResetSettings_Mode]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings]
    ADD CONSTRAINT [DF_PasswordResetSettings_Mode] DEFAULT ((0)) FOR [Mode];


GO
PRINT N'Creating [dbo].[DF_PasswordResetSettings_MustChange]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings]
    ADD CONSTRAINT [DF_PasswordResetSettings_MustChange] DEFAULT ((0)) FOR [MustChange];


GO
PRINT N'Creating [dbo].[DF_PasswordResetSettings_AutoGenerate]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings]
    ADD CONSTRAINT [DF_PasswordResetSettings_AutoGenerate] DEFAULT ((0)) FOR [AutoGenerate];


GO
PRINT N'Creating [dbo].[DF_PasswordResetSettings_DisableNotifications]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings]
    ADD CONSTRAINT [DF_PasswordResetSettings_DisableNotifications] DEFAULT ((0)) FOR [DisableNotifications];


GO
PRINT N'Creating [dbo].[DF_PasswordResetSettings_GeneratedLength]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings]
    ADD CONSTRAINT [DF_PasswordResetSettings_GeneratedLength] DEFAULT ((12)) FOR [GeneratedLength];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_WorkflowState]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_WorkflowState] DEFAULT ((0)) FOR [WorkflowState];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_Decision]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_Decision] DEFAULT ((0)) FOR [Decision];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L0]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L0] DEFAULT ((0)) FOR [L0];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1] DEFAULT ((0)) FOR [L1];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2] DEFAULT ((0)) FOR [L2];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3] DEFAULT ((0)) FOR [L3];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L4]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L4] DEFAULT ((0)) FOR [L4];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L5]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L5] DEFAULT ((0)) FOR [L5];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L6]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L6] DEFAULT ((0)) FOR [L6];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L7]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L7] DEFAULT ((0)) FOR [L7];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L8]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L8] DEFAULT ((0)) FOR [L8];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L9]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L9] DEFAULT ((0)) FOR [L9];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LA]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LA] DEFAULT ((0)) FOR [LA];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LB]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LB] DEFAULT ((0)) FOR [LB];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LC]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LC] DEFAULT ((0)) FOR [LC];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LD]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LD] DEFAULT ((0)) FOR [LD];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LE]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LE] DEFAULT ((0)) FOR [LE];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LF]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LF] DEFAULT ((0)) FOR [LF];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LG]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LG] DEFAULT ((0)) FOR [LG];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LH]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LH] DEFAULT ((0)) FOR [LH];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LI]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LI] DEFAULT ((0)) FOR [LI];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LJ] DEFAULT ((0)) FOR [LJ];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LK]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LK] DEFAULT ((0)) FOR [LK];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LL]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LL] DEFAULT ((0)) FOR [LL];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LM]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LM] DEFAULT ((0)) FOR [LM];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LN]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LN] DEFAULT ((0)) FOR [LN];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LO]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LO] DEFAULT ((0)) FOR [LO];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LP]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LP] DEFAULT ((0)) FOR [LP];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LQ] DEFAULT ((0)) FOR [LQ];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LR]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LR] DEFAULT ((0)) FOR [LR];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LS]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LS] DEFAULT ((0)) FOR [LS];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LT]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LT] DEFAULT ((0)) FOR [LT];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LU]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LU] DEFAULT ((0)) FOR [LU];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_LV]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_LV] DEFAULT ((0)) FOR [LV];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L10]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L10] DEFAULT ((0)) FOR [L10];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L11]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L11] DEFAULT ((0)) FOR [L11];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L12]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L12] DEFAULT ((0)) FOR [L12];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L13]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L13] DEFAULT ((0)) FOR [L13];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L14]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L14] DEFAULT ((0)) FOR [L14];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L15]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L15] DEFAULT ((0)) FOR [L15];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L16]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L16] DEFAULT ((0)) FOR [L16];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L17]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L17] DEFAULT ((0)) FOR [L17];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L18]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L18] DEFAULT ((0)) FOR [L18];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L19]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L19] DEFAULT ((0)) FOR [L19];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1A] DEFAULT ((0)) FOR [L1A];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1B] DEFAULT ((0)) FOR [L1B];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1C] DEFAULT ((0)) FOR [L1C];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1D] DEFAULT ((0)) FOR [L1D];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1E] DEFAULT ((0)) FOR [L1E];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1F] DEFAULT ((0)) FOR [L1F];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1G] DEFAULT ((0)) FOR [L1G];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1H] DEFAULT ((0)) FOR [L1H];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1I] DEFAULT ((0)) FOR [L1I];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1J] DEFAULT ((0)) FOR [L1J];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1K] DEFAULT ((0)) FOR [L1K];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1L] DEFAULT ((0)) FOR [L1L];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1M] DEFAULT ((0)) FOR [L1M];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1N] DEFAULT ((0)) FOR [L1N];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1O] DEFAULT ((0)) FOR [L1O];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1P] DEFAULT ((0)) FOR [L1P];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1Q] DEFAULT ((0)) FOR [L1Q];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1R] DEFAULT ((0)) FOR [L1R];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1S] DEFAULT ((0)) FOR [L1S];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1T] DEFAULT ((0)) FOR [L1T];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1U] DEFAULT ((0)) FOR [L1U];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L1V] DEFAULT ((0)) FOR [L1V];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L20]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L20] DEFAULT ((0)) FOR [L20];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L21]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L21] DEFAULT ((0)) FOR [L21];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L22]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L22] DEFAULT ((0)) FOR [L22];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L23]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L23] DEFAULT ((0)) FOR [L23];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L24]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L24] DEFAULT ((0)) FOR [L24];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L25]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L25] DEFAULT ((0)) FOR [L25];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L26]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L26] DEFAULT ((0)) FOR [L26];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L27]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L27] DEFAULT ((0)) FOR [L27];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L28]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L28] DEFAULT ((0)) FOR [L28];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L29]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L29] DEFAULT ((0)) FOR [L29];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2A] DEFAULT ((0)) FOR [L2A];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2B] DEFAULT ((0)) FOR [L2B];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2C] DEFAULT ((0)) FOR [L2C];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2D] DEFAULT ((0)) FOR [L2D];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2E] DEFAULT ((0)) FOR [L2E];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2F] DEFAULT ((0)) FOR [L2F];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2G] DEFAULT ((0)) FOR [L2G];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2H] DEFAULT ((0)) FOR [L2H];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2I] DEFAULT ((0)) FOR [L2I];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2J] DEFAULT ((0)) FOR [L2J];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2K] DEFAULT ((0)) FOR [L2K];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2L] DEFAULT ((0)) FOR [L2L];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2M] DEFAULT ((0)) FOR [L2M];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2N] DEFAULT ((0)) FOR [L2N];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2O] DEFAULT ((0)) FOR [L2O];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2P] DEFAULT ((0)) FOR [L2P];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2Q] DEFAULT ((0)) FOR [L2Q];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2R] DEFAULT ((0)) FOR [L2R];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2S] DEFAULT ((0)) FOR [L2S];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2T] DEFAULT ((0)) FOR [L2T];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2U] DEFAULT ((0)) FOR [L2U];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L2V] DEFAULT ((0)) FOR [L2V];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L30]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L30] DEFAULT ((0)) FOR [L30];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L31]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L31] DEFAULT ((0)) FOR [L31];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L32]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L32] DEFAULT ((0)) FOR [L32];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L33]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L33] DEFAULT ((0)) FOR [L33];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L34]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L34] DEFAULT ((0)) FOR [L34];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L35]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L35] DEFAULT ((0)) FOR [L35];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L36]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L36] DEFAULT ((0)) FOR [L36];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L37]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L37] DEFAULT ((0)) FOR [L37];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L38]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L38] DEFAULT ((0)) FOR [L38];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L39]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L39] DEFAULT ((0)) FOR [L39];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3A] DEFAULT ((0)) FOR [L3A];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3B] DEFAULT ((0)) FOR [L3B];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3C] DEFAULT ((0)) FOR [L3C];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3D] DEFAULT ((0)) FOR [L3D];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3E] DEFAULT ((0)) FOR [L3E];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3F] DEFAULT ((0)) FOR [L3F];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3G] DEFAULT ((0)) FOR [L3G];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3H] DEFAULT ((0)) FOR [L3H];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3I] DEFAULT ((0)) FOR [L3I];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3J] DEFAULT ((0)) FOR [L3J];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3K] DEFAULT ((0)) FOR [L3K];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3L] DEFAULT ((0)) FOR [L3L];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3M] DEFAULT ((0)) FOR [L3M];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3N] DEFAULT ((0)) FOR [L3N];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3O] DEFAULT ((0)) FOR [L3O];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3P] DEFAULT ((0)) FOR [L3P];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3Q] DEFAULT ((0)) FOR [L3Q];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3R] DEFAULT ((0)) FOR [L3R];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3S] DEFAULT ((0)) FOR [L3S];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3T] DEFAULT ((0)) FOR [L3T];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3U] DEFAULT ((0)) FOR [L3U];


GO
PRINT N'Creating [dbo].[DF_PendingApprovalRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules]
    ADD CONSTRAINT [DF_PendingApprovalRules_L3V] DEFAULT ((0)) FOR [L3V];


GO
PRINT N'Creating [dbo].[DF_PolicySimulations_State]...';


GO
ALTER TABLE [dbo].[UP_PolicySimulations]
    ADD CONSTRAINT [DF_PolicySimulations_State] DEFAULT ((0)) FOR [State];


GO
PRINT N'Creating [dbo].[DF_PolicySimulations_BlocProvisioning]...';


GO
ALTER TABLE [dbo].[UP_PolicySimulations]
    ADD CONSTRAINT [DF_PolicySimulations_BlocProvisioning] DEFAULT ((1)) FOR [BlockProvisioning];


GO
PRINT N'Creating [dbo].[DF_RoleMappingRuleItems_Operator]...';


GO
ALTER TABLE [dbo].[UP_RoleMappingRuleItems]
    ADD CONSTRAINT [DF_RoleMappingRuleItems_Operator] DEFAULT ((0)) FOR [Operator];


GO
PRINT N'Creating [dbo].[DF_RoleMappings_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD CONSTRAINT [DF_RoleMappings_ApprovalWorkflowType] DEFAULT ((0)) FOR [ApprovalWorkflowType];


GO
PRINT N'Creating [dbo].[DF_RoleMappings_HideOnSimplifiedView]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD CONSTRAINT [DF_RoleMappings_HideOnSimplifiedView] DEFAULT ((0)) FOR [HideOnSimplifiedView];


GO
PRINT N'Creating [dbo].[DF_RoleMappings_CommentActivationOnApproveInReview]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD CONSTRAINT [DF_RoleMappings_CommentActivationOnApproveInReview] DEFAULT ((0)) FOR [CommentActivationOnApproveInReview];


GO
PRINT N'Creating [dbo].[DF_RoleMappings_CommentActivationOnDeclineInReview]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD CONSTRAINT [DF_RoleMappings_CommentActivationOnDeclineInReview] DEFAULT ((0)) FOR [CommentActivationOnDeclineInReview];


GO
PRINT N'Creating [dbo].[DF_RoleMappings_CommentActivationOnDeleteGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD CONSTRAINT [DF_RoleMappings_CommentActivationOnDeleteGapInReconciliation] DEFAULT ((0)) FOR [CommentActivationOnDeleteGapInReconciliation];


GO
PRINT N'Creating [dbo].[DF_RoleMappings_CommentActivationOnKeepGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD CONSTRAINT [DF_RoleMappings_CommentActivationOnKeepGapInReconciliation] DEFAULT ((0)) FOR [CommentActivationOnKeepGapInReconciliation];


GO
PRINT N'Creating [dbo].[DF_RoleMapping_NeedApprovalSingleRole]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD CONSTRAINT [DF_RoleMapping_NeedApprovalSingleRole] DEFAULT ((0)) FOR [NeedApprovalSingleRole];


GO
PRINT N'Creating [dbo].[FK_Connections_Connector]...';


GO
ALTER TABLE [dbo].[UC_Connections] WITH NOCHECK
    ADD CONSTRAINT [FK_Connections_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ConnectionTables_Connection]...';


GO
ALTER TABLE [dbo].[UC_ConnectionTables] WITH NOCHECK
    ADD CONSTRAINT [FK_ConnectionTables_Connection] FOREIGN KEY ([Connection_Id]) REFERENCES [dbo].[UC_Connections] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Connections_Package]...';


GO
ALTER TABLE [dbo].[UC_Connections] WITH NOCHECK
    ADD CONSTRAINT [FK_Connections_Package] FOREIGN KEY ([Package_Id]) REFERENCES [dbo].[UC_ConnectionPackages] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PasswordResetSettings_NotifiedFullNameBinding]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH NOCHECK
    ADD CONSTRAINT [FK_PasswordResetSettings_NotifiedFullNameBinding] FOREIGN KEY ([NotifiedFullNameBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PasswordResetSettings_NotifiedEmailBinding]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH NOCHECK
    ADD CONSTRAINT [FK_PasswordResetSettings_NotifiedEmailBinding] FOREIGN KEY ([NotifiedEmailBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PasswordResetSettings_BeneficiaryFullNameBinding]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH NOCHECK
    ADD CONSTRAINT [FK_PasswordResetSettings_BeneficiaryFullNameBinding] FOREIGN KEY ([BeneficiaryFullNameBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PasswordResetSettings_BeneficiaryEmailBinding]...';


GO
ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH NOCHECK
    ADD CONSTRAINT [FK_PasswordResetSettings_BeneficiaryEmailBinding] FOREIGN KEY ([BeneficiaryEmailBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourcePropertyMappings_Property]...';


GO
ALTER TABLE [dbo].[UC_ResourcePropertyMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourcePropertyMappings_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourcePropertyMappings_ResourceTypeMapping]...';


GO
ALTER TABLE [dbo].[UC_ResourcePropertyMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourcePropertyMappings_ResourceTypeMapping] FOREIGN KEY ([ResourceTypeMapping_Id]) REFERENCES [dbo].[UC_ResourceTypeMappings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_Category]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PolicySimulations_EntityType]...';


GO
ALTER TABLE [dbo].[UP_PolicySimulations] WITH NOCHECK
    ADD CONSTRAINT [FK_PolicySimulations_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PolicySimulations_EntityType2]...';


GO
ALTER TABLE [dbo].[UP_PolicySimulations] WITH NOCHECK
    ADD CONSTRAINT [FK_PolicySimulations_EntityType2] FOREIGN KEY ([EntityType2_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappingRuleItems_RoleMappingRule]...';


GO
ALTER TABLE [dbo].[UP_RoleMappingRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappingRuleItems_RoleMappingRule] FOREIGN KEY ([RoleMappingRule_Id]) REFERENCES [dbo].[UP_RoleMappingRules] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappingRuleItems_Property]...';


GO
ALTER TABLE [dbo].[UP_RoleMappingRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappingRuleItems_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappingRules_RoleMapping]...';


GO
ALTER TABLE [dbo].[UP_RoleMappingRules] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappingRules_RoleMapping] FOREIGN KEY ([RoleMapping_Id]) REFERENCES [dbo].[UP_RoleMappings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_Connector]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_Connector] FOREIGN KEY ([Connector_Id]) REFERENCES [dbo].[UC_Connectors] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_EntityType]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_Category]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_Property]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_Binding]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_Binding] FOREIGN KEY ([Binding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[UC_Connections].[DeactivationExportFulfill].[UC_Connections_DeactivationExportFulfill]...';

GO
PRINT N'Checking existing data against newly created constraints';

GO
ALTER TABLE [dbo].[UC_Connections] WITH CHECK CHECK CONSTRAINT [FK_Connections_Connector];

ALTER TABLE [dbo].[UC_ConnectionTables] WITH CHECK CHECK CONSTRAINT [FK_ConnectionTables_Connection];

ALTER TABLE [dbo].[UC_Connections] WITH CHECK CHECK CONSTRAINT [FK_Connections_Package];

ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH CHECK CHECK CONSTRAINT [FK_PasswordResetSettings_NotifiedFullNameBinding];

ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH CHECK CHECK CONSTRAINT [FK_PasswordResetSettings_NotifiedEmailBinding];

ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH CHECK CHECK CONSTRAINT [FK_PasswordResetSettings_BeneficiaryFullNameBinding];

ALTER TABLE [dbo].[UC_PasswordResetSettings] WITH CHECK CHECK CONSTRAINT [FK_PasswordResetSettings_BeneficiaryEmailBinding];

ALTER TABLE [dbo].[UC_ResourcePropertyMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourcePropertyMappings_Property];

ALTER TABLE [dbo].[UC_ResourcePropertyMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourcePropertyMappings_ResourceTypeMapping];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_EntityType];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_CompositeRole];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_SingleRole];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_ResourceType];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_Category];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_Policy];

ALTER TABLE [dbo].[UP_PolicySimulations] WITH CHECK CHECK CONSTRAINT [FK_PolicySimulations_EntityType];

ALTER TABLE [dbo].[UP_PolicySimulations] WITH CHECK CHECK CONSTRAINT [FK_PolicySimulations_EntityType2];

ALTER TABLE [dbo].[UP_RoleMappingRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RoleMappingRuleItems_RoleMappingRule];

ALTER TABLE [dbo].[UP_RoleMappingRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RoleMappingRuleItems_Property];

ALTER TABLE [dbo].[UP_RoleMappingRules] WITH CHECK CHECK CONSTRAINT [FK_RoleMappingRules_RoleMapping];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_Connector];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_EntityType];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_Policy];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_Category];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_ResourceType];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_Property];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_Binding];

GO
/*
Connection package
*/
DELETE "uc_connectionpackages" WHERE "id" NOT IN (-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30,-31,-32,-33,-34,-35,-36,-37,-38);
MERGE "uc_connectionpackages" AS TARGET USING (values(-1,'Usercube.AD@0000001','True','True','False','1','1','0','AD,Active Directory,LDAP,Microsoft','USERCUBE','Directory/Active Directory','Manages users & groups in Active Directory. This package supports incremental synchronization with the DirSync mechanism.','True','https://www.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-2,'Usercube.LDAP@0000001','True','True','False','3','1','0','Directory,LDAP','USERCUBE','Directory/Generic LDAP','Manages entries in an LDAP compliant directory.','False','')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-3,'Usercube.AzureAD@0000001','True','True','False','2','2','0','Azure,Azure Active Directory,Microsoft','USERCUBE','Directory/Azure Active Directory','Manages users & groups in Azure Active Directory. This package supports incremental synchronization with the delta API.','True','https://azure.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-4,'Usercube.OpenLDAP@0000001','True','True','False','5','1','0','Directory,LDAP,Open LDAP','USERCUBE','Directory/Open LDAP','Manages entries in Open LDAP. This package supports incremental synchronization with the sysrepl mechanism.','True','')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-5,'Usercube.SnowTicket@0000001','False','True','False','0','9','10','Ticket,Service Now,Manual','USERCUBE','Ticket/Service Now','Opens tickets in Service Now for the manual provisioning.','True','https://www.servicenow.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-6,'Usercube.Manual@0000001','False','True','False','0','13','0','Ticket,Usercube,Manual','USERCUBE','Ticket/Usercube','Opens manual provisioning tickets in Usercube.','False','https://www.usercube.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-7,'Usercube.Powershell@0000001','False','True','False','0','6','0','','USERCUBE','Custom/PowerShell','Fulfill an external system with a custom PowerShell script.','False','https://azure.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-8,'Usercube.SCIM@0000001','True','True','False','8','7','0','','USERCUBE','Custom/SCIM','Manages entities in SCIM compatible application.','True','http://www.simplecloud.info/img/logo/SCIM_B-and-W_72x24.png')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-9,'Usercube.RACF@0000001','True','False','False','6','0','0','Mainframe,RACF,IBM,AS400,ZOS,z/OS','USERCUBE','Mainframe/RACF','Exports the RACF users and profiles.','False','https://www.ibm.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-10,'Usercube.TSS@0000001','True','False','False','11','0','0','Mainframe,TSS,Top Secret,CA,Computer Associate,AS400,ZOS,z/OS','USERCUBE','Mainframe/Top Secret','Exports the Top Secret users and profiles.','False','https://www.broadcom.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-11,'Usercube.SAP@0000001','True','True','False','7','5','0','ERP,SAP','USERCUBE','ERP/SAP','Manages users & roles in SAP.','False','https://www.sap.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-12,'Usercube.Workday@0000001','True','False','False','13','0','0','','USERCUBE','ERP/Workday','Manages users & groups in Workday.','False','https://www.workday.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-13,'Usercube.SharedFolder@0000001','True','False','False','12','0','0','','USERCUBE','Storage/Shared Folders','Manages users & permissions in Shared Folders.','True','https://azure.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-14,'Usercube.LDIF@0000001','True','False','False','4','0','0','','USERCUBE','Directory/LDIF','Export entries from a LDIF file.','False','')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-15,'Usercube.SQL@0000001','True','False','False','36','0','0','','USERCUBE','Database/Generic SQL','Export data from a SQL database.','False','')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-16,'Usercube.FulfillToFile@0000001','False','True','False','0','11','0','','USERCUBE','Custom/JSON','Generate JSON files for each provisioning order. These JSON can then be used by custom scripts.','False','https://www.usercube.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-17,'Usercube.FulfillWorkflow@0000001','False','True','False','0','3','0','','USERCUBE','Usercube/Workflow','Triggers workflows in Usercube for each provisioning order.','False','https://www.usercube.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-18,'Usercube.SharePoint@0000001','True','True','False','10','8','0','','USERCUBE','Storage/SharePoint','Export sites, folders, SharePoint groups and permissions.','True','https://azure.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-19,'Usercube.ServiceNow@0000001','True','True','False','9','4','0','','USERCUBE','ITSM/Service Now','Manages any data in the CMDB, including users & roles. This package supports incremental synchronization.','True','https://www.servicenow.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-20,'Usercube.CSV@0000001','True','False','False','15','0','0','','USERCUBE','File/CSV delta','Export CSV to prepare incremental synchronization.','True','')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-21,'Usercube.CSV.Complete@0000001','True','False','False','15','0','0','','USERCUBE','File/CSV','Export CSV to prepare full synchronization.','False','')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-22,'Usercube.MicrosoftExchange@0000001','True','True','False','14','6','0','','USERCUBE','Server/Microsoft Exchange','Manages Microsoft Exchange mailboxes. This package supports incremental synchronization.','True','https://www.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-23,'Usercube.Excel@0000001','True','False','False','16','0','0','','USERCUBE','File/Excel delta','Export Excel data sheets containing incremental changes.','True','https://www.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-24,'Usercube.Excel.Complete@0000001','True','False','False','16','0','0','','USERCUBE','File/Excel','Export Excel data sheets.','False','https://www.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-25,'Usercube.LDAP.Oracle@0000001','True','True','False','3','1','0','','USERCUBE','Directory/Oracle LDAP','Manages entries in Oracle Internet Directory.','False','https://www.oracle.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-26,'Usercube.LDAP.Apache@0000001','True','True','False','3','1','0','','USERCUBE','Directory/Apache Directory','Manages users & groups in Apache Directory.','False','https://apache.org/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-27,'Usercube.LDAP.RedHat@0000001','True','True','False','3','1','0','','USERCUBE','Directory/Red Hat Directory Server','Manages entries in a Red Hat Directory Server.','False','https://www.redhat.com/misc/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-28,'Usercube.SQL.Oracle@0000001','True','False','False','17','0','0','','USERCUBE','Database/Oracle','Exports data from an Oracle database.','False','https://www.oracle.com/asset/web/favicons/favicon-128.png')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-29,'Usercube.SQL.MySQL@0000001','True','False','False','17','0','0','','USERCUBE','Database/MySQL','Exports data from a MySQL database.','False','https://labs.mysql.com/common/themes/sakila/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-30,'Usercube.SQL.ODBC@0000001','True','False','False','17','0','0','','USERCUBE','Database/ODBC','Exports data from a generic ODBC compatible database.','False','')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-31,'Usercube.SQL.PostgreSQL@0000001','True','False','False','17','0','0','','USERCUBE','Database/PostgreSQL','Exports data from a PostgreSQL database.','False','https://www.postgresql.org/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-32,'Usercube.SQL.SQLServer@0000001','True','False','False','17','0','0','','USERCUBE','Database/SQL Server','Exports data from a SQL Server database.','False','https://www.microsoft.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-33,'Usercube.SCIM.Salesforce@0000001','True','True','False','8','7','0','','USERCUBE','CRM/Salesforce','Manages Salesforce entities.','True','https://www.salesforce.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-34,'Usercube.SCIM.CyberArk@0000001','True','True','False','8','7','0','','USERCUBE','PAM/CyberArk','Manages CyberArk entities, including users & group assignments.','False','https://www.cyberark.com/wp-content/themes/understrap-child/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-35,'Usercube.Custom@0000001','True','True','True','0','0','0','','USERCUBE','Custom/Unplugged','Manages an unplugged system with a completely custom data model.','False','https://www.usercube.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-36,'Usercube.FulfillDatabase@0000001','False','True','False','0','12','0','','USERCUBE','Usercube/Database','Updates the Usercube database for each provisioning order. This package is used for HR systems, master data or other Usercube instances.','False','https://www.usercube.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-37,'Usercube.RobotFramework@0000001','False','True','False','0','14','0','','USERCUBE','Custom/Robot Framework','Fulfill an external system using a Robot Framework script.','False','https://robotframework.org/static/img/icons/favicon-32x32.png')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");
MERGE "uc_connectionpackages" AS TARGET USING (values(-38,'Usercube.UpdateManualProvisioningTicket@0000001','False','True','False','0','15','13','Ticket,Usercube,Manual','USERCUBE','Ticket/Usercube And Create/Update/Delete resources','Opens manual provisioning tickets in Usercube.','False','https://www.usercube.com/favicon.ico')) AS SOURCE("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") ON TARGET."id" = SOURCE."id" WHEN MATCHED THEN UPDATE SET "identifier"=SOURCE."identifier","implementsentitytypemapping"=SOURCE."implementsentitytypemapping","implementsresourcetypemapping"=SOURCE."implementsresourcetypemapping","implementsconfiguration"=SOURCE."implementsconfiguration","exporttype"=SOURCE."exporttype","fulfillmenttype"=SOURCE."fulfillmenttype","inducedfulfillment"=SOURCE."inducedfulfillment","keywords"=SOURCE."keywords","publisher"=SOURCE."publisher","displayName_l1"=SOURCE."displayName_l1","description_l1"=SOURCE."description_l1","hasincrementalmode"=SOURCE."hasincrementalmode","logourl"=SOURCE."logourl" WHEN NOT MATCHED THEN INSERT("id","identifier","implementsentitytypemapping","implementsresourcetypemapping","implementsconfiguration","exporttype","fulfillmenttype","inducedfulfillment","keywords","publisher","displayName_l1","description_l1","hasincrementalmode","logourl") VALUES(SOURCE."id", SOURCE."identifier",SOURCE."implementsentitytypemapping",SOURCE."implementsresourcetypemapping",SOURCE."implementsconfiguration",SOURCE."exporttype",SOURCE."fulfillmenttype",SOURCE."inducedfulfillment",SOURCE."keywords",SOURCE."publisher",SOURCE."displayName_l1",SOURCE."description_l1",SOURCE."hasincrementalmode",SOURCE."logourl");

GO


GO
PRINT N'Dropping [dbo].[DF_ConnectionColumns_ValueType]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] DROP CONSTRAINT [DF_ConnectionColumns_ValueType];


GO
PRINT N'Dropping [dbo].[DF_ConnectionColumns_ValueLength]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] DROP CONSTRAINT [DF_ConnectionColumns_ValueLength];


GO
PRINT N'Dropping [dbo].[DF_ConnectionColumns_KeyType]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] DROP CONSTRAINT [DF_ConnectionColumns_KeyType];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LL]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LL];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LM]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LM];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L25]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L25];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L26]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L26];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L35]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L35];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L27]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L27];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L36]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L36];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LC]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LC];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LD]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LD];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L9]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L9];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L8]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L8];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LI]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LI];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L13]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L13];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L14]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L14];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LP]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LP];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LU]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LU];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LV]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LV];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L18]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L18];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L19]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L19];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LH]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LH];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LG]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LG];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L32]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L32];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L31]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L31];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L28]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L28];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L29]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L29];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L33]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L33];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LO]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LO];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LN]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LN];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LE]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LE];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LF]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LF];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L10]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L10];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L11]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L11];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L12]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L12];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L21]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L21];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L20]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L20];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L34]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L34];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L22]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L22];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L23]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L23];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LT]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LT];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L24]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L24];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LK]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LK];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LA]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LA];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LS]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LS];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LR]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LR];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LB]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LB];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L37]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L37];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L38]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L38];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L39]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L39];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L15]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L15];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L16]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L16];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L17]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L17];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L30]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L30];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoleRules_L2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [DF_CompositeRoleRules_L2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R37]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R37];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P30]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P30];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R36]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R36];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P29]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P29];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RG]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RG];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PA]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PA];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RH]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RH];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PB]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PB];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P19]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P19];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RK]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RK];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PE]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PE];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RL]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RL];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PF]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PF];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PI]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PI];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RP]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RP];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PJ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PJ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RQ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RQ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PK]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PK];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P25]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P25];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P26]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P26];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R19]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R19];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P38]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P38];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P39]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P39];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R31]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R31];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R32]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R32];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R33]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R33];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R12]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R12];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PS]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PS];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R13]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R13];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PT]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PT];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P34]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P34];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P35]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P35];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RT]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RT];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PN]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PN];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RU]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RU];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PO]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PO];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P15]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P15];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P16]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P16];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_CommentActivationOnDeleteGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_CommentActivationOnDeleteGapInReconciliation];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RR]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RR];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PL]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PL];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RS]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RS];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R30]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R30];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R14]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R14];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PU]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PU];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R15]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R15];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PV]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PV];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R16]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R16];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P10]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P10];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PM]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PM];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P27]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P27];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P28]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P28];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P31]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P31];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R38]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R38];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P32]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P32];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R39]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R39];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P33]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P33];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RI]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RI];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PC]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PC];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RJ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RJ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PD]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PD];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P17]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P17];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P18]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P18];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1F]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1F];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_CommentActivationOnDeclineInReview]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_CommentActivationOnDeclineInReview];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P4]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P4];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RB]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RB];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P5]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P5];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RC]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RC];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P6]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P6];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RD]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RD];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P7]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P7];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R20]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R20];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R21]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R21];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R22]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R22];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R26]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R26];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P20]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P20];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R27]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R27];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P21]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P21];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R28]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R28];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P22]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P22];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1P]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1P];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R17]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R17];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P11]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P11];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R18]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R18];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P12]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P12];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RV]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RV];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PP]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PP];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R0]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R0];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R35]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R35];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RM]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RM];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PG]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PG];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RN]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RN];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PH]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PH];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RO]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RO];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R10]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R10];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PQ]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PQ];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R11]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R11];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_PR]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_PR];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2K]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2K];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P36]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P36];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P37]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P37];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3E]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3E];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RE]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RE];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P8]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P8];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RF]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RF];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P9]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P9];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R29]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R29];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P23]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P23];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P24]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P24];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3L]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3L];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3S]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3S];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3M]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3M];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3G]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3G];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R3N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R3N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1N]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1N];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1H]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1H];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1O]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1O];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3Q]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3Q];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_HideOnSimplifiedView]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_HideOnSimplifiedView];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3R]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3R];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_CommentActivationOnApproveInReview]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_CommentActivationOnApproveInReview];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P13]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P13];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1A]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1A];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P14]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P14];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R1B]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R1B];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2I]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2I];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2C]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2C];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R2J]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R2J];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2D]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2D];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R8]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R8];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R9]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R9];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_RA]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_RA];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R23]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R23];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R24]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R24];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R25]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R25];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P1V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P1V];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2T]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2T];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_R34]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_R34];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P2U]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P2U];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_CommentActivationOnKeepGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_CommentActivationOnKeepGapInReconciliation];


GO
PRINT N'Dropping [dbo].[DF_CompositeRoles_P3V]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [DF_CompositeRoles_P3V];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsProvisioningEnabled]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsProvisioningEnabled];


GO
PRINT N'Dropping [dbo].[DF_Policies_CommentActivationOnDeclineInReview]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_CommentActivationOnDeclineInReview];


GO
PRINT N'Dropping [dbo].[DF_Policies_CommentActivationOnApproveInReview]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_CommentActivationOnApproveInReview];


GO
PRINT N'Dropping [dbo].[DF_Policies_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_Policies_CommentActivationOnDeleteGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_CommentActivationOnDeleteGapInReconciliation];


GO
PRINT N'Dropping [dbo].[DF_Policies_CommentActivationOnKeepGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_CommentActivationOnKeepGapInReconciliation];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsExternal]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsExternal];


GO
PRINT N'Dropping [dbo].[DF_Policies_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_Policies_IsSimumationEnabled]...';


GO
ALTER TABLE [dbo].[UP_Policies] DROP CONSTRAINT [DF_Policies_IsSimumationEnabled];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L24]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L24];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L23]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L23];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L22]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L22];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LL]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LL];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LK]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LK];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LT]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LT];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LS]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LS];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L6]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L6];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L15]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L15];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L7]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L7];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L16]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L16];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L30]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L30];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L31]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L31];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L0]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L0];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LF]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LF];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LE]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LE];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LD]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LD];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L29]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L29];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L39]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L39];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L20]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L20];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L21]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L21];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LG]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LG];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LH]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LH];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LI]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LI];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L26]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L26];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L25]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L25];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L28]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L28];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L27]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L27];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LA]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LA];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L11]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L11];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L35]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L35];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L36]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L36];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L12]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L12];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LO]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LO];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LP]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LP];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L37]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L37];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L38]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L38];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L17]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L17];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L18]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L18];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L13]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L13];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L14]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L14];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L19]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L19];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L9]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L9];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LM]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LM];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L8]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L8];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LN]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LN];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L10]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L10];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LR]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LR];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LU]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LU];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LV]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LV];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L32]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L32];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L34]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L34];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L33]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L33];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L4]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L4];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LC]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LC];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_LB]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_LB];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceNavigationRules_L5]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [DF_ResourceNavigationRules_L5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L27]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L27];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L26]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L26];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L34]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L34];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LB]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LB];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LC]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LC];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LD]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LD];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L35]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L35];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L36]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L36];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L37]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L37];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L11]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L11];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L10]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L10];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L12]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L12];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LE]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LE];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LF]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LF];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LL]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LL];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LM]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LM];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L18]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L18];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L19]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L19];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L17]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L17];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L16]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L16];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetBeforeReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetBeforeReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L6];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L21]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L21];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L8]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L8];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L22]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L22];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L14]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L14];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L15]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L15];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L32]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L32];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L33]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L33];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L13]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L13];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LU]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LU];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LV]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LV];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L38]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L38];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L39]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L39];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LP]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LP];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LH]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LH];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_TimeOffsetAfterReference]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_TimeOffsetAfterReference];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L25]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L25];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_Type]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_Type];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L24]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L24];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L20]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L20];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L23]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L23];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LN]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LN];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LG]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LG];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L31]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L31];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L30]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L30];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LR]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LR];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LS]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LS];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L28]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L28];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LT]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LT];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L29]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L29];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LA]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LA];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L9]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L9];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LK]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LK];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LO]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LO];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_LI]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_LI];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypeRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [DF_ResourceTypeRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_HideOnSimplifiedView]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_HideOnSimplifiedView];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_DiscardManualAssignments]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_DiscardManualAssignments];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_BlockProvisioning]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_BlockProvisioning];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RemoveOrphans]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RemoveOrphans];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PR]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PR];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R11]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R11];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RR]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RR];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PL]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PL];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PK]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PK];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RQ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RQ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P18]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P18];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RP]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RP];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P17]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P17];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P16]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P16];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumInsertPercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumInsertPercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R10]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R10];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumDeletePercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumDeletePercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R6];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R29]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R29];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P23]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P23];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P22]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P22];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R28]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R28];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R21]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R21];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R20]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R20];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RF]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RF];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PI]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PI];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RO]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RO];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PH]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PH];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RN]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RN];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PG]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PG];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R35]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R35];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R34]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R34];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RE]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RE];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P8]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P8];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RD]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RD];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R30]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R30];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumInsert]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumInsert];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P38]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P38];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P39]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P39];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P37]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P37];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P19]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P19];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P28]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P28];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P27]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P27];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PC]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PC];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RJ]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RJ];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PD]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PD];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P4]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P4];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RA]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RA];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R9]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R9];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RI]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RI];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_CorrelateMultipleResources]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_CorrelateMultipleResources];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_AllowRemove]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_AllowRemove];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_AllowAdd]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_AllowAdd];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R25]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R25];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R24]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R24];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RT]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RT];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PN]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PN];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PM]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PM];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RS]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RS];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R16]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R16];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PV]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PV];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R15]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R15];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PU]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PU];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R14]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R14];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P15]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P15];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P14]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P14];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R19]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R19];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P13]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P13];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P33]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P33];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P34]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P34];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R39]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R39];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P32]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P32];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R38]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R38];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_TransmittedStateValidityPeriod]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_TransmittedStateValidityPeriod];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumUpdate]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumUpdate];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R13]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R13];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R12]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R12];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PS]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PS];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumDelete]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumDelete];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_FulfillHoursAheadOfTime]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_FulfillHoursAheadOfTime];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R23]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R23];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R22]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R22];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2I]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2I];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2J]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2J];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3Q]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3Q];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R7]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R7];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R8]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R8];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P5]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P5];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RB]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RB];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R1U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R1U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P1O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P1O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RC]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RC];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P6]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P6];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_MaximumUpdatePercent]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_MaximumUpdatePercent];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P0];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2G]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2G];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P29]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P29];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P26]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P26];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P25]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P25];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RH]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RH];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PB]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PB];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2A]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2A];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P24]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P24];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RG]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RG];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PA]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PA];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P9]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P9];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2T]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2T];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2M]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2M];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RM]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RM];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RL]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RL];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PF]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PF];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P31]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P31];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RK]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RK];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PE]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PE];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R37]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R37];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P30]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P30];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R36]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R36];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2L]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2L];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2F]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2F];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R2K]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R2K];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2E]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2E];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2D]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2D];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P11]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P11];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R18]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R18];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P12]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P12];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R17]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R17];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P10]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P10];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3C]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3C];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P36]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P36];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R33]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R33];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3B]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3B];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P35]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P35];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R32]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R32];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2S]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2S];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P2R]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P2R];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R31]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R31];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RU]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RU];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PO]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PO];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3V]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3V];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3P]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3P];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3U]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3U];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3O];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R27]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R27];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P21]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P21];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P20]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P20];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R26]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R26];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PT]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PT];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3N]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3N];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_P3H]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_P3H];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_RV]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_RV];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_PP]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_PP];


GO
PRINT N'Dropping [dbo].[DF_ResourceTypes_R3O]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [DF_ResourceTypes_R3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_Type]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_Type];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_IsDenied]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_IsDenied];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L34]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L34];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L33]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L33];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L17]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L18]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L18];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L21]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L21];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L22]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L22];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LL]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LL];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LK]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LK];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LJ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LJ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L11]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L11];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L12]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L12];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L10]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L10];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LP]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LP];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LV]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LV];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LQ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LQ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LR]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LR];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L8]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L8];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L26]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L26];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L25]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L25];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L30]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L30];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L27]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L27];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L14]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L14];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L13]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L13];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LN]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LN];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LO]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LO];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LM]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LM];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L39]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L39];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LS]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LS];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LT]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LT];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LU]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LU];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L38]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L38];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L37]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L37];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LC]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LC];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LB]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LB];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LI]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LI];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LH]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LH];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LG]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LG];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L23]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L23];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L24]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L24];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LE]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LE];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LF]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LF];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LD]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LD];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L29]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L29];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L28]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L28];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L19]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L19];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L16]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L16];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L31]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L31];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L20]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L20];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L9]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L9];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L32]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L32];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L15]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L15];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L3K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L3K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L35]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L35];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L36]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L36];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L1D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L1D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_LA]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_LA];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L2T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L2T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoleRules_L6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [DF_SingleRoleRules_L6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P13]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P13];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P31]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P31];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P30]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P30];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P14]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P14];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R36]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R36];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RT]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RT];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RS]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RS];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PM]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PM];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RR]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RR];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PL]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PL];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PK]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PK];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R37]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R37];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R38]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R38];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RA]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RA];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RB]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RB];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RF]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RF];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P28]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P28];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P8]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P8];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P29]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P29];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P9]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P9];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RG]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RG];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PA]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PA];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PE]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PE];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PF]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PF];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RL]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RL];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PG]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PG];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RM]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RM];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PS]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PS];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PR]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PR];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R11]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R11];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RK]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RK];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R12]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R12];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R25]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R25];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P37]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P37];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P36]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P36];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R24]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R24];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ValidTo]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ValidTo];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R5]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R5];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R21]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R21];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R20]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R20];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PV]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PV];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P17]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P18]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P18];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P19]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P19];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R16]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R16];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P10]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P10];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R15]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R15];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R32]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R32];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R33]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R33];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R29]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R29];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P23]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P23];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P24]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P24];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_CommentActivationOnDeleteGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_CommentActivationOnDeleteGapInReconciliation];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_CommentActivationOnDeclineInReview]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_CommentActivationOnDeclineInReview];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_CommentActivationOnApproveInReview]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_CommentActivationOnApproveInReview];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P32]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P32];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P33]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P33];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P34]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P34];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R39]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R39];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PJ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PJ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RP]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RP];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PI]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PI];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RU]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RU];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RQ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RQ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PN]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PN];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RO]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RO];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RN]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RN];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PH]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PH];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P35]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P35];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3V]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3V];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_CommentActivationOnKeepGapInReconciliation]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_CommentActivationOnKeepGapInReconciliation];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R0]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R0];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RI]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RI];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RH]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RH];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PB]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PB];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PC]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PC];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RJ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RJ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PD]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PD];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PO]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PO];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PP]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PP];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RV]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RV];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PQ]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PQ];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R10]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R10];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R8]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R8];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P39]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P39];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P38]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P38];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R31]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R31];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R30]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R30];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P11]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P11];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R18]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R18];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PU]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PU];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P12]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P12];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R19]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R19];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3N];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R13]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R13];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3O]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3O];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_PT]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_PT];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R14]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R14];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R17]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R17];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1F]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1F];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1E]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1E];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R26]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R26];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R27]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R27];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P20]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P20];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P21]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P21];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R28]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R28];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P22]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P22];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2A]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2A];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2G]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2G];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2I]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2I];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2H]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2H];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RC]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RC];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P6]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P6];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P7]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P7];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RD]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RD];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_RE]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_RE];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1P]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1P];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1J]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1J];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1K]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1K];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2B]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2B];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P25]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P25];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P26]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P26];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P27]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P27];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_HideOnSimplifiedView]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_HideOnSimplifiedView];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ApprovalWorkflowType];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3Q]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3Q];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3L]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3L];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P3M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P3M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R22]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R22];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R23]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R23];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P1R]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P1R];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R35]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R35];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R3]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R3];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2U]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2U];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P16]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P16];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R34]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R34];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P15]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P15];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R9]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R9];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1C]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1C];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R1D]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R1D];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R4]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R4];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_ValidFrom]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_ValidFrom];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2S]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2S];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2M]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2M];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_R2T]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_R2T];


GO
PRINT N'Dropping [dbo].[DF_SingleRoles_P2N]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [DF_SingleRoles_P2N];


GO
PRINT N'Dropping [dbo].[FK_ConnectionColumns_Table]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] DROP CONSTRAINT [FK_ConnectionColumns_Table];


GO
PRINT N'Dropping [dbo].[FK_ConnectionColumns_ForeignColumn]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] DROP CONSTRAINT [FK_ConnectionColumns_ForeignColumn];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] DROP CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_Policy];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_CompositeRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_Category];


GO
PRINT N'Dropping [dbo].[FK_AssignedCompositeRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] DROP CONSTRAINT [FK_AssignedCompositeRoles_Role];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_CompositeRolesCategories_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] DROP CONSTRAINT [FK_CompositeRolesCategories_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_CompositeRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_PendingApprovalRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] DROP CONSTRAINT [FK_PendingApprovalRules_CompositeRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_ContextRule]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_ContextRule];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BA_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BA_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BB_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BB_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BC_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BC_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BD_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BD_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BE_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BE_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BF_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BF_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BG_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BG_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BH_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BH_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BI_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BI_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BJ_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BJ_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BK_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BK_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BL_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BL_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BM_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BM_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BN_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BN_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BO_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BO_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BP_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BP_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BQ_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BQ_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BR_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BR_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BS_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BS_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BT_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BT_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BU_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BU_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_BV_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_BV_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B10_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B10_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B11_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B11_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B12_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B12_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B13_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B13_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B14_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B14_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B15_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B15_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B16_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B16_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B17_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B17_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B18_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B18_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B19_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B19_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1A_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1A_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1B_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1B_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1C_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1C_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1D_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1D_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1E_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1E_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1F_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1F_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1G_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1G_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1H_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1H_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1I_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1I_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1J_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1J_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1K_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1K_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1L_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1L_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1M_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1M_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1N_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1N_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1O_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1O_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1P_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1P_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1Q_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1Q_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1R_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1R_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1S_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1S_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1T_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1T_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1U_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1U_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1V_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1V_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B20_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B20_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B21_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B21_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B22_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B22_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B23_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B23_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B24_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B24_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B25_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B25_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B26_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B26_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B27_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B27_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B28_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B28_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B29_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B29_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2A_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2A_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2B_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2B_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2C_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2C_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2D_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2D_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2E_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2E_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2F_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2F_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2G_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2G_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2H_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2H_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2I_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2I_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2J_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2J_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2K_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2K_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2L_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2L_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2M_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2M_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2N_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2N_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2O_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2O_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2P_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2P_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2Q_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2Q_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2R_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2R_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2S_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2S_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2T_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2T_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2U_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2U_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2V_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2V_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B30_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B30_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B31_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B31_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B32_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B32_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B33_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B33_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B34_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B34_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B35_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B35_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B36_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B36_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B37_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B37_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B38_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B38_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B39_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B39_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3A_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3A_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3B_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3B_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3C_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3C_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3D_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3D_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3E_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3E_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3F_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3F_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3G_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3G_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3H_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3H_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3I_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3I_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3J_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3J_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3K_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3K_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3L_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3L_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3M_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3M_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3N_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3N_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3O_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3O_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3P_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3P_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3Q_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3Q_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3R_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3R_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3S_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3S_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3T_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3T_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3U_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3U_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3V_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3V_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_SourceEntityTypes]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_SourceEntityTypes];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_ResourcesBinding]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_ResourcesBinding];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_ResourcesStartBinding_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_ResourcesStartBinding_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_ResourcesEndBinding_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_ResourcesEndBinding_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B0_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B0_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B1_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B1_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B2_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B2_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B3_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B3_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B4_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B4_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B5_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B5_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B6_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B6_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B7_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B7_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B8_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B8_Id];


GO
PRINT N'Dropping [dbo].[FK_ContextRules_B9_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] DROP CONSTRAINT [FK_ContextRules_B9_Id];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_RiskRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] DROP CONSTRAINT [FK_RiskRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_RoleCounters_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] DROP CONSTRAINT [FK_RoleCounters_Policy];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceBinaryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceBinaryRules] DROP CONSTRAINT [FK_ResourceBinaryRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_Categories_Policy]...';


GO
ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [FK_Categories_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_PendingApprovalRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] DROP CONSTRAINT [FK_PendingApprovalRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_Risks_Policy]...';


GO
ALTER TABLE [dbo].[UP_Risks] DROP CONSTRAINT [FK_Risks_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_RoleMappings_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] DROP CONSTRAINT [FK_RoleMappings_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_Policy];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_Property];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] DROP CONSTRAINT [FK_ResourceNavigationRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] DROP CONSTRAINT [FK_ResourceTypeRules_SingleRole0];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_SourceEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_SourceEntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_TargetEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_TargetEntityType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypes_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_Category];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypesCategories_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] DROP CONSTRAINT [FK_ResourceTypesCategories_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_RiskRuleItems_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] DROP CONSTRAINT [FK_RiskRuleItems_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_TaskResourceTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskResourceTypes] DROP CONSTRAINT [FK_TaskResourceTypes_EntityType];


GO
PRINT N'Dropping [dbo].[FK_AccessCertificationDataFilters_ResourceType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters] DROP CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_EntityInstances_FilterResourceType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] DROP CONSTRAINT [FK_EntityInstances_FilterResourceType];


GO
PRINT N'Dropping [dbo].[FK_AssignedResourceTypes_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] DROP CONSTRAINT [FK_AssignedResourceTypes_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_IndirectResourceRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] DROP CONSTRAINT [FK_IndirectResourceRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_ResourceType]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ProfileRuleContexts_ResourceType_Id]...';


GO
ALTER TABLE [dbo].[UA_ProfileRuleContexts] DROP CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id];


GO
PRINT N'Dropping [dbo].[FK_ResourceBinaryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceBinaryRules] DROP CONSTRAINT [FK_ResourceBinaryRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] DROP CONSTRAINT [FK_ResourceClassificationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_PendingApprovalRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] DROP CONSTRAINT [FK_PendingApprovalRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] DROP CONSTRAINT [FK_ResourceTypeMappings_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] DROP CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_RoleMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] DROP CONSTRAINT [FK_RoleMappings_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] DROP CONSTRAINT [FK_ResourceQueryRules_ResourceType];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] DROP CONSTRAINT [FK_SingleRoleRules_Role];


GO
PRINT N'Dropping [dbo].[FK_ResourceScalarRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] DROP CONSTRAINT [FK_ResourceScalarRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_SingleRolesCategories_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRolesCategories] DROP CONSTRAINT [FK_SingleRolesCategories_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_EntityType];


GO
PRINT N'Dropping [dbo].[FK_SingleRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_Category];


GO
PRINT N'Dropping [dbo].[FK_ProfileContexts_SingleRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_AssignedSingleRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] DROP CONSTRAINT [FK_AssignedSingleRoles_Role];


GO
PRINT N'Dropping [dbo].[FK_ResourceBinaryRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceBinaryRules] DROP CONSTRAINT [FK_ResourceBinaryRules_SingleRole];


GO
PRINT N'Dropping [dbo].[FK_PendingApprovalRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] DROP CONSTRAINT [FK_PendingApprovalRules_SingleRole];


GO
PRINT N'Starting rebuilding table [dbo].[UC_ConnectionColumns]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UC_ConnectionColumns] (
    [Id]               BIGINT         NOT NULL,
    [Table_Id]         BIGINT         NOT NULL,
    [Identifier]       VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [KeyType]          TINYINT        CONSTRAINT [DF_ConnectionColumns_KeyType] DEFAULT ((0)) NOT NULL,
    [ValueType]        TINYINT        CONSTRAINT [DF_ConnectionColumns_ValueType] DEFAULT ((0)) NOT NULL,
    [ValueLength]      INT            CONSTRAINT [DF_ConnectionColumns_ValueLength] DEFAULT ((0)) NOT NULL,
    [IsMultivalued]    BIT            CONSTRAINT [DF_ConnectionColumns_IsMultivalued] DEFAULT ((0)) NOT NULL,
    [DisplayName]      NVARCHAR (442) NULL,
    [Path]             NVARCHAR (442) NULL,
    [UpdateDate]       DATETIME       NULL,
    [ForeignColumn_Id] BIGINT         NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ConnectionColumns1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_ConnectionColumns_Identifier1] UNIQUE NONCLUSTERED ([Table_Id] ASC, [Identifier] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UC_ConnectionColumns])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UC_ConnectionColumns] ([Id], [Table_Id], [Identifier], [KeyType], [ValueType], [ValueLength], [DisplayName], [Path], [UpdateDate], [ForeignColumn_Id])
        SELECT   [Id],
                 [Table_Id],
                 [Identifier],
                 [KeyType],
                 [ValueType],
                 [ValueLength],
                 [DisplayName],
                 [Path],
                 [UpdateDate],
                 [ForeignColumn_Id]
        FROM     [dbo].[UC_ConnectionColumns]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UC_ConnectionColumns];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UC_ConnectionColumns]', N'UC_ConnectionColumns';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ConnectionColumns1]', N'PK_ConnectionColumns', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_ConnectionColumns_Identifier1]', N'U_ConnectionColumns_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UJ_Jobs]...';


GO
ALTER TABLE [dbo].[UJ_Jobs]
    ADD [IsConnectorJob]      BIT CONSTRAINT [DF_Jobs_IsConnectorJob] DEFAULT ((0)) NOT NULL,
        [IsInitializationJob] BIT CONSTRAINT [DF_Jobs_IsInitializationJob] DEFAULT ((0)) NOT NULL;


GO
PRINT N'Altering [dbo].[UM_EntityTypes]...';


GO
ALTER TABLE [dbo].[UM_EntityTypes]
    ADD [UnclassifiedCount] INT CONSTRAINT [DF_EntityTypes_UnclassifiedCount] DEFAULT ((0)) NOT NULL;


GO
PRINT N'Altering [dbo].[UP_Categories]...';


GO
ALTER TABLE [dbo].[UP_Categories]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Starting rebuilding table [dbo].[UP_CompositeRoleRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_CompositeRoleRules] (
    [Id]            BIGINT        NOT NULL,
    [Policy_Id]     BIGINT        NOT NULL,
    [Type]          INT           CONSTRAINT [DF_CompositeRoleRules_Type] DEFAULT ((0)) NOT NULL,
    [EntityType_Id] BIGINT        NOT NULL,
    [Role_Id]       BIGINT        NOT NULL,
    [IsDenied]      BIT           CONSTRAINT [DF_CompositeRoleRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [L0]            BIT           CONSTRAINT [DF_CompositeRoleRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]            BIT           CONSTRAINT [DF_CompositeRoleRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]            BIT           CONSTRAINT [DF_CompositeRoleRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]            BIT           CONSTRAINT [DF_CompositeRoleRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]            BIT           CONSTRAINT [DF_CompositeRoleRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]            BIT           CONSTRAINT [DF_CompositeRoleRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]            BIT           CONSTRAINT [DF_CompositeRoleRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]            BIT           CONSTRAINT [DF_CompositeRoleRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]            BIT           CONSTRAINT [DF_CompositeRoleRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]            BIT           CONSTRAINT [DF_CompositeRoleRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]            BIT           CONSTRAINT [DF_CompositeRoleRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]            BIT           CONSTRAINT [DF_CompositeRoleRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]            BIT           CONSTRAINT [DF_CompositeRoleRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]            BIT           CONSTRAINT [DF_CompositeRoleRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]            BIT           CONSTRAINT [DF_CompositeRoleRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]            BIT           CONSTRAINT [DF_CompositeRoleRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]            BIT           CONSTRAINT [DF_CompositeRoleRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]            BIT           CONSTRAINT [DF_CompositeRoleRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]            BIT           CONSTRAINT [DF_CompositeRoleRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]            BIT           CONSTRAINT [DF_CompositeRoleRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]            BIT           CONSTRAINT [DF_CompositeRoleRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]            BIT           CONSTRAINT [DF_CompositeRoleRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]            BIT           CONSTRAINT [DF_CompositeRoleRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]            BIT           CONSTRAINT [DF_CompositeRoleRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]            BIT           CONSTRAINT [DF_CompositeRoleRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]            BIT           CONSTRAINT [DF_CompositeRoleRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]            BIT           CONSTRAINT [DF_CompositeRoleRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]            BIT           CONSTRAINT [DF_CompositeRoleRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]            BIT           CONSTRAINT [DF_CompositeRoleRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]            BIT           CONSTRAINT [DF_CompositeRoleRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]            BIT           CONSTRAINT [DF_CompositeRoleRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]            BIT           CONSTRAINT [DF_CompositeRoleRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]           BIT           CONSTRAINT [DF_CompositeRoleRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]           BIT           CONSTRAINT [DF_CompositeRoleRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]           BIT           CONSTRAINT [DF_CompositeRoleRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]           BIT           CONSTRAINT [DF_CompositeRoleRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]           BIT           CONSTRAINT [DF_CompositeRoleRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]           BIT           CONSTRAINT [DF_CompositeRoleRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]           BIT           CONSTRAINT [DF_CompositeRoleRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]           BIT           CONSTRAINT [DF_CompositeRoleRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]           BIT           CONSTRAINT [DF_CompositeRoleRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]           BIT           CONSTRAINT [DF_CompositeRoleRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]           BIT           CONSTRAINT [DF_CompositeRoleRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]           BIT           CONSTRAINT [DF_CompositeRoleRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]           BIT           CONSTRAINT [DF_CompositeRoleRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]           BIT           CONSTRAINT [DF_CompositeRoleRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]           BIT           CONSTRAINT [DF_CompositeRoleRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]           BIT           CONSTRAINT [DF_CompositeRoleRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]           BIT           CONSTRAINT [DF_CompositeRoleRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]           BIT           CONSTRAINT [DF_CompositeRoleRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]           BIT           CONSTRAINT [DF_CompositeRoleRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]           BIT           CONSTRAINT [DF_CompositeRoleRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]           BIT           CONSTRAINT [DF_CompositeRoleRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]           BIT           CONSTRAINT [DF_CompositeRoleRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]           BIT           CONSTRAINT [DF_CompositeRoleRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]           BIT           CONSTRAINT [DF_CompositeRoleRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]           BIT           CONSTRAINT [DF_CompositeRoleRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]           BIT           CONSTRAINT [DF_CompositeRoleRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]           BIT           CONSTRAINT [DF_CompositeRoleRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]           BIT           CONSTRAINT [DF_CompositeRoleRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]           BIT           CONSTRAINT [DF_CompositeRoleRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]           BIT           CONSTRAINT [DF_CompositeRoleRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]           BIT           CONSTRAINT [DF_CompositeRoleRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]           BIT           CONSTRAINT [DF_CompositeRoleRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]           BIT           CONSTRAINT [DF_CompositeRoleRules_L3V] DEFAULT ((0)) NOT NULL,
    [WhenCreated]   SMALLDATETIME NULL,
    [CreatedBy_Id]  BIGINT        NULL,
    [WhenChanged]   SMALLDATETIME NULL,
    [ChangedBy_Id]  BIGINT        NULL,
    [D0_Id]         BIGINT        NULL,
    [D1_Id]         BIGINT        NULL,
    [D2_Id]         BIGINT        NULL,
    [D3_Id]         BIGINT        NULL,
    [D4_Id]         BIGINT        NULL,
    [D5_Id]         BIGINT        NULL,
    [D6_Id]         BIGINT        NULL,
    [D7_Id]         BIGINT        NULL,
    [D8_Id]         BIGINT        NULL,
    [D9_Id]         BIGINT        NULL,
    [DA_Id]         BIGINT        NULL,
    [DB_Id]         BIGINT        NULL,
    [DC_Id]         BIGINT        NULL,
    [DD_Id]         BIGINT        NULL,
    [DE_Id]         BIGINT        NULL,
    [DF_Id]         BIGINT        NULL,
    [DG_Id]         BIGINT        NULL,
    [DH_Id]         BIGINT        NULL,
    [DI_Id]         BIGINT        NULL,
    [DJ_Id]         BIGINT        NULL,
    [DK_Id]         BIGINT        NULL,
    [DL_Id]         BIGINT        NULL,
    [DM_Id]         BIGINT        NULL,
    [DN_Id]         BIGINT        NULL,
    [DO_Id]         BIGINT        NULL,
    [DP_Id]         BIGINT        NULL,
    [DQ_Id]         BIGINT        NULL,
    [DR_Id]         BIGINT        NULL,
    [DS_Id]         BIGINT        NULL,
    [DT_Id]         BIGINT        NULL,
    [DU_Id]         BIGINT        NULL,
    [DV_Id]         BIGINT        NULL,
    [D10_Id]        BIGINT        NULL,
    [D11_Id]        BIGINT        NULL,
    [D12_Id]        BIGINT        NULL,
    [D13_Id]        BIGINT        NULL,
    [D14_Id]        BIGINT        NULL,
    [D15_Id]        BIGINT        NULL,
    [D16_Id]        BIGINT        NULL,
    [D17_Id]        BIGINT        NULL,
    [D18_Id]        BIGINT        NULL,
    [D19_Id]        BIGINT        NULL,
    [D1A_Id]        BIGINT        NULL,
    [D1B_Id]        BIGINT        NULL,
    [D1C_Id]        BIGINT        NULL,
    [D1D_Id]        BIGINT        NULL,
    [D1E_Id]        BIGINT        NULL,
    [D1F_Id]        BIGINT        NULL,
    [D1G_Id]        BIGINT        NULL,
    [D1H_Id]        BIGINT        NULL,
    [D1I_Id]        BIGINT        NULL,
    [D1J_Id]        BIGINT        NULL,
    [D1K_Id]        BIGINT        NULL,
    [D1L_Id]        BIGINT        NULL,
    [D1M_Id]        BIGINT        NULL,
    [D1N_Id]        BIGINT        NULL,
    [D1O_Id]        BIGINT        NULL,
    [D1P_Id]        BIGINT        NULL,
    [D1Q_Id]        BIGINT        NULL,
    [D1R_Id]        BIGINT        NULL,
    [D1S_Id]        BIGINT        NULL,
    [D1T_Id]        BIGINT        NULL,
    [D1U_Id]        BIGINT        NULL,
    [D1V_Id]        BIGINT        NULL,
    [D20_Id]        BIGINT        NULL,
    [D21_Id]        BIGINT        NULL,
    [D22_Id]        BIGINT        NULL,
    [D23_Id]        BIGINT        NULL,
    [D24_Id]        BIGINT        NULL,
    [D25_Id]        BIGINT        NULL,
    [D26_Id]        BIGINT        NULL,
    [D27_Id]        BIGINT        NULL,
    [D28_Id]        BIGINT        NULL,
    [D29_Id]        BIGINT        NULL,
    [D2A_Id]        BIGINT        NULL,
    [D2B_Id]        BIGINT        NULL,
    [D2C_Id]        BIGINT        NULL,
    [D2D_Id]        BIGINT        NULL,
    [D2E_Id]        BIGINT        NULL,
    [D2F_Id]        BIGINT        NULL,
    [D2G_Id]        BIGINT        NULL,
    [D2H_Id]        BIGINT        NULL,
    [D2I_Id]        BIGINT        NULL,
    [D2J_Id]        BIGINT        NULL,
    [D2K_Id]        BIGINT        NULL,
    [D2L_Id]        BIGINT        NULL,
    [D2M_Id]        BIGINT        NULL,
    [D2N_Id]        BIGINT        NULL,
    [D2O_Id]        BIGINT        NULL,
    [D2P_Id]        BIGINT        NULL,
    [D2Q_Id]        BIGINT        NULL,
    [D2R_Id]        BIGINT        NULL,
    [D2S_Id]        BIGINT        NULL,
    [D2T_Id]        BIGINT        NULL,
    [D2U_Id]        BIGINT        NULL,
    [D2V_Id]        BIGINT        NULL,
    [D30_Id]        BIGINT        NULL,
    [D31_Id]        BIGINT        NULL,
    [D32_Id]        BIGINT        NULL,
    [D33_Id]        BIGINT        NULL,
    [D34_Id]        BIGINT        NULL,
    [D35_Id]        BIGINT        NULL,
    [D36_Id]        BIGINT        NULL,
    [D37_Id]        BIGINT        NULL,
    [D38_Id]        BIGINT        NULL,
    [D39_Id]        BIGINT        NULL,
    [D3A_Id]        BIGINT        NULL,
    [D3B_Id]        BIGINT        NULL,
    [D3C_Id]        BIGINT        NULL,
    [D3D_Id]        BIGINT        NULL,
    [D3E_Id]        BIGINT        NULL,
    [D3F_Id]        BIGINT        NULL,
    [D3G_Id]        BIGINT        NULL,
    [D3H_Id]        BIGINT        NULL,
    [D3I_Id]        BIGINT        NULL,
    [D3J_Id]        BIGINT        NULL,
    [D3K_Id]        BIGINT        NULL,
    [D3L_Id]        BIGINT        NULL,
    [D3M_Id]        BIGINT        NULL,
    [D3N_Id]        BIGINT        NULL,
    [D3O_Id]        BIGINT        NULL,
    [D3P_Id]        BIGINT        NULL,
    [D3Q_Id]        BIGINT        NULL,
    [D3R_Id]        BIGINT        NULL,
    [D3S_Id]        BIGINT        NULL,
    [D3T_Id]        BIGINT        NULL,
    [D3U_Id]        BIGINT        NULL,
    [D3V_Id]        BIGINT        NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_CompositeRoleRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_CompositeRoleRules1]
    ON [dbo].[tmp_ms_xx_UP_CompositeRoleRules]([EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_CompositeRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_CompositeRoleRules] ([EntityType_Id], [Role_Id], [Id], [Policy_Id], [Type], [IsDenied], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Role_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [IsDenied],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_CompositeRoleRules]
        ORDER BY [EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_CompositeRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_CompositeRoleRules]', N'UP_CompositeRoleRules';

EXECUTE sp_rename N'[dbo].[UP_CompositeRoleRules].[tmp_ms_xx_index_IX_CompositeRoleRules1]', N'IX_CompositeRoleRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_CompositeRoleRules1]', N'PK_CompositeRoleRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_CompositeRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_CompositeRoles] (
    [Id]                                           BIGINT          NOT NULL,
    [Policy_Id]                                    BIGINT          NOT NULL,
    [EntityType_Id]                                BIGINT          NOT NULL,
    [Category_Id]                                  BIGINT          NULL,
    [ValidFrom]                                    DATETIME2 (2)   CONSTRAINT [DF_CompositeRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                      DATETIME2 (2)   CONSTRAINT [DF_CompositeRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [P0]                                           BIT             CONSTRAINT [DF_CompositeRoles_P0] DEFAULT ((0)) NOT NULL,
    [P1]                                           BIT             CONSTRAINT [DF_CompositeRoles_P1] DEFAULT ((0)) NOT NULL,
    [P2]                                           BIT             CONSTRAINT [DF_CompositeRoles_P2] DEFAULT ((0)) NOT NULL,
    [P3]                                           BIT             CONSTRAINT [DF_CompositeRoles_P3] DEFAULT ((0)) NOT NULL,
    [P4]                                           BIT             CONSTRAINT [DF_CompositeRoles_P4] DEFAULT ((0)) NOT NULL,
    [P5]                                           BIT             CONSTRAINT [DF_CompositeRoles_P5] DEFAULT ((0)) NOT NULL,
    [P6]                                           BIT             CONSTRAINT [DF_CompositeRoles_P6] DEFAULT ((0)) NOT NULL,
    [P7]                                           BIT             CONSTRAINT [DF_CompositeRoles_P7] DEFAULT ((0)) NOT NULL,
    [P8]                                           BIT             CONSTRAINT [DF_CompositeRoles_P8] DEFAULT ((0)) NOT NULL,
    [P9]                                           BIT             CONSTRAINT [DF_CompositeRoles_P9] DEFAULT ((0)) NOT NULL,
    [PA]                                           BIT             CONSTRAINT [DF_CompositeRoles_PA] DEFAULT ((0)) NOT NULL,
    [PB]                                           BIT             CONSTRAINT [DF_CompositeRoles_PB] DEFAULT ((0)) NOT NULL,
    [PC]                                           BIT             CONSTRAINT [DF_CompositeRoles_PC] DEFAULT ((0)) NOT NULL,
    [PD]                                           BIT             CONSTRAINT [DF_CompositeRoles_PD] DEFAULT ((0)) NOT NULL,
    [PE]                                           BIT             CONSTRAINT [DF_CompositeRoles_PE] DEFAULT ((0)) NOT NULL,
    [PF]                                           BIT             CONSTRAINT [DF_CompositeRoles_PF] DEFAULT ((0)) NOT NULL,
    [PG]                                           BIT             CONSTRAINT [DF_CompositeRoles_PG] DEFAULT ((0)) NOT NULL,
    [PH]                                           BIT             CONSTRAINT [DF_CompositeRoles_PH] DEFAULT ((0)) NOT NULL,
    [PI]                                           BIT             CONSTRAINT [DF_CompositeRoles_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                                           BIT             CONSTRAINT [DF_CompositeRoles_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                                           BIT             CONSTRAINT [DF_CompositeRoles_PK] DEFAULT ((0)) NOT NULL,
    [PL]                                           BIT             CONSTRAINT [DF_CompositeRoles_PL] DEFAULT ((0)) NOT NULL,
    [PM]                                           BIT             CONSTRAINT [DF_CompositeRoles_PM] DEFAULT ((0)) NOT NULL,
    [PN]                                           BIT             CONSTRAINT [DF_CompositeRoles_PN] DEFAULT ((0)) NOT NULL,
    [PO]                                           BIT             CONSTRAINT [DF_CompositeRoles_PO] DEFAULT ((0)) NOT NULL,
    [PP]                                           BIT             CONSTRAINT [DF_CompositeRoles_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                                           BIT             CONSTRAINT [DF_CompositeRoles_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                                           BIT             CONSTRAINT [DF_CompositeRoles_PR] DEFAULT ((0)) NOT NULL,
    [PS]                                           BIT             CONSTRAINT [DF_CompositeRoles_PS] DEFAULT ((0)) NOT NULL,
    [PT]                                           BIT             CONSTRAINT [DF_CompositeRoles_PT] DEFAULT ((0)) NOT NULL,
    [PU]                                           BIT             CONSTRAINT [DF_CompositeRoles_PU] DEFAULT ((0)) NOT NULL,
    [PV]                                           BIT             CONSTRAINT [DF_CompositeRoles_PV] DEFAULT ((0)) NOT NULL,
    [P10]                                          BIT             CONSTRAINT [DF_CompositeRoles_P10] DEFAULT ((0)) NOT NULL,
    [P11]                                          BIT             CONSTRAINT [DF_CompositeRoles_P11] DEFAULT ((0)) NOT NULL,
    [P12]                                          BIT             CONSTRAINT [DF_CompositeRoles_P12] DEFAULT ((0)) NOT NULL,
    [P13]                                          BIT             CONSTRAINT [DF_CompositeRoles_P13] DEFAULT ((0)) NOT NULL,
    [P14]                                          BIT             CONSTRAINT [DF_CompositeRoles_P14] DEFAULT ((0)) NOT NULL,
    [P15]                                          BIT             CONSTRAINT [DF_CompositeRoles_P15] DEFAULT ((0)) NOT NULL,
    [P16]                                          BIT             CONSTRAINT [DF_CompositeRoles_P16] DEFAULT ((0)) NOT NULL,
    [P17]                                          BIT             CONSTRAINT [DF_CompositeRoles_P17] DEFAULT ((0)) NOT NULL,
    [P18]                                          BIT             CONSTRAINT [DF_CompositeRoles_P18] DEFAULT ((0)) NOT NULL,
    [P19]                                          BIT             CONSTRAINT [DF_CompositeRoles_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                                          BIT             CONSTRAINT [DF_CompositeRoles_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                                          BIT             CONSTRAINT [DF_CompositeRoles_P20] DEFAULT ((0)) NOT NULL,
    [P21]                                          BIT             CONSTRAINT [DF_CompositeRoles_P21] DEFAULT ((0)) NOT NULL,
    [P22]                                          BIT             CONSTRAINT [DF_CompositeRoles_P22] DEFAULT ((0)) NOT NULL,
    [P23]                                          BIT             CONSTRAINT [DF_CompositeRoles_P23] DEFAULT ((0)) NOT NULL,
    [P24]                                          BIT             CONSTRAINT [DF_CompositeRoles_P24] DEFAULT ((0)) NOT NULL,
    [P25]                                          BIT             CONSTRAINT [DF_CompositeRoles_P25] DEFAULT ((0)) NOT NULL,
    [P26]                                          BIT             CONSTRAINT [DF_CompositeRoles_P26] DEFAULT ((0)) NOT NULL,
    [P27]                                          BIT             CONSTRAINT [DF_CompositeRoles_P27] DEFAULT ((0)) NOT NULL,
    [P28]                                          BIT             CONSTRAINT [DF_CompositeRoles_P28] DEFAULT ((0)) NOT NULL,
    [P29]                                          BIT             CONSTRAINT [DF_CompositeRoles_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                                          BIT             CONSTRAINT [DF_CompositeRoles_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                                          BIT             CONSTRAINT [DF_CompositeRoles_P30] DEFAULT ((0)) NOT NULL,
    [P31]                                          BIT             CONSTRAINT [DF_CompositeRoles_P31] DEFAULT ((0)) NOT NULL,
    [P32]                                          BIT             CONSTRAINT [DF_CompositeRoles_P32] DEFAULT ((0)) NOT NULL,
    [P33]                                          BIT             CONSTRAINT [DF_CompositeRoles_P33] DEFAULT ((0)) NOT NULL,
    [P34]                                          BIT             CONSTRAINT [DF_CompositeRoles_P34] DEFAULT ((0)) NOT NULL,
    [P35]                                          BIT             CONSTRAINT [DF_CompositeRoles_P35] DEFAULT ((0)) NOT NULL,
    [P36]                                          BIT             CONSTRAINT [DF_CompositeRoles_P36] DEFAULT ((0)) NOT NULL,
    [P37]                                          BIT             CONSTRAINT [DF_CompositeRoles_P37] DEFAULT ((0)) NOT NULL,
    [P38]                                          BIT             CONSTRAINT [DF_CompositeRoles_P38] DEFAULT ((0)) NOT NULL,
    [P39]                                          BIT             CONSTRAINT [DF_CompositeRoles_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                                          BIT             CONSTRAINT [DF_CompositeRoles_P3V] DEFAULT ((0)) NOT NULL,
    [WhenCreated]                                  SMALLDATETIME   NULL,
    [CreatedBy_Id]                                 BIGINT          NULL,
    [WhenChanged]                                  SMALLDATETIME   NULL,
    [ChangedBy_Id]                                 BIGINT          NULL,
    [BaseRole_Id]                                  BIGINT          NULL,
    [R0]                                           BIT             CONSTRAINT [DF_CompositeRoles_R0] DEFAULT ((0)) NOT NULL,
    [R1]                                           BIT             CONSTRAINT [DF_CompositeRoles_R1] DEFAULT ((0)) NOT NULL,
    [R2]                                           BIT             CONSTRAINT [DF_CompositeRoles_R2] DEFAULT ((0)) NOT NULL,
    [R3]                                           BIT             CONSTRAINT [DF_CompositeRoles_R3] DEFAULT ((0)) NOT NULL,
    [R4]                                           BIT             CONSTRAINT [DF_CompositeRoles_R4] DEFAULT ((0)) NOT NULL,
    [R5]                                           BIT             CONSTRAINT [DF_CompositeRoles_R5] DEFAULT ((0)) NOT NULL,
    [R6]                                           BIT             CONSTRAINT [DF_CompositeRoles_R6] DEFAULT ((0)) NOT NULL,
    [R7]                                           BIT             CONSTRAINT [DF_CompositeRoles_R7] DEFAULT ((0)) NOT NULL,
    [R8]                                           BIT             CONSTRAINT [DF_CompositeRoles_R8] DEFAULT ((0)) NOT NULL,
    [R9]                                           BIT             CONSTRAINT [DF_CompositeRoles_R9] DEFAULT ((0)) NOT NULL,
    [RA]                                           BIT             CONSTRAINT [DF_CompositeRoles_RA] DEFAULT ((0)) NOT NULL,
    [RB]                                           BIT             CONSTRAINT [DF_CompositeRoles_RB] DEFAULT ((0)) NOT NULL,
    [RC]                                           BIT             CONSTRAINT [DF_CompositeRoles_RC] DEFAULT ((0)) NOT NULL,
    [RD]                                           BIT             CONSTRAINT [DF_CompositeRoles_RD] DEFAULT ((0)) NOT NULL,
    [RE]                                           BIT             CONSTRAINT [DF_CompositeRoles_RE] DEFAULT ((0)) NOT NULL,
    [RF]                                           BIT             CONSTRAINT [DF_CompositeRoles_RF] DEFAULT ((0)) NOT NULL,
    [RG]                                           BIT             CONSTRAINT [DF_CompositeRoles_RG] DEFAULT ((0)) NOT NULL,
    [RH]                                           BIT             CONSTRAINT [DF_CompositeRoles_RH] DEFAULT ((0)) NOT NULL,
    [RI]                                           BIT             CONSTRAINT [DF_CompositeRoles_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                                           BIT             CONSTRAINT [DF_CompositeRoles_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                                           BIT             CONSTRAINT [DF_CompositeRoles_RK] DEFAULT ((0)) NOT NULL,
    [RL]                                           BIT             CONSTRAINT [DF_CompositeRoles_RL] DEFAULT ((0)) NOT NULL,
    [RM]                                           BIT             CONSTRAINT [DF_CompositeRoles_RM] DEFAULT ((0)) NOT NULL,
    [RN]                                           BIT             CONSTRAINT [DF_CompositeRoles_RN] DEFAULT ((0)) NOT NULL,
    [RO]                                           BIT             CONSTRAINT [DF_CompositeRoles_RO] DEFAULT ((0)) NOT NULL,
    [RP]                                           BIT             CONSTRAINT [DF_CompositeRoles_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                                           BIT             CONSTRAINT [DF_CompositeRoles_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                                           BIT             CONSTRAINT [DF_CompositeRoles_RR] DEFAULT ((0)) NOT NULL,
    [RS]                                           BIT             CONSTRAINT [DF_CompositeRoles_RS] DEFAULT ((0)) NOT NULL,
    [RT]                                           BIT             CONSTRAINT [DF_CompositeRoles_RT] DEFAULT ((0)) NOT NULL,
    [RU]                                           BIT             CONSTRAINT [DF_CompositeRoles_RU] DEFAULT ((0)) NOT NULL,
    [RV]                                           BIT             CONSTRAINT [DF_CompositeRoles_RV] DEFAULT ((0)) NOT NULL,
    [R10]                                          BIT             CONSTRAINT [DF_CompositeRoles_R10] DEFAULT ((0)) NOT NULL,
    [R11]                                          BIT             CONSTRAINT [DF_CompositeRoles_R11] DEFAULT ((0)) NOT NULL,
    [R12]                                          BIT             CONSTRAINT [DF_CompositeRoles_R12] DEFAULT ((0)) NOT NULL,
    [R13]                                          BIT             CONSTRAINT [DF_CompositeRoles_R13] DEFAULT ((0)) NOT NULL,
    [R14]                                          BIT             CONSTRAINT [DF_CompositeRoles_R14] DEFAULT ((0)) NOT NULL,
    [R15]                                          BIT             CONSTRAINT [DF_CompositeRoles_R15] DEFAULT ((0)) NOT NULL,
    [R16]                                          BIT             CONSTRAINT [DF_CompositeRoles_R16] DEFAULT ((0)) NOT NULL,
    [R17]                                          BIT             CONSTRAINT [DF_CompositeRoles_R17] DEFAULT ((0)) NOT NULL,
    [R18]                                          BIT             CONSTRAINT [DF_CompositeRoles_R18] DEFAULT ((0)) NOT NULL,
    [R19]                                          BIT             CONSTRAINT [DF_CompositeRoles_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                                          BIT             CONSTRAINT [DF_CompositeRoles_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                                          BIT             CONSTRAINT [DF_CompositeRoles_R20] DEFAULT ((0)) NOT NULL,
    [R21]                                          BIT             CONSTRAINT [DF_CompositeRoles_R21] DEFAULT ((0)) NOT NULL,
    [R22]                                          BIT             CONSTRAINT [DF_CompositeRoles_R22] DEFAULT ((0)) NOT NULL,
    [R23]                                          BIT             CONSTRAINT [DF_CompositeRoles_R23] DEFAULT ((0)) NOT NULL,
    [R24]                                          BIT             CONSTRAINT [DF_CompositeRoles_R24] DEFAULT ((0)) NOT NULL,
    [R25]                                          BIT             CONSTRAINT [DF_CompositeRoles_R25] DEFAULT ((0)) NOT NULL,
    [R26]                                          BIT             CONSTRAINT [DF_CompositeRoles_R26] DEFAULT ((0)) NOT NULL,
    [R27]                                          BIT             CONSTRAINT [DF_CompositeRoles_R27] DEFAULT ((0)) NOT NULL,
    [R28]                                          BIT             CONSTRAINT [DF_CompositeRoles_R28] DEFAULT ((0)) NOT NULL,
    [R29]                                          BIT             CONSTRAINT [DF_CompositeRoles_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                                          BIT             CONSTRAINT [DF_CompositeRoles_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                                          BIT             CONSTRAINT [DF_CompositeRoles_R30] DEFAULT ((0)) NOT NULL,
    [R31]                                          BIT             CONSTRAINT [DF_CompositeRoles_R31] DEFAULT ((0)) NOT NULL,
    [R32]                                          BIT             CONSTRAINT [DF_CompositeRoles_R32] DEFAULT ((0)) NOT NULL,
    [R33]                                          BIT             CONSTRAINT [DF_CompositeRoles_R33] DEFAULT ((0)) NOT NULL,
    [R34]                                          BIT             CONSTRAINT [DF_CompositeRoles_R34] DEFAULT ((0)) NOT NULL,
    [R35]                                          BIT             CONSTRAINT [DF_CompositeRoles_R35] DEFAULT ((0)) NOT NULL,
    [R36]                                          BIT             CONSTRAINT [DF_CompositeRoles_R36] DEFAULT ((0)) NOT NULL,
    [R37]                                          BIT             CONSTRAINT [DF_CompositeRoles_R37] DEFAULT ((0)) NOT NULL,
    [R38]                                          BIT             CONSTRAINT [DF_CompositeRoles_R38] DEFAULT ((0)) NOT NULL,
    [R39]                                          BIT             CONSTRAINT [DF_CompositeRoles_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                                          BIT             CONSTRAINT [DF_CompositeRoles_R3V] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType]                         INT             CONSTRAINT [DF_CompositeRoles_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [HideOnSimplifiedView]                         BIT             CONSTRAINT [DF_CompositeRoles_HideOnSimplifiedView] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnApproveInReview]           TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnApproveInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeclineInReview]           TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnDeclineInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeleteGapInReconciliation] TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnDeleteGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnKeepGapInReconciliation]   TINYINT         CONSTRAINT [DF_CompositeRoles_CommentActivationOnKeepGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [ImplicitApproval]                             TINYINT         CONSTRAINT [DF_CompositeRoles_ImplicitApproval] DEFAULT ((0)) NOT NULL,
    [Identifier]                                   VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]                               NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]                               NVARCHAR (442)  NULL,
    [DisplayName_L3]                               NVARCHAR (442)  NULL,
    [DisplayName_L4]                               NVARCHAR (442)  NULL,
    [DisplayName_L5]                               NVARCHAR (442)  NULL,
    [DisplayName_L6]                               NVARCHAR (442)  NULL,
    [DisplayName_L7]                               NVARCHAR (442)  NULL,
    [DisplayName_L8]                               NVARCHAR (442)  NULL,
    [FullName_L1]                                  NVARCHAR (4000) NULL,
    [FullName_L2]                                  NVARCHAR (4000) NULL,
    [FullName_L3]                                  NVARCHAR (4000) NULL,
    [FullName_L4]                                  NVARCHAR (4000) NULL,
    [FullName_L5]                                  NVARCHAR (4000) NULL,
    [FullName_L6]                                  NVARCHAR (4000) NULL,
    [FullName_L7]                                  NVARCHAR (4000) NULL,
    [FullName_L8]                                  NVARCHAR (4000) NULL,
    [Description_L1]                               NVARCHAR (1024) NULL,
    [Description_L2]                               NVARCHAR (1024) NULL,
    [Description_L3]                               NVARCHAR (1024) NULL,
    [Description_L4]                               NVARCHAR (1024) NULL,
    [Description_L5]                               NVARCHAR (1024) NULL,
    [Description_L6]                               NVARCHAR (1024) NULL,
    [Description_L7]                               NVARCHAR (1024) NULL,
    [Description_L8]                               NVARCHAR (1024) NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_CompositeRoles1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_CompositeRoles_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_CompositeRoles1]
    ON [dbo].[tmp_ms_xx_UP_CompositeRoles]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_CompositeRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_CompositeRoles] ([Id], [ValidTo], [Policy_Id], [EntityType_Id], [Category_Id], [ValidFrom], [P0], [P1], [P2], [P3], [P4], [P5], [P6], [P7], [P8], [P9], [PA], [PB], [PC], [PD], [PE], [PF], [PG], [PH], [PI], [PJ], [PK], [PL], [PM], [PN], [PO], [PP], [PQ], [PR], [PS], [PT], [PU], [PV], [P10], [P11], [P12], [P13], [P14], [P15], [P16], [P17], [P18], [P19], [P1A], [P1B], [P1C], [P1D], [P1E], [P1F], [P1G], [P1H], [P1I], [P1J], [P1K], [P1L], [P1M], [P1N], [P1O], [P1P], [P1Q], [P1R], [P1S], [P1T], [P1U], [P1V], [P20], [P21], [P22], [P23], [P24], [P25], [P26], [P27], [P28], [P29], [P2A], [P2B], [P2C], [P2D], [P2E], [P2F], [P2G], [P2H], [P2I], [P2J], [P2K], [P2L], [P2M], [P2N], [P2O], [P2P], [P2Q], [P2R], [P2S], [P2T], [P2U], [P2V], [P30], [P31], [P32], [P33], [P34], [P35], [P36], [P37], [P38], [P39], [P3A], [P3B], [P3C], [P3D], [P3E], [P3F], [P3G], [P3H], [P3I], [P3J], [P3K], [P3L], [P3M], [P3N], [P3O], [P3P], [P3Q], [P3R], [P3S], [P3T], [P3U], [P3V], [R0], [R1], [R2], [R3], [R4], [R5], [R6], [R7], [R8], [R9], [RA], [RB], [RC], [RD], [RE], [RF], [RG], [RH], [RI], [RJ], [RK], [RL], [RM], [RN], [RO], [RP], [RQ], [RR], [RS], [RT], [RU], [RV], [R10], [R11], [R12], [R13], [R14], [R15], [R16], [R17], [R18], [R19], [R1A], [R1B], [R1C], [R1D], [R1E], [R1F], [R1G], [R1H], [R1I], [R1J], [R1K], [R1L], [R1M], [R1N], [R1O], [R1P], [R1Q], [R1R], [R1S], [R1T], [R1U], [R1V], [R20], [R21], [R22], [R23], [R24], [R25], [R26], [R27], [R28], [R29], [R2A], [R2B], [R2C], [R2D], [R2E], [R2F], [R2G], [R2H], [R2I], [R2J], [R2K], [R2L], [R2M], [R2N], [R2O], [R2P], [R2Q], [R2R], [R2S], [R2T], [R2U], [R2V], [R30], [R31], [R32], [R33], [R34], [R35], [R36], [R37], [R38], [R39], [R3A], [R3B], [R3C], [R3D], [R3E], [R3F], [R3G], [R3H], [R3I], [R3J], [R3K], [R3L], [R3M], [R3N], [R3O], [R3P], [R3Q], [R3R], [R3S], [R3T], [R3U], [R3V], [ApprovalWorkflowType], [HideOnSimplifiedView], [CommentActivationOnApproveInReview], [CommentActivationOnDeclineInReview], [CommentActivationOnDeleteGapInReconciliation], [CommentActivationOnKeepGapInReconciliation], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [FullName_L1], [FullName_L2], [FullName_L3], [FullName_L4], [FullName_L5], [FullName_L6], [FullName_L7], [FullName_L8], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8])
        SELECT   [Id],
                 [ValidTo],
                 [Policy_Id],
                 [EntityType_Id],
                 [Category_Id],
                 [ValidFrom],
                 [P0],
                 [P1],
                 [P2],
                 [P3],
                 [P4],
                 [P5],
                 [P6],
                 [P7],
                 [P8],
                 [P9],
                 [PA],
                 [PB],
                 [PC],
                 [PD],
                 [PE],
                 [PF],
                 [PG],
                 [PH],
                 [PI],
                 [PJ],
                 [PK],
                 [PL],
                 [PM],
                 [PN],
                 [PO],
                 [PP],
                 [PQ],
                 [PR],
                 [PS],
                 [PT],
                 [PU],
                 [PV],
                 [P10],
                 [P11],
                 [P12],
                 [P13],
                 [P14],
                 [P15],
                 [P16],
                 [P17],
                 [P18],
                 [P19],
                 [P1A],
                 [P1B],
                 [P1C],
                 [P1D],
                 [P1E],
                 [P1F],
                 [P1G],
                 [P1H],
                 [P1I],
                 [P1J],
                 [P1K],
                 [P1L],
                 [P1M],
                 [P1N],
                 [P1O],
                 [P1P],
                 [P1Q],
                 [P1R],
                 [P1S],
                 [P1T],
                 [P1U],
                 [P1V],
                 [P20],
                 [P21],
                 [P22],
                 [P23],
                 [P24],
                 [P25],
                 [P26],
                 [P27],
                 [P28],
                 [P29],
                 [P2A],
                 [P2B],
                 [P2C],
                 [P2D],
                 [P2E],
                 [P2F],
                 [P2G],
                 [P2H],
                 [P2I],
                 [P2J],
                 [P2K],
                 [P2L],
                 [P2M],
                 [P2N],
                 [P2O],
                 [P2P],
                 [P2Q],
                 [P2R],
                 [P2S],
                 [P2T],
                 [P2U],
                 [P2V],
                 [P30],
                 [P31],
                 [P32],
                 [P33],
                 [P34],
                 [P35],
                 [P36],
                 [P37],
                 [P38],
                 [P39],
                 [P3A],
                 [P3B],
                 [P3C],
                 [P3D],
                 [P3E],
                 [P3F],
                 [P3G],
                 [P3H],
                 [P3I],
                 [P3J],
                 [P3K],
                 [P3L],
                 [P3M],
                 [P3N],
                 [P3O],
                 [P3P],
                 [P3Q],
                 [P3R],
                 [P3S],
                 [P3T],
                 [P3U],
                 [P3V],
                 [R0],
                 [R1],
                 [R2],
                 [R3],
                 [R4],
                 [R5],
                 [R6],
                 [R7],
                 [R8],
                 [R9],
                 [RA],
                 [RB],
                 [RC],
                 [RD],
                 [RE],
                 [RF],
                 [RG],
                 [RH],
                 [RI],
                 [RJ],
                 [RK],
                 [RL],
                 [RM],
                 [RN],
                 [RO],
                 [RP],
                 [RQ],
                 [RR],
                 [RS],
                 [RT],
                 [RU],
                 [RV],
                 [R10],
                 [R11],
                 [R12],
                 [R13],
                 [R14],
                 [R15],
                 [R16],
                 [R17],
                 [R18],
                 [R19],
                 [R1A],
                 [R1B],
                 [R1C],
                 [R1D],
                 [R1E],
                 [R1F],
                 [R1G],
                 [R1H],
                 [R1I],
                 [R1J],
                 [R1K],
                 [R1L],
                 [R1M],
                 [R1N],
                 [R1O],
                 [R1P],
                 [R1Q],
                 [R1R],
                 [R1S],
                 [R1T],
                 [R1U],
                 [R1V],
                 [R20],
                 [R21],
                 [R22],
                 [R23],
                 [R24],
                 [R25],
                 [R26],
                 [R27],
                 [R28],
                 [R29],
                 [R2A],
                 [R2B],
                 [R2C],
                 [R2D],
                 [R2E],
                 [R2F],
                 [R2G],
                 [R2H],
                 [R2I],
                 [R2J],
                 [R2K],
                 [R2L],
                 [R2M],
                 [R2N],
                 [R2O],
                 [R2P],
                 [R2Q],
                 [R2R],
                 [R2S],
                 [R2T],
                 [R2U],
                 [R2V],
                 [R30],
                 [R31],
                 [R32],
                 [R33],
                 [R34],
                 [R35],
                 [R36],
                 [R37],
                 [R38],
                 [R39],
                 [R3A],
                 [R3B],
                 [R3C],
                 [R3D],
                 [R3E],
                 [R3F],
                 [R3G],
                 [R3H],
                 [R3I],
                 [R3J],
                 [R3K],
                 [R3L],
                 [R3M],
                 [R3N],
                 [R3O],
                 [R3P],
                 [R3Q],
                 [R3R],
                 [R3S],
                 [R3T],
                 [R3U],
                 [R3V],
                 [ApprovalWorkflowType],
                 [HideOnSimplifiedView],
                 [CommentActivationOnApproveInReview],
                 [CommentActivationOnDeclineInReview],
                 [CommentActivationOnDeleteGapInReconciliation],
                 [CommentActivationOnKeepGapInReconciliation],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [FullName_L1],
                 [FullName_L2],
                 [FullName_L3],
                 [FullName_L4],
                 [FullName_L5],
                 [FullName_L6],
                 [FullName_L7],
                 [FullName_L8],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8]
        FROM     [dbo].[UP_CompositeRoles]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_CompositeRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_CompositeRoles]', N'UP_CompositeRoles';

EXECUTE sp_rename N'[dbo].[UP_CompositeRoles].[tmp_ms_xx_index_IX_CompositeRoles1]', N'IX_CompositeRoles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_CompositeRoles1]', N'PK_CompositeRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_CompositeRoles_Identifier1]', N'U_CompositeRoles_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UP_CompositeRoles].[IX_CompositeRoles_View_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_CompositeRoles_View_L1]
    ON [dbo].[UP_CompositeRoles]([EntityType_Id] ASC, [FullName_L1] ASC, [Id] ASC)
    INCLUDE([DisplayName_L1], [Identifier], [ApprovalWorkflowType], [Policy_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);


GO
PRINT N'Starting rebuilding table [dbo].[UP_ContextRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ContextRules] (
    [Id]                       BIGINT         NOT NULL,
    [Policy_Id]                BIGINT         NOT NULL,
    [SourceEntityType_Id]      BIGINT         NOT NULL,
    [Identifier]               VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]           NVARCHAR (442) NOT NULL,
    [DisplayName_L2]           NVARCHAR (442) NULL,
    [DisplayName_L3]           NVARCHAR (442) NULL,
    [DisplayName_L4]           NVARCHAR (442) NULL,
    [DisplayName_L5]           NVARCHAR (442) NULL,
    [DisplayName_L6]           NVARCHAR (442) NULL,
    [DisplayName_L7]           NVARCHAR (442) NULL,
    [DisplayName_L8]           NVARCHAR (442) NULL,
    [ResourcesBinding_Id]      BIGINT         NULL,
    [ResourcesExpression]      VARCHAR (4000) NULL,
    [ResourcesStartBinding_Id] BIGINT         NULL,
    [ResourcesStartExpression] VARCHAR (4000) NULL,
    [ResourcesEndBinding_Id]   BIGINT         NULL,
    [ResourcesEndExpression]   VARCHAR (4000) NULL,
    [ExcludeExpression]        VARCHAR (4000) NULL,
    [RiskFactorType]           TINYINT        NULL,
    [WhenCreated]              SMALLDATETIME  NULL,
    [CreatedBy_Id]             BIGINT         NULL,
    [WhenChanged]              SMALLDATETIME  NULL,
    [ChangedBy_Id]             BIGINT         NULL,
    [B0_Id]                    BIGINT         NULL,
    [B1_Id]                    BIGINT         NULL,
    [B2_Id]                    BIGINT         NULL,
    [B3_Id]                    BIGINT         NULL,
    [B4_Id]                    BIGINT         NULL,
    [B5_Id]                    BIGINT         NULL,
    [B6_Id]                    BIGINT         NULL,
    [B7_Id]                    BIGINT         NULL,
    [B8_Id]                    BIGINT         NULL,
    [B9_Id]                    BIGINT         NULL,
    [BA_Id]                    BIGINT         NULL,
    [BB_Id]                    BIGINT         NULL,
    [BC_Id]                    BIGINT         NULL,
    [BD_Id]                    BIGINT         NULL,
    [BE_Id]                    BIGINT         NULL,
    [BF_Id]                    BIGINT         NULL,
    [BG_Id]                    BIGINT         NULL,
    [BH_Id]                    BIGINT         NULL,
    [BI_Id]                    BIGINT         NULL,
    [BJ_Id]                    BIGINT         NULL,
    [BK_Id]                    BIGINT         NULL,
    [BL_Id]                    BIGINT         NULL,
    [BM_Id]                    BIGINT         NULL,
    [BN_Id]                    BIGINT         NULL,
    [BO_Id]                    BIGINT         NULL,
    [BP_Id]                    BIGINT         NULL,
    [BQ_Id]                    BIGINT         NULL,
    [BR_Id]                    BIGINT         NULL,
    [BS_Id]                    BIGINT         NULL,
    [BT_Id]                    BIGINT         NULL,
    [BU_Id]                    BIGINT         NULL,
    [BV_Id]                    BIGINT         NULL,
    [B10_Id]                   BIGINT         NULL,
    [B11_Id]                   BIGINT         NULL,
    [B12_Id]                   BIGINT         NULL,
    [B13_Id]                   BIGINT         NULL,
    [B14_Id]                   BIGINT         NULL,
    [B15_Id]                   BIGINT         NULL,
    [B16_Id]                   BIGINT         NULL,
    [B17_Id]                   BIGINT         NULL,
    [B18_Id]                   BIGINT         NULL,
    [B19_Id]                   BIGINT         NULL,
    [B1A_Id]                   BIGINT         NULL,
    [B1B_Id]                   BIGINT         NULL,
    [B1C_Id]                   BIGINT         NULL,
    [B1D_Id]                   BIGINT         NULL,
    [B1E_Id]                   BIGINT         NULL,
    [B1F_Id]                   BIGINT         NULL,
    [B1G_Id]                   BIGINT         NULL,
    [B1H_Id]                   BIGINT         NULL,
    [B1I_Id]                   BIGINT         NULL,
    [B1J_Id]                   BIGINT         NULL,
    [B1K_Id]                   BIGINT         NULL,
    [B1L_Id]                   BIGINT         NULL,
    [B1M_Id]                   BIGINT         NULL,
    [B1N_Id]                   BIGINT         NULL,
    [B1O_Id]                   BIGINT         NULL,
    [B1P_Id]                   BIGINT         NULL,
    [B1Q_Id]                   BIGINT         NULL,
    [B1R_Id]                   BIGINT         NULL,
    [B1S_Id]                   BIGINT         NULL,
    [B1T_Id]                   BIGINT         NULL,
    [B1U_Id]                   BIGINT         NULL,
    [B1V_Id]                   BIGINT         NULL,
    [B20_Id]                   BIGINT         NULL,
    [B21_Id]                   BIGINT         NULL,
    [B22_Id]                   BIGINT         NULL,
    [B23_Id]                   BIGINT         NULL,
    [B24_Id]                   BIGINT         NULL,
    [B25_Id]                   BIGINT         NULL,
    [B26_Id]                   BIGINT         NULL,
    [B27_Id]                   BIGINT         NULL,
    [B28_Id]                   BIGINT         NULL,
    [B29_Id]                   BIGINT         NULL,
    [B2A_Id]                   BIGINT         NULL,
    [B2B_Id]                   BIGINT         NULL,
    [B2C_Id]                   BIGINT         NULL,
    [B2D_Id]                   BIGINT         NULL,
    [B2E_Id]                   BIGINT         NULL,
    [B2F_Id]                   BIGINT         NULL,
    [B2G_Id]                   BIGINT         NULL,
    [B2H_Id]                   BIGINT         NULL,
    [B2I_Id]                   BIGINT         NULL,
    [B2J_Id]                   BIGINT         NULL,
    [B2K_Id]                   BIGINT         NULL,
    [B2L_Id]                   BIGINT         NULL,
    [B2M_Id]                   BIGINT         NULL,
    [B2N_Id]                   BIGINT         NULL,
    [B2O_Id]                   BIGINT         NULL,
    [B2P_Id]                   BIGINT         NULL,
    [B2Q_Id]                   BIGINT         NULL,
    [B2R_Id]                   BIGINT         NULL,
    [B2S_Id]                   BIGINT         NULL,
    [B2T_Id]                   BIGINT         NULL,
    [B2U_Id]                   BIGINT         NULL,
    [B2V_Id]                   BIGINT         NULL,
    [B30_Id]                   BIGINT         NULL,
    [B31_Id]                   BIGINT         NULL,
    [B32_Id]                   BIGINT         NULL,
    [B33_Id]                   BIGINT         NULL,
    [B34_Id]                   BIGINT         NULL,
    [B35_Id]                   BIGINT         NULL,
    [B36_Id]                   BIGINT         NULL,
    [B37_Id]                   BIGINT         NULL,
    [B38_Id]                   BIGINT         NULL,
    [B39_Id]                   BIGINT         NULL,
    [B3A_Id]                   BIGINT         NULL,
    [B3B_Id]                   BIGINT         NULL,
    [B3C_Id]                   BIGINT         NULL,
    [B3D_Id]                   BIGINT         NULL,
    [B3E_Id]                   BIGINT         NULL,
    [B3F_Id]                   BIGINT         NULL,
    [B3G_Id]                   BIGINT         NULL,
    [B3H_Id]                   BIGINT         NULL,
    [B3I_Id]                   BIGINT         NULL,
    [B3J_Id]                   BIGINT         NULL,
    [B3K_Id]                   BIGINT         NULL,
    [B3L_Id]                   BIGINT         NULL,
    [B3M_Id]                   BIGINT         NULL,
    [B3N_Id]                   BIGINT         NULL,
    [B3O_Id]                   BIGINT         NULL,
    [B3P_Id]                   BIGINT         NULL,
    [B3Q_Id]                   BIGINT         NULL,
    [B3R_Id]                   BIGINT         NULL,
    [B3S_Id]                   BIGINT         NULL,
    [B3T_Id]                   BIGINT         NULL,
    [B3U_Id]                   BIGINT         NULL,
    [B3V_Id]                   BIGINT         NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ContextRules1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ContextRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ContextRules] ([Id], [Policy_Id], [SourceEntityType_Id], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [ResourcesBinding_Id], [ResourcesExpression], [ResourcesStartBinding_Id], [ResourcesStartExpression], [ResourcesEndBinding_Id], [ResourcesEndExpression], [ExcludeExpression], [RiskFactorType], [B0_Id], [B1_Id], [B2_Id], [B3_Id], [B4_Id], [B5_Id], [B6_Id], [B7_Id], [B8_Id], [B9_Id], [BA_Id], [BB_Id], [BC_Id], [BD_Id], [BE_Id], [BF_Id], [BG_Id], [BH_Id], [BI_Id], [BJ_Id], [BK_Id], [BL_Id], [BM_Id], [BN_Id], [BO_Id], [BP_Id], [BQ_Id], [BR_Id], [BS_Id], [BT_Id], [BU_Id], [BV_Id], [B10_Id], [B11_Id], [B12_Id], [B13_Id], [B14_Id], [B15_Id], [B16_Id], [B17_Id], [B18_Id], [B19_Id], [B1A_Id], [B1B_Id], [B1C_Id], [B1D_Id], [B1E_Id], [B1F_Id], [B1G_Id], [B1H_Id], [B1I_Id], [B1J_Id], [B1K_Id], [B1L_Id], [B1M_Id], [B1N_Id], [B1O_Id], [B1P_Id], [B1Q_Id], [B1R_Id], [B1S_Id], [B1T_Id], [B1U_Id], [B1V_Id], [B20_Id], [B21_Id], [B22_Id], [B23_Id], [B24_Id], [B25_Id], [B26_Id], [B27_Id], [B28_Id], [B29_Id], [B2A_Id], [B2B_Id], [B2C_Id], [B2D_Id], [B2E_Id], [B2F_Id], [B2G_Id], [B2H_Id], [B2I_Id], [B2J_Id], [B2K_Id], [B2L_Id], [B2M_Id], [B2N_Id], [B2O_Id], [B2P_Id], [B2Q_Id], [B2R_Id], [B2S_Id], [B2T_Id], [B2U_Id], [B2V_Id], [B30_Id], [B31_Id], [B32_Id], [B33_Id], [B34_Id], [B35_Id], [B36_Id], [B37_Id], [B38_Id], [B39_Id], [B3A_Id], [B3B_Id], [B3C_Id], [B3D_Id], [B3E_Id], [B3F_Id], [B3G_Id], [B3H_Id], [B3I_Id], [B3J_Id], [B3K_Id], [B3L_Id], [B3M_Id], [B3N_Id], [B3O_Id], [B3P_Id], [B3Q_Id], [B3R_Id], [B3S_Id], [B3T_Id], [B3U_Id], [B3V_Id])
        SELECT   [Id],
                 [Policy_Id],
                 [SourceEntityType_Id],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [ResourcesBinding_Id],
                 [ResourcesExpression],
                 [ResourcesStartBinding_Id],
                 [ResourcesStartExpression],
                 [ResourcesEndBinding_Id],
                 [ResourcesEndExpression],
                 [ExcludeExpression],
                 [RiskFactorType],
                 [B0_Id],
                 [B1_Id],
                 [B2_Id],
                 [B3_Id],
                 [B4_Id],
                 [B5_Id],
                 [B6_Id],
                 [B7_Id],
                 [B8_Id],
                 [B9_Id],
                 [BA_Id],
                 [BB_Id],
                 [BC_Id],
                 [BD_Id],
                 [BE_Id],
                 [BF_Id],
                 [BG_Id],
                 [BH_Id],
                 [BI_Id],
                 [BJ_Id],
                 [BK_Id],
                 [BL_Id],
                 [BM_Id],
                 [BN_Id],
                 [BO_Id],
                 [BP_Id],
                 [BQ_Id],
                 [BR_Id],
                 [BS_Id],
                 [BT_Id],
                 [BU_Id],
                 [BV_Id],
                 [B10_Id],
                 [B11_Id],
                 [B12_Id],
                 [B13_Id],
                 [B14_Id],
                 [B15_Id],
                 [B16_Id],
                 [B17_Id],
                 [B18_Id],
                 [B19_Id],
                 [B1A_Id],
                 [B1B_Id],
                 [B1C_Id],
                 [B1D_Id],
                 [B1E_Id],
                 [B1F_Id],
                 [B1G_Id],
                 [B1H_Id],
                 [B1I_Id],
                 [B1J_Id],
                 [B1K_Id],
                 [B1L_Id],
                 [B1M_Id],
                 [B1N_Id],
                 [B1O_Id],
                 [B1P_Id],
                 [B1Q_Id],
                 [B1R_Id],
                 [B1S_Id],
                 [B1T_Id],
                 [B1U_Id],
                 [B1V_Id],
                 [B20_Id],
                 [B21_Id],
                 [B22_Id],
                 [B23_Id],
                 [B24_Id],
                 [B25_Id],
                 [B26_Id],
                 [B27_Id],
                 [B28_Id],
                 [B29_Id],
                 [B2A_Id],
                 [B2B_Id],
                 [B2C_Id],
                 [B2D_Id],
                 [B2E_Id],
                 [B2F_Id],
                 [B2G_Id],
                 [B2H_Id],
                 [B2I_Id],
                 [B2J_Id],
                 [B2K_Id],
                 [B2L_Id],
                 [B2M_Id],
                 [B2N_Id],
                 [B2O_Id],
                 [B2P_Id],
                 [B2Q_Id],
                 [B2R_Id],
                 [B2S_Id],
                 [B2T_Id],
                 [B2U_Id],
                 [B2V_Id],
                 [B30_Id],
                 [B31_Id],
                 [B32_Id],
                 [B33_Id],
                 [B34_Id],
                 [B35_Id],
                 [B36_Id],
                 [B37_Id],
                 [B38_Id],
                 [B39_Id],
                 [B3A_Id],
                 [B3B_Id],
                 [B3C_Id],
                 [B3D_Id],
                 [B3E_Id],
                 [B3F_Id],
                 [B3G_Id],
                 [B3H_Id],
                 [B3I_Id],
                 [B3J_Id],
                 [B3K_Id],
                 [B3L_Id],
                 [B3M_Id],
                 [B3N_Id],
                 [B3O_Id],
                 [B3P_Id],
                 [B3Q_Id],
                 [B3R_Id],
                 [B3S_Id],
                 [B3T_Id],
                 [B3U_Id],
                 [B3V_Id]
        FROM     [dbo].[UP_ContextRules]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_ContextRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ContextRules]', N'UP_ContextRules';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ContextRules1]', N'PK_ContextRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UP_IndirectResourceRules]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Starting rebuilding table [dbo].[UP_Policies]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_Policies] (
    [Id]                                           BIGINT         NOT NULL,
    [IsProvisioningEnabled]                        BIT            CONSTRAINT [DF_Policies_IsProvisioningEnabled] DEFAULT ((0)) NOT NULL,
    [IsSimulationEnabled]                          BIT            CONSTRAINT [DF_Policies_IsSimumationEnabled] DEFAULT ((0)) NOT NULL,
    [IsExternal]                                   BIT            CONSTRAINT [DF_Policies_IsExternal] DEFAULT ((0)) NOT NULL,
    [HasImplicitApproval]                          BIT            CONSTRAINT [DF_Policies_HasImplicitApproval] DEFAULT ((0)) NOT NULL,
    [Identifier]                                   VARCHAR (442)  COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ValidFrom]                                    DATETIME2 (2)  CONSTRAINT [DF_Policies_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                      DATETIME2 (2)  CONSTRAINT [DF_Policies_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [DisplayName_L1]                               NVARCHAR (442) NOT NULL,
    [DisplayName_L2]                               NVARCHAR (442) NULL,
    [DisplayName_L3]                               NVARCHAR (442) NULL,
    [DisplayName_L4]                               NVARCHAR (442) NULL,
    [DisplayName_L5]                               NVARCHAR (442) NULL,
    [DisplayName_L6]                               NVARCHAR (442) NULL,
    [DisplayName_L7]                               NVARCHAR (442) NULL,
    [DisplayName_L8]                               NVARCHAR (442) NULL,
    [CommentActivationOnApproveInReview]           TINYINT        CONSTRAINT [DF_Policies_CommentActivationOnApproveInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeclineInReview]           TINYINT        CONSTRAINT [DF_Policies_CommentActivationOnDeclineInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeleteGapInReconciliation] TINYINT        CONSTRAINT [DF_Policies_CommentActivationOnDeleteGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnKeepGapInReconciliation]   TINYINT        CONSTRAINT [DF_Policies_CommentActivationOnKeepGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [WhenCreated]                                  SMALLDATETIME  NULL,
    [CreatedBy_Id]                                 BIGINT         NULL,
    [WhenChanged]                                  SMALLDATETIME  NULL,
    [ChangedBy_Id]                                 BIGINT         NULL,
    [PolicyProvisioning_Id]                        BIGINT         NULL,
    [PolicySimulation_Id]                          BIGINT         NULL,
    [D0_Id]                                        BIGINT         NULL,
    [D1_Id]                                        BIGINT         NULL,
    [D2_Id]                                        BIGINT         NULL,
    [D3_Id]                                        BIGINT         NULL,
    [D4_Id]                                        BIGINT         NULL,
    [D5_Id]                                        BIGINT         NULL,
    [D6_Id]                                        BIGINT         NULL,
    [D7_Id]                                        BIGINT         NULL,
    [D8_Id]                                        BIGINT         NULL,
    [D9_Id]                                        BIGINT         NULL,
    [DA_Id]                                        BIGINT         NULL,
    [DB_Id]                                        BIGINT         NULL,
    [DC_Id]                                        BIGINT         NULL,
    [DD_Id]                                        BIGINT         NULL,
    [DE_Id]                                        BIGINT         NULL,
    [DF_Id]                                        BIGINT         NULL,
    [DG_Id]                                        BIGINT         NULL,
    [DH_Id]                                        BIGINT         NULL,
    [DI_Id]                                        BIGINT         NULL,
    [DJ_Id]                                        BIGINT         NULL,
    [DK_Id]                                        BIGINT         NULL,
    [DL_Id]                                        BIGINT         NULL,
    [DM_Id]                                        BIGINT         NULL,
    [DN_Id]                                        BIGINT         NULL,
    [DO_Id]                                        BIGINT         NULL,
    [DP_Id]                                        BIGINT         NULL,
    [DQ_Id]                                        BIGINT         NULL,
    [DR_Id]                                        BIGINT         NULL,
    [DS_Id]                                        BIGINT         NULL,
    [DT_Id]                                        BIGINT         NULL,
    [DU_Id]                                        BIGINT         NULL,
    [DV_Id]                                        BIGINT         NULL,
    [D10_Id]                                       BIGINT         NULL,
    [D11_Id]                                       BIGINT         NULL,
    [D12_Id]                                       BIGINT         NULL,
    [D13_Id]                                       BIGINT         NULL,
    [D14_Id]                                       BIGINT         NULL,
    [D15_Id]                                       BIGINT         NULL,
    [D16_Id]                                       BIGINT         NULL,
    [D17_Id]                                       BIGINT         NULL,
    [D18_Id]                                       BIGINT         NULL,
    [D19_Id]                                       BIGINT         NULL,
    [D1A_Id]                                       BIGINT         NULL,
    [D1B_Id]                                       BIGINT         NULL,
    [D1C_Id]                                       BIGINT         NULL,
    [D1D_Id]                                       BIGINT         NULL,
    [D1E_Id]                                       BIGINT         NULL,
    [D1F_Id]                                       BIGINT         NULL,
    [D1G_Id]                                       BIGINT         NULL,
    [D1H_Id]                                       BIGINT         NULL,
    [D1I_Id]                                       BIGINT         NULL,
    [D1J_Id]                                       BIGINT         NULL,
    [D1K_Id]                                       BIGINT         NULL,
    [D1L_Id]                                       BIGINT         NULL,
    [D1M_Id]                                       BIGINT         NULL,
    [D1N_Id]                                       BIGINT         NULL,
    [D1O_Id]                                       BIGINT         NULL,
    [D1P_Id]                                       BIGINT         NULL,
    [D1Q_Id]                                       BIGINT         NULL,
    [D1R_Id]                                       BIGINT         NULL,
    [D1S_Id]                                       BIGINT         NULL,
    [D1T_Id]                                       BIGINT         NULL,
    [D1U_Id]                                       BIGINT         NULL,
    [D1V_Id]                                       BIGINT         NULL,
    [D20_Id]                                       BIGINT         NULL,
    [D21_Id]                                       BIGINT         NULL,
    [D22_Id]                                       BIGINT         NULL,
    [D23_Id]                                       BIGINT         NULL,
    [D24_Id]                                       BIGINT         NULL,
    [D25_Id]                                       BIGINT         NULL,
    [D26_Id]                                       BIGINT         NULL,
    [D27_Id]                                       BIGINT         NULL,
    [D28_Id]                                       BIGINT         NULL,
    [D29_Id]                                       BIGINT         NULL,
    [D2A_Id]                                       BIGINT         NULL,
    [D2B_Id]                                       BIGINT         NULL,
    [D2C_Id]                                       BIGINT         NULL,
    [D2D_Id]                                       BIGINT         NULL,
    [D2E_Id]                                       BIGINT         NULL,
    [D2F_Id]                                       BIGINT         NULL,
    [D2G_Id]                                       BIGINT         NULL,
    [D2H_Id]                                       BIGINT         NULL,
    [D2I_Id]                                       BIGINT         NULL,
    [D2J_Id]                                       BIGINT         NULL,
    [D2K_Id]                                       BIGINT         NULL,
    [D2L_Id]                                       BIGINT         NULL,
    [D2M_Id]                                       BIGINT         NULL,
    [D2N_Id]                                       BIGINT         NULL,
    [D2O_Id]                                       BIGINT         NULL,
    [D2P_Id]                                       BIGINT         NULL,
    [D2Q_Id]                                       BIGINT         NULL,
    [D2R_Id]                                       BIGINT         NULL,
    [D2S_Id]                                       BIGINT         NULL,
    [D2T_Id]                                       BIGINT         NULL,
    [D2U_Id]                                       BIGINT         NULL,
    [D2V_Id]                                       BIGINT         NULL,
    [D30_Id]                                       BIGINT         NULL,
    [D31_Id]                                       BIGINT         NULL,
    [D32_Id]                                       BIGINT         NULL,
    [D33_Id]                                       BIGINT         NULL,
    [D34_Id]                                       BIGINT         NULL,
    [D35_Id]                                       BIGINT         NULL,
    [D36_Id]                                       BIGINT         NULL,
    [D37_Id]                                       BIGINT         NULL,
    [D38_Id]                                       BIGINT         NULL,
    [D39_Id]                                       BIGINT         NULL,
    [D3A_Id]                                       BIGINT         NULL,
    [D3B_Id]                                       BIGINT         NULL,
    [D3C_Id]                                       BIGINT         NULL,
    [D3D_Id]                                       BIGINT         NULL,
    [D3E_Id]                                       BIGINT         NULL,
    [D3F_Id]                                       BIGINT         NULL,
    [D3G_Id]                                       BIGINT         NULL,
    [D3H_Id]                                       BIGINT         NULL,
    [D3I_Id]                                       BIGINT         NULL,
    [D3J_Id]                                       BIGINT         NULL,
    [D3K_Id]                                       BIGINT         NULL,
    [D3L_Id]                                       BIGINT         NULL,
    [D3M_Id]                                       BIGINT         NULL,
    [D3N_Id]                                       BIGINT         NULL,
    [D3O_Id]                                       BIGINT         NULL,
    [D3P_Id]                                       BIGINT         NULL,
    [D3Q_Id]                                       BIGINT         NULL,
    [D3R_Id]                                       BIGINT         NULL,
    [D3S_Id]                                       BIGINT         NULL,
    [D3T_Id]                                       BIGINT         NULL,
    [D3U_Id]                                       BIGINT         NULL,
    [D3V_Id]                                       BIGINT         NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Policies1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Policies_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_Policies1]
    ON [dbo].[tmp_ms_xx_UP_Policies]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_Policies])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_Policies] ([Id], [ValidTo], [IsProvisioningEnabled], [IsSimulationEnabled], [IsExternal], [Identifier], [ValidFrom], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [CommentActivationOnApproveInReview], [CommentActivationOnDeclineInReview], [CommentActivationOnDeleteGapInReconciliation], [CommentActivationOnKeepGapInReconciliation], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [Id],
                 [ValidTo],
                 [IsProvisioningEnabled],
                 [IsSimulationEnabled],
                 [IsExternal],
                 [Identifier],
                 [ValidFrom],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [CommentActivationOnApproveInReview],
                 [CommentActivationOnDeclineInReview],
                 [CommentActivationOnDeleteGapInReconciliation],
                 [CommentActivationOnKeepGapInReconciliation],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_Policies]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_Policies];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_Policies]', N'UP_Policies';

EXECUTE sp_rename N'[dbo].[UP_Policies].[tmp_ms_xx_index_IX_Policies1]', N'IX_Policies', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Policies1]', N'PK_Policies', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Policies_Identifier1]', N'U_Policies_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UP_RecordProperties]...';


GO
ALTER TABLE [dbo].[UP_RecordProperties]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Altering [dbo].[UP_RecordSections]...';


GO
ALTER TABLE [dbo].[UP_RecordSections]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Altering [dbo].[UP_ResourceBinaryRules]...';


GO
ALTER TABLE [dbo].[UP_ResourceBinaryRules]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Altering [dbo].[UP_ResourceClassificationRules]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Altering [dbo].[UP_ResourceCorrelationRules]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceNavigationRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceNavigationRules] (
    [Id]                        BIGINT        NOT NULL,
    [Policy_Id]                 BIGINT        NOT NULL,
    [Type]                      INT           CONSTRAINT [DF_ResourceNavigationRules_Type] DEFAULT ((0)) NOT NULL,
    [Resource_Id]               BIGINT        NOT NULL,
    [EntityType_Id]             BIGINT        NOT NULL,
    [ResourceType_Id]           BIGINT        NOT NULL,
    [Property_Id]               BIGINT        NOT NULL,
    [IsDenied]                  BIT           CONSTRAINT [DF_ResourceNavigationRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [TimeOffsetReference]       INT           CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetBeforeReference] INT           CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetBeforeReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetAfterReference]  INT           CONSTRAINT [DF_ResourceNavigationRules_TimeOffsetAfterReference] DEFAULT ((0)) NOT NULL,
    [SingleRole_Id]             BIGINT        NULL,
    [L0]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]                        BIT           CONSTRAINT [DF_ResourceNavigationRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]                       BIT           CONSTRAINT [DF_ResourceNavigationRules_L3V] DEFAULT ((0)) NOT NULL,
    [WhenCreated]               SMALLDATETIME NULL,
    [CreatedBy_Id]              BIGINT        NULL,
    [WhenChanged]               SMALLDATETIME NULL,
    [ChangedBy_Id]              BIGINT        NULL,
    [D0_Id]                     BIGINT        NULL,
    [D1_Id]                     BIGINT        NULL,
    [D2_Id]                     BIGINT        NULL,
    [D3_Id]                     BIGINT        NULL,
    [D4_Id]                     BIGINT        NULL,
    [D5_Id]                     BIGINT        NULL,
    [D6_Id]                     BIGINT        NULL,
    [D7_Id]                     BIGINT        NULL,
    [D8_Id]                     BIGINT        NULL,
    [D9_Id]                     BIGINT        NULL,
    [DA_Id]                     BIGINT        NULL,
    [DB_Id]                     BIGINT        NULL,
    [DC_Id]                     BIGINT        NULL,
    [DD_Id]                     BIGINT        NULL,
    [DE_Id]                     BIGINT        NULL,
    [DF_Id]                     BIGINT        NULL,
    [DG_Id]                     BIGINT        NULL,
    [DH_Id]                     BIGINT        NULL,
    [DI_Id]                     BIGINT        NULL,
    [DJ_Id]                     BIGINT        NULL,
    [DK_Id]                     BIGINT        NULL,
    [DL_Id]                     BIGINT        NULL,
    [DM_Id]                     BIGINT        NULL,
    [DN_Id]                     BIGINT        NULL,
    [DO_Id]                     BIGINT        NULL,
    [DP_Id]                     BIGINT        NULL,
    [DQ_Id]                     BIGINT        NULL,
    [DR_Id]                     BIGINT        NULL,
    [DS_Id]                     BIGINT        NULL,
    [DT_Id]                     BIGINT        NULL,
    [DU_Id]                     BIGINT        NULL,
    [DV_Id]                     BIGINT        NULL,
    [D10_Id]                    BIGINT        NULL,
    [D11_Id]                    BIGINT        NULL,
    [D12_Id]                    BIGINT        NULL,
    [D13_Id]                    BIGINT        NULL,
    [D14_Id]                    BIGINT        NULL,
    [D15_Id]                    BIGINT        NULL,
    [D16_Id]                    BIGINT        NULL,
    [D17_Id]                    BIGINT        NULL,
    [D18_Id]                    BIGINT        NULL,
    [D19_Id]                    BIGINT        NULL,
    [D1A_Id]                    BIGINT        NULL,
    [D1B_Id]                    BIGINT        NULL,
    [D1C_Id]                    BIGINT        NULL,
    [D1D_Id]                    BIGINT        NULL,
    [D1E_Id]                    BIGINT        NULL,
    [D1F_Id]                    BIGINT        NULL,
    [D1G_Id]                    BIGINT        NULL,
    [D1H_Id]                    BIGINT        NULL,
    [D1I_Id]                    BIGINT        NULL,
    [D1J_Id]                    BIGINT        NULL,
    [D1K_Id]                    BIGINT        NULL,
    [D1L_Id]                    BIGINT        NULL,
    [D1M_Id]                    BIGINT        NULL,
    [D1N_Id]                    BIGINT        NULL,
    [D1O_Id]                    BIGINT        NULL,
    [D1P_Id]                    BIGINT        NULL,
    [D1Q_Id]                    BIGINT        NULL,
    [D1R_Id]                    BIGINT        NULL,
    [D1S_Id]                    BIGINT        NULL,
    [D1T_Id]                    BIGINT        NULL,
    [D1U_Id]                    BIGINT        NULL,
    [D1V_Id]                    BIGINT        NULL,
    [D20_Id]                    BIGINT        NULL,
    [D21_Id]                    BIGINT        NULL,
    [D22_Id]                    BIGINT        NULL,
    [D23_Id]                    BIGINT        NULL,
    [D24_Id]                    BIGINT        NULL,
    [D25_Id]                    BIGINT        NULL,
    [D26_Id]                    BIGINT        NULL,
    [D27_Id]                    BIGINT        NULL,
    [D28_Id]                    BIGINT        NULL,
    [D29_Id]                    BIGINT        NULL,
    [D2A_Id]                    BIGINT        NULL,
    [D2B_Id]                    BIGINT        NULL,
    [D2C_Id]                    BIGINT        NULL,
    [D2D_Id]                    BIGINT        NULL,
    [D2E_Id]                    BIGINT        NULL,
    [D2F_Id]                    BIGINT        NULL,
    [D2G_Id]                    BIGINT        NULL,
    [D2H_Id]                    BIGINT        NULL,
    [D2I_Id]                    BIGINT        NULL,
    [D2J_Id]                    BIGINT        NULL,
    [D2K_Id]                    BIGINT        NULL,
    [D2L_Id]                    BIGINT        NULL,
    [D2M_Id]                    BIGINT        NULL,
    [D2N_Id]                    BIGINT        NULL,
    [D2O_Id]                    BIGINT        NULL,
    [D2P_Id]                    BIGINT        NULL,
    [D2Q_Id]                    BIGINT        NULL,
    [D2R_Id]                    BIGINT        NULL,
    [D2S_Id]                    BIGINT        NULL,
    [D2T_Id]                    BIGINT        NULL,
    [D2U_Id]                    BIGINT        NULL,
    [D2V_Id]                    BIGINT        NULL,
    [D30_Id]                    BIGINT        NULL,
    [D31_Id]                    BIGINT        NULL,
    [D32_Id]                    BIGINT        NULL,
    [D33_Id]                    BIGINT        NULL,
    [D34_Id]                    BIGINT        NULL,
    [D35_Id]                    BIGINT        NULL,
    [D36_Id]                    BIGINT        NULL,
    [D37_Id]                    BIGINT        NULL,
    [D38_Id]                    BIGINT        NULL,
    [D39_Id]                    BIGINT        NULL,
    [D3A_Id]                    BIGINT        NULL,
    [D3B_Id]                    BIGINT        NULL,
    [D3C_Id]                    BIGINT        NULL,
    [D3D_Id]                    BIGINT        NULL,
    [D3E_Id]                    BIGINT        NULL,
    [D3F_Id]                    BIGINT        NULL,
    [D3G_Id]                    BIGINT        NULL,
    [D3H_Id]                    BIGINT        NULL,
    [D3I_Id]                    BIGINT        NULL,
    [D3J_Id]                    BIGINT        NULL,
    [D3K_Id]                    BIGINT        NULL,
    [D3L_Id]                    BIGINT        NULL,
    [D3M_Id]                    BIGINT        NULL,
    [D3N_Id]                    BIGINT        NULL,
    [D3O_Id]                    BIGINT        NULL,
    [D3P_Id]                    BIGINT        NULL,
    [D3Q_Id]                    BIGINT        NULL,
    [D3R_Id]                    BIGINT        NULL,
    [D3S_Id]                    BIGINT        NULL,
    [D3T_Id]                    BIGINT        NULL,
    [D3U_Id]                    BIGINT        NULL,
    [D3V_Id]                    BIGINT        NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceNavigationRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceNavigationRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceNavigationRules]([EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceNavigationRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceNavigationRules] ([EntityType_Id], [ResourceType_Id], [Id], [Policy_Id], [Type], [Resource_Id], [Property_Id], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [ResourceType_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [Resource_Id],
                 [Property_Id],
                 [IsDenied],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SingleRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_ResourceNavigationRules]
        ORDER BY [EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceNavigationRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceNavigationRules]', N'UP_ResourceNavigationRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceNavigationRules].[tmp_ms_xx_index_IX_ResourceNavigationRules1]', N'IX_ResourceNavigationRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceNavigationRules1]', N'PK_ResourceNavigationRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[UP_ResourceQueryRules]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Altering [dbo].[UP_ResourceScalarRules]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceTypeRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceTypeRules] (
    [Id]                        BIGINT        NOT NULL,
    [Policy_Id]                 BIGINT        NOT NULL,
    [Type]                      INT           CONSTRAINT [DF_ResourceTypeRules_Type] DEFAULT ((0)) NOT NULL,
    [EntityType_Id]             BIGINT        NOT NULL,
    [ResourceType_Id]           BIGINT        NOT NULL,
    [IsDenied]                  BIT           CONSTRAINT [DF_ResourceTypeRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [TimeOffsetReference]       INT           CONSTRAINT [DF_ResourceTypeRules_TimeOffsetReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetBeforeReference] INT           CONSTRAINT [DF_ResourceTypeRules_TimeOffsetBeforeReference] DEFAULT ((0)) NOT NULL,
    [TimeOffsetAfterReference]  INT           CONSTRAINT [DF_ResourceTypeRules_TimeOffsetAfterReference] DEFAULT ((0)) NOT NULL,
    [SingleRole_Id]             BIGINT        NULL,
    [WhenCreated]               SMALLDATETIME NULL,
    [CreatedBy_Id]              BIGINT        NULL,
    [WhenChanged]               SMALLDATETIME NULL,
    [ChangedBy_Id]              BIGINT        NULL,
    [L0]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]                        BIT           CONSTRAINT [DF_ResourceTypeRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]                        BIT           CONSTRAINT [DF_ResourceTypeRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]                       BIT           CONSTRAINT [DF_ResourceTypeRules_L3V] DEFAULT ((0)) NOT NULL,
    [D0_Id]                     BIGINT        NULL,
    [D1_Id]                     BIGINT        NULL,
    [D2_Id]                     BIGINT        NULL,
    [D3_Id]                     BIGINT        NULL,
    [D4_Id]                     BIGINT        NULL,
    [D5_Id]                     BIGINT        NULL,
    [D6_Id]                     BIGINT        NULL,
    [D7_Id]                     BIGINT        NULL,
    [D8_Id]                     BIGINT        NULL,
    [D9_Id]                     BIGINT        NULL,
    [DA_Id]                     BIGINT        NULL,
    [DB_Id]                     BIGINT        NULL,
    [DC_Id]                     BIGINT        NULL,
    [DD_Id]                     BIGINT        NULL,
    [DE_Id]                     BIGINT        NULL,
    [DF_Id]                     BIGINT        NULL,
    [DG_Id]                     BIGINT        NULL,
    [DH_Id]                     BIGINT        NULL,
    [DI_Id]                     BIGINT        NULL,
    [DJ_Id]                     BIGINT        NULL,
    [DK_Id]                     BIGINT        NULL,
    [DL_Id]                     BIGINT        NULL,
    [DM_Id]                     BIGINT        NULL,
    [DN_Id]                     BIGINT        NULL,
    [DO_Id]                     BIGINT        NULL,
    [DP_Id]                     BIGINT        NULL,
    [DQ_Id]                     BIGINT        NULL,
    [DR_Id]                     BIGINT        NULL,
    [DS_Id]                     BIGINT        NULL,
    [DT_Id]                     BIGINT        NULL,
    [DU_Id]                     BIGINT        NULL,
    [DV_Id]                     BIGINT        NULL,
    [D10_Id]                    BIGINT        NULL,
    [D11_Id]                    BIGINT        NULL,
    [D12_Id]                    BIGINT        NULL,
    [D13_Id]                    BIGINT        NULL,
    [D14_Id]                    BIGINT        NULL,
    [D15_Id]                    BIGINT        NULL,
    [D16_Id]                    BIGINT        NULL,
    [D17_Id]                    BIGINT        NULL,
    [D18_Id]                    BIGINT        NULL,
    [D19_Id]                    BIGINT        NULL,
    [D1A_Id]                    BIGINT        NULL,
    [D1B_Id]                    BIGINT        NULL,
    [D1C_Id]                    BIGINT        NULL,
    [D1D_Id]                    BIGINT        NULL,
    [D1E_Id]                    BIGINT        NULL,
    [D1F_Id]                    BIGINT        NULL,
    [D1G_Id]                    BIGINT        NULL,
    [D1H_Id]                    BIGINT        NULL,
    [D1I_Id]                    BIGINT        NULL,
    [D1J_Id]                    BIGINT        NULL,
    [D1K_Id]                    BIGINT        NULL,
    [D1L_Id]                    BIGINT        NULL,
    [D1M_Id]                    BIGINT        NULL,
    [D1N_Id]                    BIGINT        NULL,
    [D1O_Id]                    BIGINT        NULL,
    [D1P_Id]                    BIGINT        NULL,
    [D1Q_Id]                    BIGINT        NULL,
    [D1R_Id]                    BIGINT        NULL,
    [D1S_Id]                    BIGINT        NULL,
    [D1T_Id]                    BIGINT        NULL,
    [D1U_Id]                    BIGINT        NULL,
    [D1V_Id]                    BIGINT        NULL,
    [D20_Id]                    BIGINT        NULL,
    [D21_Id]                    BIGINT        NULL,
    [D22_Id]                    BIGINT        NULL,
    [D23_Id]                    BIGINT        NULL,
    [D24_Id]                    BIGINT        NULL,
    [D25_Id]                    BIGINT        NULL,
    [D26_Id]                    BIGINT        NULL,
    [D27_Id]                    BIGINT        NULL,
    [D28_Id]                    BIGINT        NULL,
    [D29_Id]                    BIGINT        NULL,
    [D2A_Id]                    BIGINT        NULL,
    [D2B_Id]                    BIGINT        NULL,
    [D2C_Id]                    BIGINT        NULL,
    [D2D_Id]                    BIGINT        NULL,
    [D2E_Id]                    BIGINT        NULL,
    [D2F_Id]                    BIGINT        NULL,
    [D2G_Id]                    BIGINT        NULL,
    [D2H_Id]                    BIGINT        NULL,
    [D2I_Id]                    BIGINT        NULL,
    [D2J_Id]                    BIGINT        NULL,
    [D2K_Id]                    BIGINT        NULL,
    [D2L_Id]                    BIGINT        NULL,
    [D2M_Id]                    BIGINT        NULL,
    [D2N_Id]                    BIGINT        NULL,
    [D2O_Id]                    BIGINT        NULL,
    [D2P_Id]                    BIGINT        NULL,
    [D2Q_Id]                    BIGINT        NULL,
    [D2R_Id]                    BIGINT        NULL,
    [D2S_Id]                    BIGINT        NULL,
    [D2T_Id]                    BIGINT        NULL,
    [D2U_Id]                    BIGINT        NULL,
    [D2V_Id]                    BIGINT        NULL,
    [D30_Id]                    BIGINT        NULL,
    [D31_Id]                    BIGINT        NULL,
    [D32_Id]                    BIGINT        NULL,
    [D33_Id]                    BIGINT        NULL,
    [D34_Id]                    BIGINT        NULL,
    [D35_Id]                    BIGINT        NULL,
    [D36_Id]                    BIGINT        NULL,
    [D37_Id]                    BIGINT        NULL,
    [D38_Id]                    BIGINT        NULL,
    [D39_Id]                    BIGINT        NULL,
    [D3A_Id]                    BIGINT        NULL,
    [D3B_Id]                    BIGINT        NULL,
    [D3C_Id]                    BIGINT        NULL,
    [D3D_Id]                    BIGINT        NULL,
    [D3E_Id]                    BIGINT        NULL,
    [D3F_Id]                    BIGINT        NULL,
    [D3G_Id]                    BIGINT        NULL,
    [D3H_Id]                    BIGINT        NULL,
    [D3I_Id]                    BIGINT        NULL,
    [D3J_Id]                    BIGINT        NULL,
    [D3K_Id]                    BIGINT        NULL,
    [D3L_Id]                    BIGINT        NULL,
    [D3M_Id]                    BIGINT        NULL,
    [D3N_Id]                    BIGINT        NULL,
    [D3O_Id]                    BIGINT        NULL,
    [D3P_Id]                    BIGINT        NULL,
    [D3Q_Id]                    BIGINT        NULL,
    [D3R_Id]                    BIGINT        NULL,
    [D3S_Id]                    BIGINT        NULL,
    [D3T_Id]                    BIGINT        NULL,
    [D3U_Id]                    BIGINT        NULL,
    [D3V_Id]                    BIGINT        NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypeRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceTypeRules1]
    ON [dbo].[tmp_ms_xx_UP_ResourceTypeRules]([EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceTypeRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceTypeRules] ([EntityType_Id], [ResourceType_Id], [Id], [Policy_Id], [Type], [IsDenied], [TimeOffsetReference], [TimeOffsetBeforeReference], [TimeOffsetAfterReference], [SingleRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [ResourceType_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [IsDenied],
                 [TimeOffsetReference],
                 [TimeOffsetBeforeReference],
                 [TimeOffsetAfterReference],
                 [SingleRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_ResourceTypeRules]
        ORDER BY [EntityType_Id] ASC, [ResourceType_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_ResourceTypeRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceTypeRules]', N'UP_ResourceTypeRules';

EXECUTE sp_rename N'[dbo].[UP_ResourceTypeRules].[tmp_ms_xx_index_IX_ResourceTypeRules1]', N'IX_ResourceTypeRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypeRules1]', N'PK_ResourceTypeRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_ResourceTypes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_ResourceTypes] (
    [Id]                             BIGINT          NOT NULL,
    [Policy_Id]                      BIGINT          NOT NULL,
    [Category_Id]                    BIGINT          NULL,
    [SourceEntityType_Id]            BIGINT          NULL,
    [TargetEntityType_Id]            BIGINT          NOT NULL,
    [ContextRule_Id]                 BIGINT          NULL,
    [FulfillHoursAheadOfTime]        INT             CONSTRAINT [DF_ResourceTypes_FulfillHoursAheadOfTime] DEFAULT ((0)) NOT NULL,
    [TransmittedStateValidityPeriod] INT             CONSTRAINT [DF_ResourceTypes_TransmittedStateValidityPeriod] DEFAULT ((0)) NOT NULL,
    [ValidFrom]                      DATETIME2 (2)   CONSTRAINT [DF_ResourceTypes_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                        DATETIME2 (2)   CONSTRAINT [DF_ResourceTypes_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [P0]                             BIT             CONSTRAINT [DF_ResourceTypes_P0] DEFAULT ((0)) NOT NULL,
    [P1]                             BIT             CONSTRAINT [DF_ResourceTypes_P1] DEFAULT ((0)) NOT NULL,
    [P2]                             BIT             CONSTRAINT [DF_ResourceTypes_P2] DEFAULT ((0)) NOT NULL,
    [P3]                             BIT             CONSTRAINT [DF_ResourceTypes_P3] DEFAULT ((0)) NOT NULL,
    [P4]                             BIT             CONSTRAINT [DF_ResourceTypes_P4] DEFAULT ((0)) NOT NULL,
    [P5]                             BIT             CONSTRAINT [DF_ResourceTypes_P5] DEFAULT ((0)) NOT NULL,
    [P6]                             BIT             CONSTRAINT [DF_ResourceTypes_P6] DEFAULT ((0)) NOT NULL,
    [P7]                             BIT             CONSTRAINT [DF_ResourceTypes_P7] DEFAULT ((0)) NOT NULL,
    [P8]                             BIT             CONSTRAINT [DF_ResourceTypes_P8] DEFAULT ((0)) NOT NULL,
    [P9]                             BIT             CONSTRAINT [DF_ResourceTypes_P9] DEFAULT ((0)) NOT NULL,
    [PA]                             BIT             CONSTRAINT [DF_ResourceTypes_PA] DEFAULT ((0)) NOT NULL,
    [PB]                             BIT             CONSTRAINT [DF_ResourceTypes_PB] DEFAULT ((0)) NOT NULL,
    [PC]                             BIT             CONSTRAINT [DF_ResourceTypes_PC] DEFAULT ((0)) NOT NULL,
    [PD]                             BIT             CONSTRAINT [DF_ResourceTypes_PD] DEFAULT ((0)) NOT NULL,
    [PE]                             BIT             CONSTRAINT [DF_ResourceTypes_PE] DEFAULT ((0)) NOT NULL,
    [PF]                             BIT             CONSTRAINT [DF_ResourceTypes_PF] DEFAULT ((0)) NOT NULL,
    [PG]                             BIT             CONSTRAINT [DF_ResourceTypes_PG] DEFAULT ((0)) NOT NULL,
    [PH]                             BIT             CONSTRAINT [DF_ResourceTypes_PH] DEFAULT ((0)) NOT NULL,
    [PI]                             BIT             CONSTRAINT [DF_ResourceTypes_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                             BIT             CONSTRAINT [DF_ResourceTypes_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                             BIT             CONSTRAINT [DF_ResourceTypes_PK] DEFAULT ((0)) NOT NULL,
    [PL]                             BIT             CONSTRAINT [DF_ResourceTypes_PL] DEFAULT ((0)) NOT NULL,
    [PM]                             BIT             CONSTRAINT [DF_ResourceTypes_PM] DEFAULT ((0)) NOT NULL,
    [PN]                             BIT             CONSTRAINT [DF_ResourceTypes_PN] DEFAULT ((0)) NOT NULL,
    [PO]                             BIT             CONSTRAINT [DF_ResourceTypes_PO] DEFAULT ((0)) NOT NULL,
    [PP]                             BIT             CONSTRAINT [DF_ResourceTypes_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                             BIT             CONSTRAINT [DF_ResourceTypes_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                             BIT             CONSTRAINT [DF_ResourceTypes_PR] DEFAULT ((0)) NOT NULL,
    [PS]                             BIT             CONSTRAINT [DF_ResourceTypes_PS] DEFAULT ((0)) NOT NULL,
    [PT]                             BIT             CONSTRAINT [DF_ResourceTypes_PT] DEFAULT ((0)) NOT NULL,
    [PU]                             BIT             CONSTRAINT [DF_ResourceTypes_PU] DEFAULT ((0)) NOT NULL,
    [PV]                             BIT             CONSTRAINT [DF_ResourceTypes_PV] DEFAULT ((0)) NOT NULL,
    [P10]                            BIT             CONSTRAINT [DF_ResourceTypes_P10] DEFAULT ((0)) NOT NULL,
    [P11]                            BIT             CONSTRAINT [DF_ResourceTypes_P11] DEFAULT ((0)) NOT NULL,
    [P12]                            BIT             CONSTRAINT [DF_ResourceTypes_P12] DEFAULT ((0)) NOT NULL,
    [P13]                            BIT             CONSTRAINT [DF_ResourceTypes_P13] DEFAULT ((0)) NOT NULL,
    [P14]                            BIT             CONSTRAINT [DF_ResourceTypes_P14] DEFAULT ((0)) NOT NULL,
    [P15]                            BIT             CONSTRAINT [DF_ResourceTypes_P15] DEFAULT ((0)) NOT NULL,
    [P16]                            BIT             CONSTRAINT [DF_ResourceTypes_P16] DEFAULT ((0)) NOT NULL,
    [P17]                            BIT             CONSTRAINT [DF_ResourceTypes_P17] DEFAULT ((0)) NOT NULL,
    [P18]                            BIT             CONSTRAINT [DF_ResourceTypes_P18] DEFAULT ((0)) NOT NULL,
    [P19]                            BIT             CONSTRAINT [DF_ResourceTypes_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                            BIT             CONSTRAINT [DF_ResourceTypes_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                            BIT             CONSTRAINT [DF_ResourceTypes_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                            BIT             CONSTRAINT [DF_ResourceTypes_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                            BIT             CONSTRAINT [DF_ResourceTypes_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                            BIT             CONSTRAINT [DF_ResourceTypes_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                            BIT             CONSTRAINT [DF_ResourceTypes_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                            BIT             CONSTRAINT [DF_ResourceTypes_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                            BIT             CONSTRAINT [DF_ResourceTypes_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                            BIT             CONSTRAINT [DF_ResourceTypes_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                            BIT             CONSTRAINT [DF_ResourceTypes_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                            BIT             CONSTRAINT [DF_ResourceTypes_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                            BIT             CONSTRAINT [DF_ResourceTypes_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                            BIT             CONSTRAINT [DF_ResourceTypes_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                            BIT             CONSTRAINT [DF_ResourceTypes_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                            BIT             CONSTRAINT [DF_ResourceTypes_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                            BIT             CONSTRAINT [DF_ResourceTypes_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                            BIT             CONSTRAINT [DF_ResourceTypes_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                            BIT             CONSTRAINT [DF_ResourceTypes_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                            BIT             CONSTRAINT [DF_ResourceTypes_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                            BIT             CONSTRAINT [DF_ResourceTypes_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                            BIT             CONSTRAINT [DF_ResourceTypes_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                            BIT             CONSTRAINT [DF_ResourceTypes_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                            BIT             CONSTRAINT [DF_ResourceTypes_P20] DEFAULT ((0)) NOT NULL,
    [P21]                            BIT             CONSTRAINT [DF_ResourceTypes_P21] DEFAULT ((0)) NOT NULL,
    [P22]                            BIT             CONSTRAINT [DF_ResourceTypes_P22] DEFAULT ((0)) NOT NULL,
    [P23]                            BIT             CONSTRAINT [DF_ResourceTypes_P23] DEFAULT ((0)) NOT NULL,
    [P24]                            BIT             CONSTRAINT [DF_ResourceTypes_P24] DEFAULT ((0)) NOT NULL,
    [P25]                            BIT             CONSTRAINT [DF_ResourceTypes_P25] DEFAULT ((0)) NOT NULL,
    [P26]                            BIT             CONSTRAINT [DF_ResourceTypes_P26] DEFAULT ((0)) NOT NULL,
    [P27]                            BIT             CONSTRAINT [DF_ResourceTypes_P27] DEFAULT ((0)) NOT NULL,
    [P28]                            BIT             CONSTRAINT [DF_ResourceTypes_P28] DEFAULT ((0)) NOT NULL,
    [P29]                            BIT             CONSTRAINT [DF_ResourceTypes_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                            BIT             CONSTRAINT [DF_ResourceTypes_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                            BIT             CONSTRAINT [DF_ResourceTypes_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                            BIT             CONSTRAINT [DF_ResourceTypes_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                            BIT             CONSTRAINT [DF_ResourceTypes_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                            BIT             CONSTRAINT [DF_ResourceTypes_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                            BIT             CONSTRAINT [DF_ResourceTypes_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                            BIT             CONSTRAINT [DF_ResourceTypes_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                            BIT             CONSTRAINT [DF_ResourceTypes_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                            BIT             CONSTRAINT [DF_ResourceTypes_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                            BIT             CONSTRAINT [DF_ResourceTypes_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                            BIT             CONSTRAINT [DF_ResourceTypes_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                            BIT             CONSTRAINT [DF_ResourceTypes_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                            BIT             CONSTRAINT [DF_ResourceTypes_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                            BIT             CONSTRAINT [DF_ResourceTypes_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                            BIT             CONSTRAINT [DF_ResourceTypes_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                            BIT             CONSTRAINT [DF_ResourceTypes_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                            BIT             CONSTRAINT [DF_ResourceTypes_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                            BIT             CONSTRAINT [DF_ResourceTypes_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                            BIT             CONSTRAINT [DF_ResourceTypes_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                            BIT             CONSTRAINT [DF_ResourceTypes_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                            BIT             CONSTRAINT [DF_ResourceTypes_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                            BIT             CONSTRAINT [DF_ResourceTypes_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                            BIT             CONSTRAINT [DF_ResourceTypes_P30] DEFAULT ((0)) NOT NULL,
    [P31]                            BIT             CONSTRAINT [DF_ResourceTypes_P31] DEFAULT ((0)) NOT NULL,
    [P32]                            BIT             CONSTRAINT [DF_ResourceTypes_P32] DEFAULT ((0)) NOT NULL,
    [P33]                            BIT             CONSTRAINT [DF_ResourceTypes_P33] DEFAULT ((0)) NOT NULL,
    [P34]                            BIT             CONSTRAINT [DF_ResourceTypes_P34] DEFAULT ((0)) NOT NULL,
    [P35]                            BIT             CONSTRAINT [DF_ResourceTypes_P35] DEFAULT ((0)) NOT NULL,
    [P36]                            BIT             CONSTRAINT [DF_ResourceTypes_P36] DEFAULT ((0)) NOT NULL,
    [P37]                            BIT             CONSTRAINT [DF_ResourceTypes_P37] DEFAULT ((0)) NOT NULL,
    [P38]                            BIT             CONSTRAINT [DF_ResourceTypes_P38] DEFAULT ((0)) NOT NULL,
    [P39]                            BIT             CONSTRAINT [DF_ResourceTypes_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                            BIT             CONSTRAINT [DF_ResourceTypes_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                            BIT             CONSTRAINT [DF_ResourceTypes_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                            BIT             CONSTRAINT [DF_ResourceTypes_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                            BIT             CONSTRAINT [DF_ResourceTypes_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                            BIT             CONSTRAINT [DF_ResourceTypes_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                            BIT             CONSTRAINT [DF_ResourceTypes_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                            BIT             CONSTRAINT [DF_ResourceTypes_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                            BIT             CONSTRAINT [DF_ResourceTypes_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                            BIT             CONSTRAINT [DF_ResourceTypes_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                            BIT             CONSTRAINT [DF_ResourceTypes_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                            BIT             CONSTRAINT [DF_ResourceTypes_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                            BIT             CONSTRAINT [DF_ResourceTypes_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                            BIT             CONSTRAINT [DF_ResourceTypes_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                            BIT             CONSTRAINT [DF_ResourceTypes_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                            BIT             CONSTRAINT [DF_ResourceTypes_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                            BIT             CONSTRAINT [DF_ResourceTypes_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                            BIT             CONSTRAINT [DF_ResourceTypes_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                            BIT             CONSTRAINT [DF_ResourceTypes_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                            BIT             CONSTRAINT [DF_ResourceTypes_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                            BIT             CONSTRAINT [DF_ResourceTypes_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                            BIT             CONSTRAINT [DF_ResourceTypes_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                            BIT             CONSTRAINT [DF_ResourceTypes_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                             BIT             CONSTRAINT [DF_ResourceTypes_R0] DEFAULT ((0)) NOT NULL,
    [R1]                             BIT             CONSTRAINT [DF_ResourceTypes_R1] DEFAULT ((0)) NOT NULL,
    [R2]                             BIT             CONSTRAINT [DF_ResourceTypes_R2] DEFAULT ((0)) NOT NULL,
    [R3]                             BIT             CONSTRAINT [DF_ResourceTypes_R3] DEFAULT ((0)) NOT NULL,
    [R4]                             BIT             CONSTRAINT [DF_ResourceTypes_R4] DEFAULT ((0)) NOT NULL,
    [R5]                             BIT             CONSTRAINT [DF_ResourceTypes_R5] DEFAULT ((0)) NOT NULL,
    [R6]                             BIT             CONSTRAINT [DF_ResourceTypes_R6] DEFAULT ((0)) NOT NULL,
    [R7]                             BIT             CONSTRAINT [DF_ResourceTypes_R7] DEFAULT ((0)) NOT NULL,
    [R8]                             BIT             CONSTRAINT [DF_ResourceTypes_R8] DEFAULT ((0)) NOT NULL,
    [R9]                             BIT             CONSTRAINT [DF_ResourceTypes_R9] DEFAULT ((0)) NOT NULL,
    [RA]                             BIT             CONSTRAINT [DF_ResourceTypes_RA] DEFAULT ((0)) NOT NULL,
    [RB]                             BIT             CONSTRAINT [DF_ResourceTypes_RB] DEFAULT ((0)) NOT NULL,
    [RC]                             BIT             CONSTRAINT [DF_ResourceTypes_RC] DEFAULT ((0)) NOT NULL,
    [RD]                             BIT             CONSTRAINT [DF_ResourceTypes_RD] DEFAULT ((0)) NOT NULL,
    [RE]                             BIT             CONSTRAINT [DF_ResourceTypes_RE] DEFAULT ((0)) NOT NULL,
    [RF]                             BIT             CONSTRAINT [DF_ResourceTypes_RF] DEFAULT ((0)) NOT NULL,
    [RG]                             BIT             CONSTRAINT [DF_ResourceTypes_RG] DEFAULT ((0)) NOT NULL,
    [RH]                             BIT             CONSTRAINT [DF_ResourceTypes_RH] DEFAULT ((0)) NOT NULL,
    [RI]                             BIT             CONSTRAINT [DF_ResourceTypes_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                             BIT             CONSTRAINT [DF_ResourceTypes_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                             BIT             CONSTRAINT [DF_ResourceTypes_RK] DEFAULT ((0)) NOT NULL,
    [RL]                             BIT             CONSTRAINT [DF_ResourceTypes_RL] DEFAULT ((0)) NOT NULL,
    [RM]                             BIT             CONSTRAINT [DF_ResourceTypes_RM] DEFAULT ((0)) NOT NULL,
    [RN]                             BIT             CONSTRAINT [DF_ResourceTypes_RN] DEFAULT ((0)) NOT NULL,
    [RO]                             BIT             CONSTRAINT [DF_ResourceTypes_RO] DEFAULT ((0)) NOT NULL,
    [RP]                             BIT             CONSTRAINT [DF_ResourceTypes_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                             BIT             CONSTRAINT [DF_ResourceTypes_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                             BIT             CONSTRAINT [DF_ResourceTypes_RR] DEFAULT ((0)) NOT NULL,
    [RS]                             BIT             CONSTRAINT [DF_ResourceTypes_RS] DEFAULT ((0)) NOT NULL,
    [RT]                             BIT             CONSTRAINT [DF_ResourceTypes_RT] DEFAULT ((0)) NOT NULL,
    [RU]                             BIT             CONSTRAINT [DF_ResourceTypes_RU] DEFAULT ((0)) NOT NULL,
    [RV]                             BIT             CONSTRAINT [DF_ResourceTypes_RV] DEFAULT ((0)) NOT NULL,
    [R10]                            BIT             CONSTRAINT [DF_ResourceTypes_R10] DEFAULT ((0)) NOT NULL,
    [R11]                            BIT             CONSTRAINT [DF_ResourceTypes_R11] DEFAULT ((0)) NOT NULL,
    [R12]                            BIT             CONSTRAINT [DF_ResourceTypes_R12] DEFAULT ((0)) NOT NULL,
    [R13]                            BIT             CONSTRAINT [DF_ResourceTypes_R13] DEFAULT ((0)) NOT NULL,
    [R14]                            BIT             CONSTRAINT [DF_ResourceTypes_R14] DEFAULT ((0)) NOT NULL,
    [R15]                            BIT             CONSTRAINT [DF_ResourceTypes_R15] DEFAULT ((0)) NOT NULL,
    [R16]                            BIT             CONSTRAINT [DF_ResourceTypes_R16] DEFAULT ((0)) NOT NULL,
    [R17]                            BIT             CONSTRAINT [DF_ResourceTypes_R17] DEFAULT ((0)) NOT NULL,
    [R18]                            BIT             CONSTRAINT [DF_ResourceTypes_R18] DEFAULT ((0)) NOT NULL,
    [R19]                            BIT             CONSTRAINT [DF_ResourceTypes_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                            BIT             CONSTRAINT [DF_ResourceTypes_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                            BIT             CONSTRAINT [DF_ResourceTypes_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                            BIT             CONSTRAINT [DF_ResourceTypes_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                            BIT             CONSTRAINT [DF_ResourceTypes_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                            BIT             CONSTRAINT [DF_ResourceTypes_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                            BIT             CONSTRAINT [DF_ResourceTypes_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                            BIT             CONSTRAINT [DF_ResourceTypes_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                            BIT             CONSTRAINT [DF_ResourceTypes_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                            BIT             CONSTRAINT [DF_ResourceTypes_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                            BIT             CONSTRAINT [DF_ResourceTypes_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                            BIT             CONSTRAINT [DF_ResourceTypes_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                            BIT             CONSTRAINT [DF_ResourceTypes_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                            BIT             CONSTRAINT [DF_ResourceTypes_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                            BIT             CONSTRAINT [DF_ResourceTypes_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                            BIT             CONSTRAINT [DF_ResourceTypes_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                            BIT             CONSTRAINT [DF_ResourceTypes_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                            BIT             CONSTRAINT [DF_ResourceTypes_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                            BIT             CONSTRAINT [DF_ResourceTypes_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                            BIT             CONSTRAINT [DF_ResourceTypes_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                            BIT             CONSTRAINT [DF_ResourceTypes_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                            BIT             CONSTRAINT [DF_ResourceTypes_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                            BIT             CONSTRAINT [DF_ResourceTypes_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                            BIT             CONSTRAINT [DF_ResourceTypes_R20] DEFAULT ((0)) NOT NULL,
    [R21]                            BIT             CONSTRAINT [DF_ResourceTypes_R21] DEFAULT ((0)) NOT NULL,
    [R22]                            BIT             CONSTRAINT [DF_ResourceTypes_R22] DEFAULT ((0)) NOT NULL,
    [R23]                            BIT             CONSTRAINT [DF_ResourceTypes_R23] DEFAULT ((0)) NOT NULL,
    [R24]                            BIT             CONSTRAINT [DF_ResourceTypes_R24] DEFAULT ((0)) NOT NULL,
    [R25]                            BIT             CONSTRAINT [DF_ResourceTypes_R25] DEFAULT ((0)) NOT NULL,
    [R26]                            BIT             CONSTRAINT [DF_ResourceTypes_R26] DEFAULT ((0)) NOT NULL,
    [R27]                            BIT             CONSTRAINT [DF_ResourceTypes_R27] DEFAULT ((0)) NOT NULL,
    [R28]                            BIT             CONSTRAINT [DF_ResourceTypes_R28] DEFAULT ((0)) NOT NULL,
    [R29]                            BIT             CONSTRAINT [DF_ResourceTypes_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                            BIT             CONSTRAINT [DF_ResourceTypes_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                            BIT             CONSTRAINT [DF_ResourceTypes_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                            BIT             CONSTRAINT [DF_ResourceTypes_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                            BIT             CONSTRAINT [DF_ResourceTypes_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                            BIT             CONSTRAINT [DF_ResourceTypes_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                            BIT             CONSTRAINT [DF_ResourceTypes_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                            BIT             CONSTRAINT [DF_ResourceTypes_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                            BIT             CONSTRAINT [DF_ResourceTypes_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                            BIT             CONSTRAINT [DF_ResourceTypes_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                            BIT             CONSTRAINT [DF_ResourceTypes_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                            BIT             CONSTRAINT [DF_ResourceTypes_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                            BIT             CONSTRAINT [DF_ResourceTypes_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                            BIT             CONSTRAINT [DF_ResourceTypes_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                            BIT             CONSTRAINT [DF_ResourceTypes_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                            BIT             CONSTRAINT [DF_ResourceTypes_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                            BIT             CONSTRAINT [DF_ResourceTypes_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                            BIT             CONSTRAINT [DF_ResourceTypes_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                            BIT             CONSTRAINT [DF_ResourceTypes_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                            BIT             CONSTRAINT [DF_ResourceTypes_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                            BIT             CONSTRAINT [DF_ResourceTypes_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                            BIT             CONSTRAINT [DF_ResourceTypes_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                            BIT             CONSTRAINT [DF_ResourceTypes_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                            BIT             CONSTRAINT [DF_ResourceTypes_R30] DEFAULT ((0)) NOT NULL,
    [R31]                            BIT             CONSTRAINT [DF_ResourceTypes_R31] DEFAULT ((0)) NOT NULL,
    [R32]                            BIT             CONSTRAINT [DF_ResourceTypes_R32] DEFAULT ((0)) NOT NULL,
    [R33]                            BIT             CONSTRAINT [DF_ResourceTypes_R33] DEFAULT ((0)) NOT NULL,
    [R34]                            BIT             CONSTRAINT [DF_ResourceTypes_R34] DEFAULT ((0)) NOT NULL,
    [R35]                            BIT             CONSTRAINT [DF_ResourceTypes_R35] DEFAULT ((0)) NOT NULL,
    [R36]                            BIT             CONSTRAINT [DF_ResourceTypes_R36] DEFAULT ((0)) NOT NULL,
    [R37]                            BIT             CONSTRAINT [DF_ResourceTypes_R37] DEFAULT ((0)) NOT NULL,
    [R38]                            BIT             CONSTRAINT [DF_ResourceTypes_R38] DEFAULT ((0)) NOT NULL,
    [R39]                            BIT             CONSTRAINT [DF_ResourceTypes_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                            BIT             CONSTRAINT [DF_ResourceTypes_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                            BIT             CONSTRAINT [DF_ResourceTypes_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                            BIT             CONSTRAINT [DF_ResourceTypes_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                            BIT             CONSTRAINT [DF_ResourceTypes_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                            BIT             CONSTRAINT [DF_ResourceTypes_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                            BIT             CONSTRAINT [DF_ResourceTypes_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                            BIT             CONSTRAINT [DF_ResourceTypes_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                            BIT             CONSTRAINT [DF_ResourceTypes_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                            BIT             CONSTRAINT [DF_ResourceTypes_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                            BIT             CONSTRAINT [DF_ResourceTypes_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                            BIT             CONSTRAINT [DF_ResourceTypes_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                            BIT             CONSTRAINT [DF_ResourceTypes_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                            BIT             CONSTRAINT [DF_ResourceTypes_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                            BIT             CONSTRAINT [DF_ResourceTypes_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                            BIT             CONSTRAINT [DF_ResourceTypes_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                            BIT             CONSTRAINT [DF_ResourceTypes_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                            BIT             CONSTRAINT [DF_ResourceTypes_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                            BIT             CONSTRAINT [DF_ResourceTypes_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                            BIT             CONSTRAINT [DF_ResourceTypes_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                            BIT             CONSTRAINT [DF_ResourceTypes_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                            BIT             CONSTRAINT [DF_ResourceTypes_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                            BIT             CONSTRAINT [DF_ResourceTypes_R3V] DEFAULT ((0)) NOT NULL,
    [AllowAdd]                       BIT             CONSTRAINT [DF_ResourceTypes_AllowAdd] DEFAULT ((1)) NOT NULL,
    [AllowRemove]                    BIT             CONSTRAINT [DF_ResourceTypes_AllowRemove] DEFAULT ((1)) NOT NULL,
    [CorrelateMultipleResources]     BIT             CONSTRAINT [DF_ResourceTypes_CorrelateMultipleResources] DEFAULT ((0)) NOT NULL,
    [RemoveOrphans]                  BIT             CONSTRAINT [DF_ResourceTypes_RemoveOrphans] DEFAULT ((0)) NOT NULL,
    [BlockProvisioning]              BIT             CONSTRAINT [DF_ResourceTypes_BlockProvisioning] DEFAULT ((1)) NOT NULL,
    [DiscardManualAssignments]       BIT             CONSTRAINT [DF_ResourceTypes_DiscardManualAssignments] DEFAULT ((0)) NOT NULL,
    [HideOnSimplifiedView]           BIT             CONSTRAINT [DF_ResourceTypes_HideOnSimplifiedView] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType]           INT             CONSTRAINT [DF_ResourceTypes_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [ImplicitApproval]               TINYINT         CONSTRAINT [DF_ResourceTypes_ImplicitApproval] DEFAULT ((0)) NOT NULL,
    [ArgumentsExpression]            NVARCHAR (4000) NULL,
    [Description_L1]                 NVARCHAR (1024) NULL,
    [Description_L2]                 NVARCHAR (1024) NULL,
    [Description_L3]                 NVARCHAR (1024) NULL,
    [Description_L4]                 NVARCHAR (1024) NULL,
    [Description_L5]                 NVARCHAR (1024) NULL,
    [Description_L6]                 NVARCHAR (1024) NULL,
    [Description_L7]                 NVARCHAR (1024) NULL,
    [Description_L8]                 NVARCHAR (1024) NULL,
    [MaximumInsert]                  INT             CONSTRAINT [DF_ResourceTypes_MaximumInsert] DEFAULT ((0)) NOT NULL,
    [MaximumDelete]                  INT             CONSTRAINT [DF_ResourceTypes_MaximumDelete] DEFAULT ((0)) NOT NULL,
    [MaximumUpdate]                  INT             CONSTRAINT [DF_ResourceTypes_MaximumUpdate] DEFAULT ((0)) NOT NULL,
    [AssignmentCount]                INT             CONSTRAINT [DF_ResourceTypes_AssignmentCount] DEFAULT ((0)) NOT NULL,
    [OrphanCount]                    INT             CONSTRAINT [DF_ResourceTypes_OrphansCount] DEFAULT ((0)) NOT NULL,
    [MaximumInsertPercent]           INT             CONSTRAINT [DF_ResourceTypes_MaximumInsertPercent] DEFAULT ((30)) NOT NULL,
    [MaximumDeletePercent]           INT             CONSTRAINT [DF_ResourceTypes_MaximumDeletePercent] DEFAULT ((30)) NOT NULL,
    [MaximumUpdatePercent]           INT             CONSTRAINT [DF_ResourceTypes_MaximumUpdatePercent] DEFAULT ((30)) NOT NULL,
    [Identifier]                     VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [DisplayName_L1]                 NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]                 NVARCHAR (442)  NULL,
    [DisplayName_L3]                 NVARCHAR (442)  NULL,
    [DisplayName_L4]                 NVARCHAR (442)  NULL,
    [DisplayName_L5]                 NVARCHAR (442)  NULL,
    [DisplayName_L6]                 NVARCHAR (442)  NULL,
    [DisplayName_L7]                 NVARCHAR (442)  NULL,
    [DisplayName_L8]                 NVARCHAR (442)  NULL,
    [FullName_L1]                    NVARCHAR (4000) NULL,
    [FullName_L2]                    NVARCHAR (4000) NULL,
    [FullName_L3]                    NVARCHAR (4000) NULL,
    [FullName_L4]                    NVARCHAR (4000) NULL,
    [FullName_L5]                    NVARCHAR (4000) NULL,
    [FullName_L6]                    NVARCHAR (4000) NULL,
    [FullName_L7]                    NVARCHAR (4000) NULL,
    [FullName_L8]                    NVARCHAR (4000) NULL,
    [WhenCreated]                    SMALLDATETIME   NULL,
    [CreatedBy_Id]                   BIGINT          NULL,
    [WhenChanged]                    SMALLDATETIME   NULL,
    [ChangedBy_Id]                   BIGINT          NULL,
    [BaseRole_Id]                    BIGINT          NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_ResourceTypes1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_ResourceTypes_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_ResourceTypes1]
    ON [dbo].[tmp_ms_xx_UP_ResourceTypes]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_ResourceTypes])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_ResourceTypes] ([Id], [ValidTo], [Policy_Id], [Category_Id], [SourceEntityType_Id], [TargetEntityType_Id], [ContextRule_Id], [FulfillHoursAheadOfTime], [TransmittedStateValidityPeriod], [ValidFrom], [P0], [P1], [P2], [P3], [P4], [P5], [P6], [P7], [P8], [P9], [PA], [PB], [PC], [PD], [PE], [PF], [PG], [PH], [PI], [PJ], [PK], [PL], [PM], [PN], [PO], [PP], [PQ], [PR], [PS], [PT], [PU], [PV], [P10], [P11], [P12], [P13], [P14], [P15], [P16], [P17], [P18], [P19], [P1A], [P1B], [P1C], [P1D], [P1E], [P1F], [P1G], [P1H], [P1I], [P1J], [P1K], [P1L], [P1M], [P1N], [P1O], [P1P], [P1Q], [P1R], [P1S], [P1T], [P1U], [P1V], [P20], [P21], [P22], [P23], [P24], [P25], [P26], [P27], [P28], [P29], [P2A], [P2B], [P2C], [P2D], [P2E], [P2F], [P2G], [P2H], [P2I], [P2J], [P2K], [P2L], [P2M], [P2N], [P2O], [P2P], [P2Q], [P2R], [P2S], [P2T], [P2U], [P2V], [P30], [P31], [P32], [P33], [P34], [P35], [P36], [P37], [P38], [P39], [P3A], [P3B], [P3C], [P3D], [P3E], [P3F], [P3G], [P3H], [P3I], [P3J], [P3K], [P3L], [P3M], [P3N], [P3O], [P3P], [P3Q], [P3R], [P3S], [P3T], [P3U], [P3V], [R0], [R1], [R2], [R3], [R4], [R5], [R6], [R7], [R8], [R9], [RA], [RB], [RC], [RD], [RE], [RF], [RG], [RH], [RI], [RJ], [RK], [RL], [RM], [RN], [RO], [RP], [RQ], [RR], [RS], [RT], [RU], [RV], [R10], [R11], [R12], [R13], [R14], [R15], [R16], [R17], [R18], [R19], [R1A], [R1B], [R1C], [R1D], [R1E], [R1F], [R1G], [R1H], [R1I], [R1J], [R1K], [R1L], [R1M], [R1N], [R1O], [R1P], [R1Q], [R1R], [R1S], [R1T], [R1U], [R1V], [R20], [R21], [R22], [R23], [R24], [R25], [R26], [R27], [R28], [R29], [R2A], [R2B], [R2C], [R2D], [R2E], [R2F], [R2G], [R2H], [R2I], [R2J], [R2K], [R2L], [R2M], [R2N], [R2O], [R2P], [R2Q], [R2R], [R2S], [R2T], [R2U], [R2V], [R30], [R31], [R32], [R33], [R34], [R35], [R36], [R37], [R38], [R39], [R3A], [R3B], [R3C], [R3D], [R3E], [R3F], [R3G], [R3H], [R3I], [R3J], [R3K], [R3L], [R3M], [R3N], [R3O], [R3P], [R3Q], [R3R], [R3S], [R3T], [R3U], [R3V], [AllowAdd], [AllowRemove], [CorrelateMultipleResources], [RemoveOrphans], [BlockProvisioning], [DiscardManualAssignments], [HideOnSimplifiedView], [ApprovalWorkflowType], [ArgumentsExpression], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8], [MaximumInsert], [MaximumDelete], [MaximumUpdate], [MaximumInsertPercent], [MaximumDeletePercent], [MaximumUpdatePercent], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [FullName_L1], [FullName_L2], [FullName_L3], [FullName_L4], [FullName_L5], [FullName_L6], [FullName_L7], [FullName_L8])
        SELECT   [Id],
                 [ValidTo],
                 [Policy_Id],
                 [Category_Id],
                 [SourceEntityType_Id],
                 [TargetEntityType_Id],
                 [ContextRule_Id],
                 [FulfillHoursAheadOfTime],
                 [TransmittedStateValidityPeriod],
                 [ValidFrom],
                 [P0],
                 [P1],
                 [P2],
                 [P3],
                 [P4],
                 [P5],
                 [P6],
                 [P7],
                 [P8],
                 [P9],
                 [PA],
                 [PB],
                 [PC],
                 [PD],
                 [PE],
                 [PF],
                 [PG],
                 [PH],
                 [PI],
                 [PJ],
                 [PK],
                 [PL],
                 [PM],
                 [PN],
                 [PO],
                 [PP],
                 [PQ],
                 [PR],
                 [PS],
                 [PT],
                 [PU],
                 [PV],
                 [P10],
                 [P11],
                 [P12],
                 [P13],
                 [P14],
                 [P15],
                 [P16],
                 [P17],
                 [P18],
                 [P19],
                 [P1A],
                 [P1B],
                 [P1C],
                 [P1D],
                 [P1E],
                 [P1F],
                 [P1G],
                 [P1H],
                 [P1I],
                 [P1J],
                 [P1K],
                 [P1L],
                 [P1M],
                 [P1N],
                 [P1O],
                 [P1P],
                 [P1Q],
                 [P1R],
                 [P1S],
                 [P1T],
                 [P1U],
                 [P1V],
                 [P20],
                 [P21],
                 [P22],
                 [P23],
                 [P24],
                 [P25],
                 [P26],
                 [P27],
                 [P28],
                 [P29],
                 [P2A],
                 [P2B],
                 [P2C],
                 [P2D],
                 [P2E],
                 [P2F],
                 [P2G],
                 [P2H],
                 [P2I],
                 [P2J],
                 [P2K],
                 [P2L],
                 [P2M],
                 [P2N],
                 [P2O],
                 [P2P],
                 [P2Q],
                 [P2R],
                 [P2S],
                 [P2T],
                 [P2U],
                 [P2V],
                 [P30],
                 [P31],
                 [P32],
                 [P33],
                 [P34],
                 [P35],
                 [P36],
                 [P37],
                 [P38],
                 [P39],
                 [P3A],
                 [P3B],
                 [P3C],
                 [P3D],
                 [P3E],
                 [P3F],
                 [P3G],
                 [P3H],
                 [P3I],
                 [P3J],
                 [P3K],
                 [P3L],
                 [P3M],
                 [P3N],
                 [P3O],
                 [P3P],
                 [P3Q],
                 [P3R],
                 [P3S],
                 [P3T],
                 [P3U],
                 [P3V],
                 [R0],
                 [R1],
                 [R2],
                 [R3],
                 [R4],
                 [R5],
                 [R6],
                 [R7],
                 [R8],
                 [R9],
                 [RA],
                 [RB],
                 [RC],
                 [RD],
                 [RE],
                 [RF],
                 [RG],
                 [RH],
                 [RI],
                 [RJ],
                 [RK],
                 [RL],
                 [RM],
                 [RN],
                 [RO],
                 [RP],
                 [RQ],
                 [RR],
                 [RS],
                 [RT],
                 [RU],
                 [RV],
                 [R10],
                 [R11],
                 [R12],
                 [R13],
                 [R14],
                 [R15],
                 [R16],
                 [R17],
                 [R18],
                 [R19],
                 [R1A],
                 [R1B],
                 [R1C],
                 [R1D],
                 [R1E],
                 [R1F],
                 [R1G],
                 [R1H],
                 [R1I],
                 [R1J],
                 [R1K],
                 [R1L],
                 [R1M],
                 [R1N],
                 [R1O],
                 [R1P],
                 [R1Q],
                 [R1R],
                 [R1S],
                 [R1T],
                 [R1U],
                 [R1V],
                 [R20],
                 [R21],
                 [R22],
                 [R23],
                 [R24],
                 [R25],
                 [R26],
                 [R27],
                 [R28],
                 [R29],
                 [R2A],
                 [R2B],
                 [R2C],
                 [R2D],
                 [R2E],
                 [R2F],
                 [R2G],
                 [R2H],
                 [R2I],
                 [R2J],
                 [R2K],
                 [R2L],
                 [R2M],
                 [R2N],
                 [R2O],
                 [R2P],
                 [R2Q],
                 [R2R],
                 [R2S],
                 [R2T],
                 [R2U],
                 [R2V],
                 [R30],
                 [R31],
                 [R32],
                 [R33],
                 [R34],
                 [R35],
                 [R36],
                 [R37],
                 [R38],
                 [R39],
                 [R3A],
                 [R3B],
                 [R3C],
                 [R3D],
                 [R3E],
                 [R3F],
                 [R3G],
                 [R3H],
                 [R3I],
                 [R3J],
                 [R3K],
                 [R3L],
                 [R3M],
                 [R3N],
                 [R3O],
                 [R3P],
                 [R3Q],
                 [R3R],
                 [R3S],
                 [R3T],
                 [R3U],
                 [R3V],
                 [AllowAdd],
                 [AllowRemove],
                 [CorrelateMultipleResources],
                 [RemoveOrphans],
                 [BlockProvisioning],
                 [DiscardManualAssignments],
                 [HideOnSimplifiedView],
                 [ApprovalWorkflowType],
                 [ArgumentsExpression],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8],
                 [MaximumInsert],
                 [MaximumDelete],
                 [MaximumUpdate],
                 [MaximumInsertPercent],
                 [MaximumDeletePercent],
                 [MaximumUpdatePercent],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [FullName_L1],
                 [FullName_L2],
                 [FullName_L3],
                 [FullName_L4],
                 [FullName_L5],
                 [FullName_L6],
                 [FullName_L7],
                 [FullName_L8]
        FROM     [dbo].[UP_ResourceTypes]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_ResourceTypes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_ResourceTypes]', N'UP_ResourceTypes';

EXECUTE sp_rename N'[dbo].[UP_ResourceTypes].[tmp_ms_xx_index_IX_ResourceTypes1]', N'IX_ResourceTypes', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_ResourceTypes1]', N'PK_ResourceTypes', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_ResourceTypes_Identifier1]', N'U_ResourceTypes_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UP_ResourceTypes].[IX_ResourceTypes_View_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_ResourceTypes_View_L1]
    ON [dbo].[UP_ResourceTypes]([SourceEntityType_Id] ASC, [FullName_L1] ASC, [Id] ASC)
    INCLUDE([DisplayName_L1], [Identifier], [ApprovalWorkflowType], [Policy_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);


GO
PRINT N'Altering [dbo].[UP_RiskRuleItems]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Altering [dbo].[UP_RiskRules]...';


GO
ALTER TABLE [dbo].[UP_RiskRules]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Altering [dbo].[UP_Risks]...';


GO
ALTER TABLE [dbo].[UP_Risks]
    ADD [WhenCreated]  SMALLDATETIME NULL,
        [CreatedBy_Id] BIGINT        NULL,
        [WhenChanged]  SMALLDATETIME NULL,
        [ChangedBy_Id] BIGINT        NULL;


GO
PRINT N'Starting rebuilding table [dbo].[UP_SingleRoleRules]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_SingleRoleRules] (
    [Id]               BIGINT        NOT NULL,
    [Policy_Id]        BIGINT        NOT NULL,
    [Type]             INT           CONSTRAINT [DF_SingleRoleRules_Type] DEFAULT ((0)) NOT NULL,
    [EntityType_Id]    BIGINT        NOT NULL,
    [Role_Id]          BIGINT        NOT NULL,
    [IsDenied]         BIT           CONSTRAINT [DF_SingleRoleRules_IsDenied] DEFAULT ((0)) NOT NULL,
    [CompositeRole_Id] BIGINT        NULL,
    [L0]               BIT           CONSTRAINT [DF_SingleRoleRules_L0] DEFAULT ((0)) NOT NULL,
    [L1]               BIT           CONSTRAINT [DF_SingleRoleRules_L1] DEFAULT ((0)) NOT NULL,
    [L2]               BIT           CONSTRAINT [DF_SingleRoleRules_L2] DEFAULT ((0)) NOT NULL,
    [L3]               BIT           CONSTRAINT [DF_SingleRoleRules_L3] DEFAULT ((0)) NOT NULL,
    [L4]               BIT           CONSTRAINT [DF_SingleRoleRules_L4] DEFAULT ((0)) NOT NULL,
    [L5]               BIT           CONSTRAINT [DF_SingleRoleRules_L5] DEFAULT ((0)) NOT NULL,
    [L6]               BIT           CONSTRAINT [DF_SingleRoleRules_L6] DEFAULT ((0)) NOT NULL,
    [L7]               BIT           CONSTRAINT [DF_SingleRoleRules_L7] DEFAULT ((0)) NOT NULL,
    [L8]               BIT           CONSTRAINT [DF_SingleRoleRules_L8] DEFAULT ((0)) NOT NULL,
    [L9]               BIT           CONSTRAINT [DF_SingleRoleRules_L9] DEFAULT ((0)) NOT NULL,
    [LA]               BIT           CONSTRAINT [DF_SingleRoleRules_LA] DEFAULT ((0)) NOT NULL,
    [LB]               BIT           CONSTRAINT [DF_SingleRoleRules_LB] DEFAULT ((0)) NOT NULL,
    [LC]               BIT           CONSTRAINT [DF_SingleRoleRules_LC] DEFAULT ((0)) NOT NULL,
    [LD]               BIT           CONSTRAINT [DF_SingleRoleRules_LD] DEFAULT ((0)) NOT NULL,
    [LE]               BIT           CONSTRAINT [DF_SingleRoleRules_LE] DEFAULT ((0)) NOT NULL,
    [LF]               BIT           CONSTRAINT [DF_SingleRoleRules_LF] DEFAULT ((0)) NOT NULL,
    [LG]               BIT           CONSTRAINT [DF_SingleRoleRules_LG] DEFAULT ((0)) NOT NULL,
    [LH]               BIT           CONSTRAINT [DF_SingleRoleRules_LH] DEFAULT ((0)) NOT NULL,
    [LI]               BIT           CONSTRAINT [DF_SingleRoleRules_LI] DEFAULT ((0)) NOT NULL,
    [LJ]               BIT           CONSTRAINT [DF_SingleRoleRules_LJ] DEFAULT ((0)) NOT NULL,
    [LK]               BIT           CONSTRAINT [DF_SingleRoleRules_LK] DEFAULT ((0)) NOT NULL,
    [LL]               BIT           CONSTRAINT [DF_SingleRoleRules_LL] DEFAULT ((0)) NOT NULL,
    [LM]               BIT           CONSTRAINT [DF_SingleRoleRules_LM] DEFAULT ((0)) NOT NULL,
    [LN]               BIT           CONSTRAINT [DF_SingleRoleRules_LN] DEFAULT ((0)) NOT NULL,
    [LO]               BIT           CONSTRAINT [DF_SingleRoleRules_LO] DEFAULT ((0)) NOT NULL,
    [LP]               BIT           CONSTRAINT [DF_SingleRoleRules_LP] DEFAULT ((0)) NOT NULL,
    [LQ]               BIT           CONSTRAINT [DF_SingleRoleRules_LQ] DEFAULT ((0)) NOT NULL,
    [LR]               BIT           CONSTRAINT [DF_SingleRoleRules_LR] DEFAULT ((0)) NOT NULL,
    [LS]               BIT           CONSTRAINT [DF_SingleRoleRules_LS] DEFAULT ((0)) NOT NULL,
    [LT]               BIT           CONSTRAINT [DF_SingleRoleRules_LT] DEFAULT ((0)) NOT NULL,
    [LU]               BIT           CONSTRAINT [DF_SingleRoleRules_LU] DEFAULT ((0)) NOT NULL,
    [LV]               BIT           CONSTRAINT [DF_SingleRoleRules_LV] DEFAULT ((0)) NOT NULL,
    [L10]              BIT           CONSTRAINT [DF_SingleRoleRules_L10] DEFAULT ((0)) NOT NULL,
    [L11]              BIT           CONSTRAINT [DF_SingleRoleRules_L11] DEFAULT ((0)) NOT NULL,
    [L12]              BIT           CONSTRAINT [DF_SingleRoleRules_L12] DEFAULT ((0)) NOT NULL,
    [L13]              BIT           CONSTRAINT [DF_SingleRoleRules_L13] DEFAULT ((0)) NOT NULL,
    [L14]              BIT           CONSTRAINT [DF_SingleRoleRules_L14] DEFAULT ((0)) NOT NULL,
    [L15]              BIT           CONSTRAINT [DF_SingleRoleRules_L15] DEFAULT ((0)) NOT NULL,
    [L16]              BIT           CONSTRAINT [DF_SingleRoleRules_L16] DEFAULT ((0)) NOT NULL,
    [L17]              BIT           CONSTRAINT [DF_SingleRoleRules_L17] DEFAULT ((0)) NOT NULL,
    [L18]              BIT           CONSTRAINT [DF_SingleRoleRules_L18] DEFAULT ((0)) NOT NULL,
    [L19]              BIT           CONSTRAINT [DF_SingleRoleRules_L19] DEFAULT ((0)) NOT NULL,
    [L1A]              BIT           CONSTRAINT [DF_SingleRoleRules_L1A] DEFAULT ((0)) NOT NULL,
    [L1B]              BIT           CONSTRAINT [DF_SingleRoleRules_L1B] DEFAULT ((0)) NOT NULL,
    [L1C]              BIT           CONSTRAINT [DF_SingleRoleRules_L1C] DEFAULT ((0)) NOT NULL,
    [L1D]              BIT           CONSTRAINT [DF_SingleRoleRules_L1D] DEFAULT ((0)) NOT NULL,
    [L1E]              BIT           CONSTRAINT [DF_SingleRoleRules_L1E] DEFAULT ((0)) NOT NULL,
    [L1F]              BIT           CONSTRAINT [DF_SingleRoleRules_L1F] DEFAULT ((0)) NOT NULL,
    [L1G]              BIT           CONSTRAINT [DF_SingleRoleRules_L1G] DEFAULT ((0)) NOT NULL,
    [L1H]              BIT           CONSTRAINT [DF_SingleRoleRules_L1H] DEFAULT ((0)) NOT NULL,
    [L1I]              BIT           CONSTRAINT [DF_SingleRoleRules_L1I] DEFAULT ((0)) NOT NULL,
    [L1J]              BIT           CONSTRAINT [DF_SingleRoleRules_L1J] DEFAULT ((0)) NOT NULL,
    [L1K]              BIT           CONSTRAINT [DF_SingleRoleRules_L1K] DEFAULT ((0)) NOT NULL,
    [L1L]              BIT           CONSTRAINT [DF_SingleRoleRules_L1L] DEFAULT ((0)) NOT NULL,
    [L1M]              BIT           CONSTRAINT [DF_SingleRoleRules_L1M] DEFAULT ((0)) NOT NULL,
    [L1N]              BIT           CONSTRAINT [DF_SingleRoleRules_L1N] DEFAULT ((0)) NOT NULL,
    [L1O]              BIT           CONSTRAINT [DF_SingleRoleRules_L1O] DEFAULT ((0)) NOT NULL,
    [L1P]              BIT           CONSTRAINT [DF_SingleRoleRules_L1P] DEFAULT ((0)) NOT NULL,
    [L1Q]              BIT           CONSTRAINT [DF_SingleRoleRules_L1Q] DEFAULT ((0)) NOT NULL,
    [L1R]              BIT           CONSTRAINT [DF_SingleRoleRules_L1R] DEFAULT ((0)) NOT NULL,
    [L1S]              BIT           CONSTRAINT [DF_SingleRoleRules_L1S] DEFAULT ((0)) NOT NULL,
    [L1T]              BIT           CONSTRAINT [DF_SingleRoleRules_L1T] DEFAULT ((0)) NOT NULL,
    [L1U]              BIT           CONSTRAINT [DF_SingleRoleRules_L1U] DEFAULT ((0)) NOT NULL,
    [L1V]              BIT           CONSTRAINT [DF_SingleRoleRules_L1V] DEFAULT ((0)) NOT NULL,
    [L20]              BIT           CONSTRAINT [DF_SingleRoleRules_L20] DEFAULT ((0)) NOT NULL,
    [L21]              BIT           CONSTRAINT [DF_SingleRoleRules_L21] DEFAULT ((0)) NOT NULL,
    [L22]              BIT           CONSTRAINT [DF_SingleRoleRules_L22] DEFAULT ((0)) NOT NULL,
    [L23]              BIT           CONSTRAINT [DF_SingleRoleRules_L23] DEFAULT ((0)) NOT NULL,
    [L24]              BIT           CONSTRAINT [DF_SingleRoleRules_L24] DEFAULT ((0)) NOT NULL,
    [L25]              BIT           CONSTRAINT [DF_SingleRoleRules_L25] DEFAULT ((0)) NOT NULL,
    [L26]              BIT           CONSTRAINT [DF_SingleRoleRules_L26] DEFAULT ((0)) NOT NULL,
    [L27]              BIT           CONSTRAINT [DF_SingleRoleRules_L27] DEFAULT ((0)) NOT NULL,
    [L28]              BIT           CONSTRAINT [DF_SingleRoleRules_L28] DEFAULT ((0)) NOT NULL,
    [L29]              BIT           CONSTRAINT [DF_SingleRoleRules_L29] DEFAULT ((0)) NOT NULL,
    [L2A]              BIT           CONSTRAINT [DF_SingleRoleRules_L2A] DEFAULT ((0)) NOT NULL,
    [L2B]              BIT           CONSTRAINT [DF_SingleRoleRules_L2B] DEFAULT ((0)) NOT NULL,
    [L2C]              BIT           CONSTRAINT [DF_SingleRoleRules_L2C] DEFAULT ((0)) NOT NULL,
    [L2D]              BIT           CONSTRAINT [DF_SingleRoleRules_L2D] DEFAULT ((0)) NOT NULL,
    [L2E]              BIT           CONSTRAINT [DF_SingleRoleRules_L2E] DEFAULT ((0)) NOT NULL,
    [L2F]              BIT           CONSTRAINT [DF_SingleRoleRules_L2F] DEFAULT ((0)) NOT NULL,
    [L2G]              BIT           CONSTRAINT [DF_SingleRoleRules_L2G] DEFAULT ((0)) NOT NULL,
    [L2H]              BIT           CONSTRAINT [DF_SingleRoleRules_L2H] DEFAULT ((0)) NOT NULL,
    [L2I]              BIT           CONSTRAINT [DF_SingleRoleRules_L2I] DEFAULT ((0)) NOT NULL,
    [L2J]              BIT           CONSTRAINT [DF_SingleRoleRules_L2J] DEFAULT ((0)) NOT NULL,
    [L2K]              BIT           CONSTRAINT [DF_SingleRoleRules_L2K] DEFAULT ((0)) NOT NULL,
    [L2L]              BIT           CONSTRAINT [DF_SingleRoleRules_L2L] DEFAULT ((0)) NOT NULL,
    [L2M]              BIT           CONSTRAINT [DF_SingleRoleRules_L2M] DEFAULT ((0)) NOT NULL,
    [L2N]              BIT           CONSTRAINT [DF_SingleRoleRules_L2N] DEFAULT ((0)) NOT NULL,
    [L2O]              BIT           CONSTRAINT [DF_SingleRoleRules_L2O] DEFAULT ((0)) NOT NULL,
    [L2P]              BIT           CONSTRAINT [DF_SingleRoleRules_L2P] DEFAULT ((0)) NOT NULL,
    [L2Q]              BIT           CONSTRAINT [DF_SingleRoleRules_L2Q] DEFAULT ((0)) NOT NULL,
    [L2R]              BIT           CONSTRAINT [DF_SingleRoleRules_L2R] DEFAULT ((0)) NOT NULL,
    [L2S]              BIT           CONSTRAINT [DF_SingleRoleRules_L2S] DEFAULT ((0)) NOT NULL,
    [L2T]              BIT           CONSTRAINT [DF_SingleRoleRules_L2T] DEFAULT ((0)) NOT NULL,
    [L2U]              BIT           CONSTRAINT [DF_SingleRoleRules_L2U] DEFAULT ((0)) NOT NULL,
    [L2V]              BIT           CONSTRAINT [DF_SingleRoleRules_L2V] DEFAULT ((0)) NOT NULL,
    [L30]              BIT           CONSTRAINT [DF_SingleRoleRules_L30] DEFAULT ((0)) NOT NULL,
    [L31]              BIT           CONSTRAINT [DF_SingleRoleRules_L31] DEFAULT ((0)) NOT NULL,
    [L32]              BIT           CONSTRAINT [DF_SingleRoleRules_L32] DEFAULT ((0)) NOT NULL,
    [L33]              BIT           CONSTRAINT [DF_SingleRoleRules_L33] DEFAULT ((0)) NOT NULL,
    [L34]              BIT           CONSTRAINT [DF_SingleRoleRules_L34] DEFAULT ((0)) NOT NULL,
    [L35]              BIT           CONSTRAINT [DF_SingleRoleRules_L35] DEFAULT ((0)) NOT NULL,
    [L36]              BIT           CONSTRAINT [DF_SingleRoleRules_L36] DEFAULT ((0)) NOT NULL,
    [L37]              BIT           CONSTRAINT [DF_SingleRoleRules_L37] DEFAULT ((0)) NOT NULL,
    [L38]              BIT           CONSTRAINT [DF_SingleRoleRules_L38] DEFAULT ((0)) NOT NULL,
    [L39]              BIT           CONSTRAINT [DF_SingleRoleRules_L39] DEFAULT ((0)) NOT NULL,
    [L3A]              BIT           CONSTRAINT [DF_SingleRoleRules_L3A] DEFAULT ((0)) NOT NULL,
    [L3B]              BIT           CONSTRAINT [DF_SingleRoleRules_L3B] DEFAULT ((0)) NOT NULL,
    [L3C]              BIT           CONSTRAINT [DF_SingleRoleRules_L3C] DEFAULT ((0)) NOT NULL,
    [L3D]              BIT           CONSTRAINT [DF_SingleRoleRules_L3D] DEFAULT ((0)) NOT NULL,
    [L3E]              BIT           CONSTRAINT [DF_SingleRoleRules_L3E] DEFAULT ((0)) NOT NULL,
    [L3F]              BIT           CONSTRAINT [DF_SingleRoleRules_L3F] DEFAULT ((0)) NOT NULL,
    [L3G]              BIT           CONSTRAINT [DF_SingleRoleRules_L3G] DEFAULT ((0)) NOT NULL,
    [L3H]              BIT           CONSTRAINT [DF_SingleRoleRules_L3H] DEFAULT ((0)) NOT NULL,
    [L3I]              BIT           CONSTRAINT [DF_SingleRoleRules_L3I] DEFAULT ((0)) NOT NULL,
    [L3J]              BIT           CONSTRAINT [DF_SingleRoleRules_L3J] DEFAULT ((0)) NOT NULL,
    [L3K]              BIT           CONSTRAINT [DF_SingleRoleRules_L3K] DEFAULT ((0)) NOT NULL,
    [L3L]              BIT           CONSTRAINT [DF_SingleRoleRules_L3L] DEFAULT ((0)) NOT NULL,
    [L3M]              BIT           CONSTRAINT [DF_SingleRoleRules_L3M] DEFAULT ((0)) NOT NULL,
    [L3N]              BIT           CONSTRAINT [DF_SingleRoleRules_L3N] DEFAULT ((0)) NOT NULL,
    [L3O]              BIT           CONSTRAINT [DF_SingleRoleRules_L3O] DEFAULT ((0)) NOT NULL,
    [L3P]              BIT           CONSTRAINT [DF_SingleRoleRules_L3P] DEFAULT ((0)) NOT NULL,
    [L3Q]              BIT           CONSTRAINT [DF_SingleRoleRules_L3Q] DEFAULT ((0)) NOT NULL,
    [L3R]              BIT           CONSTRAINT [DF_SingleRoleRules_L3R] DEFAULT ((0)) NOT NULL,
    [L3S]              BIT           CONSTRAINT [DF_SingleRoleRules_L3S] DEFAULT ((0)) NOT NULL,
    [L3T]              BIT           CONSTRAINT [DF_SingleRoleRules_L3T] DEFAULT ((0)) NOT NULL,
    [L3U]              BIT           CONSTRAINT [DF_SingleRoleRules_L3U] DEFAULT ((0)) NOT NULL,
    [L3V]              BIT           CONSTRAINT [DF_SingleRoleRules_L3V] DEFAULT ((0)) NOT NULL,
    [WhenCreated]      SMALLDATETIME NULL,
    [CreatedBy_Id]     BIGINT        NULL,
    [WhenChanged]      SMALLDATETIME NULL,
    [ChangedBy_Id]     BIGINT        NULL,
    [D0_Id]            BIGINT        NULL,
    [D1_Id]            BIGINT        NULL,
    [D2_Id]            BIGINT        NULL,
    [D3_Id]            BIGINT        NULL,
    [D4_Id]            BIGINT        NULL,
    [D5_Id]            BIGINT        NULL,
    [D6_Id]            BIGINT        NULL,
    [D7_Id]            BIGINT        NULL,
    [D8_Id]            BIGINT        NULL,
    [D9_Id]            BIGINT        NULL,
    [DA_Id]            BIGINT        NULL,
    [DB_Id]            BIGINT        NULL,
    [DC_Id]            BIGINT        NULL,
    [DD_Id]            BIGINT        NULL,
    [DE_Id]            BIGINT        NULL,
    [DF_Id]            BIGINT        NULL,
    [DG_Id]            BIGINT        NULL,
    [DH_Id]            BIGINT        NULL,
    [DI_Id]            BIGINT        NULL,
    [DJ_Id]            BIGINT        NULL,
    [DK_Id]            BIGINT        NULL,
    [DL_Id]            BIGINT        NULL,
    [DM_Id]            BIGINT        NULL,
    [DN_Id]            BIGINT        NULL,
    [DO_Id]            BIGINT        NULL,
    [DP_Id]            BIGINT        NULL,
    [DQ_Id]            BIGINT        NULL,
    [DR_Id]            BIGINT        NULL,
    [DS_Id]            BIGINT        NULL,
    [DT_Id]            BIGINT        NULL,
    [DU_Id]            BIGINT        NULL,
    [DV_Id]            BIGINT        NULL,
    [D10_Id]           BIGINT        NULL,
    [D11_Id]           BIGINT        NULL,
    [D12_Id]           BIGINT        NULL,
    [D13_Id]           BIGINT        NULL,
    [D14_Id]           BIGINT        NULL,
    [D15_Id]           BIGINT        NULL,
    [D16_Id]           BIGINT        NULL,
    [D17_Id]           BIGINT        NULL,
    [D18_Id]           BIGINT        NULL,
    [D19_Id]           BIGINT        NULL,
    [D1A_Id]           BIGINT        NULL,
    [D1B_Id]           BIGINT        NULL,
    [D1C_Id]           BIGINT        NULL,
    [D1D_Id]           BIGINT        NULL,
    [D1E_Id]           BIGINT        NULL,
    [D1F_Id]           BIGINT        NULL,
    [D1G_Id]           BIGINT        NULL,
    [D1H_Id]           BIGINT        NULL,
    [D1I_Id]           BIGINT        NULL,
    [D1J_Id]           BIGINT        NULL,
    [D1K_Id]           BIGINT        NULL,
    [D1L_Id]           BIGINT        NULL,
    [D1M_Id]           BIGINT        NULL,
    [D1N_Id]           BIGINT        NULL,
    [D1O_Id]           BIGINT        NULL,
    [D1P_Id]           BIGINT        NULL,
    [D1Q_Id]           BIGINT        NULL,
    [D1R_Id]           BIGINT        NULL,
    [D1S_Id]           BIGINT        NULL,
    [D1T_Id]           BIGINT        NULL,
    [D1U_Id]           BIGINT        NULL,
    [D1V_Id]           BIGINT        NULL,
    [D20_Id]           BIGINT        NULL,
    [D21_Id]           BIGINT        NULL,
    [D22_Id]           BIGINT        NULL,
    [D23_Id]           BIGINT        NULL,
    [D24_Id]           BIGINT        NULL,
    [D25_Id]           BIGINT        NULL,
    [D26_Id]           BIGINT        NULL,
    [D27_Id]           BIGINT        NULL,
    [D28_Id]           BIGINT        NULL,
    [D29_Id]           BIGINT        NULL,
    [D2A_Id]           BIGINT        NULL,
    [D2B_Id]           BIGINT        NULL,
    [D2C_Id]           BIGINT        NULL,
    [D2D_Id]           BIGINT        NULL,
    [D2E_Id]           BIGINT        NULL,
    [D2F_Id]           BIGINT        NULL,
    [D2G_Id]           BIGINT        NULL,
    [D2H_Id]           BIGINT        NULL,
    [D2I_Id]           BIGINT        NULL,
    [D2J_Id]           BIGINT        NULL,
    [D2K_Id]           BIGINT        NULL,
    [D2L_Id]           BIGINT        NULL,
    [D2M_Id]           BIGINT        NULL,
    [D2N_Id]           BIGINT        NULL,
    [D2O_Id]           BIGINT        NULL,
    [D2P_Id]           BIGINT        NULL,
    [D2Q_Id]           BIGINT        NULL,
    [D2R_Id]           BIGINT        NULL,
    [D2S_Id]           BIGINT        NULL,
    [D2T_Id]           BIGINT        NULL,
    [D2U_Id]           BIGINT        NULL,
    [D2V_Id]           BIGINT        NULL,
    [D30_Id]           BIGINT        NULL,
    [D31_Id]           BIGINT        NULL,
    [D32_Id]           BIGINT        NULL,
    [D33_Id]           BIGINT        NULL,
    [D34_Id]           BIGINT        NULL,
    [D35_Id]           BIGINT        NULL,
    [D36_Id]           BIGINT        NULL,
    [D37_Id]           BIGINT        NULL,
    [D38_Id]           BIGINT        NULL,
    [D39_Id]           BIGINT        NULL,
    [D3A_Id]           BIGINT        NULL,
    [D3B_Id]           BIGINT        NULL,
    [D3C_Id]           BIGINT        NULL,
    [D3D_Id]           BIGINT        NULL,
    [D3E_Id]           BIGINT        NULL,
    [D3F_Id]           BIGINT        NULL,
    [D3G_Id]           BIGINT        NULL,
    [D3H_Id]           BIGINT        NULL,
    [D3I_Id]           BIGINT        NULL,
    [D3J_Id]           BIGINT        NULL,
    [D3K_Id]           BIGINT        NULL,
    [D3L_Id]           BIGINT        NULL,
    [D3M_Id]           BIGINT        NULL,
    [D3N_Id]           BIGINT        NULL,
    [D3O_Id]           BIGINT        NULL,
    [D3P_Id]           BIGINT        NULL,
    [D3Q_Id]           BIGINT        NULL,
    [D3R_Id]           BIGINT        NULL,
    [D3S_Id]           BIGINT        NULL,
    [D3T_Id]           BIGINT        NULL,
    [D3U_Id]           BIGINT        NULL,
    [D3V_Id]           BIGINT        NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_SingleRoleRules1] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_SingleRoleRules1]
    ON [dbo].[tmp_ms_xx_UP_SingleRoleRules]([EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_SingleRoleRules])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_SingleRoleRules] ([EntityType_Id], [Role_Id], [Id], [Policy_Id], [Type], [IsDenied], [CompositeRole_Id], [L0], [L1], [L2], [L3], [L4], [L5], [L6], [L7], [L8], [L9], [LA], [LB], [LC], [LD], [LE], [LF], [LG], [LH], [LI], [LJ], [LK], [LL], [LM], [LN], [LO], [LP], [LQ], [LR], [LS], [LT], [LU], [LV], [L10], [L11], [L12], [L13], [L14], [L15], [L16], [L17], [L18], [L19], [L1A], [L1B], [L1C], [L1D], [L1E], [L1F], [L1G], [L1H], [L1I], [L1J], [L1K], [L1L], [L1M], [L1N], [L1O], [L1P], [L1Q], [L1R], [L1S], [L1T], [L1U], [L1V], [L20], [L21], [L22], [L23], [L24], [L25], [L26], [L27], [L28], [L29], [L2A], [L2B], [L2C], [L2D], [L2E], [L2F], [L2G], [L2H], [L2I], [L2J], [L2K], [L2L], [L2M], [L2N], [L2O], [L2P], [L2Q], [L2R], [L2S], [L2T], [L2U], [L2V], [L30], [L31], [L32], [L33], [L34], [L35], [L36], [L37], [L38], [L39], [L3A], [L3B], [L3C], [L3D], [L3E], [L3F], [L3G], [L3H], [L3I], [L3J], [L3K], [L3L], [L3M], [L3N], [L3O], [L3P], [L3Q], [L3R], [L3S], [L3T], [L3U], [L3V], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [EntityType_Id],
                 [Role_Id],
                 [Id],
                 [Policy_Id],
                 [Type],
                 [IsDenied],
                 [CompositeRole_Id],
                 [L0],
                 [L1],
                 [L2],
                 [L3],
                 [L4],
                 [L5],
                 [L6],
                 [L7],
                 [L8],
                 [L9],
                 [LA],
                 [LB],
                 [LC],
                 [LD],
                 [LE],
                 [LF],
                 [LG],
                 [LH],
                 [LI],
                 [LJ],
                 [LK],
                 [LL],
                 [LM],
                 [LN],
                 [LO],
                 [LP],
                 [LQ],
                 [LR],
                 [LS],
                 [LT],
                 [LU],
                 [LV],
                 [L10],
                 [L11],
                 [L12],
                 [L13],
                 [L14],
                 [L15],
                 [L16],
                 [L17],
                 [L18],
                 [L19],
                 [L1A],
                 [L1B],
                 [L1C],
                 [L1D],
                 [L1E],
                 [L1F],
                 [L1G],
                 [L1H],
                 [L1I],
                 [L1J],
                 [L1K],
                 [L1L],
                 [L1M],
                 [L1N],
                 [L1O],
                 [L1P],
                 [L1Q],
                 [L1R],
                 [L1S],
                 [L1T],
                 [L1U],
                 [L1V],
                 [L20],
                 [L21],
                 [L22],
                 [L23],
                 [L24],
                 [L25],
                 [L26],
                 [L27],
                 [L28],
                 [L29],
                 [L2A],
                 [L2B],
                 [L2C],
                 [L2D],
                 [L2E],
                 [L2F],
                 [L2G],
                 [L2H],
                 [L2I],
                 [L2J],
                 [L2K],
                 [L2L],
                 [L2M],
                 [L2N],
                 [L2O],
                 [L2P],
                 [L2Q],
                 [L2R],
                 [L2S],
                 [L2T],
                 [L2U],
                 [L2V],
                 [L30],
                 [L31],
                 [L32],
                 [L33],
                 [L34],
                 [L35],
                 [L36],
                 [L37],
                 [L38],
                 [L39],
                 [L3A],
                 [L3B],
                 [L3C],
                 [L3D],
                 [L3E],
                 [L3F],
                 [L3G],
                 [L3H],
                 [L3I],
                 [L3J],
                 [L3K],
                 [L3L],
                 [L3M],
                 [L3N],
                 [L3O],
                 [L3P],
                 [L3Q],
                 [L3R],
                 [L3S],
                 [L3T],
                 [L3U],
                 [L3V],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_SingleRoleRules]
        ORDER BY [EntityType_Id] ASC, [Role_Id] ASC, [Id] ASC;
    END

DROP TABLE [dbo].[UP_SingleRoleRules];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_SingleRoleRules]', N'UP_SingleRoleRules';

EXECUTE sp_rename N'[dbo].[UP_SingleRoleRules].[tmp_ms_xx_index_IX_SingleRoleRules1]', N'IX_SingleRoleRules', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SingleRoleRules1]', N'PK_SingleRoleRules', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UP_SingleRoles]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_SingleRoles] (
    [Id]                                           BIGINT          NOT NULL,
    [Policy_Id]                                    BIGINT          NOT NULL,
    [EntityType_Id]                                BIGINT          NOT NULL,
    [Category_Id]                                  BIGINT          NULL,
    [ValidFrom]                                    DATETIME2 (2)   CONSTRAINT [DF_SingleRoles_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]                                      DATETIME2 (2)   CONSTRAINT [DF_SingleRoles_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [P0]                                           BIT             CONSTRAINT [DF_SingleRoles_P0] DEFAULT ((0)) NOT NULL,
    [P1]                                           BIT             CONSTRAINT [DF_SingleRoles_P1] DEFAULT ((0)) NOT NULL,
    [P2]                                           BIT             CONSTRAINT [DF_SingleRoles_P2] DEFAULT ((0)) NOT NULL,
    [P3]                                           BIT             CONSTRAINT [DF_SingleRoles_P3] DEFAULT ((0)) NOT NULL,
    [P4]                                           BIT             CONSTRAINT [DF_SingleRoles_P4] DEFAULT ((0)) NOT NULL,
    [P5]                                           BIT             CONSTRAINT [DF_SingleRoles_P5] DEFAULT ((0)) NOT NULL,
    [P6]                                           BIT             CONSTRAINT [DF_SingleRoles_P6] DEFAULT ((0)) NOT NULL,
    [P7]                                           BIT             CONSTRAINT [DF_SingleRoles_P7] DEFAULT ((0)) NOT NULL,
    [P8]                                           BIT             CONSTRAINT [DF_SingleRoles_P8] DEFAULT ((0)) NOT NULL,
    [P9]                                           BIT             CONSTRAINT [DF_SingleRoles_P9] DEFAULT ((0)) NOT NULL,
    [PA]                                           BIT             CONSTRAINT [DF_SingleRoles_PA] DEFAULT ((0)) NOT NULL,
    [PB]                                           BIT             CONSTRAINT [DF_SingleRoles_PB] DEFAULT ((0)) NOT NULL,
    [PC]                                           BIT             CONSTRAINT [DF_SingleRoles_PC] DEFAULT ((0)) NOT NULL,
    [PD]                                           BIT             CONSTRAINT [DF_SingleRoles_PD] DEFAULT ((0)) NOT NULL,
    [PE]                                           BIT             CONSTRAINT [DF_SingleRoles_PE] DEFAULT ((0)) NOT NULL,
    [PF]                                           BIT             CONSTRAINT [DF_SingleRoles_PF] DEFAULT ((0)) NOT NULL,
    [PG]                                           BIT             CONSTRAINT [DF_SingleRoles_PG] DEFAULT ((0)) NOT NULL,
    [PH]                                           BIT             CONSTRAINT [DF_SingleRoles_PH] DEFAULT ((0)) NOT NULL,
    [PI]                                           BIT             CONSTRAINT [DF_SingleRoles_PI] DEFAULT ((0)) NOT NULL,
    [PJ]                                           BIT             CONSTRAINT [DF_SingleRoles_PJ] DEFAULT ((0)) NOT NULL,
    [PK]                                           BIT             CONSTRAINT [DF_SingleRoles_PK] DEFAULT ((0)) NOT NULL,
    [PL]                                           BIT             CONSTRAINT [DF_SingleRoles_PL] DEFAULT ((0)) NOT NULL,
    [PM]                                           BIT             CONSTRAINT [DF_SingleRoles_PM] DEFAULT ((0)) NOT NULL,
    [PN]                                           BIT             CONSTRAINT [DF_SingleRoles_PN] DEFAULT ((0)) NOT NULL,
    [PO]                                           BIT             CONSTRAINT [DF_SingleRoles_PO] DEFAULT ((0)) NOT NULL,
    [PP]                                           BIT             CONSTRAINT [DF_SingleRoles_PP] DEFAULT ((0)) NOT NULL,
    [PQ]                                           BIT             CONSTRAINT [DF_SingleRoles_PQ] DEFAULT ((0)) NOT NULL,
    [PR]                                           BIT             CONSTRAINT [DF_SingleRoles_PR] DEFAULT ((0)) NOT NULL,
    [PS]                                           BIT             CONSTRAINT [DF_SingleRoles_PS] DEFAULT ((0)) NOT NULL,
    [PT]                                           BIT             CONSTRAINT [DF_SingleRoles_PT] DEFAULT ((0)) NOT NULL,
    [PU]                                           BIT             CONSTRAINT [DF_SingleRoles_PU] DEFAULT ((0)) NOT NULL,
    [PV]                                           BIT             CONSTRAINT [DF_SingleRoles_PV] DEFAULT ((0)) NOT NULL,
    [P10]                                          BIT             CONSTRAINT [DF_SingleRoles_P10] DEFAULT ((0)) NOT NULL,
    [P11]                                          BIT             CONSTRAINT [DF_SingleRoles_P11] DEFAULT ((0)) NOT NULL,
    [P12]                                          BIT             CONSTRAINT [DF_SingleRoles_P12] DEFAULT ((0)) NOT NULL,
    [P13]                                          BIT             CONSTRAINT [DF_SingleRoles_P13] DEFAULT ((0)) NOT NULL,
    [P14]                                          BIT             CONSTRAINT [DF_SingleRoles_P14] DEFAULT ((0)) NOT NULL,
    [P15]                                          BIT             CONSTRAINT [DF_SingleRoles_P15] DEFAULT ((0)) NOT NULL,
    [P16]                                          BIT             CONSTRAINT [DF_SingleRoles_P16] DEFAULT ((0)) NOT NULL,
    [P17]                                          BIT             CONSTRAINT [DF_SingleRoles_P17] DEFAULT ((0)) NOT NULL,
    [P18]                                          BIT             CONSTRAINT [DF_SingleRoles_P18] DEFAULT ((0)) NOT NULL,
    [P19]                                          BIT             CONSTRAINT [DF_SingleRoles_P19] DEFAULT ((0)) NOT NULL,
    [P1A]                                          BIT             CONSTRAINT [DF_SingleRoles_P1A] DEFAULT ((0)) NOT NULL,
    [P1B]                                          BIT             CONSTRAINT [DF_SingleRoles_P1B] DEFAULT ((0)) NOT NULL,
    [P1C]                                          BIT             CONSTRAINT [DF_SingleRoles_P1C] DEFAULT ((0)) NOT NULL,
    [P1D]                                          BIT             CONSTRAINT [DF_SingleRoles_P1D] DEFAULT ((0)) NOT NULL,
    [P1E]                                          BIT             CONSTRAINT [DF_SingleRoles_P1E] DEFAULT ((0)) NOT NULL,
    [P1F]                                          BIT             CONSTRAINT [DF_SingleRoles_P1F] DEFAULT ((0)) NOT NULL,
    [P1G]                                          BIT             CONSTRAINT [DF_SingleRoles_P1G] DEFAULT ((0)) NOT NULL,
    [P1H]                                          BIT             CONSTRAINT [DF_SingleRoles_P1H] DEFAULT ((0)) NOT NULL,
    [P1I]                                          BIT             CONSTRAINT [DF_SingleRoles_P1I] DEFAULT ((0)) NOT NULL,
    [P1J]                                          BIT             CONSTRAINT [DF_SingleRoles_P1J] DEFAULT ((0)) NOT NULL,
    [P1K]                                          BIT             CONSTRAINT [DF_SingleRoles_P1K] DEFAULT ((0)) NOT NULL,
    [P1L]                                          BIT             CONSTRAINT [DF_SingleRoles_P1L] DEFAULT ((0)) NOT NULL,
    [P1M]                                          BIT             CONSTRAINT [DF_SingleRoles_P1M] DEFAULT ((0)) NOT NULL,
    [P1N]                                          BIT             CONSTRAINT [DF_SingleRoles_P1N] DEFAULT ((0)) NOT NULL,
    [P1O]                                          BIT             CONSTRAINT [DF_SingleRoles_P1O] DEFAULT ((0)) NOT NULL,
    [P1P]                                          BIT             CONSTRAINT [DF_SingleRoles_P1P] DEFAULT ((0)) NOT NULL,
    [P1Q]                                          BIT             CONSTRAINT [DF_SingleRoles_P1Q] DEFAULT ((0)) NOT NULL,
    [P1R]                                          BIT             CONSTRAINT [DF_SingleRoles_P1R] DEFAULT ((0)) NOT NULL,
    [P1S]                                          BIT             CONSTRAINT [DF_SingleRoles_P1S] DEFAULT ((0)) NOT NULL,
    [P1T]                                          BIT             CONSTRAINT [DF_SingleRoles_P1T] DEFAULT ((0)) NOT NULL,
    [P1U]                                          BIT             CONSTRAINT [DF_SingleRoles_P1U] DEFAULT ((0)) NOT NULL,
    [P1V]                                          BIT             CONSTRAINT [DF_SingleRoles_P1V] DEFAULT ((0)) NOT NULL,
    [P20]                                          BIT             CONSTRAINT [DF_SingleRoles_P20] DEFAULT ((0)) NOT NULL,
    [P21]                                          BIT             CONSTRAINT [DF_SingleRoles_P21] DEFAULT ((0)) NOT NULL,
    [P22]                                          BIT             CONSTRAINT [DF_SingleRoles_P22] DEFAULT ((0)) NOT NULL,
    [P23]                                          BIT             CONSTRAINT [DF_SingleRoles_P23] DEFAULT ((0)) NOT NULL,
    [P24]                                          BIT             CONSTRAINT [DF_SingleRoles_P24] DEFAULT ((0)) NOT NULL,
    [P25]                                          BIT             CONSTRAINT [DF_SingleRoles_P25] DEFAULT ((0)) NOT NULL,
    [P26]                                          BIT             CONSTRAINT [DF_SingleRoles_P26] DEFAULT ((0)) NOT NULL,
    [P27]                                          BIT             CONSTRAINT [DF_SingleRoles_P27] DEFAULT ((0)) NOT NULL,
    [P28]                                          BIT             CONSTRAINT [DF_SingleRoles_P28] DEFAULT ((0)) NOT NULL,
    [P29]                                          BIT             CONSTRAINT [DF_SingleRoles_P29] DEFAULT ((0)) NOT NULL,
    [P2A]                                          BIT             CONSTRAINT [DF_SingleRoles_P2A] DEFAULT ((0)) NOT NULL,
    [P2B]                                          BIT             CONSTRAINT [DF_SingleRoles_P2B] DEFAULT ((0)) NOT NULL,
    [P2C]                                          BIT             CONSTRAINT [DF_SingleRoles_P2C] DEFAULT ((0)) NOT NULL,
    [P2D]                                          BIT             CONSTRAINT [DF_SingleRoles_P2D] DEFAULT ((0)) NOT NULL,
    [P2E]                                          BIT             CONSTRAINT [DF_SingleRoles_P2E] DEFAULT ((0)) NOT NULL,
    [P2F]                                          BIT             CONSTRAINT [DF_SingleRoles_P2F] DEFAULT ((0)) NOT NULL,
    [P2G]                                          BIT             CONSTRAINT [DF_SingleRoles_P2G] DEFAULT ((0)) NOT NULL,
    [P2H]                                          BIT             CONSTRAINT [DF_SingleRoles_P2H] DEFAULT ((0)) NOT NULL,
    [P2I]                                          BIT             CONSTRAINT [DF_SingleRoles_P2I] DEFAULT ((0)) NOT NULL,
    [P2J]                                          BIT             CONSTRAINT [DF_SingleRoles_P2J] DEFAULT ((0)) NOT NULL,
    [P2K]                                          BIT             CONSTRAINT [DF_SingleRoles_P2K] DEFAULT ((0)) NOT NULL,
    [P2L]                                          BIT             CONSTRAINT [DF_SingleRoles_P2L] DEFAULT ((0)) NOT NULL,
    [P2M]                                          BIT             CONSTRAINT [DF_SingleRoles_P2M] DEFAULT ((0)) NOT NULL,
    [P2N]                                          BIT             CONSTRAINT [DF_SingleRoles_P2N] DEFAULT ((0)) NOT NULL,
    [P2O]                                          BIT             CONSTRAINT [DF_SingleRoles_P2O] DEFAULT ((0)) NOT NULL,
    [P2P]                                          BIT             CONSTRAINT [DF_SingleRoles_P2P] DEFAULT ((0)) NOT NULL,
    [P2Q]                                          BIT             CONSTRAINT [DF_SingleRoles_P2Q] DEFAULT ((0)) NOT NULL,
    [P2R]                                          BIT             CONSTRAINT [DF_SingleRoles_P2R] DEFAULT ((0)) NOT NULL,
    [P2S]                                          BIT             CONSTRAINT [DF_SingleRoles_P2S] DEFAULT ((0)) NOT NULL,
    [P2T]                                          BIT             CONSTRAINT [DF_SingleRoles_P2T] DEFAULT ((0)) NOT NULL,
    [P2U]                                          BIT             CONSTRAINT [DF_SingleRoles_P2U] DEFAULT ((0)) NOT NULL,
    [P2V]                                          BIT             CONSTRAINT [DF_SingleRoles_P2V] DEFAULT ((0)) NOT NULL,
    [P30]                                          BIT             CONSTRAINT [DF_SingleRoles_P30] DEFAULT ((0)) NOT NULL,
    [P31]                                          BIT             CONSTRAINT [DF_SingleRoles_P31] DEFAULT ((0)) NOT NULL,
    [P32]                                          BIT             CONSTRAINT [DF_SingleRoles_P32] DEFAULT ((0)) NOT NULL,
    [P33]                                          BIT             CONSTRAINT [DF_SingleRoles_P33] DEFAULT ((0)) NOT NULL,
    [P34]                                          BIT             CONSTRAINT [DF_SingleRoles_P34] DEFAULT ((0)) NOT NULL,
    [P35]                                          BIT             CONSTRAINT [DF_SingleRoles_P35] DEFAULT ((0)) NOT NULL,
    [P36]                                          BIT             CONSTRAINT [DF_SingleRoles_P36] DEFAULT ((0)) NOT NULL,
    [P37]                                          BIT             CONSTRAINT [DF_SingleRoles_P37] DEFAULT ((0)) NOT NULL,
    [P38]                                          BIT             CONSTRAINT [DF_SingleRoles_P38] DEFAULT ((0)) NOT NULL,
    [P39]                                          BIT             CONSTRAINT [DF_SingleRoles_P39] DEFAULT ((0)) NOT NULL,
    [P3A]                                          BIT             CONSTRAINT [DF_SingleRoles_P3A] DEFAULT ((0)) NOT NULL,
    [P3B]                                          BIT             CONSTRAINT [DF_SingleRoles_P3B] DEFAULT ((0)) NOT NULL,
    [P3C]                                          BIT             CONSTRAINT [DF_SingleRoles_P3C] DEFAULT ((0)) NOT NULL,
    [P3D]                                          BIT             CONSTRAINT [DF_SingleRoles_P3D] DEFAULT ((0)) NOT NULL,
    [P3E]                                          BIT             CONSTRAINT [DF_SingleRoles_P3E] DEFAULT ((0)) NOT NULL,
    [P3F]                                          BIT             CONSTRAINT [DF_SingleRoles_P3F] DEFAULT ((0)) NOT NULL,
    [P3G]                                          BIT             CONSTRAINT [DF_SingleRoles_P3G] DEFAULT ((0)) NOT NULL,
    [P3H]                                          BIT             CONSTRAINT [DF_SingleRoles_P3H] DEFAULT ((0)) NOT NULL,
    [P3I]                                          BIT             CONSTRAINT [DF_SingleRoles_P3I] DEFAULT ((0)) NOT NULL,
    [P3J]                                          BIT             CONSTRAINT [DF_SingleRoles_P3J] DEFAULT ((0)) NOT NULL,
    [P3K]                                          BIT             CONSTRAINT [DF_SingleRoles_P3K] DEFAULT ((0)) NOT NULL,
    [P3L]                                          BIT             CONSTRAINT [DF_SingleRoles_P3L] DEFAULT ((0)) NOT NULL,
    [P3M]                                          BIT             CONSTRAINT [DF_SingleRoles_P3M] DEFAULT ((0)) NOT NULL,
    [P3N]                                          BIT             CONSTRAINT [DF_SingleRoles_P3N] DEFAULT ((0)) NOT NULL,
    [P3O]                                          BIT             CONSTRAINT [DF_SingleRoles_P3O] DEFAULT ((0)) NOT NULL,
    [P3P]                                          BIT             CONSTRAINT [DF_SingleRoles_P3P] DEFAULT ((0)) NOT NULL,
    [P3Q]                                          BIT             CONSTRAINT [DF_SingleRoles_P3Q] DEFAULT ((0)) NOT NULL,
    [P3R]                                          BIT             CONSTRAINT [DF_SingleRoles_P3R] DEFAULT ((0)) NOT NULL,
    [P3S]                                          BIT             CONSTRAINT [DF_SingleRoles_P3S] DEFAULT ((0)) NOT NULL,
    [P3T]                                          BIT             CONSTRAINT [DF_SingleRoles_P3T] DEFAULT ((0)) NOT NULL,
    [P3U]                                          BIT             CONSTRAINT [DF_SingleRoles_P3U] DEFAULT ((0)) NOT NULL,
    [P3V]                                          BIT             CONSTRAINT [DF_SingleRoles_P3V] DEFAULT ((0)) NOT NULL,
    [R0]                                           BIT             CONSTRAINT [DF_SingleRoles_R0] DEFAULT ((0)) NOT NULL,
    [R1]                                           BIT             CONSTRAINT [DF_SingleRoles_R1] DEFAULT ((0)) NOT NULL,
    [R2]                                           BIT             CONSTRAINT [DF_SingleRoles_R2] DEFAULT ((0)) NOT NULL,
    [R3]                                           BIT             CONSTRAINT [DF_SingleRoles_R3] DEFAULT ((0)) NOT NULL,
    [R4]                                           BIT             CONSTRAINT [DF_SingleRoles_R4] DEFAULT ((0)) NOT NULL,
    [R5]                                           BIT             CONSTRAINT [DF_SingleRoles_R5] DEFAULT ((0)) NOT NULL,
    [R6]                                           BIT             CONSTRAINT [DF_SingleRoles_R6] DEFAULT ((0)) NOT NULL,
    [R7]                                           BIT             CONSTRAINT [DF_SingleRoles_R7] DEFAULT ((0)) NOT NULL,
    [R8]                                           BIT             CONSTRAINT [DF_SingleRoles_R8] DEFAULT ((0)) NOT NULL,
    [R9]                                           BIT             CONSTRAINT [DF_SingleRoles_R9] DEFAULT ((0)) NOT NULL,
    [RA]                                           BIT             CONSTRAINT [DF_SingleRoles_RA] DEFAULT ((0)) NOT NULL,
    [RB]                                           BIT             CONSTRAINT [DF_SingleRoles_RB] DEFAULT ((0)) NOT NULL,
    [RC]                                           BIT             CONSTRAINT [DF_SingleRoles_RC] DEFAULT ((0)) NOT NULL,
    [RD]                                           BIT             CONSTRAINT [DF_SingleRoles_RD] DEFAULT ((0)) NOT NULL,
    [RE]                                           BIT             CONSTRAINT [DF_SingleRoles_RE] DEFAULT ((0)) NOT NULL,
    [RF]                                           BIT             CONSTRAINT [DF_SingleRoles_RF] DEFAULT ((0)) NOT NULL,
    [RG]                                           BIT             CONSTRAINT [DF_SingleRoles_RG] DEFAULT ((0)) NOT NULL,
    [RH]                                           BIT             CONSTRAINT [DF_SingleRoles_RH] DEFAULT ((0)) NOT NULL,
    [RI]                                           BIT             CONSTRAINT [DF_SingleRoles_RI] DEFAULT ((0)) NOT NULL,
    [RJ]                                           BIT             CONSTRAINT [DF_SingleRoles_RJ] DEFAULT ((0)) NOT NULL,
    [RK]                                           BIT             CONSTRAINT [DF_SingleRoles_RK] DEFAULT ((0)) NOT NULL,
    [RL]                                           BIT             CONSTRAINT [DF_SingleRoles_RL] DEFAULT ((0)) NOT NULL,
    [RM]                                           BIT             CONSTRAINT [DF_SingleRoles_RM] DEFAULT ((0)) NOT NULL,
    [RN]                                           BIT             CONSTRAINT [DF_SingleRoles_RN] DEFAULT ((0)) NOT NULL,
    [RO]                                           BIT             CONSTRAINT [DF_SingleRoles_RO] DEFAULT ((0)) NOT NULL,
    [RP]                                           BIT             CONSTRAINT [DF_SingleRoles_RP] DEFAULT ((0)) NOT NULL,
    [RQ]                                           BIT             CONSTRAINT [DF_SingleRoles_RQ] DEFAULT ((0)) NOT NULL,
    [RR]                                           BIT             CONSTRAINT [DF_SingleRoles_RR] DEFAULT ((0)) NOT NULL,
    [RS]                                           BIT             CONSTRAINT [DF_SingleRoles_RS] DEFAULT ((0)) NOT NULL,
    [RT]                                           BIT             CONSTRAINT [DF_SingleRoles_RT] DEFAULT ((0)) NOT NULL,
    [RU]                                           BIT             CONSTRAINT [DF_SingleRoles_RU] DEFAULT ((0)) NOT NULL,
    [RV]                                           BIT             CONSTRAINT [DF_SingleRoles_RV] DEFAULT ((0)) NOT NULL,
    [R10]                                          BIT             CONSTRAINT [DF_SingleRoles_R10] DEFAULT ((0)) NOT NULL,
    [R11]                                          BIT             CONSTRAINT [DF_SingleRoles_R11] DEFAULT ((0)) NOT NULL,
    [R12]                                          BIT             CONSTRAINT [DF_SingleRoles_R12] DEFAULT ((0)) NOT NULL,
    [R13]                                          BIT             CONSTRAINT [DF_SingleRoles_R13] DEFAULT ((0)) NOT NULL,
    [R14]                                          BIT             CONSTRAINT [DF_SingleRoles_R14] DEFAULT ((0)) NOT NULL,
    [R15]                                          BIT             CONSTRAINT [DF_SingleRoles_R15] DEFAULT ((0)) NOT NULL,
    [R16]                                          BIT             CONSTRAINT [DF_SingleRoles_R16] DEFAULT ((0)) NOT NULL,
    [R17]                                          BIT             CONSTRAINT [DF_SingleRoles_R17] DEFAULT ((0)) NOT NULL,
    [R18]                                          BIT             CONSTRAINT [DF_SingleRoles_R18] DEFAULT ((0)) NOT NULL,
    [R19]                                          BIT             CONSTRAINT [DF_SingleRoles_R19] DEFAULT ((0)) NOT NULL,
    [R1A]                                          BIT             CONSTRAINT [DF_SingleRoles_R1A] DEFAULT ((0)) NOT NULL,
    [R1B]                                          BIT             CONSTRAINT [DF_SingleRoles_R1B] DEFAULT ((0)) NOT NULL,
    [R1C]                                          BIT             CONSTRAINT [DF_SingleRoles_R1C] DEFAULT ((0)) NOT NULL,
    [R1D]                                          BIT             CONSTRAINT [DF_SingleRoles_R1D] DEFAULT ((0)) NOT NULL,
    [R1E]                                          BIT             CONSTRAINT [DF_SingleRoles_R1E] DEFAULT ((0)) NOT NULL,
    [R1F]                                          BIT             CONSTRAINT [DF_SingleRoles_R1F] DEFAULT ((0)) NOT NULL,
    [R1G]                                          BIT             CONSTRAINT [DF_SingleRoles_R1G] DEFAULT ((0)) NOT NULL,
    [R1H]                                          BIT             CONSTRAINT [DF_SingleRoles_R1H] DEFAULT ((0)) NOT NULL,
    [R1I]                                          BIT             CONSTRAINT [DF_SingleRoles_R1I] DEFAULT ((0)) NOT NULL,
    [R1J]                                          BIT             CONSTRAINT [DF_SingleRoles_R1J] DEFAULT ((0)) NOT NULL,
    [R1K]                                          BIT             CONSTRAINT [DF_SingleRoles_R1K] DEFAULT ((0)) NOT NULL,
    [R1L]                                          BIT             CONSTRAINT [DF_SingleRoles_R1L] DEFAULT ((0)) NOT NULL,
    [R1M]                                          BIT             CONSTRAINT [DF_SingleRoles_R1M] DEFAULT ((0)) NOT NULL,
    [R1N]                                          BIT             CONSTRAINT [DF_SingleRoles_R1N] DEFAULT ((0)) NOT NULL,
    [R1O]                                          BIT             CONSTRAINT [DF_SingleRoles_R1O] DEFAULT ((0)) NOT NULL,
    [R1P]                                          BIT             CONSTRAINT [DF_SingleRoles_R1P] DEFAULT ((0)) NOT NULL,
    [R1Q]                                          BIT             CONSTRAINT [DF_SingleRoles_R1Q] DEFAULT ((0)) NOT NULL,
    [R1R]                                          BIT             CONSTRAINT [DF_SingleRoles_R1R] DEFAULT ((0)) NOT NULL,
    [R1S]                                          BIT             CONSTRAINT [DF_SingleRoles_R1S] DEFAULT ((0)) NOT NULL,
    [R1T]                                          BIT             CONSTRAINT [DF_SingleRoles_R1T] DEFAULT ((0)) NOT NULL,
    [R1U]                                          BIT             CONSTRAINT [DF_SingleRoles_R1U] DEFAULT ((0)) NOT NULL,
    [R1V]                                          BIT             CONSTRAINT [DF_SingleRoles_R1V] DEFAULT ((0)) NOT NULL,
    [R20]                                          BIT             CONSTRAINT [DF_SingleRoles_R20] DEFAULT ((0)) NOT NULL,
    [R21]                                          BIT             CONSTRAINT [DF_SingleRoles_R21] DEFAULT ((0)) NOT NULL,
    [R22]                                          BIT             CONSTRAINT [DF_SingleRoles_R22] DEFAULT ((0)) NOT NULL,
    [R23]                                          BIT             CONSTRAINT [DF_SingleRoles_R23] DEFAULT ((0)) NOT NULL,
    [R24]                                          BIT             CONSTRAINT [DF_SingleRoles_R24] DEFAULT ((0)) NOT NULL,
    [R25]                                          BIT             CONSTRAINT [DF_SingleRoles_R25] DEFAULT ((0)) NOT NULL,
    [R26]                                          BIT             CONSTRAINT [DF_SingleRoles_R26] DEFAULT ((0)) NOT NULL,
    [R27]                                          BIT             CONSTRAINT [DF_SingleRoles_R27] DEFAULT ((0)) NOT NULL,
    [R28]                                          BIT             CONSTRAINT [DF_SingleRoles_R28] DEFAULT ((0)) NOT NULL,
    [R29]                                          BIT             CONSTRAINT [DF_SingleRoles_R29] DEFAULT ((0)) NOT NULL,
    [R2A]                                          BIT             CONSTRAINT [DF_SingleRoles_R2A] DEFAULT ((0)) NOT NULL,
    [R2B]                                          BIT             CONSTRAINT [DF_SingleRoles_R2B] DEFAULT ((0)) NOT NULL,
    [R2C]                                          BIT             CONSTRAINT [DF_SingleRoles_R2C] DEFAULT ((0)) NOT NULL,
    [R2D]                                          BIT             CONSTRAINT [DF_SingleRoles_R2D] DEFAULT ((0)) NOT NULL,
    [R2E]                                          BIT             CONSTRAINT [DF_SingleRoles_R2E] DEFAULT ((0)) NOT NULL,
    [R2F]                                          BIT             CONSTRAINT [DF_SingleRoles_R2F] DEFAULT ((0)) NOT NULL,
    [R2G]                                          BIT             CONSTRAINT [DF_SingleRoles_R2G] DEFAULT ((0)) NOT NULL,
    [R2H]                                          BIT             CONSTRAINT [DF_SingleRoles_R2H] DEFAULT ((0)) NOT NULL,
    [R2I]                                          BIT             CONSTRAINT [DF_SingleRoles_R2I] DEFAULT ((0)) NOT NULL,
    [R2J]                                          BIT             CONSTRAINT [DF_SingleRoles_R2J] DEFAULT ((0)) NOT NULL,
    [R2K]                                          BIT             CONSTRAINT [DF_SingleRoles_R2K] DEFAULT ((0)) NOT NULL,
    [R2L]                                          BIT             CONSTRAINT [DF_SingleRoles_R2L] DEFAULT ((0)) NOT NULL,
    [R2M]                                          BIT             CONSTRAINT [DF_SingleRoles_R2M] DEFAULT ((0)) NOT NULL,
    [R2N]                                          BIT             CONSTRAINT [DF_SingleRoles_R2N] DEFAULT ((0)) NOT NULL,
    [R2O]                                          BIT             CONSTRAINT [DF_SingleRoles_R2O] DEFAULT ((0)) NOT NULL,
    [R2P]                                          BIT             CONSTRAINT [DF_SingleRoles_R2P] DEFAULT ((0)) NOT NULL,
    [R2Q]                                          BIT             CONSTRAINT [DF_SingleRoles_R2Q] DEFAULT ((0)) NOT NULL,
    [R2R]                                          BIT             CONSTRAINT [DF_SingleRoles_R2R] DEFAULT ((0)) NOT NULL,
    [R2S]                                          BIT             CONSTRAINT [DF_SingleRoles_R2S] DEFAULT ((0)) NOT NULL,
    [R2T]                                          BIT             CONSTRAINT [DF_SingleRoles_R2T] DEFAULT ((0)) NOT NULL,
    [R2U]                                          BIT             CONSTRAINT [DF_SingleRoles_R2U] DEFAULT ((0)) NOT NULL,
    [R2V]                                          BIT             CONSTRAINT [DF_SingleRoles_R2V] DEFAULT ((0)) NOT NULL,
    [R30]                                          BIT             CONSTRAINT [DF_SingleRoles_R30] DEFAULT ((0)) NOT NULL,
    [R31]                                          BIT             CONSTRAINT [DF_SingleRoles_R31] DEFAULT ((0)) NOT NULL,
    [R32]                                          BIT             CONSTRAINT [DF_SingleRoles_R32] DEFAULT ((0)) NOT NULL,
    [R33]                                          BIT             CONSTRAINT [DF_SingleRoles_R33] DEFAULT ((0)) NOT NULL,
    [R34]                                          BIT             CONSTRAINT [DF_SingleRoles_R34] DEFAULT ((0)) NOT NULL,
    [R35]                                          BIT             CONSTRAINT [DF_SingleRoles_R35] DEFAULT ((0)) NOT NULL,
    [R36]                                          BIT             CONSTRAINT [DF_SingleRoles_R36] DEFAULT ((0)) NOT NULL,
    [R37]                                          BIT             CONSTRAINT [DF_SingleRoles_R37] DEFAULT ((0)) NOT NULL,
    [R38]                                          BIT             CONSTRAINT [DF_SingleRoles_R38] DEFAULT ((0)) NOT NULL,
    [R39]                                          BIT             CONSTRAINT [DF_SingleRoles_R39] DEFAULT ((0)) NOT NULL,
    [R3A]                                          BIT             CONSTRAINT [DF_SingleRoles_R3A] DEFAULT ((0)) NOT NULL,
    [R3B]                                          BIT             CONSTRAINT [DF_SingleRoles_R3B] DEFAULT ((0)) NOT NULL,
    [R3C]                                          BIT             CONSTRAINT [DF_SingleRoles_R3C] DEFAULT ((0)) NOT NULL,
    [R3D]                                          BIT             CONSTRAINT [DF_SingleRoles_R3D] DEFAULT ((0)) NOT NULL,
    [R3E]                                          BIT             CONSTRAINT [DF_SingleRoles_R3E] DEFAULT ((0)) NOT NULL,
    [R3F]                                          BIT             CONSTRAINT [DF_SingleRoles_R3F] DEFAULT ((0)) NOT NULL,
    [R3G]                                          BIT             CONSTRAINT [DF_SingleRoles_R3G] DEFAULT ((0)) NOT NULL,
    [R3H]                                          BIT             CONSTRAINT [DF_SingleRoles_R3H] DEFAULT ((0)) NOT NULL,
    [R3I]                                          BIT             CONSTRAINT [DF_SingleRoles_R3I] DEFAULT ((0)) NOT NULL,
    [R3J]                                          BIT             CONSTRAINT [DF_SingleRoles_R3J] DEFAULT ((0)) NOT NULL,
    [R3K]                                          BIT             CONSTRAINT [DF_SingleRoles_R3K] DEFAULT ((0)) NOT NULL,
    [R3L]                                          BIT             CONSTRAINT [DF_SingleRoles_R3L] DEFAULT ((0)) NOT NULL,
    [R3M]                                          BIT             CONSTRAINT [DF_SingleRoles_R3M] DEFAULT ((0)) NOT NULL,
    [R3N]                                          BIT             CONSTRAINT [DF_SingleRoles_R3N] DEFAULT ((0)) NOT NULL,
    [R3O]                                          BIT             CONSTRAINT [DF_SingleRoles_R3O] DEFAULT ((0)) NOT NULL,
    [R3P]                                          BIT             CONSTRAINT [DF_SingleRoles_R3P] DEFAULT ((0)) NOT NULL,
    [R3Q]                                          BIT             CONSTRAINT [DF_SingleRoles_R3Q] DEFAULT ((0)) NOT NULL,
    [R3R]                                          BIT             CONSTRAINT [DF_SingleRoles_R3R] DEFAULT ((0)) NOT NULL,
    [R3S]                                          BIT             CONSTRAINT [DF_SingleRoles_R3S] DEFAULT ((0)) NOT NULL,
    [R3T]                                          BIT             CONSTRAINT [DF_SingleRoles_R3T] DEFAULT ((0)) NOT NULL,
    [R3U]                                          BIT             CONSTRAINT [DF_SingleRoles_R3U] DEFAULT ((0)) NOT NULL,
    [R3V]                                          BIT             CONSTRAINT [DF_SingleRoles_R3V] DEFAULT ((0)) NOT NULL,
    [ApprovalWorkflowType]                         INT             CONSTRAINT [DF_SingleRoles_ApprovalWorkflowType] DEFAULT ((0)) NOT NULL,
    [HideOnSimplifiedView]                         BIT             CONSTRAINT [DF_SingleRoles_HideOnSimplifiedView] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnApproveInReview]           TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnApproveInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeclineInReview]           TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnDeclineInReview] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnDeleteGapInReconciliation] TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnDeleteGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [CommentActivationOnKeepGapInReconciliation]   TINYINT         CONSTRAINT [DF_SingleRoles_CommentActivationOnKeepGapInReconciliation] DEFAULT ((0)) NOT NULL,
    [ImplicitApproval]                             TINYINT         CONSTRAINT [DF_SingleRoles_ImplicitApproval] DEFAULT ((0)) NOT NULL,
    [Identifier]                                   VARCHAR (442)   COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ApprovalSingleRoleType]                       INT             CONSTRAINT [DF_SingleRoles_ApprovalSingleRoleType] DEFAULT ((0)) NOT NULL,
    [DisplayName_L1]                               NVARCHAR (442)  NOT NULL,
    [DisplayName_L2]                               NVARCHAR (442)  NULL,
    [DisplayName_L3]                               NVARCHAR (442)  NULL,
    [DisplayName_L4]                               NVARCHAR (442)  NULL,
    [DisplayName_L5]                               NVARCHAR (442)  NULL,
    [DisplayName_L6]                               NVARCHAR (442)  NULL,
    [DisplayName_L7]                               NVARCHAR (442)  NULL,
    [DisplayName_L8]                               NVARCHAR (442)  NULL,
    [FullName_L1]                                  NVARCHAR (4000) NULL,
    [FullName_L2]                                  NVARCHAR (4000) NULL,
    [FullName_L3]                                  NVARCHAR (4000) NULL,
    [FullName_L4]                                  NVARCHAR (4000) NULL,
    [FullName_L5]                                  NVARCHAR (4000) NULL,
    [FullName_L6]                                  NVARCHAR (4000) NULL,
    [FullName_L7]                                  NVARCHAR (4000) NULL,
    [FullName_L8]                                  NVARCHAR (4000) NULL,
    [Description_L1]                               NVARCHAR (1024) NULL,
    [Description_L2]                               NVARCHAR (1024) NULL,
    [Description_L3]                               NVARCHAR (1024) NULL,
    [Description_L4]                               NVARCHAR (1024) NULL,
    [Description_L5]                               NVARCHAR (1024) NULL,
    [Description_L6]                               NVARCHAR (1024) NULL,
    [Description_L7]                               NVARCHAR (1024) NULL,
    [Description_L8]                               NVARCHAR (1024) NULL,
    [WhenCreated]                                  SMALLDATETIME   NULL,
    [CreatedBy_Id]                                 BIGINT          NULL,
    [WhenChanged]                                  SMALLDATETIME   NULL,
    [ChangedBy_Id]                                 BIGINT          NULL,
    [BaseRole_Id]                                  BIGINT          NULL,
    [D0_Id]                                        BIGINT          NULL,
    [D1_Id]                                        BIGINT          NULL,
    [D2_Id]                                        BIGINT          NULL,
    [D3_Id]                                        BIGINT          NULL,
    [D4_Id]                                        BIGINT          NULL,
    [D5_Id]                                        BIGINT          NULL,
    [D6_Id]                                        BIGINT          NULL,
    [D7_Id]                                        BIGINT          NULL,
    [D8_Id]                                        BIGINT          NULL,
    [D9_Id]                                        BIGINT          NULL,
    [DA_Id]                                        BIGINT          NULL,
    [DB_Id]                                        BIGINT          NULL,
    [DC_Id]                                        BIGINT          NULL,
    [DD_Id]                                        BIGINT          NULL,
    [DE_Id]                                        BIGINT          NULL,
    [DF_Id]                                        BIGINT          NULL,
    [DG_Id]                                        BIGINT          NULL,
    [DH_Id]                                        BIGINT          NULL,
    [DI_Id]                                        BIGINT          NULL,
    [DJ_Id]                                        BIGINT          NULL,
    [DK_Id]                                        BIGINT          NULL,
    [DL_Id]                                        BIGINT          NULL,
    [DM_Id]                                        BIGINT          NULL,
    [DN_Id]                                        BIGINT          NULL,
    [DO_Id]                                        BIGINT          NULL,
    [DP_Id]                                        BIGINT          NULL,
    [DQ_Id]                                        BIGINT          NULL,
    [DR_Id]                                        BIGINT          NULL,
    [DS_Id]                                        BIGINT          NULL,
    [DT_Id]                                        BIGINT          NULL,
    [DU_Id]                                        BIGINT          NULL,
    [DV_Id]                                        BIGINT          NULL,
    [D10_Id]                                       BIGINT          NULL,
    [D11_Id]                                       BIGINT          NULL,
    [D12_Id]                                       BIGINT          NULL,
    [D13_Id]                                       BIGINT          NULL,
    [D14_Id]                                       BIGINT          NULL,
    [D15_Id]                                       BIGINT          NULL,
    [D16_Id]                                       BIGINT          NULL,
    [D17_Id]                                       BIGINT          NULL,
    [D18_Id]                                       BIGINT          NULL,
    [D19_Id]                                       BIGINT          NULL,
    [D1A_Id]                                       BIGINT          NULL,
    [D1B_Id]                                       BIGINT          NULL,
    [D1C_Id]                                       BIGINT          NULL,
    [D1D_Id]                                       BIGINT          NULL,
    [D1E_Id]                                       BIGINT          NULL,
    [D1F_Id]                                       BIGINT          NULL,
    [D1G_Id]                                       BIGINT          NULL,
    [D1H_Id]                                       BIGINT          NULL,
    [D1I_Id]                                       BIGINT          NULL,
    [D1J_Id]                                       BIGINT          NULL,
    [D1K_Id]                                       BIGINT          NULL,
    [D1L_Id]                                       BIGINT          NULL,
    [D1M_Id]                                       BIGINT          NULL,
    [D1N_Id]                                       BIGINT          NULL,
    [D1O_Id]                                       BIGINT          NULL,
    [D1P_Id]                                       BIGINT          NULL,
    [D1Q_Id]                                       BIGINT          NULL,
    [D1R_Id]                                       BIGINT          NULL,
    [D1S_Id]                                       BIGINT          NULL,
    [D1T_Id]                                       BIGINT          NULL,
    [D1U_Id]                                       BIGINT          NULL,
    [D1V_Id]                                       BIGINT          NULL,
    [D20_Id]                                       BIGINT          NULL,
    [D21_Id]                                       BIGINT          NULL,
    [D22_Id]                                       BIGINT          NULL,
    [D23_Id]                                       BIGINT          NULL,
    [D24_Id]                                       BIGINT          NULL,
    [D25_Id]                                       BIGINT          NULL,
    [D26_Id]                                       BIGINT          NULL,
    [D27_Id]                                       BIGINT          NULL,
    [D28_Id]                                       BIGINT          NULL,
    [D29_Id]                                       BIGINT          NULL,
    [D2A_Id]                                       BIGINT          NULL,
    [D2B_Id]                                       BIGINT          NULL,
    [D2C_Id]                                       BIGINT          NULL,
    [D2D_Id]                                       BIGINT          NULL,
    [D2E_Id]                                       BIGINT          NULL,
    [D2F_Id]                                       BIGINT          NULL,
    [D2G_Id]                                       BIGINT          NULL,
    [D2H_Id]                                       BIGINT          NULL,
    [D2I_Id]                                       BIGINT          NULL,
    [D2J_Id]                                       BIGINT          NULL,
    [D2K_Id]                                       BIGINT          NULL,
    [D2L_Id]                                       BIGINT          NULL,
    [D2M_Id]                                       BIGINT          NULL,
    [D2N_Id]                                       BIGINT          NULL,
    [D2O_Id]                                       BIGINT          NULL,
    [D2P_Id]                                       BIGINT          NULL,
    [D2Q_Id]                                       BIGINT          NULL,
    [D2R_Id]                                       BIGINT          NULL,
    [D2S_Id]                                       BIGINT          NULL,
    [D2T_Id]                                       BIGINT          NULL,
    [D2U_Id]                                       BIGINT          NULL,
    [D2V_Id]                                       BIGINT          NULL,
    [D30_Id]                                       BIGINT          NULL,
    [D31_Id]                                       BIGINT          NULL,
    [D32_Id]                                       BIGINT          NULL,
    [D33_Id]                                       BIGINT          NULL,
    [D34_Id]                                       BIGINT          NULL,
    [D35_Id]                                       BIGINT          NULL,
    [D36_Id]                                       BIGINT          NULL,
    [D37_Id]                                       BIGINT          NULL,
    [D38_Id]                                       BIGINT          NULL,
    [D39_Id]                                       BIGINT          NULL,
    [D3A_Id]                                       BIGINT          NULL,
    [D3B_Id]                                       BIGINT          NULL,
    [D3C_Id]                                       BIGINT          NULL,
    [D3D_Id]                                       BIGINT          NULL,
    [D3E_Id]                                       BIGINT          NULL,
    [D3F_Id]                                       BIGINT          NULL,
    [D3G_Id]                                       BIGINT          NULL,
    [D3H_Id]                                       BIGINT          NULL,
    [D3I_Id]                                       BIGINT          NULL,
    [D3J_Id]                                       BIGINT          NULL,
    [D3K_Id]                                       BIGINT          NULL,
    [D3L_Id]                                       BIGINT          NULL,
    [D3M_Id]                                       BIGINT          NULL,
    [D3N_Id]                                       BIGINT          NULL,
    [D3O_Id]                                       BIGINT          NULL,
    [D3P_Id]                                       BIGINT          NULL,
    [D3Q_Id]                                       BIGINT          NULL,
    [D3R_Id]                                       BIGINT          NULL,
    [D3S_Id]                                       BIGINT          NULL,
    [D3T_Id]                                       BIGINT          NULL,
    [D3U_Id]                                       BIGINT          NULL,
    [D3V_Id]                                       BIGINT          NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_SingleRoles1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_SingleRoles_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_SingleRoles1]
    ON [dbo].[tmp_ms_xx_UP_SingleRoles]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UP_SingleRoles])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_SingleRoles] ([Id], [ValidTo], [Policy_Id], [EntityType_Id], [Category_Id], [ValidFrom], [P0], [P1], [P2], [P3], [P4], [P5], [P6], [P7], [P8], [P9], [PA], [PB], [PC], [PD], [PE], [PF], [PG], [PH], [PI], [PJ], [PK], [PL], [PM], [PN], [PO], [PP], [PQ], [PR], [PS], [PT], [PU], [PV], [P10], [P11], [P12], [P13], [P14], [P15], [P16], [P17], [P18], [P19], [P1A], [P1B], [P1C], [P1D], [P1E], [P1F], [P1G], [P1H], [P1I], [P1J], [P1K], [P1L], [P1M], [P1N], [P1O], [P1P], [P1Q], [P1R], [P1S], [P1T], [P1U], [P1V], [P20], [P21], [P22], [P23], [P24], [P25], [P26], [P27], [P28], [P29], [P2A], [P2B], [P2C], [P2D], [P2E], [P2F], [P2G], [P2H], [P2I], [P2J], [P2K], [P2L], [P2M], [P2N], [P2O], [P2P], [P2Q], [P2R], [P2S], [P2T], [P2U], [P2V], [P30], [P31], [P32], [P33], [P34], [P35], [P36], [P37], [P38], [P39], [P3A], [P3B], [P3C], [P3D], [P3E], [P3F], [P3G], [P3H], [P3I], [P3J], [P3K], [P3L], [P3M], [P3N], [P3O], [P3P], [P3Q], [P3R], [P3S], [P3T], [P3U], [P3V], [R0], [R1], [R2], [R3], [R4], [R5], [R6], [R7], [R8], [R9], [RA], [RB], [RC], [RD], [RE], [RF], [RG], [RH], [RI], [RJ], [RK], [RL], [RM], [RN], [RO], [RP], [RQ], [RR], [RS], [RT], [RU], [RV], [R10], [R11], [R12], [R13], [R14], [R15], [R16], [R17], [R18], [R19], [R1A], [R1B], [R1C], [R1D], [R1E], [R1F], [R1G], [R1H], [R1I], [R1J], [R1K], [R1L], [R1M], [R1N], [R1O], [R1P], [R1Q], [R1R], [R1S], [R1T], [R1U], [R1V], [R20], [R21], [R22], [R23], [R24], [R25], [R26], [R27], [R28], [R29], [R2A], [R2B], [R2C], [R2D], [R2E], [R2F], [R2G], [R2H], [R2I], [R2J], [R2K], [R2L], [R2M], [R2N], [R2O], [R2P], [R2Q], [R2R], [R2S], [R2T], [R2U], [R2V], [R30], [R31], [R32], [R33], [R34], [R35], [R36], [R37], [R38], [R39], [R3A], [R3B], [R3C], [R3D], [R3E], [R3F], [R3G], [R3H], [R3I], [R3J], [R3K], [R3L], [R3M], [R3N], [R3O], [R3P], [R3Q], [R3R], [R3S], [R3T], [R3U], [R3V], [ApprovalWorkflowType], [HideOnSimplifiedView], [CommentActivationOnApproveInReview], [CommentActivationOnDeclineInReview], [CommentActivationOnDeleteGapInReconciliation], [CommentActivationOnKeepGapInReconciliation], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [FullName_L1], [FullName_L2], [FullName_L3], [FullName_L4], [FullName_L5], [FullName_L6], [FullName_L7], [FullName_L8], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8], [D0_Id], [D1_Id], [D2_Id], [D3_Id], [D4_Id], [D5_Id], [D6_Id], [D7_Id], [D8_Id], [D9_Id], [DA_Id], [DB_Id], [DC_Id], [DD_Id], [DE_Id], [DF_Id], [DG_Id], [DH_Id], [DI_Id], [DJ_Id], [DK_Id], [DL_Id], [DM_Id], [DN_Id], [DO_Id], [DP_Id], [DQ_Id], [DR_Id], [DS_Id], [DT_Id], [DU_Id], [DV_Id], [D10_Id], [D11_Id], [D12_Id], [D13_Id], [D14_Id], [D15_Id], [D16_Id], [D17_Id], [D18_Id], [D19_Id], [D1A_Id], [D1B_Id], [D1C_Id], [D1D_Id], [D1E_Id], [D1F_Id], [D1G_Id], [D1H_Id], [D1I_Id], [D1J_Id], [D1K_Id], [D1L_Id], [D1M_Id], [D1N_Id], [D1O_Id], [D1P_Id], [D1Q_Id], [D1R_Id], [D1S_Id], [D1T_Id], [D1U_Id], [D1V_Id], [D20_Id], [D21_Id], [D22_Id], [D23_Id], [D24_Id], [D25_Id], [D26_Id], [D27_Id], [D28_Id], [D29_Id], [D2A_Id], [D2B_Id], [D2C_Id], [D2D_Id], [D2E_Id], [D2F_Id], [D2G_Id], [D2H_Id], [D2I_Id], [D2J_Id], [D2K_Id], [D2L_Id], [D2M_Id], [D2N_Id], [D2O_Id], [D2P_Id], [D2Q_Id], [D2R_Id], [D2S_Id], [D2T_Id], [D2U_Id], [D2V_Id], [D30_Id], [D31_Id], [D32_Id], [D33_Id], [D34_Id], [D35_Id], [D36_Id], [D37_Id], [D38_Id], [D39_Id], [D3A_Id], [D3B_Id], [D3C_Id], [D3D_Id], [D3E_Id], [D3F_Id], [D3G_Id], [D3H_Id], [D3I_Id], [D3J_Id], [D3K_Id], [D3L_Id], [D3M_Id], [D3N_Id], [D3O_Id], [D3P_Id], [D3Q_Id], [D3R_Id], [D3S_Id], [D3T_Id], [D3U_Id], [D3V_Id])
        SELECT   [Id],
                 [ValidTo],
                 [Policy_Id],
                 [EntityType_Id],
                 [Category_Id],
                 [ValidFrom],
                 [P0],
                 [P1],
                 [P2],
                 [P3],
                 [P4],
                 [P5],
                 [P6],
                 [P7],
                 [P8],
                 [P9],
                 [PA],
                 [PB],
                 [PC],
                 [PD],
                 [PE],
                 [PF],
                 [PG],
                 [PH],
                 [PI],
                 [PJ],
                 [PK],
                 [PL],
                 [PM],
                 [PN],
                 [PO],
                 [PP],
                 [PQ],
                 [PR],
                 [PS],
                 [PT],
                 [PU],
                 [PV],
                 [P10],
                 [P11],
                 [P12],
                 [P13],
                 [P14],
                 [P15],
                 [P16],
                 [P17],
                 [P18],
                 [P19],
                 [P1A],
                 [P1B],
                 [P1C],
                 [P1D],
                 [P1E],
                 [P1F],
                 [P1G],
                 [P1H],
                 [P1I],
                 [P1J],
                 [P1K],
                 [P1L],
                 [P1M],
                 [P1N],
                 [P1O],
                 [P1P],
                 [P1Q],
                 [P1R],
                 [P1S],
                 [P1T],
                 [P1U],
                 [P1V],
                 [P20],
                 [P21],
                 [P22],
                 [P23],
                 [P24],
                 [P25],
                 [P26],
                 [P27],
                 [P28],
                 [P29],
                 [P2A],
                 [P2B],
                 [P2C],
                 [P2D],
                 [P2E],
                 [P2F],
                 [P2G],
                 [P2H],
                 [P2I],
                 [P2J],
                 [P2K],
                 [P2L],
                 [P2M],
                 [P2N],
                 [P2O],
                 [P2P],
                 [P2Q],
                 [P2R],
                 [P2S],
                 [P2T],
                 [P2U],
                 [P2V],
                 [P30],
                 [P31],
                 [P32],
                 [P33],
                 [P34],
                 [P35],
                 [P36],
                 [P37],
                 [P38],
                 [P39],
                 [P3A],
                 [P3B],
                 [P3C],
                 [P3D],
                 [P3E],
                 [P3F],
                 [P3G],
                 [P3H],
                 [P3I],
                 [P3J],
                 [P3K],
                 [P3L],
                 [P3M],
                 [P3N],
                 [P3O],
                 [P3P],
                 [P3Q],
                 [P3R],
                 [P3S],
                 [P3T],
                 [P3U],
                 [P3V],
                 [R0],
                 [R1],
                 [R2],
                 [R3],
                 [R4],
                 [R5],
                 [R6],
                 [R7],
                 [R8],
                 [R9],
                 [RA],
                 [RB],
                 [RC],
                 [RD],
                 [RE],
                 [RF],
                 [RG],
                 [RH],
                 [RI],
                 [RJ],
                 [RK],
                 [RL],
                 [RM],
                 [RN],
                 [RO],
                 [RP],
                 [RQ],
                 [RR],
                 [RS],
                 [RT],
                 [RU],
                 [RV],
                 [R10],
                 [R11],
                 [R12],
                 [R13],
                 [R14],
                 [R15],
                 [R16],
                 [R17],
                 [R18],
                 [R19],
                 [R1A],
                 [R1B],
                 [R1C],
                 [R1D],
                 [R1E],
                 [R1F],
                 [R1G],
                 [R1H],
                 [R1I],
                 [R1J],
                 [R1K],
                 [R1L],
                 [R1M],
                 [R1N],
                 [R1O],
                 [R1P],
                 [R1Q],
                 [R1R],
                 [R1S],
                 [R1T],
                 [R1U],
                 [R1V],
                 [R20],
                 [R21],
                 [R22],
                 [R23],
                 [R24],
                 [R25],
                 [R26],
                 [R27],
                 [R28],
                 [R29],
                 [R2A],
                 [R2B],
                 [R2C],
                 [R2D],
                 [R2E],
                 [R2F],
                 [R2G],
                 [R2H],
                 [R2I],
                 [R2J],
                 [R2K],
                 [R2L],
                 [R2M],
                 [R2N],
                 [R2O],
                 [R2P],
                 [R2Q],
                 [R2R],
                 [R2S],
                 [R2T],
                 [R2U],
                 [R2V],
                 [R30],
                 [R31],
                 [R32],
                 [R33],
                 [R34],
                 [R35],
                 [R36],
                 [R37],
                 [R38],
                 [R39],
                 [R3A],
                 [R3B],
                 [R3C],
                 [R3D],
                 [R3E],
                 [R3F],
                 [R3G],
                 [R3H],
                 [R3I],
                 [R3J],
                 [R3K],
                 [R3L],
                 [R3M],
                 [R3N],
                 [R3O],
                 [R3P],
                 [R3Q],
                 [R3R],
                 [R3S],
                 [R3T],
                 [R3U],
                 [R3V],
                 [ApprovalWorkflowType],
                 [HideOnSimplifiedView],
                 [CommentActivationOnApproveInReview],
                 [CommentActivationOnDeclineInReview],
                 [CommentActivationOnDeleteGapInReconciliation],
                 [CommentActivationOnKeepGapInReconciliation],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [FullName_L1],
                 [FullName_L2],
                 [FullName_L3],
                 [FullName_L4],
                 [FullName_L5],
                 [FullName_L6],
                 [FullName_L7],
                 [FullName_L8],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8],
                 [D0_Id],
                 [D1_Id],
                 [D2_Id],
                 [D3_Id],
                 [D4_Id],
                 [D5_Id],
                 [D6_Id],
                 [D7_Id],
                 [D8_Id],
                 [D9_Id],
                 [DA_Id],
                 [DB_Id],
                 [DC_Id],
                 [DD_Id],
                 [DE_Id],
                 [DF_Id],
                 [DG_Id],
                 [DH_Id],
                 [DI_Id],
                 [DJ_Id],
                 [DK_Id],
                 [DL_Id],
                 [DM_Id],
                 [DN_Id],
                 [DO_Id],
                 [DP_Id],
                 [DQ_Id],
                 [DR_Id],
                 [DS_Id],
                 [DT_Id],
                 [DU_Id],
                 [DV_Id],
                 [D10_Id],
                 [D11_Id],
                 [D12_Id],
                 [D13_Id],
                 [D14_Id],
                 [D15_Id],
                 [D16_Id],
                 [D17_Id],
                 [D18_Id],
                 [D19_Id],
                 [D1A_Id],
                 [D1B_Id],
                 [D1C_Id],
                 [D1D_Id],
                 [D1E_Id],
                 [D1F_Id],
                 [D1G_Id],
                 [D1H_Id],
                 [D1I_Id],
                 [D1J_Id],
                 [D1K_Id],
                 [D1L_Id],
                 [D1M_Id],
                 [D1N_Id],
                 [D1O_Id],
                 [D1P_Id],
                 [D1Q_Id],
                 [D1R_Id],
                 [D1S_Id],
                 [D1T_Id],
                 [D1U_Id],
                 [D1V_Id],
                 [D20_Id],
                 [D21_Id],
                 [D22_Id],
                 [D23_Id],
                 [D24_Id],
                 [D25_Id],
                 [D26_Id],
                 [D27_Id],
                 [D28_Id],
                 [D29_Id],
                 [D2A_Id],
                 [D2B_Id],
                 [D2C_Id],
                 [D2D_Id],
                 [D2E_Id],
                 [D2F_Id],
                 [D2G_Id],
                 [D2H_Id],
                 [D2I_Id],
                 [D2J_Id],
                 [D2K_Id],
                 [D2L_Id],
                 [D2M_Id],
                 [D2N_Id],
                 [D2O_Id],
                 [D2P_Id],
                 [D2Q_Id],
                 [D2R_Id],
                 [D2S_Id],
                 [D2T_Id],
                 [D2U_Id],
                 [D2V_Id],
                 [D30_Id],
                 [D31_Id],
                 [D32_Id],
                 [D33_Id],
                 [D34_Id],
                 [D35_Id],
                 [D36_Id],
                 [D37_Id],
                 [D38_Id],
                 [D39_Id],
                 [D3A_Id],
                 [D3B_Id],
                 [D3C_Id],
                 [D3D_Id],
                 [D3E_Id],
                 [D3F_Id],
                 [D3G_Id],
                 [D3H_Id],
                 [D3I_Id],
                 [D3J_Id],
                 [D3K_Id],
                 [D3L_Id],
                 [D3M_Id],
                 [D3N_Id],
                 [D3O_Id],
                 [D3P_Id],
                 [D3Q_Id],
                 [D3R_Id],
                 [D3S_Id],
                 [D3T_Id],
                 [D3U_Id],
                 [D3V_Id]
        FROM     [dbo].[UP_SingleRoles]
        ORDER BY [Id] ASC, [ValidTo] ASC;
    END

DROP TABLE [dbo].[UP_SingleRoles];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_SingleRoles]', N'UP_SingleRoles';

EXECUTE sp_rename N'[dbo].[UP_SingleRoles].[tmp_ms_xx_index_IX_SingleRoles1]', N'IX_SingleRoles', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SingleRoles1]', N'PK_SingleRoles', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_SingleRoles_Identifier1]', N'U_SingleRoles_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[UP_SingleRoles].[IX_SingleRoles_View_L1]...';


GO
CREATE NONCLUSTERED INDEX [IX_SingleRoles_View_L1]
    ON [dbo].[UP_SingleRoles]([EntityType_Id] ASC, [FullName_L1] ASC, [Id] ASC)
    INCLUDE([DisplayName_L1], [Identifier], [ApprovalWorkflowType], [Policy_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121);


GO
PRINT N'Creating [dbo].[UP_CompositeRoles].[S_CompositeRoles_Type]...';


GO
CREATE STATISTICS [S_CompositeRoles_Type]
    ON [dbo].[UP_CompositeRoles]([EntityType_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[UP_ResourceTypes].[S_ResourceTypes_Type]...';


GO
CREATE STATISTICS [S_ResourceTypes_Type]
    ON [dbo].[UP_ResourceTypes]([SourceEntityType_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[UP_SingleRoles].[S_SingleRoles_Type]...';


GO
CREATE STATISTICS [S_SingleRoles_Type]
    ON [dbo].[UP_SingleRoles]([EntityType_Id]) WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
    WITH FULLSCAN;


GO
PRINT N'Creating [dbo].[FK_ConnectionColumns_Table]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] WITH NOCHECK
    ADD CONSTRAINT [FK_ConnectionColumns_Table] FOREIGN KEY ([Table_Id]) REFERENCES [dbo].[UC_ConnectionTables] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ConnectionColumns_ForeignColumn]...';


GO
ALTER TABLE [dbo].[UC_ConnectionColumns] WITH NOCHECK
    ADD CONSTRAINT [FK_ConnectionColumns_ForeignColumn] FOREIGN KEY ([ForeignColumn_Id]) REFERENCES [dbo].[UC_ConnectionColumns] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoleRules_CompositeRoles]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoleRules_CompositeRoles] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedCompositeRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedCompositeRoles_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] NOCHECK CONSTRAINT [FK_AssignedCompositeRoles_Role];


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_CompositeRolesCategories_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRolesCategories_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_CompositeRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_CompositeRole]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_CompositeRole] FOREIGN KEY ([CompositeRole_Id]) REFERENCES [dbo].[UP_CompositeRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_ContextRule]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_ContextRule] FOREIGN KEY ([ContextRule_Id]) REFERENCES [dbo].[UP_ContextRules] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BA_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BA_Id] FOREIGN KEY ([BA_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BB_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BB_Id] FOREIGN KEY ([BB_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BC_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BC_Id] FOREIGN KEY ([BC_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BD_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BD_Id] FOREIGN KEY ([BD_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BE_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BE_Id] FOREIGN KEY ([BE_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BF_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BF_Id] FOREIGN KEY ([BF_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BG_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BG_Id] FOREIGN KEY ([BG_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BH_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BH_Id] FOREIGN KEY ([BH_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BI_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BI_Id] FOREIGN KEY ([BI_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BJ_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BJ_Id] FOREIGN KEY ([BJ_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BK_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BK_Id] FOREIGN KEY ([BK_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BL_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BL_Id] FOREIGN KEY ([BL_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BM_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BM_Id] FOREIGN KEY ([BM_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BN_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BN_Id] FOREIGN KEY ([BN_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BO_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BO_Id] FOREIGN KEY ([BO_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BP_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BP_Id] FOREIGN KEY ([BP_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BQ_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BQ_Id] FOREIGN KEY ([BQ_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BR_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BR_Id] FOREIGN KEY ([BR_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BS_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BS_Id] FOREIGN KEY ([BS_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BT_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BT_Id] FOREIGN KEY ([BT_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BU_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BU_Id] FOREIGN KEY ([BU_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_BV_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_BV_Id] FOREIGN KEY ([BV_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B10_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B10_Id] FOREIGN KEY ([B10_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B11_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B11_Id] FOREIGN KEY ([B11_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B12_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B12_Id] FOREIGN KEY ([B12_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B13_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B13_Id] FOREIGN KEY ([B13_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B14_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B14_Id] FOREIGN KEY ([B14_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B15_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B15_Id] FOREIGN KEY ([B15_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B16_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B16_Id] FOREIGN KEY ([B16_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B17_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B17_Id] FOREIGN KEY ([B17_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B18_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B18_Id] FOREIGN KEY ([B18_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B19_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B19_Id] FOREIGN KEY ([B19_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1A_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1A_Id] FOREIGN KEY ([B1A_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1B_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1B_Id] FOREIGN KEY ([B1B_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1C_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1C_Id] FOREIGN KEY ([B1C_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1D_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1D_Id] FOREIGN KEY ([B1D_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1E_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1E_Id] FOREIGN KEY ([B1E_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1F_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1F_Id] FOREIGN KEY ([B1F_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1G_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1G_Id] FOREIGN KEY ([B1G_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1H_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1H_Id] FOREIGN KEY ([B1H_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1I_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1I_Id] FOREIGN KEY ([B1I_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1J_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1J_Id] FOREIGN KEY ([B1J_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1K_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1K_Id] FOREIGN KEY ([B1K_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1L_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1L_Id] FOREIGN KEY ([B1L_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1M_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1M_Id] FOREIGN KEY ([B1M_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1N_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1N_Id] FOREIGN KEY ([B1N_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1O_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1O_Id] FOREIGN KEY ([B1O_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1P_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1P_Id] FOREIGN KEY ([B1P_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1Q_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1Q_Id] FOREIGN KEY ([B1Q_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1R_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1R_Id] FOREIGN KEY ([B1R_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1S_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1S_Id] FOREIGN KEY ([B1S_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1T_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1T_Id] FOREIGN KEY ([B1T_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1U_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1U_Id] FOREIGN KEY ([B1U_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1V_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1V_Id] FOREIGN KEY ([B1V_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B20_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B20_Id] FOREIGN KEY ([B20_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B21_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B21_Id] FOREIGN KEY ([B21_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B22_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B22_Id] FOREIGN KEY ([B22_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B23_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B23_Id] FOREIGN KEY ([B23_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B24_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B24_Id] FOREIGN KEY ([B24_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B25_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B25_Id] FOREIGN KEY ([B25_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B26_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B26_Id] FOREIGN KEY ([B26_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B27_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B27_Id] FOREIGN KEY ([B27_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B28_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B28_Id] FOREIGN KEY ([B28_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B29_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B29_Id] FOREIGN KEY ([B29_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2A_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2A_Id] FOREIGN KEY ([B2A_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2B_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2B_Id] FOREIGN KEY ([B2B_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2C_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2C_Id] FOREIGN KEY ([B2C_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2D_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2D_Id] FOREIGN KEY ([B2D_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2E_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2E_Id] FOREIGN KEY ([B2E_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2F_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2F_Id] FOREIGN KEY ([B2F_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2G_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2G_Id] FOREIGN KEY ([B2G_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2H_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2H_Id] FOREIGN KEY ([B2H_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2I_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2I_Id] FOREIGN KEY ([B2I_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2J_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2J_Id] FOREIGN KEY ([B2J_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2K_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2K_Id] FOREIGN KEY ([B2K_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2L_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2L_Id] FOREIGN KEY ([B2L_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2M_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2M_Id] FOREIGN KEY ([B2M_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2N_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2N_Id] FOREIGN KEY ([B2N_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2O_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2O_Id] FOREIGN KEY ([B2O_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2P_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2P_Id] FOREIGN KEY ([B2P_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2Q_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2Q_Id] FOREIGN KEY ([B2Q_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2R_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2R_Id] FOREIGN KEY ([B2R_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2S_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2S_Id] FOREIGN KEY ([B2S_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2T_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2T_Id] FOREIGN KEY ([B2T_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2U_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2U_Id] FOREIGN KEY ([B2U_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2V_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2V_Id] FOREIGN KEY ([B2V_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B30_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B30_Id] FOREIGN KEY ([B30_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B31_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B31_Id] FOREIGN KEY ([B31_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B32_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B32_Id] FOREIGN KEY ([B32_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B33_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B33_Id] FOREIGN KEY ([B33_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B34_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B34_Id] FOREIGN KEY ([B34_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B35_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B35_Id] FOREIGN KEY ([B35_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B36_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B36_Id] FOREIGN KEY ([B36_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B37_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B37_Id] FOREIGN KEY ([B37_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B38_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B38_Id] FOREIGN KEY ([B38_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B39_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B39_Id] FOREIGN KEY ([B39_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3A_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3A_Id] FOREIGN KEY ([B3A_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3B_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3B_Id] FOREIGN KEY ([B3B_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3C_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3C_Id] FOREIGN KEY ([B3C_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3D_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3D_Id] FOREIGN KEY ([B3D_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3E_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3E_Id] FOREIGN KEY ([B3E_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3F_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3F_Id] FOREIGN KEY ([B3F_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3G_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3G_Id] FOREIGN KEY ([B3G_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3H_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3H_Id] FOREIGN KEY ([B3H_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3I_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3I_Id] FOREIGN KEY ([B3I_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3J_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3J_Id] FOREIGN KEY ([B3J_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3K_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3K_Id] FOREIGN KEY ([B3K_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3L_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3L_Id] FOREIGN KEY ([B3L_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3M_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3M_Id] FOREIGN KEY ([B3M_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3N_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3N_Id] FOREIGN KEY ([B3N_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3O_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3O_Id] FOREIGN KEY ([B3O_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3P_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3P_Id] FOREIGN KEY ([B3P_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3Q_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3Q_Id] FOREIGN KEY ([B3Q_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3R_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3R_Id] FOREIGN KEY ([B3R_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3S_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3S_Id] FOREIGN KEY ([B3S_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3T_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3T_Id] FOREIGN KEY ([B3T_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3U_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3U_Id] FOREIGN KEY ([B3U_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3V_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3V_Id] FOREIGN KEY ([B3V_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_SourceEntityTypes]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_SourceEntityTypes] FOREIGN KEY ([SourceEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_ResourcesBinding]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_ResourcesBinding] FOREIGN KEY ([ResourcesBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_ResourcesStartBinding_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_ResourcesStartBinding_Id] FOREIGN KEY ([ResourcesStartBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_ResourcesEndBinding_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_ResourcesEndBinding_Id] FOREIGN KEY ([ResourcesEndBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B0_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B0_Id] FOREIGN KEY ([B0_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B1_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B1_Id] FOREIGN KEY ([B1_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B2_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B2_Id] FOREIGN KEY ([B2_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B3_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B3_Id] FOREIGN KEY ([B3_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B4_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B4_Id] FOREIGN KEY ([B4_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B5_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B5_Id] FOREIGN KEY ([B5_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B6_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B6_Id] FOREIGN KEY ([B6_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B7_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B7_Id] FOREIGN KEY ([B7_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B8_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B8_Id] FOREIGN KEY ([B8_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ContextRules_B9_Id]...';


GO
ALTER TABLE [dbo].[UP_ContextRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ContextRules_B9_Id] FOREIGN KEY ([B9_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_RiskRules] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleCounters_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleCounters] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleCounters_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_Policy]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceBinaryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceBinaryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceBinaryRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Categories_Policy]...';


GO
ALTER TABLE [dbo].[UP_Categories] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Risks_Policy]...';


GO
ALTER TABLE [dbo].[UP_Risks] WITH NOCHECK
    ADD CONSTRAINT [FK_Risks_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_Policy]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_Policy]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_Property]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_Property] FOREIGN KEY ([Property_Id]) REFERENCES [dbo].[UM_EntityProperties] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceNavigationRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceNavigationRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeRules_SingleRole0]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeRules_SingleRole0] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_SourceEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_SourceEntityType] FOREIGN KEY ([SourceEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_TargetEntityType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_TargetEntityType] FOREIGN KEY ([TargetEntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypes_Category]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypesCategories_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypesCategories_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RiskRuleItems_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RiskRuleItems] WITH NOCHECK
    ADD CONSTRAINT [FK_RiskRuleItems_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskResourceTypes_EntityType]...';


GO
ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskResourceTypes_EntityType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AccessCertificationDataFilters_ResourceType]...';


GO
ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EntityInstances_FilterResourceType]...';


GO
ALTER TABLE [dbo].[UU_EntityInstances] WITH NOCHECK
    ADD CONSTRAINT [FK_EntityInstances_FilterResourceType] FOREIGN KEY ([FilterResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedResourceTypes_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedResourceTypes_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedResourceTypes] NOCHECK CONSTRAINT [FK_AssignedResourceTypes_ResourceType];


GO
PRINT N'Creating [dbo].[FK_IndirectResourceRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH NOCHECK
    ADD CONSTRAINT [FK_IndirectResourceRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_ResourceType]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileRuleContexts_ResourceType_Id]...';


GO
ALTER TABLE [dbo].[UA_ProfileRuleContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceBinaryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceBinaryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceBinaryRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceClassificationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceClassificationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceTypeMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypeMappings_ResourceType] FOREIGN KEY ([Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceCorrelationRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceCorrelationRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_RoleMappings_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceQueryRules_ResourceType]...';


GO
ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceQueryRules_ResourceType] FOREIGN KEY ([ResourceType_Id]) REFERENCES [dbo].[UP_ResourceTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoleRules_Role]...';


GO
ALTER TABLE [dbo].[UP_SingleRoleRules] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoleRules_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResourceScalarRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceScalarRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRolesCategories_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRolesCategories_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_EntityType] FOREIGN KEY ([EntityType_Id]) REFERENCES [dbo].[UM_EntityTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_SingleRoles_Category]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ProfileContexts_SingleRole]...';


GO
ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_AssignedSingleRoles_Role]...';


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AssignedSingleRoles_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
ALTER TABLE [dbo].[UP_AssignedSingleRoles] NOCHECK CONSTRAINT [FK_AssignedSingleRoles_Role];


GO
PRINT N'Creating [dbo].[FK_ResourceBinaryRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_ResourceBinaryRules] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceBinaryRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PendingApprovalRules_SingleRole]...';


GO
ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_SingleRole] FOREIGN KEY ([SingleRole_Id]) REFERENCES [dbo].[UP_SingleRoles] ([Id]);


GO
PRINT N'Creating [dbo].[CHK_CompositeRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_CompositeRoles_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));


GO
PRINT N'Creating [dbo].[CHK_CompositeRoles_EntityType]...';


GO
ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_CompositeRoles_EntityType] CHECK ("ValidTo"!=(CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) OR "Policy_Id" IS NOT NULL);


GO
PRINT N'Creating [dbo].[CHK_ResourceTypes_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [CHK_ResourceTypes_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));


GO
PRINT N'Creating [dbo].[CHK_ResourceTypes_RemoveOrphans]...';


GO
ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [CHK_ResourceTypes_RemoveOrphans] CHECK ("AllowRemove"=(1) OR "RemoveOrphans"=(0));


GO
PRINT N'Creating [dbo].[CHK_SingleRoles_ApprovalWorkflowType]...';


GO
ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [CHK_SingleRoles_ApprovalWorkflowType] CHECK ("ApprovalWorkflowType"=(3) OR "ApprovalWorkflowType"=(2) OR "ApprovalWorkflowType"=(1) OR "ApprovalWorkflowType"=(0));

GO
PRINT N'Checking existing data against newly created constraints';

GO
ALTER TABLE [dbo].[UC_ConnectionColumns] WITH CHECK CHECK CONSTRAINT [FK_ConnectionColumns_Table];

ALTER TABLE [dbo].[UC_ConnectionColumns] WITH CHECK CHECK CONSTRAINT [FK_ConnectionColumns_ForeignColumn];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_Policy];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_EntityType];

ALTER TABLE [dbo].[UP_CompositeRoleRules] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoleRules_CompositeRoles];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_Policy];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_EntityType];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_Category];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_CompositeRole];

ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_CompositeRolesCategories_CompositeRole];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_CompositeRole];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_CompositeRole];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_ContextRule];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BA_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BB_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BC_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BD_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BE_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BF_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BG_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BH_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BI_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BJ_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BK_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BL_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BM_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BN_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BO_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BP_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BQ_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BR_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BS_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BT_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BU_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_BV_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B10_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B11_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B12_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B13_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B14_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B15_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B16_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B17_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B18_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B19_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1A_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1B_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1C_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1D_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1E_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1F_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1G_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1H_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1I_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1J_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1K_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1L_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1M_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1N_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1O_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1P_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1Q_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1R_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1S_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1T_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1U_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1V_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B20_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B21_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B22_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B23_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B24_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B25_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B26_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B27_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B28_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B29_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2A_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2B_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2C_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2D_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2E_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2F_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2G_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2H_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2I_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2J_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2K_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2L_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2M_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2N_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2O_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2P_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2Q_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2R_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2S_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2T_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2U_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2V_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B30_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B31_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B32_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B33_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B34_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B35_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B36_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B37_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B38_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B39_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3A_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3B_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3C_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3D_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3E_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3F_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3G_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3H_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3I_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3J_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3K_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3L_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3M_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3N_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3O_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3P_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3Q_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3R_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3S_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3T_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3U_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3V_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_Policy];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_SourceEntityTypes];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_ResourcesBinding];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_ResourcesStartBinding_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_ResourcesEndBinding_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B0_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B1_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B2_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B3_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B4_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B5_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B6_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B7_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B8_Id];

ALTER TABLE [dbo].[UP_ContextRules] WITH CHECK CHECK CONSTRAINT [FK_ContextRules_B9_Id];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_Policy];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_Policy];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_Policy];

ALTER TABLE [dbo].[UP_RiskRules] WITH CHECK CHECK CONSTRAINT [FK_RiskRules_Policy];

ALTER TABLE [dbo].[UP_RoleCounters] WITH CHECK CHECK CONSTRAINT [FK_RoleCounters_Policy];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Policy];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_Policy];

ALTER TABLE [dbo].[UP_ResourceBinaryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceBinaryRules_Policy];

ALTER TABLE [dbo].[UP_Categories] WITH CHECK CHECK CONSTRAINT [FK_Categories_Policy];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_Policy];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_Policy];

ALTER TABLE [dbo].[UP_Risks] WITH CHECK CHECK CONSTRAINT [FK_Risks_Policy];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_Policy];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_Policy];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Policy];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_Policy];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_Property];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceNavigationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceNavigationRules_SingleRole];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_EntityType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypeRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeRules_SingleRole0];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_SourceEntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_TargetEntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_Category];

ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypesCategories_ResourceType];

ALTER TABLE [dbo].[UP_RiskRuleItems] WITH CHECK CHECK CONSTRAINT [FK_RiskRuleItems_ResourceType];

ALTER TABLE [dbo].[UJ_TaskResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_TaskResourceTypes_EntityType];

ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationDataFilters_ResourceType];

ALTER TABLE [dbo].[UU_EntityInstances] WITH CHECK CHECK CONSTRAINT [FK_EntityInstances_FilterResourceType];

ALTER TABLE [dbo].[UP_IndirectResourceRules] WITH CHECK CHECK CONSTRAINT [FK_IndirectResourceRules_ResourceType];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_ResourceType];

ALTER TABLE [dbo].[UA_ProfileRuleContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileRuleContexts_ResourceType_Id];

ALTER TABLE [dbo].[UP_ResourceBinaryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceBinaryRules_ResourceType];

ALTER TABLE [dbo].[UP_ResourceClassificationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceClassificationRules_ResourceType];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_ResourceType];

ALTER TABLE [dbo].[UC_ResourceTypeMappings] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypeMappings_ResourceType];

ALTER TABLE [dbo].[UP_ResourceCorrelationRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceCorrelationRules_ResourceType];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_ResourceType];

ALTER TABLE [dbo].[UP_ResourceQueryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceQueryRules_ResourceType];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_EntityType];

ALTER TABLE [dbo].[UP_SingleRoleRules] WITH CHECK CHECK CONSTRAINT [FK_SingleRoleRules_Role];

ALTER TABLE [dbo].[UP_ResourceScalarRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceScalarRules_SingleRole];

ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_SingleRolesCategories_SingleRole];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_EntityType];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_Category];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_SingleRole];

ALTER TABLE [dbo].[UP_ResourceBinaryRules] WITH CHECK CHECK CONSTRAINT [FK_ResourceBinaryRules_SingleRole];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_SingleRole];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [CHK_CompositeRoles_ApprovalWorkflowType];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [CHK_CompositeRoles_EntityType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [CHK_ResourceTypes_ApprovalWorkflowType];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [CHK_ResourceTypes_RemoveOrphans];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [CHK_SingleRoles_ApprovalWorkflowType];

GO
PRINT N'Update complete.';


GO

