BEGIN
UPDATE UN_NotificationTemplates
SET
    BodyTemplate_L1 = REPLACE(BodyTemplate_L1, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L2 = REPLACE(BodyTemplate_L2, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L3 = REPLACE(BodyTemplate_L3, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L4 = REPLACE(BodyTemplate_L4, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L5 = REPLACE(BodyTemplate_L5, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L6 = REPLACE(BodyTemplate_L6, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L7 = REPLACE(BodyTemplate_L7, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L8 = REPLACE(BodyTemplate_L8, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L9 = REPLACE(BodyTemplate_L9, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L10 = REPLACE(BodyTemplate_L10, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L11 = REPLACE(BodyTemplate_L11, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L12 = REPLACE(BodyTemplate_L12, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L13 = REPLACE(BodyTemplate_L13, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L14 = REPLACE(BodyTemplate_L14, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L15 = REPLACE(BodyTemplate_L15, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    BodyTemplate_L16 = REPLACE(BodyTemplate_L16, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L1 = REPLACE(SubjectTemplate_L1, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L2 = REPLACE(SubjectTemplate_L2, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L3 = REPLACE(SubjectTemplate_L3, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L4 = REPLACE(SubjectTemplate_L4, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L5 = REPLACE(SubjectTemplate_L5, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L6 = REPLACE(SubjectTemplate_L6, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L7 = REPLACE(SubjectTemplate_L7, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L8 = REPLACE(SubjectTemplate_L8, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L9 = REPLACE(SubjectTemplate_L9, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L10 = REPLACE(SubjectTemplate_L10, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L11 = REPLACE(SubjectTemplate_L11, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L12 = REPLACE(SubjectTemplate_L12, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L13 = REPLACE(SubjectTemplate_L13, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L14 = REPLACE(SubjectTemplate_L14, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L15 = REPLACE(SubjectTemplate_L15, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api'),
    SubjectTemplate_L16 = REPLACE(SubjectTemplate_L16, '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications', '@using Usercube.Notifications.ManualProvisioning.Api')
WHERE Identifier = 'PerformManualProvisioningSummary'
END
GO
