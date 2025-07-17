install_zsh() {

  # zsh install
  if ! command -v zsh &>/dev/null; then

    echo "zsh not found. Installing..."

    #install zsh
    sudo apt-get update && sudo apt install zsh

    #Make zsh the default shell
    chsh -s $(which zsh)

    echo "zsh installation complete"

  else

    echo "zsh is already installed"

  fi

}

# Function to install Homebrew and packages

install_homebrew_and_packages() {

  # Check if Homebrew is installed

  if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH in ~/.bashrc or ~/.zshrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
    source ~/.zshrc

    echo "Homebrew installed successfully."

    brew install chezmoi

  else

    echo "Homebrew is already installed."

    # check if chezmoi installed and if not install it
    if ! command -v chezmoi &>/dev/null; then
      brew install chezmoi

      echo "Homebrew packages installation complete."

    else
      echo "chezmoi already installed"
    fi
  fi
}

# Function to apply chezmoi configuration

apply_chezmoi() {

  # Check if chezmoi is installed
  if command -v chezmoi &>/dev/null; then

    # Apply chezmoi configuration
    echo "Applying chezmoi configuration..."
    chezmoi init
    chezmoi apply

    echo "chezmoi configuration applied successfully."
  else
    echo "hmm chezmoi issues"
  fi
}

# Main script execution
install_zsh
install_homebrew_and_packages
apply_chezmoi
