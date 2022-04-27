FROM ubuntu:jammy
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
LABEL org.opencontainers.image.source=https://github.com/apnar/docker-image-rsync-server

RUN apt-get update && apt-get install -y \
    rsync \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup rsync
EXPOSE 873

CMD ["rsync_server"]
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
RUN chmod 744 /entrypoint.sh
