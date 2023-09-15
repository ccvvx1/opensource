#!/bin/bash

cd out/target/product/emulator64_x86_64
sudo mount system.img system -o ro
sudo mount vendor.img vendor -o ro
sudo tar --xattrs -c vendor -C system --exclude="vendor" . | sudo docker import -c 'ENTRYPOINT ["/init", "androidboot.hardware=redroid"]' - redroid
sudo umount system vendor

sudo tar --xattrs -c -C root . | sudo docker import -c 'ENTRYPOINT ["/init", "androidboot.hardware=redroid"]' - redroid-dev