. "./update_apt.sh"
# build
apt-get --no-install-recommends install -y \
  build-essential \
  automake \
  ninja-build \
  llvm \
  clang \
  mingw-w64 \
  cmake \
  cmake-curses-gui
# git with credential store
apt-get --no-install-recommends install -y \
  git \
  libsecret-1-0 \
  libsecret-1-dev
make -C /usr/share/doc/git/contrib/credential/libsecret
git config --global credential.helper \
  /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
# emscripten requirements
apt-get --no-install-recommends install -y \
  git \
  ca-certificates \
  xz-utils \
  bzip2 \
  python3
# check
apt-get --no-install-recommends install -y \
  clang-format \
  clang-tidy \
  clang-tools \
  valgrind \
  cppcheck \
  doxygen \
  doxygen-latex \
  graphviz
# libs
apt-get --no-install-recommends install -y \
  libomp-dev \
  libsdl2-dev \
  libgl1-mesa-dev \
  libopenal-dev \
  libalut-dev \
  liblua5.1-0-dev \
  luajit \
  libfreetype6-dev \
  libfribidi-dev \
  libharfbuzz-dev \
  libxml2-dev \
  libdevil-dev \
  libphysfs-dev \
  libfishsound-dev \
  libsndfile1-dev \
  libmpg123-dev
