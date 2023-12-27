# Blocking and Unblocking Domains Script

This PowerShell script provides a simple way to block and unblock domains by adding or removing entries in the Windows hosts file. 
- To block a domain, the script adds the entry `0.0.0.0 [Domain Name]` to prevent resolution. Conversely, to unblock, it removes the corresponding entry.
