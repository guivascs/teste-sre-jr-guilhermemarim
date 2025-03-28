#!/bin/bash


#criacao de arquivo de log
touch "$(pwd)/monitor_process_monitor.log"

# Define o caminho do arquivo de log
LOG_FILE="$(pwd)/monitor_process_monitor.log"

# Registra a data/hora atual no log
echo "=== Ultima atualizacao $(date '+%d/%m/%Y %H:%M:%S') ===" >> $LOG_FILE

# Adiciona espaçamento entre as seções
echo -e "\n" >> $LOG_FILE

#Consumo de CPU 
echo -e "Load Average: $(uptime | awk -F 'load average: ' '{print $2}')\n" >> $LOG_FILE

#Adiciona separacao
echo -e "\n=================================\n" >> $LOG_FILE

#consumo de memoria
free -h | awk '/Mem:/ {print "Memória Livre: "$4} /Swap:/ {print "Swap Livre: "$4}' >> $LOG_FILE

#Adiciona separacao
echo -e "\n=================================\n" >> $LOG_FILE

# Lista os 5 processos que mais consomem CPU
echo "Os 5 processos que mais esta consumindo CPU:" >> $LOG_FILE
ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> $LOG_FILE

# Adiciona espaçamento entre as seções
echo -e "\n" >> $LOG_FILE

# Lista os 5 processos que mais consomem memória
echo "Os 5 processos que mais esta consumindo Memória:" >> $LOG_FILE
ps -eo pid,cmd,%mem,%cpu --sort=-%mem | head -n 6 >> $LOG_FILE

# Adiciona separador final
echo -e "\n=================================\n" >> $LOG_FILE