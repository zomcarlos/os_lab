#!/bin/bash

echo Regras atuais:
#1. Lista todas as regras existentes na tabela filter
iptables -L
#2. Estabeleça uma política de proibição passagem de pacotes entre sub-redes

#3 Todos os pacotes oriundos do localhost gerados pelo Firewall devem ser aceitos.
iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
#4 Todos os pacotes oriundos da sub-rede 192.168.1.0/24 destinados ao firewall deve ser aceito
iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
#5 Os pacotes oriundos da sub-rede 10.0.0.0 (máscara 255.0.0.0) e destinados aos hosts cujos
#endereços IP respondem pelo nome www.playplay.com.br deverão ser descartados.
src = '10.0.0.0/8'
dest= '104.18.26.196,104.18.27.196'
iptables -A FORWARD -s $src -d $dest DROP
#6 Os pacotes destinados à sub-rede 172.16.0.0 (máscara 255.255.0.0) e oriundos aos hosts cujos 
#endereços IP respondem pelo nome www.msn.com deverão ser descartados
dest2= '172.16.0.0'
src2= '204.79.197.203'
iptables -A FORWARD -s $src2 -d $dest2 DROP
#7 Todos os pacotes que sairão pela interface eth0 tenham seu endereço de origem 
#alterado para 200.20.0.1
sudo modprobe iptable_nat
iptables -t nat -A POSTROUTING -i eth0 -j SNAT 200.20.0.1
#8 Qualquer pacote TCP, originado da máquina filtro, destinado a qualquer porta da máquina
#10.0.0.10, será desviado para a máquina 10.0.0.1
iptables -t nat -A PREROUTING -p tcp -D 10.0.0.10 -j DNAT --to 10.0.0.1
#9 Redirecionar todos os pacotes destinados à porta 80 da máquina 192.168.0.2 para a máquina
#172.20.0.1. Esse tipo de regra exige a especificação do protocolo.
iptables -t nat -A PREROUTING -p tcp -d 192.168.0.2 --dport 80 -j DNAT --to 172.20.0.1
#10 Todos os pacotes que saírem da rede 172.16.0.0 serão transformados em 200.20.50.0
iptables -t nat -A POSTROUTING -s 172.16.0.0 -j SNAT 200.20.50.0

iptables -L
