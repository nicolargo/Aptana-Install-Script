#!/bin/bash


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
wget http://download.aptana.com/studio3/standalone/3.2.2/linux/Aptana_Studio_3_Setup_Linux_x86_64_3.2.2.zip

FILE='Aptana_Studio_3_Setup_Linux_x86_64_3.2.2.zip'

if [ ! -f $FILE ]
then
	echo 'Download failed.'
	exit
fi

unzip 'Aptana_Studio_3_Setup_Linux_x86_64_3.2.2.zip' -d /opt
sudo cp AptanaStudio3.desktop /usr/share/applications/AptanaStudio3.desktop
