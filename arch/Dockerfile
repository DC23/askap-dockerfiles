FROM base/archlinux

ENV DISPLAY :0

# Refresh the keyring
#RUN pacman-key --init \
 #&& pacman-key --populate archlinux \
 #&& pacman-key --refresh-keys

# Optimise the mirror list
RUN pacman --noconfirm -Syyu \
 && pacman-db-upgrade \
 && pacman --noconfirm -S reflector rsync \
 && reflector -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist \
 && pacman -Rsn --noconfirm reflector rsync

# Update system
RUN pacman -Su --noconfirm

# Update db
RUN pacman-db-upgrade

# Generate locales
# The final line is required as some ASKAP packages expect to find xlocale.h
# while Arch installs that header as locale.h
ENV LANG=en_AU.UTF-8
RUN echo "en_AU.UTF-8 UTF-8" >  /etc/locale.gen \
 && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
 && locale-gen \
 && echo "LANG=en_AU.UTF-8" >> /etc/locale.conf \
 && ln -s /usr/include/locale.h /usr/include/xlocale.h

# Install extra packages
RUN pacman --needed --noconfirm -S \
    base-devel \
    ctags \
    freetype2 \
    git \
    java-environment-common \
    java-runtime-common \
    jdk9-openjdk \
    jre9-openjdk \
    jre9-openjdk-headless \
    libjpeg-turbo \
    libpng \
    linux-api-headers \
    python2 \
    subversion \
    sudo \
    tree \
    vim
RUN pacman --needed --noconfirm -S \
    gcc-fortran

# Remove orphaned packages
#RUN if [ ! -z "$(pacman -Qtdq)" ]; then \
      #pacman --noconfirm -Rns $(pacman -Qtdq); \
    #fi

# Clear pacman caches
#RUN yes | pacman --noconfirm -Scc

# Optimise pacman database
#RUN pacman-optimize --nocolor

# Housekeeping
RUN rm -f /etc/pacman.d/mirrorlist.pacnew \
 && if [ -f /etc/systemd/coredump.conf.pacnew ]; then \
      mv -f /etc/systemd/coredump.conf.pacnew /etc/systemd/coredump.conf ; \
    fi \
 && if [ -f /etc/locale.gen.pacnew ];  then \
      mv -f /etc/locale.gen.pacnew /etc/locale.gen ; \
    fi

# Set up the askap user
RUN useradd -G users --create-home --password abc --shell /bin/bash askap \
 && echo "askap ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/askap \
 && chmod 0440 /etc/sudoers.d/askap
ADD . /home/askap/
RUN chown -R askap:askap /home/askap
WORKDIR /home/askap
USER askap
