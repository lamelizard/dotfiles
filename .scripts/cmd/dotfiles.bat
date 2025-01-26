@echo off
:: .bat instead of an bash alias
if "%~1" == "" (
  where lazygit >nul 2>&1
  if %errorlevel% == 0 (
    lazygit --git-dir="%USERPROFILE%\.dotfiles" --work-tree="%USERPROFILE%"
  ) else (
    echo Usage: %~nx0 arguments (or have lazygit installed) & exit /b 1
  )
)

git --git-dir="%USERPROFILE%\.dotfiles" --work-tree="%USERPROFILE%" %*
