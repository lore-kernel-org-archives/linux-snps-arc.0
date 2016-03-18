From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 18 Mar 2016 14:16:23 +0530
Subject: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

linux-next has been reporting gazillion warnings for ARC build and
I finally decided to take a bite:

http://kisskb.ellerman.id.au/kisskb/buildresult/12638735/

Most of the them are due to -Wmaybe-uninitialized

| ../kernel/sysctl.c: In function '__do_proc_doulongvec_minmax':
| ../kernel/sysctl.c:1928:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
|   ret = tmp - *buf;
|            ^
| ../kernel/sysctl.c:2342:29: note: 'p' was declared here
|  char *kbuf = NULL, *p;
|                     ^
| ...
| ...

Cursory look at code seemed fine and a definite gcc false positive in say
kernel/sysctl.c

Mystery was why only for ARC (and not with ARM linaro toolchain based
off same gcc 4.8). Turns out that -O3 (default for ARC) triggers these
and if I enable -O3 for ARM kernel build, I see the same splat.

I doubt if gcc folks are going to fix warnings in gcc 4.8 (specially when this
was the much advertised front page feature @
https://gcc.gnu.org/gcc-4.8/porting_to.html

Better to to silent these for ARC, atleast for gcc 4.8 when we know that
these warnings are likely benign.

When we switch to later gcc, these will come back on and at that time we
could fixing gcc and/or relevant kernel code.

Cc: Claudiu Zissulescu <Claudiu.Zissulescu at synopsys.com>
Cc: Arnd Bergmann <arnd at arndb.de>
Cc: Michal Marek <mmarek at suse.cz>
Cc: Geert Uytterhoeven <geert at linux-m68k.org>
Cc: linux-kbuild at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index fed12f39d8ce..aeb101e8e674 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -48,9 +48,14 @@ endif
 upto_gcc44    :=  $(call cc-ifversion, -le, 0404, y)
 atleast_gcc44 :=  $(call cc-ifversion, -ge, 0404, y)
 atleast_gcc48 :=  $(call cc-ifversion, -ge, 0408, y)
+is_gcc48      :=  $(call cc-ifversion, -eq, 0408, y)
 
 cflags-$(atleast_gcc44)			+= -fsection-anchors
 
+# gcc 4.8 spits out false positives for default -O3
+# disable these for 4.8 and revisit when we upgrade to newer ver
+cflags-$(is_gcc48)			+= $(call cc-disable-warning,maybe-uninitialized,)
+
 cflags-$(CONFIG_ARC_HAS_LLSC)		+= -mlock
 cflags-$(CONFIG_ARC_HAS_SWAPE)		+= -mswape
 
-- 
2.5.0
