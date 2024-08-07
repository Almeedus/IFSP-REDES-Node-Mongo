# IFSP-REDES-Node-Mongo

## O que você precisa para rodar este projeto:
- Docker;
- Dockerfile (disponibilizado neste repositório);

# Como iniciar o container:
Construa a imagem no seu repositório local para que seja possivel criar um container.
```
docker build -t dockerfile-teste .
```
Inicie o container.
```
docker run -it dockerfile-teste bash
```

# Testes
## NODE e NPM
```
node --version
```
```
npm --version
```
## MongoDB
```
mongosh
```

# Quase tudo pronto...
Agora para realizar uma instale o git para clonarmos este repositório para dentro da maquina e navegue para dentro do repositório.
```
cd /dockerfile
```
e por fim inicie o script.
```
node server.js
```


### OBSERVAÇÕES
Caso o mongo não abra a porta, siga estas instruções
```
docker run -d -p 27017:27017 --name mongodb mongo
```
Verifique se o container está rodando
```
docker ps
```
Para verificar a conexão com o MongoDB
```
docker exec -it mongo-teste mongosh
```