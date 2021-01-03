#!/bin/zsh
export PATH=~/opt/GNAT/2020-arm-elf/bin:/opt/GNAT/2020-arm-elf/bin:/$HOME/opt/ALS/bin:$PATH
mkdir -p ../ada-blinky-binaries
gprbuild -j0 -p -P ../ada-blinky-sfp/ada_blinky_sfp.gpr && arm-eabi-objcopy -S -O ihex ../ada-blinky-sfp/obj/main ../ada-blinky-binaries/main_sfp.hex
cp ../ada-blinky-sfp/obj/main ../ada-blinky-binaries/main_sfp
