From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 22 Nov 2018 15:06:00 +0300
Subject: [PATCH] gcc: Select proper ARC CPU when build for target
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181122120600.10061-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

By default GCC for ARC is configured with ARC700 CPU.
This means when we don't pass "-mcpu=xxx":
 a) Code will be compiled for ARC700
 b) Libs will used for ARC700

And if we happen to run on ARCv2 core like ARC HSxx we
won't be able to use target gcc w/o "-mcpu=xxx" which
is not very convenient as we want to build "target" toolchain
but not canadian-cross.

Note the trick here is we set TUNE_PKGARCH in just 2 values,
it is either "arc700" for all ARCompact cores (ARC750 & ARC770)
and "archs" for all ARCv2 cores (ARC HS38 & HS48), see [1].
This gives us usable defaults.

For cross-compilation we use TUNE_CCARGS for fine-tuning depending
on which HW features we have on the current target so that
we may have HW feature A & B or B & C or A & B & C, see [2].

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/master/conf/machine/include/tune-arcv2.inc#L4
[2] https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/master/conf/machine/include/tune-arcv2.inc#L34

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index bc2236fed0..6270059644 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -20,6 +20,7 @@ ARMFPARCHEXT ?= ""
 EXTRA_OECONF_append_armv6 = " --with-arch=armv6${ARMFPARCHEXT}"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${ARMFPARCHEXT}"
 EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${ARMFPARCHEXT}"
+EXTRA_OECONF_append_arc = " --with-cpu=${TUNE_PKGARCH}"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
2.16.2
