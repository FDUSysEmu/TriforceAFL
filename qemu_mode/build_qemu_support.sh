#!/bin/sh
#
# build triforce patched qemu for AFL
#

cd qemu
export PATH=/home/xiongx/.local/bin:/home/iscsi/xiongx/tools/llvm-17.0/bin:$PATH
CFLAGS="-O3" ./configure --disable-werror \
  --disable-gtk --disable-sdl --disable-vnc --enable-llvm\
    --target-list="arm-softmmu"

# --enable-plugins --audio-drv-list= --disable-blobs --disable-bochs --disable-brlapi --disable-bsd-user --disable-bzip2 --disable-cap-ng --disable-cloop --disable-curl --disable-curses --disable-dmg --disable-fdt --disable-gcrypt --disable-glusterfs --disable-gnutls --disable-gtk --disable-guest-agent --disable-iconv --disable-libiscsi --disable-libnfs --disable-libssh --disable-libusb --disable-linux-aio --disable-live-block-migration --disable-lzo --disable-nettle --disable-numa --disable-opengl --disable-parallels --disable-qcow1 --disable-qed --disable-rbd --disable-rdma --disable-replication --disable-sdl --disable-seccomp --disable-smartcard --disable-snappy --disable-spice --disable-system --disable-tools --disable-tpm --disable-usb-redir --disable-vde --disable-vdi --disable-vhost-crypto --disable-vhost-kernel --disable-vhost-net --disable-vhost-scsi --disable-vhost-user --disable-vhost-vdpa --disable-vhost-vsock --disable-virglrenderer --disable-virtfs --disable-vnc --disable-vnc-jpeg --disable-vnc-png --disable-vnc-sasl --disable-vte --disable-vvfat --disable-xen --disable-xen-pci-passthrough --disable-xfsctl --target-list=x86_64-linux-user --without-default-devices --extra-cflags=-Wno-int-conversion --disable-werror --enable-llvm --static --disable-pie --disable-plugins --extra-cflags=-DAFL_QEMU_STATIC_BUILD=1 --disable-debug-info --disable-debug-mutex --disable-debug-tcg --disable-qom-cast-debug --disable-stack-protector --disable-docs
#  --enable-debug --disable-debug-tcg

  # --target-list="x86_64-softmmu arm-softmmu aarch64-softmmu"
  # --target-list="x86_64-softmmu arm-softmmu aarch64-softmmu"
make -j30
# cp -f "x86_64-linux-user/qemu-x86_64" "../../afl-qemu-trace"
# cp -f "x86_64-softmmu/qemu-system-x86_64" "../../afl-qemu-system-trace"
# cp -f "x86_64-softmmu/qemu-system-x86_64" "../../qemu-system-x86_64"
cp -f "build/arm-softmmu/qemu-system-arm" "../../afl-qemu-system-arm"
# cp -f "build/aarch64-softmmu/qemu-system-aarch64" "../../qemu-system-aarch64"
cp -f "build/llvm_hepler_arm-softmmu.bc" "../../"
