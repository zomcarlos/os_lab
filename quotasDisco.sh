#!/bin/bash

# 1. Identifique o usuário
username="seu_usuario"

# 2. Configuração de Quotas
# Certifique-se de que quotas de disco estejam habilitadas no /etc/fstab.

# 3. Remonte o Sistema de Arquivos
sudo mount -o remount /

# 4. Instale as Ferramentas de Quotas
sudo apt-get install quota

# 5. Inicialize as Quotas
sudo quotacheck -cug /home  # Substitua /home pelo diretório do usuário
sudo quotaon /

# 6. Defina Limites de Disco
sudo edquota -u $username  # Isso abrirá um editor de texto. Configure os limites de disco desejados.

# 7. Verificação de Quotas
quota -u $username
