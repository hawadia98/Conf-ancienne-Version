UPDATE UJ_Tasks SET BlockProvisioning=0 WHERE TaskType=1 AND BlockProvisioning=1
GO

ALTER TABLE uw_activities DROP CONSTRAINT DF_Activities_ArgumentBlockProvisioning;
GO
ALTER TABLE uw_activities ADD CONSTRAINT "DF_Activities_ArgumentBlockProvisioning" DEFAULT ((0)) FOR ArgumentBlockProvisioning;
GO
UPDATE UW_Activities SET ArgumentBlockProvisioning=0 WHERE ArgumentBlockProvisioning=1 AND Template_Id IN (-6,-7)
GO
