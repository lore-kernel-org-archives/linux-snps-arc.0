From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 21 Sep 2018 07:38:12 -0000
Subject: kisskb: OK linux-next/axs101_defconfig/arcompact Fri Sep 21, 17:36
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180921073812.1.74262@bf8565bee66d>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs101_defconfig/arcompact Fri Sep 21, 17:36

http://kisskb.ellerman.id.au/kisskb/buildresult/13518767/

Commit:   Add linux-next specific files for 20180921
          46c163a036b41a29b0ec3c475bf97515d755ff41
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"

Possible warnings (12)
----------------------

<stdin>:1338:2: warning: #warning syscall open_tree not implemented [-Wcpp]
<stdin>:1341:2: warning: #warning syscall move_mount not implemented [-Wcpp]
<stdin>:1344:2: warning: #warning syscall fsopen not implemented [-Wcpp]
<stdin>:1347:2: warning: #warning syscall fsconfig not implemented [-Wcpp]
<stdin>:1350:2: warning: #warning syscall fsmount not implemented [-Wcpp]
<stdin>:1353:2: warning: #warning syscall fspick not implemented [-Wcpp]
<stdin>:1356:2: warning: #warning syscall fsinfo not implemented [-Wcpp]
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/ipv4/tcp_input.c:4331:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
