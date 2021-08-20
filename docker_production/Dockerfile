FROM node AS app 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY . .

EXPOSE 3000

RUN node seeds/seed.js

CMD ["node", "app.js"]

# compresses image with same functionality

FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY --from=app /usr/src/app /usr/src/app

EXPOSE 3000

RUN node seeds/seed.js

CMD ["node", "app.js"]