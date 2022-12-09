[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    $WorkspaceID,
    [Parameter(Mandatory=$true)]
    $WorkspaceKey
)
AgentConfigManager.MgmtSvcCfg
AgentConfigManager.MgmtSvcCfg
try {
    $AgentConfig = New-Object -ComObject AgentConfigManager.MgmtSvcCfg -ErrorAction stop
    $AgentConfig.AddCloudWorkspace($WorkspaceID,$WorkspaceKey) | Out-Null
    
}
catch {

    throw "Could not add Workspace. Error: $($_.Exception.Message)"

}
