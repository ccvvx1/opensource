sudo docker ps
sudo docker commit -m "1" 6e5bc26000eb tmw:arm9
sudo docker run --rm -it -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static --privileged -v /etc/timezone:/etc/timezone:ro -p 23:23 -v /mnt/hgfs/E:/E -v /home/tmw/shared:/shared  -v /home/tmw/module:/module -e DISPLAY=:0 -v /etc/localtime:/etc/localtime:ro -u root --net host tmw:arm9  bash
# sudo docker run --rm -it -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static --privileged -v /etc/timezone:/etc/timezone:ro -p 23:23 -v /mnt/hgfs/E:/E -v /home/tmw/shared:/shared -e DISPLAY=:0 -v /etc/localtime:/etc/localtime:ro -u root --net host tmw:10  bash
# sudo docker exec -it dc56 bash

# sudo docker run -itd --rm --privileged     --pull always     -v ~/data:/data     -p 5555:5555     redroid/redroid:13.0.0_64only-latest bash
