FROM alpine:3.7
RUN apk --no-cache --update add \
    astyle \
    bash \
    bash-completion \
    build-base \
    freetype \
    freetype-dev \
    lapack \
    libpng \
    ncurses \
    openblas \
    openblas-dev \
    python \
    python-dev \
    scons \
    subversion \
    sudo

# Create the askap user, with passwordless sudo permissions
RUN adduser -g '' -D askap users && \
    echo "askap ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askap && \
    chmod 0440 /etc/sudoers.d/askap

# Set up the home directory, file ownership, and mount point
ADD bashrc /home/askap/.bashrc
RUN chown -R askap:askap /home/askap
WORKDIR /home/askap

ENTRYPOINT ["/bin/bash"]

# Run as askap user from here on
USER askap
