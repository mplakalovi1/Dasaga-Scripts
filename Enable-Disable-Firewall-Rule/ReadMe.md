## EnableDisableFirewallRule.ps1

### Overview

This PowerShell script allows you to toggle the state (enable/disable) of specified firewall rules in a cyclic manner. It is designed to enable specified rules for a certain duration and then disable them for another duration, repeating this cycle indefinitely.

### Parameters

- **RuleNames**: An array of strings representing the DisplayNames of the firewall rules you want to toggle. You can provide one or more rule names.
- **ActivityDuration**: Duration (in seconds) for which the specified rules will be enabled. Default is 600 seconds (10 minutes).
- **InactivityDuration**: Duration (in seconds) for which the specified rules will be disabled. Default is 300 seconds (5 minutes).

### Usage

1. Open PowerShell.
2. Navigate to the directory where the script is located.
3. Execute the script with appropriate parameters:

   ```powershell
   .\RuleToggleScript.ps1 -RuleNames "Rule1", "Rule2" -ActivityDuration 600 -InactivityDuration 300
	```
	
### Notes

- Ensure that you have the necessary permissions to modify firewall rules.
- The script runs in an infinite loop, toggling the state of specified rules.