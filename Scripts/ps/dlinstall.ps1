Clear-Host

$url = "Direct DL URL"
$dl_location = "./tmp/program.zip"
$version = "version"

if(!(Test-Path -Path "program.exe")) {
    $shouldupdate = $TRUE
}else{
    if(Test-Path -Path "$version.noupdate") {
        $shouldupdate = (Read-Host -Prompt "Redownload program $version? (Enter 'Y' to update or 'N' to cancel) ") -eq "Y"
    }else{
        $shouldupdate = $TRUE
    }
}

if(!($shouldupdate))
{
    exit
}

mkdir ./tmp > $null

Invoke-WebRequest -Uri $url -OutFile $dl_location

$unzip_location = "./tmp"

Expand-Archive -Path $dl_location -DestinationPath $unzip_location

if(Test-Path -Path "program.exe") 
{
    Remove-Item -Path "program.exe"
}

Move-Item -Path "$unzip_location/program.exe" -Destination "./"

New-Item -Path "./" -Name "$version.noupdate" -ItemType "file" -Value " " > $null

Remove-Item "./tmp" -Recurse