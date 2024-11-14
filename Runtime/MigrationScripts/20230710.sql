﻿MERGE "UA_ProfileContexts" AS TARGET USING (values(-1,0)) AS SOURCE("Id","IsAutomatic") ON TARGET."Id" = SOURCE."Id" WHEN MATCHED THEN UPDATE SET "IsAutomatic"=SOURCE."IsAutomatic" WHEN NOT MATCHED THEN INSERT("Id","IsAutomatic") VALUES(SOURCE."Id", SOURCE."IsAutomatic");
GO

update UA_AssignedProfiles set Context_Id = -1 where Context_Id in (SELECT [Id]
FROM [UA_ProfileContexts]
WHERE id != -1
  and [IsAutomatic] = 0
  and [CompositeRole_Id] is null
  and [SingleRole_Id] is null
  and [ResourceType_Id] is null
  and [Category_Id] is null
  and [D0_Id] is null
  and [D1_Id] is null
  and [D2_Id] is null
  and [D3_Id] is null
  and [D4_Id] is null
  and [D5_Id] is null
  and [D6_Id] is null
  and [D7_Id] is null
  and [D8_Id] is null
  and [D9_Id] is null
  and [DA_Id] is null
  and [DB_Id] is null
  and [DC_Id] is null
  and [DD_Id] is null
  and [DE_Id] is null
  and [DF_Id] is null
  and [DG_Id] is null
  and [DH_Id] is null
  and [DI_Id] is null
  and [DJ_Id] is null
  and [DK_Id] is null
  and [DL_Id] is null
  and [DM_Id] is null
  and [DN_Id] is null
  and [DO_Id] is null
  and [DP_Id] is null
  and [DQ_Id] is null
  and [DR_Id] is null
  and [DS_Id] is null
  and [DT_Id] is null
  and [DU_Id] is null
  and [DV_Id] is null
  and [D10_Id] is null
  and [D11_Id] is null
  and [D12_Id] is null
  and [D13_Id] is null
  and [D14_Id] is null
  and [D15_Id] is null
  and [D16_Id] is null
  and [D17_Id] is null
  and [D18_Id] is null
  and [D19_Id] is null
  and [D1A_Id] is null
  and [D1B_Id] is null
  and [D1C_Id] is null
  and [D1D_Id] is null
  and [D1E_Id] is null
  and [D1F_Id] is null
  and [D1G_Id] is null
  and [D1H_Id] is null
  and [D1I_Id] is null
  and [D1J_Id] is null
  and [D1K_Id] is null
  and [D1L_Id] is null
  and [D1M_Id] is null
  and [D1N_Id] is null
  and [D1O_Id] is null
  and [D1P_Id] is null
  and [D1Q_Id] is null
  and [D1R_Id] is null
  and [D1S_Id] is null
  and [D1T_Id] is null
  and [D1U_Id] is null
  and [D1V_Id] is null
  and [D20_Id] is null
  and [D21_Id] is null
  and [D22_Id] is null
  and [D23_Id] is null
  and [D24_Id] is null
  and [D25_Id] is null
  and [D26_Id] is null
  and [D27_Id] is null
  and [D28_Id] is null
  and [D29_Id] is null
  and [D2A_Id] is null
  and [D2B_Id] is null
  and [D2C_Id] is null
  and [D2D_Id] is null
  and [D2E_Id] is null
  and [D2F_Id] is null
  and [D2G_Id] is null
  and [D2H_Id] is null
  and [D2I_Id] is null
  and [D2J_Id] is null
  and [D2K_Id] is null
  and [D2L_Id] is null
  and [D2M_Id] is null
  and [D2N_Id] is null
  and [D2O_Id] is null
  and [D2P_Id] is null
  and [D2Q_Id] is null
  and [D2R_Id] is null
  and [D2S_Id] is null
  and [D2T_Id] is null
  and [D2U_Id] is null
  and [D2V_Id] is null
  and [D30_Id] is null
  and [D31_Id] is null
  and [D32_Id] is null
  and [D33_Id] is null
  and [D34_Id] is null
  and [D35_Id] is null
  and [D36_Id] is null
  and [D37_Id] is null
  and [D38_Id] is null
  and [D39_Id] is null
  and [D3A_Id] is null
  and [D3B_Id] is null
  and [D3C_Id] is null
  and [D3D_Id] is null
  and [D3E_Id] is null
  and [D3F_Id] is null
  and [D3G_Id] is null
  and [D3H_Id] is null
  and [D3I_Id] is null
  and [D3J_Id] is null
  and [D3K_Id] is null
  and [D3L_Id] is null
  and [D3M_Id] is null
  and [D3N_Id] is null
  and [D3O_Id] is null
  and [D3P_Id] is null
  and [D3Q_Id] is null
  and [D3R_Id] is null
  and [D3S_Id] is null
  and [D3T_Id] is null
  and [D3U_Id] is null
  and [D3V_Id] is null);

delete UA_ProfileContexts where Id != -1
	  and [IsAutomatic] = 0
      and [CompositeRole_Id] is null
      and [SingleRole_Id] is null
      and [ResourceType_Id] is null
      and [Category_Id] is null
      and [D0_Id] is null
      and [D1_Id] is null
      and [D2_Id] is null
      and [D3_Id] is null
      and [D4_Id] is null
      and [D5_Id] is null
      and [D6_Id] is null
      and [D7_Id] is null
      and [D8_Id] is null
      and [D9_Id] is null
      and [DA_Id] is null
      and [DB_Id] is null
      and [DC_Id] is null
      and [DD_Id] is null
      and [DE_Id] is null
      and [DF_Id] is null
      and [DG_Id] is null
      and [DH_Id] is null
      and [DI_Id] is null
      and [DJ_Id] is null
      and [DK_Id] is null
      and [DL_Id] is null
      and [DM_Id] is null
      and [DN_Id] is null
      and [DO_Id] is null
      and [DP_Id] is null
      and [DQ_Id] is null
      and [DR_Id] is null
      and [DS_Id] is null
      and [DT_Id] is null
      and [DU_Id] is null
      and [DV_Id] is null
      and [D10_Id] is null
      and [D11_Id] is null
      and [D12_Id] is null
      and [D13_Id] is null
      and [D14_Id] is null
      and [D15_Id] is null
      and [D16_Id] is null
      and [D17_Id] is null
      and [D18_Id] is null
      and [D19_Id] is null
      and [D1A_Id] is null
      and [D1B_Id] is null
      and [D1C_Id] is null
      and [D1D_Id] is null
      and [D1E_Id] is null
      and [D1F_Id] is null
      and [D1G_Id] is null
      and [D1H_Id] is null
      and [D1I_Id] is null
      and [D1J_Id] is null
      and [D1K_Id] is null
      and [D1L_Id] is null
      and [D1M_Id] is null
      and [D1N_Id] is null
      and [D1O_Id] is null
      and [D1P_Id] is null
      and [D1Q_Id] is null
      and [D1R_Id] is null
      and [D1S_Id] is null
      and [D1T_Id] is null
      and [D1U_Id] is null
      and [D1V_Id] is null
      and [D20_Id] is null
      and [D21_Id] is null
      and [D22_Id] is null
      and [D23_Id] is null
      and [D24_Id] is null
      and [D25_Id] is null
      and [D26_Id] is null
      and [D27_Id] is null
      and [D28_Id] is null
      and [D29_Id] is null
      and [D2A_Id] is null
      and [D2B_Id] is null
      and [D2C_Id] is null
      and [D2D_Id] is null
      and [D2E_Id] is null
      and [D2F_Id] is null
      and [D2G_Id] is null
      and [D2H_Id] is null
      and [D2I_Id] is null
      and [D2J_Id] is null
      and [D2K_Id] is null
      and [D2L_Id] is null
      and [D2M_Id] is null
      and [D2N_Id] is null
      and [D2O_Id] is null
      and [D2P_Id] is null
      and [D2Q_Id] is null
      and [D2R_Id] is null
      and [D2S_Id] is null
      and [D2T_Id] is null
      and [D2U_Id] is null
      and [D2V_Id] is null
      and [D30_Id] is null
      and [D31_Id] is null
      and [D32_Id] is null
      and [D33_Id] is null
      and [D34_Id] is null
      and [D35_Id] is null
      and [D36_Id] is null
      and [D37_Id] is null
      and [D38_Id] is null
      and [D39_Id] is null
      and [D3A_Id] is null
      and [D3B_Id] is null
      and [D3C_Id] is null
      and [D3D_Id] is null
      and [D3E_Id] is null
      and [D3F_Id] is null
      and [D3G_Id] is null
      and [D3H_Id] is null
      and [D3I_Id] is null
      and [D3J_Id] is null
      and [D3K_Id] is null
      and [D3L_Id] is null
      and [D3M_Id] is null
      and [D3N_Id] is null
      and [D3O_Id] is null
      and [D3P_Id] is null
      and [D3Q_Id] is null
      and [D3R_Id] is null
      and [D3S_Id] is null
      and [D3T_Id] is null
      and [D3U_Id] is null
      and [D3V_Id] is null;
