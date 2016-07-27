From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 27 Jul 2016 01:16:02 -0000
Subject: kisskb: FAILED linus/axs103_smp_defconfig/arcv2 Wed Jul 27, 11:15
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160727011602.1.97784@6a908f32226f>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs103_smp_defconfig/arcv2 Wed Jul 27, 11:15

http://kisskb.ellerman.id.au/kisskb/buildresult/12755489/

Commit:   Merge branch 'for-4.8/drivers' of git://git.kernel.dk/linux-block
          3fc9d690936fb2e20e180710965ba2cc3a0881f8
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

       - mg_disk error path fix from Bart.
            + error code fixup from Dan.
{standard input}:18729: Error: Instruction with long immediate data in delay slot
make[2]: *** [block/cfq-iosched.o] Error 1
make[1]: *** [block] Error 2
make: *** [sub-make] Error 2

Possible warnings (18)
----------------------

kernel/sched/core.c:3236:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3819:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:299:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4283:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/sunrpc/svc_xprt.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1154:1: warning: control reaches end of non-void function [-Wreturn-type]
