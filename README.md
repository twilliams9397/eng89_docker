# Containerisation
- separate packages of software - similar to VMs
- conrainers are standardised units for development, shipment and deployment

## Microservice architecture
- each service on different machines
- whole system doesn't rely on one machine, so if one machine goes down only one service is impacted
- building/testing of each service is all independent
- service as a whole doesn't need to be taken down to add more microservices - easily scalable
- used by pretty much everyone (Netflix, uber, spotift etc), and if not it is being planned

# Docker and Dockerhub
![docker](docker.png)
- used like github - repos, version history
- can set up webhooks for pushes to repos
- very lightweight 
- competitors: rkt, HyperV etc
- microservices share resources of local host
- VMs vs Docker: fewer layers to get to final product with docker, doesn't install virtual OS

