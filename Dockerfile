FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY target/demo-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT [ "java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/app.jar" ]