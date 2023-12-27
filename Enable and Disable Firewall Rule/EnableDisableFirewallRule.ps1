param(
    [string[]]$RuleNames,
    [int]$ActivityDuration = 600,      # Default is 10 minutes (600 seconds)
    [int]$InactivityDuration = 300     # Default is 5 minutes (300 seconds)
)

while ($true) {
    # Enabling rules
    foreach ($RuleName in $RuleNames) {
        Set-NetFirewallRule -DisplayName $RuleName -Enabled $true
        Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Rule $RuleName is now enabled."
    }

    # Waiting for activity duration
    Start-Sleep -Seconds $ActivityDuration

    # Disabling rules
    foreach ($RuleName in $RuleNames) {
        Set-NetFirewallRule -DisplayName $RuleName -Enabled $false
        Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Rule $RuleName is now disabled."
    }

    # Waiting for inactivity duration
    Start-Sleep -Seconds $InactivityDuration
}
