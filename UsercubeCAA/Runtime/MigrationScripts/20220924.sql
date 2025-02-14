IF COL_LENGTH('dbo.UP_BindingExpressions', 'Hash') IS NULL
BEGIN
CREATE TABLE "UP_BindingExpressions" (
    "Hash" INT NOT NULL,
    "EntityType_Id" BIGINT NOT NULL,
    "Binding_Id" BIGINT NULL,
    "Expression" VARCHAR(4000) NULL,
    CONSTRAINT "PK_BindingExpressions" PRIMARY KEY ("EntityType_Id", "Hash"),
    CONSTRAINT "FK_BindingExpression_Binding" FOREIGN KEY ("Binding_Id") REFERENCES "UM_Bindings" ("Id"),
    CONSTRAINT "FK_BindingExpression_EntityType" FOREIGN KEY ("EntityType_Id") REFERENCES "UM_EntityTypes" ("Id"),
);
END
GO
