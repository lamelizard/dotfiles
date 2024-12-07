@echo off
set NVIM_UNIX_DIR="%USERPROFILE%\.config\nvim\"
set NVIM_WIN_DIR="%LOCALAPPDATA%\nvim\"
@echo on
xcopy %NVIM_UNIX_DIR% %NVIM_WIN_DIR% /S /K /D /Y
