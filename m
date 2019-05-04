From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sat, 04 May 2019 02:13:52 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sat May 04, 12:12
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190504021352.1.32566@07b04a9130af>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sat May 04, 12:12

http://kisskb.ellerman.id.au/kisskb/buildresult/13789166/

Commit:   Merge branch 'i2c/for-current-fixed' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wsa/linux
          82463436a7fa40345c6febf0baa4c954af506ca6
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (5)
----------------------

arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array bounds [-Warray-bounds]
