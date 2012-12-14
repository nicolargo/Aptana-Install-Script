#!/bin/bash

APTANA_VERSION="3.2.2"

APTANA_ARCH=`arch`
DOWNLOAD_PATH="http://download.aptana.com/studio3/standalone/$APTANA_VERSION/linux"
DOWNLOAD_FILE="Aptana_Studio_3_Setup_Linux_$APTANA_ARCH""_$APTANA_VERSION.zip"

if (($EUID != 0)); then
  if [[ -t 1 ]]; then
    sudo "$0" "$@"
  else
    exec 1>output_file
    gksu "$0 $@"
  fi
  exit
fi

sudo apt-get -y install openjdk-7-jdk libjpeg62 libwebkitgtk-1.0-0 git-core
wget -c $DOWNLOAD_PATH/$DOWNLOAD_FILE

if [ ! -f $DOWNLOAD_FILE ]
then
	echo 'Download failed.'
	exit
fi

sudo unzip '$DOWNLOAD_FILE' -d /opt
sudo cp AptanaStudio3.desktop /usr/share/applications/AptanaStudio3.desktop
rm -f $DOWNLOAD_FILE
