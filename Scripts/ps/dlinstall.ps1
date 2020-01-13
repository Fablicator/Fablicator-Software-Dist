Clear-Host

$url = "http://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_win64_1.6.3_release_unpacked.zip"
$dl_location = "./tmp/kiss.zip"
$version = "1_6_3"

if(!(Test-Path -Path "KISSlicer64.exe")) {
    $shouldupdate = $TRUE
}else{
    if(Test-Path -Path "$version.noupdate") {
        $shouldupdate = (Read-Host -Prompt "Redownload KISSlicer $version? (Enter 'Y' to update or 'N' to cancel) ") -eq "Y"
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

if(Test-Path -Path "KISSlicer64.exe") 
{
    Remove-Item -Path "KISSlicer64.exe"
}

Move-Item -Path "$unzip_location/KISSlicer64.exe" -Destination "./"

New-Item -Path "./" -Name "$version.noupdate" -ItemType "file" -Value " " > $null

Remove-Item "./tmp" -Recurse