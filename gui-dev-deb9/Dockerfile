FROM askap/debian:9

# Set the DISPLAY variable so I can run GUI apps inside the container.
# See: https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container/25280523#25280523
ENV DISPLAY :0

# Install additional system packages
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    exuberant-ctags \
    gcc-6-plugin-dev \
    git \
    less \
    libreoffice-calc \
    meld \
    odb \
    python3 \
    python3-dev \
    python3-pandas \
    python3-pip \
    python3-xlrd \
    tree \
    ttf-dejavu \
    vim-gtk \
    x11-apps \
    xterm
#&& rm -rf /var/lib/apt/lists/*

ADD Xresources /home/askap/.Xresources
RUN sudo chown askap:askap /home/askap/.Xresources && \
    mkdir /home/askap/askap-builds && \
    sudo chown askap:askap /home/askap/askap-builds
