# shortcutrecovery
A simple batch file that finds start menu shortcuts and places them a reachable area

This tool helps fine shortcuts that have been created in another Windows account. Good
for in case you join/unjoin a domain or created another windows account.

It requires ROBOCOPY which on windows 7 or higher has it or in the Windows 2003 Resource
Kit.

To prevent non-ending loop on XP and 2000 it will put a folder on your Desktop instead
of the start menu. On vista or higher it will be in the startmenu
