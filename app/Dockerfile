# use node official image for this dockerfile
FROM node

# location/destination inside the container to copy and run the app
WORKDIR	/usr/src/app

# could have ENV node_env = dev/production depending

COPY ["package.json", "package-lock.json*", "./"]

COPY . .

RUN npm install -g npm@7.20.6

RUN node seeds/seed.js

EXPOSE 3000

CMD ["node", "app.js"]