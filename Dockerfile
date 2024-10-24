FROM debian:sid-slim
RUN apt-get update \
    && apt-get install -y texlive-full fonts-font-awesome 
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
