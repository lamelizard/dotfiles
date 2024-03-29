. "./update_apt.sh"
apt-get --no-install-recommends install -y \
  tmux \
  zsh \
  htop \
  iotop \
  nethogs \
  ripgrep \
  fd-find \
  bat

# python
apt-get --no-install-recommends install -y \
  python3 \
  python3-pip

# tldr cheat-sheets (needs python3-pip)
pip install tldr

# create a symlink for fd-find (for debian only...),
# needs to be added to path
# s. https://github.com/sharkdp/fd
su -c "mkdir -p ~/.bin" $SUDO_USER
su -c "ln -fs $(which fdfind) ~/.bin/fd" $SUDO_USER
# create a symlink for bat (for debian only...),
# s. https://github.com/sharkdp/bat
su -c "ln -fs $(which batcat) ~/.bin/bat" $SUDO_USER

# git with credential store
apt-get --no-install-recommends install -y \
  git
# are we in WSL?
# https://stackoverflow.com/questions/38859145/detect-ubuntu-on-windows-vs-native-ubuntu-from-bash-script
if grep -qi microsoft /proc/version; then
  # WSL -> use Git for windows, rather hard coded...
  # https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git
  echo "WSL: using Git for Windows credential manager"
  su -c "git config --global credential.helper \"/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe\"" $SUDO_USER
else
  apt-get --no-install-recommends install -y \
    libsecret-1-0 \
    libsecret-1-dev
  make -C /usr/share/doc/git/contrib/credential/libsecret
  git config --global credential.helper \
    /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
fi
