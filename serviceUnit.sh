#!/bin/bash

# Crie ou edite o arquivo de serviço do MySQL
echo "[Unit]
Description=MySQL Database Server
After=network.target" | sudo tee /etc/systemd/system/MySQL.service

# Crie ou edite o arquivo de serviço do Web Server
echo "[Unit]
Description=Web Server
After=MySQL.service" | sudo tee /etc/systemd/system/WebServer.service

# Recarregue o systemd para aplicar as alterações
sudo systemctl daemon-reload

# Habilite e inicie os serviços
sudo systemctl enable MySQL.service
sudo systemctl enable WebServer.service

sudo systemctl start MySQL.service
sudo systemctl start WebServer.service
