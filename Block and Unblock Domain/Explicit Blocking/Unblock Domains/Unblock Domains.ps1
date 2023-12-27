param(
    [string[]]$domainsToUnblock
)

# Settings
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

foreach ($domainToUnblock in $domainsToUnblock) {
    # Removing all entries starting with "0.0.0.0 [domainName]"
    $newContent = (Get-Content $hostsFile) | Where-Object { $_ -notmatch "0.0.0.0\s+$domainToUnblock" }
    $newContent | Out-File -FilePath $hostsFile -Force
    Write-Output "Removed entry for blocking domain $domainToUnblock from the hosts file."
}

# Refresh the DNS cache after processing all domains
Clear-DnsClientCache

# Write Timestamp of execution:
Write-Output "Timestamp: $(Get-Date)`n"
