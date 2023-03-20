FROM registry.access.redhat.com/ubi8/ubi:latest

EXPOSE 2525
USER 0

# DEBUG ONLY
RUN yum install -y procps net-tools

RUN yum install -y postfix && \
    rm /usr/bin/dnf && \
    rm /usr/bin/yum
COPY config/* /etc/postfix

USER 1000
CMD postfix start-fg

