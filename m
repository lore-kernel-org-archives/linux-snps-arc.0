Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DA9C00144
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Aug 2022 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hUawFz83G+EKKlzysSX0rqMNJ2IdodySryHbMkUmEE=; b=CKlKAXgopjSj4r
	DuPQQlUK2DwhOMZZdjwMUAB9WCeW8RCEGlFSLtXBKkswW/l6VlWMR4r4cmUEYh6QWYgl1cTnR/E2h
	iy/YheORNZssCT5lFh7KZbDTP0MECOhv1n18c+ZbRYZmvGm1AVvTOMfXByTC7zXIsy7RIB7YQ5k/u
	vvJJAyI5z9fZPwrx4m3w2cJBF0j9+axM6oZa7aan0V6DdOIjo1i/Ay6feKuJhoJyJA4EcLYATesFj
	T22di7uusM1pZzXgzWFneox7mvhP6AuZ8DZNT0/eiarkEGodA58sYyQMCBptaBJ9APK/1FKfWuHIW
	VfguodlrFkUKtwRw//vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWc5-0078eg-3j; Mon, 01 Aug 2022 14:41:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWbV-0078C1-4q
	for linux-snps-arc@lists.infradead.org; Mon, 01 Aug 2022 14:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659364868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4t1/0IxJa6CSuWSxZNOTLOA5QGMU9OZhYQRkkYe7p6I=;
	b=f1VhD0pZ7SkeyRbAT8x77DfgtBdTJB2WbVpUdHVrk+CD3vxjR3Y12CcDW0Jp5jxsARHusT
	Gqwo4d5nzlKqvtvDqrdKnaqpspM5rQ/Je6ufLbaUsgxCpFzwGr0bWMLc7NzoKTGkK9RBDS
	zvR0UfiaFkoINKzipf3X0wWDitYZyek=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-0zvBQuswOaeEa8TYB4iQBQ-1; Mon, 01 Aug 2022 10:41:03 -0400
X-MC-Unique: 0zvBQuswOaeEa8TYB4iQBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1CD33C2F761;
	Mon,  1 Aug 2022 14:41:02 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-103.pek2.redhat.com [10.72.12.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13F21141510F;
	Mon,  1 Aug 2022 14:40:51 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	hch@infradead.org,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	Baoquan He <bhe@redhat.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 04/11] arc: mm: Convert to GENERIC_IOREMAP
Date: Mon,  1 Aug 2022 22:40:22 +0800
Message-Id: <20220801144029.57829-5-bhe@redhat.com>
In-Reply-To: <20220801144029.57829-1-bhe@redhat.com>
References: <20220801144029.57829-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_074109_270993_CA56D4DF 
X-CRM114-Status: GOOD (  17.37  )
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

Add hooks ioremap_allowed() and iounmap_allowed() for arc's special
operation when ioremap_prot() and iounmap(). Meanwhile define and
implement arc's own ioremap() because arc has some special handling
in ioremap() than standard ioremap().

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/Kconfig          |  1 +
 arch/arc/include/asm/io.h | 19 +++++++++----
 arch/arc/mm/ioremap.c     | 60 ++++++---------------------------------
 3 files changed, 24 insertions(+), 56 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 9e3653253ef2..a08d2abfaf61 100644
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
index 8f777d6441a5..10d7ed9dfa61 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -20,9 +20,20 @@
 #define __iowmb()		do { } while (0)
 #endif
 
-extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
-extern void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
-				  unsigned long flags);
+/*
+ * I/O memory mapping functions.
+ */
+
+void __iomem *
+ioremap_allowed(phys_addr_t *paddr, size_t size, unsigned long *prot_val);
+#define ioremap_allowed ioremap_allowed
+
+int iounmap_allowed(void __iomem *addr);
+#define iounmap_allowed iounmap_allowed
+
+void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
+#define ioremap ioremap
+
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
 	return (void __iomem *)port;
@@ -32,8 +43,6 @@ static inline void ioport_unmap(void __iomem *addr)
 {
 }
 
-extern void iounmap(const void __iomem *addr);
-
 /*
  * io{read,write}{16,32}be() macros
  */
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 0ee75aca6e10..7be73e3645da 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -25,13 +25,6 @@ static inline bool arc_uncached_addr_space(phys_addr_t paddr)
 
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
@@ -44,62 +37,27 @@ void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
 }
 EXPORT_SYMBOL(ioremap);
 
-/*
- * ioremap with access flags
- * Cache semantics wise it is same as ioremap - "forced" uncached.
- * However unlike vanilla ioremap which bypasses ARC MMU for addresses in
- * ARC hardware uncached region, this one still goes thru the MMU as caller
- * might need finer access control (R/W/X)
- */
-void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
-			   unsigned long flags)
+void __iomem *
+ioremap_allowed(phys_addr_t *paddr, size_t size, unsigned long *prot_val)
 {
-	unsigned int off;
-	unsigned long vaddr;
-	struct vm_struct *area;
-	phys_addr_t end;
-	pgprot_t prot = __pgprot(flags);
-
-	/* Don't allow wraparound, zero size */
-	end = paddr + size - 1;
-	if ((!size) || (end < paddr))
-		return NULL;
+	int ret = -EINVAL;
 
 	/* An early platform driver might end up here */
 	if (!slab_is_available())
-		return NULL;
+		return IOMEM_ERR_PTR(ret);
 
 	/* force uncached */
-	prot = pgprot_noncached(prot);
+	*prot_val = pgprot_val(pgprot_noncached(__pgprot(*prot_val)));
 
-	/* Mappings have to be page-aligned */
-	off = paddr & ~PAGE_MASK;
-	paddr &= PAGE_MASK_PHYS;
-	size = PAGE_ALIGN(end + 1) - paddr;
+	return NULL;
 
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
 }
-EXPORT_SYMBOL(ioremap_prot);
-
 
-void iounmap(const void __iomem *addr)
+int iounmap_allowed(void __iomem *addr)
 {
 	/* weird double cast to handle phys_addr_t > 32 bits */
 	if (arc_uncached_addr_space((phys_addr_t)(u32)addr))
-		return;
+		return -EINVAL;
 
-	vfree((void *)(PAGE_MASK & (unsigned long __force)addr));
+	return 0;
 }
-EXPORT_SYMBOL(iounmap);
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
