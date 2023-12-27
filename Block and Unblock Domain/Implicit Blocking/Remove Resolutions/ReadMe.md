# Remove Resolutions PowerShell Script

## Description
The Remove Resolutions PowerShell script is designed to remove custom IP address resolutions for specified domain names from the hosts file on a Windows system. After removal, DNS queries are sent to the DNS server to resolve the domain names to their respective IP addresses.

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
   - Execute the script with the domains to remove resolutions for as arguments. For example:
     ```powershell
     .\Remove-Resolutions.ps1 -resolutionsToRemove "example.com", "example.org"
     ```

## Parameters
- **resolutionsToRemove**: An array of domains for which custom resolutions should be removed. Provide the domains as arguments when running the script.

## Notes
- The script will remove all entries for the specified domains, allowing DNS queries to be sent to the DNS server for resolution.
- If you encounter permission errors while running the script, ensure that you have the necessary administrative privileges.
  - Open the PowerShell terminal as an administrator by right-clicking on PowerShell and selecting "Run as Administrator."
  - If necessary, you may need to adjust the execution policy to run scripts. Use the following command:
    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
    **Note:** Changing the execution policy should be done with caution and understanding the security implications.

## Example
Remove custom resolutions for "example.com" and "example.org":
```powershell
.\Remove-Resolutions.ps1 -resolutionsToRemove "example.com", "example.org"
