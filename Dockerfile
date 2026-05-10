# ---- Build stage ----
FROM node:22-alpine AS build

WORKDIR /app/

COPY simple-calendar-docs/package.json simple-calendar-docs/package-lock.json ./simple-calendar-docs/
RUN cd ./simple-calendar-docs/; npm ci

COPY . .
RUN cd ./simple-calendar-docs/; ls ../ -l ; npm run build


# ---- Runtime stage ----
FROM nginx:alpine

COPY --from=build /app/simple-calendar-docs/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]