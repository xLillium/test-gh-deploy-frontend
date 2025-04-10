FROM node:latest as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build -- --configuration=production

FROM nginx:alpine
LABEL org.opencontainers.image.source="https://github.com/xlillium/test-gh-deploy-frontend"
LABEL org.opencontainers.image.description="Frontend Angular to experiment with automated CI/CD deployment via Docker Swarm"
COPY --from=build /app/dist/test-gh-deploy-frontend/browser /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
