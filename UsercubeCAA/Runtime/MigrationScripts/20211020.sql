GO
PRINT N'Altering [dbo].[UP_SingleRoles]...';

GO
ALTER TABLE [dbo].[UP_SingleRoles]
    ADD [State] TINYINT CONSTRAINT "DF_SingleRoles_State" DEFAULT ((0)) NOT NULL;

GO
PRINT N'Altering [dbo].[UI_DisplayTableColumns]...';

GO
ALTER TABLE [dbo].[UI_DisplayTableColumns]
    ADD [OptimizedDisplayBinding_Id] BIGINT NULL;

GO
ALTER TABLE [dbo].[UI_DisplayTableColumns]
ADD CONSTRAINT "FK_DisplayTableColumns_OptimizedDisplayBinding" FOREIGN KEY ("OptimizedDisplayBinding_Id") REFERENCES "UM_Bindings" ("Id");

GO
PRINT N'Altering [dbo].[UI_Indicators]...';

GO
ALTER TABLE [dbo].[UI_Indicators]
    ADD [OptimizedBinding_Id] BIGINT NULL;

GO
ALTER TABLE [dbo].[UI_Indicators]
ADD CONSTRAINT "FK_Indicators_OptimizedBinding" FOREIGN KEY ("OptimizedBinding_Id") REFERENCES "UM_Bindings" ("Id");

GO
PRINT N'Altering [dbo].[UI_TileItems]...';

GO
ALTER TABLE [dbo].[UI_TileItems]
    ADD [OptimizedBinding_Id] BIGINT NULL;

GO
ALTER TABLE [dbo].[UI_TileItems]
ADD CONSTRAINT "FK_TileItems_OptimizedBinding" FOREIGN KEY ("OptimizedBinding_Id") REFERENCES "UM_Bindings" ("Id");


ALTER TABLE [dbo].[UP_AssignedResourceTypes] ADD [RequestComment] NVARCHAR (442) NULL;
ALTER TABLE [dbo].[UP_AssignedCompositeRoles] ADD [RequestComment] NVARCHAR (442) NULL;
ALTER TABLE [dbo].[UP_AssignedSingleRoles] ADD [RequestComment] NVARCHAR (442) NULL;
GO
