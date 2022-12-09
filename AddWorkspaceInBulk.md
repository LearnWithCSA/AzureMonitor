# Add Workspace to Log Analtics Agent in Bulk

In case you need to add log analytic worksapce to MMA agents in bulk you can use the following method. 

>Requirements: You need Az Powershell installed.

1. Download the script from ./Scripts/Add-LaWorkspace.ps1 to a local path. Example 'c:\scripts\Add-LAWorkspace.ps1'
2. Set the variables below and run the following

    ```PowerShell
    # please set below first.
    $TenantID = 'TenantID'
    $SubscriptionID = 'SubscriptionID'
    $WorkspaceID = 'your WorkspaceID'
    $WorkspaceKey = 'your WorkspaceKey'
    $ResourceGroupName = 'my resource GROUP'
    # Path to AddWWorksapce script
    $ScriptPAth = 'c:\scripts\Add-LAWorkspace.ps1'
    Connect-AzAccount -Tenant $TenantID | out-null
    Set-Azcontext -Subscription $SubscriptionID | out-null

    $AllAvailableVms = Get-AzVM -Status | where {$_.PowerState -eq 'VM running'}
    $ParametersHash = @{WorkspaceID = $WorkspaceID;WorkspaceKey = $WorkspaceKey}
    $AllAvailableVms | Invoke-AzVMRunCommand -ResourceGroupName $ResourceGroupName  -CommandId 'RunPowerShellScript' -ScriptPath $ScriptPath -Parameter $ParametersHash
    ```