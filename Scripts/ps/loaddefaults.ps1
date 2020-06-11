$printrun_conf_file = "$env:LOCALAPPDATA\Printrun\Printrun\printrunconf.ini"
Clear-Host
Write-Host "Load defaults for Fablicator Interface"
Write-Host ""
Write-Host "What kind of machine do you have?"
Write-Host ""
Write-Host "    'mx'    - Fablicator MX"
Write-Host "    'sx'    - Fablicator SX"
Write-Host "    'fm1'   - Fablicator FM-1"
Write-Host ""
do{ 
    $machine_type = Read-Host "Enter choice"
    if ($machine_type -match '(mx|sx|fm1)') {
        $default_config = "$PSScriptRoot\..\..\Configs\$machine_type\printrunconf.ini"
        if(Test-Path $printrun_conf_file) {
            Remove-Item $printrun_conf_file
            Copy-Item $default_config $printrun_conf_file
        }
        Write-Host "Defaults written!"
        Start-Sleep -Seconds 1
        break
    }
}while($true)