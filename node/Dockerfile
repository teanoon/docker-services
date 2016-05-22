FROM node:4.2.3

# install global package only in the images
RUN npm install -g watchify browserify
RUN cp /usr/local/lib/node_modules /tmp/ -R
RUN useradd -m dev && \
    echo "dev:dev" | chpasswd
ADD run.sh /home/dev/
RUN chown dev:dev /home/dev/run.sh && chmod +x /home/dev/run.sh
USER dev
WORKDIR /code
