$branch = (git rev-parse --abbrev-ref HEAD)

Clear-Host
Write-Host "Fetching updates..."
Write-Host ""
Start-Sleep -Seconds 1

git fetch

$commitcount = (git log $branch..origin/$branch --oneline | Measure-Object).Count

if($commitcount -eq 0) {
    Clear-Host
    Write-Host "No update available..."
    pause
    exit
}else{
    Clear-Host
    Write-Host "The following updates are available:"
    Write-Host ""
    git log $branch..origin/$branch --oneline
    Write-Host ""
    Write-Host ""
    Write-Host "Update Fablicator Interface?"
    Write-Host ""
    Write-Host "'y' - Update Fablicator Interface"
    Write-Host "'n' - Don't update Fablicator Interface"

    do {
        $shouldupdate = Read-Host "Enter your choice"
        if($shouldupdate -match "y"){
            break
        }elseif ($shouldupdate -match "n") {
            exit
        }
    } while ($true)
}

Clear-Host
Write-Host "Applying updates..."
Write-Host ""
git pull origin $branch
git reset --hard origin/$branch

Clear-Host
Write-Host "Update complete..."
Write-Host ""
pause