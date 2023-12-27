# Unblock-Domains PowerShell Script

## Description
The Unblock-Domains PowerShell script is designed to remove blocking entries ('0.0.0.0 [Domain Name]') from the hosts file on a Windows system. It can be used to unblock specific domains by removing the entries added for blocking.

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
   - Execute the script with the domains to unblock as arguments. For example:
     ```powershell
     .\Unblock-Domains.ps1 -domainsToUnblock "www.facebook.com", "www.twitter.com", "www.instagram.com"
     ```

## Parameters
- **domainsToUnblock**: An array of domains to be unblocked. Provide the domains as arguments when running the script.

## Notes
- The script will remove entries in the hosts file that start with "0.0.0.0 [domainName]" for each specified domain.
- The DNS cache will be refreshed after modifying the hosts file.
- If you encounter permission errors while running the script, ensure that you have the necessary administrative privileges.
  - Open the PowerShell terminal as an administrator by right-clicking on PowerShell and selecting "Run as Administrator."
  - If necessary, you may need to adjust the execution policy to run scripts. Use the following command:
    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
    **Note:** Changing the execution policy should be done with caution and understanding the security implications.

## Disclaimer
This script modifies system files. Use it responsibly and ensure you have the necessary permissions to make changes.

## Example
Unblock the domains "www.facebook.com," "www.twitter.com," and "www.instagram.com":
```powershell
.\Unblock-Domains.ps1 -domainsToUnblock "www.facebook.com", "www.twitter.com", "www.instagram.com"
