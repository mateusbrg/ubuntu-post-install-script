#!/bin/bash

# ----------------------------
# Script de setup inicial para distros baseadas em Ubuntu
#
# aplicado em um Ubuntu 22.04 - dez/2024
# ----------------------------

# Atualização do sistema
update_system() {
    echo "🔄 Atualizando o sistema..."
    sudo apt update && sudo apt upgrade -y
}

add_repository_universe() {
    echo "📦 Adicionando repositório universe"
    sudo add-apt-repository universe
}

# Instalação de pacotes essenciais
install_essentials() {
    echo "📦 Instalando pacotes essenciais..."
    sudo apt install -y \
        build-essential \
        curl \
        wget \
        git \
        vim \
        htop \
        net-tools \
        zsh \
        neofetch \ 
        unzip \
        gnupg \
        software-properties-common \
        gparted \
        ttf-mscorefonts-installer \
        fonts-firacode \
        vlc \
        ffmpeg
}

install_gnome_features() {
    echo "📦 Instalando pacotes para o GNOME..."
    sudo apt install -y \
        build-gnome-tweaks \
        chrome-gnome-shell
}

# Instalação do Docker (https://docs.docker.com/engine/install/ubuntu/)
install_docker() {
    echo "🐳 Instalando Docker..."
    curl -fsSL https://get.docker.com | sh
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

# Instalação do Docker Compose
install_docker_compose() {
    echo "🛠 Instalando Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

# Configuração do Git
setup_git() {
    read -p "📝 Digite seu nome para o Git: " git_name
    read -p "📧 Digite seu e-mail para o Git: " git_email

    git config --global user.name "$git_name"
    git config --global user.email "$git_email"

    echo "✅ Configuração do Git concluída."
}

# Instalação do Oh My Zsh
install_ohmyzsh() {
    echo "💻 Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Instalação de Node.js (via nvm)
install_node() {
    echo "🌐 Instalando Node.js via nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    source ~/.bashrc
    source ~/.zshrc
    nvm install --lts
}

# ----------------------------
# Execução das funções
# ----------------------------

echo "🚀 Iniciando o setup inicial..."

update_system
add_repository_universe
install_essentials
install_gnome_features
install_docker
install_docker_compose
setup_git
install_ohmyzsh
install_node

echo "✅ Setup concluído! Reinicie a máquina para aplicar todas as alterações."
