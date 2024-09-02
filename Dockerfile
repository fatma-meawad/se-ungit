# Use the official Ubuntu image as the base
FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    nodejs \
    npm \
    bash \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Install Ungit globally using npm
RUN npm install -g ungit

# Create a working directory
WORKDIR /app

# Expose the port that Ungit will use
EXPOSE 8448

# Start Ungit when the container runs
CMD ["ungit", "--port", "8448", "--no-b", "--git", "/app"]
