#
# Build stage
#
FROM maven:3.8.7-eclipse-temurin-19 AS build
COPY ./ /home/app/
ENV SPRING_PROFILES_ACTIVE ${SPRING_PROFILES_ACTIVE}
RUN mvn -f home/app/pom.xml clean package

#export SPRING_PROFILES_ACTIVE=prod && mvn clean install

#
# Package stage
#
FROM openjdk:eclipse-temurin-19
VOLUME /logs
COPY --from=build /home/app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar", "app.jar"]
