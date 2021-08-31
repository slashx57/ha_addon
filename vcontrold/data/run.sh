#!/usr/bin/env bashio
set -e

bashio::log.info "Initialize..."
CONFIG_PATH=/data/options.json

VITO="$(bashio::config 'vito_xml')"
if [ ${#VITO} -ge 5 ]
then
	bashio::log.info Create vito.xml config file
	echo $VITO > /etc/vcontrold/vito.xml
fi

VCONTROLD="$(bashio::config 'vcontrold_xml')"
if [ ${#VCONTROLD} -ge 5 ]
then
	bashio::log.info Create vcontrold.xml config file
	echo $VCONTROLD > /etc/vcontrold/vcontrold.xml
fi

bashio::log.info "Launch service..."
DEVICE="$(bashio::config 'device')"
vcontrold -n -v -g -d $DEVICE 

