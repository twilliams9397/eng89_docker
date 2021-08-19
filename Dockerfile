# build an image to automate the tasks to launch static website page using nginx webserver with docker
# building customised docker images

# use official nginx image
# add info/label with name/email
# copy file/folder from local host to container
# default port 80 will be used for nginx
# CMD with the final command - as an example npm start

# FROM is keyword to use the image
# can choose specific version, default if not chosen is latest

FROM nginx

# label with name and email - optional

LABEL MAINTAINER=twilliams@spartaglobal.com

# copy the data - our index.html
# if local data is not in same location use absolute path

COPY index.html /usr/share/nginx/html

# add the port

EXPOSE 80

# final command, make nginx global
# commands from official nginx image

CMD ["nginx", "-g", "daemon off;"]