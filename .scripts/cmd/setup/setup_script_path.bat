@echo off
:: adds the scripts to the users path
:: check if allready in path
set NEWDIR=%USERPROFILE%\.scripts\cmd
echo %PATH% | find /i "%NEWDIR%" || (
  :: without /M the variable is only set for the current user
  setx PATH "%PATH%;%NEWDIR%"
)
