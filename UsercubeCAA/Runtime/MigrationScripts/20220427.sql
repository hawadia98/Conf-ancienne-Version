UPDATE art set art.Validto=rt.Validto
FROM UP_AssignedResourceTypes art
JOIN UP_ResourceTypes rt on rt.id =art.ResourceType_Id and rt.ValidTo<CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)
WHERE art.ValidTo=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)
GO
UPDATE acr set acr.Validto=cr.Validto
FROM UP_AssignedCompositeRoles acr
JOIN UP_CompositeRoles cr on cr.id =acr.Role_Id and cr.ValidTo<CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)
WHERE acr.ValidTo=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)

GO
UPDATE asr set asr.Validto=sr.Validto
FROM UP_AssignedSingleRoles asr
JOIN UP_SingleRoles sr on sr.id =asr.Role_Id and sr.ValidTo<CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)
WHERE asr.ValidTo=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)

GO
UPDATE arn set arn.Validto =GETUTCDATE()
FROM UP_AssignedResourceNavigations arn
LEFT JOIN UP_AssignedResourceTypes art on art.id = arn.AssignedResourceType_Id and art.Owner_Id=arn.Owner_Id and art.OwnerType=arn.OwnerType and art.ValidTo=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)
WHERE arn.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121) and art.id is null

GO
UPDATE arn set arn.Validto =GETUTCDATE()
FROM UP_AssignedResourceScalars arn
LEFT JOIN UP_AssignedResourceTypes art on art.id = arn.AssignedResourceType_Id and art.Owner_Id=arn.Owner_Id and art.OwnerType=arn.OwnerType and art.ValidTo=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)
WHERE arn.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121) and art.id is null

GO
UPDATE arn set arn.Validto =GETUTCDATE()
FROM UP_AssignedResourceBinaries arn
LEFT JOIN UP_AssignedResourceTypes art on art.id = arn.AssignedResourceType_Id and art.Owner_Id=arn.Owner_Id and art.OwnerType=arn.OwnerType and art.ValidTo=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121)
WHERE arn.ValidTo = CONVERT(DATETIME2(2),'9999-12-31 23:59:59.99',121) and art.id is null
GO

UPDATE art set art.ValidTo=GETUTCDATE()
FROM UP_AssignedResourceTypes art 
LEFT JOIN UP_ResourceTypes rt ON rt.id = art.ResourceType_Id and rt.SourceEntityType_Id = art.OwnerType
WHERE art.ValidTo=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) and rt.Id is null
GO



If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_ActivityInstances_WorkflowInstance' AND object_id = OBJECT_ID('UW_ActivityInstances'))
BEGIN

DROP INDEX [IX_ActivityInstances_WorkflowInstance] ON [dbo].[UW_ActivityInstances]

END
GO

CREATE NONCLUSTERED INDEX "IX_ActivityInstances_WorkflowInstance" ON "UW_ActivityInstances" ("WorkflowInstance_Id");
GO
