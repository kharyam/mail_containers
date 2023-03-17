FROM registry.access.redhat.com/ubi8/ubi:latest

EXPOSE 2525
USER 0

RUN yum install -y postfix
COPY config/* /etc/postfix

# DEBUG ONLY
RUN yum install -y procps net-tools

CMD postfix start-fg

