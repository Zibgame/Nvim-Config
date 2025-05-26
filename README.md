# 💤 Zibgame Custom Nvim Config

Welcome to my personalized Neovim configuration! This setup is built on top of [LazyVim](https://github.com/LazyVim/LazyVim) — a powerful and flexible Neovim config — but fully customized by me to boost my productivity and coding comfort. 💻✨

---

## 🎯 Why This Config?

LazyVim gives a great base with smart defaults and plugin management.  
I tweaked it with my own plugins, key mappings, UI tweaks, and settings to fit how I work best.

---

## 🛠 Installation Guide

To install this config, simply copy and paste this entire block in your terminal:

```bash
# Cloner le repo
git clone https://github.com/Zibgame/Vim-Config.git

# Copier le contenu du bon dossier
mkdir -p ~/.config/nvim
cp -r Vim-Config/Vim-Config/* ~/.config/nvim/

# Supprimer les métadonnées git
rm -rf ~/.config/nvim/.git

# Supprimer le dossier cloné
rm -rf Vim-Config

# Lancer Neovim
nvim
