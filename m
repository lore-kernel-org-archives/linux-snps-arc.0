Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211D8C28D13
	for <linux-snps-arc@archiver.kernel.org>; Sat, 20 Aug 2022 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q93Rl2efE8S8pfD/3taqQje06X5ZjKY6yXMyi0TlUVA=; b=G+r4k/DXzM9P4P
	qMc9czDr5Ry24vWbrqOyjyAJ4/QEZjS/DjgnTZf+v4cTJW0CREshXuPMRdVN8puNSf30Pnm2RxMLX
	rotPJCWseSi9oBPV48xxOmLuAGPFJX6O4xIap5e2gVYJaVrFbXM+9j0aNvJBhBftEbVscki9ZOZos
	p0nisXdTnxEt3kXmuLoo4TnZPoIs0VYWEyr6zCuMVXT7gVFmqRSswh02ghbBjoACYKUQ+Ib4hv1M8
	TdSLD90rHMQTAmrQ5FBPPJFodR+qX5KpZV7XVklgg2oPfp+wE3G4/9CAQsHguWRrSvop+lgSmlP6A
	Gy0TCIQUqYRSNpZFUxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPCPd-00Dx46-Tc; Sat, 20 Aug 2022 00:32:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPCP6-00Dwcr-5g
	for linux-snps-arc@lists.infradead.org; Sat, 20 Aug 2022 00:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660955515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Prjexb05+PeJL7mfd5Q9k/PdLDG/qCdG1Ri1UhBrmfs=;
	b=X3jbTE06DitgORGQhV6WEfJEaW7KBj7XskqKF0/oURDRV5Qup7IkzrQGMWyaponZMvWZ2i
	0Q4PgCawco9kNZCrg+N0AnI/2YmdfRkkiS1bjz56207b0UIhvnuKPUKREwhhGSMKREAWaw
	6RvZYG0bCpFJxhgBbP3opDgYHQu55OI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-3DboBJwJNTG8efwnNL7zjw-1; Fri, 19 Aug 2022 20:31:52 -0400
X-MC-Unique: 3DboBJwJNTG8efwnNL7zjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7D0A3804502;
	Sat, 20 Aug 2022 00:31:51 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-17.pek2.redhat.com [10.72.12.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 164504010D2A;
	Sat, 20 Aug 2022 00:31:46 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	hch@infradead.org,
	agordeev@linux.ibm.com,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	Baoquan He <bhe@redhat.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 04/11] arc: mm: Convert to GENERIC_IOREMAP
Date: Sat, 20 Aug 2022 08:31:18 +0800
Message-Id: <20220820003125.353570-5-bhe@redhat.com>
In-Reply-To: <20220820003125.353570-1-bhe@redhat.com>
References: <20220820003125.353570-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_173156_297907_A071B243 
X-CRM114-Status: GOOD (  16.18  )
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

Add hooks arch_ioremap() and arch_iounmap() for arc's special
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
 3 files changed, 23 insertions(+), 57 deletions(-)

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
index 8f777d6441a5..af88a2c5550e 100644
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
+arch_ioremap(phys_addr_t *paddr, size_t size, unsigned long *prot_val);
+#define arch_ioremap arch_ioremap
+
+int arch_iounmap(void __iomem *addr);
+#define arch_iounmap arch_iounmap
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
index 0ee75aca6e10..72b01da31ea1 100644
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
@@ -44,62 +37,25 @@ void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
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
+arch_ioremap(phys_addr_t *paddr, size_t size, unsigned long *prot_val)
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
-
 	/* An early platform driver might end up here */
 	if (!slab_is_available())
-		return NULL;
+		return IOMEM_ERR_PTR(-EINVAL);
 
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
+int arch_iounmap(void __iomem *addr)
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
