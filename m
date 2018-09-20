From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 20 Sep 2018 10:17:23 -0000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Sep 20, 20:17
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180920101723.1.42879@bf8565bee66d>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Sep 20, 20:17

http://kisskb.ellerman.id.au/kisskb/buildresult/13516365/

Commit:   Add linux-next specific files for 20180920
          a0cb0cabe4bbeacf5ed9e81a41abcbae47ba925a
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

scripts/dtc/yamltree.c:23:10: fatal error: yaml.h: No such file or directory
make[3]: *** [scripts/Makefile.host:107: scripts/dtc/yamltree.o] Error 1
make[2]: *** [scripts/Makefile.build:536: scripts/dtc] Error 2
make[1]: *** [Makefile:1067: scripts] Error 2
make: *** [Makefile:146: sub-make] Error 2

No warnings found in log.
