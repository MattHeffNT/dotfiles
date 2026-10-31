#!/bin/zsh

# nala is an apt frontend, so only relevant on Debian/Ubuntu (WSL)
if ! command -v apt-get &> /dev/null; then
  echo "Not an apt system, skipping nala."
elif ! command -v nala &> /dev/null; then
  echo "Nala not found. Installing..."

  sudo apt update
  sudo apt install -y nala 

  echo "Nala installed successfully."
else
  echo "Nala is already installed."
fi

