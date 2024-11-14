IF COL_LENGTH('dbo.UP_Policies', 'GracePeriod') IS NULL
BEGIN
ALTER TABLE "UP_Policies" ADD "GracePeriod" INT NULL;
END
GO

IF COL_LENGTH('dbo.UP_CompositeRoles', 'GracePeriod') IS NULL
BEGIN
ALTER TABLE "UP_CompositeRoles" ADD "GracePeriod" INT NULL;
END
GO

IF COL_LENGTH('dbo.UP_SingleRoles', 'GracePeriod') IS NULL
BEGIN
ALTER TABLE "UP_SingleRoles" ADD "GracePeriod" INT NULL;
END
GO

IF COL_LENGTH('dbo.UP_ResourceTypes', 'GracePeriod') IS NULL
BEGIN
ALTER TABLE "UP_ResourceTypes" ADD "GracePeriod" INT NULL;
END
GO

IF (NOT EXISTS (SELECT *
            FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
              AND  TABLE_NAME = 'UP_AutomationRules'))
BEGIN
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;
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

INSERT INTO [dbo].[UP_AutomationRules]([Id]
                                      ,[Type]
                                      ,[EntityType_Id]
                                      ,[WorkflowState]
                                      ,[HoursToWait]
                                      ,[Decision]
                                      ,[CompositeRole_Id]
                                      ,[SingleRole_Id]
                                      ,[ResourceType_Id]
                                      ,[Category_Id]
                                      ,[Policy_Id]
                                      ,[WhenCreated]
                                      ,[CreatedBy_Id]
                                      ,[WhenChanged]
                                      ,[ChangedBy_Id]
                                      ,[L0]
                                      ,[L1]
                                      ,[L2]
                                      ,[L3]
                                      ,[L4]
                                      ,[L5]
                                      ,[L6]
                                      ,[L7]
                                      ,[L8]
                                      ,[L9]
                                      ,[LA]
                                      ,[LB]
                                      ,[LC]
                                      ,[LD]
                                      ,[LE]
                                      ,[LF]
                                      ,[LG]
                                      ,[LH]
                                      ,[LI]
                                      ,[LJ]
                                      ,[LK]
                                      ,[LL]
                                      ,[LM]
                                      ,[LN]
                                      ,[LO]
                                      ,[LP]
                                      ,[LQ]
                                      ,[LR]
                                      ,[LS]
                                      ,[LT]
                                      ,[LU]
                                      ,[LV]
                                      ,[L10]
                                      ,[L11]
                                      ,[L12]
                                      ,[L13]
                                      ,[L14]
                                      ,[L15]
                                      ,[L16]
                                      ,[L17]
                                      ,[L18]
                                      ,[L19]
                                      ,[L1A]
                                      ,[L1B]
                                      ,[L1C]
                                      ,[L1D]
                                      ,[L1E]
                                      ,[L1F]
                                      ,[L1G]
                                      ,[L1H]
                                      ,[L1I]
                                      ,[L1J]
                                      ,[L1K]
                                      ,[L1L]
                                      ,[L1M]
                                      ,[L1N]
                                      ,[L1O]
                                      ,[L1P]
                                      ,[L1Q]
                                      ,[L1R]
                                      ,[L1S]
                                      ,[L1T]
                                      ,[L1U]
                                      ,[L1V]
                                      ,[L20]
                                      ,[L21]
                                      ,[L22]
                                      ,[L23]
                                      ,[L24]
                                      ,[L25]
                                      ,[L26]
                                      ,[L27]
                                      ,[L28]
                                      ,[L29]
                                      ,[L2A]
                                      ,[L2B]
                                      ,[L2C]
                                      ,[L2D]
                                      ,[L2E]
                                      ,[L2F]
                                      ,[L2G]
                                      ,[L2H]
                                      ,[L2I]
                                      ,[L2J]
                                      ,[L2K]
                                      ,[L2L]
                                      ,[L2M]
                                      ,[L2N]
                                      ,[L2O]
                                      ,[L2P]
                                      ,[L2Q]
                                      ,[L2R]
                                      ,[L2S]
                                      ,[L2T]
                                      ,[L2U]
                                      ,[L2V]
                                      ,[L30]
                                      ,[L31]
                                      ,[L32]
                                      ,[L33]
                                      ,[L34]
                                      ,[L35]
                                      ,[L36]
                                      ,[L37]
                                      ,[L38]
                                      ,[L39]
                                      ,[L3A]
                                      ,[L3B]
                                      ,[L3C]
                                      ,[L3D]
                                      ,[L3E]
                                      ,[L3F]
                                      ,[L3G]
                                      ,[L3H]
                                      ,[L3I]
                                      ,[L3J]
                                      ,[L3K]
                                      ,[L3L]
                                      ,[L3M]
                                      ,[L3N]
                                      ,[L3O]
                                      ,[L3P]
                                      ,[L3Q]
                                      ,[L3R]
                                      ,[L3S]
                                      ,[L3T]
                                      ,[L3U]
                                      ,[L3V]
                                      ,[D0_Id]
                                      ,[D1_Id]
                                      ,[D2_Id]
                                      ,[D3_Id]
                                      ,[D4_Id]
                                      ,[D5_Id]
                                      ,[D6_Id]
                                      ,[D7_Id]
                                      ,[D8_Id]
                                      ,[D9_Id]
                                      ,[DA_Id]
                                      ,[DB_Id]
                                      ,[DC_Id]
                                      ,[DD_Id]
                                      ,[DE_Id]
                                      ,[DF_Id]
                                      ,[DG_Id]
                                      ,[DH_Id]
                                      ,[DI_Id]
                                      ,[DJ_Id]
                                      ,[DK_Id]
                                      ,[DL_Id]
                                      ,[DM_Id]
                                      ,[DN_Id]
                                      ,[DO_Id]
                                      ,[DP_Id]
                                      ,[DQ_Id]
                                      ,[DR_Id]
                                      ,[DS_Id]
                                      ,[DT_Id]
                                      ,[DU_Id]
                                      ,[DV_Id]
                                      ,[D10_Id]
                                      ,[D11_Id]
                                      ,[D12_Id]
                                      ,[D13_Id]
                                      ,[D14_Id]
                                      ,[D15_Id]
                                      ,[D16_Id]
                                      ,[D17_Id]
                                      ,[D18_Id]
                                      ,[D19_Id]
                                      ,[D1A_Id]
                                      ,[D1B_Id]
                                      ,[D1C_Id]
                                      ,[D1D_Id]
                                      ,[D1E_Id]
                                      ,[D1F_Id]
                                      ,[D1G_Id]
                                      ,[D1H_Id]
                                      ,[D1I_Id]
                                      ,[D1J_Id]
                                      ,[D1K_Id]
                                      ,[D1L_Id]
                                      ,[D1M_Id]
                                      ,[D1N_Id]
                                      ,[D1O_Id]
                                      ,[D1P_Id]
                                      ,[D1Q_Id]
                                      ,[D1R_Id]
                                      ,[D1S_Id]
                                      ,[D1T_Id]
                                      ,[D1U_Id]
                                      ,[D1V_Id]
                                      ,[D20_Id]
                                      ,[D21_Id]
                                      ,[D22_Id]
                                      ,[D23_Id]
                                      ,[D24_Id]
                                      ,[D25_Id]
                                      ,[D26_Id]
                                      ,[D27_Id]
                                      ,[D28_Id]
                                      ,[D29_Id]
                                      ,[D2A_Id]
                                      ,[D2B_Id]
                                      ,[D2C_Id]
                                      ,[D2D_Id]
                                      ,[D2E_Id]
                                      ,[D2F_Id]
                                      ,[D2G_Id]
                                      ,[D2H_Id]
                                      ,[D2I_Id]
                                      ,[D2J_Id]
                                      ,[D2K_Id]
                                      ,[D2L_Id]
                                      ,[D2M_Id]
                                      ,[D2N_Id]
                                      ,[D2O_Id]
                                      ,[D2P_Id]
                                      ,[D2Q_Id]
                                      ,[D2R_Id]
                                      ,[D2S_Id]
                                      ,[D2T_Id]
                                      ,[D2U_Id]
                                      ,[D2V_Id]
                                      ,[D30_Id]
                                      ,[D31_Id]
                                      ,[D32_Id]
                                      ,[D33_Id]
                                      ,[D34_Id]
                                      ,[D35_Id]
                                      ,[D36_Id]
                                      ,[D37_Id]
                                      ,[D38_Id]
                                      ,[D39_Id]
                                      ,[D3A_Id]
                                      ,[D3B_Id]
                                      ,[D3C_Id]
                                      ,[D3D_Id]
                                      ,[D3E_Id]
                                      ,[D3F_Id]
                                      ,[D3G_Id]
                                      ,[D3H_Id]
                                      ,[D3I_Id]
                                      ,[D3J_Id]
                                      ,[D3K_Id]
                                      ,[D3L_Id]
                                      ,[D3M_Id]
                                      ,[D3N_Id]
                                      ,[D3O_Id]
                                      ,[D3P_Id]
                                      ,[D3Q_Id]
                                      ,[D3R_Id]
                                      ,[D3S_Id]
                                      ,[D3T_Id]
                                      ,[D3U_Id]
                                      ,[D3V_Id])
SELECT [Id]
     ,[Type]
     ,[EntityType_Id]
     ,[WorkflowState]
     ,[HoursToWait]
     ,[Decision]
     ,[CompositeRole_Id]
     ,[SingleRole_Id]
     ,[ResourceType_Id]
     ,[Category_Id]
     ,[Policy_Id]
     ,[WhenCreated]
     ,[CreatedBy_Id]
     ,[WhenChanged]
     ,[ChangedBy_Id]
     ,[L0]
     ,[L1]
     ,[L2]
     ,[L3]
     ,[L4]
     ,[L5]
     ,[L6]
     ,[L7]
     ,[L8]
     ,[L9]
     ,[LA]
     ,[LB]
     ,[LC]
     ,[LD]
     ,[LE]
     ,[LF]
     ,[LG]
     ,[LH]
     ,[LI]
     ,[LJ]
     ,[LK]
     ,[LL]
     ,[LM]
     ,[LN]
     ,[LO]
     ,[LP]
     ,[LQ]
     ,[LR]
     ,[LS]
     ,[LT]
     ,[LU]
     ,[LV]
     ,[L10]
     ,[L11]
     ,[L12]
     ,[L13]
     ,[L14]
     ,[L15]
     ,[L16]
     ,[L17]
     ,[L18]
     ,[L19]
     ,[L1A]
     ,[L1B]
     ,[L1C]
     ,[L1D]
     ,[L1E]
     ,[L1F]
     ,[L1G]
     ,[L1H]
     ,[L1I]
     ,[L1J]
     ,[L1K]
     ,[L1L]
     ,[L1M]
     ,[L1N]
     ,[L1O]
     ,[L1P]
     ,[L1Q]
     ,[L1R]
     ,[L1S]
     ,[L1T]
     ,[L1U]
     ,[L1V]
     ,[L20]
     ,[L21]
     ,[L22]
     ,[L23]
     ,[L24]
     ,[L25]
     ,[L26]
     ,[L27]
     ,[L28]
     ,[L29]
     ,[L2A]
     ,[L2B]
     ,[L2C]
     ,[L2D]
     ,[L2E]
     ,[L2F]
     ,[L2G]
     ,[L2H]
     ,[L2I]
     ,[L2J]
     ,[L2K]
     ,[L2L]
     ,[L2M]
     ,[L2N]
     ,[L2O]
     ,[L2P]
     ,[L2Q]
     ,[L2R]
     ,[L2S]
     ,[L2T]
     ,[L2U]
     ,[L2V]
     ,[L30]
     ,[L31]
     ,[L32]
     ,[L33]
     ,[L34]
     ,[L35]
     ,[L36]
     ,[L37]
     ,[L38]
     ,[L39]
     ,[L3A]
     ,[L3B]
     ,[L3C]
     ,[L3D]
     ,[L3E]
     ,[L3F]
     ,[L3G]
     ,[L3H]
     ,[L3I]
     ,[L3J]
     ,[L3K]
     ,[L3L]
     ,[L3M]
     ,[L3N]
     ,[L3O]
     ,[L3P]
     ,[L3Q]
     ,[L3R]
     ,[L3S]
     ,[L3T]
     ,[L3U]
     ,[L3V]
     ,[D0_Id]
     ,[D1_Id]
     ,[D2_Id]
     ,[D3_Id]
     ,[D4_Id]
     ,[D5_Id]
     ,[D6_Id]
     ,[D7_Id]
     ,[D8_Id]
     ,[D9_Id]
     ,[DA_Id]
     ,[DB_Id]
     ,[DC_Id]
     ,[DD_Id]
     ,[DE_Id]
     ,[DF_Id]
     ,[DG_Id]
     ,[DH_Id]
     ,[DI_Id]
     ,[DJ_Id]
     ,[DK_Id]
     ,[DL_Id]
     ,[DM_Id]
     ,[DN_Id]
     ,[DO_Id]
     ,[DP_Id]
     ,[DQ_Id]
     ,[DR_Id]
     ,[DS_Id]
     ,[DT_Id]
     ,[DU_Id]
     ,[DV_Id]
     ,[D10_Id]
     ,[D11_Id]
     ,[D12_Id]
     ,[D13_Id]
     ,[D14_Id]
     ,[D15_Id]
     ,[D16_Id]
     ,[D17_Id]
     ,[D18_Id]
     ,[D19_Id]
     ,[D1A_Id]
     ,[D1B_Id]
     ,[D1C_Id]
     ,[D1D_Id]
     ,[D1E_Id]
     ,[D1F_Id]
     ,[D1G_Id]
     ,[D1H_Id]
     ,[D1I_Id]
     ,[D1J_Id]
     ,[D1K_Id]
     ,[D1L_Id]
     ,[D1M_Id]
     ,[D1N_Id]
     ,[D1O_Id]
     ,[D1P_Id]
     ,[D1Q_Id]
     ,[D1R_Id]
     ,[D1S_Id]
     ,[D1T_Id]
     ,[D1U_Id]
     ,[D1V_Id]
     ,[D20_Id]
     ,[D21_Id]
     ,[D22_Id]
     ,[D23_Id]
     ,[D24_Id]
     ,[D25_Id]
     ,[D26_Id]
     ,[D27_Id]
     ,[D28_Id]
     ,[D29_Id]
     ,[D2A_Id]
     ,[D2B_Id]
     ,[D2C_Id]
     ,[D2D_Id]
     ,[D2E_Id]
     ,[D2F_Id]
     ,[D2G_Id]
     ,[D2H_Id]
     ,[D2I_Id]
     ,[D2J_Id]
     ,[D2K_Id]
     ,[D2L_Id]
     ,[D2M_Id]
     ,[D2N_Id]
     ,[D2O_Id]
     ,[D2P_Id]
     ,[D2Q_Id]
     ,[D2R_Id]
     ,[D2S_Id]
     ,[D2T_Id]
     ,[D2U_Id]
     ,[D2V_Id]
     ,[D30_Id]
     ,[D31_Id]
     ,[D32_Id]
     ,[D33_Id]
     ,[D34_Id]
     ,[D35_Id]
     ,[D36_Id]
     ,[D37_Id]
     ,[D38_Id]
     ,[D39_Id]
     ,[D3A_Id]
     ,[D3B_Id]
     ,[D3C_Id]
     ,[D3D_Id]
     ,[D3E_Id]
     ,[D3F_Id]
     ,[D3G_Id]
     ,[D3H_Id]
     ,[D3I_Id]
     ,[D3J_Id]
     ,[D3K_Id]
     ,[D3L_Id]
     ,[D3M_Id]
     ,[D3N_Id]
     ,[D3O_Id]
     ,[D3P_Id]
     ,[D3Q_Id]
     ,[D3R_Id]
     ,[D3S_Id]
     ,[D3T_Id]
     ,[D3U_Id]
     ,[D3V_Id]
FROM [dbo].[UP_PendingApprovalRules]
WHERE "ID" NOT IN (SELECT id FROM UP_Automationrules)
                  ORDER by Id

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
END
