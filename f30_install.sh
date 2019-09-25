#!/bin/bash

#Run as su

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y fedora-workstation-repositories rubygems

dnf update -y

#Some standard things
dnf groupinstall -y "Development Tools" "Development Libraries" "C Development Tools and Libraries"
dnf install -y nano vim wget rpm-build dnf-plugins-core flatpak neofetch gcc gcc-c++ python37 make git git-all patch fuse-exfat

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
#Kvandum
dnf copr enable gagbo/Kvantum
dnf install kvantum

#Icon pack
dnf copr enable daniruiz/flat-remix
dnf install flat-remix

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
