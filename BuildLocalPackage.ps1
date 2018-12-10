<#
This assumes you have built the Class Library project in Release/AnyCPU, and that MSBuild
is somewhere nuget can find it.

#>

Set-Location $PSScriptRoot
$Error.Clear()
$ErrorActionPreference = 'Stop'

$fullFilePath = "$PSScriptRoot\ClassLibrary\ClassLibrary.nuspec"
$buildConfiguration = "Release"
$projectBuildPlatform = "AnyCPU"
$packageOutputFolderPath = "$PSScriptRoot\localPackageFeed"

if (-Not(Test-Path $packageOutputFolderPath))
{
    New-Item -Path $packageOutputFolderPath -ItemType Directory | Out-Null
}

$ft = (Get-Date).ToFileTime().ToString()
$versionBuild = $ft.Substring(0,9)
$versionRev = $ft.Substring(9)
$versionToUse = "0.1.$versionBuild.$versionRev"


nuget.exe  pack  $fullFilePath  $additionalArgs -Version $versionToUse `
		-Prop "Configuration=$buildConfiguration;Platform=`"$projectBuildPlatform`"" `
		-OutputDirectory $packageOutputFolderPath -Verbosity detailed