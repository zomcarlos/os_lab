#!/bin/bash

lojas=('Matriz' 'Filial')

for loja in "${lojas[@]}"; do
#Cria os dois grupos para o servidor.
	echo "Escreva o nome do primeiro grupo da loja $loja: "
		read grupo1
	echo "Escreva o nome do segundo grupo da loja $loja: "
		read grupo2

	grupos=($grupo1 $grupo2)

#Verificar se os grupos não existem
#Utiliza-se o -q para não produzir nenhum output (quiet mode)
	for grupo in "${grupos[@]}"; do
		if grep -q "^$grupo:" /etc/group; then
			echo "Grupo $grupo já existe, encerrando o script..."
			exit 1
		fi
	done
#Adiciona o grupo
	for grupo in "${grupos[@]}"; do
		sudo groupadd $grupo
		echo "Grupo $grupo adicionado com sucesso!"
	done

#---------------------------------------------------------------------
#Define quantos usuários cada grupo terá:
	echo "Quantos usuários cada grupo deverá ter?"
		read usuarios_por_grupo
#Função para adicionar os usuários de cada grupo
	adicionar_usuarios() {
		local group="$1"
		for ((i = 1; i <= usuarios_por_grupo; i++)); do
			read -p "Insira o nome para o usuário $i do grupo '$grupo' (deixe em branco para passar): " nome_usuario
			if [ -z "nome_usuario" ]; then
				echo "Pulando a criação do usuário $i do grupo '$grupo'."
				return
			fi
			if [ "$(id -u "$nome_usuario" 2>/dev/null)" ]; then
				echo "Usuário '$nome_usuario' já existe. Nenhum usuário será criado para o grupo '$grupo'."
			else
				sudo useradd -m -d /home/$nome_usuario -g $grupo $nome_usuario
				echo "Usuário '$nome_usuario' adicionado com sucesso ao grupo '$grupo'"
			fi
		done
	}

#Loop para cada grupo criado
	for grupo in "${grupos[@]}"; do
		adicionar_usuarios "$grupo"
	done
done
