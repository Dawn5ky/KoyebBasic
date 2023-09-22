FROM debian:12
EXPOSE 0.0.0.0
WORKDIR /app
USER root

COPY loader.sh ./

RUN apt update && apt install curl wget tmux systemctl tcl expect pm2 -y && chmod +x entrypoint.sh

ENTRYPOINT [ "./loader.sh" ]
