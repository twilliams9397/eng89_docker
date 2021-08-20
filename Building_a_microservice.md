# Creating microservice
- when creating images/containerising from clients app/files etc, need to know:
- any dependencies
- what ports will be needed/allowed
- what os will be used
- what engine will be used
- has the app been tested, and on what platform
- is it using a database, and which if so
- we make no changes to app given to us, but report any bugs found
- investigate contents of app and all folders, if it doesn't make sense ask
- get enough info to start deployment
- dockerfile to containerise node app:
```
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
```
- using the dockerfile, build the container `docker build -t twilliams9397/eng89_nodeapp .`
- once it is built, run with port map to port 80 and check localhost - `docker run -d -p 80:3000 twilliams9397/eng89_nodeapp`

## IT Jobs Watch App Container
- `requirements.txt` contains all necessary pytho dependencies to `pip install`
- when running `docker build -t twilliams9397/eng89_itjobs_app .`, Dockerfile loads up a python 3.8 environment and installs these dependencises first, then copies the .py files then runs the flask app
- `docker run -d -p 80:5000 twilliams9397/eng89_itjobs_app` runs the web app and maps the flask port 5000 to localhost 

## App and DB
- along woth the steps above to run the node app, the following code is added to compress the docker image while keeping the functionality:
```
FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY --from=app /usr/src/app /usr/src/app

EXPOSE 3000

RUN node seeds/seed.js

CMD ["node", "app.js"]
```
- following this, a `docker-compose.yml` file is created which will launch the app and db images, with the required links to run the /posts page
```
version: '3.8'

services:
  # start the db image and map to port 27017
  db:
    image: mongo
    restart: always
    ports: [27017:27017]

  web:
    # start up the web app image and map to localhost
    build: ./app
    restart: always
    ports: [80:3000]
    # set variable for db port
    environment:
      - DB_HOST=mongodb://db:27017/posts
    depends_on:
      - db
```