FROM node:latest
EXPOSE 80
EXPOSE 8080
EXPOSE 8880
EXPOSE 8443
EXPOSE 2053
WORKDIR /app
USER root
COPY loader.sh ./

RUN apt update &&\
    apt install curl wget tmux systemctl tcl expect -y &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\
    chmod +x entrypoint.sh

ENTRYPOINT [ "./loader.sh" ]
