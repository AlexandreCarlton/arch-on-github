FROM base/archlinux:latest

RUN pacman \
      --noconfirm \
      --refresh \
      --sync \
      --sysupgrade && \
    pacman \
      --noconfirm \
      --sync \
      binutils \
      fakeroot \
      sudo \
      wget && \
    pacman \
      --sync \
      --clean \
      --noconfirm

RUN useradd builduser && \
    echo 'builduser ALL=(ALL) NOPASSWD: ALL' \
    | EDITOR='tee -a' visudo