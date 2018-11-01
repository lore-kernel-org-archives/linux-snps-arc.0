From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 01 Nov 2018 20:26:06 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Fri Nov 02, 07:25
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181101202606.1.62261@5ca8034c38fe>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Fri Nov 02, 07:25

http://kisskb.ellerman.id.au/kisskb/buildresult/13573038/

Commit:   Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
          82aa4671516a3203261c835e98c3eecab10c994d
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"

Possible warnings (6)
----------------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4311:49: warning: array subscript is above array bounds [-Warray-bounds]
