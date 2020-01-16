@echo off

git clone --branch "fablicator-interface" "https://github.com/Fablicator/Fablicator-Software-Dist.git" ./FablicatorInterface
git clone --branch "kisslicer-mx" "https://github.com/Fablicator/Fablicator-Software-Dist.git" ./KISSlicer
git clone --branch "fablicator-fw-2.0-stable" "https://github.com/Fablicator/Marlin.git" ./MXFirmware

copy .\MXFirmware\CalibrationDefaults\MX\Cablibration.h .\MXFirmware\Marlin\Calibration.h