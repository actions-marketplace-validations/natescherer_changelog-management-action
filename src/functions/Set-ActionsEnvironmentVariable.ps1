function Set-ActionsEnvironmentVariable {
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true)]
        [string]$Name,
        [parameter(Mandatory = $true)]
        [string]$Value
    )

    Set-Variable -Name "env:$Name" -Value $Value

    Out-File -InputObject "$Name=$Value" -FilePath $env:GITHUB_ENV -Encoding utf-8 -Append
}