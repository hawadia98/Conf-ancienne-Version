<#
.SYNOPSIS
    Reconcilier en masse.

.DESCRIPTION
    Reconcilier en masse les ordres RH.
#>

$environmentPath = Split-Path $PSScriptRoot -Parent
. "$environmentPath/Environment.ps1"

try {
    $urlToken = $apiuri + "/connect/token"
    $body = @{
        grant_type = "client_credentials"
        scope = "usercube_api"
        client_id = $clientId
        client_secret = $clientSecret
    }

    $token = Invoke-RestMethod -Method Post -Uri $urlToken -Body $body -UseDefaultCredentials
}
catch {
    Write-Host "[ERREUR] Erreur lors de l'appel du web service d'init token : $($_.Exception.Message)"
    Exit 1
}

$htabParamWebRequestPost = @{
    Uri = ""
    Method = "POST"
    Headers = @{
        "Authorization" = "Bearer $($token.access_token)"
    }
    ContentType = "application/json"
    ErrorAction = "stop"
}

$url = $apiuri + '/api/ProvisioningPolicy/AssignedResourceType/BulkReconciliate/HR_LoadIUG?api-version=1.0'
$body = @{
    "AssignedResourceBinariesQuery" = "join Owner of type HR_LoadIUG Owner join Property Property join AssignedResourceType AssignedResourceType join AssignedResourceType.WorkflowInstance AssignedResourceTypeWorkflowInstance join AssignedResourceType.Role AssignedResourceTypeRole select ResourceFileHashCode,ResourceFileId,IsDenied,ProvisioningState,WorkflowState,Id,OwnerId,Owner.InternalDisplayName,Property.Identifier,Property.DisplayName,AssignedResourceTypeWorkflowInstance.Identifier,AssignedResourceType.WorkflowInstanceId,AssignedResourceTypeRole.FullName,AssignedResourceTypeRole.DisplayName,StartDate,EndDate,AssignedResourceType.OwnerId,AssignedResourceType.OwnerType,AssignedResourceType.WorkflowState,AssignedResourceType.ProvisioningState,Owner.EmployeeId where (((OwnerType=33 and (WorkflowState=1 or WorkflowState=3) and (AssignedResourceType.WorkflowState=16 or AssignedResourceType.WorkflowState=18) and AssignedResourceType.ProvisioningReviewFilter!=2 and AssignedResourceType.ProvisioningReviewFilter!=16)) AND (AssignedResourceType.ConsolidatedWorkflowFoundState=1 OR AssignedResourceType.ConsolidatedWorkflowFoundState=3) AND AssignedResourceType.IsInferred=false) order by Id asc"
    "AssignedResourceNavigationQuery" = "join Resource Resource join Owner of type HR_LoadIUG Owner join Property Property join AssignedResourceType AssignedResourceType join AssignedResourceType.WorkflowInstance AssignedResourceTypeWorkflowInstance join AssignedResourceType.Role AssignedResourceTypeRole select Resource.Id,IsDenied,ProvisioningState,WorkflowState,Id,OwnerId,Owner.InternalDisplayName,Property.Identifier,Property.DisplayName,AssignedResourceTypeWorkflowInstance.Identifier,AssignedResourceType.WorkflowInstanceId,AssignedResourceTypeRole.FullName,AssignedResourceTypeRole.DisplayName,StartDate,EndDate,AssignedResourceType.OwnerId,AssignedResourceType.OwnerType,AssignedResourceType.WorkflowState,AssignedResourceType.ProvisioningState,Owner.EmployeeId where (((OwnerType=33 and (WorkflowState=1 or WorkflowState=3) and (AssignedResourceType.WorkflowState=16 or AssignedResourceType.WorkflowState=18) and AssignedResourceType.ProvisioningReviewFilter!=2 and AssignedResourceType.ProvisioningReviewFilter!=16)) AND (AssignedResourceType.ConsolidatedWorkflowFoundState=1 OR AssignedResourceType.ConsolidatedWorkflowFoundState=3) AND AssignedResourceType.IsInferred=false) order by Id asc"
    "AssignedResourceScalarQuery" = "join Owner of type HR_LoadIUG Owner join Property Property join AssignedResourceType AssignedResourceType join AssignedResourceType.WorkflowInstance AssignedResourceTypeWorkflowInstance join AssignedResourceType.Role AssignedResourceTypeRole select Value,PolicyValue,WorkflowState,ProvisioningState,Id,OwnerId,Owner.InternalDisplayName,Property.Identifier,Property.DisplayName,AssignedResourceTypeWorkflowInstance.Identifier,AssignedResourceType.WorkflowInstanceId,AssignedResourceTypeRole.FullName,AssignedResourceTypeRole.DisplayName,StartDate,EndDate,AssignedResourceType.OwnerId,AssignedResourceType.OwnerType,AssignedResourceType.WorkflowState,AssignedResourceType.ProvisioningState,Owner.EmployeeId where (((OwnerType=33 and (WorkflowState=1 or WorkflowState=3) and (AssignedResourceType.WorkflowState=16 or AssignedResourceType.WorkflowState=18) and AssignedResourceType.ProvisioningReviewFilter!=2 and AssignedResourceType.ProvisioningReviewFilter!=16)) AND (AssignedResourceType.ConsolidatedWorkflowFoundState=1 OR AssignedResourceType.ConsolidatedWorkflowFoundState=3) AND AssignedResourceType.IsInferred=false) order by Id asc"
    "AssignedResourceTypesQuery" = "join Resource re join Role r join ParametersContext pc join Owner of type HR_LoadIUG Owner select Id, StartDate, EndDate, ProvisioningState, WorkflowState, IsDenied, RoleId, ResourceId, OwnerType, OwnerId, ConsolidatedProvisioningState, ConsolidatedWorkflowFoundState, ConsolidatedWorkflowFoundCount, ParametersContextId, re.InternalDisplayName, r.BlockProvisioning, r.FullName, r.TargetEntityTypeId, Owner.InternalDisplayName,pc.DisplayName where ((OwnerType=33 and (ProvisioningReviewFilter!=16 and ProvisioningReviewFilter!=2) and ResourceId != null) AND (ConsolidatedWorkflowFoundState=1 OR ConsolidatedWorkflowFoundState=3) AND IsInferred=false) order by Id asc"
    "BulkType" = 1
}

$htabParamWebRequestPost.Uri = $url
$htabParamWebRequestPost.Body = $body | ConvertTo-Json -Dept 3

try {
    Invoke-RestMethod @htabParamWebRequestPost
    Start-Sleep -Seconds 30
    Write-Host "[OK] Bulk reconciliation."
}
catch {
    Write-Host "[ERREUR] Erreur lors de l'appel du web service bulk reconciliation : $($_.Exception.Message)"
    Exit 1
}
