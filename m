Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9731FC54EBE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Jan 2023 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBJ0Wxb2CHVMtEJIRgaqaPqz78ZyadeyE1KFjgmM4SY=; b=kWww/Iy52wLPpn
	XvxxC/Cnm/kAWSWkVXDzNbhzcbdR7zy887RecE0ZamMIWRlGtMzm8DP9oicjoOffVfuPZcid9HDei
	43VFMGa2A4WUrI0xNewOOqntVk5oHXYuYEAtgI0kD+yd6Dlne27OSqe37LP7KH/gsBgAcSeX4KWnG
	lvMxQQVbrKQQH2XbLjutdrHMLEGRan/A32amVZDfIRhQXkOxxlxBdjYInQ711PyQ6ju8yFYBDnO1U
	0TZKTP7pw4B7do/gcpBv5ITgSVTx7AmgZqvOn7HPh4NwdIOnhB8WCyBYJMWjPgin+s70KFbPxAuZ1
	E0Fa3fpAT/t+IYRB4bQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGNkT-003gtD-Gm; Fri, 13 Jan 2023 17:21:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGNbZ-003b6x-OP
	for linux-snps-arc@lists.infradead.org; Fri, 13 Jan 2023 17:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yg5//Yy7TNKL4+cSLuxDja5DgwYoaRFdwhUA2l2XqT4=;
	b=K/R0asA1g7rI08+IVWKoIyCcZmIHxJWl49AzyQfmHfy17m43+6fMCf9x/xIcHLYjwCgMzN
	9YkKru6Ya8YxOerM391QdtLMVlSm1/MchLKVIgaGaxIbPh7zv5lf4dOQbj6jQqDsm7kEgK
	XA7r7c6OukF25lDLkJq3TTrcDra/Igk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-CQX355qCMESVPPSct6yrTA-1; Fri, 13 Jan 2023 12:12:33 -0500
X-MC-Unique: CQX355qCMESVPPSct6yrTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 991F4380610A;
	Fri, 13 Jan 2023 17:12:31 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA27840C2064;
	Fri, 13 Jan 2023 17:12:24 +0000 (UTC)
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
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>
Subject: [PATCH mm-unstable v1 15/26] openrisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Fri, 13 Jan 2023 18:10:15 +0100
Message-Id: <20230113171026.582290-16-david@redhat.com>
In-Reply-To: <20230113171026.582290-1-david@redhat.com>
References: <20230113171026.582290-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_091237_905412_252D9566 
X-CRM114-Status: GOOD (  15.50  )
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

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
from the type. Generic MM currently only uses 5 bits for the type
(MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.

While at it, mask the type in __swp_entry().

Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/openrisc/include/asm/pgtable.h | 41 +++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 6477c17b3062..903b32d662ab 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -154,6 +154,9 @@ extern void paging_init(void);
 #define _KERNPG_TABLE \
 	(_PAGE_BASE | _PAGE_SRE | _PAGE_SWE | _PAGE_ACCESSED | _PAGE_DIRTY)
 
+/* We borrow bit 11 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_U_SHARED
+
 #define PAGE_NONE       __pgprot(_PAGE_ALL)
 #define PAGE_READONLY   __pgprot(_PAGE_ALL | _PAGE_URE | _PAGE_SRE)
 #define PAGE_READONLY_X __pgprot(_PAGE_ALL | _PAGE_URE | _PAGE_SRE | _PAGE_EXEC)
@@ -385,16 +388,44 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 
 /* __PHX__ FIXME, SWAP, this probably doesn't work */
 
-/* Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e)) */
-/* Since the PAGE_PRESENT bit is bit 4, we can use the bits above */
-
-#define __swp_type(x)			(((x).val >> 5) & 0x7f)
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <-------------- offset ---------------> E <- type --> 0 0 0 0 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   The zero'ed bits include _PAGE_PRESENT.
+ */
+#define __swp_type(x)			(((x).val >> 5) & 0x3f)
 #define __swp_offset(x)			((x).val >> 12)
 #define __swp_entry(type, offset) \
-	((swp_entry_t) { ((type) << 5) | ((offset) << 12) })
+	((swp_entry_t) { (((type) & 0x3f) << 5) | ((offset) << 12) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte_val(pte) |= _PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte_val(pte) &= ~_PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
 typedef pte_t *pte_addr_t;
 
 #endif /* __ASSEMBLY__ */
-- 
2.39.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
