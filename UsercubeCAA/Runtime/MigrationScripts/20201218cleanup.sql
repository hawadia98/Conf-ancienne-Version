/* Migration script for 5.1.7 */

/* 33262 - Rename SelectPersonasByFilterQueryHander to SelectPersonasByFilterQueryHandler */
DECLARE @oldId INT;
SELECT @oldId = Id FROM UM_Settings WHERE Identifier = 'SelectPersonasByFilterQueryHander';
DELETE FROM UM_Settings WHERE Identifier = 'SelectPersonasByFilterQueryHander';

UPDATE UM_Settings
SET Id = @oldId
where Identifier = 'SelectPersonasByFilterQueryHandler';
GO
/* End of #33262 */


ALTER TABLE UR_ResourceFiles ALTER Column [DataHash] INT NOT NULL;
GO
