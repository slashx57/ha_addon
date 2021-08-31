#apk add --update --no-cache g++ cmake make git libusb-dev libxml2-dev linux-headers nano bash && \

apt-get update && \
	apt-get install -y g++ cmake make git libusb-dev libxml2-dev nano bash && \
	cd /usr/src/ && \
	git clone https://github.com/openv/vcontrold.git && \
	cd vcontrold && \
	mkdir build && \
	cd build && \
	cmake -DVSIM=OFF -DVCLIENT=OFF -DMANPAGES=OFF .. && \
	make && make install && \
	mkdir /etc/vcontrold && \
	cp ../xml/300/* /etc/vcontrold/ 
	apt-get purge del gcc g++ cmake make  
	rm -rf /var/cache/apk/* /lib/apk/db/* /usr/src/* 

