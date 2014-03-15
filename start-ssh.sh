#!/bin/bash
test -n "$ROOT_PASSWORD" && echo "root:$ROOT_PASSWORD" | chpasswd --md5
mkdir -p /var/run/sshd
exec /usr/sbin/sshd -D
