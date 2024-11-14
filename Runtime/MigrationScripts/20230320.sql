BEGIN
    DECLARE @NextId bigint
    SET @NextId = COALESCE((SELECT MAX("Id") FROM "UN_NotificationTemplates"), 0) + 1

    INSERT INTO "UN_NotificationTemplates" ("Id", "Identifier", "SubjectTemplate_L1", "BodyTemplate_L1", "SubjectTemplate_L2", "BodyTemplate_L2")
    SELECT
        @NextId,
        'PerformManualProvisioningSummary',
        'You have pending resources to manually provision
',
        '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications

@model PerformManualProvisioningSummary
<div>
  <div style="font-family:''Segoe UI'',''-apple-system'',''BlinkMacSystemFont'',''Roboto'',''Arial'',sans-serif; color:#212121; font-size:14px; background:#f8f8f8">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td class="x_mobile-hide" style="background-color:white; border-bottom:solid #eaeaea 1px">
          </td>
          <td class="x_content" width="640" style="padding:0px; max-width:640px; background-color:white; border-bottom:solid #eaeaea 1px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody>
                <tr>
                  <td style="padding:20px 24px 25px 24px; background:white">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="x_responsive-table">
                      <tbody>
                        <tr>
                          <td>
                            <table border="0" cellpadding="0" cellspacing="0" class="x_logo" width="100%">
                              <tbody>
                                <tr>
                                  <td valign="middle" style="vertical-align:middle">
                                    <img data-imagetype="External" src="@Model.ApplicationUrl/logo.png" height="34" width="133">
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="x_hero" style="padding:0px 24px">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="x_responsive-table" style="max-width:592px">
                      <tbody>
                        <tr>
                          <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody>
                                <tr>
                                  <td>
                                    <!-- HEADER START -->
                                    <table>
                                      <tbody>
                                        <tr>
                                          <td class="x_title" style="padding:0 0 24px 0; color:#212121; font-size:28px; font-weight:bold; letter-spacing:-0.04em; line-height:40px; word-break:break-word">
                                            Perform Manual Provisioning Summary
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="x_message" style="padding:0 0 24px 0">
                                            <div>
                                              <p>Hello,</p>
                                              <p>You have pending resources to provision manually</p>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td style="padding:0 0 24px 0">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tbody>
                                                <tr>
                                                  <td>
                                                    <table border="0" cellspacing="0" cellpadding="0">
                                                      <tbody>
                                                        <tr>
                                                          <td align="center" bgcolor="#007acc" style="padding:8px 12px; border-radius:2px">
                                                            <a href="@Model.ApplicationUrl/provisioning/manual-provisioning?entityTypeId=@Model.EntityTypeId.Id" target="_blank" rel="noopener noreferrer" data-auth="NotApplicable" class="x_mobile-button x_btn-primary" style="font-weight:500; font-size:14px; text-decoration:none; padding:0px; display:inline-block; color:#ffffff">
                                                              Perform Manual Provisioning
                                                            </a>
                                                          </td>
                                                        </tr>
                                                      </tbody>
                                                    </table>
                                                  </td>
                                                </tr>
                                              </tbody>
                                            </table>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                    <!-- HEADER END -->
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <td class="x_mobile-hide" style="background-color:white; border-bottom:solid #eaeaea 1px">
          </td>
        </tr>
        <tr>
          <td class="x_mobile-hide" style="background:#f8f8f8"></td>
          <td class="x_content" width="640" style="padding:0px; max-width:640px; background:#f8f8f8">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody>
                <tr>
                  <td style="padding:24px 24px 8px 24px; max-width:592px">
                    <table border="0" width="100%" cellpadding="0" cellspacing="0" class="x_responsive-table" style="vertical-align:middle; background-color:white">
                      <tbody>
                        <tr>
                          <td style="padding:16px 24px 24px 24px">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody>
                                <tr>
                                  <!-- BODY START -->
                                  <div style="font-family:''Segoe UI'';font-size:14px;font-weight:400;color:rgb(51,51,51);">
                                    <div style="margin-bottom:20px;">
                                      @if (Model.AssignedResourceTypes.Any())
                                      {
                                        <div style="font-size:21px;font-weight:600;color:rgb(51,51,51);margin-top:20px;">Resource Types</div>
                                        <table border="0" style="width: 100%;">
                                          <thead>
                                            <tr>
                                              <th align="left" style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(51,51,51)">Resource</th>
                                              <th align="left" style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(51,51,51)">Owner</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            @foreach (var assignedItem in Model.AssignedResourceTypes)
                                            {
                                              <tr>
                                                <td style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(102,102,102)">@assignedItem.DisplayName</td>
                                                <td style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(102,102,102)"><span>@assignedItem.Owner.FullName</span></td>
                                              </tr>
                                            }
                                          </tbody>
                                        </table>
                                      }
                                    </div>
                                  </div>
                                  <!-- BODY END -->
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td style="padding:24px 24px 24px 24px">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="x_responsive-table">
                      <tbody>
                        <tr>
                          <td style="color:#666666; font-size:12px; line-height:18px">
                            This email is automatically generated by Usercube. Please do not reply.
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <td class="x_mobile-hide" style="background:#f8f8f8"></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
',
        'Vous avez des ressources en attente de provisioning manuel
',
        '@using Usercube.Fulfill.ProvisioningOrders.UpdateFulfillmentState.Impl.Notifications

@model PerformManualProvisioningSummary
<div>
  <div style="font-family:''Segoe UI'',''-apple-system'',''BlinkMacSystemFont'',''Roboto'',''Arial'',sans-serif; color:#212121; font-size:14px; background:#f8f8f8">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td class="x_mobile-hide" style="background-color:white; border-bottom:solid #eaeaea 1px">
          </td>
          <td class="x_content" width="640" style="padding:0px; max-width:640px; background-color:white; border-bottom:solid #eaeaea 1px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody>
                <tr>
                  <td style="padding:20px 24px 25px 24px; background:white">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="x_responsive-table">
                      <tbody>
                        <tr>
                          <td>
                            <table border="0" cellpadding="0" cellspacing="0" class="x_logo" width="100%">
                              <tbody>
                                <tr>
                                  <td valign="middle" style="vertical-align:middle">
                                    <img data-imagetype="External" src="@Model.ApplicationUrl/logo.png" height="34" width="133">
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="x_hero" style="padding:0px 24px">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="x_responsive-table" style="max-width:592px">
                      <tbody>
                        <tr>
                          <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody>
                                <tr>
                                  <td>
                                    <!-- HEADER START -->
                                    <table>
                                      <tbody>
                                        <tr>
                                          <td class="x_title" style="padding:0 0 24px 0; color:#212121; font-size:28px; font-weight:bold; letter-spacing:-0.04em; line-height:40px; word-break:break-word">
                                            Provisioning Manuel
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="x_message" style="padding:0 0 24px 0">
                                            <div>
                                              <p>Bonjour,</p>
                                              <p>Vous avez des ressources en attente de provisioning manuel</p>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td style="padding:0 0 24px 0">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tbody>
                                                <tr>
                                                  <td>
                                                    <table border="0" cellspacing="0" cellpadding="0">
                                                      <tbody>
                                                        <tr>
                                                          <td align="center" bgcolor="#007acc" style="padding:8px 12px; border-radius:2px">
                                                            <a href="@Model.ApplicationUrl/provisioning/manual-provisioning?entityTypeId=@Model.EntityTypeId.Id" target="_blank" rel="noopener noreferrer" data-auth="NotApplicable" class="x_mobile-button x_btn-primary" style="font-weight:500; font-size:14px; text-decoration:none; padding:0px; display:inline-block; color:#ffffff">
                                                              Provisioning Manuel
                                                            </a>
                                                          </td>
                                                        </tr>
                                                      </tbody>
                                                    </table>
                                                  </td>
                                                </tr>
                                              </tbody>
                                            </table>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                    <!-- HEADER END -->
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <td class="x_mobile-hide" style="background-color:white; border-bottom:solid #eaeaea 1px">
          </td>
        </tr>
        <tr>
          <td class="x_mobile-hide" style="background:#f8f8f8"></td>
          <td class="x_content" width="640" style="padding:0px; max-width:640px; background:#f8f8f8">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody>
                <tr>
                  <td style="padding:24px 24px 8px 24px; max-width:592px">
                    <table border="0" width="100%" cellpadding="0" cellspacing="0" class="x_responsive-table" style="vertical-align:middle; background-color:white">
                      <tbody>
                        <tr>
                          <td style="padding:16px 24px 24px 24px">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody>
                                <tr>
                                  <!-- BODY START -->
                                  <div style="font-family:''Segoe UI'';font-size:14px;font-weight:400;color:rgb(51,51,51);">
                                    <div style="margin-bottom:20px;">
                                      @if (Model.AssignedResourceTypes.Any())
                                      {
                                      <div style="font-size:21px;font-weight:600;color:rgb(51,51,51);margin-top:20px;">Types de Ressources</div>
                                        <table border="0" style="width: 100%;">
                                          <thead>
                                            <tr>
                                              <th align="left" style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(51,51,51)">Ressource</th>
                                              <th align="left" style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(51,51,51)">Bénéficiaire</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            @foreach (var assignedItem in Model.AssignedResourceTypes)
                                            {
                                              <tr>
                                                <td style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(102,102,102)">@assignedItem.DisplayName</td>
                                                <td style="padding: 10px;text-align: left;border-bottom: 1px solid #ddd;font-size:12px;font-weight:400;color:rgb(102,102,102)"><span>@assignedItem.Owner.FullName</span></td>
                                              </tr>
                                            }
                                          </tbody>
                                        </table>
                                      }
                                    </div>
                                  </div>
                                  <!-- BODY END -->
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td style="padding:24px 24px 24px 24px">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="x_responsive-table">
                      <tbody>
                        <tr>
                          <td style="color:#666666; font-size:12px; line-height:18px">
                            Ce message a été généré automatiquement par Usercube. Merci de ne pas y répondre.
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <td class="x_mobile-hide" style="background:#f8f8f8"></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
'
    WHERE NOT EXISTS (
        SELECT 1 FROM "UN_NotificationTemplates" WITH (UPDLOCK)
        WHERE "Identifier" = 'PerformManualProvisioningSummary'
        )
END
GO
