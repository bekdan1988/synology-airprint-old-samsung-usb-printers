# znetwork/cups-avahi-airprint [docker-image](https://hub.docker.com/r/znetwork/synology-airprint)

# Working on Synology DSM 7 (!!!) and AMD64

Fork from [quadportnick/docker-cups-airprint](https://github.com/quadportnick/docker-cups-airprint) and [chuckcharlie/docker-cups-airprint](https://github.com/chuckcharlie/docker-cups-airprint)

This Ubuntu-based Docker image runs a CUPS instance that is meant as an AirPrint relay for printers that are already on the network but not AirPrint capable.
* `Included drivers HP, Samsung, Canon, Xerox, etc.`

Added support for old Samsung USB printers like Samsung Xpress SL-M2026 Laser Printer.

Before Install:
- Add Community Packages to Package Center on NAS (tutorial: https://mariushosting.com/synology-how-to-add-community-packages-to-package-center/)
- Install **SynoCli File Tools**, **SynoCli Kernel Tools** and **SynoKerner USB Serial drivers** from community packages


## Manual Configuration

### Volumes:
* `/config`: where the persistent printer configs will be stored
* `/services`: where the Avahi service files will be generated

### Variables:
* `CUPSADMIN`: the CUPS admin user you want created - default is `admin` if unspecified
* `CUPSPASSWORD`: the password for the CUPS admin user - default is `admin` username if unspecified

### Ports/Network:
* **Must be run on host network. This is required to support multicasting which is needed for Airprint.**


### Example run env command:
```
docker run --name cups --restart unless-stopped  --net host\
  -v <your services dir>:/services \
  -v <your config dir>:/config \
  -e CUPSADMIN="<username>" \
  -e CUPSPASSWORD="<password>" \
  znetwork/synology-airprint:latest
```
