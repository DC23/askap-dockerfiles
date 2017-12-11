FROM base/archlinux

# Set the DISPLAY variable so I can run GUI apps inside the container.
# See: https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container/25280523#25280523
ENV DISPLAY :0

# Install additional system packages
RUN pacman -Syyu --noconfirm && pacman --needed --noconfirm -S \
    ctags \
    subversion \
    sudo \
    tree \
&& useradd -G users --create-home --password abc --shell /bin/bash askap && \
    echo "askap ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askap && \
    chmod 0440 /etc/sudoers.d/askap

ADD . /home/askap/
RUN chown -R askap:askap /home/askap
WORKDIR /home/askap
USER askap
