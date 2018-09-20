From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 20 Sep 2018 12:02:14 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Thu Sep 20, 22:01
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180920120214.1.35297@bf8565bee66d>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Thu Sep 20, 22:01

http://kisskb.ellerman.id.au/kisskb/buildresult/13516888/

Commit:   Merge tag 'sound-4.19-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
          d82920849f305a83b893a90eca6391de411d77ef
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (3)
----------------------

include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
net/ipv4/tcp_input.c:4319:49: warning: array subscript is above array bounds [-Warray-bounds]
