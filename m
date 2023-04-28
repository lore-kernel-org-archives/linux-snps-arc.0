Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227AEC77B61
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTvq2ovDd18uQwvtt+66oIMOpsTAskfIcvPtE48CxZY=; b=gH8Ru4A4x9z3/0
	xE0bM5A/nFDsoxZb4sqSW0ogMwaCo++mdKSCDkOzRu/hDEjGFSAB+sTUmRNtDV8DumIr4IfSWeHIh
	nqyqq+/pYDZk5yogfxnpZykbWGS+7bCZ2C1i9plXIGzwMRtoWe2d1vImgfj3yf1IqAB38aC2HXWzi
	Ui1/M5MC6LqqOmUW4i2CPXb+qqTr3Yn2cDAS8FhnqZFo+wV1HQ12clX9lxNC/JAb7QsBKOf43+cFB
	A8BpNEZIyn+KVSYGpziFfcTCdOX1zdCdso54FOAjhKT9vw48HpmPci8k6FWOEK7W/JCYLmJtUvx0u
	2Ov5HqstcGrNWSEwD3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psKOG-008dhi-2Q;
	Fri, 28 Apr 2023 09:27:44 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psKNq-008dRI-0e;
	Fri, 28 Apr 2023 09:27:21 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA67421ED4;
	Fri, 28 Apr 2023 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682674034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dttAvrB3jWpgJtm9agssOOqjg81G8y/0rvJLga4TX2Y=;
	b=FwzEoVEM5ZiVwRaUsiqsC8uRZWBO0MENeFjb4KljMvyGhacHJZV47m4LttrCa9k5i29zKI
	xxUxXlg9OZD9SuPtOvr4jNFpkKAsJb0LFp87xP9gLubAV/zYUIjbsTTt6iBGig6rU6tMIO
	G+/8q4UnnFtv1Cm3+83jYcyPbY686PM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682674034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dttAvrB3jWpgJtm9agssOOqjg81G8y/0rvJLga4TX2Y=;
	b=f7CADmYihbbC+E9Kv+aJQGm6+DtR2PPa8qKUuBrxYkngL6XlfxSm3GzLAv8xtNoxkFsWvI
	rWwz6lNTNlGzLVDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 820FA138FA;
	Fri, 28 Apr 2023 09:27:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AJPpHnKRS2ReFwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 09:27:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	geert@linux-m68k.org,
	javierm@redhat.com,
	daniel@ffwll.ch,
	vgupta@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	davem@davemloft.net,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/5] fbdev: Include <linux/io.h> in drivers
Date: Fri, 28 Apr 2023 11:27:10 +0200
Message-Id: <20230428092711.406-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428092711.406-1-tzimmermann@suse.de>
References: <20230428092711.406-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_022718_534792_2C54A116 
X-CRM114-Status: GOOD (  14.94  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Fbdev's main header file, <linux/fb.h>, includes <asm/io.h> to get
declarations of I/O helper functions. From these declaratons, it later
defines framebuffer I/O helpers, such as fb_{read,write}[bwlq]() or
fb_memset().

The framebuffer I/O helpers pre-date Linux' current I/O code and will
be replaced by regular I/O helpers. Prepare this change by adding an
include statement for <linux/io.h> to all source files that use the
framebuffer I/O helpers. They will still get declarations of the I/O
functions even after <linux/fb.h> has been cleaned up. Driver source
files that already include <asm/io.h> convert to <linux/io.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/arkfb.c                 | 1 +
 drivers/video/fbdev/aty/mach64_cursor.c     | 3 +--
 drivers/video/fbdev/chipsfb.c               | 1 +
 drivers/video/fbdev/cirrusfb.c              | 1 +
 drivers/video/fbdev/core/cfbcopyarea.c      | 2 +-
 drivers/video/fbdev/core/cfbfillrect.c      | 2 ++
 drivers/video/fbdev/core/cfbimgblt.c        | 2 ++
 drivers/video/fbdev/core/fbmem.c            | 1 +
 drivers/video/fbdev/core/svgalib.c          | 2 +-
 drivers/video/fbdev/hgafb.c                 | 2 +-
 drivers/video/fbdev/hitfb.c                 | 2 +-
 drivers/video/fbdev/kyro/fbdev.c            | 2 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c | 2 ++
 drivers/video/fbdev/matrox/matroxfb_base.h  | 2 +-
 drivers/video/fbdev/pm2fb.c                 | 1 +
 drivers/video/fbdev/pm3fb.c                 | 1 +
 drivers/video/fbdev/pvr2fb.c                | 1 +
 drivers/video/fbdev/s3fb.c                  | 1 +
 drivers/video/fbdev/sstfb.c                 | 2 +-
 drivers/video/fbdev/tdfxfb.c                | 2 +-
 drivers/video/fbdev/tridentfb.c             | 1 +
 drivers/video/fbdev/vga16fb.c               | 2 +-
 drivers/video/fbdev/vt8623fb.c              | 1 +
 23 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 60a96fdb5dd8..c254ab6fbb7d 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -23,6 +23,7 @@
 #include <linux/fb.h>
 #include <linux/svga.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/console.h> /* Why should fb driver call console functions? because console_lock() */
 #include <video/vga.h>
diff --git a/drivers/video/fbdev/aty/mach64_cursor.c b/drivers/video/fbdev/aty/mach64_cursor.c
index 4ad0331a8c57..c1347c37a146 100644
--- a/drivers/video/fbdev/aty/mach64_cursor.c
+++ b/drivers/video/fbdev/aty/mach64_cursor.c
@@ -5,11 +5,10 @@
 
 #include <linux/fb.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/string.h>
 #include "../core/fb_draw.h"
 
-#include <asm/io.h>
-
 #ifdef __sparc__
 #include <asm/fbio.h>
 #endif
diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index 7799d52a651f..9cb719afe033 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -26,6 +26,7 @@
 #include <linux/fb.h>
 #include <linux/pm.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/console.h>
 
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index ba45e2147c52..89366a78b010 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -43,6 +43,7 @@
 #include <linux/delay.h>
 #include <linux/fb.h>
 #include <linux/init.h>
+#include <linux/io.h>
 
 #ifdef CONFIG_ZORRO
 #include <linux/zorro.h>
diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
index 6d4bfeecee35..fc3a99a50266 100644
--- a/drivers/video/fbdev/core/cfbcopyarea.c
+++ b/drivers/video/fbdev/core/cfbcopyarea.c
@@ -26,8 +26,8 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/io.h>
 #include <asm/types.h>
-#include <asm/io.h>
 #include "fb_draw.h"
 
 #if BITS_PER_LONG == 32
diff --git a/drivers/video/fbdev/core/cfbfillrect.c b/drivers/video/fbdev/core/cfbfillrect.c
index ba9f58b2a5e8..15fd4927a031 100644
--- a/drivers/video/fbdev/core/cfbfillrect.c
+++ b/drivers/video/fbdev/core/cfbfillrect.c
@@ -13,6 +13,8 @@
  *  the native cpu endians. I also need to deal with MSB position in the word.
  *
  */
+
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/fb.h>
diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
index 9ebda4e0dc7a..e8c957f51fd4 100644
--- a/drivers/video/fbdev/core/cfbimgblt.c
+++ b/drivers/video/fbdev/core/cfbimgblt.c
@@ -29,6 +29,8 @@
  *  Also need to add code to deal with cards endians that are different than
  *  the native cpu endians. I also need to deal with MSB position in the word.
  */
+
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/fb.h>
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3fd95a79e4c3..2047bffe4a6c 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -23,6 +23,7 @@
 #include <linux/mman.h>
 #include <linux/vt.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/linux_logo.h>
 #include <linux/proc_fs.h>
 #include <linux/platform_device.h>
diff --git a/drivers/video/fbdev/core/svgalib.c b/drivers/video/fbdev/core/svgalib.c
index 9e01322fabe3..c4731b95a36d 100644
--- a/drivers/video/fbdev/core/svgalib.c
+++ b/drivers/video/fbdev/core/svgalib.c
@@ -15,8 +15,8 @@
 #include <linux/string.h>
 #include <linux/fb.h>
 #include <linux/svga.h>
+#include <linux/io.h>
 #include <asm/types.h>
-#include <asm/io.h>
 
 
 /* Write a CRT register value spread across multiple registers */
diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index 40879d9facdf..c83ac13f50b1 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -41,7 +41,7 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <asm/vga.h>
 
 #if 0
diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index bbb0f1d953cc..8509a5ad77cb 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -23,7 +23,7 @@
 
 #include <asm/machvec.h>
 #include <linux/uaccess.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <asm/hd64461.h>
 #include <cpu/dac.h>
 
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 0596573ef140..281fd26a5694 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -21,7 +21,7 @@
 #include <linux/ioctl.h>
 #include <linux/init.h>
 #include <linux/pci.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <linux/uaccess.h>
 
 #include <video/kyro.h>
diff --git a/drivers/video/fbdev/matrox/matroxfb_accel.c b/drivers/video/fbdev/matrox/matroxfb_accel.c
index ce51227798a1..271c7839f66f 100644
--- a/drivers/video/fbdev/matrox/matroxfb_accel.c
+++ b/drivers/video/fbdev/matrox/matroxfb_accel.c
@@ -77,6 +77,8 @@
  *
  */
 
+#include <linux/io.h>
+
 #include "matroxfb_accel.h"
 #include "matroxfb_DAC1064.h"
 #include "matroxfb_Ti3026.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.h b/drivers/video/fbdev/matrox/matroxfb_base.h
index c93c69bbcd57..2cd7c82ce307 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.h
+++ b/drivers/video/fbdev/matrox/matroxfb_base.h
@@ -36,6 +36,7 @@
 #include <linux/fb.h>
 #include <linux/console.h>
 #include <linux/selection.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/timer.h>
@@ -43,7 +44,6 @@
 #include <linux/spinlock.h>
 #include <linux/kd.h>
 
-#include <asm/io.h>
 #include <asm/unaligned.h>
 
 #if defined(CONFIG_PPC_PMAC)
diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 47d212944f30..297abac721ea 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -38,6 +38,7 @@
 #include <linux/delay.h>
 #include <linux/fb.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 #include <video/permedia2.h>
 #include <video/cvisionppc.h>
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index b46a471df9ae..78df01b1a507 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -32,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/fb.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 
 #include <video/pm3fb.h>
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 6888127a5eb8..6aeb26293c70 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -56,6 +56,7 @@
 #include <linux/interrupt.h>
 #include <linux/fb.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 
 #ifdef CONFIG_SH_DREAMCAST
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 7d257489edcc..1efddb2ef6da 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -22,6 +22,7 @@
 #include <linux/fb.h>
 #include <linux/svga.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/console.h> /* Why should fb driver call console functions? because console_lock() */
 #include <video/vga.h>
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index da296b2ab54a..f07c646aa2d1 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -88,7 +88,7 @@
 #include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/init.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <linux/uaccess.h>
 #include <video/sstfb.h>
 
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index d17e5e1472aa..096a8cfd8d6d 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -74,7 +74,7 @@
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/pci.h>
-#include <asm/io.h>
+#include <linux/io.h>
 
 #include <video/tdfx.h>
 
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 6099b9768ba1..28e7647bdf82 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 1a8ffdb2be26..2d185dbb839b 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -18,12 +18,12 @@
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/fb.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
 
-#include <asm/io.h>
 #include <video/vga.h>
 
 #define MODE_SKIP4	1
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 034333ee6e45..1d4aee10a653 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -23,6 +23,7 @@
 #include <linux/fb.h>
 #include <linux/svga.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/console.h> /* Why should fb driver call console functions? because console_lock() */
 #include <video/vga.h>
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
