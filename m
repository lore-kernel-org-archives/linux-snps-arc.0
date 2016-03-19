From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sat, 19 Mar 2016 08:22:49 -0000
Subject: kisskb: FAILED linus/axs103_smp_defconfig/arcv2 Sat Mar 19, 19:22
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160319082249.1.32265@4cca3ee1040e>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs103_smp_defconfig/arcv2 Sat Mar 19, 19:22

http://kisskb.ellerman.id.au/kisskb/buildresult/12640067/

Commit:   Merge branch 'for-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
          6b5f04b6cf8ebab9a65d9c0026c650bb2538fd0f
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[3]: *** [arch/arc/mm/tlb.o] Error 1
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[3]: *** [arch/arc/kernel/setup.o] Error 1
make[2]: *** [arch/arc/mm] Error 2
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[2]: *** [kernel/exit.o] Error 1
make[2]: *** [kernel/fork.o] Error 1
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[2]: *** [kernel/module.o] Error 1
make[3]: *** [kernel/sched/core.o] Error 1
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[2]: *** [mm/page_alloc.o] Error 1
make[2]: *** [arch/arc/kernel] Error 2
make[1]: *** [arch/arc] Error 2
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[2]: *** [mm/vmscan.o] Error 1
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[2]: *** [fs/exec.o] Error 1
make[1]: *** [mm] Error 2
make[2]: *** [kernel/sched] Error 2
make[1]: *** [fs] Error 2
make[1]: *** [kernel] Error 2
make: *** [sub-make] Error 2

Possible warnings (16)
----------------------

drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
kernel/sched/core.c:3079:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sysctl.c:1949:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1949:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:787:21: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:95:8: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:665:17: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:1238:13: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
ipc/shm.c:1252:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1720:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1720:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
