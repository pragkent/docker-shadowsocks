#!/bin/sh

set -e

sed -i "s/_PASSWORD_/$PASSWORD/g" config.json

./shadowsocks-server -c config.json
