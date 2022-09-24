FROM alpine:3.16.2

RUN apk add --update --no-cache \
    git-daemon nginx fcgiwrap spawn-fcgi supervisor apache2-utils

COPY run.sh /
RUN chmod +x /run.sh

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY public_html /srv/web

RUN chown -R nginx /srv
RUN chown -R nginx /run/fcgiwrap
EXPOSE 80
STOPSIGNAL SIGQUIT

CMD ["/run.sh"]