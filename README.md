# Dockerfiles for ASKAPsoft development
These dockerfiles build images that should be able to compile the ASKAPsoft code
with minimal additional configuration.

Currently working images:
* askap/arch (Arch Linux, gcc 7.2)
* askap/binary:8 (Debian 8 binary release)
* askap/binary:9 (Debian 9 binary release)
* askap/debian:8 (Debian 8, gcc 4.9)
* askap/debian:9 (Debian 9, gcc 6.3)
* askap/gcc:5 (gcc:5 base image (Debian 8), gcc 5.5)
* askap/gcc:6 (gcc:6 base image (Debian 8), gcc 6.4)
* askap/gui-dev:9 (Debian 9, gcc 6.3)
    * Interactive development environment, with X Window authorisation for running GUI applications inside the container.
* askap/gui-dev:8 (Debian 8, gcc 4.9)

Currently broken images:
* alpine (can't satisfy ASKAPsoft dependencies from alpine system packages)
* gcc-7 (gcc:7 base image (Debian 9))
    * blas, lapack, and atlas packages require a conflicting version of gfortran
      to the gcc 7.2 version installed in the gcc:7 base image.
