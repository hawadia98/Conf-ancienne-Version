/* Count of the different tables with metadata */

SELECT 'Connectors_Count', COUNT(*) FROM uc_connectors;

SELECT 'EntityTypes_Count', COUNT(*) FROM um_entitytypes WHERE id>0 AND id<2147483653 AND validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'EntityProperties_Count', COUNT(*) FROM um_entityproperties WHERE entitytype_id>0 AND entitytype_id<2147483653 AND validto<CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);
SELECT 'Dimensions_Count', COUNT(*) FROM um_dimensions;

SELECT 'Workflows_Count', COUNT(*) FROM uw_workflows;

SELECT 'Jobs_Count', COUNT(*) FROM uj_jobs;

/* ACR + assignedprofiles */
