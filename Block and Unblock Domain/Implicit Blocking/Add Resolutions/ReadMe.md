# Add Resolutions PowerShell Script

## Description
The Add Resolutions PowerShell script is designed to add custom IP address resolutions for specified domain names in the hosts file on a Windows system. This script is useful for creating custom DNS resolutions, particularly for testing.

## Usage
1. **Clone or Download the Repository:**
   - Clone the repository.
   - Or download the repository as a ZIP file and extract it to your local machine.

2. **Navigate to the Script's Directory:**
   - Open a PowerShell terminal.
   - Change the directory to where the script is located:
     ```powershell
     cd path\to\repository
     ```

3. **Run the Script:**
   - Execute the script with the desired IP address and domain pairs as arguments. For example:
     ```powershell
     .\Add-Resolutions.ps1 -resolutionsToAdd "192.168.1.1:example.com", "10.0.0.1:example.org"
     ```

## Parameters
- **resolutionsToAdd**: An array of IP address and domain pairs to be added as custom resolutions. Provide the pairs as arguments when running the script.

## Notes
- The script will check if each domain already has the exact specified resolution before adding it to the hosts file.
- If you encounter permission errors while running the script, ensure that you have the necessary administrative privileges.
  - Open the PowerShell terminal as an administrator by right-clicking on PowerShell and selecting "Run as Administrator."
  - If necessary, you may need to adjust the execution policy to run scripts. Use the following command:
    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
    **Note:** Changing the execution policy should be done with caution and understanding the security implications.

## Example
Add custom resolutions for "example.com" and "example.org":
```powershell
.\Add-Resolutions.ps1 -resolutionsToAdd "192.168.1.1:example.com", "10.0.0.1:example.org"
