DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
/* DELETE properties SingleRole.UD[DimensionIndex] of no defined dimensions */
PRINT 'DELETE properties SingleRole.UD[DimensionIndex] of no defined dimensions'
set @entityTypeId = 2147483667;
set @propertyId = -9223371955250397056;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties SingleRole.RD[DimensionIndex] of no defined dimensions */
PRINT 'DELETE properties SingleRole.RD[DimensionIndex] of no defined dimensions'
set @entityTypeId = 2147483667;
set @propertyId = -9223371955250396928;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations SingleRoleRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations SingleRoleRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218011521;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties SingleRoleRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties SingleRoleRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483681;
set @propertyId = -9223371895120854976;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]SingleRoleRules of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]SingleRoleRules of no defined dimensions'
set @reversePropertyId = -9223371940218011521;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties SingleRoleRule.Dimension[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties SingleRoleRule.Dimension[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147483681;
set @propertyId = -9223371895120854975;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties SingleRoleRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions */
PRINT 'DELETE properties SingleRoleRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions'
set @entityTypeId = 2147483681;
set @propertyId = -9223371895120854974;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations Policy.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations Policy.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218011137;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties Policy.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties Policy.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483669;
set @propertyId = -9223371946660462528;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Policies of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Policies of no defined dimensions'
set @reversePropertyId = -9223371940218011137;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties Policy.Dimension[DimensionIndex]Id of no defined dimensions */
PRINT 'DELETE properties Policy.Dimension[DimensionIndex]Id of no defined dimensions'
set @entityTypeId = 2147483669;
set @propertyId = -9223371946660462527;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties ResourceType.UD[DimensionIndex] of no defined dimensions */
PRINT 'DELETE properties ResourceType.UD[DimensionIndex] of no defined dimensions'
set @entityTypeId = 2147483671;
set @propertyId = -9223371938070527872;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties ResourceType.RD[DimensionIndex] of no defined dimensions */
PRINT 'DELETE properties ResourceType.RD[DimensionIndex] of no defined dimensions'
set @entityTypeId = 2147483671;
set @propertyId = -9223371938070527744;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations ResourceTypeRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations ResourceTypeRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218011393;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties ResourceTypeRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties ResourceTypeRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483682;
set @propertyId = -9223371890825887680;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceTypeRules of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceTypeRules of no defined dimensions'
set @reversePropertyId = -9223371940218011393;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties ResourceTypeRule.Dimension[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties ResourceTypeRule.Dimension[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147483682;
set @propertyId = -9223371890825887679;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties ResourceTypeRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions */
PRINT 'DELETE properties ResourceTypeRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions'
set @entityTypeId = 2147483682;
set @propertyId = -9223371890825887678;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations ResourceNavigationRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations ResourceNavigationRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218011265;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties ResourceNavigationRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties ResourceNavigationRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483683;
set @propertyId = -9223371886530920384;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceNavigationRules of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceNavigationRules of no defined dimensions'
set @reversePropertyId = -9223371940218011265;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties ResourceNavigationRule.Dimension[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties ResourceNavigationRule.Dimension[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147483683;
set @propertyId = -9223371886530920383;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties ResourceNavigationRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions */
PRINT 'DELETE properties ResourceNavigationRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions'
set @entityTypeId = 2147483683;
set @propertyId = -9223371886530920382;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations Context.[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations Context.[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218010753;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties Context.[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties Context.[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483662;
set @propertyId = -9223371976725233600;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Contexts of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Contexts of no defined dimensions'
set @reversePropertyId = -9223371940218010753;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties Context.[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties Context.[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147483662;
set @propertyId = -9223371976725233599;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations AutomationRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations AutomationRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218010497;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties AutomationRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties AutomationRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147484926;
set @propertyId = -9223366547886571456;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AutomationRules of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AutomationRules of no defined dimensions'
set @reversePropertyId = -9223371940218010497;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties AutomationRule.Dimension[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties AutomationRule.Dimension[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147484926;
set @propertyId = -9223366547886571455;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties AutomationRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions */
PRINT 'DELETE properties AutomationRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions'
set @entityTypeId = 2147484926;
set @propertyId = -9223366547886571454;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties CompositeRole.UD[DimensionIndex] of no defined dimensions */
PRINT 'DELETE properties CompositeRole.UD[DimensionIndex] of no defined dimensions'
set @entityTypeId = 2147483693;
set @propertyId = -9223371843581247360;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties CompositeRole.RD[DimensionIndex] of no defined dimensions */
PRINT 'DELETE properties CompositeRole.RD[DimensionIndex] of no defined dimensions'
set @entityTypeId = 2147483693;
set @propertyId = -9223371843581247232;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations CompositeRoleRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations CompositeRoleRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218011649;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties CompositeRoleRule.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties CompositeRoleRule.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483680;
set @propertyId = -9223371899415822272;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]CompositeRoleRules of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]CompositeRoleRules of no defined dimensions'
set @reversePropertyId = -9223371940218011649;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties CompositeRoleRule.Dimension[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties CompositeRoleRule.Dimension[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147483680;
set @propertyId = -9223371899415822271;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties CompositeRoleRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions */
PRINT 'DELETE properties CompositeRoleRule.Dimension[DimensionIdentifier]SubTree of no defined dimensions'
set @entityTypeId = 2147483680;
set @propertyId = -9223371899415822270;
set @increment = 3;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties ProfileContext.Dimension[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties ProfileContext.Dimension[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147483809;
set @propertyId = -9223371345365041052;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations ProfileContext.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations ProfileContext.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218011009;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties ProfileContext.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties ProfileContext.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483809;
set @propertyId = -9223371345365041051;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ProfileContexts of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ProfileContexts of no defined dimensions'
set @reversePropertyId = -9223371940218011009;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]Id of no defined dimensions */
PRINT 'DELETE properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]Id of no defined dimensions'
set @entityTypeId = 2147483916;
set @propertyId = -9223370885803540416;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE associations AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE associations AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] of no defined dimensions'
set @reversePropertyId = -9223371940218010881;
UPDATE a SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityAssociations a
LEFT JOIN UM_Dimensions d ON
a.Property2_Id - @reversePropertyId = d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE
a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property2_Id >= @reversePropertyId
AND a.Property2_Id < @reversePropertyId + 128
AND d.Id IS NULL
AND afi.Item_Id IS NULL;
/* DELETE properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] of no defined dimensions */
PRINT 'DELETE properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] of no defined dimensions'
set @entityTypeId = 2147483916;
set @propertyId = -9223370885803540415;
set @increment = 2;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AccessCertificationOwnerFilters of no defined dimensions */
PRINT 'DELETE reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AccessCertificationOwnerFilters of no defined dimensions'
set @reversePropertyId = -9223371940218010881;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.Id >= @reversePropertyId
AND p.Id < @reversePropertyId + 128
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]SubTree of no defined dimensions */
PRINT 'DELETE properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]SubTree of no defined dimensions'
set @entityTypeId = 2147483916;
set @propertyId = -9223370885803540160;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
/* DELETE properties DisplayEntityType.Dimension[DimensionIdentifier]IsActive of no defined dimensions */
PRINT 'DELETE properties DisplayEntityType.Dimension[DimensionIdentifier]IsActive of no defined dimensions'
set @entityTypeId = 2147483715;
set @propertyId = -9223371749091966912;
set @increment = 1;
UPDATE p SET ValidTo=CURRENT_TIMESTAMP
FROM UM_EntityProperties p
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
LEFT JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE
p.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND p.EntityType_Id = @entityTypeId
AND p.Id >= @propertyId
AND p.Id < @propertyId + (@increment * 128)
AND (p.Id - @propertyId) % @increment = 0
AND pfi.Item_Id IS NULL
AND d.Id IS NULL
GO
/* UPDATE/INSERT properties SingleRole.UD[DimensionIndex] */
PRINT 'UPDATE/INSERT properties SingleRole.UD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371955250397056;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('UD', d.ColumnMapping), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483667;
set @propertyId = -9223371955250397056;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('UD', d.ColumnMapping), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties SingleRole.UD[DimensionIndex] */
PRINT 'INSERT configuration file items of properties SingleRole.UD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371955250397056;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties SingleRole.RD[DimensionIndex] */
PRINT 'UPDATE/INSERT properties SingleRole.RD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371955250396928;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('RD', d.ColumnMapping), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483667;
set @propertyId = -9223371955250396928;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('RD', d.ColumnMapping), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties SingleRole.RD[DimensionIndex] */
PRINT 'INSERT configuration file items of properties SingleRole.RD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371955250396928;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties SingleRoleRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties SingleRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371895120854976;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483681;
set @propertyId = -9223371895120854976;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties SingleRoleRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties SingleRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371895120854976;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]SingleRoleRules */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]SingleRoleRules'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483681;
set @reversePropertyId = -9223371940218011521;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'SingleRoleRules'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483681;
set @reversePropertyId = -9223371940218011521;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'SingleRoleRules'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]SingleRoleRules */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]SingleRoleRules'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218011521;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations SingleRoleRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations SingleRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371895120854976;
set @increment = 3;
set @reversePropertyId = -9223371940218011521;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('SingleRoleRule.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371895120854976;
set @increment = 3;
set @reversePropertyId = -9223371940218011521;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('SingleRoleRule.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations SingleRoleRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations SingleRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371895120854976;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties SingleRoleRule.Dimension[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties SingleRoleRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371895120854975;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483681;
set @propertyId = -9223371895120854975;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties SingleRoleRule.Dimension[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties SingleRoleRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371895120854975;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties SingleRoleRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'UPDATE/INSERT properties SingleRoleRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371895120854974;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'SubTree'), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483681;
set @propertyId = -9223371895120854974;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'SubTree'), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties SingleRoleRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'INSERT configuration file items of properties SingleRoleRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371895120854974;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties Policy.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties Policy.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371946660462528;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483669;
set @propertyId = -9223371946660462528;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties Policy.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties Policy.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371946660462528;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Policies */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Policies'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483669;
set @reversePropertyId = -9223371940218011137;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Policies'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483669;
set @reversePropertyId = -9223371940218011137;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'Policies'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Policies */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Policies'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218011137;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations Policy.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations Policy.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371946660462528;
set @increment = 2;
set @reversePropertyId = -9223371940218011137;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('Policy.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371946660462528;
set @increment = 2;
set @reversePropertyId = -9223371940218011137;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('Policy.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations Policy.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations Policy.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371946660462528;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties Policy.Dimension[DimensionIndex]Id */
PRINT 'UPDATE/INSERT properties Policy.Dimension[DimensionIndex]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371946660462527;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.ColumnMapping, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483669;
set @propertyId = -9223371946660462527;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.ColumnMapping, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties Policy.Dimension[DimensionIndex]Id */
PRINT 'INSERT configuration file items of properties Policy.Dimension[DimensionIndex]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371946660462527;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceType.UD[DimensionIndex] */
PRINT 'UPDATE/INSERT properties ResourceType.UD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371938070527872;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('UD', d.ColumnMapping), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483671;
set @propertyId = -9223371938070527872;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('UD', d.ColumnMapping), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceType.UD[DimensionIndex] */
PRINT 'INSERT configuration file items of properties ResourceType.UD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371938070527872;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceType.RD[DimensionIndex] */
PRINT 'UPDATE/INSERT properties ResourceType.RD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371938070527744;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('RD', d.ColumnMapping), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483671;
set @propertyId = -9223371938070527744;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('RD', d.ColumnMapping), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceType.RD[DimensionIndex] */
PRINT 'INSERT configuration file items of properties ResourceType.RD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371938070527744;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceTypeRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties ResourceTypeRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371890825887680;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483682;
set @propertyId = -9223371890825887680;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceTypeRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties ResourceTypeRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371890825887680;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceTypeRules */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceTypeRules'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483682;
set @reversePropertyId = -9223371940218011393;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'ResourceTypeRules'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483682;
set @reversePropertyId = -9223371940218011393;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'ResourceTypeRules'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceTypeRules */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceTypeRules'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218011393;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations ResourceTypeRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations ResourceTypeRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371890825887680;
set @increment = 3;
set @reversePropertyId = -9223371940218011393;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('ResourceTypeRule.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371890825887680;
set @increment = 3;
set @reversePropertyId = -9223371940218011393;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('ResourceTypeRule.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations ResourceTypeRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations ResourceTypeRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371890825887680;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceTypeRule.Dimension[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties ResourceTypeRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371890825887679;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483682;
set @propertyId = -9223371890825887679;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceTypeRule.Dimension[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties ResourceTypeRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371890825887679;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceTypeRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'UPDATE/INSERT properties ResourceTypeRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371890825887678;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'SubTree'), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483682;
set @propertyId = -9223371890825887678;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'SubTree'), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceTypeRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'INSERT configuration file items of properties ResourceTypeRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371890825887678;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceNavigationRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties ResourceNavigationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371886530920384;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483683;
set @propertyId = -9223371886530920384;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceNavigationRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties ResourceNavigationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371886530920384;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceNavigationRules */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceNavigationRules'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483683;
set @reversePropertyId = -9223371940218011265;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'ResourceNavigationRules'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483683;
set @reversePropertyId = -9223371940218011265;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'ResourceNavigationRules'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceNavigationRules */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ResourceNavigationRules'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218011265;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations ResourceNavigationRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations ResourceNavigationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371886530920384;
set @increment = 3;
set @reversePropertyId = -9223371940218011265;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('ResourceNavigationRule.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371886530920384;
set @increment = 3;
set @reversePropertyId = -9223371940218011265;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('ResourceNavigationRule.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations ResourceNavigationRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations ResourceNavigationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371886530920384;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceNavigationRule.Dimension[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties ResourceNavigationRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371886530920383;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483683;
set @propertyId = -9223371886530920383;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceNavigationRule.Dimension[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties ResourceNavigationRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371886530920383;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ResourceNavigationRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'UPDATE/INSERT properties ResourceNavigationRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371886530920382;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'SubTree'), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483683;
set @propertyId = -9223371886530920382;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'SubTree'), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ResourceNavigationRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'INSERT configuration file items of properties ResourceNavigationRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371886530920382;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties Context.[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties Context.[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371976725233600;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = d.Identifier, Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483662;
set @propertyId = -9223371976725233600;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, d.Identifier, 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties Context.[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties Context.[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371976725233600;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Contexts */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Contexts'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483662;
set @reversePropertyId = -9223371940218010753;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Contexts'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483662;
set @reversePropertyId = -9223371940218010753;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'Contexts'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Contexts */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]Contexts'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218010753;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations Context.[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations Context.[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371976725233600;
set @increment = 2;
set @reversePropertyId = -9223371940218010753;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('Context.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371976725233600;
set @increment = 2;
set @reversePropertyId = -9223371940218010753;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('Context.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations Context.[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations Context.[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371976725233600;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties Context.[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties Context.[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371976725233599;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = CONCAT(d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483662;
set @propertyId = -9223371976725233599;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT(d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties Context.[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties Context.[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371976725233599;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties AutomationRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties AutomationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223366547886571456;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147484926;
set @propertyId = -9223366547886571456;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties AutomationRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties AutomationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223366547886571456;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AutomationRules */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AutomationRules'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147484926;
set @reversePropertyId = -9223371940218010497;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'AutomationRules'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147484926;
set @reversePropertyId = -9223371940218010497;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'AutomationRules'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AutomationRules */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AutomationRules'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218010497;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations AutomationRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations AutomationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223366547886571456;
set @increment = 3;
set @reversePropertyId = -9223371940218010497;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('AutomationRule.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223366547886571456;
set @increment = 3;
set @reversePropertyId = -9223371940218010497;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('AutomationRule.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations AutomationRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations AutomationRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223366547886571456;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties AutomationRule.Dimension[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties AutomationRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223366547886571455;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147484926;
set @propertyId = -9223366547886571455;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties AutomationRule.Dimension[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties AutomationRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223366547886571455;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties AutomationRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'UPDATE/INSERT properties AutomationRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223366547886571454;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'SubTree'), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147484926;
set @propertyId = -9223366547886571454;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'SubTree'), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties AutomationRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'INSERT configuration file items of properties AutomationRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223366547886571454;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties CompositeRole.UD[DimensionIndex] */
PRINT 'UPDATE/INSERT properties CompositeRole.UD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371843581247360;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('UD', d.ColumnMapping), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483693;
set @propertyId = -9223371843581247360;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('UD', d.ColumnMapping), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties CompositeRole.UD[DimensionIndex] */
PRINT 'INSERT configuration file items of properties CompositeRole.UD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371843581247360;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties CompositeRole.RD[DimensionIndex] */
PRINT 'UPDATE/INSERT properties CompositeRole.RD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371843581247232;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('RD', d.ColumnMapping), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483693;
set @propertyId = -9223371843581247232;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('RD', d.ColumnMapping), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties CompositeRole.RD[DimensionIndex] */
PRINT 'INSERT configuration file items of properties CompositeRole.RD[DimensionIndex]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371843581247232;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties CompositeRoleRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties CompositeRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371899415822272;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483680;
set @propertyId = -9223371899415822272;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties CompositeRoleRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties CompositeRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371899415822272;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]CompositeRoleRules */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]CompositeRoleRules'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483680;
set @reversePropertyId = -9223371940218011649;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'CompositeRoleRules'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483680;
set @reversePropertyId = -9223371940218011649;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'CompositeRoleRules'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]CompositeRoleRules */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]CompositeRoleRules'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218011649;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations CompositeRoleRule.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations CompositeRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371899415822272;
set @increment = 3;
set @reversePropertyId = -9223371940218011649;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('CompositeRoleRule.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371899415822272;
set @increment = 3;
set @reversePropertyId = -9223371940218011649;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('CompositeRoleRule.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations CompositeRoleRule.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations CompositeRoleRule.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371899415822272;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties CompositeRoleRule.Dimension[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties CompositeRoleRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371899415822271;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483680;
set @propertyId = -9223371899415822271;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties CompositeRoleRule.Dimension[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties CompositeRoleRule.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371899415822271;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties CompositeRoleRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'UPDATE/INSERT properties CompositeRoleRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371899415822270;
set @increment = 3;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'SubTree'), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483680;
set @propertyId = -9223371899415822270;
set @increment = 3;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'SubTree'), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties CompositeRoleRule.Dimension[DimensionIdentifier]SubTree */
PRINT 'INSERT configuration file items of properties CompositeRoleRule.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371899415822270;
set @increment = 3;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ProfileContext.Dimension[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties ProfileContext.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371345365041052;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483809;
set @propertyId = -9223371345365041052;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ProfileContext.Dimension[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties ProfileContext.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371345365041052;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties ProfileContext.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties ProfileContext.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371345365041051;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483809;
set @propertyId = -9223371345365041051;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties ProfileContext.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties ProfileContext.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371345365041051;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ProfileContexts */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ProfileContexts'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483809;
set @reversePropertyId = -9223371940218011009;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'ProfileContexts'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483809;
set @reversePropertyId = -9223371940218011009;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'ProfileContexts'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ProfileContexts */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]ProfileContexts'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218011009;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations ProfileContext.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations ProfileContext.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371345365041051;
set @increment = 2;
set @reversePropertyId = -9223371940218011009;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('ProfileContext.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223371345365041051;
set @increment = 2;
set @reversePropertyId = -9223371940218011009;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('ProfileContext.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations ProfileContext.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations ProfileContext.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371345365041051;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]Id */
PRINT 'UPDATE/INSERT properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223370885803540416;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'Id'), Type = 3, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483916;
set @propertyId = -9223370885803540416;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'Id'), 3, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]Id */
PRINT 'INSERT configuration file items of properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]Id'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223370885803540416;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223370885803540415;
set @increment = 2;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier), Type = 12, TargetEntityType = d.EntityType_Id
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483916;
set @propertyId = -9223370885803540415;
set @increment = 2;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier), 12, d.EntityType_Id
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223370885803540415;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AccessCertificationOwnerFilters */
PRINT 'UPDATE/INSERT reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AccessCertificationOwnerFilters'
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483916;
set @reversePropertyId = -9223371940218010881;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'AccessCertificationOwnerFilters'), Type = 12, TargetEntityType = @entityTypeId
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @reversePropertyId + d.ColumnMapping
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @reversePropertyId bigint;
set @entityTypeId = 2147483916;
set @reversePropertyId = -9223371940218010881;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @reversePropertyId + d.ColumnMapping, d.EntityType_Id, CONCAT('Dimension', d.Identifier, 'AccessCertificationOwnerFilters'), 12, @entityTypeId
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @reversePropertyId + d.ColumnMapping
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AccessCertificationOwnerFilters */
PRINT 'INSERT configuration file items of reverse properties [DimensionEntityType].Dimension[DimensionIdentifier]AccessCertificationOwnerFilters'
DECLARE @reversePropertyId bigint;
set @reversePropertyId = -9223371940218010881;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @reversePropertyId + d.ColumnMapping, 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @reversePropertyId + d.ColumnMapping
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT associations AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] */
PRINT 'UPDATE/INSERT associations AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223370885803540415;
set @increment = 2;
set @reversePropertyId = -9223371940218010881;
UPDATE UM_EntityAssociations SET Property1_Id = @propertyId + (d.ColumnMapping * @increment), Property2_Id = @reversePropertyId + d.ColumnMapping, Identifier = CONCAT('AccessCertificationOwnerFilter.Dimension', d.ColumnMapping), IsProperty1Collection = 0, IsProperty2Collection = 1
FROM UM_EntityAssociations a
INNER JOIN UM_Dimensions d ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems afi ON
afi.TableName = 'um_entityassociations' AND afi.Item_Id = a.Id
WHERE a.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)
AND a.Property1_Id >= @propertyId
AND a.Property1_Id < @propertyId + (128 * @increment)
AND afi.Item_Id IS NULL
GO
DECLARE @propertyId bigint;
DECLARE @increment bigint;
DECLARE @reversePropertyId bigint;
set @propertyId = -9223370885803540415;
set @increment = 2;
set @reversePropertyId = -9223371940218010881;
INSERT INTO UM_EntityAssociations (Id, Property1_Id, Property2_Id, Identifier, IsProperty1Collection, IsProperty2Collection)
SELECT @propertyId + (d.ColumnMapping * @increment), @propertyId + (d.ColumnMapping * @increment), @reversePropertyId + d.ColumnMapping, CONCAT('AccessCertificationOwnerFilter.Dimension', d.ColumnMapping), 0, 1
FROM UM_Dimensions d
LEFT JOIN UM_EntityAssociations a ON a.Property1_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE a.Id IS NULL
GO
/* INSERT configuration file items of associations AccessCertificationOwnerFilter.Dimension[DimensionIdentifier] */
PRINT 'INSERT configuration file items of associations AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223370885803540415;
set @increment = 2;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityassociations', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems afi ON afi.TableName = 'um_entityassociations' AND afi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE afi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]SubTree */
PRINT 'UPDATE/INSERT properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223370885803540160;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'SubTree'), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483916;
set @propertyId = -9223370885803540160;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'SubTree'), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]SubTree */
PRINT 'INSERT configuration file items of properties AccessCertificationOwnerFilter.Dimension[DimensionIdentifier]SubTree'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223370885803540160;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
/* UPDATE/INSERT properties DisplayEntityType.Dimension[DimensionIdentifier]IsActive */
PRINT 'UPDATE/INSERT properties DisplayEntityType.Dimension[DimensionIdentifier]IsActive'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371749091966912;
set @increment = 1;
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.Identifier, 'IsActive'), Type = 5, TargetEntityType = NULL
FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = @propertyId + (d.ColumnMapping * @increment)
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = p.Id
WHERE pfi.Item_Id IS NULL
GO
DECLARE @entityTypeId bigint;
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @entityTypeId = 2147483715;
set @propertyId = -9223371749091966912;
set @increment = 1;
INSERT INTO UM_EntityProperties (Id, EntityType_Id, Identifier, Type, TargetEntityType)
SELECT @propertyId + (d.ColumnMapping * @increment), @entityTypeId, CONCAT('Dimension', d.Identifier, 'IsActive'), 5, NULL
FROM UM_Dimensions d
LEFT JOIN UM_EntityProperties p ON p.Id = @propertyId + (d.ColumnMapping * @increment)
WHERE p.Id IS NULL
GO
/* INSERT configuration file items of properties DisplayEntityType.Dimension[DimensionIdentifier]IsActive */
PRINT 'INSERT configuration file items of properties DisplayEntityType.Dimension[DimensionIdentifier]IsActive'
DECLARE @propertyId bigint;
DECLARE @increment bigint;
set @propertyId = -9223371749091966912;
set @increment = 1;
INSERT INTO UD_ConfigurationFileItems (File_Id, Item_Id, TableName, Scaffolding_Id, LineNumber) SELECT dfi.File_Id, @propertyId + (d.ColumnMapping * @increment), 'um_entityproperties', dfi.Scaffolding_Id, dfi.LineNumber
FROM UM_Dimensions d
JOIN UD_ConfigurationFileItems dfi ON dfi.TableName = 'um_dimensions' AND dfi.Item_Id = d.Id
LEFT JOIN UD_ConfigurationFileItems pfi ON pfi.TableName = 'um_entityproperties' AND pfi.Item_Id = @propertyId + (d.ColumnMapping * @increment)
WHERE pfi.Item_Id IS NULL
GO
