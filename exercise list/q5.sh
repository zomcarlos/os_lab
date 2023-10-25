#!/bin/bash
if [ -e $1 ]; then
  echo "Arquivo já existe!"
else
  echo "Arquivo não existe!"
  caminho=$(pwd)
  touch $1
  echo "Criando o arquivo..."
  chmod 550 $1
  echo "Arquivo criado em: $caminho/$1"
fi
#5- Implementar um script que receba como argumento o
#nome de um arquivo a ser criado (considerar a pasta em que
#o script está sendo rodado). Antes de criar, o script deve
#verificar se o arquivo já existe e, em caso positivo, emitir
#um alerta ao usuário. O arquivo criado não deve possuir
#permissão de escrita.
