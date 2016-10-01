From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sat, 01 Oct 2016 15:45:09 -0000
Subject: kisskb: FAILED linus/axs103_smp_defconfig/arcv2 Sun Oct 02, 01:44
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161001154509.1.40402@8e2d6d7be827>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs103_smp_defconfig/arcv2 Sun Oct 02, 01:44

http://kisskb.ellerman.id.au/kisskb/buildresult/12818837/

Commit:   Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
          f51fdffad5b7709d0ade40736b58a2da2707fa15
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

{standard input}:18729: Error: Instruction with long immediate data in delay slot
make[2]: *** [block/cfq-iosched.o] Error 1
make[1]: *** [block] Error 2
make: *** [sub-make] Error 2

Possible warnings (18)
----------------------

kernel/sched/core.c:3277:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:742:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3819:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4286:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1154:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
