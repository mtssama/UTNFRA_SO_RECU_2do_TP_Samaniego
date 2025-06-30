dd if=/dev/zero of=/home/msamaniego/TP2_mateo_disk1.img bs=1M count=2048
dd if=/dev/zero of=/home/msamaniego/TP2_mateo_disk2.img bs=1M count=1024

losetup /dev/loop3 /home/msamaniego/TP2_mateo_disk1.img
losetup /dev/loop4 /home/msamaniego/TP2_mateo_disk2.img

wipefs -a /dev/loop3p1
wipefs -a /dev/loop4p1

pvcreate /dev/loop3p1
pvcreate /dev/loop4p1

vgcreate vg_TP2_mateo /dev/loop3p1 /dev/loop4p1

lvcreate -L 10M -n lv_docker vg_TP2_mateo
lvcreate -L 1.5G -n lv_multimedia vg_TP2_mateo
lvcreate -L 512M -n lv_swap vg_TP2_mateo

mkfs.ext4 /dev/vg_TP2_mateo/lv_docker
mkfs.ext4 /dev/vg_TP2_mateo/lv_multimedia
mkswap /dev/vg_TP2_mateo/lv_swap

swapon /dev/vg_TP2_mateo/lv_swap
