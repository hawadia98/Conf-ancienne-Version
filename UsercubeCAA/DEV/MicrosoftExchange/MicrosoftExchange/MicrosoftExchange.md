+++
Version = 1.0
Connector = Microsoft Exchange
Disposable = false

+++

## Prerequisite

### For both Export and Fulfillment

Read the documentation `/integration-guide/references/connectors/microsoftexchange/` and `/integration-guide/references/connectors/powershell/`, then fill the settings:

```json
"MicrosoftExchangeExportFulfillment": {
      // Export settings
      "AuthType": "Basic",
      "Server": "http://.../powershell",
      "Login": "...",
      "Password": "...",
      // Fulfillment settings
      "PowerShellScriptPath": "C:/UsercubeDemo/Scripts/Fulfill-Exchange.ps1",
      "Options": {
        "AuthType": "Basic",
        "Server": "http://.../powershell",
        "Login": "...",
        "Password": "...",
      }
    },
```

In `Conf/Jobs/Jobs.xml` add <NotUsed ConnectorIdentifier="MicrosoftExchange"/> and <NotUsed ConnectorIdentifier="ADMicrosoftExchange"/> in the scaffolded jobs to avoid conflict with this new connector.

This configuration has been tested on a laptop with 16Go Ram:
- Usercube is installed on premise in UsercubeDemo.
- An Active Directory is installed on Hyper-V in a Windows 2016 VM called AD-SERVER (1Go Ram).
- A Microsoft Exchange 2016 is installed on Hyper-V in a Windows 2016 VM called EX-SERVER1 (7Go Ram).

Check the tutorial https://dev.azure.com/usercube/UsercubeRD/_wiki/wikis/UsercubeRD.wiki/425/Local-environment-for-testing to install these environments.

Microsoft Exchange connection:
- Kerberos -> only Server Address is required
- Basic -> Login, Password and Server Address are required

### For Export

PowerShell script `Export-Exchange.ps1` is required in the `Runtime` folder, it must **not** be modified.

`Usercube-Encrypt-File.exe` is required in the `Runtime` folder.

### For Fulfillment

Fulfill-PowerShell is required in `Runtime` -> `Usercube-Fulfill-PowerShell.exe` **and** `Usercube-Visit-Orders.ps1`.

PowerShell script `Fulfill-Exchange.ps1` is required in the folder `Scripts` -> `C:/UsercubeDemo/Scripts/Fulfill-Exchange.ps1`, it must **not** be modified.

`ADMicrosoftExchange` configuration is required.

To create a mailbox, an `AD entry` is required => Microsoft Exchange API copies the AD entry properties into the new mailbox (it needs an identifier, in our script the `SamAccountName` is used).

Fill the following settings, the password reset is very important. If AuthType is `Kerberos` then it works but if it's `Basic` make sure to use `SSL` with the Active Directory (activate SSL on the AD, import the certificate, EnableSSL -> true in the settings).

```json
"ADMicrosoftExchangeExportFulfillment": {
      "Server": "...",
      "BaseDN": "...",
      "AuthType": "Basic",
      "Login": "...",
      "Password": "...",
      "Filter": "(objectclass=*)",
      "EnableSSL": true
    }
```

In `MicrosoftExchange/ADMicrosoftExchange/Directory User Role Model ADMicrosoftExchange.xml` correct the **QueryRule**:
```xml
<ResourceType Identifier="MicrosoftExchange_Mailbox_NominativeUser" DisplayName_L1="Microsoft Exchange Mailbox (nominative)" DisplayName_L2="Boite Microsoft Exchange (nominative)" Policy="Default" TargetEntityType="MicrosoftExchange_Mailbox" Category="MicrosoftExchange" SourceEntityType="Directory_User" ApprovalWorkflowType="One" MaximumUpdatePercent="100" MaximumInsertPercent="100">
    ...
    <QueryRule Property="parentdn" Policy="Default" TargetBinding="ADMicrosoftExchange_Entry:dn" SourceExpression="C#:person: return &quot;CN=Users,DC=pixelabs,DC=lan&quot;;" TargetMatchedConfidenceLevel="100" />
    ...
</ResourceType>
```
with the correct **SourceExpression** corresponding to your AD.

There are single roles to create mailboxes on a specific database. To use them:
- launch a complete synchronization with no provisioning order.
- set the Resource (Microsoft Exchange Database (entity type) **ID** got from previous synchronization) and the **SingleRole** as below
```xml
<ResourceType Identifier="MicrosoftExchange_Mailbox_NominativeUser" DisplayName_L1="Microsoft Exchange Mailbox (nominative)" DisplayName_L2="Boite Microsoft Exchange (nominative)" Policy="Default" TargetEntityType="MicrosoftExchange_Mailbox" Category="MicrosoftExchange" SourceEntityType="Directory_User" ApprovalWorkflowType="One" MaximumUpdatePercent="100" MaximumInsertPercent="100">
    ...
    <NavigationRule Property="Database" Resource="9c512155-d912-4fcb-9448-0755fbaf1b96" SingleRole="BDD1" />
    ...
</ResourceType>

...

<SingleRole Identifier="BDD1" DisplayName_L1="BDD1" DisplayName_L2="BDD1" Category="MicrosoftExchange" ApprovalWorkflowType="One" EntityType="Directory_User" Policy="Default" />
```
- Deploy the configuration with the new single roles

## Functionalities

New connector Microsoft Exchange:
- Complete and Incremental
- Export databases and mailboxes
- Basic and Kerberos authentication
- File encryption supported
- Create, Delete and Update Mailboxes
- Change mailbox database, affect proxy address to a mailbox

## Tasks behavior

No special behavior.

## Affected parts

No affected parts.

## Test

####  1) Jobs

 - Launch '**01: Microsoft Exchange - Synchronization Complete (scaffolding)**', all the mailboxes and databases are exported.
 - Launch '**01: Microsoft Exchange - Synchronization Incremental (scaffolding)**', mailboxes and databases created/updated after the cookie date time are exported.
