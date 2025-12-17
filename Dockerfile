FROM alpine:3.23

RUN apk add --no-cache --no-progress ca-certificates tzdata

ARG TARGETPLATFORM
COPY ./dist/$TARGETPLATFORM/traefik /usr/local/bin/traefik
RUN chmod +x /usr/local/bin/traefik
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["traefik"]