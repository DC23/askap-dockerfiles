FROM debian:9

# Install system packages
# This line instructs debconf to store in its database an answer for the program
# debconf. If (the running program) debconf later asks (the database of answers)
# debconf what is my frontend the answer will be frontend is Noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
apt-get update && apt-get install -y --no-install-recommends \
    ant \
    ant-optional \
    astyle \
    autoconf \
    bash-completion \
    bison \
    build-essential \
    bzip2 \
    clang-format \
    curl \
    file \
    flex \
    g++ \
    gcc \
    gfortran \
    libatlas-base-dev \
    libatlas-dev \
    libblas-dev \
    libfreetype6 \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    liblapack-dev \
    libmpich-dev \
    libncurses5-dev \
    libpng-dev \
    libreadline-dev \
    libreadline7 \
    libzmq3-dev \
    linux-headers-amd64 \
    mpich \
    openjdk-8-doc \
    openjdk-8-jdk \
    pkg-config \
    python-dev \
    python-gpgme \
    subversion \
    sudo \
    unzip \
    vim-nox \
    nano \
&& rm -rf /var/lib/apt/lists/*

# Create the askap user, with passwordless sudo permissions
# Also enable bash completion for all users in the same RUN to avoid an extra
# layer
RUN useradd -G users --create-home --password abc --shell /bin/bash askap && \
    echo "askap ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askap && \
    chmod 0440 /etc/sudoers.d/askap && \
    echo '. /etc/bash_completion' >> /etc/profile

# Set up the home directory, file ownership, and mount point
ADD bashrc /home/askap/.bashrc
RUN chown -R askap:askap /home/askap
WORKDIR /home/askap

# Run as askap user from here on
USER askap
