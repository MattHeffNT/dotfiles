#!/bin/zsh

# Function to install Conda
install_conda() {
  echo "Conda not found. Installing..."

  # Install Conda
  mkdir -p ~/miniconda3
  [[ "$OSTYPE" == darwin* ]] && os=MacOSX || os=Linux
  curl -fsSL "https://repo.anaconda.com/miniconda/Miniconda3-latest-$os-$(uname -m).sh" -o ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -f ~/miniconda3/miniconda.sh

  # no `conda init` — dot_zshrc already has the init block

  echo "Conda installed successfully."
}

# Function to install NVM
install_nvm() {
  echo "NVM not found. Installing..."

  # Install Node Version Manager
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

  # Load NVM into the current session
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Install and use the latest LTS version of Node.js
  nvm install --lts
  nvm use --lts

  echo "Node Version Manager installed and latest LTS version of Node.js activated."
}

# Function to install Rust and Cargo
install_rust() {
  echo "Cargo not found. Installing Rust..."

  # Install Rust and Cargo
  curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

  # Source Cargo environment variables
  export PATH="$HOME/.cargo/bin:$PATH"

  echo "Rust and Cargo installed successfully."
}



# Check and install Conda
if ! command -v conda &> /dev/null; then
  install_conda
else
  echo "Conda is already installed."
fi

# Check and install NVM
if ! command -v node &> /dev/null; then
  install_nvm
else
  echo "Node Version Manager is already installed."
fi

# Check and install Cargo
if ! command -v cargo &> /dev/null; then
  install_rust
else
  echo "Cargo is already installed."
fi

# Check and install make 
if ! command -v make &> /dev/null; then
  if command -v pacman &> /dev/null; then
    sudo pacman -S --needed make
  elif command -v apt-get &> /dev/null; then
    sudo apt-get update && sudo apt-get install make
  else
    xcode-select --install
  fi
else
  echo "make is already installed."
fi