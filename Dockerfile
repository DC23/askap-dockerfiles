FROM debian:jessie

ENV NAME askapsoft

# Install system packages
RUN apt-get update && apt-get install -y \
    vim \
    vim-gtk \
    git \
    sudo \
&& rm -rf /var/lib/apt/lists/*

# Create the askap user, with sudo permissions
RUN adduser askapuser
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askapuser && \
    chmod 0440 /etc/sudoers.d/askapuser
USER askapuser
WORKDIR /home/askapuser

# Set up the home directory and mount point
RUN mkdir /home/askapuser/askapsoft
ADD . /home/askapuser
VOLUME /home/askapuser/askapsoft

# Update Vim plugins
ENV TERM xterm
RUN echo | echo | vim +qall 
RUN echo | echo | vim +PluginInstall! +qall 
