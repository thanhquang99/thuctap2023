#!/bin/bash
sudo systemctl stop sshd
sudo apt-get remove openssh-server openssh-client -y
sudo apt-get update -y
sudo apt-get install zlib1g-dev libpam0g-dev libselinux1-dev build-essential libssl-dev -y
wget -c https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz
tar -xzf openssh-9.8p1.tar.gz
cd openssh-9.8p1
./configure --with-pam --with-selinux --with-privsep-path=/var/lib/sshd/ --sysconfdir=/etc/ssh
make
sudo make install
rm -rf /etc/systemd/system/sshd.service
touch /etc/systemd/system/sshd.service
sudo tee /etc/systemd/system/sshd.service > /dev/null <<EOF
[Unit]
Description=OpenSSH server daemon
After=network.target

[Service]
ExecStart=/usr/local/sbin/sshd -D
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl unmask ssh
sudo systemctl daemon-reload
sudo systemctl start sshd
sudo systemctl enable sshd
rm -rf openssh-9.8p1
rm -rf openssh-9.8p1.tar.gz
init 6