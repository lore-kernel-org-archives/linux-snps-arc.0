Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D77C352A1
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Dec 2022 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlaIfFgbS03a3z5dIWgk2k4+9J7JTThtROfYQ6NW5FY=; b=JXINeyfCuHoA9k
	iROziD0VDhqgdKXJl5FntSzk8nvJ8TzVl4wr14v90Tb5a43NXYreJ+KhZFhLzTF51f39E/TSPnBzE
	1LSjRmZErUyy9Ja7EIUU3sPDjb/SN8FYbsxRYfKSYLnvTJOEO1MUxXzPrukJYGdQgX20VXPRqu+SH
	tFWsc/7gF6ShfNUUzOLF+UgrtBBdO7DJLmP4z2VyTMAL848Fb6JiAYKIQhyGeypwggTHcxIIotU2z
	NbhTYr3IJ8YNmATfJJ85aKFglYIQwBhIS+hiKuydc+4GQj96ovA8ku92mif8vGQkGaD3lA7FxXP+b
	gh+tCEBTqZKQB7Gwg/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ZaF-00C3cd-3V; Tue, 06 Dec 2022 15:10:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ZH9-00BieJ-BR
	for linux-snps-arc@lists.infradead.org; Tue, 06 Dec 2022 14:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o58ZygDWZUVUa0aPclLuAuKtIdtSgpg5ZeaH/mRAX58=;
	b=AejZhCX+UczOCSI+Q5Y6UwP0CP/GEFsdc3CSAcWVlFhRk6eVNgBv5Fld+36CRIwcRfb3iP
	6KnOSikjjrHuqFZG6DsoQhW71PqW+CCIJiXQdY58Pgoxv1PZ90F06szqwsU6uxJdCZ8Y7+
	anVGa2NGWpa636V/w7cZeKNd2W+ei/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-pN_-CD0VOWunzWbGG_vvRA-1; Tue, 06 Dec 2022 09:50:21 -0500
X-MC-Unique: pN_-CD0VOWunzWbGG_vvRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B62C2185A7AB;
	Tue,  6 Dec 2022 14:50:19 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C336492B07;
	Tue,  6 Dec 2022 14:50:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Yang Shi <shy828301@gmail.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Nadav Amit <namit@vmware.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH mm-unstable RFC 21/26] sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit
Date: Tue,  6 Dec 2022 15:47:25 +0100
Message-Id: <20221206144730.163732-22-david@redhat.com>
In-Reply-To: <20221206144730.163732-1-david@redhat.com>
References: <20221206144730.163732-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_065027_508669_62DDA566 
X-CRM114-Status: GOOD (  15.53  )
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

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by reusing the SRMMU_DIRTY
bit as that seems to be safe to reuse inside a swap PTE. This avoids
having to steal one bit from the swap offset.

While at it, relocate the swap PTE layout documentation and use the same
style now used for most other archs. Note that the old documentation was
wrong: we use 20 bit for the offset and the reserved bits were 8 instead
of 7 bits in the ascii art.

Cc: "David S. Miller" <davem@davemloft.net>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/sparc/include/asm/pgtable_32.h | 27 ++++++++++++++++++++++++++-
 arch/sparc/include/asm/pgtsrmmu.h   | 14 +++-----------
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 5acc05b572e6..abf7a2601209 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -323,7 +323,16 @@ void srmmu_mapiorange(unsigned int bus, unsigned long xpa,
                       unsigned long xva, unsigned int len);
 void srmmu_unmapiorange(unsigned long virt_addr, unsigned int len);
 
-/* Encode and de-code a swap entry */
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <-------------- offset ---------------> < type -> E 0 0 0 0 0 0
+ */
 static inline unsigned long __swp_type(swp_entry_t entry)
 {
 	return (entry.val >> SRMMU_SWP_TYPE_SHIFT) & SRMMU_SWP_TYPE_MASK;
@@ -344,6 +353,22 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & SRMMU_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return __pte(pte_val(pte) | SRMMU_SWP_EXCLUSIVE);
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~SRMMU_SWP_EXCLUSIVE);
+}
+
 static inline unsigned long
 __get_phys (unsigned long addr)
 {
diff --git a/arch/sparc/include/asm/pgtsrmmu.h b/arch/sparc/include/asm/pgtsrmmu.h
index 6067925972d9..18e68d43f036 100644
--- a/arch/sparc/include/asm/pgtsrmmu.h
+++ b/arch/sparc/include/asm/pgtsrmmu.h
@@ -53,21 +53,13 @@
 
 #define SRMMU_CHG_MASK    (0xffffff00 | SRMMU_REF | SRMMU_DIRTY)
 
-/* SRMMU swap entry encoding
- *
- * We use 5 bits for the type and 19 for the offset.  This gives us
- * 32 swapfiles of 4GB each.  Encoding looks like:
- *
- * oooooooooooooooooootttttRRRRRRRR
- * fedcba9876543210fedcba9876543210
- *
- * The bottom 7 bits are reserved for protection and status bits, especially
- * PRESENT.
- */
+/* SRMMU swap entry encoding */
 #define SRMMU_SWP_TYPE_MASK	0x1f
 #define SRMMU_SWP_TYPE_SHIFT	7
 #define SRMMU_SWP_OFF_MASK	0xfffff
 #define SRMMU_SWP_OFF_SHIFT	(SRMMU_SWP_TYPE_SHIFT + 5)
+/* We borrow bit 6 to store the exclusive marker in swap PTEs. */
+#define SRMMU_SWP_EXCLUSIVE	SRMMU_DIRTY
 
 /* Some day I will implement true fine grained access bits for
  * user pages because the SRMMU gives us the capabilities to
-- 
2.38.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
