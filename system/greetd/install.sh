#!/usr/bin/env bash
# Copy ReGreet config into /etc/greetd (backs up existing files first)
set -euo pipefail
cd "$(dirname "$0")"
for f in regreet.toml regreet.css; do
  [[ -f /etc/greetd/$f ]] && sudo cp "/etc/greetd/$f" "/etc/greetd/$f.bak"
  sudo install -m 644 "$f" "/etc/greetd/$f"
done
echo "Installed. Log out (or: sudo systemctl restart greetd) to see it."
