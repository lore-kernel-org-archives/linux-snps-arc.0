From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 29 Nov 2018 09:05:00 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Thu Nov 29, 20:04
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181129090500.1.99172@8ba6f76b8fbc>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Thu Nov 29, 20:04

http://kisskb.ellerman.id.au/kisskb/buildresult/13601325/

Commit:   Add linux-next specific files for 20181129
          25e778835fceb547555519fc325d0e011de61202
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arc-buildroot-linux-uclibc-gcc: error: unrecognized argument in option '-mcpu=hs38'
arc-buildroot-linux-uclibc-gcc: error: unrecognized argument in option '-mcpu=hs38'
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
arc-buildroot-linux-uclibc-gcc: error: unrecognized argument in option '-mcpu=hs38'
make[2]: *** [scripts/Makefile.build:376: arch/arc/boot/dts/axs101.dtb.o] Error 1
make[1]: *** [Makefile:1255: dtbs] Error 2
make: *** [Makefile:152: sub-make] Error 2

Possible warnings (2)
----------------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
