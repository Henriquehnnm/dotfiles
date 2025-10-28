if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

# ---[StarShip]---
starship init fish | source

# ---[Zoxide]---
zoxide init fish | source

# ---[Listagem]---
alias ls="lsd -1"
alias lt="lsd --tree"

# ---[Navegacao]---
alias cd="z"
alias ..="z .."
alias ..2="cd ../.."
alias ..3="cd ../../.."

# ---[Criacao de diretorios]---
alias mkdir="mkdir -pv"

function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# ---[Hydro]---
alias hydrofetch="~/.hydrofetch.sh"
alias hydrotop="python3 ~/.hydrotop.py"
alias hydrotodo="python3 ~/.hydrotodo.py"
alias hf="~/.hydrofetch.sh"
alias ht="python3 ~/.hydrotop.py"
alias htd="python3 ~/.hydrotodo.py"

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
alias cl="clear"
alias update="sudo apt update && sudo apt upgrade"
alias ips="ip -c -br a"
alias local="pwd"

# ---[Lazygit]---
alias lzg="lazygit"

# ---[Git]---
git config --global alias.graph "log --graph --oneline --all --decorate"

# ---[NPM]---
set -Ux fish_user_paths ~/.npm-global/bin $fish_user_paths
alias vite="npm create vite@latest"

# ---[Bat]---
alias cat="bat"
