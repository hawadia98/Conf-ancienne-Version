GO
PRINT N'Dropping [dbo].[UP_RoleMappings] constraints';

GO
ALTER TABLE [dbo].[UP_RoleMappings] DROP CONSTRAINT [FK_RoleMappings_Connector], [FK_RoleMappings_Binding], [DF_RoleMapping_NeedApprovalSingleRole];

GO
ALTER TABLE [dbo].[UP_RoleMappings] ALTER COLUMN [Category_Id] BIGINT NULL;

GO
PRINT N'Dropping [dbo].[UP_RoleMappings] columns';

GO
ALTER TABLE [dbo].[UP_RoleMappings] DROP COLUMN [Connector_Id], [NeedApprovalSingleRole], [Expression], [Binding_Id];

GO
PRINT N'Altering [dbo].[UP_RoleMappings]...';

GO
ALTER TABLE [dbo].[UP_RoleMappings]
    ADD [ImplicitApproval] TINYINT CONSTRAINT [DF_RoleMappings_ImplicitApproval] DEFAULT ((0)) NOT NULL,
        [ApprovalRequired] BIT CONSTRAINT [DF_RoleMapping_ApprovalRequired] DEFAULT ((0)) NOT NULL,
        [WhereExpression] VARCHAR(4000) NULL,
        [CategoryIdentifierBinding_Id] BIGINT NULL,
        [CategoryIdentifierExpression] VARCHAR(4000) NULL,
        [CategoryDisplayNameBinding_Id] BIGINT NULL,
        [CategoryDisplayNameExpression] VARCHAR(4000) NULL,
        [ParentCategoryIdentifierBinding_Id] BIGINT NULL,
        [ParentCategoryIdentifierExpression] VARCHAR(4000) NULL,
        [IdentifierBinding_Id] BIGINT NULL,
        [DisplayNameBinding_Id] BIGINT NULL,
        [RolePolicy_Id] BIGINT NULL,
        CONSTRAINT [FK_RoleMappings_IdentifierBinding] FOREIGN KEY ([IdentifierBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]),
        CONSTRAINT [FK_RoleMappings_DisplayNameBinding] FOREIGN KEY ([DisplayNameBinding_Id]) REFERENCES [dbo].[UM_Bindings] ([Id]),
        CONSTRAINT [FK_RoleMappings_RolePolicy] FOREIGN KEY ([RolePolicy_Id]) REFERENCES [dbo].[UP_Policies] ([Id]);


GO
