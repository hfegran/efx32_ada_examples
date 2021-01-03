#!/bin/zsh
export PATH=~/opt/GNAT/2020-arm-elf/bin:/opt/GNAT/2020-arm-elf/bin:/$HOME/opt/ALS/bin:$PATH
mkdir -p ../ada-blinky-binaries
gprbuild -j0 -p -P ../ada-blinky-full/ada_blinky_full.gpr && arm-eabi-objcopy -S -O ihex ../ada-blinky-full/obj/main ../ada-blinky-binaries/main_full.hex
cp ../ada-blinky-full/obj/main ../ada-blinky-binaries/main_full
