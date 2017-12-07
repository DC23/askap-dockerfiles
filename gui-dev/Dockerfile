FROM askap-debian8:latest

# Set the DISPLAY variable so I can run GUI apps inside the container.
# See: https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container/25280523#25280523
ENV DISPLAY :0

# Install additional system packages
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    exuberant-ctags \
    gcc-4.9-plugin-dev \
    git \
    meld \
    python3 \
    python3-dev \
    python3-pip \
    tree \
    ttf-dejavu \
    vim-gtk \
    virtualenv \
    virtualenvwrapper
#&& rm -rf /var/lib/apt/lists/*
