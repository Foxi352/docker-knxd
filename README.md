# knxd
For documentation and information on the KNXD project [check our their GitHub page](https://github.com/knxd/knxd).

## Exposed ports
***This is for reference only. You have to start the container with --net=host or use macvlan driver.***

* 3671/udp (multicast port)
* 6720/tcp (knx-ip)

## Exported volumes
* /etc/knxd (for knxd.ini file)

## Example container start command
As default the image starts `knxd` as an entrypoint and passes `/etc/knxd/knxd.ini` as command. If you want to run the image on it's own you have multiple choices to pass parameters to the knx daemon. Some are:

* Map `/etc/knxd` to a local volume of your host and put a `knxd.ini` inside
* Pass command line parameters to image as you would pass to the deamon directly. Example `docker run knxd --version`

Example to run the image standalone with a provided ini file in `./knxd/etc/knxd.ini`:

	docker run -d --net=host -v ./knxd/etc:/etc/knxd foxi352/knxd
