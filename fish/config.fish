function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias pamcan pacman
    alias ls 'eza --icons -1'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    # ---[Criacao de diretorios]---
alias mkdir="mkdir -pv"

function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# ---[Hydro]---
alias hydrofetch="~/.hydrofetch.sh"
alias hydrotop="python3 ~/.hydrotop.py"
alias hydrotodo="~/.hydrotodo"
alias hf="~/.hydrofetch.sh"
alias ht="python3 ~/.hydrotop.py"
alias htd="~/.hydrotodo"

# ---[Clima]---
alias clima="curl wttr.in"

# ---[Extracao de arquivos]---
function extract
    switch $argv[1]
        case "*.tar.bz2"
            tar xjf $argv[1]
        case "*.tar.gz"
            tar xzf $argv[1]
        case "*.bz2"
            bunzip2 $argv[1]
        case "*.rar"
            unrar x $argv[1]
        case "*.gz"
            gunzip $argv[1]
        case "*.tar"
            tar xf $argv[1]
        case "*.tbz2"
            tar xjf $argv[1]
        case "*.tgz"
            tar xzf $argv[1]
        case "*.zip"
            unzip $argv[1]
        case "*.Z"
            uncompress $argv[1]
        case "*.7z"
            7z x $argv[1]
        case "*"
            echo "Formato não suportado: $argv[1]"
    end
end

# ---[Utilidades]---
alias cl="printf '\033[2J\033[3J\033[1;1H'"
alias update="sudo pacman -Syu"
alias ips="ip -c -br a"
alias local="pwd"

# ---[Lazygit]---
alias lzg="lazygit"

# ---[VSCodium]---
alias vscodium="vscodium --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
alias vsc="vscodium --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"

# ---[NPM]---
set -Ux fish_user_paths ~/.npm-global/bin $fish_user_paths
alias new-vite="npm create vite@latest"
alias new-astro="npm create astro@latest"

# ---[Bat]---
alias cat="bat"

    
end
