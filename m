From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Tue, 12 Mar 2019 23:57:47 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Wed Mar 13, 10:56
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190312235747.1.37022@07b04a9130af>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Wed Mar 13, 10:56

http://kisskb.ellerman.id.au/kisskb/buildresult/13727855/

Commit:   Merge branch 'akpm' (patches from Andrew)
          a667cb7a94d48a483fb5d6006fe04a440f1a42ce
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

Possible errors
---------------

arch/arc/boot/dts/axs10x_mb.dtsi:221.15-225.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs10x_mb.dtsi:227.15-231.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"

Possible warnings (7)
----------------------

arch/arc/boot/dts/axs10x_mb.dtsi:221.15-225.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs10x_mb.dtsi:227.15-231.6: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
