#!/bin/bash
echo "Digite o nome: "
read nome
echo "Digite a idade: "
read idade
if [ -z $nome ]; then
  echo "Nome não foi inserido!"
else
  echo "Seu nome é: $nome"
fi
if [ $idade -ge 18 ]; then
  echo "Idade maior que 18!"
else
  echo "Idade menor que 18 anos!"
fi
#4- Construa um script que receba como parâmetro o nome e
#a idade de um aluno, mostre uma mensagem se o usuário
#não informou seu nome, se informou, mostra o nome. Após
#verifica se a idade do aluno é maior que 18 anos, se for
#menor, mostre a mensagem: “idade do aluno é menor que 18
#anos” se for maior: “idade do aluno é maior que 18 anos”.
