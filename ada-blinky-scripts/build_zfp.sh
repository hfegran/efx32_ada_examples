#!/bin/zsh
export PATH=~/opt/GNAT/2020-arm-elf/bin:/opt/GNAT/2020-arm-elf/bin:/$HOME/opt/ALS/bin:$PATH
mkdir -p ../ada-blinky-binaries
gprbuild -j0 -p -P ../ada-blinky-zfp/ada_blinky_zfp.gpr && arm-eabi-objcopy -S -O ihex ../ada-blinky-zfp/obj/main ../ada-blinky-binaries/main_zfp.hex
cp ../ada-blinky-zfp/obj/main ../ada-blinky-binaries/main_zfp
