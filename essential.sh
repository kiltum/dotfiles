# Call for developer tools install window. Need for git and others
xcode-select --install 

# ask sudo password before all actions
sudo -v 

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install essential
brew install mc
brew cask install visual-studio-code
brew cask install slack
brew cask install telegram
brew cask install bitwarden
brew cask install viscosity
brew cask install bartender

# finish it
brew cleanup

brew install kubectl
 
# oh my szh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd
mkdir Projects
cd Projects
git clone git@github.com:kiltum/dotfiles.git