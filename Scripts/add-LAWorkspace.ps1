[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    $WorkspaceID,
    [Parameter(Mandatory=$true)]
    $WorkspaceKey
)

try {
    $AgentConfig = New-Object -ComObject AgentConfigManager.MgmtSvcCfg -ErrorAction stop | out-null
    $AgentConfig.AddCloudWorkspace($WorkspaceID,$WorkspaceKey) | Out-Null
}
catch {

    throw "Could not add Workspace. Error: $($_.Exception.Message)"

}
