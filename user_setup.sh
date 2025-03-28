#!/bin/bash

USERNAME=devops_user

useradd -m -s /bin/bash $USERNAME # Cria o usuário sem senha de login
passwd -l $USERNAME

#Gerando a chave ssh

CHAVE_SSH=$(ssh-keygen -t rsa -N "" -f "$(pwd)/devops_user_key" -q)
PUBLIC_SSH=$(cat "$(pwd)/devops_user_key.pub")
PRIVATE_SSH=$(cat "$(pwd)/devops_user_key")

chmod 700 /home/$USERNAME

# Cria dir
mkdir -p /home/$USERNAME/restricted_data
chown $USERNAME:$USERNAME /home/$USERNAME/restricted_data
chmod 700 /home/$USERNAME/restricted_data

# Adiciona ao grupo sudo
usermod -aG sudo $USERNAME

# Configuração SSH (substitua com sua chave pública)
PUB_KEY=$PUBLIC_SSH

# Cria diretório .ssh
mkdir -p /home/$USERNAME/.ssh
echo "$PUB_KEY" > /home/$USERNAME/.ssh/authorized_keys

# Ajustando permissoes
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys

echo "Configuração concluída para $USERNAME"
echo -e "\n=================================\n"
echo "Essa é a chave publica para acessar o usuário $USERNAME"
echo "$PUBLIC_SSH"
echo -e "\n=================================\n"
