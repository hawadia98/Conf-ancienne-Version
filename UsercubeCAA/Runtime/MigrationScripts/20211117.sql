ALTER TABLE UP_PolicySimulations
ADD Policy_Id BIGINT NULL;
GO

ALTER TABLE UP_PolicySimulations
ADD CONSTRAINT "FK_PolicySimulations_Policy" FOREIGN KEY ("Policy_Id") REFERENCES "UP_Policies" ("Id");
GO

UPDATE UC_Connections
SET Package_Id = -23
WHERE Package_Id = -24;
GO

DELETE FROM UC_ConnectionPackages
WHERE Id=-24;
GO
