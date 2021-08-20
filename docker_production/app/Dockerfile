FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
