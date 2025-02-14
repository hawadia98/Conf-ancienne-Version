IF COL_LENGTH('dbo.UI_DisplayEntityTypes', 'Color') IS NULL
BEGIN
    ALTER TABLE "UI_DisplayEntityTypes" ADD "Color" VARCHAR(7) NULL;
END
GO

--Merge Contexts

--Select the min Id from each group of the same context and save it in a temporary table
select min(id) id, d0_id, d1_id, d2_id, d3_id, d4_id, d5_id, d6_id, d7_id, d8_id, d9_id, da_id, db_id, dc_id, dd_id, de_id, df_id, dg_id, dh_id, di_id, dj_id, dk_id, dl_id, dm_id, dn_id, do_id, dp_id, dq_id, dr_id, ds_id, dt_id, du_id, dv_id, d10_id, d11_id, d12_id, d13_id, d14_id, d15_id, d16_id, d17_id, d18_id, d19_id, d1a_id, d1b_id, d1c_id, d1d_id, d1e_id, d1f_id, d1g_id, d1h_id, d1i_id, d1j_id, d1k_id, d1l_id, d1m_id, d1n_id, d1o_id, d1p_id, d1q_id, d1r_id, d1s_id, d1t_id, d1u_id, d1v_id, d20_id, d21_id, d22_id, d23_id, d24_id, d25_id, d26_id, d27_id, d28_id, d29_id, d2a_id, d2b_id, d2c_id, d2d_id, d2e_id, d2f_id, d2g_id, d2h_id, d2i_id, d2j_id, d2k_id, d2l_id, d2m_id, d2n_id, d2o_id, d2p_id, d2q_id, d2r_id, d2s_id, d2t_id, d2u_id, d2v_id, d30_id, d31_id, d32_id, d33_id, d34_id, d35_id, d36_id, d37_id, d38_id, d39_id, d3a_id, d3b_id, d3c_id, d3d_id, d3e_id, d3f_id, d3g_id, d3h_id, d3i_id, d3j_id, d3k_id, d3l_id, d3m_id, d3n_id, d3o_id, d3p_id, d3q_id, d3r_id, d3s_id, d3t_id, d3u_id, d3v_id, automatic into tmp_up_contexts from up_contexts group by d0_id, d1_id, d2_id, d3_id, d4_id, d5_id, d6_id, d7_id, d8_id, d9_id, da_id, db_id, dc_id, dd_id, de_id, df_id, dg_id, dh_id, di_id, dj_id, dk_id, dl_id, dm_id, dn_id, do_id, dp_id, dq_id, dr_id, ds_id, dt_id, du_id, dv_id, d10_id, d11_id, d12_id, d13_id, d14_id, d15_id, d16_id, d17_id, d18_id, d19_id, d1a_id, d1b_id, d1c_id, d1d_id, d1e_id, d1f_id, d1g_id, d1h_id, d1i_id, d1j_id, d1k_id, d1l_id, d1m_id, d1n_id, d1o_id, d1p_id, d1q_id, d1r_id, d1s_id, d1t_id, d1u_id, d1v_id, d20_id, d21_id, d22_id, d23_id, d24_id, d25_id, d26_id, d27_id, d28_id, d29_id, d2a_id, d2b_id, d2c_id, d2d_id, d2e_id, d2f_id, d2g_id, d2h_id, d2i_id, d2j_id, d2k_id, d2l_id, d2m_id, d2n_id, d2o_id, d2p_id, d2q_id, d2r_id, d2s_id, d2t_id, d2u_id, d2v_id, d30_id, d31_id, d32_id, d33_id, d34_id, d35_id, d36_id, d37_id, d38_id, d39_id, d3a_id, d3b_id, d3c_id, d3d_id, d3e_id, d3f_id, d3g_id, d3h_id, d3i_id, d3j_id, d3k_id, d3l_id, d3m_id, d3n_id, d3o_id, d3p_id, d3q_id, d3r_id, d3s_id, d3t_id, d3u_id, d3v_id,  automatic

select c.id old_id,t.id new_id into tmp_up_contexts_ids from UP_Contexts c join tmp_up_contexts t on (c.d0_id=t.d0_id or (c.d0_id is null and t.d0_id is null)) and (c.d1_id=t.d1_id or (c.d1_id is null and t.d1_id is null)) and (c.d2_id=t.d2_id or (c.d2_id is null and t.d2_id is null)) and (c.d3_id=t.d3_id or (c.d3_id is null and t.d3_id is null)) and (c.d4_id=t.d4_id or (c.d4_id is null and t.d4_id is null)) and (c.d5_id=t.d5_id or (c.d5_id is null and t.d5_id is null)) and (c.d6_id=t.d6_id or (c.d6_id is null and t.d6_id is null)) and (c.d7_id=t.d7_id or (c.d7_id is null and t.d7_id is null)) and (c.d8_id=t.d8_id or (c.d8_id is null and t.d8_id is null)) and (c.d9_id=t.d9_id or (c.d9_id is null and t.d9_id is null)) and (c.da_id=t.da_id or (c.da_id is null and t.da_id is null)) and (c.db_id=t.db_id or (c.db_id is null and t.db_id is null)) and (c.dc_id=t.dc_id or (c.dc_id is null and t.dc_id is null)) and (c.dd_id=t.dd_id or (c.dd_id is null and t.dd_id is null)) and (c.de_id=t.de_id or (c.de_id is null and t.de_id is null)) and (c.df_id=t.df_id or (c.df_id is null and t.df_id is null)) and (c.dg_id=t.dg_id or (c.dg_id is null and t.dg_id is null)) and (c.dh_id=t.dh_id or (c.dh_id is null and t.dh_id is null)) and (c.di_id=t.di_id or (c.di_id is null and t.di_id is null)) and (c.dj_id=t.dj_id or (c.dj_id is null and t.dj_id is null)) and (c.dk_id=t.dk_id or (c.dk_id is null and t.dk_id is null)) and (c.dl_id=t.dl_id or (c.dl_id is null and t.dl_id is null)) and (c.dm_id=t.dm_id or (c.dm_id is null and t.dm_id is null)) and (c.dn_id=t.dn_id or (c.dn_id is null and t.dn_id is null)) and (c.do_id=t.do_id or (c.do_id is null and t.do_id is null)) and (c.dp_id=t.dp_id or (c.dp_id is null and t.dp_id is null)) and (c.dq_id=t.dq_id or (c.dq_id is null and t.dq_id is null)) and (c.dr_id=t.dr_id or (c.dr_id is null and t.dr_id is null)) and (c.ds_id=t.ds_id or (c.ds_id is null and t.ds_id is null)) and (c.dt_id=t.dt_id or (c.dt_id is null and t.dt_id is null)) and (c.du_id=t.du_id or (c.du_id is null and t.du_id is null)) and (c.dv_id=t.dv_id or (c.dv_id is null and t.dv_id is null)) and (c.d10_id=t.d10_id or (c.d10_id is null and t.d10_id is null)) and (c.d11_id=t.d11_id or (c.d11_id is null and t.d11_id is null)) and (c.d12_id=t.d12_id or (c.d12_id is null and t.d12_id is null)) and (c.d13_id=t.d13_id or (c.d13_id is null and t.d13_id is null)) and (c.d14_id=t.d14_id or (c.d14_id is null and t.d14_id is null)) and (c.d15_id=t.d15_id or (c.d15_id is null and t.d15_id is null)) and (c.d16_id=t.d16_id or (c.d16_id is null and t.d16_id is null)) and (c.d17_id=t.d17_id or (c.d17_id is null and t.d17_id is null)) and (c.d18_id=t.d18_id or (c.d18_id is null and t.d18_id is null)) and (c.d19_id=t.d19_id or (c.d19_id is null and t.d19_id is null)) and (c.d1a_id=t.d1a_id or (c.d1a_id is null and t.d1a_id is null)) and (c.d1b_id=t.d1b_id or (c.d1b_id is null and t.d1b_id is null)) and (c.d1c_id=t.d1c_id or (c.d1c_id is null and t.d1c_id is null)) and (c.d1d_id=t.d1d_id or (c.d1d_id is null and t.d1d_id is null)) and (c.d1e_id=t.d1e_id or (c.d1e_id is null and t.d1e_id is null)) and (c.d1f_id=t.d1f_id or (c.d1f_id is null and t.d1f_id is null)) and (c.d1g_id=t.d1g_id or (c.d1g_id is null and t.d1g_id is null)) and (c.d1h_id=t.d1h_id or (c.d1h_id is null and t.d1h_id is null)) and (c.d1i_id=t.d1i_id or (c.d1i_id is null and t.d1i_id is null)) and (c.d1j_id=t.d1j_id or (c.d1j_id is null and t.d1j_id is null)) and (c.d1k_id=t.d1k_id or (c.d1k_id is null and t.d1k_id is null)) and (c.d1l_id=t.d1l_id or (c.d1l_id is null and t.d1l_id is null)) and (c.d1m_id=t.d1m_id or (c.d1m_id is null and t.d1m_id is null)) and (c.d1n_id=t.d1n_id or (c.d1n_id is null and t.d1n_id is null)) and (c.d1o_id=t.d1o_id or (c.d1o_id is null and t.d1o_id is null)) and (c.d1p_id=t.d1p_id or (c.d1p_id is null and t.d1p_id is null)) and (c.d1q_id=t.d1q_id or (c.d1q_id is null and t.d1q_id is null)) and (c.d1r_id=t.d1r_id or (c.d1r_id is null and t.d1r_id is null)) and (c.d1s_id=t.d1s_id or (c.d1s_id is null and t.d1s_id is null)) and (c.d1t_id=t.d1t_id or (c.d1t_id is null and t.d1t_id is null)) and (c.d1u_id=t.d1u_id or (c.d1u_id is null and t.d1u_id is null)) and (c.d1v_id=t.d1v_id or (c.d1v_id is null and t.d1v_id is null)) and (c.d20_id=t.d20_id or (c.d20_id is null and t.d20_id is null)) and (c.d21_id=t.d21_id or (c.d21_id is null and t.d21_id is null)) and (c.d22_id=t.d22_id or (c.d22_id is null and t.d22_id is null)) and (c.d23_id=t.d23_id or (c.d23_id is null and t.d23_id is null)) and (c.d24_id=t.d24_id or (c.d24_id is null and t.d24_id is null)) and (c.d25_id=t.d25_id or (c.d25_id is null and t.d25_id is null)) and (c.d26_id=t.d26_id or (c.d26_id is null and t.d26_id is null)) and (c.d27_id=t.d27_id or (c.d27_id is null and t.d27_id is null)) and (c.d28_id=t.d28_id or (c.d28_id is null and t.d28_id is null)) and (c.d29_id=t.d29_id or (c.d29_id is null and t.d29_id is null)) and (c.d2a_id=t.d2a_id or (c.d2a_id is null and t.d2a_id is null)) and (c.d2b_id=t.d2b_id or (c.d2b_id is null and t.d2b_id is null)) and (c.d2c_id=t.d2c_id or (c.d2c_id is null and t.d2c_id is null)) and (c.d2d_id=t.d2d_id or (c.d2d_id is null and t.d2d_id is null)) and (c.d2e_id=t.d2e_id or (c.d2e_id is null and t.d2e_id is null)) and (c.d2f_id=t.d2f_id or (c.d2f_id is null and t.d2f_id is null)) and (c.d2g_id=t.d2g_id or (c.d2g_id is null and t.d2g_id is null)) and (c.d2h_id=t.d2h_id or (c.d2h_id is null and t.d2h_id is null)) and (c.d2i_id=t.d2i_id or (c.d2i_id is null and t.d2i_id is null)) and (c.d2j_id=t.d2j_id or (c.d2j_id is null and t.d2j_id is null)) and (c.d2k_id=t.d2k_id or (c.d2k_id is null and t.d2k_id is null)) and (c.d2l_id=t.d2l_id or (c.d2l_id is null and t.d2l_id is null)) and (c.d2m_id=t.d2m_id or (c.d2m_id is null and t.d2m_id is null)) and (c.d2n_id=t.d2n_id or (c.d2n_id is null and t.d2n_id is null)) and (c.d2o_id=t.d2o_id or (c.d2o_id is null and t.d2o_id is null)) and (c.d2p_id=t.d2p_id or (c.d2p_id is null and t.d2p_id is null)) and (c.d2q_id=t.d2q_id or (c.d2q_id is null and t.d2q_id is null)) and (c.d2r_id=t.d2r_id or (c.d2r_id is null and t.d2r_id is null)) and (c.d2s_id=t.d2s_id or (c.d2s_id is null and t.d2s_id is null)) and (c.d2t_id=t.d2t_id or (c.d2t_id is null and t.d2t_id is null)) and (c.d2u_id=t.d2u_id or (c.d2u_id is null and t.d2u_id is null)) and (c.d2v_id=t.d2v_id or (c.d2v_id is null and t.d2v_id is null)) and (c.d30_id=t.d30_id or (c.d30_id is null and t.d30_id is null)) and (c.d31_id=t.d31_id or (c.d31_id is null and t.d31_id is null)) and (c.d32_id=t.d32_id or (c.d32_id is null and t.d32_id is null)) and (c.d33_id=t.d33_id or (c.d33_id is null and t.d33_id is null)) and (c.d34_id=t.d34_id or (c.d34_id is null and t.d34_id is null)) and (c.d35_id=t.d35_id or (c.d35_id is null and t.d35_id is null)) and (c.d36_id=t.d36_id or (c.d36_id is null and t.d36_id is null)) and (c.d37_id=t.d37_id or (c.d37_id is null and t.d37_id is null)) and (c.d38_id=t.d38_id or (c.d38_id is null and t.d38_id is null)) and (c.d39_id=t.d39_id or (c.d39_id is null and t.d39_id is null)) and (c.d3a_id=t.d3a_id or (c.d3a_id is null and t.d3a_id is null)) and (c.d3b_id=t.d3b_id or (c.d3b_id is null and t.d3b_id is null)) and (c.d3c_id=t.d3c_id or (c.d3c_id is null and t.d3c_id is null)) and (c.d3d_id=t.d3d_id or (c.d3d_id is null and t.d3d_id is null)) and (c.d3e_id=t.d3e_id or (c.d3e_id is null and t.d3e_id is null)) and (c.d3f_id=t.d3f_id or (c.d3f_id is null and t.d3f_id is null)) and (c.d3g_id=t.d3g_id or (c.d3g_id is null and t.d3g_id is null)) and (c.d3h_id=t.d3h_id or (c.d3h_id is null and t.d3h_id is null)) and (c.d3i_id=t.d3i_id or (c.d3i_id is null and t.d3i_id is null)) and (c.d3j_id=t.d3j_id or (c.d3j_id is null and t.d3j_id is null)) and (c.d3k_id=t.d3k_id or (c.d3k_id is null and t.d3k_id is null)) and (c.d3l_id=t.d3l_id or (c.d3l_id is null and t.d3l_id is null)) and (c.d3m_id=t.d3m_id or (c.d3m_id is null and t.d3m_id is null)) and (c.d3n_id=t.d3n_id or (c.d3n_id is null and t.d3n_id is null)) and (c.d3o_id=t.d3o_id or (c.d3o_id is null and t.d3o_id is null)) and (c.d3p_id=t.d3p_id or (c.d3p_id is null and t.d3p_id is null)) and (c.d3q_id=t.d3q_id or (c.d3q_id is null and t.d3q_id is null)) and (c.d3r_id=t.d3r_id or (c.d3r_id is null and t.d3r_id is null)) and (c.d3s_id=t.d3s_id or (c.d3s_id is null and t.d3s_id is null)) and (c.d3t_id=t.d3t_id or (c.d3t_id is null and t.d3t_id is null)) and (c.d3u_id=t.d3u_id or (c.d3u_id is null and t.d3u_id is null)) and (c.d3v_id=t.d3v_id or (c.d3v_id is null and t.d3v_id is null)) and  c.Automatic=t.Automatic

update a
set parameterscontext_id=c.new_id
from UP_AssignedCompositeRoles a
join tmp_up_contexts_ids c on c.old_id=a.parameterscontext_id

update a
set parameterscontext_id=c.new_id
from UP_AssignedSingleRoles a
join tmp_up_contexts_ids c on c.old_id=a.parameterscontext_id

update a
set parameterscontext_id=c.new_id
from UP_AssignedResourceTypes a
join tmp_up_contexts_ids c on c.old_id=a.parameterscontext_id

delete from up_contexts where id not in (select id from tmp_up_contexts)

drop table tmp_up_contexts
drop table tmp_up_contexts_ids
GO

--Delete duplicate AssignedResourceType
select id into tmp_up_resourcetypeid  from (
select art.id as id,
ROW_NUMBER() OVER(PARTITION BY ResourceType_Id , Owner_Id, Resource_Id ORDER BY art.Id) as rowNumber
from UP_AssignedResourceTypes art
join UP_ResourceTypes rt on rt.id = ResourceType_Id and rt.CorrelateMultipleResources = 1
where art.ValidTo = '9999-12-31 23:59:59.99') t  where t.rowNumber>1

delete UP_AssignedResourceScalars where AssignedResourceType_Id in (select id from tmp_up_resourcetypeid) and ValidTo='9999-12-31 23:59:59.99'
delete UP_AssignedResourceBinaries where AssignedResourceType_Id in (select id from tmp_up_resourcetypeid) and ValidTo='9999-12-31 23:59:59.99'
delete UP_AssignedResourceNavigations where AssignedResourceType_Id in (select id from tmp_up_resourcetypeid) and ValidTo='9999-12-31 23:59:59.99'
delete UP_AssignedResourceTypes where id in (select id from tmp_up_resourcetypeid) and ValidTo='9999-12-31 23:59:59.99'

drop table tmp_up_resourcetypeid
GO
--Delete duplicate AssignedResourceScalar
select id into tmp_up_resourcescalarid  from (
select ars.id as id,
ROW_NUMBER() OVER(PARTITION BY OwnerType, Owner_Id, AssignedResourceType_Id, property_id, StartDate, EndDate, WorkflowState, value ORDER BY ars.Id) as rowNumber
from UP_AssignedResourceScalars ars
where ars.ValidTo = '9999-12-31 23:59:59.99') t  where t.rowNumber>1

delete UP_AssignedResourceScalars where id in (select id from tmp_up_resourcescalarid) and ValidTo='9999-12-31 23:59:59.99'

drop table tmp_up_resourcescalarid
GO
--Delete duplicate AssignedResourceNavigation
select id into tmp_up_resourcesnavigationid  from (
select ars.id as id,
ROW_NUMBER() OVER(PARTITION BY OwnerType, Owner_Id, AssignedResourceType_Id, property_id, StartDate, EndDate, WorkflowState, resource_id ORDER BY ars.Id) as rowNumber
from UP_AssignedResourceNavigations ars
where ars.ValidTo = '9999-12-31 23:59:59.99') t  where t.rowNumber>1

delete UP_AssignedResourceNavigations where id in (select id from tmp_up_resourcesnavigationid) and ValidTo='9999-12-31 23:59:59.99'

drop table tmp_up_resourcesnavigationid
GO
