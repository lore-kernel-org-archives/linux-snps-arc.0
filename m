From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 31 May 2019 10:14:57 +0000
Subject: Pass config-time variable to LIBC_SLIBDIR_RTLDDIR 
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB01200F5CBFD010ADC371E89EA1190@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Andreas,

I'm trying to implement multilib support for ARC port of Glibc
and for that we seem to need to have unique slibdir/rtlddir pair per
each machine flavor. In our case these are at least:
 - ARC700 (legacy ARCompact architecture)
 - ARC HS38 (new gen ARCv2 architecture)
 - ARC HS38 with hardware floating-point
 - ARC HS48 (binary-compatible with HS38 but with different pipeline so
             compiler schedules instructions differently)
 - eventually there'll be newer generations like ARCv3/v4 etc

Given we have in GCC a dedicated "-mcpu" value for each of items above
my first thought was to "automatically" setup slibdir/rtlddir
based on "-mcpu" value passed in CC during configuration.

Something like that:
---------------------------------->8------------------------------------
+++ b/sysdeps/unix/sysv/linux/arc/configure.ac
@@ -2,3 +2,10 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
 # Local configure fragment for sysdeps/unix/sysv/linux/arc.

 arch_minimum_kernel=3.9.0
+
+# Extract "-mcpu=xxx" value from CC to install libs in a separate folder
+arc_mcpu=[`echo $CC | grep -Po '\-mcpu=\K[^ ]+'`]
+
+if test "$arc_mcpu" != "" ; then
+       LIBC_SLIBDIR_RTLDDIR([lib/${arc_mcpu}], [lib/${arc_mcpu}])
+fi
---------------------------------->8------------------------------------

But apparently that doesn't work due to your change [1] in
commit 128c43a2d630 ("LIBC_SLIBDIR_RTLDDIR: substitute arguments in single quotes").

I guess mentioned change is not supposed to be reverted but then
how do you think it's possible [if at all] to implement that kind of
"automatic" setup of slibdir/rtlddir?

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=128c43a2d630

-Alexey
