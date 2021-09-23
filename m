Return-Path: <SRS0=XnSr=ON=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34742C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 07:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0762E61107
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 07:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0762E61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pDsBjbkYFE14TccP04NhSv9rJiPWuEapiDxN8xDGIg=; b=d9HjAGcbjBLTED
	JHRIafybNQc4Z3zPLbVnzWhrCjhowIQQwWn5X0WCNhRSBlu6/rHyfeICIqXuwLmUdF8zNUoJzaw4+
	JQXyNfuNnD0maLQta8v2sKMIIHhwobBg557HtY6s7KjBkuwF/T3FLGvO0gyZcEhORXmUArwBtecE/
	6dCR5DqB11a5UgklqVKcSUsxt0NwBoDGNHsxpLvGyqGjE+/mZbBTLCU6Cz0D25XvgOjriOWkERL/V
	JkhFr0Gc27GMZOdqo+2sI6m2gSu7YzhU4YrtGRrECq2jl98G3b4FwESX/Eq3ju/Q4GFGm6CgD1HtS
	RZXEyWlhvo2MSBMr2Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTJOy-00AXm4-Iu; Thu, 23 Sep 2021 07:44:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTJOZ-00AXcL-CR; Thu, 23 Sep 2021 07:43:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E807D61038;
 Thu, 23 Sep 2021 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632383031;
 bh=ISUQEAeabD8TFuzFwCipkjqJm558AV8oII+raBjMcR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qp4PlSy1I2qLdHfiL+6LZq+DtUAW0BZNW8wWana91BkCU23YNyluYXPn3qRTLPtZv
 nKeiyUiksdKxzzSpxVSgam85AgBf4/Oi9IBa05SDCS8Vhd7zIdAhFgm+m6hDjh46y+
 zgSAUfDAyTkvZojIS/HqTJ8bHsBPWFPJqCUkPfRiYtndeE5czEFfrL7O0vHSE7G8ps
 raokz57MNdzvGevCOJ7eHnUIMwrQwINX3LVGYRMX+O8ir8PikcZnvpGJvgoQZnchBJ
 rPqRejbi67XM5nP4AeGEbzjUVLZdJqRjdH9jyG3N+kSrB2M0hOUOUOmwRt0L5pnKJd
 hgPAAvvP+k1Gw==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 1/3] arch_numa: simplify numa_distance allocation
Date: Thu, 23 Sep 2021 10:43:33 +0300
Message-Id: <20210923074335.12583-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210923074335.12583-1-rppt@kernel.org>
References: <20210923074335.12583-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_004351_483540_4C565E53 
X-CRM114-Status: UNSURE (   9.29  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Memory allocation of numa_distance uses memblock_phys_alloc_range() without
actual range limits, converts the returned physical address to virtual and
then only uses the virtual address for further initialization.

Simplify this by replacing memblock_phys_alloc_range() with
memblock_alloc().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 drivers/base/arch_numa.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 00fb4120a5b3..f6d0efd01188 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -275,15 +275,13 @@ void __init numa_free_distance(void)
 static int __init numa_alloc_distance(void)
 {
 	size_t size;
-	u64 phys;
 	int i, j;
 
 	size = nr_node_ids * nr_node_ids * sizeof(numa_distance[0]);
-	phys = memblock_phys_alloc_range(size, PAGE_SIZE, 0, PFN_PHYS(max_pfn));
-	if (WARN_ON(!phys))
+	numa_distance = memblock_alloc(size, PAGE_SIZE);
+	if (WARN_ON(!numa_distance))
 		return -ENOMEM;
 
-	numa_distance = __va(phys);
 	numa_distance_cnt = nr_node_ids;
 
 	/* fill with the default distances */
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
