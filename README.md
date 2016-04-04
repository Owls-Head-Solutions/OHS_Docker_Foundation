 # WP_Docker_Foundation
Quickstart Docker Environment for WP



Building WP_Docker_Foundation

Project Structure:
WP_Docker Foundation has the following structure:

dockerfiles: These are files that can be used to build images. Ultimately, Docker will auto access these files as they are updated and build images based on their content. The images built from these files are used to build our Docker images and thus containers.

html: This is where the files for a website belong. The client's files all live in here. Nothing outside of this folder should ever need to go to the client unless they are using Docker.

mysql_data: This is where the Docker Containers that manage the database store their data files.

nginxconf: This is where the nginx docker container looks for configuration

docker-compose.yml: This file declares what containers need to be created and from what source. All containers are generated from images stored on docker-hub

Docker Setup:

Guides:
https://docs.docker.com/windows/
https://docs.docker.com/mac/

1.) Download and install the docker toolbox from here:
https://www.docker.com/products/docker-toolbox

This will install:
• Docker Client for Windows
• Docker Toolbox management tool and ISO
• Oracle VM VirtualBox
• Git MSYS-git UNIX tools


2.) Download WP_Docker_Foundation from GitHub (don't clone) and drop it into the directory that you wish to work from.

3.) Launch the Docker quickstart terminal and browse to the new project location where the docker-compose.yaml file exists (the root of the project)

4.) From the quickstart terminal run "docker compose up". Containers should be launched.

5.) Launch KiteMatic to see the active containers. Click on the NGINX container to see a preview of the web page. Launch the web page from here

6.) Note: "chmod -R 777 mysql_data" on mac if there are file access issues for the db
