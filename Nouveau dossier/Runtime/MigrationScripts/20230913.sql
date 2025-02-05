
declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_ResourceTypeMappings_Type'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='Type'
where dc.parent_object_id=OBJECT_ID('dbo.UC_ResourceTypeMappings');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_ConfigurationFileItems_Scaffolding'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='Scaffolding_Id'
where dc.parent_object_id=OBJECT_ID('dbo.UD_ConfigurationFileItems');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_ConfigurationFileItems_LineNumber'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='LineNumber'
where dc.parent_object_id=OBJECT_ID('dbo.UD_ConfigurationFileItems');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_ConfigurationFileItems_ConsolidationMode'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='ConsolidationMode'
where dc.parent_object_id=OBJECT_ID('dbo.UD_ConfigurationFileItems');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_ConfigurationFileItems_IsManualUpdate'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='IsManualUpdate'
where dc.parent_object_id=OBJECT_ID('dbo.UD_ConfigurationFileItems');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_DisplayEntityTypes_Priority'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='Priority'
where dc.parent_object_id=OBJECT_ID('dbo.UI_DisplayEntityTypes');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_CompositeRoleRules_BaseRule'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='BaseRule_Id'
where dc.parent_object_id=OBJECT_ID('dbo.UP_CompositeRoleRules');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_SingleRoleRules_BaseRule'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='BaseRule_Id'
where dc.parent_object_id=OBJECT_ID('dbo.UP_SingleRoleRules');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_ResourceTypeRules_BaseRule'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='BaseRule_Id'
where dc.parent_object_id=OBJECT_ID('dbo.UP_ResourceTypeRules');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_ResourceCorrelationRules_BaseRule'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='BaseRule_Id'
where dc.parent_object_id=OBJECT_ID('dbo.UP_ResourceCorrelationRules');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''DF_Policies_ProlongationWithoutApproval'', ''Object''' from sys.default_constraints dc
join sys.all_columns c on c.column_id=dc.parent_column_id and c.object_id=dc.parent_object_id and c.name='ProlongationWithoutApproval'
where dc.parent_object_id=OBJECT_ID('dbo.UP_Policies');
exec sp_executesql @script
GO

declare @script nvarchar(512)
select @script='exec sp_rename ''' + dc.name + ''', ''PK_HomonymEntityLinkFilters'', ''Object'''
from sys.objects dc
where dc.parent_object_id=OBJECT_ID('dbo.UW_HomonymEntityLinkFilters') and dc.type='PK'
exec sp_executesql @script
GO

