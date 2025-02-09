# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package list, install Nginx, and clean up
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy the custom index.html to the Nginx web directory
COPY index.html /var/www/html/

# Replace the default Nginx config to listen on port 8080
RUN echo 'server {\n\
    listen 8080;\n\
    root /var/www/html;\n\
    index index.html;\n\
    server_name localhost;\n\
    location / {\n\
        try_files $uri $uri/ =404;\n\
    }\n\
}' > /etc/nginx/sites-available/default

# Expose port 8080
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
