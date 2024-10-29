# Path to Plink.exe
$plinkPath = "C:\Program Files\PuTTY\plink.exe"  # Adjust the path if different

# Path to the JSON file (in the same folder as the script)
$jsonFile = ".\servers.json"  # Adjust the path if necessary

# Output file
$outputFile = "diskUsageOutput.txt"

# Check if the output file exists; if not, create it
if (-not (Test-Path $outputFile)) {
    New-Item -Path $outputFile -ItemType File | Out-Null
} else {
    # If the file exists, clear its content
    Clear-Content -Path $outputFile
}

# Add a timestamp to the output file
Add-Content -Path $outputFile -Value "Disk usage report generated on: $(Get-Date)`n"

# Load servers from the JSON file
$servers = Get-Content $jsonFile | ConvertFrom-Json

foreach ($server in $servers) {
    # Extract the details
    $username = $server.username
    $password = $server.password
    $serverIP = $server.ip
	
    # Execute the command on the server and capture the output
    $output = & $plinkPath -no-antispoof -ssh "$username@$serverIP" -pw $password "df -h" | Out-String -Stream

    # Format the output for better readability
    $formattedOutput = $output -join "`n"

    # Append the results to the output file
    Add-Content -Path $outputFile -Value "Disk usage for ${serverIP}:`n$formattedOutput`n"
    
    # Optionally, display the results in the console
    Write-Host "Disk usage for ${serverIP}:"
    Write-Host $formattedOutput`n
}

Write-Host "Results saved to $outputFile"
