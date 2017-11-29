FROM debian:jessie

ENV NAME askapsoft

# Install system packages
RUN apt-get update && apt-get install -y \
    vim \
    vim-gtk \
    git \
    sudo \
    #x11-apps \
&& rm -rf /var/lib/apt/lists/*

# Create the askap user, with sudo permissions
RUN adduser askapuser
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askapuser && \
    chmod 0440 /etc/sudoers.d/askapuser
WORKDIR /home/askapuser

# Set up the home directory and mount point
ADD . /home/askapuser
RUN mkdir /home/askapuser/askapsoft
RUN chown -R askapuser:askapuser /home/askapuser
VOLUME /home/askapuser/askapsoft

USER askapuser

# Set the DISPLAY variable so I can run GUI apps inside the container.
# See: https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container/25280523#25280523
ENV DISPLAY :0

# Update Vim plugins
ENV TERM xterm
#RUN echo | echo | vim +qall
#RUN echo | echo | vim +PluginInstall! +qall

