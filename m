Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839F7C5DF7E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Aug 2026 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=po3fCYyAF6kX3EgK/nSuLScOiIqH4zcDzHyzvd7RQ9c=; b=GHxJKTaUM8VtQs
	/aPd0K1ijVABhCBZoGxAh1zh8SLHJQ0BzUuyeVZkSpiINswaP2dya09xBuRGl64L3Xu6tMsh/izLK
	zZs1uhfp2LHVRgAVgZ0uzPvAyObmcx2ibWBPJkSBm2m5n88P1c/vFXPGHdnMvHbMbuzm2QkzvWpWl
	rBZKhymCeOEC4eZN4lbUwcus2IMooYcjTxTTRh+kUWUnn2+UIrZwGLWk0gWleeApdwtPXrR7J45ju
	zqj1SOIZM+6z+I1KYU3t5RJCyNjrJzNMlf5a1+QGgI4OBsHheyCL2Sk3dzEV9AruZ2I6hItaw3pFQ
	tzc6GSKGiF9RqrgFfCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwB0f-00000007EL5-3kQA;
	Tue, 18 Aug 2026 04:01:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwB0X-00000007E9Q-28bv;
	Tue, 18 Aug 2026 04:01:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 552C0176C;
	Mon, 17 Aug 2026 21:00:56 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 439313F66F;
	Mon, 17 Aug 2026 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787025660; bh=jNvZ3ph4tfzqvfYMPDWyq7xHUxNcpHCKh93HJ34Xlag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=utTgpugZygTuDjhpwxzKPuJMIDZz0EKonCrgJRpvQKS6INxHgHOfXIDFV+nOSQ7jF
	 7Bgl85I45aBhnw6MHWp+5DDIFHvHyFt07H8kgzKVC+zsqZqfrwYRzS13GPJp69yMK5
	 AJqMStMFmVH1+FyJHrLz9sBA+2QOVy632/sBTjjU=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	david@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC V3 4/8] parisc/mm: Directly use generic [pmd|pgd]_clear_bad()
Date: Tue, 18 Aug 2026 09:30:37 +0530
Message-ID: <20260818040041.1891769-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818040041.1891769-1-anshuman.khandual@arm.com>
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_210101_596990_1D7C0A2D 
X-CRM114-Status: UNSURE (   7.57  )
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

Drop [pmd|pgd]_ERROR() followed by [pmd|pgd]_clear() instances. But instead
directly use semantically equivalent generic helpers [pmd|pgd]_clear_bad()
in unmap_uncached_[pte|pmd]() which helps in dropping their corresponding
[pmd|pgd]_ERROR() macros across the tree.

Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/parisc/kernel/pci-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index bf9f192c826e..84e7309a8266 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -160,8 +160,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
 	if (pmd_none(*pmd))
 		return;
 	if (pmd_bad(*pmd)) {
-		pmd_ERROR(*pmd);
-		pmd_clear(pmd);
+		pmd_clear_bad(pmd);
 		return;
 	}
 	pte = pte_offset_kernel(pmd, vaddr);
@@ -196,8 +195,7 @@ static inline void unmap_uncached_pmd(pgd_t * dir, unsigned long vaddr,
 	if (pgd_none(*dir))
 		return;
 	if (pgd_bad(*dir)) {
-		pgd_ERROR(*dir);
-		pgd_clear(dir);
+		pgd_clear_bad(dir);
 		return;
 	}
 	pmd = pmd_offset(pud_offset(p4d_offset(dir, vaddr), vaddr), vaddr);
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
