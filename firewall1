#!/bin/bash

# Limpando todas as regras existentes
iptables -F
iptables -t nat -F

# Configurando política padrão (DROP por padrão)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Permitindo tráfego na interface loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Permitindo tráfego de resposta e estabelecido
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Configurando regras de NAT para encaminhamento de portas
# aqui, está redirecionando porta 80 para 8080
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Salva as configurações do iptables
service iptables save
service iptables restart
