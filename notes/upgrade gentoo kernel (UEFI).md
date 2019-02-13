---
title: upgrade gentoo kernel (UEFI)
created: '2019-02-13T20:19:51.848Z'
modified: '2019-02-13T21:15:40.915Z'
tags: [kernel, Notebooks/Snippets]
---

```sh
# check if new kernel versions are available
eix -i sys-kernel/

# download the latest kernel sources
emerge -av '=sys-kernel/gentoo-sources-xxx'

# symlink the latest kernel to /usr/src/linux
eselect kernel list
eselect kernel set x

# compile new kernel
cd /usr/src/linux
cp /usr/src/linux-old-xxx/.config .
make -j4

# install new kernel to /boot
mount /boot
make install
make modules_install

# upgrade grub config
grub2-mkconfig -o /boot/grub/grub.cfgv

```

Notes:

* UEFI will use `\EFI\gentoo\grubx64.efi` and it doesn't need to be updated to upgrade the kernel
* After booting via UEFI, GRUB will be loaded according to /boot/grub/grub.cfg
* `grub2-mkconfig` recognize the new kernel automatically
* generally there is no need to edit `/etc/default/grub`
