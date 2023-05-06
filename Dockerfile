FROM alpine:3.17.3
RUN apk update && \
    apk add --no-cache \
        texlive-full && \
    rm -rf /var/cache/apk/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
