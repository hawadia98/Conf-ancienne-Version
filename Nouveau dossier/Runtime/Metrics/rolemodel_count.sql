/* Size of the role model */
SELECT 'CompositeRoles_HistorizedCount', COUNT(*) FROM up_compositeroles WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'CompositeRoles_Count', COUNT(*) FROM up_compositeroles WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'SingleRoles_HistorizedCount', COUNT(*) FROM up_singleroles WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'SingleRoles_Count', COUNT(*) FROM up_singleroles WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceTypes_HistorizedCount', COUNT(*) FROM up_resourcetypes WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceTypes_Count', COUNT(*) FROM up_resourcetypes WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'Risks_Count', COUNT(*) FROM up_risks WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'Risks_HistorizedCount', COUNT(*) FROM up_risks WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'CompositeRoleRules_Count', COUNT(*) FROM up_compositerolerules;
SELECT 'SingleRoleRules_Count', COUNT(*) FROM up_singlerolerules;
SELECT 'ResourceTypeRules_Count', COUNT(*) FROM up_resourcetyperules;
SELECT 'ResourceScalarRules_Count', COUNT(*) FROM up_resourcescalarrules;
SELECT 'ResourceNavigationRules_Count', COUNT(*) FROM up_resourcenavigationrules;
SELECT 'ResourceQueryRules_Count', COUNT(*) FROM up_resourcequeryrules;
SELECT 'ResourceBinaryRules_Count', COUNT(*) FROM up_resourcebinaryrules;
SELECT 'ResourceCorrelationRules_Count', COUNT(*) FROM up_resourcecorrelationrules;





