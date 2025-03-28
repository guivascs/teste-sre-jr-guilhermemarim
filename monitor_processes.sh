#!/bin/bash

touch "$(pwd)/monitor_process_monitor.log" #criacao de arquivo de log
$FILE_LOG="$(pwd)/monitor_process_monitor.log" # Define o caminho do arquivo de log

echo "=== Ultima atualizacao $(date '+%d/%m/%Y %H:%M:%S') ===" >> $FILE_LOG # Registra a data/hora atual no log

echo -e "\n" >> $FILE_LOG # Adiciona espaçamento entre as seções

echo -e "Load Average: $(uptime | awk -F 'load average: ' '{print $2}')\n" >> $FILE_LOG #Consumo de CPU 

echo -e "\n=================================\n" >> $FILE_LOG

free -h | awk '/Mem:/ {print "Memória Livre: "$4} /Swap:/ {print "Swap Livre: "$4}' >> $FILE_LOG #consumo de memoria

echo -e "\n=================================\n" >> $FILE_LOG

# processos de CPU
echo "Os 5 processos que mais esta consumindo CPU:" >> $FILE_LOG
ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> $FILE_LOG

#
echo -e "\n" >> $FILE_LOG

# processos memoria
echo "Os 5 processos que mais esta consumindo Memória:" >> $FILE_LOG
ps -eo pid,cmd,%mem,%cpu --sort=-%mem | head -n 6 >> $FILE_LOG

echo -e "\n=================================\n" >> $FILE_LOG