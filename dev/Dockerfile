FROM PROJECT_app:latest

MAINTAINER Teanoon Celord <anticipationvu@gmail.com>
LABEL Description = "base image for development purpose which allows ides"

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    # common dev tools
    vim less htop git openssh-client zsh tmux wget curl w3m \
    # common x11 client dependencies
    libdbusmenu-glib4 libdbusmenu-gtk4 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libstartup-notification0 libxcb-util0 libgconf-2-4 \
    # atom dependencies
    libnss3 libasound2 libxtst6 \
    # better fonts
    ttf-wqy-microhei \
    # certificate
    ca-certificates \
    # ruby
    mysql-client libmysqlclient-dev postgresql-client sqlite3 \
    libssl-dev autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev \
    # some ides need machine-id info like atom/eclipse
    dbus && dbus-uuidgen > /etc/machine-id
    # rm -rf /var/lib/apt/lists/*

RUN chsh -s /bin/zsh dev
COPY .zshrc /home/dev/.zshrc
RUN chown dev:dev /home/dev/.zshrc

USER dev
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

WORKDIR /code
