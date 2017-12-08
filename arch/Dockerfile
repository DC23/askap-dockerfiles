FROM base/archlinux

# Set the DISPLAY variable so I can run GUI apps inside the container.
# See: https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container/25280523#25280523
ENV DISPLAY :0

# Install additional system packages
RUN pacman -Syyu --noconfirm && pacman --needed --noconfirm -S \
    ctags \
    subversion \
    sudo \
    tree

ADD Xresources /home/askap/.Xresources
RUN sudo chown askap:askap /home/askap/.Xresources && \
    mkdir /home/askap/askap-builds && \
    sudo chown askap:askap /home/askap/askap-builds
