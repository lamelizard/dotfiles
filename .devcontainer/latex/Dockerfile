FROM debian:13.3-slim AS latex

RUN DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    locales \
    git \
    curl \
    wget \
    tar \
    unzip \
    build-essential \
    make \
    cmake \
    tmux \
    ripgrep \
    fd-find \
    bat \
    python3 \
    python3-neovim \
    python3-pip \
  #texlive
    texlive \
    texlive-plain-generic \
    texlive-lang-german \
    texlive-latex-extra \
    texlive-science \
  #huge, but needed for some papers...
    texlive-fonts-extra \
    texlive-publishers \
    texlive-bibtex-extra \
    biber \
    lmodern \
  #build & lint latex
    latexmk \
    lacheck \
    chktex \
    aspell \
    aspell-en \
    hunspell-de-de \
  #further
    shfmt \
    openjdk-21-jre-headless \
  #clean
    && rm -rf /var/lib/apt/lists/*

# color
ENV TERM=xterm-256color

# set local to UTF-8
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-debian-ubuntu-docker-container
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US
ENV LC_CTYPE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
#RUN update-locale LANG=en_US.UTF-8

# install nvim per appimage
# in docker: extract, as no fuse available
# todo: unknown if using separate folders for different appimages is necessary
# outside docker just: ln -s /nvim.appimage /usr/bin/nvim
RUN wget -O /nvim.appimage https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage \
    && chmod u+x /nvim.appimage \
    && /nvim.appimage --appimage-extract \
    && mv /squashfs-root /appimage-nvim \
    && ln -s /appimage-nvim/usr/bin/nvim /usr/bin/nvim \
    && rm /nvim.appimage

# add new user "flo" and switch to it
RUN useradd -ms /bin/bash flo
USER flo
WORKDIR /home/flo

# break cache at this position
ARG BREAK_CACHE="pass a new value to break the cache"

# dotfiles
RUN git clone --bare https://github.com/lamelizard/dotfiles.git $HOME/.dotfiles \
    && git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f

# install nvim plugins
RUN nvim --headless -c 'Lazy! sync' -c 'qall'
# no treesitter/LSP yet:
RUN nvim --headless -c 'MasonInstall lua-language-server' -c 'qall'
RUN nvim --headless -c 'MasonInstall texlab' -c 'qall'

CMD ["/bin/bash"]

# version with gui apps
FROM latex AS latex-gui
USER root
WORKDIR /

# zathura + Wayland does not work with vimtex -> force x11
ENV GDK_BACKEND=x11

RUN DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    apt-get update \
    && apt-get install -y --no-install-recommends \
  #zathura
    dbus-x11 \
    xdotool \
    psmisc \
    zathura \
  #clean
    && rm -rf /var/lib/apt/lists/*

# install neovide
# does not work for WSL2: https://github.com/neovide/neovide/issues/2662
#RUN wget -O /neovide.appimage https://github.com/neovide/neovide/releases/download/0.14.0/neovide.AppImage \
#    && chmod u+x /neovide.appimage \
#    && /neovide.appimage --appimage-extract \
#    && mv /squashfs-root /appimage-neovide \
#    && ln -s /appimage-neovide/usr/bin/neovide /usr/bin/neovide \
#    && rm /neovide.appimage

USER flo
WORKDIR /home/flo
