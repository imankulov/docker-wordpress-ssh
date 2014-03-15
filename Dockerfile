FROM tutum/wordpress:latest
MAINTAINER Roman Imankulov <roman.imankulov@gmail.com>

# TODO: regenerate SSH host public keys on image startup

# Add image configuration and scripts
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server
ADD start-ssh.sh /start-ssh.sh
RUN chmod 755 /start-ssh.sh
ADD supervisord-ssh.conf /etc/supervisor/conf.d/supervisord-ssh.conf

EXPOSE 22 80 3306
ENV ROOT_PASSWORD wordpressroot
CMD ["/run.sh"]
