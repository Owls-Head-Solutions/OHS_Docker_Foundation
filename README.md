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

nginxconf: This is where the nginx docker container looks for configuration

docker-compose.yml: This file declares what containers need to be created and from what source. All containers are generated from images stored on docker-hub

Docker Setup:

Guides:
https://docs.docker.com/windows/
https://docs.docker.com/mac/


First time setup:
1.) Download and install the docker toolbox from here:
https://www.docker.com/products/docker-toolbox

This will install:
• Docker Client for Windows
• Docker Toolbox management tool and ISO
• Oracle VM VirtualBox
• Git MSYS-git UNIX tools

2.) Download WP_Docker_Foundation from GitHub (don't clone) and drop it into the directory that you wish to work from. This directory
MUST be within your user directory on Windows and Mac. Docker cannot access folders outside of your user's directory.
Preferrably this is a directory that is a git repo for a new project.

3.) Launch the Kitematic. Kitematic will automatically generate a new virtual machine by the name of "default"

***************************On a Mac do the following:************************************

4.) Once Kitematic is finished launching and a new VM is created, launch the Docker Quickstart Terminal

5.) From the terminal, browse to the directory that contains the WP_Docker_Foundation files. Browse into the "scripts" directory

6.) Run the script "docker-machine-nfs.sh" with the following command:

./docker-machine-nfs.sh default

At one point you'll be asked to input your administrator password, it is safe to do so. The reason it asks is so that
the file /etc/exports may be modified to share your /Users directory out as an NFS folder on the 192.168.99.0 subnet.
Keep this in mind as this is a security concern.

If you are concerned about this, you can enable / disable NFS on your mac as desired:

Command line controls of NFS (Network File System)
"sudo nfsd disable" to permanently turn off nfs
"sudo nfsd stop" to temporarily stop nfs
"sudo nfsd enable" to permanently turn on nfs
"sudo nfsd start" to turn nfs back on after it has been stopped

This script should have configured the docker-machine virtual machine to mount the /Users directory on your Mac as a
network attached directory to the docker-machine virtual machine. You should have no need to ever run the docker-machine-nfs.sh script
again.

**NOTE: You may need to configure Oracle Virtual Box to disable the share that it uses as this may conflict with the new NFS share

Should you need to log into the docker-machine virtual machine you can do so from "docker-machine ssh" in the quickstart terminal

7.) now, from the quickstart terminal, leave the scripts directory so that you are in the root of the WP_Docker_Foundation project. Run
"docker-compose up" to create all fo the necessary docker containers for development

8.) To install a skeleton WordPress environment, browse to the /scripts/wordpress directory with the docker quickstart terminal. From the
terminal run ./install.sh and WordPress will install automatically.

9.) The setup is complete. Launch KiteMatic to see the active containers. Click on the NGINX container to see a preview of the web page. Launch the web page from there.

*******************************************On a PC do the following:*********************************************

4.) browse to the new project location where the docker-compose.yaml file exists (the root of the project)

5.) From the quickstart terminal run "docker compose up". Containers should be launched.

6.) To install a skeleton WordPress environment, browse to the /scripts/wordpress directory with the docker quickstart terminal. From the
    terminal run ./install.sh and WordPress will install automatically.

7.) The setup is complete. Launch KiteMatic to see the active containers. Click on the NGINX container to see a preview of the web page. Launch the web page from there.

***************************Every Time Setup*********************************************************

When you wish to work on a WP Docker Foundation project, simply launch kitematic and the docker quickstart terminal.
From the quickstart terminal run docker-compose-up to bring the containers to life when you are ready. Use ctrl+c to kill the containers.
Use Kitematic to see your various containers and their active states.


