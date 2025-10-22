#!/bin/bash
set -e

echo "🌿 Installation de la configuration Neovim personnalisée"

# Dossiers
CONFIG_DIR="$HOME/.config/nvim"
NVIM_PORTABLE_DIR="$HOME/.local/nvim-portable"
PLUG_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
FONTS_DIR="$HOME/.local/share/fonts"

# 📁 Chemin absolu du script (marche depuis n’importe où)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo
echo "Choisissez le mode d’installation :"
echo "1️⃣  Installation standard (Linux classique)"
echo "2️⃣  Installation 42 (portable, sans sudo)"
read -p "➡️  Entrez 1 ou 2 : " CHOICE

# ---------------------------------------------------------------------
# 🏫 Mode 42 : Installation portable
# ---------------------------------------------------------------------
if [ "$CHOICE" = "2" ]; then
    echo "⚙️ Installation portable de Neovim..."
    mkdir -p "$NVIM_PORTABLE_DIR"
    cd "$NVIM_PORTABLE_DIR"

    # 🔽 Téléchargement de la version portable
    wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

    # 📦 Extraction
    tar -xzf nvim-linux-x86_64.tar.gz
    mv nvim-linux-x86_64/* .
    rm -rf nvim-linux-x86_64 nvim-linux-x86_64.tar.gz

    echo "✅ Neovim portable installé dans $NVIM_PORTABLE_DIR"

    # 🔗 Ajout alias si inexistant
    if ! grep -q "alias nvim=" "$HOME/.zshrc"; then
        echo "alias nvim=\"$NVIM_PORTABLE_DIR/bin/nvim\"" >> "$HOME/.zshrc"
        echo "🔗 Alias ajouté à ~/.zshrc"
    fi

    echo "💡 Recharge ton shell avec : source ~/.zshrc"
fi

# ---------------------------------------------------------------------
# ⚙️ Configuration Neovim
# ---------------------------------------------------------------------
echo "📂 Copie du fichier init.vim..."
mkdir -p "$CONFIG_DIR"
cp "$SCRIPT_DIR/Vim-Config/init.vim" "$CONFIG_DIR/init.vim"

# ---------------------------------------------------------------------
# 🔤 Installation de la Nerd Font
# ---------------------------------------------------------------------
echo "🔤 Installation d’une Nerd Font (JetBrainsMono)..."
mkdir -p "$FONTS_DIR"
cd "$FONTS_DIR"

# Téléchargement direct depuis Nerd Fonts (version légère)
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -O JetBrainsMono.zip
unzip -o JetBrainsMono.zip >/dev/null 2>&1
rm JetBrainsMono.zip
fc-cache -fv >/dev/null

echo "✅ Nerd Font JetBrainsMono installée avec succès !"

# ---------------------------------------------------------------------
# 🔌 Installation de vim-plug
# ---------------------------------------------------------------------
if [ ! -f "$PLUG_PATH" ]; then
    echo "🔌 Installation de vim-plug..."
    curl -fLo "$PLUG_PATH" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "✅ vim-plug installé avec succès."
else
    echo "✅ vim-plug déjà présent, aucune action nécessaire."
fi

# ---------------------------------------------------------------------
# 🧩 Installation des plugins
# ---------------------------------------------------------------------
echo "⚙️ Installation des plugins Neovim..."

# Utilise la version portable si elle existe
if [ "$CHOICE" = "2" ]; then
    "$NVIM_PORTABLE_DIR/bin/nvim" +PlugInstall +qall || echo "⚠️ Lance manuellement : nvim +PlugInstall"
else
    nvim +PlugInstall +qall || echo "⚠️ Lance manuellement : nvim +PlugInstall"
fi

# ---------------------------------------------------------------------
# ✅ Fin de l’installation
# ---------------------------------------------------------------------
clear
echo "🎉 Installation terminée avec succès !"
echo "✨ Tout est prêt, tu peux utiliser Neovim avec : nvim"
echo
echo "📝 Ouverture automatique de ~/.zshrc pour vérification de l’alias..."
sleep 1
nvim "$HOME/.zshrc"

