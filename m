From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 09 Jun 2016 07:32:40 -0000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Jun 09, 17:31
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160609073240.1.68347@7e2e7264739d>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Jun 09, 17:31

http://kisskb.ellerman.id.au/kisskb/buildresult/12713783/

Commit:   Add linux-next specific files for 20160609
          8f6027f7e808ed7c1fd8c8d37fc7a5076c683c4f
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

{standard input}:18606: Error: Instruction with long immediate data in delay slot
make[2]: *** [block/cfq-iosched.o] Error 1
make[1]: *** [block] Error 2
make: *** [sub-make] Error 2

Possible warnings (19)
----------------------

include/linux/of.h:1002:20: warning: comparison of distinct pointer types lacks a cast [enabled by default]
include/linux/of.h:1002:20: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3811:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sched/core.c:3224:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4273:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1154:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
