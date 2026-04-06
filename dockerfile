FROM docker.io/library/node:22 as builder
WORKDIR /app
COPY ./ /app/
RUN ci && npm run build

FROM docker.io/library/nginx
COPY --from=builder /app/dist/* /usr/share/nginx/html