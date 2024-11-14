update s set s.Identifier = ('ConnectorMappings' + '¤' + et.Identifier + '¤' + c.Identifier)
from UD_Scaffoldings s
         JOIN UM_EntityTypes et on et.id=s.EntityType_Id
         JOIN UC_Connectors c on c.id=s.Connector_Id
where s.Generator = 22
