# Use Ubuntu as the base image
FROM ubuntu:latest

# Update the package list and install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy the custom index.html to the Nginx web directory
COPY index.html /usr/share/nginx/html

# Expose port 8080
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

