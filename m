From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 13 Sep 2016 15:37:17 -0700
Subject: [PATCH] ARC: module: provide linker script to discard debug sections
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473806237-16800-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The module .ko files seem to  bloated due to lot of needless sections,
most of which come due to -gdwarf-2 toggle (needed in turn to get
.debug_frame which kernel stack unwinder usese).

However there's no reason for the other .debug_* sections, so discard
them using arch specific linker script (linker collates module-common.lds
and arch specific lds)

For a very simply module using DEBUG_FS

before
| There are 35 section headers, starting at offset 0x205a0:
| ls -sh q_proc.ko
| 132K q_proc.ko

after
| There are 25 section headers, starting at offset 0x205a0:
| ls -sh q_proc.ko
| 8K q_proc.ko

Reported-by: Daniel Mentz <danielmentz at google.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Makefile          |  5 +++++
 arch/arc/kernel/module.lds | 12 ++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arc/kernel/module.lds

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 85814e74677d..fe1b702f5c69 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -97,6 +97,11 @@ LIBGCC	:= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
 # Modules with short calls might break for calls into builtin-kernel
 KBUILD_CFLAGS_MODULE	+= -mlong-calls -mno-millicode
 
+# toss away debug section, ifdef not allowed in the linker script
+ifndef CONFIG_DEBUG_INFO
+KBUILD_LDFLAGS_MODULE += -T $(srctree)/arch/arc/kernel/module.lds
+endif
+
 # Finally dump eveything into kernel build system
 KBUILD_CFLAGS	+= $(cflags-y)
 KBUILD_AFLAGS	+= $(KBUILD_CFLAGS)
diff --git a/arch/arc/kernel/module.lds b/arch/arc/kernel/module.lds
new file mode 100644
index 000000000000..c9839be105fc
--- /dev/null
+++ b/arch/arc/kernel/module.lds
@@ -0,0 +1,12 @@
+SECTIONS
+{
+	/DISCARD/ : { *(.debug_aranges) }
+	/DISCARD/ : { *(.debug_pubnames) }
+	/DISCARD/ : { *(.debug_info) }
+	/DISCARD/ : { *(.debug_abbrev) }
+	/DISCARD/ : { *(.debug_line) }
+	/DISCARD/ : { *(.debug_str) }
+	/DISCARD/ : { *(.debug_loc) }
+	/DISCARD/ : { *(.debug_macinfo) }
+	/DISCARD/ : { *(.debug_ranges) }
+}
-- 
2.7.4
