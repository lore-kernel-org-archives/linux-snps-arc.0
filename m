From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 20 Sep 2018 10:17:28 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Thu Sep 20, 20:17
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180920101728.1.29303@bf8565bee66d>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Thu Sep 20, 20:17

http://kisskb.ellerman.id.au/kisskb/buildresult/13516366/

Commit:   Add linux-next specific files for 20180920
          a0cb0cabe4bbeacf5ed9e81a41abcbae47ba925a
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

scripts/dtc/yamltree.c:23:10: fatal error: yaml.h: No such file or directory
make[3]: *** [scripts/Makefile.host:107: scripts/dtc/yamltree.o] Error 1
make[2]: *** [scripts/Makefile.build:536: scripts/dtc] Error 2
make[1]: *** [Makefile:1067: scripts] Error 2
make: *** [Makefile:146: sub-make] Error 2

No warnings found in log.
