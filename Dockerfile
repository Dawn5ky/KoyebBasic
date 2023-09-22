FROM debian:12
EXPOSE 80
WORKDIR /app
USER root

COPY loader.sh ./

RUN apt-get update && apt-get install curl wget tmux systemctl tcl expect pm2 -y && chmod -v 755 v entrypoint.sh

ENTRYPOINT [ "./loader.sh" ]
