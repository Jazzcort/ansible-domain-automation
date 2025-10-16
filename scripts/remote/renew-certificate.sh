#!/bin/bash

set -e

SERVICE=domain-server

systemctl stop ${SERVICE}

certbot renew
echo "Successfully renewed the certificate!"

sleep 3

systemctl start ${SERVICE}
echo "${SERVICE} has been restarted!"

systemctl status ${SERVICE} --no-pager
