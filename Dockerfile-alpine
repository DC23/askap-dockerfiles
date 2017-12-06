FROM alpine:3.7
ENV NAME askapsoft
RUN apk --no-cache --update add \
    sudo \
    bash \
    bash-completion \
    build-base \
    python \
    python-dev \
    scons \
    subversion \
    astyle \
    lapack \
    freetype \
    freetype-dev \
    libpng \
    openblas \ 
    openblas-dev

# Create the askap user, with passwordless sudo permissions
RUN adduser -g '' -D askap users
RUN echo "askap ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askap && \
    chmod 0440 /etc/sudoers.d/askap

# Set up the home directory, file ownership, and mount point
ADD .bash* /home/askap/
RUN chown -R askap:users /home/askap
WORKDIR /home/askap

ENTRYPOINT ["/bin/bash"]

# Run as askap user from here on
USER askap
