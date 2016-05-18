FROM ruby:2.3.1-slim

COPY sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y mysql-client libmysqlclient-dev postgresql-client sqlite3 nodejs \
                       autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev libssl-dev \
                    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m dev && \
    echo "dev:dev" | chpasswd && \
    # ruby is accessible by staff group
    usermod -aG staff dev

USER dev

WORKDIR /code
EXPOSE 3000
