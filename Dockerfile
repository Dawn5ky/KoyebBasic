EXPOSE 80
WORKDIR /app
USER root

COPY loader.sh ./

RUN apt-get update && chmod +x loader.sh

ENTRYPOINT [ "./loader.sh" ]
