/* Search Connection if is only present in the fulfillment */
CREATE TABLE tmp_packagesfulfills(tasktype INT null, connectorid BIGINT null, resourcetypeid BIGINT null, packageid BIGINT null, connectionidentifier NVARCHAR(442) null, main bit null);

/* Insert Fulfill Database and Manual Connection in the tmp table */
INSERT INTO tmp_packagesfulfills(tasktype,connectorid,resourcetypeid,packageid,connectionidentifier,main)
SELECT distinct TaskType,Connector_Id,ResourceType_Id,CASE TaskType WHEN 6 THEN -36 ELSE -6 END,CASE TaskType WHEN 6 THEN Identifier+'Database' ELSE Identifier+'Manual' END,1 FROM (
SELECT distinct t.TaskType,etm.Connector_Id,c.Identifier,trt.ResourceType_Id
FROM UJ_Tasks t 
JOIN UJ_TaskResourceTypes trt on trt.Task_Id=t.Id
JOIN UP_ResourceTypes rt ON rt.id=trt.ResourceType_Id
JOIN UC_EntityTypeMappings etm ON etm.id=rt.TargetEntityType_Id
JOIN UC_Connectors c ON c.id=etm.Connector_Id
where TaskType in(6,17)
UNION ALL 
SELECT DISTINCT t.TaskType,c.id,c.Identifier,rt.id
FROM UJ_Tasks t
JOIN UC_Connectors c ON c.id=t.Connector_Id
JOIN UC_EntityTypeMappings etm ON etm.Connector_Id=c.id
JOIN UP_ResourceTypes rt ON rt.TargetEntityType_Id=etm.id
WHERE TaskType in(6,17)) x
Where x.ResourceType_Id NOT IN (
SELECT trt.ResourceType_Id
FROM UJ_Tasks t
JOIN UJ_TaskResourceTypes trt on trt.Task_Id=t.Id
WHERE t.TaskType IN (14,15,16,18,45,60,61,62,64,28,65)
UNION ALL 
SELECT rt.id
FROM UJ_Tasks t
JOIN UC_Connectors c ON c.id=t.Connector_Id
JOIN UC_EntityTypeMappings etm ON etm.Connector_Id=c.id
JOIN UP_ResourceTypes rt ON rt.TargetEntityType_Id=etm.id
WHERE t.TaskType IN (14,15,16,18,45,60,61,62,64,28,65)
);

/* Insert Fulfill Worklfow and Powershell Connection in the tmp table */
INSERT INTO tmp_packagesfulfills(tasktype,connectorid,resourcetypeid,packageid,connectionidentifier,main)
SELECT distinct TaskType,Connector_Id,ResourceType_Id,CASE TaskType WHEN 18 THEN -17 ELSE -7 END,InformationSystemIdentifier,1
FROM (
SELECT distinct t.TaskType,etm.Connector_Id,t.InformationSystemIdentifier,trt.ResourceType_Id
FROM UJ_Tasks t 
JOIN UJ_TaskResourceTypes trt on trt.Task_Id=t.Id
JOIN UP_ResourceTypes rt ON rt.id=trt.ResourceType_Id
JOIN UC_EntityTypeMappings etm ON etm.id=rt.TargetEntityType_Id
JOIN UC_Connectors c ON c.id=etm.Connector_Id
where TaskType in (18,46)
UNION ALL 
SELECT DISTINCT t.TaskType,c.id,t.InformationSystemIdentifier,rt.id
FROM UJ_Tasks t
JOIN UC_Connectors c ON c.id=t.Connector_Id
JOIN UC_EntityTypeMappings etm ON etm.Connector_Id=c.id
JOIN UP_ResourceTypes rt ON rt.TargetEntityType_Id=etm.id
WHERE TaskType in (18,46)) x
WHere x.InformationSystemIdentifier is not null;

/* Insert Fulfill LDAP and AD in the tmp table*/
INSERT INTO tmp_packagesfulfills(tasktype,connectorid,resourcetypeid,packageid,connectionidentifier,main)
SELECT distinct TaskType,Connector_Id,ResourceType_Id,Id,InformationSystemIdentifier,1
FROM (
SELECT distinct t.TaskType,etm.Connector_Id,t.InformationSystemIdentifier,trt.ResourceType_Id,cp.id
FROM UJ_Tasks t 
JOIN UJ_TaskResourceTypes trt on trt.Task_Id=t.Id
JOIN UP_ResourceTypes rt ON rt.id=trt.ResourceType_Id
JOIN UC_EntityTypeMappings etm ON etm.id=rt.TargetEntityType_Id
JOIN tmp_packagesdatasources p ON p.datasource=etm.DataSource
JOIN UC_ConnectionPackages cp ON cp.Identifier=p.package collate SQL_Latin1_General_CP1_CS_AS
JOIN UC_Connectors c ON c.id=etm.Connector_Id
where TaskType=16
UNION ALL 
SELECT DISTINCT t.TaskType,c.id,t.InformationSystemIdentifier,rt.id,cp.id
FROM UJ_Tasks t
JOIN UC_Connectors c ON c.id=t.Connector_Id
JOIN UC_EntityTypeMappings etm ON etm.Connector_Id=c.id
JOIN tmp_packagesdatasources p ON p.datasource=etm.DataSource
JOIN UC_ConnectionPackages cp ON cp.Identifier=p.package collate SQL_Latin1_General_CP1_CS_AS
JOIN UP_ResourceTypes rt ON rt.TargetEntityType_Id=etm.id
WHERE TaskType=16) x;

/* InsertMissing Connection for powershell and internalWorkflow*/
CREATE TABLE tmp_packagesInputPathWorkflowPowershell(packageid BIGINT null, filePath NVARCHAR(442) null, connectionIdentifier NVARCHAR(442));

INSERT INTO tmp_packagesInputPathWorkflowPowershell(packageid,filePath,connectionIdentifier)
SELECT DISTINCT CASE TaskType WHEN 18 THEN -17 ELSE -7 END,t.InputPath,min(t.Identifier)
FROM UJ_Tasks t
LEFT JOIN tmp_packagesPowershellWorkflow tmp ON tmp.connection=t.ConnectionIdentifier collate SQL_Latin1_General_CP1_CS_AS
WHERE t.TaskType IN (18,46) AND tmp.connection IS NULL 
GROUP BY t.TaskType,t.InputPath,t.Identifier;

UPDATE t
SET t.connectionIdentifier=tmp.connectionIdentifier
FROM UJ_Tasks t
JOIN tmp_packagesInputPathWorkflowPowershell tmp ON tmp.filePath=t.InputPath;

INSERT INTO tmp_packagesfulfills(tasktype,connectorid,resourcetypeid,packageid,connectionidentifier,main)
SELECT distinct TaskType,Connector_Id,ResourceType_Id,CASE TaskType WHEN 18 THEN -17 ELSE -7 END,ConnectionIdentifier,1
FROM (
SELECT distinct t.TaskType,etm.Connector_Id,t.ConnectionIdentifier,trt.ResourceType_Id
FROM UJ_Tasks t 
JOIN UJ_TaskResourceTypes trt on trt.Task_Id=t.Id
JOIN UP_ResourceTypes rt ON rt.id=trt.ResourceType_Id
JOIN UC_EntityTypeMappings etm ON etm.id=rt.TargetEntityType_Id
JOIN UC_Connectors c ON c.id=etm.Connector_Id
where TaskType in (18,46) AND t.InputPath IS NOT NULL
UNION ALL 
SELECT DISTINCT t.TaskType,c.id,t.ConnectionIdentifier,rt.id
FROM UJ_Tasks t
JOIN UC_Connectors c ON c.id=t.Connector_Id
JOIN UC_EntityTypeMappings etm ON etm.Connector_Id=c.id
JOIN UP_ResourceTypes rt ON rt.TargetEntityType_Id=etm.id
WHERE TaskType in (18,46) AND t.InputPath IS NOT NULL) x
WHere x.ConnectionIdentifier IS NOT NULL;
GO

update tmp_packagesfulfills set connectionidentifier=replace(connectionidentifier,'_','') where connectionidentifier is not null;
GO

/* Add secondary fulfills for FFInternalResource instead of FFInternalWorkflow with for resource types used by both fulfill */
INSERT INTO tmp_packagesfulfills(tasktype,connectorid,resourcetypeid,packageid,connectionidentifier,main)
SELECT distinct TaskType,Connector_Id,ResourceType_Id,-36,Identifier+'Database',0 FROM (
SELECT distinct t.TaskType,etm.Connector_Id,c.Identifier,trt.ResourceType_Id
FROM UJ_Tasks t 
JOIN UJ_TaskResourceTypes trt on trt.Task_Id=t.Id
JOIN UP_ResourceTypes rt ON rt.id=trt.ResourceType_Id
JOIN UC_EntityTypeMappings etm ON etm.id=rt.TargetEntityType_Id
JOIN UC_Connectors c ON c.id=etm.Connector_Id
where TaskType in(6)
UNION ALL 
SELECT DISTINCT t.TaskType,c.id,c.Identifier,rt.id
FROM UJ_Tasks t
JOIN UC_Connectors c ON c.id=t.Connector_Id
JOIN UC_EntityTypeMappings etm ON etm.Connector_Id=c.id
JOIN UP_ResourceTypes rt ON rt.TargetEntityType_Id=etm.id
WHERE TaskType in(6)) x
Where x.ResourceType_Id IN (
SELECT trt.ResourceType_Id
FROM UJ_Tasks t
JOIN UJ_TaskResourceTypes trt on trt.Task_Id=t.Id
WHERE t.TaskType IN (18)
UNION ALL 
SELECT rt.id
FROM UJ_Tasks t
JOIN UC_Connectors c ON c.id=t.Connector_Id
JOIN UC_EntityTypeMappings etm ON etm.Connector_Id=c.id
JOIN UP_ResourceTypes rt ON rt.TargetEntityType_Id=etm.id
WHERE t.TaskType IN (18)
);

GO

/* Insert fulfill Connection */
INSERT INTO UC_Connections(id,Connector_Id,Package_Id,Identifier,DisplayName_L1)
(SELECT 1+ROW_NUMBER() OVER(ORDER BY connectionidentifier ASC),connectorid,packageid,connectionidentifier,connectionidentifier
from
(SELECT distinct connectorid, packageid, connectionidentifier
FROM tmp_packagesfulfills) aa);
GO

/* Insert Missing ResourceTypeMapping */
INSERT INTO UC_ResourceTypeMappings(id,Connection_Id)
SELECT distinct resourcetypeid,min(c.id)
FROM tmp_packagesfulfills t
LEFT JOIN UC_ResourceTypeMappings rtm ON rtm.id=t.resourcetypeid
JOIN UC_Connections c ON c.Identifier=t.connectionidentifier collate SQL_Latin1_General_CP1_CS_AS
WHERE rtm.Id is null and t.main=1
group by resourcetypeid;

/* update connection for resourceTypeMapping */
Update rtm
SET Connection_id=cn.id
FROM UC_ResourceTypeMappings rtm
JOIN tmp_packagesfulfills pf on pf.resourcetypeid=rtm.id and pf.main=1
JOIN UC_Connections cn on cn.Connector_Id=pf.connectorid AND cn.Identifier=pf.connectionidentifier collate SQL_Latin1_General_CP1_CS_AS;

/* Update the connectionIdentifier for workflow or powershell Task if the connection is found in appsettings.agent.json*/
UPDATE t
SET t.ConnectionIdentifier = tmp.connection
FROM UJ_Tasks t
JOIN tmp_packagesPowershellWorkflow tmp ON t.InputPath=tmp.filePath
WHERE TaskType IN (18,46) AND InputPath IS NOT NULL;

/* Migrate fulfill task types while taking forced fulfill type into account */
UPDATE t SET "tasktype"=82, ConnectionIdentifier=pf.connectionidentifier,Connector_Id=null
FROM "uj_tasks" t
join tmp_packagesfulfills pf on pf.connectorid=t.Connector_Id and pf.tasktype=t.TaskType and pf.main=1
WHERE t."tasktype"=6 and t.InformationSystemIdentifier is null and t.Connector_Id is not null
and exists (select rtm.id from UC_ResourceTypeMappings rtm join UC_Connections rtmc on rtmc.id=rtm.Connection_Id and rtmc.Connector_Id=t.Connector_Id and rtmc.Package_Id!=-36)
;

/* Migrate fulfill task types while taking forced fulfill type into account on the task resource type */
UPDATE t SET "tasktype"=82, ConnectionIdentifier=pf.connectionidentifier,Connector_Id=null
FROM "uj_tasks" t
join UJ_TaskResourceTypes trt on trt.Task_Id=t.id
join  UC_ResourceTypeMappings rtm on rtm.id=trt.ResourceType_Id
join  UC_Connections rtmc on rtmc.id=rtm.Connection_Id
join tmp_packagesfulfills pf on pf.connectorid=rtmc.Connector_Id and pf.tasktype=t.TaskType and pf.main=1
WHERE t."tasktype"=6 and t.InformationSystemIdentifier is null and t.Connector_Id is null
and exists (select rtmc2.id from UC_Connections rtmc2 where rtmc2.id=rtmc.Id and rtmc2.Package_Id!=-36)
;

/* Migrate fulfill task types */
UPDATE "uj_tasks" SET "tasktype"=82 WHERE "tasktype" in (6,14,15,16,17,18,46,60,61,62,64,28,65);

/* Migrate export task types */
UPDATE "uj_tasks" SET "tasktype"=81 WHERE "tasktype" in (30,31,32,33,34,35,37,38,39,50,70,71,72,73);
GO

/* Create a table with all the connection tables.
We add those from the json and then add all the implicit CSV connections.
*/

/* copy those from the json InformationSystems */
select *,'json' j, 0 connector_id into tmp_fullconnectionsdatasources from tmp_connectionsdatasources;
select *,'json' j, 0 connector_id into tmp_fullpackagesdatasources from tmp_packagesdatasources;

/* the connections from the json are used by only one connector => we can get the id from the mappings */
update t
set connector_id=etm.Connector_Id
from tmp_fullconnectionsdatasources t
join UC_EntityTypeMappings etm on etm.DataSource=t.datasource;

update t
set connector_id=eam.Connector_Id
from tmp_fullconnectionsdatasources t
join UC_EntityAssociationMappings eam on eam.DataSource=t.datasource;

update t
set connector_id=etm.Connector_Id
from tmp_fullpackagesdatasources t
join UC_EntityTypeMappings etm on etm.DataSource=t.datasource;

update t
set connector_id=eam.Connector_Id
from tmp_fullpackagesdatasources t
join UC_EntityAssociationMappings eam on eam.DataSource=t.datasource;

delete from tmp_fullconnectionsdatasources where connector_id=0;
delete from tmp_fullpackagesdatasources where connector_id=0;


/* deduce all the missing ones are CSV.
We create one connection per connector and CSV file.
We have some files shared by several mappings in the same connector
and unfortunatelly some files shared between different connectors
(and thus that need 2 connections)
*/
/* First for the EntityTypes, as if they have common files with an association we use their identifier and not the association's one for the connection.*/
insert into tmp_fullconnectionsdatasources(connection,connectiontable,datasource,j,connector_id)
select min(REPLACE(ma.identifier, '_', '')),min(REPLACE(ma.identifier, '_', '')),ds.DataSource,'csv', ma.connector_id
from (
    select datasource from (
        select distinct etm.DataSource, etm.Connector_Id
        from UC_EntityTypeMappings etm
        join UM_EntityTypes et on et.id=etm.id
        where etm.DataSource not in (select datasource from tmp_connectionsdatasources)
    ) bb
    group by DataSource
    having count(*)=1
) ds
join (
    select et.Identifier identifier, et.Identifier display,etm.DataSource datasource,c.id connector_id
    from UC_EntityTypeMappings etm
    join UM_EntityTypes et on et.id=etm.id
    join UC_Connectors c on c.id=etm.Connector_Id
) ma
ON ma.datasource=ds.DataSource
group by ds.DataSource, ma.connector_id;

/* Then the EntityAssociations for connections that are not used for EntityTypes: these are excluded by the "not in (select datasource from tmp_fullconnectionsdatasources)" */
insert into tmp_fullconnectionsdatasources(connection,connectiontable,datasource,j,connector_id)
select min(REPLACE(ma.identifier, '_', '')),min(REPLACE(ma.identifier, '_', '')),ds.DataSource,'csv', ma.connector_id
from (
    select datasource from (
        select distinct etm.DataSource, etm.Connector_Id
        from UC_EntityassociationMappings etm
        join UM_EntityAssociations et on et.id=etm.id
        where etm.DataSource not in (select datasource from tmp_connectionsdatasources union select datasource from tmp_fullconnectionsdatasources)
    ) bb
    group by DataSource
    having count(*)=1
) ds
join (
    select et.Identifier identifier, et.Identifier display,etm.DataSource datasource,c.id connector_id
    from UC_EntityassociationMappings etm
    join UM_EntityAssociations et on et.id=etm.id
    join UC_Connectors c on c.id=etm.Connector_Id
) ma
ON ma.datasource=ds.DataSource
group by ds.DataSource, ma.connector_id;

--We compute the csv package with the prepareSynchro
insert into tmp_fullpackagesdatasources(package, datasource,j,connector_id)
select distinct 'Usercube.CSV.Complete@0000001', f.datasource, 'csv', f.connector_id
from tmp_fullconnectionsdatasources f
JOIN UJ_Tasks t ON t.Connector_Id=f.Connector_Id and TaskType=4 and Mode=1
where f.datasource not in (select datasource from tmp_fullpackagesdatasources)

insert into tmp_fullpackagesdatasources(package, datasource,j,connector_id)
select distinct 'Usercube.CSV@0000001', f.datasource, 'csv', f.connector_id
from tmp_fullconnectionsdatasources f
JOIN UJ_Tasks t ON t.Connector_Id=f.Connector_Id and (TaskType = 12 or (TaskType=4 and Mode=2))
where f.datasource not in (select datasource from tmp_fullpackagesdatasources)

/*TODO manual connections? */

GO

/* Add the connections.
*/
DECLARE @Connections INT;
SELECT @Connections = COUNT(*)+1 FROM UC_Connections;

insert into UC_Connections(id,Identifier,DisplayName_L1,Connector_Id,Package_Id)
select @Connections+ROW_NUMBER() OVER(ORDER BY aa.identifier ASC), aa.* from (
select distinct cd.connection identifier, cd.connection dn, etm.Connector_Id conid, cp.id cpid
from tmp_fullconnectionsdatasources cd
join tmp_fullpackagesdatasources pd on cd.datasource=pd.datasource
join UC_ConnectionPackages cp on cp.Identifier=pd.package collate SQL_Latin1_General_CP1_CS_AS
join UC_EntityTypeMappings etm on etm.DataSource=cd.datasource and etm.Connector_Id=cd.connector_id
union
select distinct cd.connection identifier, cd.connection dn, etm.Connector_Id conid, cp.id cpid
from tmp_fullconnectionsdatasources cd
join tmp_fullpackagesdatasources pd on cd.datasource=pd.datasource
join UC_ConnectionPackages cp on cp.Identifier=pd.package collate SQL_Latin1_General_CP1_CS_AS
join UC_EntityassociationMappings etm on etm.DataSource=cd.datasource and etm.Connector_Id=cd.connector_id
) aa;
GO

/* Set tables from the EntityTypeMappings */
update etm
set ConnectionTable=cd.connectiontable
from UC_EntityTypeMappings etm
join tmp_fullconnectionsdatasources cd on cd.datasource=etm.DataSource and etm.Connector_Id=cd.connector_id;
GO

/* Set tables from the EntityAssociationMappings */
update etm
set ConnectionTable=cd.connectiontable
from UC_EntityassociationMappings etm
join tmp_fullconnectionsdatasources cd on cd.datasource=etm.DataSource and etm.Connector_Id=cd.connector_id;
GO

/* Set tables from the ResourceTypeMappings */
update rtm
set Connection_id=cn.id
from UC_ResourceTypeMappings rtm
join tmp_fullconnectionsdatasources cd on cd.connection=rtm.InformationSystemIdentifier
join UC_Connections cn on cn.Connector_Id=cd.connector_id and cn.Identifier=cd.connection collate SQL_Latin1_General_CP1_CS_AS
where rtm.InformationSystemIdentifier is not null AND rtm.Connection_id is null;

insert into UC_ResourceTypeMappings(id,RDNAttributeIdentifier) select id,'missing' from UP_ResourceTypes where id not in (select id from UC_ResourceTypeMappings);

update rtm
set Connection_id=cn.id
from UC_ResourceTypeMappings rtm
join UP_ResourceTypes rt on rt.id=rtm.Id
join UC_EntityTypeMappings etm on etm.id=rt.TargetEntityType_Id
join tmp_fullconnectionsdatasources cd on cd.datasource=etm.DataSource and etm.Connector_Id=cd.connector_id
join UC_Connections cn on cn.Connector_Id=cd.connector_id and cn.Identifier=cd.connection collate SQL_Latin1_General_CP1_CS_AS
where rtm.Connection_id is null;

update rtm
set connection_id=cn.id
from "uc_resourcetypemappings" rtm
JOIN "uj_taskresourcetypes" trt on trt."resourcetype_id" = rtm."id" 
JOIN "uj_tasks" t on t."id"=trt."task_id" and t."tasktype"=82 and t.InformationSystemIdentifier is not null
join tmp_fullconnectionsdatasources cd on cd.connection=rtm.InformationSystemIdentifier
join UC_Connections cn on cn.Connector_Id=cd.connector_id and cn.Identifier=cd.connection collate SQL_Latin1_General_CP1_CS_AS
where rtm.Connection_id is null;

delete from UC_ResourceTypeMappings
where connection_id is null;

update UC_ResourceTypeMappings set RDNAttributeIdentifier=null where RDNAttributeIdentifier='missing';

GO

/* Fetch the format from the appSettings.agent.json */
insert into UC_EntityPropertyMappings(id,Format)
select ep.id,fd.format
from UM_EntityProperties ep
join UM_EntityAssociations ea on ea.Property1_Id=ep.id or ea.Property2_Id=ep.id
join UC_EntityAssociationMappings eam on eam.id=ea.id
join tmp_formatdatasources fd on fd.attribute=(case when ea.Property2_Id=ep.id then eam.Column1 else eam.Column2 end) and fd.datasource=eam.DataSource
where
not exists(select id from UC_EntityPropertyMappings where id=ep.id);

update epm
set format=fd.format
from UC_EntityPropertyMappings epm
join UM_EntityProperties ep on ep.id=epm.id
join UC_EntityTypeMappings etm on etm.id=ep.EntityType_Id
join tmp_formatdatasources fd on fd.datasource=etm.DataSource and fd.attribute=epm.DataSourceColumnName;
GO

/* Figure out all the distinct password reset settings */
insert into UC_PasswordResetSettings(id,Identifier,mode,MustChange,AutoGenerate, DisableNotifications, GeneratedLength, NotifiedFullNameBinding_Id, NotifiedEmailBinding_Id, BeneficiaryFullNameBinding_Id, BeneficiaryEmailBinding_Id,DefaultPassword, StrengthCheck, NotificationCC)
select 1+ROW_NUMBER() OVER(ORDER BY aa.identifier ASC), aa.* from (
select distinct min(rt.identifier) identifier, pwrmode,pwrMustChange,pwrAutoGenerate, pwrDisableNotifications, pwrGeneratedLength, pwrNotifiedFullNameBinding_Id, pwrNotifiedEmailBinding_Id, pwrBeneficiaryFullNameBinding_Id, pwrBeneficiaryEmailBinding_Id,pwrDefaultPassword, pwrStrengthCheck, pwrNotificationCC
from UC_ResourceTypeMappings rtm
join up_resourcetypes rt on rt.id=rtm.id
where (pwrBeneficiaryEmailBinding_Id is not null or PWRAutoGenerate=1)
group by pwrmode,pwrMustChange,pwrAutoGenerate, pwrDisableNotifications, pwrGeneratedLength, pwrNotifiedFullNameBinding_Id, pwrNotifiedEmailBinding_Id, pwrBeneficiaryFullNameBinding_Id, pwrBeneficiaryEmailBinding_Id,pwrDefaultPassword, pwrStrengthCheck, pwrNotificationCC
) aa;

update rtm
set passwordresetsetting_id=pwr.id
from UC_ResourceTypeMappings rtm
join UC_PasswordResetSettings pwr
on pwr.mode=rtm.pwrmode
AND pwr.mustchange=rtm.pwrMustChange
AND pwr.autogenerate=rtm.pwrAutoGenerate
AND pwr.DisableNotifications=rtm.pwrDisableNotifications
AND pwr.GeneratedLength=rtm.pwrGeneratedLength
AND (coalesce(pwr.NotifiedFullNameBinding_Id, '')=coalesce(rtm.pwrNotifiedFullNameBinding_Id, ''))
AND (coalesce(pwr.NotifiedEmailBinding_Id, '')=coalesce(rtm. pwrNotifiedEmailBinding_Id, ''))
AND (coalesce(pwr.BeneficiaryFullNameBinding_Id, '')=coalesce(rtm. pwrBeneficiaryFullNameBinding_Id, ''))
AND (coalesce(pwr.BeneficiaryEmailBinding_Id, '')=coalesce(rtm. pwrBeneficiaryEmailBinding_Id, ''))
AND (coalesce(pwr.DefaultPassword, '')=coalesce(rtm.pwrDefaultPassword, ''))
AND (coalesce(pwr.StrengthCheck, '')=coalesce(rtm.pwrStrengthCheck, ''))
AND (coalesce(pwr.NotificationCC, '')=coalesce(rtm.pwrNotificationCC, ''));
GO

alter table UC_ResourceTypeMappings add [C0]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C1]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add [C2]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C3]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C4]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C5]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C6]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C7]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C8]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C9]                      NVARCHAR (442) NULL;
alter table UC_ResourceTypeMappings add     [C10]                     NVARCHAR (442) NULL;
GO

update UC_ResourceTypeMappings set C0=DefaultObjectClass where DefaultObjectClass is not null;
update UC_ResourceTypeMappings set C1=RDNAttributeIdentifier where RDNAttributeIdentifier is not null;
update UC_ResourceTypeMappings set C2=case when UsePermissiveModify=1 then 'true' else 'false' end where UsePermissiveModify is not null;
update UC_ResourceTypeMappings set C3=case when UseTreeDelete=1 then 'true' else 'false' end where UseTreeDelete is not null;
update UC_ResourceTypeMappings set C4='MicrosoftInvitation' where InvitationMode='1';
update UC_ResourceTypeMappings set C5=InvitationRedirectUrl where InvitationRedirectUrl is not null;
update UC_ResourceTypeMappings set C8=case when TicketImpact=3 then 'Low'when TicketImpact=2 then 'Medium' else 'High' end where TicketImpact is not null;
update UC_ResourceTypeMappings set C9=case when TicketUrgency=3 then 'Low'when TicketUrgency=2 then 'Medium' else 'High' end where TicketUrgency is not null;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C2)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, 'true' c2
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id  and ep.id=rc.RDNProperty_Id
) aa;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C0)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.rt, ep.id, aa.c0 from UM_EntityProperties ep,
(select rc.id rt, ep.id p, ep.Identifier, 'true' c0
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id!=rt.TargetEntityType_Id and ep.id=rc.DNProperty_Id
join UC_EntityTypeMappings etm on etm.id=ep.EntityType_Id
join tmp_fullpackagesdatasources fpds on etm.DataSource=fpds.datasource and fpds.package = 'Usercube.SCIM@0000001') aa
join UP_ResourceTypes rt on rt.id=aa.rt
where ep.Identifier = aa.Identifier and EntityType_Id=rt.TargetEntityType_Id;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C0)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, 'true' c0
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id  and ep.id=rc.DNProperty_Id
) aa;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C1)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, 'true' c1
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id  and ep.id=rc.ParentProperty_Id
) aa;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C3)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, 'true' c3
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id  and ep.id=rc.UserAccountControlProperty_Id
) aa;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C4)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, epm.DataSourceBacklinkColumnName c4
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id
join UC_EntityPropertyMappings epm on epm.id=ep.id and epm.DataSourceBacklinkColumnName is not null
) aa;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C5)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, epm.MultiValueSeparator c5
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id
join UC_EntityPropertyMappings epm on epm.id=ep.id and epm.MultiValueSeparator is not null
) aa;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C9)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, epm.IsMultiValuedProperty c9
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id
join UC_EntityPropertyMappings epm on epm.id=ep.id and epm.IsMultiValuedProperty=1
) aa;

insert into UC_ResourcePropertyMappings(id,ResourceTypeMapping_Id,Property_Id,C10)
select (select coalesce(min(id),0)-1 from UC_ResourcePropertyMappings)-ROW_NUMBER() OVER(ORDER BY aa.rt ASC), aa.* from (
select rc.id rt, ep.id p, epm.ScimSchema c10
from UC_ResourceTypeMappings rc
join UP_ResourceTypes rt on rt.id=rc.id
join UM_EntityProperties ep on ep.EntityType_Id=rt.TargetEntityType_Id
join UC_EntityPropertyMappings epm on epm.id=ep.id and epm.ScimSchema is not null
) aa;

GO

/* by default all the CSV connections are Exports only */
update c
set DeactivationExportFulfill=2
from UC_Connections c
join tmp_fullconnectionsdatasources fd on fd.connection=c.Identifier collate SQL_Latin1_General_CP1_CS_AS and fd.j='csv';

/* all the connections not involved in an export tasks are marked as Fulfill only */
update c
set DeactivationExportFulfill=1
from UC_Connections c
join tmp_fullconnectionsdatasources fd on fd.connection=c.Identifier collate SQL_Latin1_General_CP1_CS_AS and fd.connector_id=c.Connector_Id
join UC_EntityTypeMappings etm1 on etm1.Connector_Id=c.Connector_Id and etm1.ConnectionTable=fd.connectiontable
where c.DeactivationExportFulfill=0
and etm1.id not in (
select etm.id
from UJ_Tasks t 
join UC_EntityTypeMappings etm on etm.Connector_Id=t.Connector_Id
where t.TaskType=81 and t.InformationSystemIdentifier is null
union
select etm.id
from UJ_Tasks t 
join tmp_fullconnectionsdatasources cd on cd.connection=t.InformationSystemIdentifier
join UC_EntityTypeMappings etm on etm.Connector_Id=cd.connector_id and etm.ConnectionTable=cd.connectiontable
where t.TaskType=81 and t.InformationSystemIdentifier is not null
);


GO

/*
Add export tasks in all the jobs with PrepareSync on CSV files.
*/
select * into tmp_tasks from (
select distinct cn.id connection_id, t.id preptask_id, s.Job_Id job_id
from UJ_Tasks t
join UC_EntityTypeMappings etm on etm.Connector_Id=t.Connector_Id
join UC_Connections cn on cn.connector_id=etm.Connector_Id
join UC_ConnectionPackages cp on cp.id=cn.Package_Id and (cp.Identifier='Usercube.CSV.Complete@0000001' or cp.Identifier='Usercube.CSV@0000001')
join UJ_JobSteps s on s.Task_Id=t.id
where t.TaskType in (4,12)
union
select distinct cn.id, t.id, s.Job_Id
from UJ_Tasks t
join tmp_fullconnectionsdatasources cd on cd.connection=t.InformationSystemIdentifier
join UC_Connections cn on cn.Connector_Id=cd.connector_id and cn.Identifier=cd.connection collate SQL_Latin1_General_CP1_CS_AS
join UC_ConnectionPackages cp on cp.id=cn.Package_Id and (cp.Identifier='Usercube.CSV.Complete@0000001' or cp.Identifier='Usercube.CSV@0000001')
join UJ_JobSteps s on s.Task_Id=t.id
where t.TaskType in (4,12)
) aa;
GO

DECLARE @ID BIGINT;
SELECT @ID=coalesce(MIN(id),0)-1 FROM uj_tasks;

insert into uj_tasks(id,ConnectionIdentifier,TaskType,Identifier,DisplayName_L1,Dirty,BlockProvisioning,DoNotDeleteChanges,IgnoreHistorization,AllEntityType,"Check",SessionOff, IgnoreCookieFile,agent_id,OpenIdClient_Id)
select @ID-ROW_NUMBER() OVER(ORDER BY aa.ConnectionIdentifier ASC), aa.* from (
select distinct c.identifier ConnectionIdentifier, 81 tasktype, CONCAT(j.identifier,'_',c.Identifier) Identifier,  CONCAT('CSV - Export ',c.DisplayName_L1) DisplayName_L1,0 Dirty,0 BlockProvisioning,0 DoNotDeleteChanges,0 IgnoreHistorization,0 AllEntityType,0 "Check",0 SessionOff, 1 IgnoreCookieFile, co.agent_id, (select min(id) from UA_OpenIdClients) oid
from tmp_tasks tt
join uc_connections c on tt.connection_id=c.id
join uc_connectors co on co.id=c.connector_id
join UJ_JobSteps js on js.Task_Id=tt.preptask_id
join uj_jobs j on j.id=js.Job_Id
) aa;

insert into UJ_JobSteps(id,Task_Id,Job_Id,LaunchOrder,[Level])
select (select coalesce(min(id),0)-1 from UJ_JobSteps)-ROW_NUMBER() OVER(ORDER BY aa.task_id ASC), aa.* from (
select distinct t.id task_id,tt.job_id Job_Id,0 LaunchOrder,-1 [Level]
from tmp_tasks tt
join uc_connections c on tt.connection_id=c.id
join UJ_Tasks t on t.ConnectionIdentifier=c.Identifier and t.tasktype=81
JOIN UJ_Jobs j ON j.id=tt.job_id and t.Identifier like j.Identifier+'%'
) aa;

insert into UJ_TaskDependOnTasks(id,ChildTask_Id,ParentTask_Id)
select (select coalesce(min(id),0)-1 from UJ_TaskDependOnTasks)-ROW_NUMBER() OVER(ORDER BY aa.task_id ASC), aa.* from (
select distinct t.id task_id,tt.preptask_id preptask_id
from tmp_tasks tt
join uc_connections c on tt.connection_id=c.id
join UJ_Tasks t on t.ConnectionIdentifier=c.Identifier and t.tasktype=81
) aa;

GO

update t
set connectionidentifier=f.Identifier
from UJ_Tasks t
join UC_Connections f on f.Identifier=replace( t.InformationSystemIdentifier,'_','') collate SQL_Latin1_General_CP1_CI_AS
where t.InformationSystemIdentifier is not null;

GO

/* remove tmp tables */
drop table tmp_connectionsdatasources;
drop table  tmp_packagesdatasources;
drop table tmp_fullconnectionsdatasources;
drop table  tmp_fullpackagesdatasources;
drop table tmp_tasks;
drop table tmp_packagesfulfills;
drop table tmp_packagesPowershellWorkflow;
drop table tmp_formatdatasources;
GO

/* Remove Option type */
Merge into UC_EntityPropertyMappings as epm
using (select id from UM_EntityProperties where type=11) as ep
on epm.Id = ep.Id
when matched and epm.Format is null then
update set format='concat:' + multivalueseparator
when not matched by target then
insert (Id, Format) values (ep.Id,'concat:');
GO
update UM_EntityProperties set type=12 where type=11;
GO


