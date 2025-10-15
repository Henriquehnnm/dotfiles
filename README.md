<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Catppuccin Logo"/>
  <h2 align="center">Dotfiles</h2>
  <p align="center"><em>Minimal, beautiful, and highly customized Linux setup</em></p>
</p>

<p align="center">
  <img alt="Debian" src="https://img.shields.io/badge/Debian-13-313244?style=for-the-badge&logo=debian&logoColor=f38ba8&labelColor=1e1e2e"/>
  <img alt="KDE Plasma" src="https://img.shields.io/badge/KDE-Plasma-313244?style=for-the-badge&logo=kde&logoColor=89b4fa&labelColor=1e1e2e"/>
  <img alt="Neovim" src="https://img.shields.io/badge/Neovim-313244?style=for-the-badge&logo=neovim&logoColor=a6e3a1&labelColor=1e1e2e"/>
  <a href="https://catppuccin.com/">
    <img src="https://img.shields.io/badge/theme-catppuccin-313244?style=for-the-badge&logo=catppuccin&logoColor=f5e0dc&labelColor=1e1e2e"/>
  </a>
</p>

<p align="center">
  <a href="README.md">🇬🇧 Read in English</a> | 
  <a href="README.pt_BR.md">🇧🇷 Leia em Português</a> |
  <a href="README.es.md">🇪🇸 Leer en Español</a>
</p>

---

## ✨ About

This repository gathers my personal collection of configuration files ("dotfiles") for Linux, optimized for **Debian 13** using the **KDE Plasma** interface, the **Neovim** editor with [AstroVim](https://astrovim.com/), and themed with [Catppuccin](https://catppuccin.com/). Each configuration is tailored for minimalism, beauty, and high customization.

---

## 🖼️ Screenshots

<p align="center">
  <img src="public/desktop.png?1" width="49%">
  <img src="public/nvim.png?1" width="49%">
  <img src="public/qute.png?1" width="49%">
  <img src="public/terminal.png?1" width="49%">
</p>

---

## 📦 Requirements

<details>
  <summary>Click to see the list of requirements</summary>

- [Debian Linux](https://www.debian.org/) (recommended)
- [KDE Plasma](https://kde.org/plasma-desktop/)
- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **with [AstroVim](https://astrovim.com/)**
- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/)
- [Rust](https://www.rust-lang.org/)
- [Starship](https://starship.rs/)
- [Bat](https://github.com/sharkdp/bat)
- [Cava](https://github.com/karlstav/cava)
- [Dunst](https://dunst-project.org/)
- [lsd](https://github.com/lsd-rs/lsd)
- [Superfile](https://superfile.netlify.app/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Qutebrowser](https://qutebrowser.org)
- [wlogout](https://github.com/ArtsyMacaw/wlogout)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Konsole](https://konsole.kde.org/)
- KDE Plasma Color Schemes
- [Catppuccin theme](https://catppuccin.com/) (applied to all supported apps)
- Custom fonts (see the [`fonts`](./fonts) folder)

</details>

---

## 🚀 Installation & Usage

### Automatic Installation (Recommended)
> **Warning**
> The `install.sh` script automatically detects your package manager (`apt`, `pacman`, `dnf`) and will replace any conflicting configuration files. Please back up your data before proceeding.
1. **Clone the repository:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git && cd dotfiles
   ```
2. **Run the installer:**
   ```sh
   ./install.sh
   ```
### Manual Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. **Backup your current configuration files** before replacing them.
3. **Copy or create symlinks** from the desired files/folders to your `$HOME` directory.

   Examples:
   ```sh
   cp -r nvim ~/.config/
   ln -s ~/dotfiles/fish ~/.config/fish
   ```

4. **Install the requirements** according to your distro, and apply the configurations as needed.

---

## 💡 Tips

- Adapt the files to your personal preferences.
- I recommend reviewing the configs before overwriting your own.

---

## 👥 People

- **Made by:** [Henriquehnnm](https://github.com/Henriquehnnm)
- **Thanks to:** [tuxslack](https://github.com/tuxslack)

---

## 📝 License

Distributed under the [GPLv3 License](./LICENSE).

---

<p align="center">
  <sub>Made with ❤️ by <a href="https://github.com/Henriquehnnm">Henriquehnnm</a></sub>
</p>
