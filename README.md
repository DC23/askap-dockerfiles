# Dockerfiles for ASKAPsoft development
These dockerfiles build images that should be able to compile the ASKAPSOFT code
with minimal additional configuration.

Currently working images:
* binary (Debian 8, gcc 4.9)
* debian8 (Debian 8, gcc 4.9)
* debian9 (Debian 9, gcc ??)
* gcc-5 (gcc:5 base image (Debian 8), gcc 5.5)
* gcc-6 (gcc:6 base image (Debian 8), gcc 6.4)
* gui-dev (Debian 8, gcc 4.9)
    * Interactive development environment, with X Window authorisation for running GUI applications inside the container.

Currently broken images:
* alpine (can't satisfy ASKAPsoft dependencies from alpine system packages)
* gcc-7 (gcc:7 base image (Debian 9))
    * blas, lapack, and atlas packages require a conflicting version of gfortran
      to the gcc 7.2 version installed in the gcc:7 base image.
