FROM debian:trixie-slim
RUN apt-get update \
    && apt-get install -y texlive-full texlive-fonts-extra fonts-font-awesome
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
