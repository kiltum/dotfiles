# its for gaming computer
dnf install fedora-workstation-repositories
dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
dnf config-manager --set-enabled rpmfusion-nonfree-steam
dnf install xorg-x11-drv-nvidia akmod-nvidia
