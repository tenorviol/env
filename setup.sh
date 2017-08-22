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

brew update

stuff=(
  ag
  git
  node
  postgres
  python3
  scala
)

echo "installing stuff..."
brew install ${stuff[@]}

brew cleanup
