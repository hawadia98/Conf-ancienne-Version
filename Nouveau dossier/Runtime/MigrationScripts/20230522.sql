UPDATE "UM_Settings"
SET C1 = '{"RolePolicyNotification":true,"ProvisioningReviewNotification":true,"AccessCertificationNotification":true,"ManualProvisioningNotification":false,"RoleReviewNotification":true}'
WHERE Identifier = 'MailSettings' AND C1 = 'false'
GO

UPDATE "UM_Settings"
SET C1 = '{"RolePolicyNotification":true,"ProvisioningReviewNotification":true,"AccessCertificationNotification":true,"ManualProvisioningNotification":true,"RoleReviewNotification":true}'
WHERE Identifier = 'MailSettings' AND C1 = 'true'
GO
