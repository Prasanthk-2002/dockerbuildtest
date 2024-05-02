FROM ubuntu
RUN apt-get update -y && apt-get install nginx -y
RUN mkdir /var/www/tutorial && mkdir -p /root/sample.yml
RUN chown -R www-data:www-data  /var/www/tutorial
COPY --chown=www-data:www-data index.html /var/www/tutorial/index.html
COPY --chown=www-data:www-data tutorial /etc/nginx/sites-enabled/
RUN service nginx restart
EXPOSE 81
CMD ["nginx", "-g", "daemon off;"]
