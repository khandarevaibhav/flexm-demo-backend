# Use an official Gradle image to build the application
FROM gradle:7.3.3-jdk17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle wrapper and build scripts
COPY build.gradle settings.gradle gradlew gradlew.bat ./
COPY gradle ./gradle

# Copy the source code
COPY src ./src

# Build the application
RUN ./gradlew build

# Use an official OpenJDK runtime as a parent image for running the application
FROM openjdk:17-jdk-alpine

# Create the necessary directory structure
RUN mkdir -p /var/www/backend

# Set the working directory
WORKDIR /var/www/backend

# Copy the built jar file from the build stage
COPY --from=build /app/build/libs/backapp-0.0.1.jar /var/www/backend/app.jar

# Verify the contents of the directory (for debugging)
RUN ls -l /var/www/backend/

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/var/www/backend/app.jar"]

