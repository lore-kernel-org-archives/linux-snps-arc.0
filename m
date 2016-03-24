From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 24 Mar 2016 19:48:35 +0300
Subject: [PATCH 4/5 v4] arc: Add our own implementation of fb_pgprotect()
In-Reply-To: <1458838116-24954-1-git-send-email-abrodkin@synopsys.com>
References: <1458838116-24954-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458838116-24954-5-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

During mmaping of frame-buffer pages to user-space
fb_protect() is called to set proper page settings.

In case of ARC we need to mark pages that are mmaped to
user as uncached because of 2 reasons:
 * Huge amount of data if passing through data cache will
   thrash cache a lot making cache almost useless for other
   less traffic hungry processes.
 * Data written by user in FB will be immediately available for
   hardware (such as PGU etc) without requirements to flush data
   cache regularly.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
---

Changes v3 -> v4:
 * This change was introduced only in v4.

 arch/arc/include/asm/fb.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 arch/arc/include/asm/fb.h

diff --git a/arch/arc/include/asm/fb.h b/arch/arc/include/asm/fb.h
new file mode 100644
index 0000000..bd3f68c
--- /dev/null
+++ b/arch/arc/include/asm/fb.h
@@ -0,0 +1,19 @@
+#ifndef _ASM_FB_H_
+#define _ASM_FB_H_
+
+#include <linux/fb.h>
+#include <linux/fs.h>
+#include <asm/page.h>
+
+static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
+				unsigned long off)
+{
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+}
+
+static inline int fb_is_primary_device(struct fb_info *info)
+{
+	return 0;
+}
+
+#endif /* _ASM_FB_H_ */
-- 
2.5.0
