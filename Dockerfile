# ---- Build stage ----
FROM node:22-alpine AS build

WORKDIR /app/

COPY simple-calendar-docs/package.json simple-calendar-docs/package-lock.json ./simple-calendar-docs/
RUN cd ./simple-calendar-docs/; npm ci

COPY . .
# Apparently the docusaurus site has dependencies on the foundry module itself??? Need to build this or it wont work.
RUN npm ci; npm run build
# Now build the actual docs site...
RUN cd ./simple-calendar-docs/; npm run build


# ---- Runtime stage ----
FROM nginx:alpine

RUN addgroup -S nginxuser \
    && adduser -S -G nginxuser nginxuser

COPY --from=build /app/simple-calendar-docs/build /usr/share/nginx/html

RUN chown -R nginxuser:nginxuser /usr/share/nginx/html \
    && chmod -R 755 /usr/share/nginx/html \
    && mkdir -p /var/cache/nginx /var/run /var/log/nginx /run \
    && chown -R nginxuser:nginxuser /var/cache/nginx /var/run /var/log/nginx /run /etc/nginx/conf.d

USER nginxuser

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]