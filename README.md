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
git clone https://github.com/Zibgame/Nvim-Config.git

# Copier le contenu du bon dossier
mkdir -p ~/.config/nvim
cp -r Nvim-Config/* ~/.config/nvim/

# Supprimer les métadonnées git
rm -rf ~/.config/nvim/.git

# Supprimer le dossier cloné
rm -rf Nvim-Config

# Lancer Neovim
nvim
```

## instaler a 42

# 📦 1. Créer le dossier local si nécessaire
mkdir -p ~/.local

# 📥 2. Télécharger la version portable de Neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz -O ~/.local/nvim-linux-x86_64.tar.gz

# 📂 3. Extraire et renommer le dossier
tar -xzf ~/.local/nvim-linux-x86_64.tar.gz -C ~/.local
mv ~/.local/nvim-linux-x86_64 ~/.local/nvim-portable

# 🧹 4. Supprimer l’archive (optionnel)
rm ~/.local/nvim-linux-x86_64.tar.gz

# ⚙️ 5. Créer un alias local (ne modifie pas le PATH)
echo 'alias nvim="$HOME/.local/nvim-portable/bin/nvim"' >> ~/.zshrc

# 🔁 6. Recharger la config
source ~/.zshrc

# ✅ 7. Vérification
nvim --version

