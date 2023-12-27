# Block-Domains PowerShell Script

## Description
The Block-Domains PowerShell script is designed to block specified domains by adding entries ('0.0.0.0 [Domain Name]') to the hosts file on a Windows system. It can be useful for preventing access to specific websites.

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
   - Execute the script with the desired domains as arguments. For example:
     ```powershell
     .\Block-Domains.ps1 -domains "www.facebook.com", "www.twitter.com", "www.instagram.com"
     ```

## Parameters
- **domains**: An array of domains to be blocked. Provide the domains as arguments when running the script.

## Notes
- The script will check if each domain is already blocked before adding it to the hosts file.
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
Block the domains "www.facebook.com," "www.twitter.com," and "www.instagram.com":
```powershell
.\Block-Domain.ps1 -domains "www.facebook.com", "www.twitter.com", "www.instagram.com"
