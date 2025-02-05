/* Count of the ur_resources* tables */
SELECT 'Resources_HistorizedCount', COUNT(*) FROM ur_resources WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'Resources_Count', COUNT(*) FROM ur_resources WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceLinks_HistorizedCount', COUNT(*) FROM ur_resourcelinks WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceLinks_Count', COUNT(*) FROM ur_resourcelinks WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceFiles_HistorizedCount', COUNT(*) FROM ur_resourcefiles WHERE validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceFiles_Count', COUNT(*) FROM ur_resourcefiles WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'Resources_DirtyCount', COUNT(*) FROM ur_resources WHERE dirty=1 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
