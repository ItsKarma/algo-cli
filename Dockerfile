FROM debian:stretch
RUN apt-get update
RUN apt install -y \
    curl \
    file \
    git
RUN curl -sSLf https://algorithmia.com/install.sh | sh
ENTRYPOINT ["/usr/local/bin/algo"]
