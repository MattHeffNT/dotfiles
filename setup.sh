
#!/bin/bash

install_omz() {

  if ! command -v zsh &> /dev/null; then
    echo "zsh not found. Installing..."

    #install zsh 
    sudo apt-get update && sudo apt install zsh

    #Make zsh the default shell
    chsh -s $(which zsh)

    echo "zsh installation complete"
  else
    echo "zsh is already installed"
  fi

  if ! command -v omz &> /dev/null; then
   echo "omz not found, installing ..."

   #install omz
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

   echo "omz installation complete"
  else
    echo "omz is already installed"
  fi

}

# Function to install Homebrew and packages
install_homebrew_and_packages() {
  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    #Add Homebrew to path
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/osboxes/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv) >> source ~/.bashrc"

    # Check if Homebrew was installed successfully
    # if ! command -v brew &> /dev/null; then
    #   echo "Failed to install Homebrew. Exiting."
    #   exit 1
    # fi

    echo "Homebrew installed successfully."

    # Define the list of packages to install
    PACKAGES=(
      chezmoi
      # Add other packages as needed
    )

    # Install or upgrade packages
    echo "Installing Homebrew packages..."
    for pkg in "${PACKAGES[@]}"; do
      echo "Installing $pkg..."
      brew install "$pkg" || echo "Failed to install $pkg"
    done

    echo "Homebrew packages installation complete."
  else
    echo "Homebrew is already installed."
  fi

  source ~/.zshrc

}

# Function to apply chezmoi configuration
apply_chezmoi() {
  # Check if chezmoi is installed
  if ! command -v chezmoi &> /dev/null; then
    echo "error with the chezmoi install"

  # Apply chezmoi configuration
    echo "Applying chezmoi configuration..."
    chezmoi init
    chezmoi apply

    echo "chezmoi configuration applied successfully."
  fi
}

# Main script execution
install_omz
install_homebrew_and_packages
apply_chezmoi
