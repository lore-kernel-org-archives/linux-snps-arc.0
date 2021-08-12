Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB28C4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4247E610A5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4247E610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuIbnOElxZ+AY4qEI4+SQDFM4I8Z5D079TaJLxRyNJQ=; b=yBO2JSZC/MVuWe
	VjZ7l+zdvhhQx6ZWG0Qk+OvlxsR8kalej5v6/MfuLM63zTll7av0/t31BF5NdYVQsqU5bsXSCJS3Y
	4wOceF+mDHVr5bRCDY9A/4gVB7dRZ8JUEJQczDNB9BImCGhL/KgMvnvp+1T65RsMwQclDypIg12WO
	vCGzqFQP4eMZ0CDpfaqFonnSQDGQVjcTf+7uW7rk/n/Ys0RB/iXmZ1Q1q/ltM8X/xPUlcmjMNLK4c
	jOseHuoc+3YjQQvmY4PVVV03qH2xzJ2hnYv2POAb2Ex0IAas8ernctCOIxPOBMFa7zdHcpvJVplmU
	B6pFUBRiz4R5Sj97nC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH0-00BTyr-AP; Thu, 12 Aug 2021 23:38:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGv-00BTsm-3b
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD134610A8;
 Thu, 12 Aug 2021 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811480;
 bh=GnoibyRqmuzmp9rlWYYiDkJSczSXQYZSBk2r8Ru2kb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJ5LZ4ULgVjyz2u3mRUlYamQ/7jmPMb7gl8kc5FY89Ndfg1EO7yHTvHxz7q8XDKaA
 bck5ngmrh8YhCbTADIdDXRaYTj8Nh2Vr8b24023FVZvRD4426mg78uWRO2Pfdom4A8
 oB5v4Cozx+FrwVZIErcM8A/GwPNE/+vMszDu1dnhDa5gHUgN4OULVKJ+qqYbLierIW
 LqShWqr+RbK1q4XPVDe25+wvzUFfBLMSlGwLA0cRMtq2fbEoRw9aELP3HDq+1ArdAU
 /c5X97hoSq4KcTPBqFFrVy2KLzBHy4uWQONQnKUzKwpxb5xxk1GxpEyLpjgTbAMdzx
 BgRFn/rB65VUw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 06/19] ARC: ioremap: use more commonly used PAGE_KERNEL
 based uncached flag
Date: Thu, 12 Aug 2021 16:37:40 -0700
Message-Id: <20210812233753.104217-7-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163801_278763_DCBB0077 
X-CRM114-Status: UNSURE (   9.25  )
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
