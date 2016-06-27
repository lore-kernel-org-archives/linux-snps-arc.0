From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 27 Jun 2016 18:48:39 -0000
Subject: kisskb: FAILED linus/axs101_defconfig/arcompact Tue Jun 28, 04:48
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160627184839.1.7840@2186539ca1fc>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs101_defconfig/arcompact Tue Jun 28, 04:48

http://kisskb.ellerman.id.au/kisskb/buildresult/12729246/

Commit:   Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6
          fbe601f7a34b395deb85a63ae5cddd0c084c8db1
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

make[1]: *** [outputmakefile] Error 1
scripts/basic/fixdep.c:479:1: fatal error: error writing to /tmp/cc69mqgP.s: No space left on device
make[2]: *** [scripts/basic/fixdep] Error 1
make[1]: *** [scripts_basic] Error 2
make: *** [sub-make] Error 2

No warnings found in log.
