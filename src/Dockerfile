FROM alpine:3.16.2

RUN apk add --update --no-cache openssh git vim

RUN adduser -D git -s /usr/bin/git-shell && passwd -u git

RUN rm /etc/motd
RUN mkdir /etc/ssh/keys/
RUN mkdir /home/git/git-shell-commands
RUN mkdir -p /srv/git

COPY create /home/git/git-shell-commands/create
COPY list /home/git/git-shell-commands/list
COPY sshd_config /etc/ssh/sshd_config

RUN chown -R git:git /srv/git /home/git
RUN chmod +x /home/git/git-shell-commands/*

# COPY keys/authorized_keys /etc/ssh/keys/authorized_keys
# COPY keys/ssh_host_rsa_key /etc/ssh/keys/ssh_host_rsa_key
# RUN chmod 755 /etc/ssh/keys
# RUN chmod 600 /etc/ssh/keys/ssh_host_rsa_key
# RUN chmod 644 /etc/ssh/keys/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-De"]