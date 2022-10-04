FROM alpine:3.16.2

RUN apk add --update --no-cache openssh git vim

RUN adduser -D git -s /usr/bin/git-shell && passwd -u git

RUN rm /etc/motd

RUN mkdir /home/git/git-shell-commands
RUN mkdir -p /srv/git

COPY create /home/git/git-shell-commands/create
COPY list /home/git/git-shell-commands/list
COPY sshd_config /etc/ssh/sshd_config

RUN chown -R git:git /srv/git /home/git
RUN chmod +x /home/git/git-shell-commands/*

COPY run.sh /
RUN chmod +x /run.sh

EXPOSE 22
CMD ["/run.sh"]