
PRINT N'Creating Index [dbo].[UP_AssignedCompositeRoles].[IX_AssignedCompositeRole_History]...';

GO
If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedCompositeRole_History' AND object_id = OBJECT_ID('dbo.UP_AssignedCompositeRoles')
)
BEGIN
CREATE NONCLUSTERED INDEX [IX_AssignedCompositeRole_History]
    ON [dbo].[UP_AssignedCompositeRoles]([OwnerType] ASC, [Owner_Id] ASC, [Id] ASC, [ValidTo] ASC)
    INCLUDE([ValidFrom]);
END

GO
PRINT N'Creating Index [dbo].[UP_AssignedResourceNavigations].[IX_AssignedResourceNavigations_History]...';


GO
If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedResourceNavigations_History' AND object_id = OBJECT_ID('dbo.UP_AssignedResourceNavigations')
)
BEGIN
CREATE NONCLUSTERED INDEX [IX_AssignedResourceNavigations_History]
    ON [dbo].[UP_AssignedResourceNavigations]([OwnerType] ASC, [Owner_Id] ASC, [Id] ASC, [ValidTo] ASC)
    INCLUDE([ValidFrom]);
END

GO
PRINT N'Creating Index [dbo].[UP_AssignedResourceTypes].[IX_AssignedResourceTypes_History]...';


GO
If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedResourceTypes_History' AND object_id = OBJECT_ID('dbo.UP_AssignedResourceTypes')
)
BEGIN
CREATE NONCLUSTERED INDEX [IX_AssignedResourceTypes_History]
    ON [dbo].[UP_AssignedResourceTypes]([OwnerType] ASC, [Owner_Id] ASC, [Id] ASC, [ValidTo] ASC)
    INCLUDE([ValidFrom]);
END

GO
PRINT N'Creating Index [dbo].[UP_AssignedSingleRoles].[IX_AssignedSingleRole_History]...';


GO
If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_AssignedSingleRole_History' AND object_id = OBJECT_ID('dbo.UP_AssignedSingleRoles')
)
BEGIN
CREATE NONCLUSTERED INDEX [IX_AssignedSingleRole_History]
    ON [dbo].[UP_AssignedSingleRoles]([OwnerType] ASC, [Owner_Id] ASC, [Id] ASC, [ValidTo] ASC)
    INCLUDE([ValidFrom]);
END

GO
PRINT N'Creating Index [dbo].[UR_Resources].[IX_Resources_History]...';


GO
If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_Resources_History' AND object_id = OBJECT_ID('dbo.UR_Resources')
)
BEGIN
CREATE NONCLUSTERED INDEX [IX_Resources_History]
    ON [dbo].[UR_Resources]([Type] ASC, [Id] ASC, [ValidTo] ASC)
    INCLUDE([ValidFrom]);
END

GO
PRINT N'Update complete.';
