BEGIN
	DECLARE @MaxId bigint
    SET @MaxId = COALESCE((SELECT MAX("Id") FROM "UN_NotificationTemplates"), 0)
	IF (@MaxId = 0) UPDATE "UN_NotificationTemplates" SET Id = 1 where Id = 0
END
GO
