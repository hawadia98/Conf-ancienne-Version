/* Increase sequences to avoid PrimaryKey error (corrected in commit 01d39d0b in 5.2.0) */
UPDATE UM_Sequences
SET Value=Value+10;
GO

/* Update all the sequences of the objects inserted during the migration */
delete s
from UM_Sequences s
join UM_EntityTypes et on et.id=s.id and et.Identifier in ('Connection', 'PasswordResetSetting', 'ResourcePropertyMapping', 'Task', 'JobStep', 'TaskDependOnTask');

insert into UM_Sequences(id, value)
select et.id, (select max(rid) from (values (coalesce(max(r.id), 0)),(0)) as rr(rid)) +1
from UC_Connections r
join UM_EntityTypes et on et.Identifier='Connection'
group by et.id;

insert into UM_Sequences(id, value)
select et.id, (select max(rid) from (values (coalesce(max(r.id), 0)),(0)) as rr(rid)) +1
from uc_PasswordResetSettings r
join UM_EntityTypes et on et.Identifier='PasswordResetSetting'
group by et.id;

insert into UM_Sequences(id, value)
select et.id, (select max(rid) from (values (coalesce(max(r.id), 0)),(0)) as rr(rid)) +1
from uc_ResourcePropertyMappings r
join UM_EntityTypes et on et.Identifier='ResourcePropertyMapping'
group by et.id;

insert into UM_Sequences(id, value)
select et.id, (select max(rid) from (values (coalesce(max(r.id), 0)),(0)) as rr(rid)) +1
from uj_Tasks r
join UM_EntityTypes et on et.Identifier='Task'
group by et.id;

insert into UM_Sequences(id, value)
select et.id, (select max(rid) from (values (coalesce(max(r.id), 0)),(0)) as rr(rid)) +1
from uj_JobSteps r
join UM_EntityTypes et on et.Identifier='JobStep'
group by et.id;

insert into UM_Sequences(id, value)
select et.id, (select max(rid) from (values (coalesce(max(r.id), 0)),(0)) as rr(rid)) +1
from uj_TaskDependOnTasks r
join UM_EntityTypes et on et.Identifier='TaskDependOnTask'
group by et.id;

GO

ALTER TABLE "UC_PasswordResetSettings" ADD "GeneratedLowerCaseCharsCount" INT CONSTRAINT "DF_PasswordResetSettings_GeneratedLowerCaseCharsCount" DEFAULT ((6)) NOT NULL;
ALTER TABLE "UC_PasswordResetSettings" ADD "GeneratedUpperCaseCharsCount" INT CONSTRAINT "DF_PasswordResetSettings_GeneratedUpperCaseCharsCount" DEFAULT ((2)) NOT NULL;
ALTER TABLE "UC_PasswordResetSettings" ADD "GeneratedSymbolCharsCount" INT CONSTRAINT "DF_PasswordResetSettings_GeneratedSymbolCharsCount" DEFAULT ((2)) NOT NULL;
ALTER TABLE "UC_PasswordResetSettings" ADD "GeneratedDigitCharsCount" INT CONSTRAINT "DF_PasswordResetSettingsGeneratedDigitCharsCount" DEFAULT ((2)) NOT NULL;
GO

delete ae from UA_AccessControlEntries ae join UA_AccessControlRules ar on ar.id=ae.Rule_Id and ar.Identifier like 'Administrator_ResourceTypeMapping_Migration52%';
delete from UA_AccessControlRules where Identifier like 'Administrator_ResourceTypeMapping_Migration52%';

insert into UA_AccessControlRules(id,Identifier,DisplayName_L1,EntityType_Id,Profile_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlRules)-ROW_NUMBER() OVER(ORDER BY aa.identifier ASC), aa.* from (
select distinct 'Administrator_ResourceTypeMapping_Migration52'+p.Identifier identifier,'Administrator_ResourceTypeMapping_Migration52'+p.Identifier dn,et.id etid,p.id pid
from UA_OpenIdClients oid
join UA_Profiles p on p.id=oid.Profile_Id
join UM_EntityTypes et on et.identifier='ResourceTypeMapping'
) aa;

insert into UA_AccessControlEntries(id,Permission_Id,CanExecute,Rule_Id)
select (select coalesce(min(id),0)-1 from UA_AccessControlEntries)-ROW_NUMBER() OVER(ORDER BY aa.ruleid ASC), aa.* from (
select distinct ap.id apid,1 execu,acr.id ruleid
from UA_OpenIdClients oid
join UA_Profiles p on p.id=oid.Profile_Id
join UA_AccessControlPermissions ap on ap.Identifier='/Connectors/ProvisionerResourceTypeMapping/Query'
join UA_AccessControlRules acr on acr.Identifier='Administrator_ResourceTypeMapping_Migration52'+p.Identifier
) aa;
GO

/* Remove permissions to edit Connectors */
DELETE e FROM ua_accesscontrolentries e JOIN ua_accesscontrolpermissions p ON p.id=e.permission_id AND e.canexecute=1 AND p.Identifier='/Connectors/Connector/Create';
DELETE e FROM ua_accesscontrolentries e JOIN ua_accesscontrolpermissions p ON p.id=e.permission_id AND e.canexecute=1 AND p.Identifier='/Connectors/Connector/Update';
DELETE e FROM ua_accesscontrolentries e JOIN ua_accesscontrolpermissions p ON p.id=e.permission_id AND e.canexecute=1 AND p.Identifier='/Connectors/Connector/Delete';

GO
