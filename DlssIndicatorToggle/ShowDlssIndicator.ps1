function DlssIndicatorToggle {

    $path = "HKLM:\SOFTWARE\NVIDIA Corporation\Global\NGXCore" 
    $name = "ShowDlssIndicator"

    if (!(Test-Path $path)) { Write-Host "Registry path not found." exit }

    $currentValue = Get-ItemProperty -Path $path -Name $name -ErrorAction SilentlyContinue

    if ($currentValue.$name -eq 1024) { Set-ItemProperty -Path $path -Name $name -Value 0 
    Write-Host "DLSS Indicator Disabled." } 

    else { Set-ItemProperty -Path $path -Name $name -Value 1024 
    Write-Host "DLSS Indicator Enabled." }

    $rerun = Read-Host "Toggle DLSS Indicator (y/n)?"
    if($rerun -eq "y") { DlssIndicatorToggle }

}

DlssIndicatorToggle