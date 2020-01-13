try {
    Remove-Item -Path "./_materials" -Recurse > $null 
    Remove-Item -Path "./_printers" -Recurse > $null 
    Remove-Item -Path "./_styles" -Recurse > $null 
    Remove-Item -Path "./_supports" -Recurse > $null 
}catch{}

Copy-Item -Path "./defaults/*" -Destination "./" -Recurse