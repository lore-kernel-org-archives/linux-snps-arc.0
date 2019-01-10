From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 10 Jan 2019 19:38:01 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Fri Jan 11, 06:37
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190110193801.1.93017@c1e251a279fe>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Fri Jan 11, 06:37

http://kisskb.ellerman.id.au/kisskb/buildresult/13647875/

Commit:   csky: fixup compile error with CPU 810.
          70c25259537c073584eb906865307687275b527f
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

Possible errors
---------------

arch/arc/boot/dts/axs10x_mb.dtsi:221.15-225.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs10x_mb.dtsi:227.15-231.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"

Possible warnings (8)
----------------------

arch/arc/boot/dts/axs10x_mb.dtsi:221.15-225.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs10x_mb.dtsi:227.15-231.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
include/linux/kernel.h:846:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4324:49: warning: array subscript is above array bounds [-Warray-bounds]
