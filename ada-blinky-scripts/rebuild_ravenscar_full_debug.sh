#!/bin/zsh
(cd ../../bb-runtimes && ./build_rts.py --output /opt/GNAT/2020-arm-elf/arm-eabi/lib/gnat --build efm32gg12b --force)
gprbuild -j0 -P /opt/GNAT/2020-arm-elf/arm-eabi/lib/gnat/ravenscar-full-efm32gg12b/ravenscar_build.gpr -XBUILD=Debug
gprbuild -j0 -f -vh -p -P ../ada-blinky-full/ada_blinky_full.gpr && arm-eabi-objcopy -S -O ihex ../ada-blinky-full/obj/main ../ada-blinky-binaries/main_full.hex
cp -f ../ada-blinky-full/obj/main ../ada-blinky-binaries/main_full
./flash_full.sh
