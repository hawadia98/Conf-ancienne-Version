
update bmin
set Performer_Id=260593
from UP_AssignedResourceBinaries bmin
join UP_AssignedResourceBinaries bmax on bmax.id=bmin.id and bmin.ValidTo<bmax.ValidTo
join (select min(validto) minvalidto, id minid from UP_AssignedResourceBinaries group by id) minn on minn.minid=bmin.id and bmin.ValidTo=minn.minvalidto
join (select max(validto) maxvalidto, id maxid from UP_AssignedResourceBinaries group by id) maxx on maxx.maxid=bmax.id and bmax.ValidTo=maxx.maxvalidto
where bmax.ValidFrom!='0001-01-01 00:00:00.00'

delete bmin
from UP_AssignedResourceBinaries bmin
join UP_AssignedResourceBinaries bmax on bmax.id=bmin.id and bmin.ValidTo<bmax.ValidTo
where bmin.Performer_Id is null and bmin.ValidTo<CURRENT_TIMESTAMP

delete bmin
from UP_AssignedResourceBinaries bmin
join UP_AssignedResourceBinaries bmax on bmax.id=bmin.id and bmin.ValidTo<bmax.ValidTo
where bmin.ValidTo<CURRENT_TIMESTAMP and bmin.ValidFrom=bmax.ValidFrom 
and bmax.ValidTo>CURRENT_TIMESTAMP

delete bmin
from UP_AssignedResourceBinaries bmin
join UP_AssignedResourceBinaries bmax on bmax.id=bmin.id and bmin.ValidTo<bmax.ValidTo
where bmin.ValidTo<CURRENT_TIMESTAMP and bmin.ValidFrom=bmax.ValidFrom 
and bmax.ValidTo=(select max(mm.validto) from UP_AssignedResourceBinaries mm where mm.id=bmax.id)

delete a
from UP_AssignedResourceBinaries a
join (select id,validfrom
from UP_AssignedResourceBinaries
where validto<CURRENT_TIMESTAMP
group by id,validfrom
having count(*)>1) b
on b.id=a.id and b.validfrom=b.validfrom
where a.validto<CURRENT_TIMESTAMP

update bmin
set Performer_Id=260593, ValidTo=bmax.ValidFrom
from UP_AssignedResourceBinaries bmin
join UP_AssignedResourceBinaries bmax on bmax.id=bmin.id and bmin.ValidTo<bmax.ValidTo
join (select min(validfrom) maxvalidfrom, id maxid from UP_AssignedResourceBinaries where Performer_Id is null or Performer_Id!=260593 group by id) maxx on maxx.maxid=bmax.id and bmax.Validfrom=maxx.maxvalidfrom
where bmax.ValidFrom!='0001-01-01 00:00:00.00'

update UP_AssignedResourceBinaries set Performer_Id=null where Performer_Id=260593

GO
