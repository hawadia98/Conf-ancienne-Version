UPDATE UC_Connections
SET Package_Id = -20
WHERE Package_Id = -21;
GO

DELETE FROM UC_ConnectionPackages
WHERE Id=-21;
GO
