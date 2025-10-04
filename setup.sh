#!/bin/bash

set -e

# Função para verificar se o comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detecta se docker-compose deve ser chamado com hífen ou espaço
if command_exists docker && docker compose version >/dev/null 2>&1; then
    DOCKER_COMPOSE_COMMAND="docker compose"
elif command_exists docker-compose; then
    DOCKER_COMPOSE_COMMAND="docker-compose"
else
    echo "Erro: docker-compose ou docker compose não encontrado. Por favor, instale o Docker Compose V2."
    exit 1
fi

# URLs dos repositórios
REPO_LOGIN="https://github.com/TC-FIAP-HOSPITAL/ms-login"
REPO_AGENDAMENTO="https://github.com/TC-FIAP-HOSPITAL/ms-agendamento"
REPO_HISTORICO="https://github.com/TC-FIAP-HOSPITAL/ms-historico"
REPO_NOTIFICACAO="https://github.com/TC-FIAP-HOSPITAL/ms-notificacao"

# Clonar se os diretórios não existirem
[ ! -d "ms-login" ] && git clone "$REPO_LOGIN"
[ ! -d "ms-agendamento" ] && git clone "$REPO_AGENDAMENTO"
[ ! -d "ms-historico" ] && git clone "$REPO_HISTORICO"
[ ! -d "ms-notificacao" ] && git clone "$REPO_NOTIFICACAO"

# URL do Gist do docker-compose.yaml
GIST_RAW_URL="https://gist.githubusercontent.com/Ghustavo516/1af457b58af74e9e72b80746092c28ed/raw/e09c484702ff2088714baba1b0febd6e2102edeb/docker-compose-tc3.yaml"

# Baixar docker-compose.yaml
if command_exists curl; then
    curl -fsSL "$GIST_RAW_URL" -o docker-compose.yaml
else
    echo "Erro: curl não está instalado"
    exit 1
fi

# Subir containers
echo "Subindo containers com: $DOCKER_COMPOSE_COMMAND up -d"
$DOCKER_COMPOSE_COMMAND up -d
