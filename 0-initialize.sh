#!/usr/bin/env bash

set -euo pipefail


read -sp "Password for the CA: \n" PASSWORD

mkdir -p step/secrets
echo "$PASSWORD" > step/secrets/password

# Install step-ca
podman pull docker.io/smallstep/step-ca

podman run -it -v ./step:/home/step --userns=keep-id smallstep/step-ca step ca init \
  --deployment-type "standalone" \
  --name "ubuntu-pki" \
  --dns "localhost,127.0.0.1" \
  --address ":9000" \
  --provisioner "ubuntu-provisioner" \
  --password-file /home/step/secrets/password
