FROM nginx:latest

COPY dockerfiles/nginx/nginx_local.conf /etc/nginx/conf.d/default.conf
