#!/bin/bash

# ----------------------------
# Script para instalação de softwares com interface gráfica
#
# aplicado em um Ubuntu 22.04 - dez/2024 
# ----------------------------

# Instalação do Google Chrome
install_google_chrome() {
    echo "🌐 Instalando Google Chrome..."
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
}

# Instalação do Discord
install_discord() {
    echo "💬 Instalando Discord..."

    wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
    sudo apt install -y ./discord.deb
    rm discord.deb

    echo "✅ Discord instalado com sucesso!"
}



# Instalação do VSCode
install_vscode() {
    echo "💻 Instalando Visual Studio Code..."

    # Adicionar a chave GPG do repositório da Microsoft
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    rm -f packages.microsoft.gpg

    # Adicionar o repositório do VSCode
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    # Atualizar e instalar o VSCode
    sudo apt update
    sudo apt install -y code
}


echo "🚀 Iniciando o setup inicial..."

install_google_chrome
install_vscode
install_discord

echo "✅ Setup concluído! Reinicie a máquina para aplicar todas as alterações."