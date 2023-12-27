# Block-Unblock-Loop PowerShell Script

## Description
The Block-Unblock-Loop PowerShell script is designed to cyclically execute scripts for blocking and unblocking domains, allowing for scheduled control over domain accessibility on a Windows system.

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

3. **Configure Block and Unblock Scripts:**
   - Edit the script to set the paths for the block and unblock scripts.
   - Adjust the block and unblock intervals as needed.

4. **Run the Script:**
   - Execute the script to start the cyclic blocking and unblocking process:
     ```powershell
     .\Block-Unblock-Loop.ps1
     ```

## Settings
- **$blockScriptPath:** Path to the script for blocking domains.
- **$unblockScriptPath:** Path to the script for unblocking domains.
- **$blockIntervalMinutes:** Interval in minutes for blocking domains.
- **$unblockIntervalMinutes:** Interval in minutes for unblocking domains.

## Notes
- This script is intended for scheduled control over domain accessibility.
- Ensure that the block and unblock scripts are configured correctly.
- The script will cyclically execute the block and unblock scripts based on the specified intervals.
- If you encounter permission errors while running the script, ensure that you have the necessary administrative privileges.
  - Open the PowerShell terminal as an administrator by right-clicking on PowerShell and selecting "Run as Administrator."
  - If necessary, you may need to adjust the execution policy to run scripts. Use the following command:
    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
    **Note:** Changing the execution policy should be done with caution and understanding the security implications.
	
## Disclaimer
Use this script responsibly and ensure that you have the necessary permissions for modifying system files.

## Example
Cyclically block and unblock domains:
```powershell
.\Block-Unblock-Loop.ps1
