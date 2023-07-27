:: If you don't have the files for sqlite it won't work!
:: Download them there: https://www.sqlite.org/download.html
setlocal enabledelayedexpansion
@echo off

dir /b | findstr /ix "chadchat.db"> nul
if %errorlevel% equ 0 (
    echo An existing database found in the current directory. Do you want to overwrite this file?
    set /p answer="1 or 0: "
    echo !answer!
    if !answer! equ 0 (
        goto end
    )
)
dir /b | findstr /ix "sqlite3.exe" > nul
if %errorlevel% equ 0 (
    echo SQLite3 found in the current directory!
    echo Creating a database!
    sqlite3.exe -init chadchat.sql chadchat.db .exit
    if %errorlevel% equ 0 (
        echo Database created successfully!
    ) else (
        echo Database creation failed. Please check chadchat.sql and sqlite3.exe.
        goto end
    )
) else (
    echo SQLite3 not found, please read comments of this file!
)
copy /V /-Y chadchat.db backup_chadchat.db
:end