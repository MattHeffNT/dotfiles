#!/bin/zsh

# Define the OMZ plugins directory
OMZ_PLUGINS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

# Define the list of plugins based on the .zshrc file
PLUGIN_LIST=("zsh-vi-mode" "zsh-autosuggestions" "zsh-syntax-highlighting")

# Function to check if a plugin is installed
is_plugin_installed() {
  local plugin_name="$1"
  [ -d "$OMZ_PLUGINS_DIR/$plugin_name" ]
}

# Function to install a plugin
install_plugin() {
  local plugin_name="$1"
  echo "Installing $plugin_name..."

  if [[ "$plugin_name" == "zsh-vi-mode" ]]; then
    git clone "https://github.com/jeffreytse/zsh-vi-mode" "$OMZ_PLUGINS_DIR/$plugin_name"
  else
    git clone "https://github.com/zsh-users/$plugin_name" "$OMZ_PLUGINS_DIR/$plugin_name"
  fi

  echo "$plugin_name installed successfully."
}

# Read the .zshrc file from the Chezmoi source directory
DOT_ZSHRC_PATH="$HOME/.local/share/chezmoi/dot_zshrc"

if [ -f "$DOT_ZSHRC_PATH" ]; then
  echo "Reading plugins from $DOT_ZSHRC_PATH..."

  # Loop through the defined plugins
  for plugin in $PLUGIN_LIST; do
    if grep -q "plugins.*$plugin" "$DOT_ZSHRC_PATH"; then
      if ! is_plugin_installed "$plugin"; then
        install_plugin "$plugin"
      else
        echo "$plugin is already installed."
      fi
    fi
  done
else
  echo "Dotfile .zshrc not found at $DOT_ZSHRC_PATH"
fi

