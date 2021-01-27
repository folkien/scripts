#!/bin/bash
PH=$(echo 'tajnedane' | docker run --rm -i datalust/seq config hash)

# Create configuration directory
sudo mkdir -p /etc/seq/

# Run seq
sudo docker run \
  --name seq \
  -d \
  --restart unless-stopped \
  -e ACCEPT_EULA=Y \
  -e SEQ_FIRSTRUN_ADMINPASSWORDHASH="$PH" \
  -v /etc/seq:/data \
  -p 5341:5341 \
  datalust/seq
