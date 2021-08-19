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

# RUN node seeds/seed.js

EXPOSE 3000

CMD ["node", "app.js"]
```
- once it is running, port map to port 80 and check localhost - `docker run -d -p 80:3000 twilliams9397/eng89_nodeapp`