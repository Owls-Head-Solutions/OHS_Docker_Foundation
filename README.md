WP_Docker_Foundation
Owl's Head Solutions
https://www.owlsheadsolutions.com
Quickstart Docker Environment for WP



Building WP_Docker_Foundation

Project Structure:
WP_Docker Foundation has the following structure:

dockerfiles: These are files that can be used to build images. Ultimately, Docker will auto access these files as they are updated and build images based on their content. The images built from these files are used to build our Docker images and thus containers.

html: This is where the files for a website belong. The client's files all live in here. Nothing outside of this folder should ever need to go to the client unless they are using Docker.

mysql_data: This is where the Docker Containers that manage the database store their data files.

docker-compose.yml: This file declares what containers need to be created and from what source. All containers are generated from images stored on docker-hub

Docker Setup:

Guides:
https://docs.docker.com/windows/
https://docs.docker.com/mac/


First time setup:



***************************On a Mac do the following:************************************

***************************On a PC do the following:*************************************

***************************Every Time Setup**********************************************

When you wish to work on a WP Docker Foundation project, simply launch kitematic and the docker quickstart terminal.
From the quickstart terminal run docker-compose-up to bring the containers to life when you are ready. Use ctrl+c to kill the containers.
Use Kitematic to see your various containers and their active states.


