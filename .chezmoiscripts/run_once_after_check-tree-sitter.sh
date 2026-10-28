#!/bin/zsh

# nvim-treesitter (main branch) needs a recent tree-sitter CLI to build parsers.
# An old npm global (tree-sitter-cli@0.20.x) shadows it and breaks parser installs.

# Remove old npm-installed tree-sitter-cli if present
if command -v npm &> /dev/null && npm ls -g --depth=0 tree-sitter-cli &> /dev/null; then
  echo "Removing npm tree-sitter-cli..."
  npm uninstall -g tree-sitter-cli
fi

# Check if Homebrew tree-sitter-cli is installed
if ! brew list tree-sitter-cli &> /dev/null; then
  echo "tree-sitter-cli not found. Installing..."

  brew install tree-sitter-cli

  echo "tree-sitter-cli installed successfully."
else
  echo "tree-sitter-cli is already installed."
fi
