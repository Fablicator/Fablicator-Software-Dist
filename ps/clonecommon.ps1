$dist_repo = "https://github.com/Fablicator/Fablicator-Software-Dist.git"
$marlin_repo = "https://github.com/Fablicator/Marlin.git"

$dist_root = "$PSScriptRoot/../.."

git clone --branch "fablicator-1.1.x-stable" $marlin_repo "$dist_root/Marlin"
git clone --branch "fablicator-interface" $dist_repo "$dist_root/FablicatorInterface"