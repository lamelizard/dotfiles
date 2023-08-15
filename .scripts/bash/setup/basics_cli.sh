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
