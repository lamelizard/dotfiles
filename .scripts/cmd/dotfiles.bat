@echo off
:: .bat instead of an bash alias
if "%~1" == "" (
  echo Usage: %~nx0 arguments & exit /b 1
)

git --git-dir="%USERPROFILE%\.dotfiles" --work-tree="%USERPROFILE%" %*
