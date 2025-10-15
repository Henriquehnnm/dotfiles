<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo Catppuccin"/>
  <h2 align="center">Dotfiles</h2>
  <p align="center"><em>Configuración de Linux minimalista, hermosa y altamente personalizada</em></p>
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

## ✨ Acerca de

Este repositorio reúne mi colección personal de archivos de configuración ("dotfiles") para Linux, optimizados para **Debian 13** usando la interfaz **KDE Plasma**, el editor **Neovim** con [AstroVim](https://astrovim.com/) y tematizados con [Catppuccin](https://catppuccin.com/). Cada configuración está diseñada para ser minimalista, hermosa y altamente personalizada.

---

## 🖼️ Capturas de Pantalla

<p align="center">
  <img src="public/desktop.png?1" width="49%">
  <img src="public/nvim.png?1" width="49%">
  <img src="public/qute.png?1" width="49%">
  <img src="public/terminal.png?1" width="49%">
</p>

---

## 📦 Requerimientos

<details>
  <summary>Haz clic para ver la lista de requerimientos</summary>

- [Debian Linux](https://www.debian.org/) (recomendado)
- [KDE Plasma](https://kde.org/plasma-desktop/)
- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **con [AstroVim](https://astrovim.com/)**
- [Node.js](https://nodejs.org/) y [npm](https://www.npmjs.com/)
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
- Esquemas de color de KDE Plasma
- [Tema Catppuccin](https://catppuccin.com/) (aplicado en todas las aplicaciones compatibles)
- Fuentes personalizadas (ver la carpeta [`fonts`](./fonts))

</details>

---

## 🚀 Instalación y Uso

### Instalación Automática (Recomendado)
> **Advertencia**
> El script `install.sh` detecta automáticamente tu gestor de paquetes (`apt`, `pacman`, `dnf`) y reemplazará cualquier archivo de configuración conflictivo. Por favor, haz una copia de seguridad de tus datos antes de proceder.
1. **Clona el repositorio:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git && cd dotfiles
   ```
2. **Ejecuta el instalador:**
   ```sh
   ./install.sh
   ```
### Instalación Manual
1. **Clona el repositorio:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. **Haz una copia de seguridad de tus archivos de configuración actuales** antes de reemplazarlos.
3. **Copia o crea enlaces simbólicos** de los archivos/carpetas deseados a tu directorio `$HOME`.

   Ejemplos:
   ```sh
   cp -r nvim ~/.config/
   ln -s ~/dotfiles/fish ~/.config/fish
   ```

4. **Instala los requisitos** de acuerdo a tu distribución y aplica las configuraciones según sea necesario.

---

## 💡 Consejos

- Adapta los archivos a tus preferencias personales.
- Recomiendo revisar las configuraciones antes de sobrescribir las tuyas.

---

## 👥 Personas

- **Hecho por:** [Henriquehnnm](https://github.com/Henriquehnnm)
- **Gracias a:** [tuxslack](https://github.com/tuxslack)

---

## 📝 Licencia

Distribuido bajo la [Licencia GPLv3](./LICENSE).

---

<p align="center">
  <sub>Hecho con ❤️ por <a href="https://github.com/Henriquehnnm">Henriquehnnm</a></sub>
</p>
