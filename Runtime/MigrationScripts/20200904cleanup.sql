/* Migration script for 5.1.5 */

ALTER TABLE [dbo].[UJ_Tasks] DROP CONSTRAINT [FK_Tasks_DependOnTask];

GO
ALTER TABLE [dbo].[UJ_Tasks] DROP COLUMN [DependOnTask_Id];
GO

GO
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP CONSTRAINT [DF_ScaffoldingArguments_FileAreEncrypted];
ALTER TABLE [dbo].[UD_ScaffoldingArguments] DROP COLUMN [FilesAreEncrypted]

GO


EXEC sp_rename 'UP_AssignedCompositeRoles.IsInduced', 'IsInferred', 'COLUMN';
GO
EXEC sp_rename 'DF_AssignedCompositeRoles_IsInduced', 'DF_AssignedCompositeRoles_IsInferred', 'OBJECT';
GO

EXEC sp_rename 'UP_AssignedSingleRoles.IsInduced', 'IsInferred', 'COLUMN';
GO
EXEC sp_rename 'DF_AssignedSingleRoles_IsInduced', 'DF_AssignedSingleRoles_IsInferred', 'OBJECT';
GO

EXEC sp_rename 'UP_AssignedResourceTypes.IsInduced', 'IsInferred', 'COLUMN';
GO
EXEC sp_rename 'DF_AssignedResourceTypes_IsInduced', 'DF_AssignedResourceTypes_IsInferred', 'OBJECT';
GO
