/* Counters for non conforming/prexisting permissions and orphan accounts
=> to monitor when customers go to production to make sure they are cleaning their data
*/

SELECT 'OrphansAccounts_Count', COUNT(*)
FROM up_assignedresourcetypes
WHERE owner_id IS NULL and resource_id IS NOT NULL AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'NonConformingAccounts_Count', COUNT(*)
FROM up_assignedresourcetypes
WHERE owner_id IS NOT NULL and resource_id IS NOT NULL AND workflowstate=1 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'PreexistingAccounts_Count', COUNT(*)
FROM up_assignedresourcetypes
WHERE owner_id IS NOT NULL and resource_id IS NOT NULL AND workflowstate=3 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'NonConformingSingleRoles_Count', COUNT(*)
FROM up_assignedsingleroles
WHERE workflowstate=1 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'PreexistingSingleRoles_Count', COUNT(*)
FROM up_assignedsingleroles
WHERE workflowstate=3 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'NonConformingCompositeRoles_Count', COUNT(*)
FROM up_assignedsingleroles
WHERE workflowstate=1 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'PreexistingCompositeRoles_Count', COUNT(*)
FROM up_assignedsingleroles
WHERE workflowstate=3 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'PreexistingScalars_Count', COUNT(*)
FROM up_assignedresourcescalars
WHERE workflowstate=3 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'PreexistingNavigations_Count', COUNT(*)
FROM up_assignedresourcenavigations
WHERE workflowstate=3 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'NonConformingScalars_Count', COUNT(*)
FROM up_assignedresourcescalars
WHERE workflowstate=1 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

SELECT 'NonConformingNavigations_Count', COUNT(*)
FROM up_assignedresourcenavigations
WHERE workflowstate=1 AND validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
