#!/bin/zsh

# Check if 'neovim' is installed
if ! command -v nvim&> /dev/null; then
  echo "neovim not found. Installing..."

  # Update the package list and install 'bat'
  brew install neovim

  # Add section here to install my custom neovim config

  echo "neovim installed successfully."
else
  echo "neovim is already installed."
fi

