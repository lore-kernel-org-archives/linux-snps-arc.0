From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 19 Oct 2018 16:04:01 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sat Oct 20, 03:03
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181019160401.1.98173@5ca8034c38fe>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sat Oct 20, 03:03

http://kisskb.ellerman.id.au/kisskb/buildresult/13556495/

Commit:   Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc
          2a96661054452c3016c377d72a38c6d4948ea6ae
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (3)
----------------------

include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4319:49: warning: array subscript is above array bounds [-Warray-bounds]
