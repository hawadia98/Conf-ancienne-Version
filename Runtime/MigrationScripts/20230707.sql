IF COL_LENGTH('dbo.UT_BigIntsValue', 'Id') IS NULL
    BEGIN
        CREATE TABLE "UT_BigIntsValue" (
           "Id" BIGINT NOT NULL,
           "Value" BIGINT,
           "IntValue" INT,
        );
    END
GO
