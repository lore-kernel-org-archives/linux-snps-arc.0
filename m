From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 15 Feb 2019 21:54:47 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sat Feb 16, 08:53
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190215215447.1.8076@83c514a2b625>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sat Feb 16, 08:53

http://kisskb.ellerman.id.au/kisskb/buildresult/13693332/

Commit:   Merge tag 'for-5.0/dm-fixes-3' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
          ae3fa8bd73c9b64416816ec0e9951cd8695c9854
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
net/ipv4/tcp_input.c:4324:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
