#!/bin/zsh

# Function to install Conda
install_conda() {
  echo "Conda not found. Installing..."

  # Install Conda
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -f ~/miniconda3/miniconda.sh

  # Initialize Conda
  ~/miniconda3/bin/conda init zsh

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

  # Ensure NVM source lines are in .zshrc
  if ! grep -q "export NVM_DIR=\"$HOME/.nvm\"" ~/.zshrc; then
    echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.zshrc
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.zshrc
  fi

  echo "Node Version Manager installed and latest LTS version of Node.js activated."
}

# Function to install Rust and Cargo
install_rust() {
  echo "Cargo not found. Installing Rust..."

  # Install Rust and Cargo
  curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

  # Source Cargo environment variables
  export PATH="$HOME/.cargo/bin:$PATH"

  # Ensure Cargo source lines are in .zshrc
  if ! grep -q "export PATH=\"$HOME/.cargo/bin:\$PATH\"" ~/.zshrc; then
    echo "export PATH=\"$HOME/.cargo/bin:\$PATH\"" >> ~/.zshrc
  fi

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
  sudo apt-get update && sudo apt-get install make
else
  echo "Cargo is already installed."
fi