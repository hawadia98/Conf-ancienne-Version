
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedResourceNavigations_PendingOrders' AND object_id = OBJECT_ID('UP_AssignedResourceNavigations'))
BEGIN
    CREATE INDEX "IX_AssignedResourceNavigations_PendingOrders" ON "UP_AssignedResourceNavigations" ("OwnerType", "StartDate") INCLUDE ("IsPending") WHERE "ProvisioningState"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedResourceNavigations_IsPending' AND object_id = OBJECT_ID('UP_AssignedResourceNavigations'))
BEGIN
    CREATE INDEX "IX_AssignedResourceNavigations_IsPending" ON "UP_AssignedResourceNavigations" ("OwnerType") WHERE "IsPending"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedResourceScalars_PendingOrders' AND object_id = OBJECT_ID('UP_AssignedResourceScalars'))
BEGIN
    CREATE INDEX "IX_AssignedResourceScalars_PendingOrders" ON "UP_AssignedResourceScalars" ("OwnerType", "StartDate") INCLUDE ("IsPending") WHERE "ProvisioningState"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedResourceScalars_IsPending' AND object_id = OBJECT_ID('UP_AssignedResourceScalars'))
BEGIN
    CREATE INDEX "IX_AssignedResourceScalars_IsPending" ON "UP_AssignedResourceScalars" ("OwnerType") WHERE "IsPending"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
END
GO
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedResourceBinaries_PendingOrders' AND object_id = OBJECT_ID('UP_AssignedResourceScalars'))
BEGIN
    CREATE INDEX "IX_AssignedResourceBinaries_PendingOrders" ON "UP_AssignedResourceScalars" ("OwnerType", "StartDate") INCLUDE ("IsPending") WHERE "ProvisioningState"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedResourceBinaries_IsPending' AND object_id = OBJECT_ID('UP_AssignedResourceBinaries'))
BEGIN
    CREATE INDEX "IX_AssignedResourceBinaries_IsPending" ON "UP_AssignedResourceBinaries" ("OwnerType") WHERE "IsPending"=1 AND "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) WITH (FILLFACTOR=90, PAD_INDEX=ON);
END
GO
