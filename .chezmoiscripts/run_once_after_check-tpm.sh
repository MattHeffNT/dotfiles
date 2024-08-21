#!/bin/zsh

# Define the path where tmux plugin manager should be installed
plugins_dir="$HOME/.tmux/plugins/"
tpm_repo="https://github.com/tmux-plugins/tpm"
tpm_dir="$plugins_dir/tpm/"

if [ ! -d "$tpm_dir" ]; then
  echo "tpm not found. Cloning from $tpm_repo ..."

  # Create the directory if it doesn't exist
  mkdir -p "$plugins_dir"

  # Clone the tpm repository
  git clone "$tpm_repo" "$tpm_dir"

  echo "tmux plugin manager installed successfully."
else
  echo "tmux plugin manager is already installed."
fi
