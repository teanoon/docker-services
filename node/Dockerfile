FROM node:4.2.3

# install global package only in the images
RUN npm install -g watchify browserify
RUN useradd -m dev && \
    echo "dev:dev" | chpasswd
USER dev
WORKDIR /code
