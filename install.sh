#!/bin/bash
#
# Installation Script for Broly's Dotfiles
#
# This script copies configuration files and installs dependencies
# for an Arch Linux environment with Hyprland.
#

set -e

# --- STYLING AND AESTHETICS ---
BOLD="\e[1m"
UNDERLINE="\e[4m"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_YELLOW="\e[33m"
COLOR_BLUE="\e[34m"
COLOR_MAGENTA="\e[35m"
COLOR_CYAN="\e[36m"
COLOR_RESET="\e[0m"

# --- HELPER FUNCTIONS FOR LOGGING ---
info() {
    echo -e "${BOLD}${COLOR_BLUE}[INFO]${COLOR_RESET} $1"
}

warning() {
    echo -e "${BOLD}${COLOR_YELLOW}[WARNING]${COLOR_RESET} $1"
}

success() {
    echo -e "${BOLD}${COLOR_GREEN}[SUCCESS]${COLOR_RESET} $1"
}

step() {
    echo -e "\n${BOLD}${COLOR_MAGENTA}> $1...${COLOR_RESET}"
}

# --- BANNER ---
print_banner() {
    cat << EOF
    ____  ____  __________________    ___________ 
   / __ \/ __ \/_  __/ ____/  _/ /   / ____/ ___/ 
  / / / / / / / / / / /_   / // /   / __/  \__ \ 
 / /_/ / /_/ / / / / __/ _/ // /___/ /___ ___/ / 
/_____/\____/ /_/ /_/   /___/_____/_____//____/
EOF
    echo -e "${BOLD}\nWelcome to the Dotfiles Installer!${COLOR_RESET}"
    echo "This script will set up your environment."
}

# --- PACKAGES ---
PACKAGES=(
    # Main Environment
    hyprland waybar hyprpaper hypridle dunst kitty wofi sddm
    qt5-graphicaleffects qt5-quickcontrols2

    # Shell & Terminal Utilities
    fish neovim superfile starship

    # System Utilities
    brightnessctl playerctl wireplumber pipewire-pulse wl-clipboard
    grim slurp polkit-kde-agent

    # Script Dependencies
    qrencode curl jq nmap

    # Build & Neovim Dependencies
    git base-devel ripgrep fd unzip

    # Fonts
    ttf-jetbrains-mono-nerd noto-fonts-emoji
)

# --- DEPENDENCY INSTALLATION ---
install_dependencies() {
    step "Installing dependencies"
    warning "Sudo password will be required to install packages."

    sudo pacman -Syu --needed --noconfirm "${PACKAGES[@]}"

    success "Dependencies are up to date."
}

# --- CONFIGURATION FILE COPYING ---
copy_configs() {
    step "Copying configuration files"
    local SRC_DIR
    SRC_DIR="$(pwd)"
    local CONFIG_DEST_DIR="$HOME/.config"

    mkdir -p "$CONFIG_DEST_DIR"

    CONFIG_DIRS=(
        dunst fish hypr kitty nvim superfile waybar wlogout wofi
    )

    for dir in "${CONFIG_DIRS[@]}"; do
        if [ -d "$SRC_DIR/$dir" ]; then
            info "Copying \'$dir\' to \'$CONFIG_DEST_DIR\'"
            cp -r "$SRC_DIR/$dir" "$CONFIG_DEST_DIR/"
        else
            warning "Directory \'$dir\' not found. Skipping."
        fi
    done

    success "Configuration files copied."
}

# --- SPECIAL FILE HANDLING ---
copy_special_files() {
    step "Copying special files (SDDM, Wallpaper, Scripts)"
    local SRC_DIR
    SRC_DIR="$(pwd)"

    # SDDM Theme
    if [ -d "$SRC_DIR/sddm/sddm-astronaut-theme" ]; then
        warning "Sudo password required for SDDM theme."
        info "Copying SDDM theme to /usr/share/sddm/themes/"
        sudo cp -r "$SRC_DIR/sddm/sddm-astronaut-theme" "/usr/share/sddm/themes/"
    else
        warning "SDDM theme 'sddm-astronaut-theme' not found. Skipping."
    fi

    # Wallpaper
    if [ -f "$SRC_DIR/wallpapers/wall.png" ]; then
        info "Copying wallpaper to ~/Pictures/Wallpapers/"
        mkdir -p "$HOME/Pictures/Wallpapers"
        cp "$SRC_DIR/wallpapers/wall.png" "$HOME/Pictures/Wallpapers/"
    else
        warning "Wallpaper 'wall.png' not found. Skipping."
    fi

    # Scripts
    if [ -d "$SRC_DIR/scripts" ]; then
        info "Copying scripts to ~/.local/bin/ and making them executable"
        mkdir -p "$HOME/.local/bin"
        cp "$SRC_DIR/scripts/"* "$HOME/.local/bin/"
        chmod +x "$HOME/.local/bin/"*
    else
        warning "Directory 'scripts' not found. Skipping."
    fi

    success "Special files handled."
}

# --- MAIN FUNCTION ---
main() {
    print_banner
    install_dependencies
    copy_configs
    copy_special_files

    echo -e "\n${COLOR_YELLOW}--------------------------------------------------${COLOR_RESET}"
    success "Installation completed successfully!"
    warning "A system restart is recommended for all changes to take effect."
    info "To set Fish as your default shell, run: ${BOLD}chsh -s /usr/bin/fish${COLOR_RESET}"
    echo -e "${COLOR_YELLOW}--------------------------------------------------${COLOR_RESET}\n"
}

# --- EXECUTION ---
main
