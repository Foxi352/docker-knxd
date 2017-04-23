#!/bin/sh

echo "Starting knxd service."

if [ $# -eq 0 ]; then
    ARGS=/etc/knxd/knxd.ini
else
    ARGS=$@
fi

CONFIG_PATH=/etc/knxd

if [ ! -e "$CONFIG_PATH/knxd.ini" ]; then
    echo "No config file found, using example file"
    cp /root/knxd.ini $CONFIG_PATH/;
fi

chown knxd:knxd /etc/knxd/knxd.ini

su -s /bin/sh -c "knxd $ARGS" knxd

# Workaround because knxd always forks to background
while [ true ] ; do
    sleep 5
done