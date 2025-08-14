# znetwork/cups-avahi-airprint [docker-image](https://hub.docker.com/r/znetwork/synology-airprint)
Included drivers HP, Samsung, Canon, Xerox, etc. Added support for old Samsung USB printers (e.g. Samsung Xpress SL-M2026 Laser Printer).

# Working on Synology DSM 7 and AMD64 (Tested on Synology DS423+)

Fork from [ziwork/synology-airprint](https://github.com/ziwork/synology-airprint)

This Ubuntu-based Docker image runs a CUPS instance that is meant as an AirPrint relay for printers that are already on the network but not AirPrint capable.
* `Included drivers HP, Samsung, Canon, Xerox, etc.`

Added drivers:
* `Samsung Print Driver for Linux (uld_V1.00.39_01.17 from Samsung Support`
* `Samsung Unified Linux Driver (UnifiedLinuxDriver-1.00.06 from https://bchemnet.com`

Added Samsung printers list:
* [bchemnet.com](https://www.bchemnet.com/suldr/supported.html)

## Before Install:
- Add **Community Packages** to **Package Center** on NAS (tutorial: [mariushosting.com](https://mariushosting.com/synology-how-to-add-community-packages-to-package-center)).
- Install **SynoKerner USB Serial drivers** from **Package Center/Community**.
- **Plug in your USB printer** to NAS.
- **Check** if the printer is listed in **Synology Control Panel/Info Center** as **USB printer**. **It must be listed**.

## Installation
- Go to **File Station** and open the **docker folder**. Inside the docker folder, **create one new folder** and name it **synology-airprint**.
  - Note: Be careful to enter only lowercase, not uppercase letters.
  - Default is: "/volume1/docker/synology-airprint/"
- Now **create two new folders inside the synology-airprint folder** that you have previously created and name them **config, services**.
  - Note: Be careful to enter only lowercase, not uppercase letters.
- **Download this repo** and **copy all the files and the root folder to the synology-airprint folder**.
- Open **Container Manager** on NAS and create a **New Project**.
  - Project name: synology-airprint
  - Path: /volume1/docker/synology-airprint
  - Source: Upload a docker-compose.yml
  - File: Browse /volume1/docker/synology-airprint/docker-compose.yml
- **Edit the docker-compose.yml** to **set administrator account and password**.
  - Default is print / print (CUPSADMIN, CUPSPASSWORD)
- **Edit the docker-compose.yml** to **set Time Zone**.
  - Default is Europe/Budapest (TZ)
- **Build the project** and wait for the build process to finish.
- **Access CUPS server** @ http://your-nas-ip:631.
- Select **Administration** and **log in with your admin account** set in docker-compose.yml.
- Under **Printers** select **Find New Printers**.
- **Select the USB printer** you want to add from **Local Printers** and click to **Continue**.
- **Set Name, Description, Location**. Check **Share This Printer** and click to **Continue**.
  - Next to Connection you must see "usb://Samsung/printername?serial=printerserial"
- Click to **Make Select** and **select manufacturer** (e.g. SAMSUNG). Select your printers **Model** (e.g. Samsung M2020 Series (en)) and click **Add Printer**.
- Go to **Printers** page and **select the printer you added**. Click on **Maintance** and select **Print Test Page**.
- **Profit**.
  
### Ports/Network:
* **Must be run on host network. This is required to support multicasting which is needed for Airprint.**
