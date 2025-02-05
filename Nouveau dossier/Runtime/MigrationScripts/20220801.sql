IF OBJECT_ID('dbo.[UW_UnicityCheckRules]', 'U') IS NULL
BEGIN
    CREATE TABLE "UW_UnicityCheckRules" (
        "Id" BIGINT NOT NULL,
        "Aspect_Id" BIGINT NOT NULL,
        "TargetEntityType_Id" BIGINT NOT NULL,
        "SourceBinding_Id" BIGINT NULL,
        "SourceExpression" VARCHAR(4000) NULL,
        "TargetBinding_Id" BIGINT NULL,
        "TargetExpression" VARCHAR(4000) NULL,
        CONSTRAINT "PK_UnicityCheckRules" PRIMARY KEY CLUSTERED ("Id" ASC),
        CONSTRAINT "FK_UnicityCheckRules_Aspect" FOREIGN KEY ("Aspect_Id") REFERENCES "UW_Aspects" ("Id"),
        CONSTRAINT "FK_UnicityCheckRules_TargetEntityType" FOREIGN KEY ("TargetEntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
        CONSTRAINT "FK_UnicityCheckRules_SourceBinding" FOREIGN KEY ("SourceBinding_Id") REFERENCES "UM_Bindings" ("Id"),
        CONSTRAINT "FK_UnicityCheckRules_TargetBinding" FOREIGN KEY ("TargetBinding_Id") REFERENCES "UM_Bindings" ("Id"),
    );
END

GO
