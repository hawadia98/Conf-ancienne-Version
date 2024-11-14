/* Number of identities (sources of a role model with dimensions) */
SELECT 'Identities_Count', COUNT(*)
FROM ur_resources r
JOIN up_contextrules cr ON cr.sourceentitytype_id=r."type"
WHERE r.validto=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121);

/* Number of identities with at least an assigned resource.
   Target only the resources with Records. */
SELECT 'License_Count', COUNT(*)
FROM ur_resources r
JOIN up_contextrules cr ON cr."sourceentitytype_id"=r."type" AND cr."resourcesbinding_id" IS NOT NULL
WHERE r."validto"=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121)
  AND r."id" in (SELECT art."owner_id" FROM "up_assignedresourcetypes" art WHERE art."ownertype"=cr."sourceentitytype_id" AND art."validto"=CONVERT(datetime2(2),'9999-12-31 23:59:59.999',121) AND art."startdate"<CURRENT_TIMESTAMP AND art."enddate">CURRENT_TIMESTAMP);

/* To evaluate the configuration complexity, we evaluate different metrics */
SELECT 'AccessControlRules_Count', COUNT(*) FROM ua_accesscontrolrules;
SELECT 'AccessControlEntries_Count', COUNT(*) FROM ua_accesscontrolentries;
SELECT 'Expressions_Size', SUM(aa.l) FROM
(
SELECT LEN(expression) l FROM UP_ResourceScalarRules
UNION ALL
SELECT LEN(sourceexpression) FROM up_resourcecorrelationrules
UNION ALL
SELECT LEN(targetexpression) FROM up_resourcecorrelationrules
UNION ALL
SELECT LEN(sourceexpression) FROM UP_ResourceQueryRules
UNION ALL
SELECT LEN(targetexpression) FROM UP_ResourceQueryRules
UNION ALL
SELECT LEN(ResourcesExpression) FROM UP_ContextRules
UNION ALL
SELECT LEN(ResourcesStartExpression) FROM UP_ContextRules
UNION ALL
SELECT LEN(ResourcesEndExpression) FROM UP_ContextRules
UNION ALL
SELECT LEN(ExcludeExpression) FROM UP_ContextRules
) aa;


