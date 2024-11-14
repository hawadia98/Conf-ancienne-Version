ALTER TABLE UP_PolicySimulations
    DROP CONSTRAINT U_PolicySimulations_Identifier;

ALTER TABLE UP_PolicySimulations
    ALTER COLUMN Identifier nvarchar(442) not null;

ALTER TABLE UP_PolicySimulations
    ADD CONSTRAINT U_PolicySimulations_Identifier UNIQUE (Identifier);
