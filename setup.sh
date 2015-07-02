#!/usr/bin/env sh -x

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


### .profile, .gitconfig, .gitignore setup

echo "source '$DIR/profile.sh'" > ~/.profile
ln -s "$DIR/gitconfig" ~/.gitconfig
ln -s "$DIR/gitignore" ~/.gitignore


### Homebrew setup

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
  git
  node
  postgres
  python3
  scala
  typesafe-activator
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup
