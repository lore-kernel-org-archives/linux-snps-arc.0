From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Tue, 13 Mar 2018 08:52:03 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Tue Mar 13, 19:51
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180313085203.1.20243@c44a1dee05ac>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Tue Mar 13, 19:51

http://kisskb.ellerman.id.au/kisskb/buildresult/13301287/

Commit:   Add linux-next specific files for 20180313
          872c90b2c71859eb7283d670b9e70226fb40c9ea
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

/kisskb/src/include/linux/kernel.h:855:2: error: first argument to '__builtin_choose_expr' not a constant
/kisskb/src/include/linux/kernel.h:855:2: error: first argument to '__builtin_choose_expr' not a constant
/kisskb/src/include/linux/kernel.h:855:2: error: first argument to '__builtin_choose_expr' not a constant
make[2]: *** [arch/arc/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
make: *** [sub-make] Error 2

No warnings found in log.
