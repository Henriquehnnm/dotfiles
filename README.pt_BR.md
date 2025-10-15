<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo Catppuccin"/>
  <h2 align="center">Dotfiles</h2>
  <p align="center"><em>Configuração Linux minimalista, bonita e altamente personalizada</em></p>
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

## ✨ Sobre

Este repositório reúne minha coleção pessoal de arquivos de configuração ("dotfiles") para Linux, otimizados para **Debian 13** usando a interface **KDE Plasma**, o editor **Neovim** com [AstroVim](https://astrovim.com/) e tematizados com [Catppuccin](https://catppuccin.com/). Cada configuração foi pensada para ser minimalista, bonita e altamente personalizável.

---

## 🖼️ Screenshots

<p align="center">
  <img src="public/desktop.png?1" width="49%">
  <img src="public/nvim.png?1" width="49%">
  <img src="public/qute.png?1" width="49%">
  <img src="public/terminal.png?1" width="49%">
</p>

---

## 📦 Requisitos

<details>
  <summary>Clique para ver a lista de requisitos</summary>

- [Debian Linux](https://www.debian.org/) (recomendado)
- [KDE Plasma](https://kde.org/plasma-desktop/)
- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **com [AstroVim](https://astrovim.com/)**
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
- Esquemas de Cores do KDE Plasma
- [Tema Catppuccin](https://catppuccin.com/) (aplicado em todos aplicativos compatíveis)
- Fontes personalizadas (veja a pasta [`fonts`](./fonts))

</details>

---

## 🚀 Instalação & Uso

### Instalação Automática (Recomendado)
> **Aviso**
> O script substituirá automaticamente quaisquer arquivos de configuração conflitantes. Faça backup dos seus dados antes de prosseguir.
1. **Clone o repositório:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git && cd dotfiles
   ```
2. **Execute o instalador:**
   ```sh
   ./install.sh
   ```
### Instalação Manual
1. **Clone o repositório:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. **Faça backup dos seus arquivos de configuração atuais** antes de substituí-los.
3. **Copie ou crie links simbólicos** dos arquivos/pastas desejados para seu diretório `$HOME`.

   Exemplos:
   ```sh
   cp -r nvim ~/.config/
   ln -s ~/dotfiles/fish ~/.config/fish
   ```

4. **Instale os requisitos** conforme sua distribuição e aplique as configurações conforme necessário.

---

## 💡 Dicas

- Adapte os arquivos às suas preferências pessoais.
- Recomendo revisar as configurações antes de sobrescrever as suas.

---

## 👥 Pessoas

- **Feito por:** [Henriquehnnm](https://github.com/Henriquehnnm)
- **Agradecimentos a:** [tuxslack](https://github.com/tuxslack)

---

## 📝 Licença

Distribuído sob a [Licença GPLv3](./LICENSE).

---

<p align="center">
  <sub>Feito com ❤️ por <a href="https://github.com/Henriquehnnm">Henriquehnnm</a></sub>
</p>
