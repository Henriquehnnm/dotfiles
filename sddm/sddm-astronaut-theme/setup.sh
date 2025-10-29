#!/bin/bash

## SDDM Astronaut Theme Installer - Partes Selecionadas
## Baseado no original por Keyitdev https://github.com/Keyitdev/sddm-astronaut-theme
## Copyright (C) 2022-2025 Keyitdev

# Script funciona em Arch, Fedora, Ubuntu. Não testado em Void e openSUSE

set -euo pipefail

readonly THEME_NAME="sddm-astronaut-theme"
readonly THEMES_DIR="/usr/share/sddm/themes"
readonly METADATA="$THEMES_DIR/$THEME_NAME/metadata.desktop"
readonly DATE=$(date +%s)

readonly -a THEMES=(
    "everforest"
    # Adicionar outros temas se necessário, mas o script original só tinha este.
)

# Logging com fallback para echo
info() {
    if command -v gum &>/dev/null; then
        gum style --foreground 10 "✅ $*"
    else
        echo -e "\e[32m✅ $*\e[0m"
    fi
}

warn() {
    if command -v gum &>/dev/null; then
        gum style --foreground 11 "⚠  $*"
    else
        echo -e "\e[33m⚠  $*\e[0m"
    fi
}

error() {
    if command -v gum &>/dev/null; then
        gum style --foreground 9 "❌ $*" >&2
    else
        echo -e "\e[31m❌ $*\e[0m" >&2
    fi
}

# Funções de UI
confirm() {
    if command -v gum &>/dev/null; then
        gum confirm "$1"
    else
        echo -n "$1 (y/n): "; read -r r; [[ "$r" =~ ^[Yy]$ ]]
    fi
}

choose() {
    if command -v gum &>/dev/null; then
        gum choose --cursor.foreground 12 --header="" --header.foreground 12 "$@"
    else
        select opt in "$@"; do [[ -n "$opt" ]] && { echo "$opt"; break; }; done
    fi
}

spin() {
    local title="$1"; shift
    if command -v gum &>/dev/null; then
        gum spin --spinner="dot" --title="$title" -- "$@"
    else
        echo "$title"; "$@"
    fi
}

# Instalar gum se estiver faltando
install_gum() {
    local mgr=$(for m in pacman xbps dnf zypper apt; do command -v $m &>/dev/null && { echo ${m%%-*}; break; }; done)

    case $mgr in
        pacman) sudo pacman -S gum ;;
        dnf) sudo dnf install -y gum ;;
        zypper) sudo zypper install -y gum ;;
        xbps) sudo xbps-install -y gum ;;
        apt)
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
            echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
            sudo apt update && sudo apt install -y gum ;;
        *) error "Cannot install gum automatically"; return 1 ;;
    esac
}

# Checar e instalar gum
check_gum() {
    if ! command -v gum &>/dev/null; then
        warn "Gum não foi encontrado - oferece uma melhor experiência de UI"
        if confirm "Instalar gum?"; then
            install_gum && { info "Reiniciando com gum..."; main; } || warn "Usando fallback UI"
        fi
    fi
}

## 📦 Instalar Dependências

# Instalar dependências
install_deps() {
    local mgr=$(for m in pacman xbps dnf zypper apt; do command -v $m &>/dev/null && { echo ${m%%-*}; break; }; done)
    info "Gerenciador de pacotes: $mgr"

    # Dependências do SDDM e seus componentes Qt6 necessários para o tema
    case $mgr in
        pacman) sudo pacman --needed -S sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg ;;
        xbps) sudo xbps-install -y sddm qt6-svg qt6-virtualkeyboard qt6-multimedia ;;
        dnf) sudo dnf install -y sddm qt6-qtsvg qt6-qtvirtualkeyboard qt6-qtmultimedia ;;
        zypper) sudo zypper install -y sddm libQt6Svg6 qt6-virtualkeyboard qt6-multimedia ;;
        apt) sudo apt update && sudo apt install -y sddm qt6-svg-dev qml6-module-qtquick-virtualkeyboard qt6-multimedia-dev ;;
        *) error "Gerenciador de pacotes não suportado"; return 1 ;;
    esac
    info "Dependências instaladas (**sddm**, **qt6-svg**, **qt6-virtualkeyboard**, **qt6-multimedia**)"
}

## 🎨 Selecionar e Aplicar Tema

# Selecionar variante do tema
select_theme() {
    # Esta função assume que o tema já foi instalado em $THEMES_DIR/$THEME_NAME
    if [[ ! -f "$METADATA" ]]; then
        error "Arquivo de metadados não encontrado. Instale o tema em $THEMES_DIR/$THEME_NAME primeiro."
        return 1
    fi
    
    local theme=$(choose "${THEMES[@]}" || echo "astronaut") # Permite escolher entre as variantes disponíveis
    
    # Modifica o arquivo metadata.desktop para usar o arquivo de configuração da variante escolhida
    sudo sed -i "s|^ConfigFile=.*|ConfigFile=Themes/${theme}.conf|" "$METADATA"
    info "Variante de tema selecionada: **$theme**"
}

## ✨ Pré-visualizar Tema

preview_theme(){
    # Testa o tema SDDM no modo de teste
    if ! command -v sddm-greeter-qt6 &>/dev/null; then
        error "sddm-greeter-qt6 não encontrado. Certifique-se de que o SDDM e suas dependências Qt6 estão instaladas."
        return 1
    fi
    
    local theme_path="$THEMES_DIR/$THEME_NAME"
    if [[ ! -d "$theme_path" ]]; then
        error "Diretório do tema ($theme_path) não encontrado. O tema precisa ser instalado primeiro."
        return 1
    fi
    
    local log_file="/tmp/${THEME_NAME}_$DATE.txt"
    
    # Inicia o greeter em modo de teste e em background
    info "Iniciando preview do tema (pode demorar até 10s para fechar automaticamente)..."
    sddm-greeter-qt6 --test-mode --theme "$theme_path" > "$log_file" 2>&1 &
    greeter_pid=$!

    # Espera até 10 segundos para o usuário fechar a janela ou o tempo esgotar
    for i in {1..10}; do
        if ! kill -0 "$greeter_pid" 2>/dev/null; then
            break # Greeter fechou
        fi
        sleep 1
    done

    # Força o fechamento se ainda estiver rodando
    if kill -0 "$greeter_pid" 2>/dev/null; then
        kill "$greeter_pid"
        info "Preview fechado."
    fi

    # Tenta descobrir qual tema foi usado pelo metadata.desktop
    local current_theme="$(sed -n 's|^ConfigFile=Themes/\(.*\)\.conf|\1|p' $METADATA || echo "astronaut")"
    info "Tema atualmente configurado: **$current_theme**"
    info "Log do preview salvo em: **$log_file**"
}

## 💻 Menu Principal Simplificado

main() {
    [[ $EUID -eq 0 ]] && { error "Não execute como root"; exit 1; }
    
    check_gum
    clear
    while true; do
        if command -v gum &>/dev/null; then
            gum style --bold --padding "0 2" --border double --border-foreground 12 "🚀 SDDM Astronaut Theme - Ações Focadas"
        else
            echo -e "\e[36m🚀 SDDM Astronaut Theme - Ações Focadas\e[0m"
        fi

        local choice=$(choose \
            "📦 Instalar Dependências" \
            "🎨 Selecionar Variante do Tema (Requer tema instalado)" \
            "✨ Pré-visualizar Tema (Requer tema instalado)" \
            "❌ Sair")

        case "$choice" in
            "📦 Instalar Dependências") install_deps ;;
            "🎨 Selecionar Variante do Tema (Requer tema instalado)") select_theme ;;
            "✨ Pré-visualizar Tema (Requer tema instalado)") preview_theme;;
            "❌ Sair") info "Adeus!"; exit 0 ;;
        esac

        echo; if command -v gum &>/dev/null; then
            gum input --placeholder="Pressione Enter para continuar..."
        else
            echo -n "Pressione Enter para continuar..."; read -r
        fi
    done
}

# trap 'echo; info "Cancelado"; exit 130' INT TERM
main "$@"
