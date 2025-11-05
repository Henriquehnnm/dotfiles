# Dependências do Ambiente

Este arquivo lista todas as dependências necessárias para configurar o ambiente com base nos dotfiles deste repositório no Arch Linux.

## Instalação

Você pode instalar a maioria dos pacotes com o seguinte comando:

```bash
sudo pacman -S --needed - < packages.txt
```

## Sistema Principal e Interface Gráfica

Estes são os componentes essenciais para a interface do usuário e o gerenciamento de janelas.

| Pacote | Descrição |
| :--- | :--- |
| `hyprland` | Compositor principal do Wayland. |
| `waybar` | Barra de status altamente personalizável para Wayland. |
| `wofi` | Lançador de aplicativos e menus para Wayland. |
| `kitty` | Emulador de terminal rápido e com muitos recursos. |
| `fish` | Shell de linha de comando inteligente e amigável. |
| `dunst` | Daemon de notificação leve. |
| `hyprpaper` | Utilitário de papel de parede para Hyprland. |
| `hypridle` | Daemon de inatividade para Hyprland. |
| `hyprlock` | Screen locker para Hyprland. |
| `wlogout` | Menu de logout para Wayland. |
| `pavucontrol` | Mixer de volume para PulseAudio. |
| `brightnessctl` | Ferramenta para controlar o brilho da tela. |
| `playerctl` | Utilitário para controlar players de mídia. |
| `network-manager-applet` | Applet para gerenciar conexões de rede (`nmtui`). |
| `polkit-kde-agent` | Agente de autenticação para obter privilégios de administrador em apps gráficos. |
| `xdg-desktop-portal-hyprland` | Backend do portal de desktop para Hyprland (necessário para compartilhamento de tela, etc.). |
| `pipewire` | Servidor de áudio e vídeo de baixa latência. |
| `wireplumber` | Gerenciador de sessão para PipeWire. |

## Ferramentas de Linha de Comando (CLI)

Utilitários que melhoram a experiência no terminal.

| Pacote | Descrição |
| :--- | :--- |
| `bat` | Um clone do `cat` com realce de sintaxe e integração com Git. |
| `lsd` | Um clone do `ls` com cores, ícones e muitas outras funcionalidades. |
| `starship` | Prompt de shell minimalista, rápido e infinitamente personalizável. |
| `zoxide` | Uma ferramenta de navegação de diretórios mais inteligente. |
| `neovim` | Editor de texto baseado no Vim, focado em extensibilidade e usabilidade. |
| `lazygit` | Uma interface de terminal simples para comandos git. |
| `unzip` | Utilitário para descompactar arquivos `.zip`. |
| `unrar` | Utilitário para descompactar arquivos `.rar`. |
| `p7zip` | Utilitário para arquivos `.7z`. |
| `curl` | Ferramenta para transferir dados com URLs. |
| `python` | Linguagem de programação Python. |
| `npm` | Gerenciador de pacotes para Node.js. |
| `git` | Sistema de controle de versão distribuído. |
| `libnotify` | Biblioteca para enviar notificações (usada por scripts). |

## Fontes

As fontes usadas na configuração.

| Pacote | Descrição |
| :--- | :--- |
| `ttf-jetbrains-mono-nerd` | Fonte principal usada no terminal e em outros locais. |
| `papirus-icon-theme` | Tema de ícones usado nas notificações. |

## Dependências do Neovim (Mason)

Estas dependências são gerenciadas pelo Mason dentro do Neovim, mas você pode instalá-las globalmente se preferir.

| Pacote | Descrição |
| :--- | :--- |
| `lua-language-server` | Servidor de linguagem (LSP) para Lua. |
| `stylua` | Formatador de código para Lua. |
| `python-debugpy` | Debugger para Python. |
| `tree-sitter-cli` | Ferramenta de linha de comando para Tree-sitter. |

---

### Arquivo `packages.txt`

Para facilitar, você pode criar um arquivo `packages.txt` com o conteúdo abaixo e usar o comando `sudo pacman -S --needed - < packages.txt`.

```
# Sistema Principal e Interface Gráfica
hyprland
waybar
wofi
kitty
fish
dunst
hyprpaper
hypridle
hyprlock
wlogout
pavucontrol
brightnessctl
playerctl
network-manager-applet
polkit-kde-agent
xdg-desktop-portal-hyprland
pipewire
wireplumber

# Ferramentas de Linha de Comando (CLI)
bat
lsd
starship
zoxide
neovim
lazygit
unzip
unrar
p7zip
curl
python
npm
git
libnotify

# Fontes
ttf-jetbrains-mono-nerd
papirus-icon-theme

# Dependências do Neovim (Opcional, pode ser gerenciado pelo Mason)
lua-language-server
stylua
python-debugpy
tree-sitter-cli
```
