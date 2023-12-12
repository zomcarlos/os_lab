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
# redirecionando porta 443 para 8443, possibilitando o HTTPS ser enviado via SSL
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8443
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Salva as configurações do iptables
service iptables save
service iptables restart
