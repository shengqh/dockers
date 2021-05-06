FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y gnupg2
RUN apt-get install -y ca-certificates

RUN echo "deb https://s3.amazonaws.com/repo.deb.cyberduck.io stable main" | tee /etc/apt/sources.list.d/cyberduck.list > /dev/null
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FE7097963FEFBE72
RUN apt-get update
RUN apt-get install -y duck

RUN apt-get install -y lftp
