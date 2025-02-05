ALTER TABLE "UM_EntityProperties" ADD "TargetEntityType" BIGINT NULL;
GO
UPDATE
	p
SET
	TargetEntityType = COALESCE(rp1.EntityType_Id, rp2.EntityType_Id)
FROM
	UM_EntityProperties p
	LEFT JOIN UM_EntityAssociations a1 ON (a1.Property1_Id = p.Id AND a1.ValidTo = CONVERT(datetime2(2),'9999-12-31 23:59:59.99',121))
	LEFT JOIN UM_EntityProperties rp1 ON (rp1.Id = a1.Property2_Id AND rp1.ValidTo = CONVERT(datetime2(2),'9999-12-31 23:59:59.99',121))
	LEFT JOIN UM_EntityAssociations a2 ON (a2.Property2_Id = p.Id AND a2.ValidTo = CONVERT(datetime2(2),'9999-12-31 23:59:59.99',121))
	LEFT JOIN UM_EntityProperties rp2 ON (rp2.Id = a2.Property1_Id AND rp2.ValidTo = CONVERT(datetime2(2),'9999-12-31 23:59:59.99',121))
WHERE
    p.ValidTo = CONVERT(datetime2(2),'9999-12-31 23:59:59.99',121)	AND
	(
	    p.TargetEntityType IS NULL AND COALESCE(rp1.EntityType_Id, rp2.EntityType_Id) IS NOT NULL
	    OR
	    p.TargetEntityType IS NOT NULL AND COALESCE(rp1.EntityType_Id, rp2.EntityType_Id) IS NULL
	    OR
	    p.TargetEntityType != COALESCE(rp1.EntityType_Id, rp2.EntityType_Id)
	)
GO

