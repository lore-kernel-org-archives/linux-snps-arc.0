From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 03 Dec 2018 08:42:01 -0000
Subject: kisskb: OK linux-next/axs101_defconfig/arcompact Mon Dec 03, 19:41
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181203084201.1.18213@8ba6f76b8fbc>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs101_defconfig/arcompact Mon Dec 03, 19:41

http://kisskb.ellerman.id.au/kisskb/buildresult/13606058/

Commit:   Add linux-next specific files for 20181203
          210b1fd6d537597818f00d72d63652f137d1f41e
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"

Possible warnings (16)
----------------------

arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x54: I2C bus unit address format error, expected "54"
arch/arc/boot/dts/axs101.dtb: Warning (i2c_bus_reg): /axs10x_mb/i2c at 0x1f000/eeprom at 0x57: I2C bus unit address format error, expected "57"
<stdin>:1338:2: warning: #warning syscall open_tree not implemented [-Wcpp]
<stdin>:1341:2: warning: #warning syscall move_mount not implemented [-Wcpp]
<stdin>:1344:2: warning: #warning syscall fsopen not implemented [-Wcpp]
<stdin>:1347:2: warning: #warning syscall fsconfig not implemented [-Wcpp]
<stdin>:1350:2: warning: #warning syscall fsmount not implemented [-Wcpp]
<stdin>:1353:2: warning: #warning syscall fspick not implemented [-Wcpp]
<stdin>:1356:2: warning: #warning syscall fsinfo not implemented [-Wcpp]
arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
include/linux/kernel.h:846:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
kernel/sched/fair.c:119:21: warning: 'capacity_margin' defined but not used [-Wunused-variable]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4324:49: warning: array subscript is above array bounds [-Warray-bounds]
