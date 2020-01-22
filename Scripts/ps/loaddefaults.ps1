<<<<<<< HEAD
Remove-Item -Path "./_materials" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "./_printers" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "./_styles" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "./_supports" -Recurse -erroraction 'silentlycontinue' -Force
=======
$kiss_root = "$PSScriptRoot/../.."
$defaults_folder = "$kiss_root/defaults"
>>>>>>> a99d4ab... Made script paths explicit

Remove-Item -Path "$kiss_root/_materials" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "$kiss_root/_printers" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "$kiss_root/_styles" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "$kiss_root/_supports" -Recurse -erroraction 'silentlycontinue' -Force

Copy-Item -Path "$defaults_folder/*" -Destination "$kiss_root/" -Recurse
