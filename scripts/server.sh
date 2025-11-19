#!/usr/bin/env bash

DURACAO_EXECUCAO="25m"
INTERVALO_REINICIO="25s"

echo "Iniciando o ciclo infinito de execução e reinício do 'npm run dev'..."

while true
do
    echo "========================================="
    echo "INÍCIO DO NOVO CICLO: $(date +'%Y-%m-%d %H:%M:%S')"
    echo "========================================="

    
    npm run dev &
    DEV_PID=$!

    notify-send "'npm run dev' iniciado com o PID: $DEV_PID" "Aguardando a duração da execução: $DURACAO_EXECUCAO..."

    echo 
    sleep $DURACAO_EXECUCAO

    
    notify-send "🛑 Tempo esgotado. Encerrando o processo $DEV_PID..."
    kill $DEV_PID

    notify-send "Processo encerrado."
    
    
    notify-send "⏳ Aguardando o intervalo de reinício: $INTERVALO_REINICIO..."

    sleep $INTERVALO_REINICIO

done
