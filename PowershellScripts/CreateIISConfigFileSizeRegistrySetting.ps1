#
# CreateIISConfigFileSizeRegistrySetting.ps1
#
$propertyPath = 'HKLM\SOFTWARE\Microsoft\InetStp\Configuration'

if((Get-ItemProperty $propertyPath -ea 0).MaxWebConfigFileSizeInKB)
{
    Write-host 'Property already exists'
}
else
{
    Push-Location
    Set-Location HKLM:
    Write-host 'Creating property and default value'
    New-Item -Path .\SOFTWARE\Microsoft\InetStp -Name Configuration -Force
    New-Item -Path .\SOFTWARE\Microsoft\InetStp\Configuration -Name MaxWebConfigFileSizeInKB -Force
    Set-ItemProperty -Path .\SOFTWARE\Microsoft\InetStp\Configuration -Name MaxWebConfigFileSizeInKB -Value 1024
}


