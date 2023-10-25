#!/bin/bash
if [ $1 -gt $2 ]; then
  echo "Argumento '$1' é maior"
elif [ $2 -gt $1 ]; then
  echo "Argumento '$2' é maior"
fi
if [ $1 == $2 ]; then
  echo "Argumentos iguais"
fi
#2- Desenvolva um script que receba por parâmetro dois
#números inteiros quaisquer, e informa qual o maior e o
#menor valor recebido
