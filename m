Return-Path: <SRS0=Bf7c=OU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37C4C433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 18:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BEAC6134F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 18:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BEAC6134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ire2KCEPqiGau36dxc1xSFpSdAYN+90HL8hSLvawJk=; b=TvWdWy2qUp02k6
	kVMsqqWqVC5CNhvQXCNJGPvXh0DHgzzt8jbHMGYiW6SXK/haDl/huJw3d96QoNqMSmOrlQrabVwW3
	xexIExL6AVQu6Nabu5ZeF+B6ejGO9SSY8oinCZh9gUpz/uI6CtGN5WGTdH5X+HYkwygzqnQwO8Njc
	rA5MABnoXs9yn3oBH5AWGUStbw1FO7kEJQEWEXGFa5+RmCu3n6I8vv277bwJuVm5dPkElcWSproAI
	YGE8mf7eOZIya8+vRg8nEm4BWVLbQSXaNDnQ/YlMylLfDJqWh+e4besiS/D1iudhBITJO8tBQUqms
	X1l7nhel9NAE4U33bpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW1GM-00FlkF-JK; Thu, 30 Sep 2021 18:58:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW19C-00FiVs-Qp; Thu, 30 Sep 2021 18:51:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A2FA613CD;
 Thu, 30 Sep 2021 18:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633027870;
 bh=t26przUqxCSGoBx41IMst/8wXJXoFwnOeTOXHswXAgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dXxprhJQZdZ6sk4rSn/rJZ0y8BsCGoLVOFNDP79gSG9bfzMuQ6Jj2iGJcEg84pkyp
 M6Ch/waR2QQadlfi7FqEJZBx/jculiE7ratgds8uDW/Hl+kI8vNSqGY+Bnfe1jSZJa
 bk55N5LaCDn5b7P2i2GzxYuHtQK/V6Lj6nQVhHYY3gwcoF1r53ooG6I5iCe7Q+3Fze
 qmq4xeJ2HVjQ8xQvxiVjVvdkL5t/CKmwoGH0d06XFqf35691Wg6/f2+5qy96xPVOHK
 nEt3pQk9SsCPQ7ksYP1gKGmSLs18lrKf5M2VN3dItzxzsbwE1uoM/EEg4NKM+HRtLx
 2Csut9P5pc//w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Juergen Gross <jgross@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH v2 4/6] memblock: stop aliasing __memblock_free_late with
 memblock_free_late
Date: Thu, 30 Sep 2021 21:50:29 +0300
Message-Id: <20210930185031.18648-5-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
References: <20210930185031.18648-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_115110_997840_6BE939C2 
X-CRM114-Status: GOOD (  11.41  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

memblock_free_late() is a NOP wrapper for __memblock_free_late(), there is
no point to keep this indirection.

Drop the wrapper and rename __memblock_free_late() to memblock_free_late().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/memblock.h | 7 +------
 mm/memblock.c            | 8 ++++----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index fc8183be340c..e25f964fdd60 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -133,7 +133,7 @@ void __next_mem_range_rev(u64 *idx, int nid, enum memblock_flags flags,
 			  struct memblock_type *type_b, phys_addr_t *out_start,
 			  phys_addr_t *out_end, int *out_nid);
 
-void __memblock_free_late(phys_addr_t base, phys_addr_t size);
+void memblock_free_late(phys_addr_t base, phys_addr_t size);
 
 #ifdef CONFIG_HAVE_MEMBLOCK_PHYS_MAP
 static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
@@ -441,11 +441,6 @@ static inline void *memblock_alloc_node(phys_addr_t size,
 				      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
 }
 
-static inline void memblock_free_late(phys_addr_t base, phys_addr_t size)
-{
-	__memblock_free_late(base, size);
-}
-
 /*
  * Set the allocation direction to bottom-up or top-down.
  */
diff --git a/mm/memblock.c b/mm/memblock.c
index 184dcd2e5d99..603f4a02be9b 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -366,14 +366,14 @@ void __init memblock_discard(void)
 		addr = __pa(memblock.reserved.regions);
 		size = PAGE_ALIGN(sizeof(struct memblock_region) *
 				  memblock.reserved.max);
-		__memblock_free_late(addr, size);
+		memblock_free_late(addr, size);
 	}
 
 	if (memblock.memory.regions != memblock_memory_init_regions) {
 		addr = __pa(memblock.memory.regions);
 		size = PAGE_ALIGN(sizeof(struct memblock_region) *
 				  memblock.memory.max);
-		__memblock_free_late(addr, size);
+		memblock_free_late(addr, size);
 	}
 
 	memblock_memory = NULL;
@@ -1586,7 +1586,7 @@ void * __init memblock_alloc_try_nid(
 }
 
 /**
- * __memblock_free_late - free pages directly to buddy allocator
+ * memblock_free_late - free pages directly to buddy allocator
  * @base: phys starting address of the  boot memory block
  * @size: size of the boot memory block in bytes
  *
@@ -1594,7 +1594,7 @@ void * __init memblock_alloc_try_nid(
  * down, but we are still initializing the system.  Pages are released directly
  * to the buddy allocator.
  */
-void __init __memblock_free_late(phys_addr_t base, phys_addr_t size)
+void __init memblock_free_late(phys_addr_t base, phys_addr_t size)
 {
 	phys_addr_t cursor, end;
 
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
