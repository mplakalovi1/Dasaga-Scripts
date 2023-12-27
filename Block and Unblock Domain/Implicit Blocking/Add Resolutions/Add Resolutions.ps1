param(
    [string[]]$resolutionsToAdd = @("192.168.1.1:example.com", "10.0.0.1:example.org")
)

# Settings
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

foreach ($resolution in $resolutionsToAdd) {
    $entryParts = $resolution -split ":", 2
    if ($entryParts.Count -eq 2) {
        $ipAddress = $entryParts[0].Trim()
        $domain = $entryParts[1].Trim()

        # Check if the domain already has resolution
        $existingEntry = Get-Content $hostsFile | Where-Object { $_ -match "\s+$domain" }

        if (-not $existingEntry) {
            # The domain does not have resolution, add an entry for resolution
            # Ensure that the new entry is added to the top
            $newEntry = "$ipAddress $domain"
            $hostsContent = Get-Content $hostsFile
            $newContent = @($newEntry) + $hostsContent
            $newContent | Out-File -FilePath $hostsFile -Force

            Write-Output "Added resolution $ipAddress for domain $domain to the hosts file."
        } else {
            Write-Output "The domain $domain already has resolution in the hosts file."
        }
    } else {
        Write-Output "Invalid entry format: $entry. Use the format [ip address]:[domain name]."
    }
}

# Refresh the DNS cache after processing all domains
Clear-DnsClientCache

# Write Timestamp of execution:
Write-Output "Timestamp: $(Get-Date)`n"
