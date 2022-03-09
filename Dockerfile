#? Selecionar imagens
FROM node:lts-alpine

#? Definindo o folder
WORKDIR /app

#? From (here) -> To (/app)
COPY . .

#? --only=prodution (só baixa os dependencies)
RUN npm install --only=production
#? Iniciando client
RUN npm run build --prefix client

#? Permissões do app
USER node

#? Rodar o cmd
CMD [ "npm", "start", "--prefix", "server" ]

#? Definindo a porta
EXPOSE 8000
