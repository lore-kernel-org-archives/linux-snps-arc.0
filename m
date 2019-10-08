From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Tue, 08 Oct 2019 04:41:26 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Tue Oct 08, 15:40
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191008044126.1.22741@78c6c811cd18>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Tue Oct 08, 15:40

http://kisskb.ellerman.id.au/kisskb/buildresult/13985222/

Commit:   Add linux-next specific files for 20191008
          442630f691a1537b7e0cc35e3d580222077549cb
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

Possible errors
---------------

include/linux/bits.h:24:21: error: first argument to '__builtin_choose_expr' not a constant
include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
make[4]: *** [scripts/Makefile.build:266: drivers/base/regmap/regmap.o] Error 1
make[3]: *** [scripts/Makefile.build:509: drivers/base/regmap] Error 2
make[2]: *** [scripts/Makefile.build:509: drivers/base] Error 2
include/linux/bits.h:24:21: error: first argument to '__builtin_choose_expr' not a constant
include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
include/linux/bits.h:24:21: error: first argument to '__builtin_choose_expr' not a constant
include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
make[3]: *** [scripts/Makefile.build:266: drivers/clk/clk-multiplier.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/clk] Error 2
make[1]: *** [Makefile:1649: drivers] Error 2
include/linux/bits.h:24:21: error: first argument to '__builtin_choose_expr' not a constant
include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
make[3]: *** [scripts/Makefile.build:265: kernel/time/sched_clock.o] Error 1
make[2]: *** [scripts/Makefile.build:509: kernel/time] Error 2
make[1]: *** [Makefile:1649: kernel] Error 2
make: *** [Makefile:179: sub-make] Error 2

Possible warnings (2)
----------------------

<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
net/ipv4/tcp_input.c:4384:49: warning: array subscript is above array bounds [-Warray-bounds]
