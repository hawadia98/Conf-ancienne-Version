#
param(
  [Parameter(Mandatory = $true)][string]$resultsFilePath,
  [Parameter(Mandatory = $true)][string]$ordersPath
)

. "$PSScriptRoot/Environment.ps1"
. "$runtimePath/Usercube-Visit-Orders.ps1"

function Fulfill-Powershell {
    param ([parameter(Mandatory = $true)] $order)

    $identifier = $order.Changes.Identifier
    $name = $order.Changes.Name
    $disabled = $order.Changes.Disabled

    if(!$identifier){
        $identifier = $order.Owner.EmployeeId
        if(!$identifier){
            throw "Identifier/EmployeeId cannot be null."
        }
    }
  
    if ($order.ChangeType -eq 'Added') {
        if(!$identifier){
            $disabled = 0
        }
        if(!$name){
            $name = 'NULL'
        }

        $UserSqlQuery= $("INSERT INTO TestAccessBadge(Identifier, Name, Disabled)
        VALUES ('$identifier', '$name', '$disabled');")
    }
    elseif ($order.ChangeType -eq 'Deleted') {
        $UserSqlQuery= $("DELETE FROM TestAccessBadge WHERE (Identifier='$identifier');")
    }
    elseif ($order.ChangeType -eq 'Modified')  {
        $UserSqlQuery = "UPDATE TestAccessBadge SET Disabled='$disabled'"
        if(!$name){
            $UserSqlQuery += ",Name='$name'"
        }
        $UserSqlQuery += " WHERE Identifier='$identifier';"
    } else {
        $artId = $order.AssignedResourceTypeId
        throw "Order changeType : $order.ChangeType  not recognized in assignedResourcetype:'$artId'"
    }
    $UserSqlQuery
    Execute-SqlQuery -sqlquery $UserSqlQuery | Format-Table         # use Format-Table for pretier listing
}
Create-Connection

Usercube-Visit-Orders $resultsFilePath $ordersPath Fulfill-Powershell

# 3 CLEANUP
$Connection.Close()
Remove-Variable -Scope Global -Name Connection
