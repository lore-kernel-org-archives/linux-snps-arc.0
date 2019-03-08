From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 08 Mar 2019 06:43:54 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Fri Mar 08, 17:42
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190308064354.1.23654@07b04a9130af>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Fri Mar 08, 17:42

http://kisskb.ellerman.id.au/kisskb/buildresult/13722366/

Commit:   Merge tag 'xtensa-20190307' of git://github.com/jcmvbkbc/linux-xtensa
          dd1c3ed76f26504621b5ce08b894666aafa38e47
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
net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
