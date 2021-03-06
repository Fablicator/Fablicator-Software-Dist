# Clone common software
& "$PSScriptRoot/clonecommon.ps1"

$dist_root = "$PSScriptRoot/../.."
$dist_repo = "https://github.com/Fablicator/Fablicator-Software-Dist.git"

# Clone KISSlicer

git clone --branch "kisslicer-sx" $dist_repo "$dist_root/KISSlicer"

# Setup KISSlicer defaults
& "$dist_root/KISSlicer/Scripts/ps/loaddefaults.ps1"

# Setup SX Marlin Calibration
Copy-Item -Path "$dist_root/Marlin/CalibrationDefaults/SX/Calibration.h" -Destination "$dist_root/Marlin/Marlin/Calibration.h"