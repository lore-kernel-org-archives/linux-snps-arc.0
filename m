Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3DACE7AB9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Nov 2025 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH/AQIAmXkD2h3K9+5sTnWhG46Kgb6l/EjrDTXH+C14=; b=LsNhqTmw/8lU0c
	+rQBXa5UUwmEPL7eyGRgCtZkEOzWLVgJq3pxnBqQ2BgLI6A4l7ijW5YJU+Uc7fNABEsYh8uc7BQDf
	G75IwDVcYvwgp0eu/L65Ha62lESoWqob80ZaD/owWBgN1WClAMw9vdr80hzqUXf7C2HzaC86ER110
	LravKu9crV4J7RwF15zLko05gL0N3mqKMzZ081AITuBLga5KcTMs3i+Iw/Qs4FS3vwGN3wfVvZNmG
	0jAdfA9JQW1R2P/8KCBNTAoig9ugac2fHoefP9lFiSOMF64kOMEutg/2wdaS9cvYpao8e6gJ+RGcK
	MJZBoeE+mDCqtFaHu5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrkh-0000000C6A9-22iY;
	Fri, 14 Nov 2025 11:14:03 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrkf-0000000C67u-3XNZ
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Nov 2025 11:14:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sax8A8PA6ZHc/cVS+xTeKKlG8M0r3mfGW440vNjJZdg=;
	b=MJ9MpinllxQ4TveK74NmYHIrtnuWysqMuo3kH1WtaJPOEfUFraWTOjeuO+qSEwJDbXunL4
	KzCwC7WMF3bErXcULhl6Hmst/RWmFUWC5WUQqMmKuZtOwbb3VyxdEl/g2hEf0Oms7Jx9kQ
	EAMJFMUorbF1pVdhYWTD7Kr5yAkEd64=
From: Qi Zheng <qi.zheng@linux.dev>
To: will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	dev.jain@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 5/7] parisc: mm: enable MMU_GATHER_RCU_TABLE_FREE
Date: Fri, 14 Nov 2025 19:11:19 +0800
Message-ID: <3a88790a662c2b84066c77772d20bd1f5f687f8b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1763117269.git.zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031402_033830_57139030 
X-CRM114-Status: UNSURE (   6.86  )
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
empty PTE page table pages (such as 100GB+). To resolve this problem,
first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
PT_RECLAIM feature, which resolves this problem.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kconfig           | 1 +
 arch/parisc/include/asm/tlb.h | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 47fd9662d8005..946cbe21a4118 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -92,6 +92,7 @@ config PARISC
 	select TRACE_IRQFLAGS_SUPPORT
 	select HAVE_FUNCTION_DESCRIPTORS if 64BIT
 	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
+	select MMU_GATHER_RCU_TABLE_FREE
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/include/asm/tlb.h b/arch/parisc/include/asm/tlb.h
index 44235f367674d..ab7d4113df61a 100644
--- a/arch/parisc/include/asm/tlb.h
+++ b/arch/parisc/include/asm/tlb.h
@@ -5,8 +5,10 @@
 #include <asm-generic/tlb.h>
 
 #if CONFIG_PGTABLE_LEVELS == 3
-#define __pmd_free_tlb(tlb, pmd, addr)	pmd_free((tlb)->mm, pmd)
+#define __pmd_free_tlb(tlb, pmd, addr)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd))
 #endif
-#define __pte_free_tlb(tlb, pte, addr)	pte_free((tlb)->mm, pte)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #endif
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
