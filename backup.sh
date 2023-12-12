#!/bin/bash

# Diretório de backup
backup_dir="/caminho/para/backup"
mkdir -p "$backup_dir"

# Data atual para nomear o arquivo de backup
backup_date=$(date +"%Y%m%d%H%M%S")
backup_file="$backup_dir/backup_$backup_date.tar.gz"

# Diretório a ser copiado
source_dir="/home"

# Comando tar para criar o arquivo de backup
tar -czvf "$backup_file" "$source_dir"

# Exclusão de backups mais antigos (opcional)
# Neste exemplo, mantemos apenas os últimos 5 backups
find "$backup_dir" -name "backup_*.tar.gz" -type f -mtime +5 -exec rm {} \;
