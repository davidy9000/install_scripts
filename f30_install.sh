#!/bin/bash

#Run with sudo

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y fedora-workstation-repositories rubygems

dnf update -y

# Some standard things
dnf groupinstall -y "Development Tools" "Development Libraries" "C Development Tools and Libraries"
dnf install -y nano vim wget rpm-build dnf-plugins-core flatpak neofetch gcc gcc-c++ python37 make git git-all patch fuse-exfat

########################################################
# Comment out whatever you don't want installed

#VS Code Repo
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

#Negativo17 Spotify 
dnf config-manager --add-repo=https://negativo17.org/repos/fedora-spotify.repo

dnf update -y
#Packages that I use
# -code: VS Code; kdenlive: Video Editor; redshift: Yellow Light Mode; ark: archive manager
dnf install -y code spotify-client kdenlive vlc audacity obs-studio qbittorrent youtube-dl thunderbird redshift gimp ark steam
dnf install -y ncurses-devel glibc-headers glibc-devel kernel-headers kernel-devel libgomp binutils dkms

#Texlive
dnf install -y texlive-scheme-full

##### CUSTOMIZATION PACKAGES #####
#Kvantum (Theming package on KDE)
dnf copr enable gagbo/Kvantum
dnf install kvantum

#Icon pack
# See https://drasite.com/flat-remix
dnf copr enable daniruiz/flat-remix
dnf install flat-remix flat-remix-gtk

#Fonts
dnf install -y mozilla-fira-mono-fonts.noarch mozilla-fira-sans-fonts.noarch

#MS Core Fonts
dnf install -y curl cabextract xorg-x11-font-utils fontconfig
rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

#My used python libraries
#pip3 install numpy scipy folium pandas matplotlib django pymongo twisted scrapy tensorflow sympy flask opencv-contrib-python --user

#Random Things
dnf install cmatrix

#rubygem package
gem install lolcat

#flatpak
flatpak install flathub com.slack.Slack -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.sublimetext.three -y

#############################################################
# Install MongoDB && Running it
# I used nano, but use your favorite editor
# sudo nano /etc/yum.repos.d/mongodb.repo

# Paste lines 69-75 into document
# [Mongodb]
# name=MongoDB Repository
# baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/4.0/x86_64/
# gpgcheck=1
# enabled=1
# gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc

# sudo dnf install mongodb-org

# sudo systemctl enable mongod.service
# sudo systemctl start mongod.service
##############################################################
