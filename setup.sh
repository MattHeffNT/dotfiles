#!/bin/zsh

# Function to install Homebrew and packages
install_homebrew_and_packages() {
  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Check if Homebrew was installed successfully
    if ! command -v brew &> /dev/null; then
      echo "Failed to install Homebrew. Exiting."
      exit 1
    fi

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
}

# Function to apply chezmoi configuration
apply_chezmoi() {
  # Check if chezmoi is installed
  if ! command -v chezmoi &> /dev/null; then
    echo "error with the chezmoi install"
    exit 1
  fi

  # Apply chezmoi configuration
  echo "Applying chezmoi configuration..."
  chezmoi apply

  echo "chezmoi configuration applied successfully."
}

# Main script execution
install_homebrew_and_packages
apply_chezmoi
