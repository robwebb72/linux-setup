
# install flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo ">>>>> Installing JetBrainsMono Font"
sudo cp files/fonts/jetbrains-mono-2.304/*.ttf /usr/share/fonts/
fc-cache -f -v

#echo ">>>>> Installing Microsoft Edge"
#curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
#sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
#sudo rm microsoft.gpg
#sudo apt update -y && sudo apt install microsoft-edge-stable -y

echo ">>>>> Installing Vivaldi"
curl -fSsL https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vivaldi.gpg > /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vivaldi.gpg] https://repo.vivaldi.com/archive/deb/ stable main | sudo tee /etc/apt/sources.list.d/vivaldi.list
sudo apt update -y && sudo apt install vivaldi-stable -y

echo ">>>>> Installing Obsidian"
flatpak install flathub md.obsidian.Obsidian -y

echo ">>>>> Installing GitKraken"
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo apt install ./gitkraken-amd64.deb
rm gitkraken-amd64.deb

echo ">>>>> Installing Neovim"
sudo apt install neovim -y

echo ">>>>> Installing Mono"
sudo apt install ca-certificates gnupg
sudo gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel -y

echo ">>>>> Installing Wine"
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -sc)/winehq-$(lsb_release -sc).sources
sudo apt update
sudo apt install --install-recommends -y winehq-stable

echo ">>>>> Installing VS Code"
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code -y

echo ">>>>> Installing Steam"
sudo add-apt-repository multiverse -y
sudo apt update
sudo apt install steam -y

echo ">>>>> Installing Spotify"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

echo ">>>>> Installing GIMP"
sudo apt install gimp -y

echo ">>>>> Installing Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update -y
sudo apt install sublime-text -y

echo ">>>>> Installing Calibre"
sudo apt install calibre -y

echo ">>>>> Installing VeraCrypt"
sudo add-apt-repository ppa:unit193/encryption -y
sudo apt update
sudo apt install veracrypt -y

echo ">>>>> Installing Caffeine"
sudo apt install caffeine -y

echo ">>>>> Installing Audacious (music-player)"
sudo apt-get install audacious -y

echo ">>>>> Installing qBitTorrent"
sudo apt install dirmngr ca-certificates software-properties-common apt-transport-https -y
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt update
sudo apt install qbittorrent -y

echo ">>>>> Installing Fuse Spectrum Emulator"
flatpak install flathub net.sf.fuse_emulator -y

echo ">>>>> Installing draw.io"
curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest | grep browser_download_url | grep 'amd64.*deb' | cut -d '"' -f 4 | wget -i -
sudo apt -f install ./drawio-amd64-*.deb -y
rm drawio-amd64-*.deb*

echo ">>>>> Installing fs-uae"
echo 'deb http://download.opensuse.org/repositories/home:/FrodeSolheim:/stable/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:FrodeSolheim:stable.list
curl -fsSL https://download.opensuse.org/repositories/home:FrodeSolheim:stable/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_FrodeSolheim_stable.gpg > /dev/null
sudo apt update
sudo apt install fs-uae fs-uae-launcher -y

echo ">>>>> Installing Anki"
flatpak install flathub net.ankiweb.Anki -y

echo ">>>>> Installing Clementine"
flatpak install flathub org.clementine_player.Clementine -y

echo ">>>>> Installing Tiled"
flatpak install flathub org.mapeditor.Tiled -y

echo ">>>>> Installing Bitwarden"
flatpak install flathub com.bitwarden.desktop -y

echo ">>>>> Installing Todoist"
flatpak install flathub com.todoist.Todoist -y

echo ">>>>> Installing WhatsApp for Linux"
flatpak install flathub com.github.eneshecan.WhatsAppForLinux -y

echo ">>>>> Installing WhatSie (WhatsApp client)"
flatpak install flathub com.ktechpit.whatsie -y
echo ">>>>> Installing DropBox"
flatpak install flathub com.dropbox.Client -y

echo ">>>>> Installing Amiberry"
flatpak install flathub com.blitterstudio.amiberry -y

echo ">>>>> Installing Stacer"
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer -y

echo ">>>>> Installing PowerTop"
sudo apt-get install powertop -y

#echo ">>>>> Installing NordVPN"
#wget https://downloads.nordcdn.com/apps/linux/install.sh -O nord-install.sh
#sudo sh nord-install.sh
#sudo usermod -aG nordvpn $USER
#sudo apt install nordvpn=3.17.4 -y --allow-downgrades # issue with whitelisting with newer versions at present
#rm nord-install.sh
