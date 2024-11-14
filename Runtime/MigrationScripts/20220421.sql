--Update access certification campaigns

--Search for min id 
DECLARE @minCampaignsId bigint;

SELECT @minCampaignsId=MIN(id) FROM US_AccessCertificationCampaigns;

IF @minCampaignsId>0 BEGIN SET @minCampaignsId=0 END

DECLARE @minCampaignsFilterId bigint;

SELECT @minCampaignsFilterId=MIN(id) FROM US_AccessCertificationDataFilters;

IF @minCampaignsFilterId>=0 BEGIN SET @minCampaignsFilterId=0 END

DECLARE @minOwnerFilter int;

SELECT @minOwnerFilter=MIN(id) FROM US_AccessCertificationOwnerFilters;

IF @minOwnerFilter>=0 BEGIN SET @minOwnerFilter=0 END

DECLARE @frIndicatorNumber int;
SELECT @frIndicatorNumber = IndicatorNumber
FROM UM_Languages
WHERE code='fr-FR';

CREATE TABLE tmp_us_campaignsfilters 
(
		[Id] bigint not null
      ,[Campaign_Id] bigint not null
	  ,[Parent] bigint not null
      ,[IncludeCompositeRoles] bit
      ,[IncludeSingleRoles] bit 
      ,[IncludeResourceTypes] bit 
      ,[IncludeResourceNavigations] bit 
	  ,[FrTrad] NVARCHAR(442)
	  ,[EnTrad] NVARCHAR(442)
)

--Create one campaign per filter for pending campaign
--Select in a tmp table the all campaigns filters except one
INSERT INTO tmp_us_campaignsfilters 
(
		[Id]
      ,[Campaign_Id]
	  ,[Parent]
	  ,[FrTrad]
	  ,[EnTrad]
)
SELECT id, Campaign_Id, Parent, 'filtre'+ CAST(rowNumber AS NVARCHAR(442)), 'filter'+ CAST(rowNumber AS NVARCHAR(442))
FROM (
SELECT
fil.Id as id
,fil.Campaign_Id as Campaign_Id
,fil.Campaign_Id as Parent
,ROW_NUMBER() OVER(PARTITION BY fil.Campaign_Id ORDER BY fil.Campaign_Id) as rowNumber
FROM US_AccessCertificationDataFilters fil
JOIN US_AccessCertificationCampaigns camp on camp.Id=fil.Campaign_Id
WHERE camp.State = 0) t WHERE t.rowNumber>1

--Create new campaigns id for those filter
UPDATE t 
SET t.Campaign_Id=@minCampaignsId - rownumber
FROM
(SELECT *, ROW_NUMBER() Over(order by parent) as rownumber FROM tmp_us_campaignsfilters) t

--Insert one campaign per surplus filter
INSERT INTO US_AccessCertificationCampaigns 
SELECT fil.Campaign_Id AS Id,
          camp.Identifier AS Identifier,
          camp.Policy_Id AS Policy_Id,
          camp.StartDate AS StartDate,
          camp.CertificationEndDate AS CertificationEndDate,
          camp.OwnerEntityType_Id AS OwnerEntityType_Id,
          camp.State AS State,
          camp.ItemsCount AS ItemsCount,
          camp.CompletedItemsCount AS CompletedItemsCount,
          camp.LastNotificationDate AS LastNotificationDate,
          camp.NotificationNeeded AS NotificationNeeded,
          camp.DisplayName_L1 AS DisplayName_L1,
          camp.DisplayName_L2 AS DisplayName_L2,
          camp.DisplayName_L3 AS DisplayName_L3,
          camp.DisplayName_L4 AS DisplayName_L4,
          camp.DisplayName_L5 AS DisplayName_L5,
          camp.DisplayName_L6 AS DisplayName_L6,
          camp.DisplayName_L7 AS DisplayName_L7,
          camp.DisplayName_L8 AS DisplayName_L8,
          camp.DisplayName_L9 AS DisplayName_L9,
          camp.DisplayName_L10 AS DisplayName_L10,
          camp.DisplayName_L11 AS DisplayName_L11,
          camp.DisplayName_L12 AS DisplayName_L12,
          camp.DisplayName_L13 AS DisplayName_L13,
          camp.DisplayName_L14 AS DisplayName_L14,
          camp.DisplayName_L15 AS DisplayName_L15,
          camp.DisplayName_L16 AS DisplayName_L16
   FROM US_AccessCertificationCampaigns camp
   JOIN tmp_us_campaignsfilters fil ON camp.Id = fil.Parent
   WHERE fil.Parent != fil.Campaign_Id

--Update campaigns display name for new campaigns created by filter
UPDATE US_AccessCertificationCampaigns SET Identifier = Identifier+'_'+fil.EnTrad COLLATE SQL_Latin1_General_CP1_CI_AS,
	DisplayName_L1 = (
	CASE
		WHEN camp.DisplayName_L1 is not null and @frIndicatorNumber != 1 THEN camp.DisplayName_L1 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L1 is not null and @frIndicatorNumber = 1 THEN camp.DisplayName_L1 + '-' + fil.FrTrad
	END
	),
	DisplayName_L2 = (
	CASE
		WHEN camp.DisplayName_L2 is not null and @frIndicatorNumber != 2 THEN camp.DisplayName_L2 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L2 is not null and @frIndicatorNumber = 2 THEN camp.DisplayName_L2 + '-' + fil.FrTrad
	END
	),
	DisplayName_L3 = (
	CASE
		WHEN camp.DisplayName_L3 is not null and @frIndicatorNumber != 3 THEN camp.DisplayName_L3 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L3 is not null and @frIndicatorNumber = 3 THEN camp.DisplayName_L3 + '-' + fil.FrTrad
	END
	),
	DisplayName_L4 = (
	CASE
		WHEN camp.DisplayName_L4 is not null and @frIndicatorNumber != 4 THEN camp.DisplayName_L4 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L4 is not null and @frIndicatorNumber = 4 THEN camp.DisplayName_L4 + '-' + fil.FrTrad
	END
	),
	DisplayName_L5 = (
	CASE
		WHEN camp.DisplayName_L5 is not null and @frIndicatorNumber != 5 THEN camp.DisplayName_L5 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L5 is not null and @frIndicatorNumber = 5 THEN camp.DisplayName_L5 + '-' + fil.FrTrad
	END
	),
	DisplayName_L6 = (
	CASE
		WHEN camp.DisplayName_L6 is not null and @frIndicatorNumber != 6 THEN camp.DisplayName_L6 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L6 is not null and @frIndicatorNumber = 6 THEN camp.DisplayName_L6 + '-' + fil.FrTrad
	END
	),
	DisplayName_L7 = (
	CASE
		WHEN camp.DisplayName_L7 is not null and @frIndicatorNumber != 7 THEN camp.DisplayName_L7 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L7 is not null and @frIndicatorNumber = 7 THEN camp.DisplayName_L7 + '-' + fil.FrTrad
	END
	),
	DisplayName_L8 = (
	CASE
		WHEN camp.DisplayName_L8 is not null and @frIndicatorNumber != 8 THEN camp.DisplayName_L8 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L8 is not null and @frIndicatorNumber = 8 THEN camp.DisplayName_L8 + '-' + fil.FrTrad
	END
	),
	DisplayName_L9 = (
	CASE
		WHEN camp.DisplayName_L9 is not null and @frIndicatorNumber != 9 THEN camp.DisplayName_L9 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L9 is not null and @frIndicatorNumber = 9 THEN camp.DisplayName_L9 + '-' + fil.FrTrad
	END
	),
	DisplayName_L10 = (
	CASE
		WHEN camp.DisplayName_L10 is not null and @frIndicatorNumber != 10 THEN camp.DisplayName_L10 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L10 is not null and @frIndicatorNumber = 10 THEN camp.DisplayName_L10 + '-' + fil.FrTrad
	END
	),
	DisplayName_L11 = (
	CASE
		WHEN camp.DisplayName_L11 is not null and @frIndicatorNumber != 11 THEN camp.DisplayName_L11 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L11 is not null and @frIndicatorNumber = 11 THEN camp.DisplayName_L11 + '-' + fil.FrTrad
	END
	),
	DisplayName_L12 = (
	CASE
		WHEN camp.DisplayName_L12 is not null and @frIndicatorNumber != 12 THEN camp.DisplayName_L12 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L12 is not null and @frIndicatorNumber = 12 THEN camp.DisplayName_L12 + '-' + fil.FrTrad
	END
	),
	DisplayName_L13 = (
	CASE
		WHEN camp.DisplayName_L13 is not null and @frIndicatorNumber != 13 THEN camp.DisplayName_L13 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L13 is not null and @frIndicatorNumber = 13 THEN camp.DisplayName_L13 + '-' + fil.FrTrad
	END
	),
	DisplayName_L14 = (
	CASE
		WHEN camp.DisplayName_L14 is not null and @frIndicatorNumber != 14 THEN camp.DisplayName_L14 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L14 is not null and @frIndicatorNumber = 14 THEN camp.DisplayName_L14 + '-' + fil.FrTrad
	END
	),
	DisplayName_L15 = (
	CASE
		WHEN camp.DisplayName_L15 is not null and @frIndicatorNumber != 15 THEN camp.DisplayName_L15 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L15 is not null and @frIndicatorNumber = 15 THEN camp.DisplayName_L15 + '-' + fil.FrTrad
	END
	),
	DisplayName_L16 = (
	CASE
		WHEN camp.DisplayName_L16 is not null and @frIndicatorNumber != 16 THEN camp.DisplayName_L16 + '-' + fil.EnTrad
		WHEN camp.DisplayName_L16 is not null and @frIndicatorNumber = 16 THEN camp.DisplayName_L16 + '-' + fil.FrTrad
	END
	)
	FROM US_AccessCertificationCampaigns camp JOIN tmp_us_campaignsfilters fil ON fil.Campaign_Id=camp.Id

--Update filters Campaign_Id
UPDATE fil SET fil.Campaign_Id= tmpFil.Campaign_Id
FROM US_AccessCertificationDataFilters fil JOIN tmp_us_campaignsfilters tmpFil on fil.id = tmpFil.Id

--Add New Owner
INSERT INTO US_AccessCertificationOwnerFilters
SELECT @minOwnerFilter - ROW_NUMBER() Over(order by campaignOwner.id)
      ,temps.Campaign_Id
	  ,campaignOwner.IndividualOwner_Id
      ,campaignOwner.TargetedRisk_Id
      ,campaignOwner.MinimalRiskScore
      ,campaignOwner.D0_Id
      ,campaignOwner.D1_Id
      ,campaignOwner.D2_Id
      ,campaignOwner.D3_Id
      ,campaignOwner.D4_Id
      ,campaignOwner.D5_Id
      ,campaignOwner.D6_Id
      ,campaignOwner.D7_Id
      ,campaignOwner.D8_Id
      ,campaignOwner.D9_Id
      ,campaignOwner.DA_Id
      ,campaignOwner.DB_Id
      ,campaignOwner.DC_Id
      ,campaignOwner.DD_Id
      ,campaignOwner.DE_Id
      ,campaignOwner.DF_Id
      ,campaignOwner.DG_Id
      ,campaignOwner.DH_Id
      ,campaignOwner.DI_Id
      ,campaignOwner.DJ_Id
      ,campaignOwner.DK_Id
      ,campaignOwner.DL_Id
      ,campaignOwner.DM_Id
      ,campaignOwner.DN_Id
      ,campaignOwner.DO_Id
      ,campaignOwner.DP_Id
      ,campaignOwner.DQ_Id
      ,campaignOwner.DR_Id
      ,campaignOwner.DS_Id
      ,campaignOwner.DT_Id
      ,campaignOwner.DU_Id
      ,campaignOwner.DV_Id
      ,campaignOwner.D10_Id
      ,campaignOwner.D11_Id
      ,campaignOwner.D12_Id
      ,campaignOwner.D13_Id
      ,campaignOwner.D14_Id
      ,campaignOwner.D15_Id
      ,campaignOwner.D16_Id
      ,campaignOwner.D17_Id
      ,campaignOwner.D18_Id
      ,campaignOwner.D19_Id
      ,campaignOwner.D1A_Id
      ,campaignOwner.D1B_Id
      ,campaignOwner.D1C_Id
      ,campaignOwner.D1D_Id
      ,campaignOwner.D1E_Id
      ,campaignOwner.D1F_Id
      ,campaignOwner.D1G_Id
      ,campaignOwner.D1H_Id
      ,campaignOwner.D1I_Id
      ,campaignOwner.D1J_Id
      ,campaignOwner.D1K_Id
      ,campaignOwner.D1L_Id
      ,campaignOwner.D1M_Id
      ,campaignOwner.D1N_Id
      ,campaignOwner.D1O_Id
      ,campaignOwner.D1P_Id
      ,campaignOwner.D1Q_Id
      ,campaignOwner.D1R_Id
      ,campaignOwner.D1S_Id
      ,campaignOwner.D1T_Id
      ,campaignOwner.D1U_Id
      ,campaignOwner.D1V_Id
      ,campaignOwner.D20_Id
      ,campaignOwner.D21_Id
      ,campaignOwner.D22_Id
      ,campaignOwner.D23_Id
      ,campaignOwner.D24_Id
      ,campaignOwner.D25_Id
      ,campaignOwner.D26_Id
      ,campaignOwner.D27_Id
      ,campaignOwner.D28_Id
      ,campaignOwner.D29_Id
      ,campaignOwner.D2A_Id
      ,campaignOwner.D2B_Id
      ,campaignOwner.D2C_Id
      ,campaignOwner.D2D_Id
      ,campaignOwner.D2E_Id
      ,campaignOwner.D2F_Id
      ,campaignOwner.D2G_Id
      ,campaignOwner.D2H_Id
      ,campaignOwner.D2I_Id
      ,campaignOwner.D2J_Id
      ,campaignOwner.D2K_Id
      ,campaignOwner.D2L_Id
      ,campaignOwner.D2M_Id
      ,campaignOwner.D2N_Id
      ,campaignOwner.D2O_Id
      ,campaignOwner.D2P_Id
      ,campaignOwner.D2Q_Id
      ,campaignOwner.D2R_Id
      ,campaignOwner.D2S_Id
      ,campaignOwner.D2T_Id
      ,campaignOwner.D2U_Id
      ,campaignOwner.D2V_Id
      ,campaignOwner.D30_Id
      ,campaignOwner.D31_Id
      ,campaignOwner.D32_Id
      ,campaignOwner.D33_Id
      ,campaignOwner.D34_Id
      ,campaignOwner.D35_Id
      ,campaignOwner.D36_Id
      ,campaignOwner.D37_Id
      ,campaignOwner.D38_Id
      ,campaignOwner.D39_Id
      ,campaignOwner.D3A_Id
      ,campaignOwner.D3B_Id
      ,campaignOwner.D3C_Id
      ,campaignOwner.D3D_Id
      ,campaignOwner.D3E_Id
      ,campaignOwner.D3F_Id
      ,campaignOwner.D3G_Id
      ,campaignOwner.D3H_Id
      ,campaignOwner.D3I_Id
      ,campaignOwner.D3J_Id
      ,campaignOwner.D3K_Id
      ,campaignOwner.D3L_Id
      ,campaignOwner.D3M_Id
      ,campaignOwner.D3N_Id
      ,campaignOwner.D3O_Id
      ,campaignOwner.D3P_Id
      ,campaignOwner.D3Q_Id
      ,campaignOwner.D3R_Id
      ,campaignOwner.D3S_Id
      ,campaignOwner.D3T_Id
      ,campaignOwner.D3U_Id
      ,campaignOwner.D3V_Id
      ,campaignOwner.OwnerLastModificationDate
      ,campaignOwner.OwnerLastModificationDateBinding_Id
FROM US_AccessCertificationOwnerFilters campaignOwner JOIN tmp_us_campaignsfilters temps ON campaignOwner.Campaign_Id=temps.Parent  
WHERE temps.Campaign_Id != temps.Parent

--Reset @minCampaignsId, @minOwnerFilter and clean up
DELETE from tmp_us_campaignsfilters

SELECT @minCampaignsId=MIN(id) FROM US_AccessCertificationCampaigns;

IF @minCampaignsId>=0 BEGIN SET @minCampaignsId=0 END

SELECT @minOwnerFilter=MIN(id) FROM US_AccessCertificationOwnerFilters;

IF @minOwnerFilter>=0 BEGIN SET @minOwnerFilter=0 END

--Create new filters targeting one Assigned type for pending campaign

INSERT INTO tmp_us_campaignsfilters 
(
		[Id]
      ,[Campaign_Id]
	  ,[Parent]
      ,[IncludeCompositeRoles] 
      ,[IncludeSingleRoles] 
      ,[IncludeResourceTypes] 
      ,[IncludeResourceNavigations]
	  ,[FrTrad]
	  ,[EnTrad]
)
SELECT
fil.[Id]
,[Campaign_Id]
,[Campaign_Id]
,1
,0
,0
,0
,'-Rôle composé'
,'-Composite role'
FROM US_AccessCertificationDataFilters fil JOIN US_AccessCertificationCampaigns camp ON camp.Id=Campaign_Id
WHERE IncludeCompositeRoles = 1 AND (IncludeSingleRoles | IncludeResourceNavigations | IncludeResourceTypes = 1) AND camp.State = 0
UNION
SELECT
fil.[Id]
,[Campaign_Id]
,[Campaign_Id]
,0
,1
,0
,0
,'-Rôle simple'
,'-Single role'
FROM US_AccessCertificationDataFilters fil JOIN US_AccessCertificationCampaigns camp ON camp.Id=Campaign_Id
WHERE IncludeSingleRoles = 1 AND (IncludeCompositeRoles | IncludeResourceNavigations | IncludeResourceTypes = 1) AND camp.State = 0
UNION
SELECT
fil.[Id]
,[Campaign_Id]
,[Campaign_Id]
,0
,0
,1
,0
,'-Type de ressource'
,'-Resource type'
FROM US_AccessCertificationDataFilters fil JOIN US_AccessCertificationCampaigns camp ON camp.Id=Campaign_Id
WHERE IncludeResourceTypes = 1 AND (IncludeCompositeRoles | IncludeResourceNavigations | IncludeSingleRoles = 1) AND camp.State = 0
UNION
SELECT
fil.[Id]
,[Campaign_Id]
,[Campaign_Id]
,0
,0
,0
,1
,'-Propriétés de navigation'
,'-Navigation properties'
FROM US_AccessCertificationDataFilters fil JOIN US_AccessCertificationCampaigns camp ON camp.Id=Campaign_Id
WHERE IncludeResourceNavigations = 1 AND (IncludeCompositeRoles | IncludeResourceTypes| IncludeSingleRoles = 1) AND camp.State = 0

--Update ids

UPDATE t 
SET t.Campaign_Id=@minCampaignsId - rownumber
FROM
(SELECT *, ROW_NUMBER() Over(Partition by parent order by parent) as filterRn, ROW_NUMBER() Over(order by parent) as rownumber FROM tmp_us_campaignsfilters) t
WHERE filterRn > 1

--Add new Campaigns 

INSERT INTO US_AccessCertificationCampaigns 
SELECT fil.Campaign_Id AS Id,
          camp.Identifier AS Identifier,
          camp.Policy_Id AS Policy_Id,
          camp.StartDate AS StartDate,
          camp.CertificationEndDate AS CertificationEndDate,
          camp.OwnerEntityType_Id AS OwnerEntityType_Id,
          camp.State AS State,
          camp.ItemsCount AS ItemsCount,
          camp.CompletedItemsCount AS CompletedItemsCount,
          camp.LastNotificationDate AS LastNotificationDate,
          camp.NotificationNeeded AS NotificationNeeded,
          camp.DisplayName_L1 AS DisplayName_L1,
          camp.DisplayName_L2 AS DisplayName_L2,
          camp.DisplayName_L3 AS DisplayName_L3,
          camp.DisplayName_L4 AS DisplayName_L4,
          camp.DisplayName_L5 AS DisplayName_L5,
          camp.DisplayName_L6 AS DisplayName_L6,
          camp.DisplayName_L7 AS DisplayName_L7,
          camp.DisplayName_L8 AS DisplayName_L8,
          camp.DisplayName_L9 AS DisplayName_L9,
          camp.DisplayName_L10 AS DisplayName_L10,
          camp.DisplayName_L11 AS DisplayName_L11,
          camp.DisplayName_L12 AS DisplayName_L12,
          camp.DisplayName_L13 AS DisplayName_L13,
          camp.DisplayName_L14 AS DisplayName_L14,
          camp.DisplayName_L15 AS DisplayName_L15,
          camp.DisplayName_L16 AS DisplayName_L16
   FROM US_AccessCertificationCampaigns camp
   JOIN tmp_us_campaignsfilters fil ON camp.Id = fil.Parent
   WHERE fil.Parent != fil.Campaign_Id

--Update identifier and display name

UPDATE US_AccessCertificationCampaigns SET Identifier = (
	CASE 
		WHEN fil.IncludeCompositeRoles = 1 THEN camp.Identifier+'_Composite'
		WHEN fil.IncludeSingleRoles = 1 THEN camp.Identifier+'_Single'
		WHEN fil.IncludeResourceTypes = 1 THEN camp.Identifier+'_ResourceType'
		WHEN fil.IncludeResourceNavigations = 1 THEN camp.Identifier+'_Navigation'
	END
	),
	DisplayName_L1 = (
	CASE
		WHEN camp.DisplayName_L1 is not null and @frIndicatorNumber != 1 THEN camp.DisplayName_L1 + fil.EnTrad
		WHEN camp.DisplayName_L1 is not null and @frIndicatorNumber = 1 THEN camp.DisplayName_L1 + fil.FrTrad
	END
	),
	DisplayName_L2 = (
	CASE
		WHEN camp.DisplayName_L2 is not null and @frIndicatorNumber != 2 THEN camp.DisplayName_L2 + fil.EnTrad
		WHEN camp.DisplayName_L2 is not null and @frIndicatorNumber = 2 THEN camp.DisplayName_L2 + fil.FrTrad
	END
	),
	DisplayName_L3 = (
	CASE
		WHEN camp.DisplayName_L3 is not null and @frIndicatorNumber != 3 THEN camp.DisplayName_L3 + fil.EnTrad
		WHEN camp.DisplayName_L3 is not null and @frIndicatorNumber = 3 THEN camp.DisplayName_L3 + fil.FrTrad
	END
	),
	DisplayName_L4 = (
	CASE
		WHEN camp.DisplayName_L4 is not null and @frIndicatorNumber != 4 THEN camp.DisplayName_L4 + fil.EnTrad
		WHEN camp.DisplayName_L4 is not null and @frIndicatorNumber = 4 THEN camp.DisplayName_L4 + fil.FrTrad
	END
	),
	DisplayName_L5 = (
	CASE
		WHEN camp.DisplayName_L5 is not null and @frIndicatorNumber != 5 THEN camp.DisplayName_L5 + fil.EnTrad
		WHEN camp.DisplayName_L5 is not null and @frIndicatorNumber = 5 THEN camp.DisplayName_L5 + fil.FrTrad
	END
	),
	DisplayName_L6 = (
	CASE
		WHEN camp.DisplayName_L6 is not null and @frIndicatorNumber != 6 THEN camp.DisplayName_L6 + fil.EnTrad
		WHEN camp.DisplayName_L6 is not null and @frIndicatorNumber = 6 THEN camp.DisplayName_L6 + fil.FrTrad
	END
	),
	DisplayName_L7 = (
	CASE
		WHEN camp.DisplayName_L7 is not null and @frIndicatorNumber != 7 THEN camp.DisplayName_L7 + fil.EnTrad
		WHEN camp.DisplayName_L7 is not null and @frIndicatorNumber = 7 THEN camp.DisplayName_L7 + fil.FrTrad
	END
	),
	DisplayName_L8 = (
	CASE
		WHEN camp.DisplayName_L8 is not null and @frIndicatorNumber != 8 THEN camp.DisplayName_L8 + fil.EnTrad
		WHEN camp.DisplayName_L8 is not null and @frIndicatorNumber = 8 THEN camp.DisplayName_L8 + fil.FrTrad
	END
	),
	DisplayName_L9 = (
	CASE
		WHEN camp.DisplayName_L9 is not null and @frIndicatorNumber != 9 THEN camp.DisplayName_L9 + fil.EnTrad
		WHEN camp.DisplayName_L9 is not null and @frIndicatorNumber = 9 THEN camp.DisplayName_L9 + fil.FrTrad
	END
	),
	DisplayName_L10 = (
	CASE
		WHEN camp.DisplayName_L10 is not null and @frIndicatorNumber != 10 THEN camp.DisplayName_L10 + fil.EnTrad
		WHEN camp.DisplayName_L10 is not null and @frIndicatorNumber = 10 THEN camp.DisplayName_L10 + fil.FrTrad
	END
	),
	DisplayName_L11 = (
	CASE
		WHEN camp.DisplayName_L11 is not null and @frIndicatorNumber != 11 THEN camp.DisplayName_L11 + fil.EnTrad
		WHEN camp.DisplayName_L11 is not null and @frIndicatorNumber = 11 THEN camp.DisplayName_L11 + fil.FrTrad
	END
	),
	DisplayName_L12 = (
	CASE
		WHEN camp.DisplayName_L12 is not null and @frIndicatorNumber != 12 THEN camp.DisplayName_L12 + fil.EnTrad
		WHEN camp.DisplayName_L12 is not null and @frIndicatorNumber = 12 THEN camp.DisplayName_L12 + fil.FrTrad
	END
	),
	DisplayName_L13 = (
	CASE
		WHEN camp.DisplayName_L13 is not null and @frIndicatorNumber != 13 THEN camp.DisplayName_L13 + fil.EnTrad
		WHEN camp.DisplayName_L13 is not null and @frIndicatorNumber = 13 THEN camp.DisplayName_L13 + fil.FrTrad
	END
	),
	DisplayName_L14 = (
	CASE
		WHEN camp.DisplayName_L14 is not null and @frIndicatorNumber != 14 THEN camp.DisplayName_L14 + fil.EnTrad
		WHEN camp.DisplayName_L14 is not null and @frIndicatorNumber = 14 THEN camp.DisplayName_L14 + fil.FrTrad
	END
	),
	DisplayName_L15 = (
	CASE
		WHEN camp.DisplayName_L15 is not null and @frIndicatorNumber != 15 THEN camp.DisplayName_L15 + fil.EnTrad
		WHEN camp.DisplayName_L15 is not null and @frIndicatorNumber = 15 THEN camp.DisplayName_L15 + fil.FrTrad
	END
	),
	DisplayName_L16 = (
	CASE
		WHEN camp.DisplayName_L16 is not null and @frIndicatorNumber != 16 THEN camp.DisplayName_L16 + fil.EnTrad
		WHEN camp.DisplayName_L16 is not null and @frIndicatorNumber = 16 THEN camp.DisplayName_L16 + fil.FrTrad
	END
	)
	FROM US_AccessCertificationCampaigns camp JOIN tmp_us_campaignsfilters fil ON fil.Campaign_Id=camp.Id

--Update Filters

UPDATE US_AccessCertificationDataFilters SET IncludeCompositeRoles=temps.IncludeCompositeRoles, IncludeSingleRoles=temps.IncludeSingleRoles, IncludeResourceTypes=temps.IncludeResourceTypes, IncludeResourceNavigations=temps.IncludeResourceNavigations
FROM US_AccessCertificationDataFilters fil JOIN tmp_us_campaignsfilters temps ON fil.Campaign_Id=temps.Campaign_Id
WHERE temps.Campaign_Id = temps.Parent

--Add New Filters
INSERT INTO US_AccessCertificationDataFilters
SELECT @minCampaignsFilterId - ROW_NUMBER() Over(order by temps.id),
       temps.Campaign_Id,
       temps.IncludeCompositeRoles,
       temps.IncludeSingleRoles,
       temps.IncludeResourceTypes,
       temps.IncludeResourceNavigations,
       fil.IncludeResourceScalars,
       fil.IncludeWorkflowStatePolicyApproved,
       fil.IncludeWorkflowStateApproved,
       fil.IncludeWorkflowStateFound,
       fil.IncludeWorkflowStateHistory,
       fil.IncludeNoValidation,
       fil.IncludeSimpleValidation,
       fil.IncludeDoubleValidation,
       fil.IncludeTripleValidation,
       fil.IncludeDeniedPermissions,
       fil.Category_Id,
       fil.ResourceType_Id,
       fil.LatestCertifiedLimitDate,
       fil.TargetedRisk_Id
FROM US_AccessCertificationDataFilters fil JOIN tmp_us_campaignsfilters temps ON fil.Campaign_Id=temps.Parent  
WHERE temps.Campaign_Id != temps.Parent

--Add New Owner
INSERT INTO US_AccessCertificationOwnerFilters
SELECT @minOwnerFilter - ROW_NUMBER() Over(order by campaignOwner.id)
      ,temps.Campaign_Id
	  ,campaignOwner.IndividualOwner_Id
      ,campaignOwner.TargetedRisk_Id
      ,campaignOwner.MinimalRiskScore
      ,campaignOwner.D0_Id
      ,campaignOwner.D1_Id
      ,campaignOwner.D2_Id
      ,campaignOwner.D3_Id
      ,campaignOwner.D4_Id
      ,campaignOwner.D5_Id
      ,campaignOwner.D6_Id
      ,campaignOwner.D7_Id
      ,campaignOwner.D8_Id
      ,campaignOwner.D9_Id
      ,campaignOwner.DA_Id
      ,campaignOwner.DB_Id
      ,campaignOwner.DC_Id
      ,campaignOwner.DD_Id
      ,campaignOwner.DE_Id
      ,campaignOwner.DF_Id
      ,campaignOwner.DG_Id
      ,campaignOwner.DH_Id
      ,campaignOwner.DI_Id
      ,campaignOwner.DJ_Id
      ,campaignOwner.DK_Id
      ,campaignOwner.DL_Id
      ,campaignOwner.DM_Id
      ,campaignOwner.DN_Id
      ,campaignOwner.DO_Id
      ,campaignOwner.DP_Id
      ,campaignOwner.DQ_Id
      ,campaignOwner.DR_Id
      ,campaignOwner.DS_Id
      ,campaignOwner.DT_Id
      ,campaignOwner.DU_Id
      ,campaignOwner.DV_Id
      ,campaignOwner.D10_Id
      ,campaignOwner.D11_Id
      ,campaignOwner.D12_Id
      ,campaignOwner.D13_Id
      ,campaignOwner.D14_Id
      ,campaignOwner.D15_Id
      ,campaignOwner.D16_Id
      ,campaignOwner.D17_Id
      ,campaignOwner.D18_Id
      ,campaignOwner.D19_Id
      ,campaignOwner.D1A_Id
      ,campaignOwner.D1B_Id
      ,campaignOwner.D1C_Id
      ,campaignOwner.D1D_Id
      ,campaignOwner.D1E_Id
      ,campaignOwner.D1F_Id
      ,campaignOwner.D1G_Id
      ,campaignOwner.D1H_Id
      ,campaignOwner.D1I_Id
      ,campaignOwner.D1J_Id
      ,campaignOwner.D1K_Id
      ,campaignOwner.D1L_Id
      ,campaignOwner.D1M_Id
      ,campaignOwner.D1N_Id
      ,campaignOwner.D1O_Id
      ,campaignOwner.D1P_Id
      ,campaignOwner.D1Q_Id
      ,campaignOwner.D1R_Id
      ,campaignOwner.D1S_Id
      ,campaignOwner.D1T_Id
      ,campaignOwner.D1U_Id
      ,campaignOwner.D1V_Id
      ,campaignOwner.D20_Id
      ,campaignOwner.D21_Id
      ,campaignOwner.D22_Id
      ,campaignOwner.D23_Id
      ,campaignOwner.D24_Id
      ,campaignOwner.D25_Id
      ,campaignOwner.D26_Id
      ,campaignOwner.D27_Id
      ,campaignOwner.D28_Id
      ,campaignOwner.D29_Id
      ,campaignOwner.D2A_Id
      ,campaignOwner.D2B_Id
      ,campaignOwner.D2C_Id
      ,campaignOwner.D2D_Id
      ,campaignOwner.D2E_Id
      ,campaignOwner.D2F_Id
      ,campaignOwner.D2G_Id
      ,campaignOwner.D2H_Id
      ,campaignOwner.D2I_Id
      ,campaignOwner.D2J_Id
      ,campaignOwner.D2K_Id
      ,campaignOwner.D2L_Id
      ,campaignOwner.D2M_Id
      ,campaignOwner.D2N_Id
      ,campaignOwner.D2O_Id
      ,campaignOwner.D2P_Id
      ,campaignOwner.D2Q_Id
      ,campaignOwner.D2R_Id
      ,campaignOwner.D2S_Id
      ,campaignOwner.D2T_Id
      ,campaignOwner.D2U_Id
      ,campaignOwner.D2V_Id
      ,campaignOwner.D30_Id
      ,campaignOwner.D31_Id
      ,campaignOwner.D32_Id
      ,campaignOwner.D33_Id
      ,campaignOwner.D34_Id
      ,campaignOwner.D35_Id
      ,campaignOwner.D36_Id
      ,campaignOwner.D37_Id
      ,campaignOwner.D38_Id
      ,campaignOwner.D39_Id
      ,campaignOwner.D3A_Id
      ,campaignOwner.D3B_Id
      ,campaignOwner.D3C_Id
      ,campaignOwner.D3D_Id
      ,campaignOwner.D3E_Id
      ,campaignOwner.D3F_Id
      ,campaignOwner.D3G_Id
      ,campaignOwner.D3H_Id
      ,campaignOwner.D3I_Id
      ,campaignOwner.D3J_Id
      ,campaignOwner.D3K_Id
      ,campaignOwner.D3L_Id
      ,campaignOwner.D3M_Id
      ,campaignOwner.D3N_Id
      ,campaignOwner.D3O_Id
      ,campaignOwner.D3P_Id
      ,campaignOwner.D3Q_Id
      ,campaignOwner.D3R_Id
      ,campaignOwner.D3S_Id
      ,campaignOwner.D3T_Id
      ,campaignOwner.D3U_Id
      ,campaignOwner.D3V_Id
      ,campaignOwner.OwnerLastModificationDate
      ,campaignOwner.OwnerLastModificationDateBinding_Id
FROM US_AccessCertificationOwnerFilters campaignOwner JOIN tmp_us_campaignsfilters temps ON campaignOwner.Campaign_Id=temps.Parent  
WHERE temps.Campaign_Id != temps.Parent

--Clean up

DROP TABLE tmp_us_campaignsfilters
GO
