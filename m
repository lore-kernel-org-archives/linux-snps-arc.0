From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 16 May 2019 07:34:51 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Thu May 16, 15:39
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190516073451.1.38133@2ad4cc473807>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Thu May 16, 15:39

http://kisskb.ellerman.id.au/kisskb/buildresult/13806908/

Commit:   Merge tag 'ktest-v5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest
          b06ed1e7a2fa9b636f368a9e97c3c8877623f8b2
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (12)
----------------------

<stdin>:1388:2: warning: #warning syscall open_tree not implemented [-Wcpp]
<stdin>:1391:2: warning: #warning syscall move_mount not implemented [-Wcpp]
<stdin>:1394:2: warning: #warning syscall fsopen not implemented [-Wcpp]
<stdin>:1397:2: warning: #warning syscall fsconfig not implemented [-Wcpp]
<stdin>:1400:2: warning: #warning syscall fsmount not implemented [-Wcpp]
<stdin>:1403:2: warning: #warning syscall fspick not implemented [-Wcpp]
arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
net/ipv4/tcp_input.c:4321:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/xfrm/xfrm_policy.c:3492:15: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
