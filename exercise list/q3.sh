#!/bin/bash
echo $1 "é um número primo?"
n="$1"
if [ $n -lt 2 ]; then
  echo "Não é primo!"
  exit
fi
for((i=2; i<=$n/2; i++))
do
  ans=$(( n%i ))
  if [ $ans -eq 0 ]; then
    echo "$n não é primo!"
    exit 0
  fi
done
echo "$n é um número primo!"
#3- Crie um script que receba por parâmetro um número
#inteiro qualquer e verifique se esse valor é primo ou não
