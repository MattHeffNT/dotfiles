# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io). Covers Zsh, Tmux, Neovim (LazyVim), and Alacritty.

## Key Commands

**New machine setup:**
```bash
git clone https://github.com/MattHeffNT/dotfiles ~/dotfiles
cd ~/dotfiles && ./setup.sh   # installs zsh → homebrew → chezmoi → applies
```

**Day-to-day (existing machine):**
```bash
chezmoi diff     # preview what would change
chezmoi apply    # apply dotfiles + run any new run_once_after_* scripts
```

**Reload tmux config (inside tmux):**
`prefix + r`

**Install/update tmux plugins (inside tmux):**
`prefix + I`

## chezmoi File Naming Conventions

chezmoi transforms filenames when deploying to `$HOME`:

| Source name | Deployed as |
|---|---|
| `dot_zshrc` | `~/.zshrc` |
| `dot_tmux.conf` | `~/.tmux.conf` |
| `private_dot_config/nvim/` | `~/.config/nvim/` |
| `executable_install_lazyvim.sh.tmpl` | executable script (template) |

Files in `.chezmoiscripts/` named `run_once_after_*` run exactly once after `chezmoi apply`.

## Architecture

### Shell (`dot_zshrc`)
Oh My Zsh with Powerlevel10k theme. Notable plugins: `zsh-vi-mode` (with `jj` as insert-escape), `zsh-autosuggestions`, `zsh-syntax-highlighting`, `eza`. `cat` is aliased to `batcat`, `ls` to `eza`.

### Tmux (`dot_tmux.conf`)
TPM-managed plugins: `tmux-sensible`, `tmux-resurrect` (with nvim session restore), `dracula/tmux` theme. Vim-style pane navigation (`h/j/k/l`) and `Alt+hjkl` without prefix.

### Neovim (`private_dot_config/nvim/`)
LazyVim base with customisations layered on top:

- `init.lua` → bootstraps lazy.nvim via `lua/config/lazy.lua`
- `lua/config/` — LazyVim config entry points (`lazy.lua`, `keymaps.lua`, `options.lua`, `autocmds.lua`)
- `lua/plugins/` — custom plugin specs that extend/override LazyVim defaults
- `lua/core/` — additional keymaps and options

Active extras loaded in `lazy.lua`: `lazyvim.plugins.extras.linting.eslint`, `lazyvim.plugins.extras.formatting.prettier`.

Colorscheme: `tokyonight` (storm style). Status line: `lualine` with tokyonight theme. File explorer: Snacks explorer (disabled by default; opens automatically when nvim is invoked on a directory). netrw is disabled.

Custom keymaps: `jj` → `<Esc>` in insert mode; `<leader>c` → delete current buffer.

### Alacritty (`private_dot_config/alacritty/alacritty.yml`)
MesloLGS NF font, 80% opacity with blur, custom color palette. `Alt+J/K` bound to send escape sequences for tmux/nvim compatibility.
