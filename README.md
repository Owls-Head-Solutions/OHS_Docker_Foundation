OHS_Docker_Foundation
Owl's Head Solutions
https://www.owlsheadsolutions.com
Scott D. Rackliff
scottr@owlsheadsolutions.com
Quickstart Docker Environment

Building and using OHS_Docker_Foundation for this project (<Project ID Here>)

Project Structure:
<Project ID Here> has the following structure:

app: This is where the files for a website belong. The client's files all live in here. Nothing outside of this folder should ever need to go to the client unless they are using Docker.

dockerfiles: These are files that can be used to build images. Ultimately, Docker will auto access these files as they are updated and build images based on their content. The images built from these files are used to build our Docker images and thus containers.

html: Code files belong here. This directory is shared to the Docker container and is served by Apache in Docker

myslq_data: MySQL binary files live here (The database lives here). 

scripts: If a special architecture such as WordPress is desired, scripts located here can setup the inital environment.

docker-compose.yml: This file declares what containers need to be created and from what source. All containers are generated from images stored on docker-hub

Dockerfile: Customizes the container and installs necessary software.

Docker Setup:

Guides:
https://docs.docker.com/docker-for-windows/
https://docs.docker.com/docker-for-mac/


First time setup:

1.) Follow the guides above to install docker for your platform.
2.) Make sure the docker service is running
3.) Put these project files in a directory on your computer
4.) Using the terminal on mac or Powershell on PC, browse to the root of this project
5.) Run "docker-compose up" to automatically have docker build the container to this project's specifications 
and launch it.
5.5.) If there is a port conflict, copy the docker-compose.yml file and create a custom yml file. You may modify 
the new custom yml file to use a different ports for the different services. <local port>:<container port>. Run
the custom yml with the command "docker-compose up <filename>.yml"
6.) Launch Kitematic from the context menu of the docker service 
7.) Click on the appropriate container in Kitematic for this project, in the right side window you'll
see a preview of the web server root. Click the icon to launch the web page.

Subsequent Usage:
1.) Verify that docker is running
2.) Browse to the project root and run "docker-compose up" (or "docker-compose up <filename>.yml" if custom yml file)

