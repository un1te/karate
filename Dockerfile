FROM maven:3.8.1

WORKDIR /usr/scr/app

COPY pom.xml /usr/scr/app
COPY ./src/test/java /usr/scr/app/scr/test/java

