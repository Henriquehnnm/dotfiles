#!/usr/bin/env bash

# Este script clona múltiplos repositórios públicos de um usuário do GitHub
# usando o GitHub CLI (gh) e a ferramenta de seleção interativa gum.

#--- Verificação de Pré-requisitos ---
echo "Verificando os pré-requisitos..."

# Verifica se o GitHub CLI (gh) está instalado
if ! command -v gh &>/dev/null; then
  echo "Erro: GitHub CLI (gh) não está instalado."
  echo "Por favor, instale-o seguindo as instruções em https://cli.github.com/."
  exit 1
fi

# Verifica se a ferramenta gum está instalada para a seleção interativa
if ! command -v gum &>/dev/null; then
  echo "Erro: a ferramenta 'gum' para seleção interativa não está instalada."
  echo "Por favor, instale-a seguindo as instruções em https://github.com/charmbracelet/gum."
  echo "Você pode usar um gerenciador de pacotes como 'brew install gum' (macOS) ou 'sudo apt-get install gum' (Debian/Ubuntu)."
  exit 1
fi

#--- Coleta de Entrada do Usuário ---
# Solicita o nome de usuário do GitHub
read -p "Por favor, insira o nome de usuário do GitHub: " github_user

#--- Busca de Repositórios ---
echo "Buscando repositórios públicos de '$github_user'..."

# Usa o GitHub CLI para listar os nomes dos repositórios públicos
# A saída é filtrada para obter apenas os nomes, um por linha
# A variável repos é preenchida com o resultado
repos=($(gh repo list "$github_user" --public --json name --limit 1000 | jq -r '.[].name' 2>/dev/null))

# Verifica se a busca foi bem-sucedida (o nome de usuário é válido)
if [ $? -ne 0 ]; then
  echo "Erro: O nome de usuário '$github_user' não pôde ser encontrado ou não é válido."
  exit 1
fi

# Verifica se o usuário tem repositórios públicos
if [ ${#repos[@]} -eq 0 ]; then
  echo "Nenhum repositório público encontrado para o usuário '$github_user'."
  exit 0
fi

#--- Seleção Interativa ---
echo "---"
echo "Selecione os repositórios para clonar (use as setas e a barra de espaço para selecionar/desmarcar, e Enter para confirmar):"

# Usa gum para apresentar uma lista de seleção interativa dos repositórios
# A opção --no-limit permite a seleção de múltiplos itens
selected_repos=$(printf "%s\n" "${repos[@]}" | gum choose --no-limit)

# Verifica se o usuário selecionou algum repositório
if [ -z "$selected_repos" ]; then
  echo "Nenhum repositório selecionado. Saindo..."
  exit 0
fi

#--- Processo de Clonagem ---
echo "---"
echo "Clonando os repositórios selecionados..."

# Itera sobre cada repositório selecionado (separados por nova linha)
# e clona-o para o diretório atual
echo "$selected_repos" | while read -r repo; do
  echo "Clonando $repo..."
  # Usa o GitHub CLI para clonar o repositório, que gerencia a autenticação
  gh repo clone "$github_user/$repo"
done

echo "---"
echo "Processo de clonagem concluído!"
