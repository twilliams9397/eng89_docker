# use node official image for this dockerfile
FROM node

# location/destination inside the container
WORKDIR	/usr/src/app

COPY "package.json", "package-lock.json*", "./"

COPY . .

RUN npm install -g npm@7.20.6

RUN node seeds/seed.js

CMD ["node", "app.js"]