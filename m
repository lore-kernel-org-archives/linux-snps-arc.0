Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3913AC54EBD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Jan 2023 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USfm7gJl91KKN0VbsMCQX7ano2BgeMXpib6W/cIO4Qs=; b=nzVl4VR6SGDFfi
	fE7f+w/w2VridyDNAeZCUvf/JC8alkfk2HNj+E284kO4FlieUCIMAFqp4sCiitktDEZLHnyRZGJDK
	5s/wQyS591DQNIBzozv7AWLNQQoKAPxaP6SIJmKfHOEaXcno93fawUxaRxZQOBGfedcHodhSWMg2Q
	YuLw0AHmi+xrXxbDa9Nz0w+HDyPIKPTPtbfbUOy+asiEkdppkb9xORepgOoDoQMvGO84DL4RBEo/t
	z14QYBrR/PWkHXVybpDu0or9OR4kSHkQHwiWDVPsNa0c/utiqtHf0Zp7AfChRxQFLfe9E2zozlsnI
	bTgnwbcy+IeRi6geiDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGNpW-003jia-DR; Fri, 13 Jan 2023 17:27:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGNcA-003bZT-BW
	for linux-snps-arc@lists.infradead.org; Fri, 13 Jan 2023 17:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iq3NJjdIXoIIFXuABXPEN69O+eZCmfZSMHyuPIjJQUs=;
	b=YDLw9T7+KcBmrfeWHBzpTPQCftedCmey1YX27XSQix9NhENF8C84ZId03tnjj6M8YMvHxB
	jCbJMMnKwmb8D4YoHL8x0gAGwZFBqu+zAfNIUYQFDBmYifUpDv0I6/1/O6YRtrptsQRbSx
	BbG0Md/lYdk6IpbxLKVBwPlxU1q7MvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-tcQ5phS1Ng-WmjPesDZNfg-1; Fri, 13 Jan 2023 12:13:10 -0500
X-MC-Unique: tcQ5phS1Ng-WmjPesDZNfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6769100F902;
	Fri, 13 Jan 2023 17:13:08 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CFF640C2064;
	Fri, 13 Jan 2023 17:13:02 +0000 (UTC)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Subject: [PATCH mm-unstable v1 20/26] sh/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Fri, 13 Jan 2023 18:10:20 +0100
Message-Id: <20230113171026.582290-21-david@redhat.com>
In-Reply-To: <20230113171026.582290-1-david@redhat.com>
References: <20230113171026.582290-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_091314_491295_A4F9F5C9 
X-CRM114-Status: GOOD (  18.06  )
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

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by using bit 6 in the PTE,
reducing the swap type in the !CONFIG_X2TLB case to 5 bits. Generic MM
currently only uses 5 bits for the type (MAX_SWAPFILES_SHIFT), so the
stolen bit is effectively unused.

Interrestingly, the swap type in the !CONFIG_X2TLB case could currently
overlap with the _PAGE_PRESENT bit, because there is a sneaky shift by 1 in
__pte_to_swp_entry() and __swp_entry_to_pte(). Bit 0-7 in the architecture
specific swap PTE would get shifted to bit 1-8 in the PTE. As generic MM
uses 5 bits only, this didn't matter so far.

While at it, mask the type in __swp_entry().

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/sh/include/asm/pgtable_32.h | 54 +++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtable_32.h
index d0240decacca..c34aa795a9d2 100644
--- a/arch/sh/include/asm/pgtable_32.h
+++ b/arch/sh/include/asm/pgtable_32.h
@@ -423,40 +423,70 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #endif
 
 /*
- * Encode and de-code a swap entry
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
  *
  * Constraints:
  *	_PAGE_PRESENT at bit 8
  *	_PAGE_PROTNONE at bit 9
  *
- * For the normal case, we encode the swap type into bits 0:7 and the
- * swap offset into bits 10:30. For the 64-bit PTE case, we keep the
- * preserved bits in the low 32-bits and use the upper 32 as the swap
- * offset (along with a 5-bit type), following the same approach as x86
- * PAE. This keeps the logic quite simple.
+ * For the normal case, we encode the swap type and offset into the swap PTE
+ * such that bits 8 and 9 stay zero. For the 64-bit PTE case, we use the
+ * upper 32 for the swap offset and swap type, following the same approach as
+ * x86 PAE. This keeps the logic quite simple.
  *
  * As is evident by the Alpha code, if we ever get a 64-bit unsigned
  * long (swp_entry_t) to match up with the 64-bit PTEs, this all becomes
  * much cleaner..
- *
- * NOTE: We should set ZEROs at the position of _PAGE_PRESENT
- *       and _PAGE_PROTNONE bits
  */
+
 #ifdef CONFIG_X2TLB
+/*
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   <--------------------- offset ----------------------> < type ->
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <------------------- zeroes --------------------> E 0 0 0 0 0 0
+ */
 #define __swp_type(x)			((x).val & 0x1f)
 #define __swp_offset(x)			((x).val >> 5)
-#define __swp_entry(type, offset)	((swp_entry_t){ (type) | (offset) << 5})
+#define __swp_entry(type, offset)	((swp_entry_t){ ((type) & 0x1f) | (offset) << 5})
 #define __pte_to_swp_entry(pte)		((swp_entry_t){ (pte).pte_high })
 #define __swp_entry_to_pte(x)		((pte_t){ 0, (x).val })
 
 #else
-#define __swp_type(x)			((x).val & 0xff)
+/*
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <--------------- offset ----------------> 0 0 0 0 E < type -> 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ */
+#define __swp_type(x)			((x).val & 0x1f)
 #define __swp_offset(x)			((x).val >> 10)
-#define __swp_entry(type, offset)	((swp_entry_t){(type) | (offset) <<10})
+#define __swp_entry(type, offset)	((swp_entry_t){((type) & 0x1f) | (offset) << 10})
 
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 1 })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 1 })
 #endif
 
+/* In both cases, we borrow bit 6 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
+
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
+}
+
+PTE_BIT_FUNC(low, swp_mkexclusive, |= _PAGE_SWP_EXCLUSIVE);
+PTE_BIT_FUNC(low, swp_clear_exclusive, &= ~_PAGE_SWP_EXCLUSIVE);
+
 #endif /* __ASSEMBLY__ */
 #endif /* __ASM_SH_PGTABLE_32_H */
-- 
2.39.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
