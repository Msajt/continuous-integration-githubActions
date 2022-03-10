#? Selecionar imagens
FROM node:lts-alpine

#? Definindo o folder
WORKDIR /app

#? From (here) -> To (/app)
COPY package*.json ./

#? --only=prodution (só baixa os dependencies)
COPY client/package*.json client/
RUN npm run install-client --only=production
#? --only=prodution (só baixa os dependencies)
COPY server/package*.json server/
RUN npm run install-server --only=production
#? Iniciando client
COPY client/ client/
RUN npm run build --prefix client

COPY server/ server/

#? Permissões do app
USER node

#? Rodar o cmd
CMD [ "npm", "start", "--prefix", "server" ]

#? Definindo a porta
EXPOSE 8000
