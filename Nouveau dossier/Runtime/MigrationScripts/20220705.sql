IF OBJECT_ID('dbo.[ViewDefinition]', 'U') IS NOT NULL
BEGIN
    drop table ViewDefinition;
END
GO

CREATE TABLE ViewDefinition
(
	ID INT IDENTITY (0, 1) NOT NULL,
	TableName NVARCHAR(4000) NOT NULL,
	ViewDefinition NVARCHAR(4000) NOT NULL,
	DeleteView NVARCHAR(4000) NOT NULL,
)

INSERT INTO ViewDefinition (TableName, ViewDefinition, DeleteView)
SELECT TABLE_NAME, VIEW_DEFINITION, 'IF OBJECT_ID (''' + TABLE_NAME + ''', ''V'') IS NOT NULL  
DROP VIEW [' + TABLE_NAME + '];'
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME like 'yy_DashboardCounter_%'


--loop to delete view with Cateories foreignKey
DECLARE @DELETE_QUERY VARCHAR(MAX);
DECLARE @StartLoop INT
DECLARE @EndLoop INT

SELECT @EndLoop = COUNT(*), @StartLoop = 0
FROM ViewDefinition

WHILE @StartLoop < @EndLoop
BEGIN
    SELECT @DELETE_QUERY = DeleteView 
    FROM ViewDefinition
	where ID = @StartLoop

    EXEC (@DELETE_QUERY)

    SET @StartLoop = @StartLoop + 1
END
GO

IF COL_LENGTH('dbo.UP_Categories', 'ValidTo') IS NOT NULL
BEGIN
    SET NOEXEC ON
END
GO

IF (OBJECT_ID('dbo.DF_Categories_CurrentNodeIndex', 'D') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_CurrentNodeIndex];
END
GO

IF (OBJECT_ID('dbo.DF_Categories_NextNodeIndex', 'D') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_NextNodeIndex];
END
GO

IF (OBJECT_ID('dbo.DF_Categories_ResourceTypeCounter', 'D') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_ResourceTypeCounter];
END
GO

IF (OBJECT_ID('dbo.DF_Categories_IsCollapsed', 'D') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_IsCollapsed];
END
GO

IF (OBJECT_ID('dbo.DF_Categories_CompositeRoleCounter', 'D') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_CompositeRoleCounter];
END
GO

IF (OBJECT_ID('dbo.DF_Categories_SingleRoleCounter', 'D') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [DF_Categories_SingleRoleCounter];
END
GO

IF (OBJECT_ID('dbo.FK_AccessCertificationDataFilters_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[US_AccessCertificationDataFilters] DROP CONSTRAINT [FK_AccessCertificationDataFilters_Category];
END
GO

IF (OBJECT_ID('dbo.FK_CompositeRolesCategories_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_CompositeRolesCategories] DROP CONSTRAINT [FK_CompositeRolesCategories_Category];
END
GO

IF (OBJECT_ID('dbo.FK_PendingApprovalRules_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_PendingApprovalRules] DROP CONSTRAINT [FK_PendingApprovalRules_Category];
END
GO

IF (OBJECT_ID('dbo.FK_ProfileContexts_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UA_ProfileContexts] DROP CONSTRAINT [FK_ProfileContexts_Category];
END
GO

IF (OBJECT_ID('dbo.FK_CompositeRoles_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_CompositeRoles] DROP CONSTRAINT [FK_CompositeRoles_Category];
END
GO

IF (OBJECT_ID('dbo.FK_MiningRules_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_MiningRules] DROP CONSTRAINT [FK_MiningRules_Category];
END
GO

IF (OBJECT_ID('dbo.FK_ResourceTypes_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_ResourceTypes] DROP CONSTRAINT [FK_ResourceTypes_Category];
END
GO

IF (OBJECT_ID('dbo.FK_RoleCounters_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_RoleCounters] DROP CONSTRAINT [FK_RoleCounters_Category];
END
GO

IF (OBJECT_ID('dbo.FK_ResourceTypesCategories_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_ResourceTypesCategories] DROP CONSTRAINT [FK_ResourceTypesCategories_Category];
END
GO

IF (OBJECT_ID('dbo.FK_SingleRoles_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_SingleRoles] DROP CONSTRAINT [FK_SingleRoles_Category];
END
GO

IF (OBJECT_ID('dbo.FK_RoleMappings_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_RoleMappings] DROP CONSTRAINT [FK_RoleMappings_Category];
END
GO

IF (OBJECT_ID('dbo.FK_Categories_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [FK_Categories_Category];
END
GO

IF (OBJECT_ID('dbo.FK_Categories_Policy', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_Categories] DROP CONSTRAINT [FK_Categories_Policy];
END
GO

IF (OBJECT_ID('dbo.FK_SingleRolesCategories_Category', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[UP_SingleRolesCategories] DROP CONSTRAINT [FK_SingleRolesCategories_Category];
END
GO

BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UP_Categories] (
    [Id]                   BIGINT           NOT NULL,
    [Policy_Id]            BIGINT           NOT NULL,
    [Parent_Id]            BIGINT           NULL,
    [CurrentNodeIndex]     UNIQUEIDENTIFIER CONSTRAINT [DF_Categories_CurrentNodeIndex] DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    [NextNodeIndex]        UNIQUEIDENTIFIER CONSTRAINT [DF_Categories_NextNodeIndex] DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    [Identifier]           VARCHAR (442)    COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    [ValidFrom]            DATETIME2 (2)    CONSTRAINT [DF_Categories_ValidFrom] DEFAULT GETUTCDATE() NOT NULL,
    [ValidTo]              DATETIME2 (2)    CONSTRAINT [DF_Categories_ValidTo] DEFAULT (CONVERT (DATETIME2 (2), '9999-12-31 23:59:59.999', 121)) NOT NULL,
    [DisplayName_L1]       NVARCHAR (442)   NOT NULL,
    [DisplayName_L2]       NVARCHAR (442)   NULL,
    [DisplayName_L3]       NVARCHAR (442)   NULL,
    [DisplayName_L4]       NVARCHAR (442)   NULL,
    [DisplayName_L5]       NVARCHAR (442)   NULL,
    [DisplayName_L6]       NVARCHAR (442)   NULL,
    [DisplayName_L7]       NVARCHAR (442)   NULL,
    [DisplayName_L8]       NVARCHAR (442)   NULL,
    [DisplayName_L9]       NVARCHAR (442)   NULL,
    [DisplayName_L10]      NVARCHAR (442)   NULL,
    [DisplayName_L11]      NVARCHAR (442)   NULL,
    [DisplayName_L12]      NVARCHAR (442)   NULL,
    [DisplayName_L13]      NVARCHAR (442)   NULL,
    [DisplayName_L14]      NVARCHAR (442)   NULL,
    [DisplayName_L15]      NVARCHAR (442)   NULL,
    [DisplayName_L16]      NVARCHAR (442)   NULL,
    [FullName_L1]          NVARCHAR (4000)  NULL,
    [FullName_L2]          NVARCHAR (4000)  NULL,
    [FullName_L3]          NVARCHAR (4000)  NULL,
    [FullName_L4]          NVARCHAR (4000)  NULL,
    [FullName_L5]          NVARCHAR (4000)  NULL,
    [FullName_L6]          NVARCHAR (4000)  NULL,
    [FullName_L7]          NVARCHAR (4000)  NULL,
    [FullName_L8]          NVARCHAR (4000)  NULL,
    [FullName_L9]          NVARCHAR (4000)  NULL,
    [FullName_L10]         NVARCHAR (4000)  NULL,
    [FullName_L11]         NVARCHAR (4000)  NULL,
    [FullName_L12]         NVARCHAR (4000)  NULL,
    [FullName_L13]         NVARCHAR (4000)  NULL,
    [FullName_L14]         NVARCHAR (4000)  NULL,
    [FullName_L15]         NVARCHAR (4000)  NULL,
    [FullName_L16]         NVARCHAR (4000)  NULL,
    [Description_L1]       NVARCHAR (1024)  NULL,
    [Description_L2]       NVARCHAR (1024)  NULL,
    [Description_L3]       NVARCHAR (1024)  NULL,
    [Description_L4]       NVARCHAR (1024)  NULL,
    [Description_L5]       NVARCHAR (1024)  NULL,
    [Description_L6]       NVARCHAR (1024)  NULL,
    [Description_L7]       NVARCHAR (1024)  NULL,
    [Description_L8]       NVARCHAR (1024)  NULL,
    [Description_L9]       NVARCHAR (1024)  NULL,
    [Description_L10]      NVARCHAR (1024)  NULL,
    [Description_L11]      NVARCHAR (1024)  NULL,
    [Description_L12]      NVARCHAR (1024)  NULL,
    [Description_L13]      NVARCHAR (1024)  NULL,
    [Description_L14]      NVARCHAR (1024)  NULL,
    [Description_L15]      NVARCHAR (1024)  NULL,
    [Description_L16]      NVARCHAR (1024)  NULL,
    [IsCollapsed]          BIT              CONSTRAINT [DF_Categories_IsCollapsed] DEFAULT ((0)) NOT NULL,
    [SingleRoleCounter]    INT              CONSTRAINT [DF_Categories_SingleRoleCounter] DEFAULT ((0)) NOT NULL,
    [CompositeRoleCounter] INT              CONSTRAINT [DF_Categories_CompositeRoleCounter] DEFAULT ((0)) NOT NULL,
    [ResourceTypeCounter]  INT              CONSTRAINT [DF_Categories_ResourceTypeCounter] DEFAULT ((0)) NOT NULL,
    [WhenCreated]          SMALLDATETIME    NULL,
    [CreatedBy_Id]         BIGINT           NULL,
    [WhenChanged]          SMALLDATETIME    NULL,
    [ChangedBy_Id]         BIGINT           NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Categories1] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_U_Categories_Identifier1] UNIQUE NONCLUSTERED ([Identifier] ASC, [ValidTo] ASC)
);

CREATE CLUSTERED INDEX [tmp_ms_xx_index_IX_Categories1]
    ON [dbo].[tmp_ms_xx_UP_Categories]([Id] ASC, [ValidTo] ASC);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[UP_Categories])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_UP_Categories] ([Id], [Policy_Id], [Parent_Id], [CurrentNodeIndex], [NextNodeIndex], [Identifier], [DisplayName_L1], [DisplayName_L2], [DisplayName_L3], [DisplayName_L4], [DisplayName_L5], [DisplayName_L6], [DisplayName_L7], [DisplayName_L8], [DisplayName_L9], [DisplayName_L10], [DisplayName_L11], [DisplayName_L12], [DisplayName_L13], [DisplayName_L14], [DisplayName_L15], [DisplayName_L16], [FullName_L1], [FullName_L2], [FullName_L3], [FullName_L4], [FullName_L5], [FullName_L6], [FullName_L7], [FullName_L8], [FullName_L9], [FullName_L10], [FullName_L11], [FullName_L12], [FullName_L13], [FullName_L14], [FullName_L15], [FullName_L16], [Description_L1], [Description_L2], [Description_L3], [Description_L4], [Description_L5], [Description_L6], [Description_L7], [Description_L8], [Description_L9], [Description_L10], [Description_L11], [Description_L12], [Description_L13], [Description_L14], [Description_L15], [Description_L16], [IsCollapsed], [SingleRoleCounter], [CompositeRoleCounter], [ResourceTypeCounter], [WhenCreated], [CreatedBy_Id], [WhenChanged], [ChangedBy_Id])
        SELECT   [Id],
                 [Policy_Id],
                 [Parent_Id],
                 [CurrentNodeIndex],
                 [NextNodeIndex],
                 [Identifier],
                 [DisplayName_L1],
                 [DisplayName_L2],
                 [DisplayName_L3],
                 [DisplayName_L4],
                 [DisplayName_L5],
                 [DisplayName_L6],
                 [DisplayName_L7],
                 [DisplayName_L8],
                 [DisplayName_L9],
                 [DisplayName_L10],
                 [DisplayName_L11],
                 [DisplayName_L12],
                 [DisplayName_L13],
                 [DisplayName_L14],
                 [DisplayName_L15],
                 [DisplayName_L16],
                 [FullName_L1],
                 [FullName_L2],
                 [FullName_L3],
                 [FullName_L4],
                 [FullName_L5],
                 [FullName_L6],
                 [FullName_L7],
                 [FullName_L8],
                 [FullName_L9],
                 [FullName_L10],
                 [FullName_L11],
                 [FullName_L12],
                 [FullName_L13],
                 [FullName_L14],
                 [FullName_L15],
                 [FullName_L16],
                 [Description_L1],
                 [Description_L2],
                 [Description_L3],
                 [Description_L4],
                 [Description_L5],
                 [Description_L6],
                 [Description_L7],
                 [Description_L8],
                 [Description_L9],
                 [Description_L10],
                 [Description_L11],
                 [Description_L12],
                 [Description_L13],
                 [Description_L14],
                 [Description_L15],
                 [Description_L16],
                 [IsCollapsed],
                 [SingleRoleCounter],
                 [CompositeRoleCounter],
                 [ResourceTypeCounter],
                 [WhenCreated],
                 [CreatedBy_Id],
                 [WhenChanged],
                 [ChangedBy_Id]
        FROM     [dbo].[UP_Categories]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[UP_Categories];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UP_Categories]', N'UP_Categories';

EXECUTE sp_rename N'[dbo].[UP_Categories].[tmp_ms_xx_index_IX_Categories1]', N'IX_Categories', N'INDEX';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Categories1]', N'PK_Categories', N'OBJECT';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_U_Categories_Identifier1]', N'U_Categories_Identifier', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
GO

ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH NOCHECK
    ADD CONSTRAINT [FK_AccessCertificationDataFilters_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRolesCategories_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH NOCHECK
    ADD CONSTRAINT [FK_PendingApprovalRules_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UA_ProfileContexts] WITH NOCHECK
    ADD CONSTRAINT [FK_ProfileContexts_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_CompositeRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositeRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_MiningRules] WITH NOCHECK
    ADD CONSTRAINT [FK_MiningRules_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_ResourceTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypes_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_RoleCounters] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleCounters_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_ResourceTypesCategories_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_SingleRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRoles_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_RoleMappings] WITH NOCHECK
    ADD CONSTRAINT [FK_RoleMappings_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_Categories] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Category] FOREIGN KEY ([Parent_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[UP_Categories] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Policy] FOREIGN KEY ([Policy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);
GO

ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH NOCHECK
    ADD CONSTRAINT [FK_SingleRolesCategories_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[UP_Categories] ([Id]);
GO

ALTER TABLE [dbo].[US_AccessCertificationDataFilters] WITH CHECK CHECK CONSTRAINT [FK_AccessCertificationDataFilters_Category];

ALTER TABLE [dbo].[UP_CompositeRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_CompositeRolesCategories_Category];

ALTER TABLE [dbo].[UP_PendingApprovalRules] WITH CHECK CHECK CONSTRAINT [FK_PendingApprovalRules_Category];

ALTER TABLE [dbo].[UA_ProfileContexts] WITH CHECK CHECK CONSTRAINT [FK_ProfileContexts_Category];

ALTER TABLE [dbo].[UP_CompositeRoles] WITH CHECK CHECK CONSTRAINT [FK_CompositeRoles_Category];

ALTER TABLE [dbo].[UP_MiningRules] WITH CHECK CHECK CONSTRAINT [FK_MiningRules_Category];

ALTER TABLE [dbo].[UP_ResourceTypes] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypes_Category];

ALTER TABLE [dbo].[UP_RoleCounters] WITH CHECK CHECK CONSTRAINT [FK_RoleCounters_Category];

ALTER TABLE [dbo].[UP_ResourceTypesCategories] WITH CHECK CHECK CONSTRAINT [FK_ResourceTypesCategories_Category];

ALTER TABLE [dbo].[UP_SingleRoles] WITH CHECK CHECK CONSTRAINT [FK_SingleRoles_Category];

ALTER TABLE [dbo].[UP_RoleMappings] WITH CHECK CHECK CONSTRAINT [FK_RoleMappings_Category];

ALTER TABLE [dbo].[UP_Categories] WITH CHECK CHECK CONSTRAINT [FK_Categories_Category];

ALTER TABLE [dbo].[UP_Categories] WITH CHECK CHECK CONSTRAINT [FK_Categories_Policy];

ALTER TABLE [dbo].[UP_SingleRolesCategories] WITH CHECK CHECK CONSTRAINT [FK_SingleRolesCategories_Category];
GO

SET NOEXEC OFF
GO

DECLARE @CREATE_QUERY VARCHAR(MAX);
DECLARE @StartLoop INT
DECLARE @EndLoop INT

SELECT @EndLoop = COUNT(*), @StartLoop = 0
FROM ViewDefinition

WHILE @StartLoop < @EndLoop
BEGIN
    SELECT @CREATE_QUERY = ViewDefinition 
    FROM ViewDefinition
	where ID = @StartLoop

    EXEC (@CREATE_QUERY)

    SET @StartLoop = @StartLoop + 1
END
GO

drop table ViewDefinition
GO
