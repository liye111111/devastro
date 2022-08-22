#FROM mcr.microsoft.com/java/jdk:8u312-zulu-alpine
#FROM openjdk:8-slim-buster
FROM openjdk:8-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
COPY entrypoint.sh entrypoint.sh
ENV APP_NAME "demo"
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 8080 18000