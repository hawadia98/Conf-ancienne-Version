/* Count in the ur_*changes tables */
SELECT 'ResourceChanges_Count', COUNT(*) FROM ur_resourcechanges WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceLinkChanges_Count', COUNT(*) FROM ur_resourcelinkchanges WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'ResourceFileChanges_Count', COUNT(*) FROM ur_resourcefilechanges WHERE validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
