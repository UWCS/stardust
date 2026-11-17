FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY prod/public/ /srv/stardust/prod/public

COPY draft/public/ /srv/stardust/draft/public

EXPOSE 80 81