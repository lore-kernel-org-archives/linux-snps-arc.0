Return-Path: <SRS0=X5Oj=3J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2026C2D0DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA3E2073A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vwxa9v3e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FFSDnNBt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EA3E2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/Dxld4KYcFSBrk+LEWDhYmg0JGrxF0qisipViCIGESU=; b=Vwx
	a9v3elacCg1CpFpz7T+XqeRn/fbPxD29Ke5xQl86KEGXo29x9AvZbBYlIFSHgQX0jtdrHLu6Z+8r+
	LdQdYPkF6fkGvoxM6ZgW9ZqDbpo9tFHovfNkfvoioWaoUqSY1gmNEnExBbwqTbjRFJOzypng4Oiwk
	y1O6AHd6qZ+TmsMZ7IHSh2wNm/7xSvNjQtOph41ehOxuEpYGI1/43EPNRnNgo9G05s36+7UoB9/yM
	CA8pBr5EXl5iLrZOLHSW0YsjjvesTz6utDJOSrOm86uS0q+LkpMCw8KaxEPHL/RzMARlnEEx65RNc
	FRlmTcqB66xd4jSh2GmwfmHM/PGXUmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itURK-0000ds-IS; Mon, 20 Jan 2020 10:37:50 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itURE-0000dA-62
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jan 2020 10:37:48 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7C666405C2;
 Mon, 20 Jan 2020 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579516663; bh=4VpyJ9LY7h1eFa7YAVBdd/Ga6g2mC6n/WGfDRwbjD0s=;
 h=From:To:Cc:Subject:Date:From;
 b=FFSDnNBt25VM4j7BoK4h8N2BpF//Sq4sPaCM0KM3ImChRXiSP8WD8Ibl1wcQPKqic
 7eJmzPqnvpHNg4S46t1kpF5aRXZfNQdscQfM3RrLnXQV+tSOq5yB/or7eSXZyRrTW+
 dMXMWCoaURfGQHuP79jzEN/az8KUxa2MZOMo3AZCAY77txLPKuizUOeEn9Dp9NPtqC
 hVcjEo2HHC620ZwhswF7MQTAXeIJBOwUiCW4Rw33HJXAYEU7Rtgst3R5KovLoeRWth
 kTwBOacy4+oqmX+spazH8WkC/dMdkoMZl0fUIBuYHcocJD0xJ2sl6QQm7aN0eXvn00
 97BSFEdg46OlQ==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id DC0DEA005C;
 Mon, 20 Jan 2020 10:37:40 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [PATCH] ARC: Switch to generic accessors
Date: Mon, 20 Jan 2020 13:37:38 +0300
Message-Id: <20200120103738.47751-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_023744_230808_B2B7F37F 
X-CRM114-Status: GOOD (  13.62  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, uboot-snps-arc@synopsys.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

First of all U-Boot is not that performance oriented as real run-time
software like OS or user bare-metal app so we may afford being not super
fast as we only being executed once. That in return allows us to be more
universal and support wider variety of devices.

And looking forward that will significantly reduce maintenance and simplify
support of newer architectures.

And while at it we add quad-word accessors like readq(), writeq() etc.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/arc/include/asm/io.h | 204 +++++++++++++++++-----------------------------
 1 file changed, 75 insertions(+), 129 deletions(-)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index fa844b54f4..70d050590d 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * Copyright (C) 2013-2014 Synopsys, Inc. All rights reserved.
+ * Copyright (C) 2013-2014, 2020 Synopsys, Inc. All rights reserved.
  */
 
 #ifndef __ASM_ARC_IO_H
@@ -54,135 +54,98 @@ static inline void sync(void)
 	/* Not yet implemented */
 }
 
-static inline u8 __raw_readb(const volatile void __iomem *addr)
-{
-	u8 b;
+#define __arch_getb(a)		(*(unsigned char *)(a))
+#define __arch_getw(a)		(*(unsigned short *)(a))
+#define __arch_getl(a)		(*(unsigned int *)(a))
+#define __arch_getq(a)		(*(unsigned long long *)(a))
 
-	__asm__ __volatile__("ldb%U1	%0, %1\n"
-			     : "=r" (b)
-			     : "m" (*(volatile u8 __force *)addr)
-			     : "memory");
-	return b;
-}
+#define __arch_putb(v, a)	(*(unsigned char *)(a) = (v))
+#define __arch_putw(v, a)	(*(unsigned short *)(a) = (v))
+#define __arch_putl(v, a)	(*(unsigned int *)(a) = (v))
+#define __arch_putq(v, a)	(*(unsigned long long *)(a) = (v))
 
-static inline u16 __raw_readw(const volatile void __iomem *addr)
-{
-	u16 s;
+#define __raw_writeb(v, a)	__arch_putb(v, a)
+#define __raw_writew(v, a)	__arch_putw(v, a)
+#define __raw_writel(v, a)	__arch_putl(v, a)
+#define __raw_writeq(v, a)	__arch_putq(v, a)
 
-	__asm__ __volatile__("ldw%U1	%0, %1\n"
-			     : "=r" (s)
-			     : "m" (*(volatile u16 __force *)addr)
-			     : "memory");
-	return s;
-}
+#define __raw_readb(a)		__arch_getb(a)
+#define __raw_readw(a)		__arch_getw(a)
+#define __raw_readl(a)		__arch_getl(a)
+#define __raw_readq(a)		__arch_getq(a)
 
-static inline u32 __raw_readl(const volatile void __iomem *addr)
+static inline void __raw_writesb(unsigned long addr, const void *data,
+				 int bytelen)
 {
-	u32 w;
+	u8 *buf = (uint8_t *)data;
 
-	__asm__ __volatile__("ld%U1	%0, %1\n"
-			     : "=r" (w)
-			     : "m" (*(volatile u32 __force *)addr)
-			     : "memory");
-	return w;
+	while (bytelen--)
+		__arch_putb(*buf++, addr);
 }
 
-static inline void __raw_writeb(u8 b, volatile void __iomem *addr)
+static inline void __raw_writesw(unsigned long addr, const void *data,
+				 int wordlen)
 {
-	__asm__ __volatile__("stb%U1	%0, %1\n"
-			     :
-			     : "r" (b), "m" (*(volatile u8 __force *)addr)
-			     : "memory");
-}
+	u16 *buf = (uint16_t *)data;
 
-static inline void __raw_writew(u16 s, volatile void __iomem *addr)
-{
-	__asm__ __volatile__("stw%U1	%0, %1\n"
-			     :
-			     : "r" (s), "m" (*(volatile u16 __force *)addr)
-			     : "memory");
+	while (wordlen--)
+		__arch_putw(*buf++, addr);
 }
 
-static inline void __raw_writel(u32 w, volatile void __iomem *addr)
+static inline void __raw_writesl(unsigned long addr, const void *data,
+				 int longlen)
 {
-	__asm__ __volatile__("st%U1	%0, %1\n"
-			     :
-			     : "r" (w), "m" (*(volatile u32 __force *)addr)
-			     : "memory");
-}
+	u32 *buf = (uint32_t *)data;
 
-static inline int __raw_readsb(unsigned int addr, void *data, int bytelen)
-{
-	__asm__ __volatile__ ("1:ld.di	r8, [r0]\n"
-			      "sub.f	r2, r2, 1\n"
-			      "bnz.d	1b\n"
-			      "stb.ab	r8, [r1, 1]\n"
-			      :
-			      : "r" (addr), "r" (data), "r" (bytelen)
-			      : "r8");
-	return bytelen;
+	while (longlen--)
+		__arch_putl(*buf++, addr);
 }
 
-static inline int __raw_readsw(unsigned int addr, void *data, int wordlen)
+static inline void __raw_readsb(unsigned long addr, void *data, int bytelen)
 {
-	__asm__ __volatile__ ("1:ld.di	r8, [r0]\n"
-			      "sub.f	r2, r2, 1\n"
-			      "bnz.d	1b\n"
-			      "stw.ab	r8, [r1, 2]\n"
-			      :
-			      : "r" (addr), "r" (data), "r" (wordlen)
-			      : "r8");
-	return wordlen;
-}
+	u8 *buf = (uint8_t *)data;
 
-static inline int __raw_readsl(unsigned int addr, void *data, int longlen)
-{
-	__asm__ __volatile__ ("1:ld.di	r8, [r0]\n"
-			      "sub.f	r2, r2, 1\n"
-			      "bnz.d	1b\n"
-			      "st.ab	r8, [r1, 4]\n"
-			      :
-			      : "r" (addr), "r" (data), "r" (longlen)
-			      : "r8");
-	return longlen;
+	while (bytelen--)
+		*buf++ = __arch_getb(addr);
 }
 
-static inline int __raw_writesb(unsigned int addr, void *data, int bytelen)
+static inline void __raw_readsw(unsigned long addr, void *data, int wordlen)
 {
-	__asm__ __volatile__ ("1:ldb.ab	r8, [r1, 1]\n"
-			      "sub.f	r2, r2, 1\n"
-			      "bnz.d	1b\n"
-			      "st.di	r8, [r0, 0]\n"
-			      :
-			      : "r" (addr), "r" (data), "r" (bytelen)
-			      : "r8");
-	return bytelen;
-}
+	u16 *buf = (uint16_t *)data;
 
-static inline int __raw_writesw(unsigned int addr, void *data, int wordlen)
-{
-	__asm__ __volatile__ ("1:ldw.ab	r8, [r1, 2]\n"
-			      "sub.f	r2, r2, 1\n"
-			      "bnz.d	1b\n"
-			      "st.ab.di	r8, [r0, 0]\n"
-			      :
-			      : "r" (addr), "r" (data), "r" (wordlen)
-			      : "r8");
-	return wordlen;
+	while (wordlen--)
+		*buf++ = __arch_getw(addr);
 }
 
-static inline int __raw_writesl(unsigned int addr, void *data, int longlen)
+static inline void __raw_readsl(unsigned long addr, void *data, int longlen)
 {
-	__asm__ __volatile__ ("1:ld.ab	r8, [r1, 4]\n"
-			      "sub.f	r2, r2, 1\n"
-			      "bnz.d	1b\n"
-			      "st.ab.di	r8, [r0, 0]\n"
-			      :
-			      : "r" (addr), "r" (data), "r" (longlen)
-			      : "r8");
-	return longlen;
+	u32 *buf = (uint32_t *)data;
+
+	while (longlen--)
+		*buf++ = __arch_getl(addr);
 }
 
+/*
+ * Relaxed I/O memory access primitives. These follow the Device memory
+ * ordering rules but do not guarantee any ordering relative to Normal memory
+ * accesses.
+ */
+#define readb_relaxed(c)	({ u8  __r = __raw_readb(c); __r; })
+#define readw_relaxed(c)	({ u16 __r = le16_to_cpu((__force __le16) \
+						__raw_readw(c)); __r; })
+#define readl_relaxed(c)	({ u32 __r = le32_to_cpu((__force __le32) \
+						__raw_readl(c)); __r; })
+#define readq_relaxed(c)	({ u64 __r = le64_to_cpu((__force __le64) \
+						__raw_readq(c)); __r; })
+
+#define writeb_relaxed(v, c)	((void)__raw_writeb((v), (c)))
+#define writew_relaxed(v, c)	((void)__raw_writew((__force u16) \
+						    cpu_to_le16(v), (c)))
+#define writel_relaxed(v, c)	((void)__raw_writel((__force u32) \
+						    cpu_to_le32(v), (c)))
+#define writeq_relaxed(v, c)	((void)__raw_writeq((__force u64) \
+						    cpu_to_le64(v), (c)))
+
 /*
  * MMIO can also get buffered/optimized in micro-arch, so barriers needed
  * Based on ARM model for the typical use case
@@ -195,32 +158,15 @@ static inline int __raw_writesl(unsigned int addr, void *data, int longlen)
  *
  * http://lkml.kernel.org/r/20150622133656.GG1583@arm.com
  */
-#define readb(c)		({ u8  __v = readb_relaxed(c); __iormb(); __v; })
-#define readw(c)		({ u16 __v = readw_relaxed(c); __iormb(); __v; })
-#define readl(c)		({ u32 __v = readl_relaxed(c); __iormb(); __v; })
-
-#define writeb(v,c)		({ __iowmb(); writeb_relaxed(v,c); })
-#define writew(v,c)		({ __iowmb(); writew_relaxed(v,c); })
-#define writel(v,c)		({ __iowmb(); writel_relaxed(v,c); })
-
-/*
- * Relaxed API for drivers which can handle barrier ordering themselves
- *
- * Also these are defined to perform little endian accesses.
- * To provide the typical device register semantics of fixed endian,
- * swap the byte order for Big Endian
- *
- * http://lkml.kernel.org/r/201603100845.30602.arnd@arndb.de
- */
-#define readb_relaxed(c)	__raw_readb(c)
-#define readw_relaxed(c) ({ u16 __r = le16_to_cpu((__force __le16) \
-					__raw_readw(c)); __r; })
-#define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
-					__raw_readl(c)); __r; })
-
-#define writeb_relaxed(v,c)	__raw_writeb(v,c)
-#define writew_relaxed(v,c)	__raw_writew((__force u16) cpu_to_le16(v),c)
-#define writel_relaxed(v,c)	__raw_writel((__force u32) cpu_to_le32(v),c)
+#define readb(c)	({ u8  __v = readb_relaxed(c); __iormb(); __v; })
+#define readw(c)	({ u16 __v = readw_relaxed(c); __iormb(); __v; })
+#define readl(c)	({ u32 __v = readl_relaxed(c); __iormb(); __v; })
+#define readq(c)	({ u64 __v = readq_relaxed(c); __iormb(); __v; })
+
+#define writeb(v, c)	({ __iowmb(); writeb_relaxed(v, c); })
+#define writew(v, c)	({ __iowmb(); writew_relaxed(v, c); })
+#define writel(v, c)	({ __iowmb(); writel_relaxed(v, c); })
+#define writeq(v, c)	({ __iowmb(); writeq_relaxed(v, c); })
 
 #define out_arch(type, endian, a, v)	__raw_write##type(cpu_to_##endian(v), a)
 #define in_arch(type, endian, a)	endian##_to_cpu(__raw_read##type(a))
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
