# Running Shiny apps with pak inside ShinyProxy

This repository describes how to add a shiny app with pak inside ShinyProxy (at least version 2.5.0).

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```
sudo docker pull openanalytics/shinyproxy-shiny-pak-demo
```

the relevant Docker Hub repository can be found at https://hub.docker.com/r/openanalytics/shinyproxy-shiny-pak-demo

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```
sudo docker build -t openanalytics/shinyproxy-shiny-pak-demo .
```

# ShinyProxy Configuration

To add the shiny application to ShinyProxy, add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):
```
specs:
  - id: shiny-pak-demo
    display-name: Shiny with pak Demo Application
    container-image: openanalytics/shinyproxy-shiny-pak-demo
```

# References
* https://pak.r-lib.org/


**(c) Copyright Open Analytics NV, 2024.**