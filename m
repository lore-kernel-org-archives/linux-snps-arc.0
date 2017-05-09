From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Tue, 09 May 2017 05:52:41 -0000
Subject: kisskb: FAILED linus/axs101_defconfig/arcompact Tue May 09, 15:52
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170509055241.1.95575@5b4f83badeef>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs101_defconfig/arcompact Tue May 09, 15:52

http://kisskb.ellerman.id.au/kisskb/buildresult/13026073/

Commit:   Merge branch 'akpm' (patches from Andrew)
          bf5f89463f5b3109a72ed13ca62b57e90213387d
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/include/asm/mmu.h:75:21: error: 'NR_CPUS' undeclared here (not in a function)
make[3]: *** [arch/arc/mm/ioremap.o] Error 1
make[2]: *** [arch/arc/mm] Error 2
make[1]: *** [arch/arc] Error 2
arch/arc/include/asm/mmu.h:75:21: error: 'NR_CPUS' undeclared here (not in a function)
make[2]: *** [mm/vmalloc.o] Error 1
arch/arc/include/asm/mmu.h:75:21: error: 'NR_CPUS' undeclared here (not in a function)
make[3]: *** [kernel/irq/generic-chip.o] Error 1
make[1]: *** [mm] Error 2
make[2]: *** [kernel/irq] Error 2
make[1]: *** [kernel] Error 2
arch/arc/include/asm/mmu.h:75:21: error: 'NR_CPUS' undeclared here (not in a function)
make[3]: *** [fs/ntfs/upcase.o] Error 1
make[2]: *** [fs/ntfs] Error 2
make[1]: *** [fs] Error 2
make: *** [sub-make] Error 2

Possible warnings (11)
----------------------

include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
kernel/sched/core.c:3326:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
