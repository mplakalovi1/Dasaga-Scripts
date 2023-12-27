param(
    [string[]]$domainsToBlock
)

# Settings
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

foreach ($blockedDomain in $domainsToBlock) {
    # Check if the domain is already blocked
    $existingEntry = Get-Content $hostsFile | Where-Object { $_ -match "0.0.0.0\s+$blockedDomain" }

    if ($existingEntry) {
        # The domain is already blocked:
        Write-Output "The domain $blockedDomain is already blocked in the hosts file."
    } else {
        # The domain is not blocked, add an entry for blocking
        # Ensure that the new entry is added to the top
        $newEntry = "0.0.0.0 $blockedDomain"
        $newContent = @($newEntry) + (Get-Content $hostsFile)
        $newContent | Out-File -FilePath $hostsFile -Force

        Write-Output "The domain $blockedDomain has been added to the top of the hosts file for blocking."
    }
}

# Refresh the DNS cache after processing all domains
Clear-DnsClientCache

# Write Timestamp of execution:
Write-Output "Timestamp: $(Get-Date)`n"
