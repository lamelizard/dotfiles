# dotfiles

## Installation

Linux:
```bash
git clone --bare https://github.com/lamelizard/dotfiles.git $HOME/.dotfiles
# overrides old settings, create a backup.
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f
```

Windows:
```bat
:: TODO test me
git clone --bare https://github.com/lamelizard/dotfiles.git "%USERPROFILE%\.dotfiles"
:: overrides old settings, create a backup.
git --git-dir="%USERPROFILE%\.dotfiles" --work-tree="%USERPROFILE%" checkout -f
%USERPROFILE%\.scripts\cmd\setup\setup_script_path.bat
:: neovim - use same config location as under linux
setx XDG_CONFIG_HOME "%USERPROFILE%\\.config"
```
