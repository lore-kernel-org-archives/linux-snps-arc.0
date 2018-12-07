From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 07 Dec 2018 21:07:18 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sat Dec 08, 08:06
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181207210718.1.73895@8ba6f76b8fbc>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sat Dec 08, 08:06

http://kisskb.ellerman.id.au/kisskb/buildresult/13612017/

Commit:   Merge branch 'i2c/for-current-fixed' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
          52f842ccd615564a75ef45f8a0985ff14a0a61ce
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"

Possible warnings (8)
----------------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array bounds [-Warray-bounds]
