Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5236ECE7AB9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Nov 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAq3H9BqLpo8gtVxcihPdwtY9g++3OBxDLsx1InwLAE=; b=ja76YR/VQ2WlFz
	kPjFBddRiuSqSSurxMibeQAriAOSgCLubfMy37EW/e1YBs504yTKUNwvVzYrNOmRscu17vchHzLX4
	OMTwRTlMb7ehHmR9c1SfPmUeDiynnC/gJlPJnuQ3IQIwslJNkGTISgeVmoEm/geKUhUvFrthyj4mN
	buM3A05gscDamzRC/zlLj8KL/In3qAeevTUwd5JAiq1Smn8LDfkbcYCx0TXB5YIZH8urTB5rHG1Vx
	kzhzYF30MQu0bwBBUJh4w9jP15dyKHZMWIgzmSnRCBFnpOOP4+yvtu3xNuM9rTTmegIXFhg+/9mFt
	eAs6f+/y03eCKRb0/yBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrkP-0000000C5yI-3iM0;
	Fri, 14 Nov 2025 11:13:45 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrkM-0000000C5wG-38OW
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Nov 2025 11:13:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QEefGr34jCXytLhrSj7xX2XGq0Zan5wY+b22XB//Qmo=;
	b=ahulCYKl1T8/1EigkwF90o/vnGsd/SAoByvuSZpMwweuYRBk2FeVT2gsJ/dzEfCsjfcpLo
	mpzn6A8+HWUhO2EAEW8sql75SXT+7QKV88bnfAPoO9rKIxep+P5dEjCwnXn6+B9LQj02Kb
	jUh7PSOGRzsLU0M33QU2JbDlxuvcAFE=
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
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
Date: Fri, 14 Nov 2025 19:11:15 +0800
Message-ID: <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1763117269.git.zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031343_002958_FDE3A796 
X-CRM114-Status: UNSURE (   8.24  )
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig           | 1 +
 arch/alpha/include/asm/tlb.h | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 80367f2cf821c..681ed894d9e72 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -40,6 +40,7 @@ config ALPHA
 	select MMU_GATHER_NO_RANGE
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select ZONE_DMA
+	select MMU_GATHER_RCU_TABLE_FREE
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/alpha/include/asm/tlb.h b/arch/alpha/include/asm/tlb.h
index 4f79e331af5ea..4fe5a901720f0 100644
--- a/arch/alpha/include/asm/tlb.h
+++ b/arch/alpha/include/asm/tlb.h
@@ -4,7 +4,9 @@
 
 #include <asm-generic/tlb.h>
 
-#define __pte_free_tlb(tlb, pte, address)		pte_free((tlb)->mm, pte)
-#define __pmd_free_tlb(tlb, pmd, address)		pmd_free((tlb)->mm, pmd)
- 
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
+#define __pmd_free_tlb(tlb, pmd, address)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd))
+
 #endif
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
