#
# Build stage
#
FROM maven:3.8.6-openjdk-11-slim AS build
COPY . .
RUN mvn -f pom.xml clean package

#export SPRING_PROFILES_ACTIVE=prod && mvn clean install

#
# Package stage
#
FROM openjdk:11-jre-slim
VOLUME /logs
COPY --from=build /target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar", "app.jar"]
