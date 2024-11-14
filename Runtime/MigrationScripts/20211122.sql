ALTER TABLE UC_ResourceTypeMappings
ADD Type INT DEFAULT ((0)) NOT NULL;
GO

--LDAP ResourceTypeMapping
update UC_ResourceTypeMappings set type = 2 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id in (-1, -2, -27, -26, -25, -4))

--AzureAD ResourceTypeMapping
update UC_ResourceTypeMappings set type = 1 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id = -3)

--Manual ResourceTypeMapping
update UC_ResourceTypeMappings set type = 3 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id = -6)

--SAP ResourceTypeMapping
update UC_ResourceTypeMappings set type = 4 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id = -11)

--SCIM ResourceTypeMapping
update UC_ResourceTypeMappings set type = 5 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id in (-8, -34 - 33))

--ServiceNow ResourceTypeMapping
update UC_ResourceTypeMappings set type = 6 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id in (-5, -19))

--SharePoint ResourceTypeMapping
update UC_ResourceTypeMappings set type = 7 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id in (-18))

--Workday ResourceTypeMapping
update UC_ResourceTypeMappings set type = 8 where id in (
    select rtm.Id
from UC_ResourceTypeMappings rtm
JOIN UC_Connections c on c.id = rtm.Connection_Id
JOIN UC_ConnectionPackages cp on cp.id = c.Package_Id
where cp.Id in (-12))

UPDATE t
SET IgnoreCookieFile = 1
FROM UJ_Tasks t
JOIN UC_Connections c ON t.ConnectionIdentifier = c.Identifier
WHERE c.Package521_Id = -24;
GO
