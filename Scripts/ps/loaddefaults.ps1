Remove-Item -Path "./_materials" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "./_printers" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "./_styles" -Recurse -erroraction 'silentlycontinue' -Force
Remove-Item -Path "./_supports" -Recurse -erroraction 'silentlycontinue' -Force

Copy-Item -Path "./defaults/*" -Destination "./" -Recurse