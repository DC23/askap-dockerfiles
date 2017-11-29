FROM debian:jessie
RUN apt-get update && apt-get install -y \
    vim \
    vim-gtk \
    git \
&& rm -rf /var/lib/apt/lists/*

ENV NAME askapsoft
