#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script deve ser executado como root."
    exit 1
fi

echo "Criando diretórios..."

# Criando diretórios com a opção -p para evitar erros se o diretório já existir
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

echo "Criando grupos de usuários..."

# Criando grupos
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

# Criando usuários e adicionando aos grupos correspondentes
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios...."

# Alterando o dono dos diretórios para o grupo correspondente
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# Definindo as permissões
chmod 770 /adm      # Acesso total para o grupo, leitura e execução para outros
chmod 770 /ven      # Acesso total para o grupo, leitura e execução para outros
chmod 770 /sec      # Acesso total para o grupo, leitura e execução para outros
chmod 777 /publico  # Acesso total para todos

echo "Fim....."

