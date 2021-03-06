#!/bin/bash

# Program Melon Winbox #
clear
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

    #sudo touch /etc/apt/sources.list.d/winehq.list
    #sudo cat winehq.list > /etc/apt/sources.list.d/winehq.list
    sudo cp -rf winehq.list /etc/apt/sources.list.d/

    sudo apt update
    sudo apt-get install wine -y
    sudo apt-get install wine-stable -y

  else
  	echo "Anda sudah mempunyai wine"
  fi

  clear
  wget https://download.mikrotik.com/routeros/winbox/3.18/winbox.exe

  sudo mkdir /opt/Winbox
  sudo cp winbox.exe /opt/Winbox
  sudo rm winbox.exe

echo "Apakah anda masukan wine di alias anda? (Y atau T)"
read aliaswine

  if [ y = $aliaswine ]
  then
    aliasaktif="wine bisa dijalankan dengan memasukan perintah 'wine' "
    alwinbox=" alias winbox='sudo wine /opt/Winbox/winbox.exe' "
    echo $alwinbox >> $HOME/.bashrc
  else
    echo "alias wine tidak terpasang"
  fi

echo "winbox anda sudah terinstall"
echo $aliasaktif
source $HOME/.bashrc
