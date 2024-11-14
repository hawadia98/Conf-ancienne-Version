ALTER TABLE UM_Settings
ADD Type INT CONSTRAINT "DF_Settings_Type" DEFAULT((0)) NOT NULL;
GO


update UM_Settings set type = 1
where Identifier = 'MailSettings'

update UM_Settings set type = 2
where Identifier = 'ConfigurationVersion'

update UM_Settings set type = 3
where Identifier = 'AppDisplay'

update UM_Settings set type = 4
where Identifier = 'SchedulingCleanDataBase'

update UM_Settings set type = 5
where Identifier = 'SelectAllPerformedByAssociationQueryHandler'

update UM_Settings set type = 6
where Identifier = 'SelectPersonasByFilterQueryHandler'

update UM_Settings set type = 7
where Identifier = 'SelectUserByIdentityQueryHandler'

update UM_Settings set type = 8
where Identifier = 'PasswordTests'
