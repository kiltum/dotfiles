# here is my start up script
sudo hostnamectl set-hostname piter
sudo echo "127.0.0.1 piter" >> /etc/hosts
sudo dnf -y update
sudo dnf -y install mc bind bind-utils thunderbird
# enable my own dns
sudo systemctl start named
sudo systemctl enable named
# do not override /etc/resolv.conf by NM
sudo echo "[main]" >> /etc/NetworkManager/NetworkManager.conf
sudo echo "dns=none" >> /etc/NetworkManager/NetworkManager.conf
# override resolv.conf by our values
sudo echo "search localdomain" > /etc/resolv.conf
sudo echo "nameserver 127.0.0.1" >> /etc/resolv.conf
# lets fill system by useful soft
sudo dnf -y install snapd
sudo snap install bitwarden 
# Sublime Text
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf -y install sublime-text
sudo systemctl enable sshd
sudo systemctl start sshd
