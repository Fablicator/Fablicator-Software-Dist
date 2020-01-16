@echo off

git clone --branch "fablicator-interface" "https://github.com/Fablicator/Fablicator-Software-Dist.git" ./FablicatorInterface
git clone --branch "kisslicer-sx" "https://github.com/Fablicator/Fablicator-Software-Dist.git" ./KISSlicer
git clone --branch "fablicator-fw-2.0-stable" "https://github.com/Fablicator/Marlin.git" ./SXFirmware

copy .\SXFirmware\CalibrationDefaults\SX\Cablibration.h .\SXFirmware\Marlin\Calibration.h