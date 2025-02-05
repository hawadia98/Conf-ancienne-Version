IF COL_LENGTH('dbo.UP_ResourceCorrelationRules', 'BaseRule_Id') IS NULL
BEGIN
    ALTER TABLE UP_ResourceCorrelationRules
    ADD BaseRule_Id BIGINT DEFAULT ((0)) NULL;
END

GO
IF NOT EXISTS (SELECT TOP 1 1 FROM "um_entityproperties" where id=-9223370907278376947)
BEGIN
INSERT INTO "um_entityproperties"("id","entitytype_id","identifier","type","targetcolumnindex","neutralproperty_id","targetentitytype") VALUES
(-9223370907278376947, 2147483911,'BaseRuleId',-1,-1,NULL,NULL)
,(-9223370907278376946, 2147483911,'BaseRule',12,-1,NULL,2147483911)
,(-9223370907278376945, 2147483911,'RuleBase',12,-1,NULL,NULL)
END

GO
ALTER TABLE "UM_Dimensions" DROP CONSTRAINT "FK_Dimensions_PathProperty";
ALTER TABLE "UM_Dimensions" DROP COLUMN "PathProperty_Id";
GO
CREATE TABLE "UW_HomonymEntityLinkFilters"
(
    "Id" BIGINT NOT NULL PRIMARY KEY,  
    "HomonymEntityLink_Id" BIGINT NOT NULL,
    "Property1_Id" BIGINT NULL,
    "Expression1" VARCHAR(4000) NULL,
    "Operator1" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator1" DEFAULT ((2)) NOT NULL,  
    "ComparisonProperty1_Id" BIGINT NULL,
    "Property2_Id" BIGINT NULL,
    "Expression2" VARCHAR(4000) NULL,
    "Operator2" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator2" DEFAULT ((2)) NOT NULL,  
    "ComparisonProperty2_Id" BIGINT NULL,
    "Property3_Id" BIGINT NULL,
    "Expression3" VARCHAR(4000) NULL,
    "Operator3" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator3" DEFAULT ((2)) NOT NULL,  
    "ComparisonProperty3_Id" BIGINT NULL,
    "Property4_Id" BIGINT NULL,
    "Expression4" VARCHAR(4000) NULL,
    "Operator4" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator4" DEFAULT ((2)) NOT NULL,  
    "ComparisonProperty4_Id" BIGINT NULL,
    "Property5_Id" BIGINT NULL,
    "Expression5" VARCHAR(4000) NULL,
    "Operator5" TINYINT CONSTRAINT "DF_HomonymEntityLinkFilters_Operator5" DEFAULT ((2)) NOT NULL,  
    "ComparisonProperty5_Id" BIGINT NULL,
    CONSTRAINT "FK_HomonymEntityLinkFilters_HomonymEntityLink" FOREIGN KEY ("HomonymEntityLink_Id") REFERENCES "UW_HomonymEntityLinks" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property1" FOREIGN KEY ("Property1_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty1" FOREIGN KEY ("ComparisonProperty1_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property2" FOREIGN KEY ("Property2_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty2" FOREIGN KEY ("ComparisonProperty2_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property3" FOREIGN KEY ("Property3_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty3" FOREIGN KEY ("ComparisonProperty3_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property4" FOREIGN KEY ("Property4_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty4" FOREIGN KEY ("ComparisonProperty4_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_Property5" FOREIGN KEY ("Property5_Id") REFERENCES "UM_EntityProperties" ("Id"),
    CONSTRAINT "FK_HomonymEntityLinkFilters_ComparisonProperty5" FOREIGN KEY ("ComparisonProperty5_Id") REFERENCES "UM_EntityProperties" ("Id")
);
GO
If NOT EXISTS (
   SELECT TOP 1 1
   FROM sys.indexes
   WHERE name='IX_EntityPropertyExpressions' AND object_id = OBJECT_ID('dbo.UM_EntityPropertyExpressions')
)
BEGIN
    CREATE INDEX "IX_EntityPropertyExpressions" ON "UM_EntityPropertyExpressions" ("Property_Id" ASC);
END
GO

