FROM ubuntu:jammy
LABEL maintainer="znetwork@me.com"
LABEL version="0.3"
LABEL description="AIRPRINT FROM SYNOLOGY DSM 7 (HP, SAMSUNG, ETC)"

RUN apt-get update && apt-get install -y \
	locales \
	brother-lpr-drivers-extra brother-cups-wrapper-extra \
	printer-driver-splix \
	printer-driver-gutenprint \
	gutenprint-doc \
	gutenprint-locales \
	libgutenprint9 \
	libgutenprint-doc \
	ghostscript \
	hplip \
	cups \
	cups-pdf \
	cups-client \
	cups-filters \
	inotify-tools \
	avahi-daemon \
	avahi-discover \
	python3 \
	python3-dev \
	python3-pip \
	python3-cups \
	wget \
	rsync \
	&& rm -rf /var/lib/apt/lists/*
RUN cd /tmp/ && wget http://downloadcenter.samsung.com/content/DR/201704/20170407143829533/uld_V1.00.39_01.17.tar.gz
RUN cd /tmp/ && tar -xvzf uld_V1.00.39_01.17.tar.gz
RUN cp /tmp/uld/x86_64/libscmssc.so /usr/lib
RUN cp /tmp/uld/x86_64/smfpnetdiscovery /usr/lib/cups/backend
RUN cp /tmp/uld/x86_64/pstosecps /usr/lib/cups/filter
RUN cp /tmp/uld/x86_64/rastertospl /usr/lib/cups/filter
RUN ln -s rastertospl /usr/lib/cups/filter/rastertosplc
RUN mkdir -p /usr/share/cups/model/suld
RUN for ppd in /tmp/uld/noarch/share/ppd/*.ppd; do gzip < "$ppd" > /usr/share/cups/model/suld/"${ppd##*/}".gz; done
RUN mkdir -p /usr/share/cups/model/suld/cms
RUN for cts in /tmp/uld/noarch/share/ppd/cms/*.cts; do cp "$cts" /usr/share/cups/model/suld/cms; done
RUN cd /tmp/ && wget https://www.bchemnet.com/suldr/driver/UnifiedLinuxDriver-1.00.06.tar.gz
RUN mv /tmp/uld /tmp/uld2
RUN cd /tmp/ && tar -xvzf UnifiedLinuxDriver-1.00.06.tar.gz
RUN cp /tmp/uld/x86_64/pstospl /usr/lib/cups/filter
RUN cp /tmp/uld/x86_64/pstosplc /usr/lib/cups/filter

# This will use port 631
EXPOSE 631

# We want a mount for these
VOLUME /config
VOLUME /services

# Add scripts
ADD root /
RUN chmod +x /root/*

#Run Script
CMD ["/root/run_cups.sh"]

# Baked-in config file changes
RUN sed -i 's/Listen localhost:631/Listen *:631/' /etc/cups/cupsd.conf && \
	sed -i 's/Browsing No/Browsing On/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/>/<Location \/>\n  Allow All/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin>/<Location \/admin>\n  Allow All\n  Require user @SYSTEM/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin\/conf>/<Location \/admin\/conf>\n  Allow All/' /etc/cups/cupsd.conf && \
	sed -i 's/.*enable\-dbus=.*/enable\-dbus\=no/' /etc/avahi/avahi-daemon.conf && \
	echo "ServerAlias *" >> /etc/cups/cupsd.conf && \
	echo "DefaultEncryption Never" >> /etc/cups/cupsd.conf && \
	echo "BrowseWebIF Yes" >> /etc/cups/cupsd.conf
