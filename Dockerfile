# Stage 1: Build the application
FROM dart:3.7.2 AS build

WORKDIR /app

# Copy pubspec files
COPY pubspec.* ./

# Get dependencies
RUN dart pub get

# Copy the rest of the application
COPY . .

# Ensure the application has all dependencies
RUN dart pub get --offline

# Build an AOT-compiled executable
RUN dart compile exe bin/streamable_http_server.dart -o /app/server

# Stage 2: Run the application in a minimal container
FROM scratch

# Copy the AOT-compiled binary from the build stage
COPY --from=build /app/server /server
COPY --from=build /runtime/ /

# Set executable permissions
WORKDIR /

# Run the server
ENTRYPOINT ["/server"]

# Document that the container listens on port 3000
EXPOSE 3000
