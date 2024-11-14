UPDATE "UP_Policies" SET GracePeriod = '0' WHERE GracePeriod IS NULL;
GO

ALTER TABLE "UP_Policies" ALTER COLUMN GracePeriod INT NOT NULL;
IF OBJECT_ID('DF_Policies_GracePeriod', 'D') IS NULL
BEGIN
    ALTER TABLE "UP_Policies" ADD CONSTRAINT "DF_Policies_GracePeriod" DEFAULT ((0)) FOR GracePeriod;
END
GO
