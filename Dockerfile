FROM seapy/rails-nginx-unicorn

EXPOSE 80

COPY config/nginx.conf /etc/nginx/sites-enabled/default
