#!/bin/bash
sudo mount -o loop -t erofs ./system.img ../mountpoints/system
sudo mount -o loop -t erofs ./vendor.img ../mountpoints/system/vendor
sudo mount -o loop -t erofs ./odm.img ../mountpoints/system/odm
sudo mount -o loop -t erofs ./product.img ../mountpoints/system/product
sudo mount -o loop -t erofs ./system_ext.img ../mountpoints/system/system_ext
sudo mount -o loop -t erofs ./my_product.img ../mountpoints/system/my_product
sudo mount -o loop -t erofs ./my_bigball.img ../mountpounts/system/my_bigball	

