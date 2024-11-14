IF COL_LENGTH('dbo.UN_Notifications', 'Type') IS NULL
BEGIN
ALTER TABLE "UN_Notifications" ADD "Type" TINYINT CONSTRAINT "DF_Notifications_Type" DEFAULT ((0)) NOT NULL;

alter table UN_Notifications
alter column "RazorTemplate" NVARCHAR(MAX) NULL;

alter table UN_Notifications
alter column "CssTemplate" NVARCHAR(MAX) NULL;

alter table UN_Notifications
alter column "TitleExpression" VARCHAR(4000) NULL;

alter table UN_Notifications
alter column "RecipientMailBinding_Id" BIGINT NULL;

END
GO
