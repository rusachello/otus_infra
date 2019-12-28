gcloud compute instances create reddit-app\
  --boot-disk-size=11GB \
  --image-family reddit-full \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script-url=gs://rusachello-otus/reddis_app_install_v1.1.sh
