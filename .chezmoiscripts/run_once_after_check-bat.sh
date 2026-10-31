#!/bin/zsh

# Check if 'bat' is installed
if ! command -v bat &> /dev/null; then
  echo "Bat not found. Installing..."

  brew install bat

  echo "Bat installed successfully."
else
  echo "Bat is already installed."
fi

