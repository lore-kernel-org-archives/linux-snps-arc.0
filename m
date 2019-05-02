From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 02 May 2019 20:57:49 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Fri May 03, 06:56
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190502205749.1.40601@07b04a9130af>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Fri May 03, 06:56

http://kisskb.ellerman.id.au/kisskb/buildresult/13786932/

Commit:   Merge tag 'pci-v5.1-fixes-3' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci
          b7a5b22b05472704ca3e891a3a3c7769c057413a
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (5)
----------------------

arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
