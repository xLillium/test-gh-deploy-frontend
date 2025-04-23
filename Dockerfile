# --- Stage 1: Angular build environment ---

# Use the official Node.js image to build the Angular application
FROM node:latest as build

# Set the working directory inside the container
WORKDIR /app

# Copy application source code into the container
COPY . .

# Install project dependencies
RUN npm install

# Build the Angular app in production mode
RUN npm run build -- --configuration=production


# --- Stage 2: Nginx server for static content ---

# Use the official lightweight Nginx image based on Alpine Linux
FROM nginx:alpine

# Metadata for image consumers
LABEL org.opencontainers.image.source="https://github.com/xlillium/test-gh-deploy-frontend"
LABEL org.opencontainers.image.description="Frontend Angular served via Nginx in Kubernetes"

# Copy the compiled Angular app from the previous stage into Nginx's default static files directory
COPY --from=build /app/dist/test-gh-deploy-frontend/browser /usr/share/nginx/html

# Replace the default Nginx configuration with a custom one tailored for single-page applications (SPA)
COPY nginx.conf /etc/nginx/nginx.conf

# Ensure necessary directories exist and are writable by the non-root 'nginx' user
RUN mkdir -p /var/cache/nginx/client_temp \
    && mkdir -p /var/run \
    && mkdir -p /var/tmp/nginx \
    && chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /var/run \
    && chown -R nginx:nginx /var/tmp/nginx \
    && chown -R nginx:nginx /usr/share/nginx/html

# Use the non-root 'nginx' user for better security, especially in Kubernetes environments
USER nginx
