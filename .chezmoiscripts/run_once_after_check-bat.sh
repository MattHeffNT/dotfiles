#!/bin/zsh

# Check if 'bat' is installed
if ! command -v bat &> /dev/null; then
  echo "Bat not found. Installing..."

  # Update the package list and install 'bat'
  sudo apt update
  sudo apt install -y bat

  echo "Bat installed successfully."
else
  echo "Bat is already installed."
fi

