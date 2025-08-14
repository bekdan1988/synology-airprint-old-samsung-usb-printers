# znetwork/cups-avahi-airprint [docker-image](https://hub.docker.com/r/znetwork/synology-airprint) with support for old Samsung USB printers (e.g. Samsung Xpress SL-M2026 Laser Printer)

# Supported Samsung printers list
- https://www.bchemnet.com/suldr/supported.html
`Samsung_C140x_Series
Samsung_C145x_Series
Samsung_C1810_Series
Samsung_C1860_Series
Samsung_C2620_Series
Samsung_C2670_Series
Samsung_C268x_Series
Samsung_C3010_Series
Samsung_C3060_Series
Samsung_C351x_Series
Samsung_C401x_Series
Samsung_C406x_Series
Samsung_C410_Series
Samsung_C420_Series
Samsung_C43x_Series
Samsung_C460_Series
Samsung_C470_Series
Samsung_C4820_Series
Samsung_C48x_Series
Samsung_CLP-300_Series
Samsung_CLP-310_Series
Samsung_CLP-320_Series
Samsung_CLP-350_Series
Samsung_CLP-360_Series
Samsung_CLP-410_Series
Samsung_CLP-600_Series
Samsung_CLP-610_Series
Samsung_CLP-620_Series
Samsung_CLP-660_Series
Samsung_CLP-670_Series
Samsung_CLP-680_Series
Samsung_CLP-770_Series
Samsung_CLP-775_Series
Samsung_CLX-216x_Series
Samsung_CLX-3160_Series
Samsung_CLX-3170_Series
Samsung_CLX-3180_Series
Samsung_CLX-3300_Series
Samsung_CLX-4190_Series
Samsung_CLX-6200_Series
Samsung_CLX-6220_Series
Samsung_CLX-6240_Series
Samsung_CLX-6250_Series
Samsung_CLX-6260_Series
Samsung_CLX-8380_Series
Samsung_CLX-8385_Series
Samsung_CLX-8385X_Series
Samsung_CLX-8540_Series
Samsung_CLX-8640_8650_Series
Samsung_CLX-9250_9350_Series
Samsung_CLX-9252_9352_Series
Samsung_CLX-92x1_93x1_Series
Samsung_CLX-981x_Series
Samsung_CLX-982x_Series
Samsung_K2200_Series
Samsung_K302_Series
Samsung_K3250_Series
Samsung_K401_Series
Samsung_K4350_Series
Samsung_K703_Series
Samsung_K7600_Series
Samsung_M2020_Series
Samsung_M2070_Series
Samsung_M262x_282x_Series
Samsung_M267x_287x_Series
Samsung_M283x_Series
Samsung_M288x_Series
Samsung_M301x_Series
Samsung_M306x_Series
Samsung_M332x_382x_402x_Series
Samsung_M337x_387x_407x_Series
Samsung_M403x_Series
Samsung_M408x_Series
Samsung_M4370_5370_Series
Samsung_M453x_Series
Samsung_M458x_Series
Samsung_M5270_Series
Samsung_M536x_Series
Samsung_MFP_560_Series
Samsung_MFP_65x_Series
Samsung_MFP_750_Series
Samsung_ML-1520_Series
Samsung_ML-1610_Series
Samsung_ML-1630_Series
Samsung_ML-1630W_Series
Samsung_ML-1640_Series
Samsung_ML-1660_Series
Samsung_ML-1670_Series
Samsung_ML-1710_Series
Samsung_ML-1740_Series
Samsung_ML-1860_Series
Samsung_ML-1865W_Series
Samsung_ML-191x_Series
Samsung_ML-2010_Series
Samsung_ML-2150_Series
Samsung_ML-2160_Series
Samsung_ML-2240_Series
Samsung_ML-2245_Series
Samsung_ML-2250_Series
Samsung_ML-2510_Series
Samsung_ML-2525W_Series
Samsung_ML-2540_Series
Samsung_ML-2550_Series
Samsung_ML-2570_Series
Samsung_ML-2580_Series
Samsung_ML-2850_Series
Samsung_ML-2853_Series
Samsung_ML-2855_Series
Samsung_ML-2950_Series
Samsung_ML-3050_Series
Samsung_ML-3300_Series
Samsung_ML-331x_Series
Samsung_ML-3470_Series
Samsung_ML-3475_Series
Samsung_ML-3560_Series
Samsung_ML-371x_Series
Samsung_ML-375x_Series
Samsung_ML-4050_Series
Samsung_ML-4055_Series
Samsung_ML-451x_501x_Series
Samsung_ML-4550_Series
Samsung_ML-4555_Series
Samsung_ML-551x_651x_Series
Samsung_ML-8850_8950_Series
Samsung_ML-8x00_Series
Samsung_SCX-3200_Series
Samsung_SCX-3400_Series
Samsung_SCX-4100_Series
Samsung_SCX-4200_Series
Samsung_SCX-4300_Series
Samsung_SCX-4500_Series
Samsung_SCX-4500W_Series
Samsung_SCX-4600_Series
Samsung_SCX-4623FW_Series
Samsung_SCX-4623_Series
Samsung_SCX-4650_4x21S_Series
Samsung_SCX-470x_Series
Samsung_SCX-4725_Series
Samsung_SCX-472x_Series
Samsung_SCX-483x_5x3x_Series
Samsung_SCX-4x16_Series
Samsung_SCX-4x20_Series
Samsung_SCX-4x21_Series
Samsung_SCX-4x24_Series
Samsung_SCX-4x25_Series
Samsung_SCX-4x26_Series
Samsung_SCX-4x28_Series
Samsung_SCX-5635_Series
Samsung_SCX-5835_5935_Series
Samsung_SCX-5835_5935X_Series
Samsung_SCX-5x30_Series
Samsung_SCX-6545_Series
Samsung_SCX-6545X_Series
Samsung_SCX-681x_Series
Samsung_SCX-6x20_Series
Samsung_SCX-6x22_Series
Samsung_SCX-6x45_Series
Samsung_SCX-6x55_Series
Samsung_SCX-6x55X_Series
Samsung_SCX-8030_8040_Series
Samsung_SCX-8123_8128_Series
Samsung_SCX-8230_8240_Series
Samsung_SCX-881x_Series
Samsung_SCX-882x_Series
Samsung_SF-760_Series
Samsung_X3220_Series
Samsung_X401_Series
Samsung_X4300_Series
Samsung_X703_Series
Samsung_X7600_Series`

# Working on Synology DSM 7 and AMD64 (Tested on Synology DS423+)

Fork from [ziwork/synology-airprint](https://github.com/ziwork/synology-airprint)

This Ubuntu-based Docker image runs a CUPS instance that is meant as an AirPrint relay for printers that are already on the network but not AirPrint capable.
* `Included drivers HP, Samsung, Canon, Xerox, etc.`

Added support for old Samsung USB printers (e.g. Samsung Xpress SL-M2026 Laser Printer)
* `Added drivers Samsung Print Driver for Linux (uld_V1.00.39_01.17 from Samsung Support) and Samsung Unified Linux Driver (UnifiedLinuxDriver-1.00.06 from https://www.bchemnet.com/suldr/)`

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
