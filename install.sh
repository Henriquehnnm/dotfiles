#!/bin/bash

# =================================================================================================
#
#          INSTALADOR DE DOTFILES - https://github.com/autobrolys/dotfiles
#
#   Este script irá instalar as configurações, fontes e scripts contidos neste repositório.
#
#   AVISO: Execute este script por sua conta e risco. Revise o código antes de executar.
#
# =================================================================================================

# ------------------------------------------------------
# Variáveis e Cores
# ------------------------------------------------------
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
LOCAL_BIN_DIR="$HOME/.local/bin"
FONTS_DIR="$HOME/.local/share/fonts"
KONSOLE_PROFILE_DIR="$HOME/.local/share/konsole"
PLASMA_COLOR_DIR="$HOME/.local/share/color-schemes"

# Cores para o output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${GREEN}Iniciando a instalação dos dotfiles...${NC}"
echo -e "${BLUE}
 ██████████             █████       ██████   ███  ████                  
░░███░░░░███           ░░███       ███░░███ ░░░  ░░███                  
 ░███   ░░███  ██████  ███████    ░███ ░░░  ████  ░███   ██████   █████ 
 ░███    ░███ ███░░███░░░███░    ███████   ░░███  ░███  ███░░███ ███░░  
 ░███    ░███░███ ░███  ░███    ░░░███░     ░███  ░███ ░███████ ░░█████ 
 ░███    ███ ░███ ░███  ░███ ███  ░███      ░███  ░███ ░███░░░   ░░░░███
 ██████████  ░░██████   ░░█████   █████     █████ █████░░██████  ██████ 
░░░░░░░░░░    ░░░░░░     ░░░░░   ░░░░░     ░░░░░ ░░░░░  ░░░░░░  ░░░░░░  
${NC}
"

# ------------------------------------------------------
# Instalação de Pacotes
# ------------------------------------------------------
install_packages() {
  echo -e "${YELLOW}[*] Instalando pacotes necessários...${NC}"

  # ---!!! IMPORTANTE !!!---
  # O script assume que você está usando Debian/Ubuntu (com apt).
  # Se você usa outra distribuição, comente/descomente e ajuste a linha correspondente.

  # --- Debian/Ubuntu (apt) ---
  sudo apt update && sudo apt install -y \
    bat cava dunst fish lazygit lsd qutebrowser starship gum waybar wlogout \
    nmap qrencode jq curl unzip mpv python3 fonts-firacode git gh build-essential

  # --- Arch Linux (pacman) ---
  # sudo pacman -S --noconfirm --needed \
  #     bat cava fish lazygit lsd neovim qutebrowser starship waybar wlogout \
  #     nmap qrencode jq curl unzip mpv python ttf-nerd-fonts-symbols git gh base-devel

  # --- Fedora (dnf) ---
  # sudo dnf install -y \
  #     bat cava fish lazygit lsd neovim qutebrowser starship \
  #     nmap qrencode jq curl unzip mpv python3 fira-code-fonts git gh
  # sudo dnf groupinstall -y "Development Tools"

  # Instalação do Superfile via script
  echo -e "${YELLOW}[*] Instalando Superfile...${NC}"
  bash -c "$(curl -sLo- https://superfile.dev/install.sh)"

  echo -e "${GREEN}[+] Pacotes instalados com sucesso.${NC}"
  echo ""
}

# ------------------------------------------------------
# Instalação do Neovim (versão mais recente)
# ------------------------------------------------------
install_neovim() {
  echo -e "${YELLOW}[*] Instalando a versão mais recente do Neovim...${NC}"
  local NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
  local DOWNLOAD_DIR
  DOWNLOAD_DIR=$(mktemp -d)
  local INSTALL_DIR="/opt/nvim-linux-x86_64"

  echo "    -> Baixando Neovim de $NVIM_URL"
  if ! curl --fail -L "$NVIM_URL" -o "$DOWNLOAD_DIR/nvim-linux-x86_64.tar.gz"; then
    echo -e "\033[0;31m[!] Falha no download do Neovim. Abortando instalação do Neovim.${NC}"
    rm -rf "$DOWNLOAD_DIR"
    return 1
  fi

  echo "    -> Extraindo para $DOWNLOAD_DIR"
  tar -xzf "$DOWNLOAD_DIR/nvim-linux-x86_64.tar.gz" -C "$DOWNLOAD_DIR"

  echo "    -> Removendo instalação antiga (se existir) e movendo para $INSTALL_DIR"
  if [ -d "$INSTALL_DIR" ]; then
    sudo rm -rf "$INSTALL_DIR"
    echo "    -> Instalação antiga removida."
  fi
  sudo mv "$DOWNLOAD_DIR/nvim-linux-x86_64" "$INSTALL_DIR"

  echo "    -> Criando links simbólicos em $LOCAL_BIN_DIR"
  mkdir -p "$LOCAL_BIN_DIR"
  ln -sf "$INSTALL_DIR/bin/nvim" "$LOCAL_BIN_DIR/nvim"
  ln -sf "$INSTALL_DIR/bin/nvim" "$LOCAL_BIN_DIR/vim"

  rm -rf "$DOWNLOAD_DIR"
  echo -e "${GREEN}[+] Neovim instalado com sucesso em $INSTALL_DIR.${NC}"
  echo ""
}

# ------------------------------------------------------
# Instalação das Fontes
# ------------------------------------------------------
install_fonts() {
  echo -e "${YELLOW}[*] Instalando fontes (BlexMono Nerd Font)...${NC}"
  mkdir -p "$FONTS_DIR"
  cp -r "$DOTFILES_DIR/fonts/"* "$FONTS_DIR/"
  fc-cache -fv >/dev/null 2>&1
  echo -e "${GREEN}[+] Fontes instaladas e cache atualizado.${NC}"
  echo ""
}

# ------------------------------------------------------
# Cópia de Configurações
# ------------------------------------------------------
copy_configs() {
  echo -e "${YELLOW}[*] Copiando configurações...${NC}"
  mkdir -p "$CONFIG_DIR"

  # Lista de diretórios de configuração para copiar
  configs_to_copy=(
    bat cava dunst fish lazygit lsd nvim qutebrowser superfile waybar wlogout
  )

  for config in "${configs_to_copy[@]}"; do
    # Remove configuração existente se houver
    [ -d "$CONFIG_DIR/$config" ] && rm -rf "$CONFIG_DIR/$config"
    cp -r "$DOTFILES_DIR/$config" "$CONFIG_DIR/$config"
    echo -e "    -> Copiado ${BLUE}$config${NC}"
  done

  # Arquivos de configuração individuais
  cp -f "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"
  echo -e "    -> Copiado ${BLUE}starship.toml${NC}"

  # Configurações do Konsole
  mkdir -p "$KONSOLE_PROFILE_DIR"
  cp -f "$DOTFILES_DIR/konsole/Broly.profile" "$KONSOLE_PROFILE_DIR/Broly.profile"
  cp -f "$DOTFILES_DIR/konsole/catppuccin-mocha.colorscheme" "$KONSOLE_PROFILE_DIR/catppuccin-mocha.colorscheme"
  echo -e "    -> Copiado ${BLUE}Konsole (perfil e tema)${NC}"

  # Esquemas de cores do Plasma
  mkdir -p "$PLASMA_COLOR_DIR"
  cp -f "$DOTFILES_DIR/color-schemes/"* "$PLASMA_COLOR_DIR/"
  echo -e "    -> Copiados ${BLUE}Esquemas de Cores do Plasma${NC}"
  echo -e "${GREEN}[+] Configurações copiadas com sucesso.${NC}"
  echo ""
}

# ------------------------------------------------------
# Instalação dos Scripts
# ------------------------------------------------------
install_scripts() {
  echo -e "${YELLOW}[*] Instalando scripts...${NC}"

  # Casos especiais: lofi.py e .music.json na home
  cp -f "$DOTFILES_DIR/scripts/lofi.py" "$HOME/.lofi.py"
  echo -e "    -> Copiado ${BLUE}lofi.py${NC} para ${HOME}/.lofi.py"
  cp -f "$DOTFILES_DIR/scripts/.music.json" "$HOME/.music.json"
  echo -e "    -> Copiado ${BLUE}.music.json${NC} para ${HOME}/.music.json"

  # Download de scripts externos
  echo -e "${YELLOW}[*] Baixando scripts externos para a home...${NC}"
  curl -sL "https://github.com/Henriquehnnm/HydroFetch/raw/refs/heads/main/Fetch-scripts/hydrofetch.sh" -o "$HOME/.hydrofetch.sh"
  echo -e "    -> Baixado ${BLUE}hydrofetch.sh${NC} para ${HOME}/.hydrofetch.sh"
  curl -sL "https://github.com/Henriquehnnm/HydroTop/raw/refs/heads/main/hydrotop.py" -o "$HOME/.hydrotop.py"
  echo -e "    -> Baixado ${BLUE}hydrotop.py${NC} para ${HOME}/.hydrotop.py"
  curl -sL "https://github.com/Henriquehnnm/HydroToDo/raw/refs/heads/main/hydrotodo.py" -o "$HOME/.hydrotodo.py"
  echo -e "    -> Baixado ${BLUE}hydrotodo.py${NC} para ${HOME}/.hydrotodo.py"

  # Instalação dos outros scripts em .local/bin
  echo -e "${YELLOW}[*] Instalando scripts restantes em $LOCAL_BIN_DIR...${NC}"
  mkdir -p "$LOCAL_BIN_DIR"

  # Instala os scripts .sh, removendo a extensão no destino
  for script in "$DOTFILES_DIR/scripts/"*.sh; do
    if [ -f "$script" ]; then
      local script_name
      script_name=$(basename "$script" .sh)
      local dest_path="$LOCAL_BIN_DIR/$script_name"
      ln -sf "$script" "$dest_path"
      chmod +x "$dest_path"
      echo -e "    -> Script ${BLUE}$script_name${NC} instalado."
    fi
  done

  echo -e "${GREEN}[+] Scripts instalados com sucesso.${NC}"
  echo ""
}

# ------------------------------------------------------
# Função Principal
# ------------------------------------------------------
main() {
  install_packages
  install_neovim
  install_fonts
  copy_configs
  install_scripts

  echo -e "${GREEN}=======================================================${NC}"
  echo -e "${GREEN}      Dotfiles instalados com sucesso! 🎉${NC}"
  echo -e "${GREEN}=======================================================${NC}"
  echo ""
  echo -e "   Por favor, reinicie seu terminal ou mude para o shell 'fish'"
  echo -e "   para que todas as alterações tenham efeito."
  echo ""
  echo -e "   ${YELLOW}💡Dica:${NC} Para uma experiência de janelas lado a lado (tiling) no KDE,"
  echo -e "   considere instalar o script ${BLUE}Krohnkite${NC}. Não é obrigatório, mas é recomendado."
  echo -e "   Visite: ${BLUE}https://github.com/esjeon/krohnkite${NC}"
  echo ""
}

# Executa a função principal
main
