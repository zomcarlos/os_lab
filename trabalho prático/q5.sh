#!/bin/bash
echo "Escreva o primeiro número: "
read numero1
echo "Escreva o segundo número: "
read numero2
if [ $numero1 -eq "-1" ] || [ $numero2 -eq "-1" ]; then
exit
fi
echo "Escolha a operação a ser feita entre $numero1 e $numero2"
echo "(1)Adição (2)Subtração (3)Divisão (4)Multiplicação"
read operacao
case $operacao in
	"1")
	let result=$numero1+$numero2
	echo "A soma de $numero1 e $numero2 é $result";; 
	"2")
	let result=$numero1-$numero2
	echo "A subtração de $numero1 e $numero2 é $result";; 
	"3")
	let result=$numero1/$numero2
	echo "A divisão entre $numero1 e $numero2 é $result";; 
	"4")
	let result=$numero1*$numero2
	echo "A multiplicação de $numero1 e $numero2 é $result";; 
esac

