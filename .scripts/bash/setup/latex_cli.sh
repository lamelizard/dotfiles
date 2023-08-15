. "./update_apt.sh"
#install complete texlive with texlive-full
apt-get --no-install-recommends install -y \
  texlive \
  texlive-lang-german \
  texlive-latex-extra \
  texlive-science
# myspell replaced with hunspell
apt-get --no-install-recommends install -y \
  latexmk \
  lacheck \
  chktex \
  hunspell-de-de \
  doxygen-latex
# further useful cli tools
apt-get --no-install-recommends install -y \
  pdfgrep
