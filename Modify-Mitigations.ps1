#Requires -RunAsAdministrator
<#
    .SYNOPSIS
    By default, disables Mandatory ASLR for the 'Git for Windows' applications from https://git-scm.com
#>
param (
    [string]$Directory = 'C:\Program Files\Git\',
    [string]$Filter = '*.exe'
)

function Get-ExecutablesList {
    [OutputType([System.Object])]
    param (
        [string]$Path,
        [string]$Filter
    )
    Get-ChildItem -Path $Path -Filter "$Filter" -Recurse | Select-Object -ExpandProperty FullName
}

function Set-MandatoryASLRProperty {
    param (
        [System.Object]$ExecutablesList
    )
    foreach ($file in $ExecutablesList) {
        Set-ProcessMitigation -Name "$file" -Disable ForceRelocateImages
    }
}

Set-MandatoryASLRProperty -ExecutablesList (Get-ExecutablesList -Path $Directory -Filter $Filter)
