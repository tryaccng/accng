@echo off
:: Batch script to activate venv and run accng.py with administrative privileges in Windows Terminal

:: Check if the script is running with administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process wt.exe -ArgumentList 'cmd /c %~0' -Verb runAs"
    exit /b
)

:: Get the current directory path
set "current_dir=%~dp0"

:: Run Windows Terminal, activate the venv, and execute the Python script
wt.exe cmd /k "cd /d %current_dir% && .\accng.exe"
