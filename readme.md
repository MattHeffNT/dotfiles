### 🛠️ Heff's Dotfiles
This repo contains my personal dotfiles managed with [chezmoi](https://www.chezmoi.io). It includes configuration for:
- Zsh + Oh My Zsh + Powerlevel10k
- Tmux
- Homebrew (Linuxbrew)
- Automatic provisioning scripts using `.chezmoiscripts`
- Neovim with LazyVim (and customisations)

---

## 🚀 New machine setup

```bash
git clone https://github.com/MattHeffNT/dotfiles ~/dotfiles
cd ~/dotfiles && ./setup.sh
```

`setup.sh` handles everything: installs zsh → Homebrew → chezmoi → applies dotfiles.

---

## 🔄 Day-to-day (existing machine)

```bash
chezmoi diff     # preview what would change
chezmoi apply    # apply dotfiles
```

Provisioning scripts in `.chezmoiscripts/` are named `run_once_after_*` — chezmoi runs them automatically during `chezmoi apply` the first time they're seen (tracked by content hash).
