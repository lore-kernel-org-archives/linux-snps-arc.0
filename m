From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 29 Dec 2016 23:30:28 -0000
Subject: kisskb: FAILED linus/axs101_defconfig/arcompact Fri Dec 30, 10:29
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161229233028.1.89426@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs101_defconfig/arcompact Fri Dec 30, 10:29

http://kisskb.ellerman.id.au/kisskb/buildresult/12896297/

Commit:   mm: optimize PageWaiters bit use for unlock_page()
          b91e1302ad9b80c174a4855533f7e3aa2873355e
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

mm/filemap.c:933:2: error: too few arguments to function 'test_bit'
make[2]: *** [mm/filemap.o] Error 1
make[1]: *** [mm] Error 2
make: *** [sub-make] Error 2

Possible warnings (11)
----------------------

mm/filemap.c:934:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
