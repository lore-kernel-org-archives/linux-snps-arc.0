From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 04 May 2017 08:53:36 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Thu May 04, 18:53
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170504085336.1.21586@5b4f83badeef>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Thu May 04, 18:53

http://kisskb.ellerman.id.au/kisskb/buildresult/13022475/

Commit:   Add linux-next specific files for 20170504
          ef57eb19c96fa099a578aeaed9b9d0dbcc4fe069
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/include/asm/mmu.h:75:21: error: 'NR_CPUS' undeclared here (not in a function)
make[3]: *** [arch/arc/mm/ioremap.o] Error 1
make[2]: *** [arch/arc/mm] Error 2
make[1]: *** [arch/arc] Error 2
arch/arc/include/asm/mmu.h:75:21: error: 'NR_CPUS' undeclared here (not in a function)
make[3]: *** [kernel/irq/generic-chip.o] Error 1
make[2]: *** [kernel/irq] Error 2
make[1]: *** [kernel] Error 2
arch/arc/include/asm/mmu.h:75:21: error: 'NR_CPUS' undeclared here (not in a function)
make[2]: *** [mm/vmalloc.o] Error 1
make[1]: *** [mm] Error 2
make: *** [sub-make] Error 2

Possible warnings (2)
----------------------

kernel/sched/core.c:3326:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
