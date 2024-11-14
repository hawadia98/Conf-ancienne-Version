/* Counts of the up_assigned* and similar tables */
SELECT 'AssignedCompositeRoles_HistorizedCount', COUNT(*) FROM up_assignedcompositeroles WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedCompositeRoles_Count', COUNT(*) FROM up_assignedcompositeroles WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedSingleRoles_HistorizedCount', COUNT(*) FROM up_assignedsingleroles WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedSingleRoles_Count', COUNT(*) FROM up_assignedsingleroles WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceTypes_HistorizedCount', COUNT(*) FROM up_assignedresourcetypes WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceTypes_Count', COUNT(*) FROM up_assignedresourcetypes WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceNavigations_HistorizedCount', COUNT(*) FROM up_assignedresourcenavigations WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceNavigations_Count', COUNT(*) FROM up_assignedresourcenavigations WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceScalars_HistorizedCount', COUNT(*) FROM up_assignedresourcescalars WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceScalars_Count', COUNT(*) FROM up_assignedresourcescalars WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceBinaries_HistorizedCount', COUNT(*) FROM up_assignedresourcebinaries WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'AssignedResourceBinaries_Count', COUNT(*) FROM up_assignedresourcebinaries WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'IdentifiedRisks_HistorizedCount', COUNT(*) FROM up_identifiedrisks WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'IdentifiedRisks_Count', COUNT(*) FROM up_identifiedrisks WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'Contexts_Count', COUNT(*) FROM up_contexts;
