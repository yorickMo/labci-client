FROM httpd:2.4

COPY ./build/web/ /usr/local/apache2/htdocs/
COPY ./.htaccess  /usr/local/apache2/htdocs/.htaccess
COPY ./httpd.conf  /usr/local/apache2/conf/httpd.conf
