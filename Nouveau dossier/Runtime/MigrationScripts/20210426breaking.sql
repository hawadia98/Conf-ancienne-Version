/* renamed column for 5.2 */
EXEC sp_rename 'US_AccessCertificationCampaigns.EndDate', 'CertificationEndDate', 'COLUMN';
GO


/* optimize the certification items and adds the certification state */
/* Add IsDenied and WorkflowState column the certification items */
ALTER TABLE "US_AccessCertificationItems" ADD "OwnerType" BIGINT NULL;
ALTER TABLE "US_AccessCertificationItems" ADD "CertificationState" TINYINT NULL;
ALTER TABLE "US_AccessCertificationItems" ADD "IsDenied" BIT DEFAULT ((0)) NULL;
ALTER TABLE "US_AccessCertificationItems" ADD "WorkflowState" TINYINT DEFAULT ((0)) NULL;
GO
update "US_AccessCertificationItems" set isdenied=0,"WorkflowState"=0;
GO

update i
set i.ownertype=c.ownerentitytype_Id, certificationstate=CASE WHEN i.iscompleted = 1 THEN 4 ELSE 0 END 
from "US_AccessCertificationItems" i
join us_accesscertificationcampaigns c on c.id=i.Campaign_Id;
update i
set i.isdenied=r.isdenied, i.workflowstate=r.workflowstate
from "US_AccessCertificationItems" i
join us_accesscertificationcampaigns c on c.id=i.Campaign_Id
join up_assignedcompositeroles r on r.id=i.assignedcompositerole_id AND r."validfrom"<=c."startdate" AND r."validto">c."startdate"
where i.assignedcompositerole_id IS NOT NULL;
update i
set i.isdenied=r.isdenied, i.workflowstate=r.workflowstate
from "US_AccessCertificationItems" i
join us_accesscertificationcampaigns c on c.id=i.Campaign_Id
join up_assignedsingleroles r on r.id=i.assignedsinglerole_id AND r."validfrom"<=c."startdate" AND r."validto">c."startdate"
where i.assignedsinglerole_id IS NOT NULL;
update i
set i.isdenied=r.isdenied, i.workflowstate=r.workflowstate
from "US_AccessCertificationItems" i
join us_accesscertificationcampaigns c on c.id=i.Campaign_Id
join up_assignedresourcetypes r on r.id=i.assignedresourcetype_id AND r."validfrom"<=c."startdate" AND r."validto">c."startdate"
where i.assignedresourcetype_id IS NOT NULL;
update i
set i.isdenied=r.isdenied, i.workflowstate=r.workflowstate
from "US_AccessCertificationItems" i
join us_accesscertificationcampaigns c on c.id=i.Campaign_Id
join up_assignedresourcenavigations r on r.id=i.assignedresourcenavigation_id AND r."validfrom"<=c."startdate" AND r."validto">c."startdate"
where i.assignedresourcenavigation_id IS NOT NULL;
GO

/* cleaup old configurations with duplicated computed properties as the new UK constraint will prevent the migration */
delete from UM_EntityPropertyExpressions where id in (
select max(pe.id)
from UM_EntityPropertyExpressions pe
group by pe.Property_Id,pe.EntityType_Id
having count(*)>1
);

GO
