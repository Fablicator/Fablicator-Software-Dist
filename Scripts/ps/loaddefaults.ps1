Remove-Item -Path "./_materials" -Recurse -erroraction 'silentlycontinue' 
Remove-Item -Path "./_printers" -Recurse -erroraction 'silentlycontinue' 
Remove-Item -Path "./_styles" -Recurse -erroraction 'silentlycontinue' 
Remove-Item -Path "./_supports" -Recurse -erroraction 'silentlycontinue'

Copy-Item -Path "./defaults/*" -Destination "./" -Recurse