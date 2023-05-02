Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9597DC8300C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 May 2023 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vObJgfF8f0QiDRgoxeM3zoezDqHWYTwR4Y2aRnCtX8g=; b=vviWX/FesM7f5B
	yrLvf4fZSfXqOB2LES4QXwcg7jgzTaiSA+DzR0tIziiW8TNf9Lv9rZ0fMaYwLWhid5VOXAiBkrik1
	I0rlecXsYt3BxrGMD7KmgLdeLwYdWiwlvKR+SjoNR8Np7d7II3eZnkcg2QhsJVmm49fBQOAEZs5Re
	kiKkryTcVyTtUuNg5QsHKQ4Dlqibtkc/hIQrjcaID4tfhOvb8SNy3sGb7zJB23TgFYQPrlXbtqII1
	wHdMo+g3t1FM6UhsMxUizwNhvUBTi19Dnm3QHnBBxP8QwnLncJ4Vg+cNnU1PCiu+lsBaoyBHw2Ux+
	Gxrm6tabyK7VwGUWZ+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptpeT-001XAm-1x;
	Tue, 02 May 2023 13:02:41 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptpeI-001X1r-1x;
	Tue, 02 May 2023 13:02:33 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D9D141F8C4;
	Tue,  2 May 2023 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683032547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xf4+yP0DSQInwFmB+gxRtq5ssDW3pPaN9Wr1JktP/Rg=;
	b=RZ0P9X9xgvThz+YpFZ/anZoEJmTT88Wfoz9gPxGc2gyyMnzQijmGoPvl1DBHF5y2IcFFN9
	exxrNhVSCP4C9RavQE4AKLQvXpaK8bMab2I3XIKszV0zKtVTq9y+NFqFD1M5uKXo5KmaJy
	no6sSXdlb/lsdwDQmrGn85WBWUWqh8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683032547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xf4+yP0DSQInwFmB+gxRtq5ssDW3pPaN9Wr1JktP/Rg=;
	b=8SEUFVodj/UyZ/97/IcTtUjagm/k7522TvbL1LeAOt2HDMe4I90Q225gcB72Vs11RIg8fj
	Lsp1bKKQ8qvYt1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7360D139D2;
	Tue,  2 May 2023 13:02:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OMdYG+MJUWRYTQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 02 May 2023 13:02:27 +0000
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
Subject: [PATCH v3 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
Date: Tue,  2 May 2023 15:02:22 +0200
Message-Id: <20230502130223.14719-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
References: <20230502130223.14719-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_060230_812165_D8E37A55 
X-CRM114-Status: GOOD (  14.65  )
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

Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
in the architecture's <asm/fb.h> header file or the generic one.

The common case has been the use of regular I/O functions, such as
__raw_readb() or memset_io(). A few architectures used plain system-
memory reads and writes. Sparc used helpers for its SBus.

The architectures that used special cases provide the same code in
their __raw_*() I/O helpers. So the patch replaces this code with the
__raw_*() functions and moves it to <asm-generic/fb.h> for all
architectures.

v3:
	* implement all architectures with generic helpers
	* support reordering and native byte order (Geert, Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/asm-generic/fb.h | 101 +++++++++++++++++++++++++++++++++++++++
 include/linux/fb.h       |  53 --------------------
 2 files changed, 101 insertions(+), 53 deletions(-)

diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index 6922dd248c51..0540eccdbeca 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -31,4 +31,105 @@ static inline int fb_is_primary_device(struct fb_info *info)
 }
 #endif
 
+/*
+ * I/O helpers for the framebuffer. Prefer these functions over their
+ * regular counterparts. The regular I/O functions provide in-order
+ * access and swap bytes to/from little-endian ordering. Neither is
+ * required for framebuffers. Instead, the helpers read and write
+ * raw framebuffer data. Independent operations can be reordered for
+ * improved performance.
+ */
+
+#ifndef fb_readb
+static inline u8 fb_readb(const volatile void __iomem *addr)
+{
+	return __raw_readb(addr);
+}
+#define fb_readb fb_readb
+#endif
+
+#ifndef fb_readw
+static inline u16 fb_readw(const volatile void __iomem *addr)
+{
+	return __raw_readw(addr);
+}
+#define fb_readw fb_readw
+#endif
+
+#ifndef fb_readl
+static inline u32 fb_readl(const volatile void __iomem *addr)
+{
+	return __raw_readl(addr);
+}
+#define fb_readl fb_readl
+#endif
+
+#ifndef fb_readq
+#if defined(__raw_readq)
+static inline u64 fb_readq(const volatile void __iomem *addr)
+{
+	return __raw_readq(addr);
+}
+#define fb_readq fb_readq
+#endif
+#endif
+
+#ifndef fb_writeb
+static inline void fb_writeb(u8 b, volatile void __iomem *addr)
+{
+	__raw_writeb(b, addr);
+}
+#define fb_writeb fb_writeb
+#endif
+
+#ifndef fb_writew
+static inline void fb_writew(u16 b, volatile void __iomem *addr)
+{
+	__raw_writew(b, addr);
+}
+#define fb_writew fb_writew
+#endif
+
+#ifndef fb_writel
+static inline void fb_writel(u32 b, volatile void __iomem *addr)
+{
+	__raw_writel(b, addr);
+}
+#define fb_writel fb_writel
+#endif
+
+#ifndef fb_writeq
+#if defined(__raw_writeq)
+static inline void fb_writeq(u64 b, volatile void __iomem *addr)
+{
+	__raw_writeq(b, addr);
+}
+#define fb_writeq fb_writeq
+#endif
+#endif
+
+#ifndef fb_memcpy_fromfb
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy_fromio(to, from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+#endif
+
+#ifndef fb_memcpy_tofb
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy_toio(to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+#endif
+
+#ifndef fb_memset
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset_io(addr, c, n);
+}
+#define fb_memset fb_memset
+#endif
+
 #endif /* __ASM_GENERIC_FB_H_ */
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 08cb47da71f8..7d80ee62a9d5 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -15,7 +15,6 @@
 #include <linux/list.h>
 #include <linux/backlight.h>
 #include <linux/slab.h>
-#include <asm/io.h>
 
 struct vm_area_struct;
 struct fb_info;
@@ -511,58 +510,6 @@ struct fb_info {
  */
 #define STUPID_ACCELF_TEXT_SHIT
 
-// This will go away
-#if defined(__sparc__)
-
-/* We map all of our framebuffers such that big-endian accesses
- * are what we want, so the following is sufficient.
- */
-
-// This will go away
-#define fb_readb sbus_readb
-#define fb_readw sbus_readw
-#define fb_readl sbus_readl
-#define fb_readq sbus_readq
-#define fb_writeb sbus_writeb
-#define fb_writew sbus_writew
-#define fb_writel sbus_writel
-#define fb_writeq sbus_writeq
-#define fb_memset sbus_memset_io
-#define fb_memcpy_fromfb sbus_memcpy_fromio
-#define fb_memcpy_tofb sbus_memcpy_toio
-
-#elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) ||	\
-	defined(__hppa__) || defined(__sh__) || defined(__powerpc__) ||	\
-	defined(__arm__) || defined(__aarch64__) || defined(__mips__)
-
-#define fb_readb __raw_readb
-#define fb_readw __raw_readw
-#define fb_readl __raw_readl
-#define fb_readq __raw_readq
-#define fb_writeb __raw_writeb
-#define fb_writew __raw_writew
-#define fb_writel __raw_writel
-#define fb_writeq __raw_writeq
-#define fb_memset memset_io
-#define fb_memcpy_fromfb memcpy_fromio
-#define fb_memcpy_tofb memcpy_toio
-
-#else
-
-#define fb_readb(addr) (*(volatile u8 *) (addr))
-#define fb_readw(addr) (*(volatile u16 *) (addr))
-#define fb_readl(addr) (*(volatile u32 *) (addr))
-#define fb_readq(addr) (*(volatile u64 *) (addr))
-#define fb_writeb(b,addr) (*(volatile u8 *) (addr) = (b))
-#define fb_writew(b,addr) (*(volatile u16 *) (addr) = (b))
-#define fb_writel(b,addr) (*(volatile u32 *) (addr) = (b))
-#define fb_writeq(b,addr) (*(volatile u64 *) (addr) = (b))
-#define fb_memset memset
-#define fb_memcpy_fromfb memcpy
-#define fb_memcpy_tofb memcpy
-
-#endif
-
 #define FB_LEFT_POS(p, bpp)          (fb_be_math(p) ? (32 - (bpp)) : 0)
 #define FB_SHIFT_HIGH(p, val, bits)  (fb_be_math(p) ? (val) >> (bits) : \
 						      (val) << (bits))
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
