# Script Name: Block-Unblock Loop.ps1

# Settings
$blockScriptPath = "C:\GIT\PowerShell Scripts\Block and Unblock Domain\Explicit Blocking\Block Domains\Block Domains.ps1"
$unblockScriptPath = "C:\GIT\PowerShell Scripts\Block and Unblock Domain\Explicit Blocking\Unblock Domains\Unblock Domains.ps1"
$blockIntervalSeconds = 60
$unblockIntervalSeconds = 30

# Function to execute a script
function Execute-Script($scriptPath) {
    try {
        & $scriptPath
    } catch {
        Write-Output "Error executing script: $_"
    }
}

# Function to write timestamped messages
function Write-Timestamped-Output($message) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Output "$timestamp - $message"
}

# Main loop
while ($true) {
    # Blocking domains
    Write-Timestamped-Output "Blocking domains for $blockIntervalSeconds seconds..."
    Execute-Script $blockScriptPath

    # Waiting for the block interval
    Write-Timestamped-Output "Waiting for $blockIntervalSeconds seconds...`n"
    Start-Sleep -Seconds $blockIntervalSeconds

    # Unblocking domains
    Write-Timestamped-Output "Unblocking domains for $unblockIntervalSeconds seconds..."
    Execute-Script $unblockScriptPath

    # Waiting for the unblock interval
    Write-Timestamped-Output "Waiting for $unblockIntervalSeconds seconds...`n"
    Start-Sleep -Seconds $unblockIntervalSeconds
}
