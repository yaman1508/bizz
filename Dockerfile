# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install system dependencies and OpenJDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get install -y maven && \
    apt-get clean

# Set working directory inside container
WORKDIR /app

# Copy the JAR file from the host to the container
# Replace `your-app.jar` with the actual name of your JAR file
COPY target/BusinessProject-0.0.1-SNAPSHOT.jar /app/BusinessProject-0.0.1-SNAPSHOT.jar

# Expose the port the app runs on
EXPOSE 2330

# Define the command to run the Spring Boot application JAR file
CMD ["/usr/bin/env", "java", "-jar", "/app/BusinessProject-0.0.1-SNAPSHOT.jar"]
