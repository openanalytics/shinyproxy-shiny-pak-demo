# Running Shiny apps using pak inside ShinyProxy

This repository describes how to add a shiny app
using [pak](https://pak.r-lib.org/) inside ShinyProxy.

Related demos:

- [plain Shiny demo](https://github.com/openanalytics/shinyproxy-demo)
- [plain Shiny demo (no R package)](https://github.com/openanalytics/shinyproxy-demo-minimal)
- [Shiny demo using renv](https://github.com/openanalytics/shinyproxy-shiny-renv-demo)

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-shiny-pak-demo
```

the relevant Docker Hub repository can be found
at https://hub.docker.com/r/openanalytics/shinyproxy-shiny-pak-demo

To build the image from the Dockerfile, clone this repository, then navigate to
its root directory and run

```bash
sudo docker build -t openanalytics/shinyproxy-shiny-pak-demo .
```

# ShinyProxy Configuration

To add the shiny application to ShinyProxy, add the following lines to its
configuration file (see [application.yml](./application.yml) for a complete
file):

```yaml
specs:
  - id: shiny-pak-demo
    display-name: Shiny using pak Demo Application
    container-image: openanalytics/shinyproxy-shiny-pak-demo
```

# References

* <https://pak.r-lib.org/>

**(c) Copyright Open Analytics NV, 2024.**
