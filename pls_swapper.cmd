@echo off
setlocal EnableDelayedExpansion

:: Change the below information for the version needed
set version=15.00
set "pls_cadd=c:\program files (x86)\pls\pls_cadd"
set "pls_pole=c:\program files (x86)\pls\pls_pole"
set "tower=c:\program files (x86)\pls\tower"
set "saps=c:\program files (x86)\pls\saps"
set "caisson=c:\program files (x86)\pls\caisson"

set "ini=C:\users\%username%\appdata\roaming\pls\PLS_CADD.INI"

set create_backups=False

:: Make time stamps and create backup and temp files
for /f "tokens=2-4 delims=/ " %%i in ('date /t') do (set mydate=%%i-%%j-%%k)
for /f "tokens=1-2 delims=/:" %%i in ('time /t') do (set mytime=%%i%%j)

set ini_temp=%ini%.temp
set ini_backup=%ini%_%mydate%_%mytime% (before swap to %version%).bak

copy nul "%ini_temp%"

if "%create_backups%"=="True" (
    copy "%ini%" "%ini_backup%"
)

:: Loop through lines of ini file
set app=None

for /f "delims=" %%i in (%ini%) do (

    set line=%%i
    set x=!line:~0,1!

    if "!x!"=="[" (
        set app=%%i
    )

    set y=!line:~0,7!

    if "!y!"=="APPDIR=" (
        if "!app!"=="[PLS_CADD]" set "app_path=%pls_cadd%"
        if "!app!"=="[PLS_POLE]" set "app_path=%pls_pole%"
        if "!app!"=="[TOWER]" set "app_path=%tower%"
        if "!app!"=="[SAPS]" set "app_path=%saps%"
        if "!app!"=="[CAISSON]" set "app_path=%caisson%"

	echo !y!!app_path!>>"%ini_temp%"
    ) else (
        echo %%i>>"%ini_temp%"
    )
)

copy "%ini_temp%" "%ini%"
del "%ini_temp%"
