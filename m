From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 08 May 2019 07:47:27 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Wed May 08, 17:46
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190508074727.1.53872@07b04a9130af>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Wed May 08, 17:46

http://kisskb.ellerman.id.au/kisskb/buildresult/13794331/

Commit:   Merge branch 'parisc-5.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
          d3511f53bb2475f2a4e8460bee5a1ae6dea2a433
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (5)
----------------------

arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
