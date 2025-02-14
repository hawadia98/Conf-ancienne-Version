-- Fix ProfileContext dimension Id property identifier
UPDATE UM_EntityProperties SET Identifier = CONCAT('Dimension', d.ColumnMapping, 'Id') FROM UM_EntityProperties p
INNER JOIN UM_Dimensions d ON p.Id = -9223371345365041052 + (d.ColumnMapping * 2)
