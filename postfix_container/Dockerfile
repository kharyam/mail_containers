FROM registry.access.redhat.com/ubi8/ubi:latest

EXPOSE 2525
USER 0

# DEBUG ONLY
RUN yum install -y procps net-tools

RUN yum install -y postfix && \
    rm /usr/bin/dnf && \
    rm /usr/bin/yum && \
    mkdir -p /usr/stiria/cs && \
    useradd -d /usr/stiria/cs/faxinterceptor fmail && \
    useradd -d /usr/stiria/cs/groupmailinterceptor gmail && \
    useradd -d /usr/stiria/cs/accountinterceptor amail && \
    useradd -d /usr/stiria/cs/mailinterceptor smail 

COPY config/* /etc/postfix

RUN cd /etc/postfix && postalias aliases && postmap virtual && postmap access 

USER 1000
CMD postfix start-fg

