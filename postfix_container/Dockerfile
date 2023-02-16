FROM registry.access.redhat.com/ubi8/ubi:latest

USER root

RUN yum install -y postfix
COPY config/* /etc/postfix

# DEBUG ONLY
RUN yum install -y procps net-tools

CMD postfix start-fg

