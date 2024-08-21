#!/bin/zsh

# Check if 'bat' is installed
if ! command -v nala &> /dev/null; then
  echo "Nala not found. Installing..."

  # Update the package list and install 'bat'
  sudo apt update
  sudo apt install -y nala 

  echo "Nala installed successfully."
else
  echo "Nala is already installed."
fi

