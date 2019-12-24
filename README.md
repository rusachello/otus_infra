### gcloud run startup_script from backet
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script-url=gs://rusachello-otus/reddis_app_install.sh
```
### gcloud run startup_script from local
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=/home/user/startup_script.sh
```
### gcloud run startup_script full version
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script='#! /bin/bash
	sudo apt update
	sudo apt install -y ruby-full ruby-bundler build-essential
	wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
	sudo bash -c "echo ""deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse"" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list"
	sudo apt update
	sudo apt install -y mongodb-org
	sudo systemctl start mongod
	sudo systemctl enable mongod
	cd  ~/ && git clone -b monolith https://github.com/express42/reddit.git
	cd reddit && bundle install
	puma -d
	'
```
### gcloud  create firewall_rule
```
gcloud compute \
	--project=otus-262520 firewall-rules create default-puma-server \
	--direction=INGRESS \
	--priority=1000 \
	--network=default \
	--action=ALLOW \
	--rules=tcp:9292 \
	--source-ranges=0.0.0.0/0 \
	--target-tags=puma-server
```

```
testapp_IP = 34.69.161.154
testapp_port = 9292
```
