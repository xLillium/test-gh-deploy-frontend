FROM node:20-alpine as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build -- --configuration production

FROM nginx:alpine
COPY --from=build /app/dist/test-gh-deploy-frontend /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf
