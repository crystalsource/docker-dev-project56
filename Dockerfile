FROM crystalsource/crystal-webdev-php56
MAINTAINER Mike Bertram <contact@crystalsource.de>

# Non interactive
ENV DEBIAN_FRONTEND noninteractive

# Delete docroot
RUN rm -rf /var/www/html

# Copy Project
ADD www /var/www/project
ADD sql /var/www/sqldump

# Copy scripts
ADD .docker/scripts /opt/docker/project

# Set permissions
RUN chown -Rf www-data:www-data /var/www/project

# Create symlink
RUN ln -s /var/www/project /var/www/html

# Import DB
RUN /opt/docker/project/import-sql.sh


# CMD
CMD ["supervisord", "-n"]