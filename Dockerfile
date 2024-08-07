FROM debian:12

# Atualizar o sistema e instalar dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common

# Adicionar repositório do MongoDB e instalar
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/7.0 main" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list && \
    apt-get update && apt-get install -y mongodb-org

# Instalar Node.js e NPM
RUN curl -fsSL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs

RUN curl -fsSL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs npm

# Comando para iniciar o MongoDB ao iniciar o container
CMD ["mongod", "--bind_ip_all"]
