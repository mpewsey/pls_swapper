# PLS SWAPPER
Script to swap between versions of PLS-CADD.

## Requirements

This program is a command line script and requires Windows.

## Instructions

1. Before proceeding, make a copy of the PLS_CADD.INI file located at `C:\Users\%username%\AppData\Roaming\PLS` in the event something goes wrong when running the scripts.
2. Make a copy of the `pls_swapper.cmd` script and name the file with the version of PLS-CADD that it will swap to. (The file name itself is arbitrary.)
3. Right click on the script and select Edit. The script should open in a text editor, such as Notepad.
4. Change the program version and file paths in the top of the script to those used by the associated version of PLS-CADD, then Save. Make sure not to delete the trailing quotes.

		:: Change the below information for the version needed
		set version=15.00
		set "pls_cadd=c:\program files (x86)\pls\pls_cadd"
		set "pls_pole=c:\program files (x86)\pls\pls_pole"
		set "tower=c:\program files (x86)\pls\tower"
		set "saps=c:\program files (x86)\pls\saps"
		set "caisson=c:\program files (x86)\pls\caisson"

5. Repeat steps 2-4 for each version of PLS-CADD on your machine.
6. To switch between different versions of PLS-CADD, double click on the associated script before opening the program. Test the functionality of your scripts by running a script, opening each PLS program, and verifying that the correct version folder is displayed under File>Preferences.

## Preventing Accidents

PLS-CADD files are not backwards compatible. To prevent unintentionally overwriting an older version file with a newer version, it is recommended that you set the "Prompt for permission before saving projects in new version" preference to Yes.

## Caution

Running two different versions of PLS-CADD simultaneously, or running the version swapper scripts when PLS-CADD is already open, could have unexpected consequences and should be avoided.
