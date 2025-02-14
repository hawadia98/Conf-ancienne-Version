-- CreateAgentSynchroIncremental = 105
-- NotUsed = 6
update c set c."incrementaljob"=1
from "uc_connectors" c where c."identifier" COLLATE SQL_Latin1_General_CP1_CS_AS in (
select sa."connectoridentifier" from "ud_scaffoldings" sc
join "ud_scaffoldingarguments" sa on sa."scaffolding_id"=sc."id" AND sa."scaffoldingargumenttype"=6
where sc."generator"=105);
-- NoConnectorProvisioning = 5
update c set c."incrementaljob"=2
from "uc_connectors" c where c."identifier" COLLATE SQL_Latin1_General_CP1_CS_AS in (
select sa."connectoridentifier" from "ud_scaffoldings" sc
join "ud_scaffoldingarguments" sa on sa."scaffolding_id"=sc."id" AND sa."scaffoldingargumenttype"=5
where sc."generator"=105);
-- NoConnectorSynchronization = 4
update c set c."incrementaljob"=3
from "uc_connectors" c where c."identifier" COLLATE SQL_Latin1_General_CP1_CS_AS in (
select sa."connectoridentifier" from "ud_scaffoldings" sc
join "ud_scaffoldingarguments" sa on sa."scaffolding_id"=sc."id" AND sa."scaffoldingargumenttype"=4
where sc."generator"=105);
GO

-- CreateAgentSynchroComplete = 106
-- NotUsed = 6
update c set c."completejob"=1
from "uc_connectors" c where c."identifier" COLLATE SQL_Latin1_General_CP1_CS_AS in (
select sa."connectoridentifier" from "ud_scaffoldings" sc
join "ud_scaffoldingarguments" sa on sa."scaffolding_id"=sc."id" AND sa."scaffoldingargumenttype"=6
where sc."generator"=106);
-- NoConnectorProvisioning = 5
update c set c."completejob"=2
from "uc_connectors" c where c."identifier" COLLATE SQL_Latin1_General_CP1_CS_AS in (
select sa."connectoridentifier" from "ud_scaffoldings" sc
join "ud_scaffoldingarguments" sa on sa."scaffolding_id"=sc."id" AND sa."scaffoldingargumenttype"=5
where sc."generator"=106);
-- NoConnectorSynchronization = 4
update c set c."completejob"=3
from "uc_connectors" c where c."identifier" COLLATE SQL_Latin1_General_CP1_CS_AS in (
select sa."connectoridentifier" from "ud_scaffoldings" sc
join "ud_scaffoldingarguments" sa on sa."scaffolding_id"=sc."id" AND sa."scaffoldingargumenttype"=4
where sc."generator"=106);
GO

-- Delete old scaffolding arguments
delete sa from "ud_scaffoldingarguments" sa
join "ud_scaffoldings" sc on sc."id"=sa."scaffolding_id" AND sc."generator" in (105,106)
where sa."scaffoldingargumenttype" in (4,5,6)
GO
