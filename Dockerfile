FROM openjdk:17-ea-slim

ENV ENV_APP_HOME /app

#Exposed as build time argument, which is then set to environment variable
ARG ARG_APP_PORT=8080
ENV ENV_APP_PORT $ARG_APP_PORT

#Default memory is 1.5GB
ARG ARG_SERVER_MEMORY=768
ENV ENV_SERVER_MEMORY=$ARG_SERVER_MEMORY

RUN mkdir -p $ENV_APP_HOME
COPY ./target/*-SNAPSHOT.jar $ENV_APP_HOME
WORKDIR $ENV_APP_HOME
EXPOSE $ENV_APP_PORT

ENTRYPOINT java -classpath ./* -Xmx"$ENV_SERVER_MEMORY"M org.springframework.boot.loader.JarLauncher --server.port=$ENV_APP_PORT