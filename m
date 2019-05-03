From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 03 May 2019 23:01:12 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sat May 04, 09:00
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190503230112.1.31459@07b04a9130af>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sat May 04, 09:00

http://kisskb.ellerman.id.au/kisskb/buildresult/13788922/

Commit:   Merge tag 'drm-fixes-2019-05-03' of git://anongit.freedesktop.org/drm/drm
          a4ccb5f9dc6c4fb4d4c0a9d73a911986f20ec88a
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (5)
----------------------

arch/arc/mm/tlb.c:914:2: warning: variable length array 'pd0' is used [-Wvla]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array bounds [-Warray-bounds]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
