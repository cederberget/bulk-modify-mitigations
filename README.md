# bulk-modify-mitigations
Bulk modify Process Mitigations in Windows.

## What it is
A PowerShell script.
If you run it as Administrator it will allow all .exe files in the `C:\Program Files\Git` directory and subdirectories to run without Mandatory ASLR.

This is only necessary at all if you have Mandatory ASLR enabled in Windows. **It is disabled by default.**

You can specify another `-Directory`, and it will do the same thing recursively for the .exe files there.
