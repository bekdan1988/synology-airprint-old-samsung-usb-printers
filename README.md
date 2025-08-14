# znetwork/cups-avahi-airprint [docker-image](https://hub.docker.com/r/znetwork/synology-airprint)
- Included drivers HP, Samsung, Canon, Xerox, etc.
- It supports old Samsung USB printers too (e.g. Samsung Xpress SL-M2026 Laser Printer).

# Working on Synology DSM 7 and AMD64 (Tested on Synology DS423+)

Fork from [ziwork/synology-airprint](https://github.com/ziwork/synology-airprint)

This Ubuntu-based Docker image runs a CUPS instance that is meant as an AirPrint relay for printers that are already on the network but not AirPrint capable.
* `Included drivers HP, Samsung, Canon, Xerox, etc.`

It supports old Samsung USB printers too (e.g. Samsung Xpress SL-M2026 Laser Printer).
* `Added drivers Samsung Print Driver for Linux (uld_V1.00.39_01.17 from Samsung Support) and Samsung Unified Linux Driver (UnifiedLinuxDriver-1.00.06 from https://www.bchemnet.com/suldr/)`

Supported Samsung printers list
* `[https://bchemnet.com/suldr/supported.html](https://www.bchemnet.com/suldr/supported.html)`

## Before Install:
- Add **Community Packages** to **Package Center** on NAS (tutorial: https://mariushosting.com/synology-how-to-add-community-packages-to-package-center/)
- Install **SynoCli File Tools**, **SynoCli Kernel Tools** and **SynoKerner USB Serial drivers** from community packages
- Install **Text Editor** from **Package Center** to edit _yml_ file directly on NAS (https://mariushosting.com/synology-text-editor-is-a-must-have/)
- Plug in your USB printer to NAS
- Check if the printer is listed on **Synology Control Panel/Info Center** as USB printer (must be listed)

## Installation
- Go to File Station and open the docker folder. Inside the docker folder, create one new folder and name it **synology-airprint**.
  - Note: Be careful to enter only lowercase, not uppercase letters.
  - Default is: "/volume1/docker/synology-airprint/"
- Now create two new folders inside the **synology-airprint** folder that you have previously created and name them config, services.
  - Note: Be careful to enter only lowercase, not uppercase letters.
- Download all files and folders from this repo and put them to the **synology-airprint** folder
- Edit the **docker-compose.yml** to set administrator account and password
  - Default is **print / print** ("CUPSADMIN: print CUPSPASSWORD: print")
- Edit the **docker-compose.yml** to set **Time Zone**
  - Default is **Europe/Budapest** ("TZ: Europe/Budapest")
- Open **Container Manager** on NAS and create a **New Project**
  - Project name: synology-airprint
  - Path: /volume1/docker/synology-airprint
  - Source: Upload a docker-compose.yml
  - File: Browse /volume1/docker/synology-airprint/docker-compose.yml
- Wait for the build process to finish
- Access CUPS server @ http://your-nas-ip:631/
- Select **Administration** and log in with your admin account set in **docker-compose.yml**
- Under **Printers** select **Find New Printers**
- Select the USB printer you want to add from **Local Printers** and click to **Continue**
- Set Name, Description, Location. Check **Share This Printer** and click to **Continue**
  - Next to Connection you must see "usb://Samsung/**_printername_**?serial=**_printerserial_**".
- Next to Make Select **SAMSUNG** and Model ***Your printers model*** (e.g. Samsung M2020 Series (en)) and click **Add Printer**
- Go to **Printers** page and **select the printer you added**. Click on **Maintance** and select **Print Test Page**
- Profit
  
### Ports/Network:
* **Must be run on host network. This is required to support multicasting which is needed for Airprint.**
