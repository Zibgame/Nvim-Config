#!/bin/bash
set -e

echo "🌿 Installation de la configuration Neovim personnalisée"

# Dossier d'installation
CONFIG_DIR="$HOME/.config/nvim"
NVIM_PORTABLE_DIR="$HOME/.local/nvim-portable"

echo "Choisissez le mode d’installation :"
echo "1️⃣  Installation standard (Linux classique)"
echo "2️⃣  Installation 42 (portable, sans sudo)"
read -p "➡️  Entrez 1 ou 2 : " CHOICE

if [ "$CHOICE" = "2" ]; then
    echo "⚙️ Installation portable de Neovim..."
    mkdir -p "$NVIM_PORTABLE_DIR"
    cd "$NVIM_PORTABLE_DIR"

    # Téléchargement de la version portable
    wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    tar xzf nvim-linux64.tar.gz
    mv nvim-linux64/* .
    rm -rf nvim-linux64 nvim-linux64.tar.gz

    echo "✅ Neovim portable installé dans $NVIM_PORTABLE_DIR"
    echo "alias nvim=\"$NVIM_PORTABLE_DIR/bin/nvim\"" >> "$HOME/.zshrc"
    source "$HOME/.zshrc"

    echo "🔗 Alias ajouté à .zshrc (nvim → version portable)"
fi

# Configuration Neovim
echo "📂 Copie du fichier init.vim..."
mkdir -p "$CONFIG_DIR"
cp "$(dirname "$0")/Vim-Config/init.vim" "$CONFIG_DIR/init.vim"

# Installation de vim-plug
echo "🔌 Installation de vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "✅ vim-plug installé."

# Installation des plugins
echo "⚙️ Installation des plugins Neovim..."
nvim +PlugInstall +qall || echo "⚠️ Exécute manuellement : nvim +PlugInstall"

echo "🎉 Installation terminée ! Lance Neovim avec : nvim"

