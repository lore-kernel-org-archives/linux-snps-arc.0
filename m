Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9C2C7EE31
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 May 2023 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyQrj53/S8+QJ8f7VRzGVdEI4xWcpvJ98GKmWt316UY=; b=mfxaVPby1LR70y
	2iE4YW0DCiJhXF1TNIRtyQn5r9UHs+yl4QWJwVYsh9ixXwebcGo4ZfFKI02PzXUn9Pt9iJWsUaLYy
	RlDyCNBZPvicKbZMMRm+zn/3xxX9QvlSvkoBoFOtXFBqO1e5WLTkVFYbNmbQDuzdt6vsXLtgkJPW8
	Pl6MKkFvoijrw0ljaAfi5OGeKhB2oGnlomSoZqLVRdkNNrV3hFZbm7Jr8wM9Pm7PImZv+5tRwouDX
	m4Y7gK1npB2PnVgOeSkLauRTAO3MVZUKdlMGIGJGrVAHDkoMfZWZKbi+7S6rQNcUFJV3EQjz2Avwd
	kqw03IqbsF6Cai7Rc47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzMF-000RN9-1E;
	Mon, 08 May 2023 11:48:47 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM9-000RHy-35;
	Mon, 08 May 2023 11:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tr288t0xLynfRQCVUOIoSbgvZMe70hnX0f+t3+0V3zI=; b=aEPULTd42xol1/v0a9DC5oDR5h
	6TgZiaxcdxWryVwCzgG7BhK9+IN7XPPciAVFgWpjadOggRYIibyfly51sMCsjoaIChTHy1GFOIyeA
	g2P386g/6Gpx3B7ErtBJJHlRsA+yJLTChELCocz6wInznpAO+/pn8pjjK+UPnS5gVy4sM6T9DtT5z
	i9zztSs+tp7pwKvcxKkTBjk223Kpm3CcD35jDFGJ/mzLlj8k8v3RiZENX9BhzKihLxWFsR7d9A6NP
	y7xooic69+5s58qZATXtmS9fHXZ9Jy/FkyF9egEzSA2dho0ImtHWl8IYddaNGqcjX4Ra+eUYdMuHl
	WUKl2UGg==;
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzM4-0059CT-1G;
	Mon, 08 May 2023 11:48:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C1FA1FE47;
	Mon,  8 May 2023 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683546514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tr288t0xLynfRQCVUOIoSbgvZMe70hnX0f+t3+0V3zI=;
	b=jhAb/kcSH9OGcOdMqKsU3JQYt8MS/ix51cS96bltG3yXij+k+EKkw6vSH/xK4QlqupPc6N
	Z9yxjMOdZWFvyH+rCo5ME+89kALCtyShuMmOXXLT5CasBHU57Lh0Sd3mu94jdFYa9Ftt9O
	WBdR9jdJk96qVz2KGrhxturb1WX9W5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683546514;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tr288t0xLynfRQCVUOIoSbgvZMe70hnX0f+t3+0V3zI=;
	b=aDyY2DoEFDg9l2+x0fGMw3zfjFLAVatBTGnWIXzmY7Z6d4xKOro8khAwp8QfW8njTv1QXT
	1s4lcwjh7Y5NrmBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD90D139F8;
	Mon,  8 May 2023 11:48:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sOl4KZHhWGQvNwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 11:48:33 +0000
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
	sam@ravnborg.org,
	suijingfeng@loongson.cn
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
Subject: [PATCH v5 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
Date: Mon,  8 May 2023 13:48:29 +0200
Message-Id: <20230508114830.28182-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508114830.28182-1-tzimmermann@suse.de>
References: <20230508114830.28182-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124836_654536_C7F5F148 
X-CRM114-Status: GOOD (  15.62  )
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

v5:
	* include <linux/io.h> in <asm-generic/fb>; fix s390 build
v4:
	* ia64, loongarch, sparc64: add fb_mem*() to arch headers
	  to keep current semantics (Arnd)
v3:
	* implement all architectures with generic helpers
	* support reordering and native byte order (Geert, Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/ia64/include/asm/fb.h      |  20 +++++++
 arch/loongarch/include/asm/fb.h |  21 +++++++
 arch/sparc/include/asm/fb.h     |  20 +++++++
 include/asm-generic/fb.h        | 102 ++++++++++++++++++++++++++++++++
 include/linux/fb.h              |  53 -----------------
 5 files changed, 163 insertions(+), 53 deletions(-)

diff --git a/arch/ia64/include/asm/fb.h b/arch/ia64/include/asm/fb.h
index 0208f64a0da0..bcf982043a5c 100644
--- a/arch/ia64/include/asm/fb.h
+++ b/arch/ia64/include/asm/fb.h
@@ -2,7 +2,9 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
+#include <linux/compiler.h>
 #include <linux/efi.h>
+#include <linux/string.h>
 
 #include <asm/page.h>
 
@@ -18,6 +20,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 }
 #define fb_pgprotect fb_pgprotect
 
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy(to, (void __force *)from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy((void __force *)to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset((void __force *)addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/fb.h
index ff82f20685c8..c6fc7ef374a4 100644
--- a/arch/loongarch/include/asm/fb.h
+++ b/arch/loongarch/include/asm/fb.h
@@ -5,6 +5,27 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
+#include <linux/compiler.h>
+#include <linux/string.h>
+
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy(to, (void __force *)from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy((void __force *)to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset((void __force *)addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 689ee5c60054..077da91aeba1 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -2,6 +2,8 @@
 #ifndef _SPARC_FB_H_
 #define _SPARC_FB_H_
 
+#include <linux/io.h>
+
 struct fb_info;
 struct file;
 struct vm_area_struct;
@@ -16,6 +18,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 int fb_is_primary_device(struct fb_info *info);
 #define fb_is_primary_device fb_is_primary_device
 
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	sbus_memcpy_fromio(to, from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	sbus_memcpy_toio(to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	sbus_memset_io(addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _SPARC_FB_H_ */
diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index c8af99f5a535..0540eccdbeca 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -7,6 +7,7 @@
  * Only include this header file from your architecture's <asm/fb.h>.
  */
 
+#include <linux/io.h>
 #include <linux/mm_types.h>
 #include <linux/pgtable.h>
 
@@ -30,4 +31,105 @@ static inline int fb_is_primary_device(struct fb_info *info)
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
index c0f97160ebbf..eb7e52940c60 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -17,7 +17,6 @@
 #include <linux/slab.h>
 
 #include <asm/fb.h>
-#include <asm/io.h>
 
 struct vm_area_struct;
 struct fb_info;
@@ -513,58 +512,6 @@ struct fb_info {
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
