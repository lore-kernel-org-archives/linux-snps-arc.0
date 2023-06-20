Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489A0EB64DC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Jun 2023 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5Um6/x/I3MjIJeZUsn/4Q4ga4t7XaxH/9SDXPXibXc=; b=AAjAIzJy6Hvie9
	sCVMHrH76T3G9VPp7X6th8Dhw0/R7IEQAn7DMAGm5PQIfFyUj295JB1GSfQcIGdYQbHnuQzWiAaCt
	ohq6f/SdoN9qJ6hvQbshfYbkGL3FLTxTQR4BPzWBDAzvbEdP9p9WIHopjNXOlqZpOspk+8u6EVbEC
	BBS1zzRzXVseqqsYoiG2Dgb6uvvdT5OVHT/V+K12O93n0P3F8eZoXF0eSJ5Phsvp8lHobxkmKCPVT
	srCz25H1ypRNY2DjTEwaUu80cvdtbRhoso4Vqp/8zbGdvn2JjXrFxajC1bbjL2/U95eAvVH2/iY0F
	f9jdId3vUdfhac9NojNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbD0-00BLgr-0T;
	Tue, 20 Jun 2023 13:15:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbCx-00BLfw-1E
	for linux-snps-arc@lists.infradead.org;
	Tue, 20 Jun 2023 13:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687266942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgITI2yqguKz3xZ3AEWeb8MIawpkLomY+LhKu59PhRc=;
	b=YPDXzekpMz3omAFY/89GS4OhZ7JNL2NpYlTaw2FLG2wqHsD1xHAyCSuXhslykdYU/FEoHg
	hvfWrFeiLBuPoVzFI71MhHZJZMD3+ozarNam5eqtzOp8vWCrqqpWvdUq7JlTo2KjopfHyH
	Oiew/ilZTIEz5H0q3FsFOYLe+bgRpTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-2PC6h92vMtusrC1Vh20AjQ-1; Tue, 20 Jun 2023 09:15:29 -0400
X-MC-Unique: 2PC6h92vMtusrC1Vh20AjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D773788D06E;
	Tue, 20 Jun 2023 13:15:12 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-166.pek2.redhat.com [10.72.12.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20176C1ED96;
	Tue, 20 Jun 2023 13:15:03 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	arnd@arndb.de,
	hch@lst.de,
	christophe.leroy@csgroup.eu,
	rppt@kernel.org,
	willy@infradead.org,
	agordeev@linux.ibm.com,
	wangkefeng.wang@huawei.com,
	schnelle@linux.ibm.com,
	David.Laight@ACULAB.COM,
	shorne@gmail.com,
	deller@gmx.de,
	nathan@kernel.org,
	glaubitz@physik.fu-berlin.de,
	Baoquan He <bhe@redhat.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v7 07/19] arc: mm: Convert to GENERIC_IOREMAP
Date: Tue, 20 Jun 2023 21:13:44 +0800
Message-Id: <20230620131356.25440-8-bhe@redhat.com>
In-Reply-To: <20230620131356.25440-1-bhe@redhat.com>
References: <20230620131356.25440-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_061543_487010_30C054D4 
X-CRM114-Status: GOOD (  17.07  )
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

By taking GENERIC_IOREMAP method, the generic generic_ioremap_prot(),
generic_iounmap(), and their generic wrapper ioremap_prot(), ioremap()
and iounmap() are all visible and available to arch. Arch needs to
provide wrapper functions to override the generic versions if there's
arch specific handling in its ioremap_prot(), ioremap() or iounmap().
This change will simplify implementation by removing duplicated codes
with generic_ioremap_prot() and generic_iounmap(), and has the equivalent
functioality as before.

Here, add wrapper functions ioremap_prot() and iounmap() for arc's
special operation when ioremap_prot() and iounmap().

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/Kconfig          |  1 +
 arch/arc/include/asm/io.h |  7 +++---
 arch/arc/mm/ioremap.c     | 49 ++++-----------------------------------
 3 files changed, 8 insertions(+), 49 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index ab6d701365bb..3a666ee0c0bc 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -26,6 +26,7 @@ config ARC
 	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
+	select GENERIC_IOREMAP
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARC_MMU_V4
diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index 80347382a380..4fdb7350636c 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -21,8 +21,9 @@
 #endif
 
 extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
-extern void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
-				  unsigned long flags);
+#define ioremap ioremap
+#define ioremap_prot ioremap_prot
+#define iounmap iounmap
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
 	return (void __iomem *)port;
@@ -32,8 +33,6 @@ static inline void ioport_unmap(void __iomem *addr)
 {
 }
 
-extern void iounmap(const volatile void __iomem *addr);
-
 /*
  * io{read,write}{16,32}be() macros
  */
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 712c2311daef..b07004d53267 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/mm.h>
-#include <linux/slab.h>
 #include <linux/cache.h>
 
 static inline bool arc_uncached_addr_space(phys_addr_t paddr)
@@ -25,13 +24,6 @@ static inline bool arc_uncached_addr_space(phys_addr_t paddr)
 
 void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
 {
-	phys_addr_t end;
-
-	/* Don't allow wraparound or zero size */
-	end = paddr + size - 1;
-	if (!size || (end < paddr))
-		return NULL;
-
 	/*
 	 * If the region is h/w uncached, MMU mapping can be elided as optim
 	 * The cast to u32 is fine as this region can only be inside 4GB
@@ -51,55 +43,22 @@ EXPORT_SYMBOL(ioremap);
  * ARC hardware uncached region, this one still goes thru the MMU as caller
  * might need finer access control (R/W/X)
  */
-void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
+void __iomem *ioremap_prot(phys_addr_t paddr, size_t size,
 			   unsigned long flags)
 {
-	unsigned int off;
-	unsigned long vaddr;
-	struct vm_struct *area;
-	phys_addr_t end;
 	pgprot_t prot = __pgprot(flags);
 
-	/* Don't allow wraparound, zero size */
-	end = paddr + size - 1;
-	if ((!size) || (end < paddr))
-		return NULL;
-
-	/* An early platform driver might end up here */
-	if (!slab_is_available())
-		return NULL;
-
 	/* force uncached */
-	prot = pgprot_noncached(prot);
-
-	/* Mappings have to be page-aligned */
-	off = paddr & ~PAGE_MASK;
-	paddr &= PAGE_MASK_PHYS;
-	size = PAGE_ALIGN(end + 1) - paddr;
-
-	/*
-	 * Ok, go for it..
-	 */
-	area = get_vm_area(size, VM_IOREMAP);
-	if (!area)
-		return NULL;
-	area->phys_addr = paddr;
-	vaddr = (unsigned long)area->addr;
-	if (ioremap_page_range(vaddr, vaddr + size, paddr, prot)) {
-		vunmap((void __force *)vaddr);
-		return NULL;
-	}
-	return (void __iomem *)(off + (char __iomem *)vaddr);
+	return generic_ioremap_prot(paddr, size, pgprot_noncached(prot));
 }
 EXPORT_SYMBOL(ioremap_prot);
 
-
-void iounmap(const volatile void __iomem *addr)
+void iounmap(volatile void __iomem *addr)
 {
 	/* weird double cast to handle phys_addr_t > 32 bits */
 	if (arc_uncached_addr_space((phys_addr_t)(u32)addr))
 		return;
 
-	vfree((void *)(PAGE_MASK & (unsigned long __force)addr));
+	generic_iounmap(addr);
 }
 EXPORT_SYMBOL(iounmap);
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
