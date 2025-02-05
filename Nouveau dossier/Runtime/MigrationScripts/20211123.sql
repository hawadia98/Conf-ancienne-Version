CREATE TABLE "UP_MiningRules" (
    "Id" BIGINT NOT NULL,
    "Policy_Id" BIGINT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,

    "MinIndentitiesCount" INT CONSTRAINT "DF_DisplayEntityTypes_MinIndentitiesCount" DEFAULT ((0)) NOT NULL,
    "ReductionOutlierPercentage" FLOAT(24) CONSTRAINT "DF_MiningRules_ReductionOutlierPercentage" DEFAULT((0.0)) NOT NULL,

    "IncludeNoValidation" BIT CONSTRAINT "DF_MiningRules_IncludeNoValidation" DEFAULT ((1)) NOT NULL,
    "IncludeSimpleValidation" BIT CONSTRAINT "DF_MiningRules_IncludeSimpleValidation" DEFAULT ((1)) NOT NULL,
    "IncludeDoubleValidation" BIT CONSTRAINT "DF_MiningRules_IncludeDoubleValidation" DEFAULT ((1)) NOT NULL,
    "IncludeTripleValidation" BIT CONSTRAINT "DF_MiningRules_IncludeTripleValidation" DEFAULT ((1)) NOT NULL,

    "RuleType" INT CONSTRAINT "DF_MiningRules_RuleType" DEFAULT((0)) NOT NULL,
    "RulePolicy_Id" BIGINT NOT NULL,

    "PrecisionMinPercentage" FLOAT(24) CONSTRAINT "DF_MiningRules_PrecisionMinPercentage" DEFAULT((100.0)) NOT NULL,
    "FalsePositiveMaxPercentage" FLOAT(24) CONSTRAINT "DF_MiningRules_FalsePositiveMaxPercentage" DEFAULT((0.0)) NOT NULL,

    "Priority" INT CONSTRAINT "DF_MiningRules_Priority" DEFAULT((0)) NOT NULL,

    "ValidFrom" DATETIME2(2) CONSTRAINT "DF_MiningRules_ValidFrom" DEFAULT GETUTCDATE() NOT NULL,
    "ValidTo" DATETIME2(2) CONSTRAINT "DF_MiningRules_ValidTo" DEFAULT (CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121)) NOT NULL,

    "Category_Id" BIGINT NULL,

    "WhenCreated" SMALLDATETIME NULL,
    "CreatedBy_Id" BIGINT NULL,
    "WhenChanged" SMALLDATETIME NULL,
    "ChangedBy_Id" BIGINT NULL,
    CONSTRAINT "PK_MiningRules" PRIMARY KEY NONCLUSTERED ("Id" ASC),
    CONSTRAINT "FK_MiningRules_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_MiningRules_RulePolicy" FOREIGN KEY ("RulePolicy_Id") REFERENCES "UP_Policies" ("Id"),
    CONSTRAINT "FK_MiningRules_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
    CONSTRAINT "FK_MiningRules_Category" FOREIGN KEY ("Category_Id") REFERENCES "UP_Categories" ("Id"),
);
GO
CREATE CLUSTERED INDEX "IX_MiningRules" ON "UP_MiningRules" ("Id" ASC, "ValidTo" ASC);
GO
