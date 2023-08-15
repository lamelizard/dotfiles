. "./update_apt.sh"
apt-get --no-install-recommends install -y \
  neovim
# fix some shada permission problems
# https://github.com/neovim/neovim/issues/9912
chown -R "${SUDO_USER}" /home/$SUDO_USER/.local
# Packer plugin manager
# https://github.com/wbthomason/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# some plugin dependencies
apt-get --no-install-recommends install -y \
  python3-pynvim \
  fzf \
  universal-ctags \
  bat
# nodejs via nvm
# install command from https://github.com/nvm-sh/nvm#install--update-script
# su -c "command" $SUDO_USER removes sudo rights for this command,
# such that it gets installed in home
# https://stackoverflow.com/questions/22361591/remove-sudo-permissions-for-one-command
if [ ! -f "/home/$SUDO_USER/.nvm/nvm.sh" ]; then
  su -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash" $SUDO_USER
fi
# as we are inside a script (inside another script),
# nvm will only be enabled in main shell after restart or, e.g., exec bash
nvmCommand="export NVM_DIR="\""/home/$SUDO_USER/.nvm"\"
nvmCommand="$nvmCommand && . "\""/home/$SUDO_USER/.nvm/nvm.sh"\"
nvmCommand="$nvmCommand && nvm install --lts"
nvmCommand="$nvmCommand && nvm use --lts"
su -c "$nvmCommand" $SUDO_USER
