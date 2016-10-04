From: danielmentz@google.com (Daniel Mentz)
Date: Tue,  4 Oct 2016 16:34:27 -0700
Subject: [PATCH] ARC: [build] Support gz, lzma compressed uImage
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1475624067-17290-1-git-send-email-danielmentz@google.com>
To: linux-snps-arc@lists.infradead.org

Add support for lzma compressed uImage.

Support for gzip was already available but could not be enabled because
we were missing CONFIG_HAVE_KERNEL_GZIP in arch/arc/Kconfig.

Signed-off-by: Daniel Mentz <danielmentz at google.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
---
 arch/arc/Kconfig       |  2 ++
 arch/arc/boot/Makefile | 16 ++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 25a760b..a538631 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -41,6 +41,8 @@ config ARC
 	select PERF_USE_VMALLOC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_GENERIC_DMA_COHERENT
+	select HAVE_KERNEL_GZIP
+	select HAVE_KERNEL_LZMA
 
 config MIGHT_HAVE_PCI
 	bool
diff --git a/arch/arc/boot/Makefile b/arch/arc/boot/Makefile
index e597cb34..f94cf15 100644
--- a/arch/arc/boot/Makefile
+++ b/arch/arc/boot/Makefile
@@ -14,9 +14,15 @@ UIMAGE_ENTRYADDR   = $(LINUX_START_TEXT)
 
 suffix-y := bin
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
+suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 
-targets += uImage uImage.bin uImage.gz
-extra-y += vmlinux.bin vmlinux.bin.gz
+targets += uImage
+targets += uImage.bin
+targets += uImage.gz
+targets += uImage.lzma
+extra-y += vmlinux.bin
+extra-y += vmlinux.bin.gz
+extra-y += vmlinux.bin.lzma
 
 $(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
@@ -24,12 +30,18 @@ $(obj)/vmlinux.bin: vmlinux FORCE
 $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,gzip)
 
+$(obj)/vmlinux.bin.lzma: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,lzma)
+
 $(obj)/uImage.bin: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,uimage,none)
 
 $(obj)/uImage.gz: $(obj)/vmlinux.bin.gz FORCE
 	$(call if_changed,uimage,gzip)
 
+$(obj)/uImage.lzma: $(obj)/vmlinux.bin.lzma FORCE
+	$(call if_changed,uimage,lzma)
+
 $(obj)/uImage: $(obj)/uImage.$(suffix-y)
 	@ln -sf $(notdir $<) $@
 	@echo '  Image $@ is ready'
-- 
2.8.0.rc3.226.g39d4020
