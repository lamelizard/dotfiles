@echo off
:: Check if running with administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo This Command Prompt is already running as administrator.
) else (
    echo Opening a new Windows Terminal as administrator...
    powershell -Command "Start-Process 'wt.exe' -ArgumentList 'cmd /k cd /d %CD%' -Verb RunAs"
    exit
)