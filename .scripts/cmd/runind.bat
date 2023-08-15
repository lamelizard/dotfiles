@echo off
:: call the command (with arguments)
:: with the directory selected using fzf
:: as working directory
setlocal

where fzf > nul 2>&1 || (
  :: /b to not close the cmd while 'call'ing
  echo FZF not found. & exit /b 1
)

if "%~1" == "" (
  echo Usage: %~nx0 command [arguments] & exit /b 1
)
set "command=%~1"
:: Check if the command is executable
where %command% > nul 2>&1 || (
  echo Command %command% not found. & exit /b 1
)

:: select dir with fzf
for /f "delims=" %%i in ('dir /b /s /ad ^| fzf') do (
  set "selection=%%i"
)

chdir "%selection%"
call %*

endlocal
