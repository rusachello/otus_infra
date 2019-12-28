#!/bin/bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
cd  ~/ && git clone -b monolith https://github.com/express42/reddit.git
cd ~/reddit && bundle install
sudo tee -a /etc/systemd/system/puma.service << EOM
[Unit]
Description=Puma Service Reddit App

[Service]
WorkingDirectory=/home/ry/reddit
ExecStart=/usr/local/bin/puma

[Install]
WantedBy=multi-user.target
EOM
sudo chmod 664 /etc/systemd/system/puma.service
sudo systemctl daemon-reload
sudo systemctl start puma.service
sudo systemctl enable puma.service
sudo systemctl restart puma.service
