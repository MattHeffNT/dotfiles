#!/bin/zsh

# Check if 'neovim' is installed
if ! command -v nvim&> /dev/null; then
  echo "neovim not found. Installing..."

  # Update the package list and install 'bat'
  brew install neovim

  echo "neovim installed successfully."
else
  echo "neovim is already installed."
fi

# Check if 'lunarvim' is installed
if ! command -v lvim&> /dev/null; then
  echo "lunarvim not found. Installing..."
fi

  # install 'lunarvim'
  LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh) 

  echo "neovim and lunarvim installed successfully."
else
  echo "neovim and lunarvim installed successfully."
fi
