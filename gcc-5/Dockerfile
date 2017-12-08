FROM gcc:5

# Install system packages
# This line instructs debconf to store in its database an answer for the program
# debconf. If (the running program) debconf later asks (the database of answers)
# debconf what is my frontend the answer will be frontend is Noninteractive
#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
RUN apt-get update && apt-get install -y --no-install-recommends \
    ant \
    ant-optional \
    astyle \
    bash-completion \
    bison \
    build-essential \
    clang-format-3.5 \
    flex \
    libatlas-base-dev \
    libatlas-dev \
    libblas-dev \
    liblapack-dev \
    libopenmpi-dev \
    libzmq3 \
    libzmq3-dev \
    linux-headers-amd64 \
    openjdk-7-doc \
    openjdk-7-jdk \
    openmpi-bin \
    python-dev \
    python-gpgme \
    scons \
    sudo \
    unzip \
    vim-nox \
&& rm -rf /var/lib/apt/lists/*

# Create the askap user, with passwordless sudo permissions
RUN useradd -G users --create-home --password abc --shell /bin/bash askap && \
    echo "askap ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askap && \
    chmod 0440 /etc/sudoers.d/askap

# Set up the home directory, file ownership, and mount point
ADD bashrc /home/askap/.bashrc
RUN chown -R askap:askap /home/askap
WORKDIR /home/askap

# Run as askap user from here on
USER askap
