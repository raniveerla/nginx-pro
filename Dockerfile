# Use official NGINX image
FROM nginx:latest

# Copy custom NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static website files
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

