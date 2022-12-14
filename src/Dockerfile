FROM alpine:3.16.2

RUN apk add --update --no-cache \
    openssh git vim git-daemon nginx \
    fcgiwrap spawn-fcgi supervisor \
    apache2-utils

RUN adduser -D git -s /usr/bin/git-shell && passwd -u git

RUN rm /etc/motd

RUN mkdir /home/git/git-shell-commands
RUN mkdir -p /srv/git

COPY create /home/git/git-shell-commands/create
RUN dos2unix /home/git/git-shell-commands/create
COPY list /home/git/git-shell-commands/list
RUN dos2unix /home/git/git-shell-commands/list
COPY sshd_config /etc/ssh/sshd_config
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY public_html /srv/web
COPY nginx.conf /etc/nginx/nginx.conf

RUN chown -R git:git /srv/git /home/git
RUN chown -R git:git /run/fcgiwrap
RUN chown -R git:git /run/nginx
RUN chmod +x /home/git/git-shell-commands/*

COPY run.sh /
RUN chmod +x /run.sh

EXPOSE 22
EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["/run.sh"]