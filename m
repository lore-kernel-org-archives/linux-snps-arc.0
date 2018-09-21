From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 21 Sep 2018 10:22:20 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Fri Sep 21, 20:21
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180921102220.1.52786@bf8565bee66d>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Fri Sep 21, 20:21

http://kisskb.ellerman.id.au/kisskb/buildresult/13519039/

Commit:   Merge tag 'drm-fixes-2018-09-21' of git://anongit.freedesktop.org/drm/drm
          a38fd7d808e6a9dcc8fac30fc870ccb88ce07221
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (3)
----------------------

include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4319:49: warning: array subscript is above array bounds [-Warray-bounds]
