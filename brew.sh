#!/usr/bin/env bash
# Install brew
sudo -v
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

brew install git
brew install git-lfs
#brew install imagemagick --with-webp
brew install p7zip
#brew install pigz
brew install pv
brew install ssh-copy-id
brew install tree
#brew install zopfli
brew install mc
#brew install tmux
#brew install qemu
brew install ansible
#brew install hugo
#brew install packer
brew install git-crypt


brew install hcloud
brew install kubectl
brew install kubernetes-helm

brew install pinentry-mac

# ok, now cask

brew cask install sublime-text
brew cask install dropbox
#brew cask install gimp
brew cask install google-chrome

#brew cask install slack

#brew cask install vmware-fusion
brew cask install viscosity
#brew cask install docker
#brew cask install telegram

#brew cask install gcc-arm-embedded
#brew cask install highsierramediakeyenabler
#brew cask install java

#brew cask install pycharm
#brew cask install goland


#brew install socat
#brew cask install xquartz
#open -a XQuartz
#socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"


#brew cask install bettertouchtool

# Remove outdated versions from the cellar.
brew cleanup
