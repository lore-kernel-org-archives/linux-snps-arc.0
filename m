Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A40FC352A1
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Dec 2022 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuHIy9m4IpNmlBjSmri3k/lEegY+O5FZeXNFgVJP24s=; b=EK75oDUA/DT40v
	XRkt7Qs1Y3FXy8boYiaT+SEM3gZAUDo84Dn3euAFr78OtfuWtfLiVUjXPLFIH4wysvNYeTk7/cHEG
	yeae5SRUGW/KUC/1Il9RKxQWWGNTwnEMpBb4mYLuM/Rg2iukVzxAsw6qjtkJUys4U2cLkP/dWQ6OF
	54Z+CiT2YTwwD8RbjaE2Ybj7B1tnmakaGwIcfr2dNHxTg5mLKYAY0O+IXsYnhGro0U9tR5rEtlrUz
	opagP0aqMnOqIQRQRRrVQEoyJ4rkfFtV+dQzw9xJuSl79s965dxd1atsoIZFBAehmTXabKJD1H1Gl
	aDfWWil/D9BxwzP/DGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ZdA-00C6x2-Lj; Tue, 06 Dec 2022 15:13:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ZHN-00Bipd-MC
	for linux-snps-arc@lists.infradead.org; Tue, 06 Dec 2022 14:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSbGj/S1MkFWdiaDaCidSOs9klY0w7HvyNiRWH0W8s4=;
	b=ceSMwZTD8vT7VUEbkNLMqQgeG35rTiQdfIjkup0+L54Egt6KyQozyZoGMP3+G13ORGmqa2
	S0GOZib7rR2XbPS/v6LsxlsEzObJwcwOP6FYw9j3kUM8HXdxE+pJ/ja1Jm+jLHYlhvyfyF
	gqCNtfZDRQMfNMJuImyM959+a8C0Bxw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-KLlwNyGgPcCbyBROtp5jUw-1; Tue, 06 Dec 2022 09:50:35 -0500
X-MC-Unique: KLlwNyGgPcCbyBROtp5jUw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87C2F38164D3;
	Tue,  6 Dec 2022 14:50:33 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64CA0492B0E;
	Tue,  6 Dec 2022 14:50:26 +0000 (UTC)
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
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH mm-unstable RFC 23/26] um/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue,  6 Dec 2022 15:47:27 +0100
Message-Id: <20221206144730.163732-24-david@redhat.com>
In-Reply-To: <20221206144730.163732-1-david@redhat.com>
References: <20221206144730.163732-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_065041_815034_62D5A903 
X-CRM114-Status: GOOD (  16.83  )
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

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by using bit 10, which is
yet unused for swap PTEs.

The pte_mkuptodate() is a bit weird in __pte_to_swp_entry() for a swap PTE
... but it only messes with bit 1 and 2 and there is a comment in
set_pte(), so leave these bits alone.

While at it, mask the type in __swp_entry().

Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/um/include/asm/pgtable.h | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index 4e3052f2671a..cedc5fd451ce 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -21,6 +21,9 @@
 #define _PAGE_PROTNONE	0x010	/* if the user mapped it with PROT_NONE;
 				   pte_present gives true */
 
+/* We borrow bit 10 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	0x400
+
 #ifdef CONFIG_3_LEVEL_PGTABLES
 #include <asm/pgtable-3level.h>
 #else
@@ -288,16 +291,46 @@ extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
 
 #define update_mmu_cache(vma,address,ptep) do {} while (0)
 
-/* Encode and de-code a swap entry */
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <--------------- offset ----------------> E < type -> 0 0 0 1 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_NEWPAGE (bit 1) is always set to 1 in set_pte().
+ */
 #define __swp_type(x)			(((x).val >> 5) & 0x1f)
 #define __swp_offset(x)			((x).val >> 11)
 
 #define __swp_entry(type, offset) \
-	((swp_entry_t) { ((type) << 5) | ((offset) << 11) })
+	((swp_entry_t) { (((type) & 0x1f) << 5) | ((offset) << 11) })
 #define __pte_to_swp_entry(pte) \
 	((swp_entry_t) { pte_val(pte_mkuptodate(pte)) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_get_bits(pte, _PAGE_SWP_EXCLUSIVE);
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte_set_bits(pte, _PAGE_SWP_EXCLUSIVE);
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte_clear_bits(pte, _PAGE_SWP_EXCLUSIVE);
+	return pte;
+}
+
 /* Clear a kernel PTE and flush it from the TLB */
 #define kpte_clear_flush(ptep, vaddr)		\
 do {						\
-- 
2.38.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
