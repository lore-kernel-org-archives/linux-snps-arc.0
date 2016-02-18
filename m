From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 18 Feb 2016 12:30:55 -0000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Feb 18, 23:30
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160218123055.1.16375@21ab0802fddb>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Feb 18, 23:30

http://kisskb.ellerman.id.au/kisskb/buildresult/12613549/

Commit:   Add linux-next specific files for 20160218
          3ab40ddf03ac47be2ede7e1f86b12c311f121e50
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[3]: *** [arch/arc/kernel/setup.o] Error 1
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[3]: *** [arch/arc/mm/tlb.o] Error 1
make[2]: *** [arch/arc/mm] Error 2
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
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
make[3]: *** [kernel/sched/idle.o] Error 1
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[2]: *** [mm/oom_kill.o] Error 1
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
include/linux/compiler.h:485:2: error: expected identifier or '(' before 'do'
include/linux/compiler.h:491:4: error: expected identifier or '(' before 'while'
make[2]: *** [fs/exec.o] Error 1
make[2]: *** [mm/page_alloc.o] Error 1
make[2]: *** [arch/arc/kernel] Error 2
make[1]: *** [arch/arc] Error 2
make[1]: *** [mm] Error 2
make[2]: *** [kernel/sched] Error 2
make[1]: *** [fs] Error 2
make[1]: *** [kernel] Error 2
make: *** [sub-make] Error 2

Possible warnings (17)
----------------------

kernel/sched/core.c:3228:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sysctl.c:1948:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1948:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
ipc/shm.c:1252:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:818:21: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:95:8: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:695:17: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:1268:13: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1760:10: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1715:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/namei.c:3223:10: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/core/hub.c:2767:16: warning: 'portchange' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/core/hub.c:2740:20: warning: 'portstatus' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:473:40: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:499:15: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/tty/serial/8250/8250_core.c:163:19: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
