function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

# No greeting
set fish_greeting

# Use starship
starship init fish | source

# Aliases
alias ls 'eza --icons -1'
alias lt 'eza --icons -T'
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias cl "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'

# Zoxide
zoxide init fish | source

# Navegacao
alias cd z
alias .. 'z ..'
alias ..2 'cd ../..'
alias ..3 'cd ../../..'

# Criacao de Diretorios
alias mkdir 'mkdir -pv'

function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# Utils
alias update 'sudo pacman -Syu'
alias ips 'ip -c -br a'
alias local pwd

# Git
git config --global alias.graph 'log --graph --oneline --all --decorate'

# NPM & PNPM
set -Ux fish_user_paths ~/.npm-global/bin $fish_user_paths
alias new-vite 'pnpm create vite@latest'
alias new-astro 'pnpm create astro@latest --add tailwind'

# Bat
alias cat bat

# Python
function pp
    if not count $argv >/dev/null
        poetry
        return
    end

    set cmd $argv[1]
    set args $argv[2..-1]

    switch $cmd
        case i install add
            if test (count $args) -eq 0
                poetry install
            else
                poetry add $args
            end

        case rm un uninstall remove
            poetry remove $args

        case x run
            poetry run python $args

        case up update
            poetry update $args

        case s shell
            poetry shell

        case dev
            poetry run python main.py

        case test
            poetry run pytest

        case ls list
            poetry show --tree

        case '*'
            poetry $cmd $args
    end
end

complete -c pp -w poetry

alias py python3

# fnm (Fast Node Manager)
if type -q fnm
    fnm env --use-on-cd | source
end

# VSCodium
alias vsc codium

# Termusic
function stop-termusic -d "Encerra todos os processos do Termusic"
    set pids (pgrep -f termusic)

    if test -n "$pids"
        echo (set_color yellow)"Processos do Termusic encontrados (PIDs: $pids)"(set_color normal)

        read -l -P "Deseja encerrar o Termusic e o servidor de áudio? [y/N] " confirm

        switch $confirm
            case y Y yes Yes
                pkill -f termusic
                echo (set_color green)"Termusic encerrado com sucesso."(set_color normal)
            case '*'
                echo (set_color blue)"Operação cancelada."(set_color normal)
        end
    else
        echo (set_color red)"Nenhum processo do Termusic está rodando no momento."(set_color normal)
    end
end

# Github CLI
function nr -d "Cria um repositório no GitHub (atual ou nova pasta)"
    set repo_name $argv[1]

    if test "$repo_name" = "."
        set current_dir (basename (pwd))
        echo (set_color blue)"==> Transformando pasta atual ($current_dir) em repo no GitHub..."(set_color normal)

        git init
        gh repo create $current_dir --public --source=. --remote=origin --push
        echo (set_color green)"[OK] Repositório criado e push realizado!"(set_color normal)

    else if test -n "$repo_name"
        echo (set_color blue)"==> Criando novo projeto: $repo_name..."(set_color normal)

        gh repo create $repo_name --public --add-readme

        gh repo clone $repo_name

        cd $repo_name
        echo (set_color green)"[OK] Pasta criada e repositório clonado. Você já está dentro dela!"(set_color normal)

    else
        echo (set_color red)"Erro: Forneça um nome ou '.' para a pasta atual."(set_color normal)
        echo "Exemplo: nr meu-projeto  OU  nr ."
    end
end

# TODO
function todo
    # Cores do Fish
    set -l blue (set_color blue)
    set -l red (set_color red)
    set -l yellow (set_color yellow)
    set -l magenta (set_color magenta)
    set -l cyan (set_color cyan)
    set -l gray (set_color 555) # Cinza para o número da linha
    set -l reset (set_color normal)

    # Execução do rg
    rg --type-add 'code:*.{ts,js,rs,cpp,c,h,py,go,rb}' \
        -t code \
        --ignore-case \
        --line-number \
        --heading \
        --color always \
        "(//|/\*|#|--|\*)\s*(TODO|FIXME|FIX|BUG|UGLY|HACK|NOTE|IDEA|REVIEW|DEBUG|OPTIMIZE|ERROR|WARN|TEMP)\b" $argv \
        | sed -E "
        # 1. Adiciona espaço após o número da linha (ex: '15:' vira '15:  ')
        s/^([0-9]+:)/\1  /g;
        
        # 2. Colore as tags
        s/(TODO|NOTE|IDEA)/$blue\1$reset/gI;
        s/(ERROR|BUG|FIXME)/$red\1$reset/gI;
        s/(WARN|OPTIMIZE)/$yellow\1$reset/gI;
        s/(HACK|UGLY)/$magenta\1$reset/gI;
        s/(REVIEW|DEBUG|TEMP)/$cyan\1$reset/gI;
    "
end

# PNPM GLOBAL
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- "*$PNPM_HOME*" $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

# Helix
alias hx helix

function pynit -d "Initialize a Python project with Poetry and local venv"
    # 1. Force venv to stay inside the project folder
    echo (set_color blue)"==> Configuring local virtualenv (.venv)..."(set_color normal)
    poetry config virtualenvs.in-project true --local

    # 2. Init pyproject.toml if it's missing
    if not test -f pyproject.toml
        echo (set_color yellow)"[!] pyproject.toml not found. Running poetry init --quiet..."(set_color normal)
        poetry init
    end

    # 3. Create the venv and install base deps
    echo (set_color blue)"==> Syncing environment..."(set_color normal)
    poetry install --no-root

    # 4. Activate it for the current shell
    if test -d .venv
        echo (set_color blue)"==> Activating virtual environment..."(set_color normal)
        eval (poetry env activate)
        echo (set_color green)"[OK] Environment ready! Use 'pp i <lib>' to add packages."(set_color normal)
    else
        echo (set_color red)"[ERROR] Failed to create .venv. Check your Python installation."(set_color normal)
    end
end
