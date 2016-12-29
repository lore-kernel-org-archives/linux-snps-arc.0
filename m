From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 29 Dec 2016 23:29:48 -0000
Subject: kisskb: FAILED linus/axs103_smp_defconfig/arcv2 Fri Dec 30, 10:29
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161229232948.1.88119@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs103_smp_defconfig/arcv2 Fri Dec 30, 10:29

http://kisskb.ellerman.id.au/kisskb/buildresult/12896296/

Commit:   mm: optimize PageWaiters bit use for unlock_page()
          b91e1302ad9b80c174a4855533f7e3aa2873355e
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

mm/filemap.c:933:9: error: too few arguments to function 'test_bit'
make[2]: *** [mm/filemap.o] Error 1
make[1]: *** [mm] Error 2
make: *** [sub-make] Error 2

Possible warnings (16)
----------------------

mm/filemap.c:934:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
fs/buffer.c:243:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:3439:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/page-io.c:163:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
