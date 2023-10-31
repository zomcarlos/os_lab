#!/bin/bash
echo "Digite o número da sua escolha: (1) Hora Atual (2)Estação do ano"
read escolha
if [ $escolha -eq 1 ]; then
	date "+%T"
	time=$(date "+%H")
	if [ $time -ge 06 ] && [ $time -lt 13 ]; then
	echo "É manhã!"
	elif [ $time -ge 13 ] && [ $time -lt 18 ]; then
	echo "É tarde!"
	else 
	echo "É noite!"
	fi
else

	date "+%D"
	data=$(date "+%m")
	if [ $data -ge 03 ] && [ $data -lt 06 ]; then
	echo "É outono!"
	elif [ $data -ge 06 ] && [ $data -lt 09 ]; then
	echo "É inverno!"
	elif [ $data -ge 09 ] && [ $data -lt 12 ]; then
	echo "É primavera!"
	else
	echo "É verão!"
	fi
fi

