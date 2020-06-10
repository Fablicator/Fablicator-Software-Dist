$branch = "kisslicer-mx"

Clear-Host

git fetch

$commitcount = (git log $branch..origin/$branch --oneline | Measure-Object).Count

if($commitcount -eq 0) {
    Clear-Host
    "No update available..."
    pause
    exit
}else{
    Clear-Host
    "The following updates are available:"
    git log $branch..origin/$branch --oneline

    $shouldupdate = Read-Host -Prompt "Would you like to update? (Enter 'Y' to update or 'N' to cancel) "
    
    if($shouldupdate -ne "Y") {
        exit
    }
}

Clear-Host
"Updating software..."
git pull origin $branch
git reset --hard origin/$branch

Clear-Host