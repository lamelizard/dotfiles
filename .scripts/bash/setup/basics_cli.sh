. "./update_apt.sh"
apt-get --no-install-recommends install -y \
  tmux \
  zsh \
  htop \
  iotop \
  nethogs \
  ripgrep \
  fd-find

# create a symlink for fd-find (for debian only...),
# needs to be added to path
# s. https://github.com/sharkdp/fd
mkdir -p ~/.bin
ln -fs $(which fdfind) ~/.bin/fd

# git with credential store
apt-get --no-install-recommends install -y \
  git \
  libsecret-1-0 \
  libsecret-1-dev
make -C /usr/share/doc/git/contrib/credential/libsecret
git config --global credential.helper \
  /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
