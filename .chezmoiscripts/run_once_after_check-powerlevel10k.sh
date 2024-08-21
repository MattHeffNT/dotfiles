#!/bin/zsh

# Define the path where powerlevel10k should be installed
plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
powerlevel10k_repo="https://github.com/romkatv/powerlevel10k.git"
powerlevel10k_dir="$plugins_dir/powerlevel10k"

# Check if the powerlevel10k directory exists
if [ ! -d "$powerlevel10k_dir" ]; then
  echo "Powerlevel10k not found. Cloning from $powerlevel10k_repo..."

  # Create the themes directory if it doesn't exist
  mkdir -p "$plugins_dir"

  # Clone the powerlevel10k repository
  git clone "$powerlevel10k_repo" "$powerlevel10k_dir"

  echo "Powerlevel10k installed successfully."
else
  echo "Powerlevel10k is already installed."
fi

