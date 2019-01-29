From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Jan 2019 17:08:05 -0800
Subject: [PATCH] [ARC]: Enable init_array support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548724085-3713-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

gcc's common configure script has a subtle flaw that it only tests
{init,fini.preinit}_array support when NOT cross compiling. This causes
cross builds to erroneously deduce that the feature is not supported by
the target.

| host-gcc-final-ab544139bfee/build/gcc/config.log
|
|configure:22941: checking for .preinit_array/.init_array/.fini_array support
|configure:23106: checking cross compile... guessing
|configure:23111: result: no

The right fix is to enable this for *all* cross setups (and address any
fallouts). However in the short-term to enable ARC glibc port to upstream,
force enable this for ARC.

This has been discussed at length on glibc mailing list [1], [2]

[1] https://sourceware.org/ml/libc-alpha/2018-11/msg00870.html
[2] https://sourceware.org/ml/libc-alpha/2019-01/msg00656.html

gcc/

2019-xx-xx  Vineet Gupta <vgupta at synopsys.com>

	* gcc/config.gcc: Force .init_array for ARC

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 gcc/ChangeLog  | 4 ++++
 gcc/config.gcc | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/gcc/ChangeLog b/gcc/ChangeLog
index f5872dbeab7c..4c86d5375bcc 100644
--- a/gcc/ChangeLog
+++ b/gcc/ChangeLog
@@ -1,3 +1,7 @@
+2019-01-28  Vineet Gupta  <vgupta at synopsys.com>
+
+	* gcc/config.gcc: Force .init_array for ARC
+
 2019-01-28  Jakub Jelinek  <jakub at redhat.com>
 
 	PR middle-end/89002
diff --git a/gcc/config.gcc b/gcc/config.gcc
index a189cb19f633..eef4b4eac918 100644
--- a/gcc/config.gcc
+++ b/gcc/config.gcc
@@ -1110,6 +1110,9 @@ arc*-*-linux*)
 	case ${with_endian} in
 	big*)	tm_file="arc/big.h ${tm_file}"
 	esac
+	# Force .init_array support.  The configure script cannot always
+	# automatically detect that GAS supports it, yet we require it.
+	gcc_cv_initfini_array=yes
         ;;
 arm-wrs-vxworks|arm-wrs-vxworks7)
 	extra_options="${extra_options} arm/vxworks.opt"
-- 
2.7.4
