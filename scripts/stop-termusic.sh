#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Find the process
PROCESS_NAME="termusic-server"
PID=$(pgrep -f $PROCESS_NAME)

if [ -z "$PID" ]; then
  echo -e "${YELLOW}Processo '$PROCESS_NAME' não encontrado.${NC}"
  exit 0
fi

# Confirmation
echo -e "${YELLOW}Processo '$PROCESS_NAME' (PID: $PID) encontrado. Deseja finalizá-lo? (s/n)${NC}"
read -r answer

if [[ "$answer" =~ ^[Ss]$ ]]; then
  kill "$PID"
  echo -e "${GREEN}Processo '$PROCESS_NAME' (PID: $PID) finalizado com sucesso.${NC}"
else
  echo -e "${RED}Operação cancelada.${NC}"
fi
