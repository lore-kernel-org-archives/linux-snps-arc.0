From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sat, 20 Oct 2018 16:33:03 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sun Oct 21, 03:32
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181020163303.1.69929@5ca8034c38fe>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sun Oct 21, 03:32

http://kisskb.ellerman.id.au/kisskb/buildresult/13557720/

Commit:   Merge tag 'drm-fixes-2018-10-20-1' of git://anongit.freedesktop.org/drm/drm
          270b77a0f30e7bc61a9081b86d74dbb62fa6a69d
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (3)
----------------------

include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4319:49: warning: array subscript is above array bounds [-Warray-bounds]
