Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DB9C41537
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF35160F11
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF35160F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuIbnOElxZ+AY4qEI4+SQDFM4I8Z5D079TaJLxRyNJQ=; b=btAAG5p1LRtX6z
	Q+kI1aKNo39ItzhPu4zIgYEHBGr5V00jbfWKMZo/VyJ2QHy0EsRGF5Z5YMFh8G8bCdWatXOyGodk/
	/rEqh4EKp84xVSJYkLhNRLWzQLE/m59g2w6AdOLoazr1ZTPW4UZtefvvtQHTSwvM/n9Ec32FNiNu9
	r3D9kRWNQHfMNCcP5tK2sm6gXk8cNFZjk5CG5/8QDLwecuOYvjs3Vx0iD154mklv8YgtjDUDeKQrc
	1h4idOJEI0+mjCnMXAcSYcmhDs9VmeHZFaWlRaYP6/bsKfmgeFzIGs3BOazD1XeMIATg19VyQOrAg
	4q9EXp9rYlBRUW0MYgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL5-0056hV-3S; Wed, 11 Aug 2021 00:43:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL1-0056dE-Py
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 333A26101E;
 Wed, 11 Aug 2021 00:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642599;
 bh=GnoibyRqmuzmp9rlWYYiDkJSczSXQYZSBk2r8Ru2kb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ltgpLAb09scNIqf7hB4w+9wq/kMJo6klNCdbwyjz06C+di55vyu2NbNrNBDqyQ9d3
 G+a+jg7VCy+On16gHsKi9E77og6pPYyylaxZP9GF5YmIZWvMiizD5r/xsqP0uOGyV8
 jpQ7sfofWOWGx0uDHlZYtIEKMPcdVORhrxrIMnv2ujP0u0akUBQB+OsZVW1qW1Id1/
 LqMgqGQ88ZG3Fc0qx+fFWFglMWcLiCkzllK6qHsU7zhbTV17MKkumU279yN0pra/vJ
 ZOvjlXq/r+X/C201M9G70O7Rn6yAyiI9DNAedv3Ikgg2EP/FWSuK8UnBVIJ0GbPqko
 8z8HOQz17OYFg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 07/18] ARC: ioremap: use more commonly used PAGE_KERNEL based
 uncached flag
Date: Tue, 10 Aug 2021 17:42:47 -0700
Message-Id: <20210811004258.138075-8-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174319_938331_1008EE60 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

and remove the one off uncached definition for ARC

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/pgtable.h | 3 ---
 arch/arc/mm/ioremap.c          | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 80b57c14b430..b054c14f8bf6 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -103,9 +103,6 @@
  */
 #define PAGE_KERNEL          __pgprot(_K_PAGE_PERMS | _PAGE_CACHEABLE)
 
-/* ioremap */
-#define PAGE_KERNEL_NO_CACHE __pgprot(_K_PAGE_PERMS)
-
 /* Masks for actual TLB "PD"s */
 #define PTE_BITS_IN_PD0		(_PAGE_GLOBAL | _PAGE_PRESENT | _PAGE_HW_SZ)
 #define PTE_BITS_RWX		(_PAGE_EXECUTE | _PAGE_WRITE | _PAGE_READ)
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 052bbd8b1e5f..0ee75aca6e10 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -39,7 +39,8 @@ void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
 	if (arc_uncached_addr_space(paddr))
 		return (void __iomem *)(u32)paddr;
 
-	return ioremap_prot(paddr, size, pgprot_val(PAGE_KERNEL_NO_CACHE));
+	return ioremap_prot(paddr, size,
+			    pgprot_val(pgprot_noncached(PAGE_KERNEL)));
 }
 EXPORT_SYMBOL(ioremap);
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
