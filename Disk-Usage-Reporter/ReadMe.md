# Disk Usage Report Script

## Overview
This PowerShell script connects to multiple remote servers via SSH using Plink, retrieves disk usage information, and saves the results to an output file.

## Script Variables

- `$plinkPath`: The path to the `Plink.exe` executable. Adjust this if Plink is installed in a different location.
- `$jsonFile`: The path to the JSON file containing server credentials and IP addresses.
- `$outputFile`: The name of the output file where the disk usage report will be saved.

## Functionality
1. **Load Server Credentials**: The script reads server details (username, password, and IP) from a specified JSON file.
2. **Check/Create Output File**: It checks if the output file exists. If it does not, it creates one; if it does, it clears the existing content.
3. **Generate Timestamp**: Adds a timestamp to the output file indicating when the report was generated.
4. **Execute Disk Usage Command**: For each server, it connects via SSH, executes the command to check disk usage (`df -h`), and captures the output.
5. **Format and Save Output**: The results are formatted for readability and appended to the output file.
6. **Display Results**: Optionally displays the results in the console.

## Example Usage

1. **Prepare the JSON File**: Create a JSON file named `servers.json` in the same directory as the script with the following structure:

    ```json
    [
        {
        "username": "your_username",
        "password": "your_password",
        "ip": "server_ip"
		},
		{
        "username": "another_user",
        "password": "another_password",
        "ip": "another_server_ip"
		}
    ]
    ```

2. **Run the Script**: Execute the PowerShell script in your terminal:

    ```powershell
    .\DiskUsage.ps1
    ```

3. **Check Output**: The results will be saved in a file named `diskUsageOutput.txt` in the same directory as the script. The output will include the disk usage information for each server, formatted for clarity.
