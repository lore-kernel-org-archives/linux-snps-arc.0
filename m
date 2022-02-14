Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10322C433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 02:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KX3KOc7Xi0n4Yikx20M7wgltCYX6IVitzG0ZJ9gDe0o=; b=NqG7hE92XSwwni
	GY3x3UzV/HgXmP0GDxcnOfe39nY+knkrOgtSio/R7jiXwCm13Z68BGeYyE7pTosbeJIVb55UmYHqT
	2QFRQKXJpFXCKpoINfJIRoxV7crg+5iL1UaO5pn0uuslgtBJN2IB+IQEK/wgQoNLqT4ewjrU9GLiU
	wCqPwz4S4wBlzkBSp6hUUuH21JrQ0uiyllMIMRKG21J1Hbkr7rEaEDtBdAe9ECj+zA7z2VhWzghPL
	H+HMnHZjSj92CImarHpY7QrrtGx6JV0a+IebgaHKtyYb1AkCtTZPi/HUmQopYloKwDucEluFF8Ro4
	hzdvjYONOrVAbHNKNjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJR9l-00D0ei-64; Mon, 14 Feb 2022 02:32:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJR9i-00D0cm-Qf
 for linux-snps-arc@lists.infradead.org; Mon, 14 Feb 2022 02:32:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C824106F;
 Sun, 13 Feb 2022 18:31:58 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A18BE3F718;
 Sun, 13 Feb 2022 18:31:55 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 18/30] arc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 14 Feb 2022 08:00:41 +0530
Message-Id: <1644805853-21338-19-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644805853-21338-1-git-send-email-anshuman.khandual@arm.com>
References: <1644805853-21338-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_183158_974754_493E777E 
X-CRM114-Status: UNSURE (   9.74  )
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

This defines and exports a platform specific custom vm_get_page_prot() via
subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
macros can be dropped which are no longer needed.

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arc/Kconfig                          |  1 +
 arch/arc/include/asm/pgtable-bits-arcv2.h | 17 ----------
 arch/arc/mm/mmap.c                        | 41 +++++++++++++++++++++++
 3 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 3c2a4753d09b..78ff0644b343 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -13,6 +13,7 @@ config ARC
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index 183d23bc1e00..798308f4dbad 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -72,23 +72,6 @@
  *     This is to enable COW mechanism
  */
 	/* xwr */
-#define __P000  PAGE_U_NONE
-#define __P001  PAGE_U_R
-#define __P010  PAGE_U_R	/* Pvt-W => !W */
-#define __P011  PAGE_U_R	/* Pvt-W => !W */
-#define __P100  PAGE_U_X_R	/* X => R */
-#define __P101  PAGE_U_X_R
-#define __P110  PAGE_U_X_R	/* Pvt-W => !W and X => R */
-#define __P111  PAGE_U_X_R	/* Pvt-W => !W */
-
-#define __S000  PAGE_U_NONE
-#define __S001  PAGE_U_R
-#define __S010  PAGE_U_W_R	/* W => R */
-#define __S011  PAGE_U_W_R
-#define __S100  PAGE_U_X_R	/* X => R */
-#define __S101  PAGE_U_X_R
-#define __S110  PAGE_U_X_W_R	/* X => R */
-#define __S111  PAGE_U_X_W_R
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 722d26b94307..d286894d7359 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -74,3 +74,44 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return PAGE_U_NONE;
+	case VM_READ:
+	/* Pvt-W => !W */
+	case VM_WRITE:
+	/* Pvt-W => !W */
+	case VM_WRITE | VM_READ:
+		return PAGE_U_R;
+	/* X => R */
+	case VM_EXEC:
+	case VM_EXEC | VM_READ:
+	 /* Pvt-W => !W and X => R */
+	case VM_EXEC | VM_WRITE:
+	 /* Pvt-W => !W */
+	case VM_EXEC | VM_WRITE | VM_READ:
+		return PAGE_U_X_R;
+	case VM_SHARED:
+		return PAGE_U_NONE;
+	case VM_SHARED | VM_READ:
+		return PAGE_U_R;
+	/* W => R */
+	case VM_SHARED | VM_WRITE:
+	case VM_SHARED | VM_WRITE | VM_READ:
+		return PAGE_U_W_R;
+	 /* X => R */
+	case VM_SHARED | VM_EXEC:
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return PAGE_U_X_R;
+	/* X => R */
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
+		return PAGE_U_X_W_R;
+	default:
+		BUILD_BUG();
+	}
+}
+EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
