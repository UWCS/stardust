FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY public/ /srv/stardust/public

EXPOSE 80