wordpress-ssh
======================

Wordpress installation with SSH access, based on
[tutum-docker-wordpress](https://github.com/tutumcloud/tutum-docker-wordpress)

Running your Wordpress docker image
-----------------------------------

Start your image:

	docker run -d -p 1080:80 -p 1022:22 -e ROOT_PASSWORD=foobar imankulov/wordpress-ssh

Test your deployment:

	curl http://localhost:1088

Visit your installation:

    ssh root@localhost -p 1022
