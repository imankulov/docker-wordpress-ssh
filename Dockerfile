FROM tutum/wordpress:latest
MAINTAINER Roman Imankulov <roman.imankulov@gmail.com>

# TODO: regenerate SSH host public keys on image startup

# Install some extra packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server php5-imagick php5-curl

# Tweak Apache installation
RUN a2enmod rewrite
ADD apache-default /etc/apache2/sites-available/default
RUN chown -R www-data:www-data /app

# Configure OpenSSH
ADD start-ssh.sh /start-ssh.sh
RUN chmod 755 /start-ssh.sh
ADD supervisord-ssh.conf /etc/supervisor/conf.d/supervisord-ssh.conf

EXPOSE 22 80 3306
ENV ROOT_PASSWORD wordpressroot
CMD ["/run.sh"]
