IF OBJECT_ID('dbo.[DF_SingleRoles_MaxDuration]', 'C') IS NOT NULL
BEGIN
ALTER TABLE dbo.[UP_SingleRoles] DROP CONSTRAINT DF_SingleRoles_MaxDuration
END

IF COL_LENGTH('dbo.[UP_SingleRoles]', 'MaxDuration') IS NULL
BEGIN
ALTER TABLE UP_SingleRoles ADD MaxDuration INT NULL
END
ELSE IF (SELECT  is_nullable
        FROM    sys.columns
        WHERE   object_id = object_id('dbo.[UP_SingleRoles]')
        AND NAME = 'MaxDuration') = 0
BEGIN
ALTER TABLE UP_SingleRoles ALTER COLUMN MaxDuration INT NULL
UPDATE UP_SingleRoles SET MaxDuration=NULL where MaxDuration=0
END

IF OBJECT_ID('dbo.[DF_CompositeRoles_MaxDuration]', 'C') IS NOT NULL
BEGIN
ALTER TABLE dbo.[UP_CompositeRoles] DROP CONSTRAINT DF_CompositeRoles_MaxDuration
END

IF COL_LENGTH('dbo.[UP_CompositeRoles]', 'MaxDuration') IS NULL
BEGIN
ALTER TABLE UP_CompositeRoles ADD MaxDuration INT NULL
END
ELSE IF (SELECT  is_nullable
        FROM    sys.columns
        WHERE   object_id = object_id('dbo.[UP_CompositeRoles]')
        AND NAME = 'MaxDuration') = 0
BEGIN
ALTER TABLE UP_CompositeRoles ALTER COLUMN MaxDuration INT NULL
UPDATE UP_CompositeRoles SET MaxDuration=NULL where MaxDuration=0
END

IF OBJECT_ID('dbo.[UP_ResourceTypes_MaxDuration]', 'C') IS NOT NULL
BEGIN
ALTER TABLE dbo.[UP_ResourceTypes] DROP CONSTRAINT DF_ResourceTypes_MaxDuration
END

IF COL_LENGTH('dbo.[UP_ResourceTypes]', 'MaxDuration') IS NULL
BEGIN
ALTER TABLE UP_ResourceTypes ADD MaxDuration INT NULL
END
ELSE IF (SELECT  is_nullable
        FROM    sys.columns
        WHERE   object_id = object_id('dbo.[UP_ResourceTypes]')
        AND NAME = 'MaxDuration') = 0
BEGIN
ALTER TABLE UP_ResourceTypes ALTER COLUMN MaxDuration INT NULL
UPDATE UP_ResourceTypes SET MaxDuration=NULL where MaxDuration=0
END
