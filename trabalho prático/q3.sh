#!/bin/bash
if [ -e $1 ]; then
  echo "Arquivo já existe!"
else
touch $1
chmod 550 $1
fi
ls -l $1 #Para demonstrar as permissões
