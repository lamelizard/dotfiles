@echo off
REM set NVIM_UNIX_DIR="%USERPROFILE%\.config\nvim\"
REM set NVIM_WIN_DIR="%LOCALAPPDATA%\nvim\"
REM xcopy %NVIM_UNIX_DIR% %NVIM_WIN_DIR% /S /K /D /Y
@echo on
mklink /D "%USERPROFILE%\AppData\Local\nvim" "%USERPROFILE%\.config\nvim"