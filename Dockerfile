FROM node:latest
EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 8880
EXPOSE 8443
EXPOSE 2053
WORKDIR /app
USER root
COPY * ./

RUN apt update &&\
    apt install curl wget tmux systemctl nano -y &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\
    chmod +x loader.sh

ENTRYPOINT [ "./loader.sh" ]
