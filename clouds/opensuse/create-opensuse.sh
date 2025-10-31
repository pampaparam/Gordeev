#!/bin/sh
vm_name="${1:-my-vm}
export USER_NAME="leha"
export SSH_KEY="$(cat ~/.ssh/id_ed25519.pub)"


yc compute instance create \
    --name my-vm \
    --hostname my-vm \
    --memory 4 \
    --cores 2 \
    --create-boot-disk size=20,image-folder-id=standard-images,image-family=opensuse-15-3 \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --zone ru-central1-a \
    --metadata-from-file user-data="metadata.yaml"