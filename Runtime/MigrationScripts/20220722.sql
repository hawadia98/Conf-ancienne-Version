
If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedSingleRoles_DashboardCounter_ReviewRoles_V1' AND object_id = OBJECT_ID('UP_AssignedSingleRoles'))
BEGIN

DROP INDEX "UP_AssignedSingleRoles"."IX_AssignedSingleRoles_DashboardCounter_ReviewRoles_V1"

END

CREATE INDEX "IX_AssignedSingleRoles_DashboardCounter_ReviewRoles_V1" ON "UP_AssignedSingleRoles" ("OwnerType", "WhenCreated" DESC) WHERE ("ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',(121)) AND "WorkflowState" IN (8,9,10,11,12,13,25,27))


If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedSingleRoles_RoleReview' AND object_id = OBJECT_ID('UP_AssignedSingleRoles'))
BEGIN

DROP INDEX "UP_AssignedSingleRoles"."IX_AssignedSingleRoles_RoleReview"

END

CREATE INDEX "IX_AssignedSingleRoles_RoleReview" ON "UP_AssignedSingleRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","Comment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25)

If  EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='IX_AssignedCompositeRoles_RoleReview' AND object_id = OBJECT_ID('UP_AssignedCompositeRoles'))
BEGIN

DROP INDEX "UP_AssignedCompositeRoles"."IX_AssignedCompositeRoles_RoleReview"

END

CREATE INDEX "IX_AssignedCompositeRoles_RoleReview" ON "UP_AssignedCompositeRoles"("OwnerType","WorkflowInstance_Id","Owner_Id","Id") INCLUDE ("WorkflowState","IsDenied","StartDate","EndDate","Role_Id","ParametersContext_Id","WhenCreated","WhenPerformed","Comment","WhenReviewed1","WhenReviewed2","WhenReviewed3","WhenRiskReviewed","ReviewComment1","ReviewComment2","ReviewComment3","RiskReviewComment","RequestComment","IsIndirect")
WHERE "ValidTo"=CONVERT(DATETIME2(2),'9999-12-31 23:59:59.999',121) AND "IsIndirect"=0 AND "WorkflowState" IN (8,9,10,11,12,13,25,27)

GO
