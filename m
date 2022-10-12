Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBCBC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Oct 2022 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOzCs4c+BUhBNFhgj6xOkycsM48UTq2sGQIIGXZ/YHU=; b=PqiPt83louY8tS
	tISwzSx41x5vOL79Zd89mYEfLK1FDhP79fXma3SO0ezS3w/crx9358AvT4hCrhKrqvW3zTiwiAHtE
	TtVm2DKvBPWflhuPzFZXVOx7RYPIXmVYwuwEnjF20ZA+uAa0MK3kXZAxrDRFwh6tK6/ELNDinj1Op
	PJyTITp4k0r4atNZ1/Xb99xdac1dt2jSf8htFC+hDWrbyLvxC1OG3hR5AvSoiGIkfzSvXfJUwHcos
	cMqc2UOdFKP93UMiwM+NZP9TxOqGZL4EnkyYJ6O8sfRw5iXztpnEV1LdXea6R9fK3Efllk4CjbY0Z
	turC6FNR1SyD5pMPJ/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYgu-007bEs-VZ; Wed, 12 Oct 2022 10:10:20 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYgr-007bBF-62
	for linux-snps-arc@lists.infradead.org; Wed, 12 Oct 2022 10:10:19 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MnT0y36Nhz9sml;
	Wed, 12 Oct 2022 12:10:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNbwy0pJcXy2; Wed, 12 Oct 2022 12:10:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MnT0w5v3Sz9sn4;
	Wed, 12 Oct 2022 12:10:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B12248B77B;
	Wed, 12 Oct 2022 12:10:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xrrLdeQbkJz9; Wed, 12 Oct 2022 12:10:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.127])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EE2178B763;
	Wed, 12 Oct 2022 12:10:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 29CA9xsV1165795
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 12:09:59 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 29CA9xQ31165794;
	Wed, 12 Oct 2022 12:09:59 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Baoquan He <bhe@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        akpm@linux-foundation.org, hch@infradead.org, agordeev@linux.ibm.com,
        wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
        David.Laight@ACULAB.COM, shorne@gmail.com,
        Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [RFC PATCH 5/8] arc: mm: Convert to GENERIC_IOREMAP
Date: Wed, 12 Oct 2022 12:09:41 +0200
Message-Id: <75718e9104633bad3c71e0c7a9e931864f59dee0.1665568707.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1665568707.git.christophe.leroy@csgroup.eu>
References: <cover.1665568707.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665569382; l=4421; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=I9YpOCQ8Zh4nRQnIk0k/uARdifFzSigtDi071xtQNOY=; b=fTxFGL4T5gFnKWBLwOouOC5OXfC/s0hbcSCg9/Nk032xr85dN+aJ6fKtMjsMmH2dJ6K15+lAaO0S +hIjyilZA3MP8yPD0CexQfIM6+HNo7k4X+ivB6QE/Hm7Kow6qsMc
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_031017_411126_C5156927 
X-CRM114-Status: GOOD (  14.27  )
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

From: Baoquan He <bhe@redhat.com>

By taking GENERIC_IOREMAP method, the generic ioremap_prot() and
iounmap() are visible and available to arch. Arch only needs to
provide implementation of arch_ioremap() or arch_iounmap() if there's
arch specific handling needed in its ioremap() or iounmap(). This
change will simplify implementation by removing duplicated codes with
generic ioremap() and iounmap(), and has the equivalent functioality
as before.

Here, add hooks arch_ioremap() and arch_iounmap() for arc's special
operation when ioremap_prot() and iounmap(). Meanwhile define and
implement arc's own ioremap() because arc has some special handling
in ioremap() than standard ioremap().

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/arc/Kconfig          |  1 +
 arch/arc/include/asm/io.h |  7 +++---
 arch/arc/mm/ioremap.c     | 46 +++------------------------------------
 3 files changed, 8 insertions(+), 46 deletions(-)

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
index 8f777d6441a5..53b0f1e4f276 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -21,8 +21,8 @@
 #endif
 
 extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
-extern void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
-				  unsigned long flags);
+#define ioremap ioremap
+#define ioremap_prot ioremap_prot
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
 	return (void __iomem *)port;
@@ -32,7 +32,8 @@ static inline void ioport_unmap(void __iomem *addr)
 {
 }
 
-extern void iounmap(const void __iomem *addr);
+bool iounmap_allowed(void *addr);
+#define iounmap_allowed iounmap_allowed
 
 /*
  * io{read,write}{16,32}be() macros
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 0ee75aca6e10..02b750abccee 100644
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
@@ -54,52 +47,19 @@ EXPORT_SYMBOL(ioremap);
 void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
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
 	/* An early platform driver might end up here */
 	if (!slab_is_available())
 		return NULL;
 
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
-void iounmap(const void __iomem *addr)
+bool iounmap_allowed(void *addr)
 {
 	/* weird double cast to handle phys_addr_t > 32 bits */
-	if (arc_uncached_addr_space((phys_addr_t)(u32)addr))
-		return;
-
-	vfree((void *)(PAGE_MASK & (unsigned long __force)addr));
+	return !arc_uncached_addr_space((phys_addr_t)(u32)addr);
 }
-EXPORT_SYMBOL(iounmap);
-- 
2.37.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
