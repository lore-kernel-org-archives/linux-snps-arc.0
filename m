From: Lada.Trimasova@synopsys.com (Lada Trimasova)
Date: Tue,  3 Nov 2015 20:34:59 +0300
Subject: [PATCH] Arc: fix entry point calculation for locales other than
 english
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446572099-2450-1-git-send-email-ltrimas@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The problem was detected while making uImage.
To find the line with entry point address in the result
of the "readelf -h vmlinux" command "grep ENTRY POINT" is used.

But if the operating system locale is not english,
command readelf returns lines in local language.

Grep cannot find the line which contains "ENTRY POINT" in english.
Our decision uses readelf key which displays the symbol table.
Using grep _stext it finds the line with entry point in this table.

Signed-off-by: Lada Trimasova <ltrimas at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/boot/Makefile b/arch/arc/boot/Makefile
index e597cb34..fa89a47 100644
--- a/arch/arc/boot/Makefile
+++ b/arch/arc/boot/Makefile
@@ -6,8 +6,7 @@ targets := vmlinux.bin vmlinux.bin.gz uImage
 
 OBJCOPYFLAGS= -O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-LINUX_START_TEXT = $$(readelf -h vmlinux | \
-			grep "Entry point address" | grep -o 0x.*)
+LINUX_START_TEXT = $$(readelf -s vmlinux | grep _stext | awk '{print $$2}')
 
 UIMAGE_LOADADDR    = $(CONFIG_LINUX_LINK_BASE)
 UIMAGE_ENTRYADDR   = $(LINUX_START_TEXT)
-- 
1.9.1
