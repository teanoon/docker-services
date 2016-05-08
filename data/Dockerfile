FROM debian:jessie

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y git

# takes environment variables
# check if target $REPO exists
# if not, git clone target $BRANCH
