# znetwork/cups-avahi-airprint [docker-image](https://hub.docker.com/r/znetwork/synology-airprint) - Added support for old Samsung USB printers like Samsung Xpress SL-M2026 Laser Printer

# Working on Synology DSM 7 (!!!) and AMD64

Fork from [quadportnick/docker-cups-airprint](https://github.com/ziwork/synology-airprint)

This Ubuntu-based Docker image runs a CUPS instance that is meant as an AirPrint relay for printers that are already on the network but not AirPrint capable.
* `Included drivers HP, Samsung, Canon, Xerox, etc.`

**Added support for old Samsung USB printers like Samsung Xpress SL-M2026 Laser Printer.**

Before Install:
- Add Community Packages to Package Center on NAS (tutorial: https://mariushosting.com/synology-how-to-add-community-packages-to-package-center/)
- Install **SynoCli File Tools**, **SynoCli Kernel Tools** and **SynoKerner USB Serial drivers** from community packages
- Plug in your USB printer
- Check if the printer is listed on **Synology Control Panel/Info Center/** as USB printer
- Edit the **docker-compose.yml** to set administrator name and password
  Default is: "CUPSADMIN: print CUPSPASSWORD: print"

## Installation
- Go to File Station and open the docker folder. Inside the docker folder, create one new folder and name it **synology-airprint**.
  Note: Be careful to enter only lowercase, not uppercase letters.
  Default is: "/volume1/docker/synology-airprint/"
- Now create two new folders inside the **synology-airprint** folder that you have previously created and name them config, services.
  Note: Be careful to enter only lowercase, not uppercase letters.
- Download all files from this repo and put them to the **synology-airprint** folder
- Open **Container Manager** on NAS and create a **New Project**
  Project name: synology-airprint
  Path: /volume1/docker/synology-airprint
  Source: Upload a docker-compose.yml
  File: Browse /volume1/docker/synology-airprint/docker-compose.yml
- Wait for the build process to finish
- Access Cups server @ http://your-nas-ip:631/
- Select Administration

### Ports/Network:
* **Must be run on host network. This is required to support multicasting which is needed for Airprint.**
