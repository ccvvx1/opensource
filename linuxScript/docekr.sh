sudo apt install docker.io
sudo docker pull arm64v8/ubuntu:23.04
sudo docker images
sudo docker run --rm -it -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static --privileged -v /etc/timezone:/etc/timezone:ro -p 23:23 -v /mnt/hgfs/E:/E -v /home/tmw/shared:/shared -e DISPLAY=:0 -v /etc/localtime:/etc/localtime:ro -u root --net host arm64v8/ubuntu:23.04  bash
