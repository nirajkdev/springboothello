# Use an official Maven image to build the app
FROM maven:3.8.1-openjdk-11 as build

WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

# Now, use an OpenJDK base image to run the app
FROM openjdk:11-jre-slim

WORKDIR /app
COPY --from=build /app/target/spring-boot-hello-world-0.0.1-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

# Expose the port that Spring Boot listens to
EXPOSE 8080
