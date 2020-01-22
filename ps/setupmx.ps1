$dist_root = "$PSScriptRoot/../.."
$dist_repo = "https://github.com/Fablicator/Fablicator-Software-Dist.git"

# Clone KISSlicer

git clone --branch "kisslicer-mx" $dist_repo "$dist_root/KISSlicer"

# Setup KISSlicer defaults
"$dist_root/KISSlicer/Scripts/ps/loaddefaults.ps1"