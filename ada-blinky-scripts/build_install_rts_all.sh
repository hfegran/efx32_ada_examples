#!/bin/zsh
(cd ../../bb-runtimes && ./build_rts.py --output ~/opt/GNAT/2020-arm-elf/arm-eabi/lib/gnat --build efm32gg12b --force)
