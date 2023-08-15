@echo off
:: "call jd" jumps to a subdirectory using fzf

where fzf > nul 2>&1 || (
  :: /b to not close the cmd while 'call'ing
  echo FZF not found. & pause & exit /b
)

:: pipe all (sub-)directories into fzf
:: and store the one(!) result in a variable
:: "delims=" to not delimit using spaces in path
for /f "delims=" %%i in ('dir /ad /b /s ^| fzf') do (
  set "selection=%%i"
)

:: now go there
chdir /d "%selection%"
