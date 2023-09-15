mkdir ready
sudo mount -o loop ubuntu-23.04-desktop-amd64.iso /ready
unsquashfs -f -d output/ rootfs/casper/minimal.squashfs
sudo tar -C output -c . | sudo docker import - tmw:10
sudo docker run --rm -it -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static --privileged -v /etc/timezone:/etc/timezone:ro -p 23:23 -v /mnt/hgfs/E:/E -v /home/tmw/shared:/shared -e DISPLAY=:0 -v /etc/localtime:/etc/localtime:ro -u root --net host tmw:10 bash
