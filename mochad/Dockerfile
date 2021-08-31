ARG BUILD_FROM
FROM $BUILD_FROM
#FROM alpine

# Add env
ENV LANG C.UTF-8

WORKDIR /usr/src
COPY mochad-0.1.16/*  /usr/src/mochad/

RUN apk add --update --no-cache gcc g++ cmake make wget libusb-dev bash && \
    cd /usr/src/mochad && \
	chmod a+x configure && \
	./configure && make && make install && \
    apk --purge del gcc g++ cmake make wget && \
    rm -rf /var/cache/apk/* /lib/apk/db/* /usr/src/* 
	
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]


