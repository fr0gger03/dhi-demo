# Docker Hardened Image demo repo

A repository containing an application and Dockerfile to demonstrate the use of Docker Hardened Image catalog and Docker Scout to analyze and remediate CVEs in a container image.

The application consists of a basic ExpressJS server and uses an intentionally old version of Express and Alpine base image.
## Demo Flow


### Compose file structure
This compose file is built with demos in mind - that is to say, it is not intended for use as general compose file to orchestrate multiple containers communicating with each other.  Rather it builds a Node.js application in 3 different ways, each using a different Dockerfile.  IF you attempt to use "docker compose up," one instance will run while the other two will fail, due to port conflicts.  

The proper way to use this specific Compose file is simply to run 
```docker compose build```

This will build all three images:
- nodeapp: a Node.js application using a version of Node with known vulnerabilities
- nodeapp-dhi: a Node.js application using a Docker Hardened Image for the same version of Node.js.
- nodeapp-multidhi: a Node.js application using a multistage build to ensure the 'production' version uses the DHI runtime variant of Jode.js.

You can then analyze the images using Docker Desktop or the Docker Scout CLI.

Alternatively, if you would like to build only one of the images, use:
```docker compose <servicename> --build```

For example:
```docker compose build nodeapp```
```docker compose build nodeapp-dhi```
```docker compose build nodeapp-multidhi```


### Running your application

When you're ready, start your application by running:
```docker compose up <servicename>```

For example:
- ```docker compose up nodeapp```
- ```docker compose up nodeapp-dhi```
- ```docker compose up nodeapp-multidhi```

Your application will be available at http://localhost (Node application is actually running on port 3000, but local port 80 is mapped in compose.yaml)

(Note: you can optionally build and run your application by adding the "--build" flag to the end of any of the above statements.)


### References
* [Docker's Node.js guide](https://docs.docker.com/language/nodejs/)