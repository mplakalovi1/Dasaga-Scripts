## EnableDisableFirewallRule.ps1

### Overview

This PowerShell script is designed to periodically enable and disable a specified firewall rule on a Windows system, creating a cycle of activity and inactivity for the rule.

### Instructions

1. **Parameters:**
    - `$RuleName` (required): Specifies the name of the outbound firewall rule to be controlled by the script.
    - `$ActivityDuration` (optional, default is 600 seconds): Specifies the duration (in seconds) for which the firewall rule is enabled (activity period).
    - `$InactivityDuration` (optional, default is 300 seconds): Specifies the duration (in seconds) for which the firewall rule is disabled (inactivity period).

2. **Usage:**
    - To run the script with required and default parameters:
        ```
        .\EnableDisableFirewallRule.ps1 -RuleName "YourRuleName"
        ```

    - To run the script with custom parameters:
        ```
        .\EnableDisableFirewallRule.ps1 -RuleName "YourRuleName" -ActivityDuration 600 -InactivityDuration 300
        ```

### Important Note

Ensure that the specified firewall rule (`$RuleName`) exists on your system and replace "YourRuleName" with the actual name of your outbound firewall rule.

