IF COL_LENGTH('dbo.UC_ConnectionTransformations', 'Id') IS NULL
BEGIN
CREATE TABLE "UC_ConnectionTransformations" (
    "Id" BIGINT NOT NULL,
    "Connection_Id" BIGINT NOT NULL,
    "Type" INT NOT NULL,
    "TransformationOrder" INT NOT NULL,
    "Table" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "Column" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn2" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn3" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn4" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "InputColumn5" VARCHAR(442) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
    "WhereOperator" INT NULL,
    "WhereValue" NVARCHAR(442) NULL,
    "DatePattern" NVARCHAR(442) NULL,
    "AddedDays" REAL NULL,
    "MinYear" INT NULL,
    "MaxYear" INT NULL,
    "ConcatSeparator" NVARCHAR(442) NULL,
    "RemoveEmpty" BIT NULL,
    "RemoveDuplicates" BIT NULL,
    "SortValues" BIT NULL,
    CONSTRAINT "PK_ConnectionTransformations" PRIMARY KEY CLUSTERED ("Id" ASC),
    CONSTRAINT "FK_ConnectionTransformations_Connection" FOREIGN KEY ("Connection_Id") REFERENCES "UC_Connections" ("Id"),
    );
END
GO
