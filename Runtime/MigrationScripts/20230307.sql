﻿IF COL_LENGTH('dbo.UT_Resources', 'ValidTo') IS NULL
BEGIN
ALTER TABLE "UT_Resources" ADD "ValidTo" DATETIME2(2) NULL;
END
GO
