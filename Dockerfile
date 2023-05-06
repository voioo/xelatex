FROM alpine:3.17.3
RUN apt-get update \
    apt-get install -y texlive-full texlive-fonts-extra
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
