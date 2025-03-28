#!/bin/bash

LOG_FILE="$(pwd)/disk_alert.log" #cria o arquivo de log
THRESHOLD=80 #limite para arlarmar
USAGE=$(df --output=pcent / | tail -1 | tr -d '% ') # Pega uso atual do disco
MSG="[$(date '+%d/%m/%Y %H:%M:%S')] Uso do disco: ${USAGE}%" # Formata a hora no arquivo de log

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "${MSG} - ALERTA: Uso acima de ${THRESHOLD}%" >> "$LOG_FILE"

else
    echo "${MSG} - disco normal" >> "$LOG_FILE"

fi



echo "Executado com sucesso, verifique o arquivo de log disk_alert.log"