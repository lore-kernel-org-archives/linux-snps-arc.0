Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E51CE7AE1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Nov 2025 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wt8CHyrP2VMfNRMLXg73LUjF9NIWYZAtvy/jZsSsS2s=; b=Dr04MQw4xY1WHO
	9WkLh/Q4OacCcksGV0r3SCManxg+2inhn286CvrdHjn093ck7uaia/WsUchrFo7ECSiDep2xeTkaY
	1ndFHfpjvNMiH3x+IyMGxaXJqdN2KyYFZpnk5G+vlVxrY1od8q26LHoDlaW50JRNzJJOOP/SeR+Xt
	vR1d76fH8fZvi8eHhTpwurRRx6gf+K/yXIimOwQ+1do4XcaANo2KRQ9uFLHXa4G6pnLTsbVw/V6h4
	vkMXmcvA1ci9KkiZ3w5nJJtoeciXgzVMR5HYytYfaL8/BCw6US3014mymgJgSg5FEvzSBOSmzUkuc
	n5mvPCSzqYtUg73iR7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrkS-0000000C5zu-0f2X;
	Fri, 14 Nov 2025 11:13:48 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrkP-0000000C5wv-1fZk
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Nov 2025 11:13:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7tXlmZ+pRF9jtuKn/rsOIXurW72jRhlWkLmUc3dGBwY=;
	b=Stpm2Cw2eR2J2rbFTzOawJSjf+8nVr0S2DRH8c9JHKG+fa285HvCdFhAMOTsWRsfTG7RAJ
	jloMnHkECy68rT0g0QHXnxlcRLoj/F48niZL+Kl1UjiVPo0BMgqdyzoUeUTD8/BUmGQpnX
	MUXmRasI8N65oN5LGgdju7vLVsDd3dI=
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
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
Date: Fri, 14 Nov 2025 19:11:14 +0800
Message-ID: <cover.1763117269.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031345_578451_40C520AA 
X-CRM114-Status: UNSURE (   5.87  )
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

Hi all,

This series aims to enable PT_RECLAIM on all 64-bit architectures.

On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of empty PTE
page table pages (such as 100GB+). To resolve this problem, we need to enable
PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.

Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 64-bit
architectures, and finally makes PT_RECLAIM depend on MMU_GATHER_RCU_TABLE_FREE
&& 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
architectures.

Comments and suggestions are welcome!

Thanks,
Qi

Qi Zheng (7):
  alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
  arc: mm: enable MMU_GATHER_RCU_TABLE_FREE
  loongarch: mm: enable MMU_GATHER_RCU_TABLE_FREE
  mips: mm: enable MMU_GATHER_RCU_TABLE_FREE
  parisc: mm: enable MMU_GATHER_RCU_TABLE_FREE
  um: mm: enable MMU_GATHER_RCU_TABLE_FREE
  mm: make PT_RECLAIM depend on MMU_GATHER_RCU_TABLE_FREE && 64BIT

 arch/alpha/Kconfig                   | 1 +
 arch/alpha/include/asm/tlb.h         | 8 +++++---
 arch/arc/Kconfig                     | 1 +
 arch/arc/include/asm/pgalloc.h       | 9 ++++++---
 arch/loongarch/Kconfig               | 1 +
 arch/loongarch/include/asm/pgalloc.h | 6 ++++--
 arch/mips/Kconfig                    | 1 +
 arch/mips/include/asm/pgalloc.h      | 6 ++++--
 arch/parisc/Kconfig                  | 1 +
 arch/parisc/include/asm/tlb.h        | 6 ++++--
 arch/um/Kconfig                      | 1 +
 arch/x86/Kconfig                     | 1 -
 mm/Kconfig                           | 6 +-----
 13 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
