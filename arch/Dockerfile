FROM base/archlinux

# Refresh the keyring
#RUN pacman-key --init \
 #&& pacman-key --populate archlinux \
 #&& pacman-key --refresh-keys

# Optimise the mirror list, then update system and install new packages
RUN pacman --noconfirm -Syyu \
 && pacman-db-upgrade \
 && pacman --noconfirm -S reflector rsync \
 && reflector -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist \
 && pacman -Su --noconfirm \
 && pacman-db-upgrade \
 && if [ ! -z "$(pacman -Qtdq)" ]; then \
      pacman --noconfirm -Rns $(pacman -Qtdq); \
    fi \
 && rm -f /etc/pacman.d/mirrorlist.pacnew \
 && if [ -f /etc/systemd/coredump.conf.pacnew ]; then \
      mv -f /etc/systemd/coredump.conf.pacnew /etc/systemd/coredump.conf ; \
    fi \
 && if [ -f /etc/locale.gen.pacnew ];  then \
      mv -f /etc/locale.gen.pacnew /etc/locale.gen ; \
    fi \
&& echo "en_AU.UTF-8 UTF-8" >  /etc/locale.gen \
 && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
 && locale-gen \
 && echo "LANG=en_AU.UTF-8" >> /etc/locale.conf

# Install extra packages
RUN pacman --needed --noconfirm -S \
    ctags \
    git \
    subversion \
    sudo \
    tree \
 && yes | pacman --noconfirm -Scc \
 && pacman-optimize --nocolor

ENV LANG=en_AU.UTF-8
ENV DISPLAY :0

# Set up the askap user
RUN useradd -G users --create-home --password abc --shell /bin/bash askap \
 && echo "askap ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askap \
 && chmod 0440 /etc/sudoers.d/askap
ADD . /home/askap/
RUN chown -R askap:askap /home/askap
WORKDIR /home/askap
USER askap
