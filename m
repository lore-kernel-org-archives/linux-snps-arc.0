Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D26DC433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Feb 2022 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCLeh8069CGdi+nKGIzKJOUqyj/BbjicFb4LaEx9s4c=; b=OXWnA97UK0JLKn
	VspD3sa3fpT8NCRCehMhxv3ieNVuL4vHax8vAbNsoNuWU0msvt3t3RELp2AAYDqK7jlDkgfg4htnC
	ol/TRClcHtua/9V8jhYXMHKa+TEUJw1GAyyiskG2a433m/z9Rgz0/kJSLaYpSl2L/0XbLbLRHT1GP
	Raeg+Qi9qFwwHoFejvO1Vp+Q0yvj499JsVBuZf+Y542qWq/dukKqMC4LNjzc9XcCdnT77dlGaJ+vc
	gaCeoyAb6chvtdGmp+Fbn+Pj/yGo/k/ur07aNWlKy6Y0SGDgM1A85/G8T9EU/AaJv8Msrykyr+U6q
	epH7lxk4XCtTRWETZidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOe3i-00BnsD-BA; Mon, 28 Feb 2022 11:19:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOde8-00BZhN-B9; Mon, 28 Feb 2022 10:52:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD662106F;
 Mon, 28 Feb 2022 02:52:51 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A59CF3F73D;
 Mon, 28 Feb 2022 02:52:44 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Christoph Hellwig <hch@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org,
 openrisc@lists.librecores.org, linux-um@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: [PATCH V3 29/30] mm/mmap: Drop generic vm_get_page_prot()
Date: Mon, 28 Feb 2022 16:17:52 +0530
Message-Id: <1646045273-9343-30-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_025252_559967_03D1E7ED 
X-CRM114-Status: UNSURE (   6.79  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

All available platforms export their own vm_get_page_prot() implementation
via ARCH_HAS_VM_GET_PAGE_PROT. Hence a generic implementation is no longer
needed.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/mmap.c | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index c13dd9c37866..ff343f76a825 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -102,46 +102,6 @@ static void unmap_region(struct mm_struct *mm,
  *								w: (no) no
  *								x: (yes) yes
  */
-pgprot_t vm_get_page_prot(unsigned long vm_flags)
-{
-	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
-	case VM_NONE:
-		return __P000;
-	case VM_READ:
-		return __P001;
-	case VM_WRITE:
-		return __P010;
-	case VM_READ | VM_WRITE:
-		return __P011;
-	case VM_EXEC:
-		return __P100;
-	case VM_EXEC | VM_READ:
-		return __P101;
-	case VM_EXEC | VM_WRITE:
-		return __P110;
-	case VM_EXEC | VM_READ | VM_WRITE:
-		return __P111;
-	case VM_SHARED:
-		return __S000;
-	case VM_SHARED | VM_READ:
-		return __S001;
-	case VM_SHARED | VM_WRITE:
-		return __S010;
-	case VM_SHARED | VM_READ | VM_WRITE:
-		return __S011;
-	case VM_SHARED | VM_EXEC:
-		return __S100;
-	case VM_SHARED | VM_EXEC | VM_READ:
-		return __S101;
-	case VM_SHARED | VM_EXEC | VM_WRITE:
-		return __S110;
-	case VM_SHARED | VM_EXEC | VM_READ | VM_WRITE:
-		return __S111;
-	default:
-		BUILD_BUG();
-	}
-}
-EXPORT_SYMBOL(vm_get_page_prot);
 #endif	/* CONFIG_ARCH_HAS_VM_GET_PAGE_PROT */
 
 static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
