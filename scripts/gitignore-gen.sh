#!/usr/bin/env bash
# Gerador inteligente de .gitignore baseado no projeto

if [ $# -eq 0 ]; then
  echo "Uso: bash gitignore-gen.sh <linguagem1,linguagem2,...>"
  echo
  echo "Exemplos:"
  echo "  bash gitignore-gen.sh python"
  echo "  bash gitignore-gen.sh node,react,vscode"
  echo
  echo "💡 Para ver todas as linguagens:"
  echo "  curl -sL https://www.toptal.com/developers/gitignore/api/list | tr ',' '\n'"
  exit 1
fi

LANGUAGES="$1"
echo "🔍 Gerando .gitignore para: $LANGUAGES"
echo

GITIGNORE_CONTENT=$(curl -sL "https://www.toptal.com/developers/gitignore/api/$LANGUAGES")

if [[ "$GITIGNORE_CONTENT" == *"ERROR"* ]] || [ -z "$GITIGNORE_CONTENT" ]; then
  echo "❌ Erro ao buscar template. Verifique se as linguagens estão corretas."
  exit 1
fi

CUSTOM_IGNORE="

# ===== Customizações Locais =====
*.swp
*.swo
*~
.DS_Store
dist/
build/
*.log
.env
.env.local
"

echo "$GITIGNORE_CONTENT" > .gitignore
echo "$CUSTOM_IGNORE" >> .gitignore

echo "✅ .gitignore criado com sucesso!"
echo "📄 Preview:"
head -n 15 .gitignore
echo "..."
