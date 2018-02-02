FROM debian:9

# Install system packages
# This line instructs debconf to store in its database an answer for the program
# debconf. If (the running program) debconf later asks (the database of answers)
# debconf what is my frontend the answer will be frontend is Noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
apt-get update && apt-get install -y --no-install-recommends \
    #astyle \
    #autoconf \
    bash-completion \
    #bison \
    build-essential \
    #bzip2 \
    #clang-format \
    #curl \
    #file \
    #flex \
    #g++ \
    #git \
    #gcc \
    #gfortran \
    #less \
    #libatlas-base-dev \
    #libatlas-dev \
    #libblas-dev \
    #libfreetype6 \
    #libfreetype6-dev \
    #libgl1-mesa-dri \
    #libjpeg62-turbo-dev \
    #liblapack-dev \
    #libmpich-dev \
    #libncurses5-dev \
    #libpng-dev \
    #libreadline-dev \
    #libreadline7 \
    #libzmq3-dev \
    #linux-headers-amd64 \
    locales \
    locales-all \
    #mpich \
    #openjdk-8-jdk \
    #pkg-config \
    #procps \
    #python-dev \
    python \
    python3 \
    python3-dev \
    python3-numpy \
    python3-pandas \
    python3-pip \
    python3-setuptools \
    python3-xlrd \
    #subversion \
    sudo \
    #unzip \
    #vim-gtk \
    vim-nox \
    xdot
#&& rm -rf /var/lib/apt/lists/*

# Set the DISPLAY variable so I can run GUI apps inside the container.
# See: https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container/25280523#25280523
ENV DISPLAY :0

# Set locale to en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

RUN pip3 install gprof2dot

# Create a user, with passwordless sudo permissions
# Also enable bash completion for all users in the same RUN to avoid an extra
# layer
RUN useradd -G users --create-home --password abc --shell /bin/bash user && \
    echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user && \
    echo '. /etc/bash_completion' >> /etc/profile

# Set up the home directory, file ownership, and mount point
ADD bashrc /home/user/.bashrc
ADD Xresources /home/user/.Xresources
RUN chown -R user:user /home/user
WORKDIR /home/user
USER user
