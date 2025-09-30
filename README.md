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

---

## ✨ Sobre

Este repositório reúne minha coleção pessoal de arquivos de configuração ("dotfiles") para Linux, otimizados para **Debian 13** usando a interface **KDE Plasma**, o editor **Neovim** com [LazyVim](https://www.lazyvim.org/), e diversos aplicativos e ferramentas modernas. O objetivo é criar um ambiente visualmente agradável, funcional e fácil de manter, com o tema [Catppuccin](https://catppuccin.com/) aplicado em todos os lugares possíveis.

---

## 🖼️ Screenshots

| Desktop | Neovim | Qutebrowser | Terminal |
|:---:|:---:|:---:|:---:|
| ![Desktop](public/desktop.png?1) | ![Neovim](public/nvim.png?1) | ![qute](public/qute.png?1) | ![Terminal](public/terminal.png?1) |

---

## 🗂️ Estrutura do Repositório

```
.
├── bat/           # Configuração do 'bat' (file viewer)
├── cava/          # Configuração do 'cava' (visualizador de áudio)
├── fish/          # Funções, aliases e configurações do shell Fish
├── fonts/         # Fontes personalizadas
├── konsole/       # Configuração do terminal Konsole
├── lazygit/       # Configuração do Lazygit (UI para git)
├── nvim/          # Setup completo do Neovim com LazyVim
├── public/        # Imagens e outros assets públicos
├── qutebrowser/   # Configuração do Qutebrowser
├── scripts/       # Scripts pessoais úteis
├── starship.toml  # Configuração do prompt Starship
├── superfile/     # Config do file manager TUI Superfile
├── wallpapers/    # Coleção de wallpapers
├── waybar/        # Config do Waybar (barra de status)
├── wlogout/       # Configuração do wlogout (menu de logout)
└── LICENSE
```

---

## 📦 Requisitos

- [Debian Linux](https://www.debian.org/) (recomendado)
- [KDE Plasma](https://kde.org/plasma-desktop/)
- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **com [LazyVim](https://www.lazyvim.org/)**
- [Starship](https://starship.rs/)
- [Bat](https://github.com/sharkdp/bat)
- [Cava](https://github.com/karlstav/cava)
- [Superfile](https://superfile.netlify.app/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Qutebrowser](https://qutebrowser.org)
- [wlogout](https://github.com/ArtsyMacaw/wlogout)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Konsole](https://konsole.kde.org/)
- [Krohnkite](https://github.com/esjeon/krohnkite) (tiling para KDE)
- Fontes personalizadas (veja a pasta [`fonts`](./fonts))
- Tema [Catppuccin](https://catppuccin.com/) (aplicado em todos os apps suportados)

---

## 🚀 Instalação & Uso

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. **Faça backup dos seus arquivos de configuração atuais** antes de substituí-los.
3. **Copie ou crie symlinks** dos arquivos/pastas desejados para o seu diretório `$HOME`.

   Exemplos:
   ```sh
   cp -r nvim ~/.config/
   ln -s ~/dotfiles/fish ~/.config/fish
   ```

4. **Instale os requisitos** de acordo com sua distro, e aplique as configurações conforme necessário.

---

## 💡 Dicas

- Adapte os arquivos conforme suas preferências pessoais.
- Recomendo revisar as configurações antes de sobrescrever as suas.

---

## 📝 Licença

Distribuído sob a [GPLv3 License](./LICENSE).

---

<p align="center">
  <sub>Feito com ❤️ por <a href="https://github.com/Henriquehnnm">Henriquehnnm</a></sub>
</p>
