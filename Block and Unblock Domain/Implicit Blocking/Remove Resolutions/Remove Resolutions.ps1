param(
    [string[]]$resolutionsToRemove
)

# Settings
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

foreach ($resolutionToRemove in $resolutionsToRemove) {
    $domain = $resolutionToRemove.Trim()

    # Remove all entries for the specified domain
    $newContent = Get-Content $hostsFile | Where-Object { $_ -notmatch "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\s+$domain" }
    $newContent | Out-File -FilePath $hostsFile -Force

    Write-Output "Removed resolution for domain $domain from the hosts file."
}

# Refresh the DNS cache after processing all domains
Clear-DnsClientCache

# Write Timestamp of execution:
Write-Output "Timestamp: $(Get-Date)`n"