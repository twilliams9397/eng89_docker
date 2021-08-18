# Containerisation
- separate packages of software - similar to VMs
- conrainers are standardised units for development, shipment and deployment

## Microservice architecture
- each service on different machines
- whole system doesn't rely on one machine like monolith does, so if one machine goes down only one service is impacted
- building/testing of each microservice is all independent - for development and also have freedom of software/technologies for the microservices
- service as a whole doesn't need to be taken down to add more microservices, e.g. adding app/web features can be done without taking down the whole server
- easily scalable but more complicated to deploy than monolith
- used by pretty much everyone (Netflix, uber, spotify etc), and if not it is being planned
- microservice is better for bigger and more complex deployments, with scalability as a requirement

# Docker and Dockerhub
![docker](docker.png)
- used like github - repos, version history
- can set up webhooks for pushes to repos
- very lightweight and launches quicker than VMs
- competitors: rkt, HyperV etc
- microservices share resources of local host
- VMs vs Docker: fewer layers to get to final product with docker, doesn't install virtual OS
- `docker pull image_name` to download from docker hub, `docker run image_name` will run the contents of the image
- `docker ps` list running containers, and can add `-a` for more info on containers that have already run - when created and exited etc
- if docker commands aren't working run `alias docker="winpty docker"` to resolve
- `docker run -d -p 4000:4000 docs/docker.github.io` will download if the image isn't available locally, and shows docker documentation
- `-d` is detached mode so it doesn't "hang" in the terminal while the image is running, `-p 4000:4000` is port mapping from default port 4000 to local port 4000
- visit `localhost:4000` in browser to see the documentation from this image
- `docker exec -it container_id sh` will log in to the shell of the container
- from here, can inspect and edit contents, `exit` to exit out
- `docker stop container_id` to stop background running, or `rm` will remove the container, and `rmi` for images. `-f` can be added to force delete
- use stop if more work is being done on the container as it saves changes
- `docker logs [option] container_name` can give different info regarding a container:
- `--details` = Show extra details provided to logs
- `--follow , -f` = Follow log output
- `--since` = Show logs since timestamp
- `--tail , -n`	= Number of lines to show from the end of the logs
- `--timestamps , -t` = Show timestamps
- `--until`	= Show logs before a timestamp, or relative (e.g. 42m for mins)
- `docker history image_name/ID` gives history of image

- `docker run -d -p 2368:2368 ghost` - ghost website builder
- `docker run -d -p 80:80 nginx` - nginx homepage, already reverse proxied so dont need :80 in browser
- `/usr/share/nginx/html` has nginx web files
- can replace `index.html` to alter website appearance
- `docker cp container:src_path dest_path|-` is the copy command, and the container must be in running state