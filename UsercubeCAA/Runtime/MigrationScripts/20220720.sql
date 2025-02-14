IF COL_LENGTH('dbo.UP_Policies', 'MaxDuration') IS NULL
BEGIN
ALTER TABLE "UP_Policies" ADD "MaxDuration" INT CONSTRAINT "DF_Policies_MaxDuration" DEFAULT ((0)) NOT NULL;
END
GO
