#!/bin/bash

# Program Melon Winbox #

echo "Selamat Datang di Program melon winbox"
echo "Program ini akan membantu anda install winbox dengan mudah"
echo ""
echo ""
echo -n "Apakah anda belum mempunyai program wine? (Y atau T)";
read wine

  if [ y = $wine ]
  then
    #perintah penambahan paket 32 bit
  	sudo dpkg --add-architecture i386

    #nemambah public key winehq
    wget -nc https://dl.winehq.org/wine-builds/Release.key
    sudo apt-key add Release.key

    touch /etc/apt/sources.list.d/winehq.list
    repowine="deb http://dl.winehq.org/wine-builds/debian/ stretch main"
    echo $repowine > /etc/apt/sources.list.d/winehq.list

    sudo apt update
    sudo apt-get install --install-recommends winehq-stable

  else
  	echo "Anda sudah mempunyai wine"
  fi

  clear
  wget https://download.mikrotik.com/routeros/winbox/3.18/winbox.exe

  mkdir /opt/Winbox
  cp winbox.exe /opt/Winbox
  rm winbox.exe


echo "Apakah anda masukan wine di alias anda? (Y atau T)"
read aliaswine

  if [ y = $aliaswine ]
  then
    aliasaktif="wine bisa dijalankan dengan memasukan perintah 'wine' "
    alwinbox=" alias winbox='/opt/Winbox/winbox.exe' "
    echo $alwinbox >> $HOME/.bashrc
  else
    echo "alias wine tidak terpasang"
  fi

echo "winbox anda sudah terinstall"
echo $aliasaktif
