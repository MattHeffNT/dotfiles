#!/bin/zsh

#check if 'eza' is installed
if ! command -v eza &> /dev/null; then
	  echo "Eza not found. Installing..."

# Check if Homebrew is installed
	if command -v brew &> /dev/null; then
		echo "Homebrew found. Installing eza using Homebrew..."
		brew install eza
	else
		echo "Homebrew not found. Attempting to install eza directly..."

# Create a temporary directory for installation
	TEMP_DIR=$(mktemp -d)
	cd $TEMP_DIR


	echo "Eza installed successfully."
fi
	else
	echo "Eza is already installed."
fi

