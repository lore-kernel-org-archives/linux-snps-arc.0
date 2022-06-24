Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622EFC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 04:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cm2V2vuCkPPz9AUREjAHl77KzdTPCnIRceLuzLetHN8=; b=YPHQnYKn+y2JHa
	0ZeY2UFrMwjaV9vv1xqPn5kdYrzjoPetSTk00rObCNL8fspu2juKzbVva0XHIda1X1saeBaMLyZ2R
	25LqFtcz34zirDxl/6FEa2G/R8e+1d/68foikUh17c+4vd0I/2pY7gPQhkJdmdummDushrq9oqYl9
	nrP0GF1aYA8H+IJ0eAIz3GjXgL2ueSxSYyKYajXjlgK4/Jr/xB64Q6RyogoANE1fNVHQfT3wyEOAw
	58owqz8m0rHz09NR2bFUc9y616Jh0m3b+VsrxzG6HLYaY6ACVzJkRn2gQiYMR2fh5NUlcbv5hooLt
	EKlAGRmVhdbE3eluW34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bO4-000NAl-6z; Fri, 24 Jun 2022 04:57:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bCy-000FtI-60; Fri, 24 Jun 2022 04:46:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DEEE16F3;
	Thu, 23 Jun 2022 21:46:15 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDFBE3F66F;
	Thu, 23 Jun 2022 21:46:06 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: hch@infradead.org,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	openrisc@lists.librecores.org,
	linux-xtensa@linux-xtensa.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-um@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH V4 17/26] csky/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Fri, 24 Jun 2022 10:13:30 +0530
Message-Id: <20220624044339.1533882-18-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624044339.1533882-1-anshuman.khandual@arm.com>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214616_340848_C8EE3623 
X-CRM114-Status: UNSURE (   8.57  )
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

This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
up a private and static protection_map[] array. Subsequently all __SXXX and
__PXXX macros can be dropped which are no longer needed.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/csky/Kconfig               |  1 +
 arch/csky/include/asm/pgtable.h | 18 ------------------
 arch/csky/mm/init.c             | 20 ++++++++++++++++++++
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 21d72b078eef..588b8a9c68ed 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -6,6 +6,7 @@ config CSKY
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610 && $(cc-option,-mbacktrace)
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index bbe245117777..229a5f4ad7fc 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -77,24 +77,6 @@
 #define MAX_SWAPFILES_CHECK() \
 		BUILD_BUG_ON(MAX_SWAPFILES_SHIFT != 5)
 
-#define __P000	PAGE_NONE
-#define __P001	PAGE_READ
-#define __P010	PAGE_READ
-#define __P011	PAGE_READ
-#define __P100	PAGE_READ
-#define __P101	PAGE_READ
-#define __P110	PAGE_READ
-#define __P111	PAGE_READ
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READ
-#define __S010	PAGE_WRITE
-#define __S011	PAGE_WRITE
-#define __S100	PAGE_READ
-#define __S101	PAGE_READ
-#define __S110	PAGE_WRITE
-#define __S111	PAGE_WRITE
-
 extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
 
diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index bf2004aa811a..1bf7b2a748fd 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -197,3 +197,23 @@ void __init fixaddr_init(void)
 	vaddr = __fix_to_virt(__end_of_fixed_addresses - 1) & PMD_MASK;
 	fixrange_init(vaddr, vaddr + PMD_SIZE, swapper_pg_dir);
 }
+
+static pgprot_t protection_map[16] __ro_after_init = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READ,
+	[VM_WRITE]					= PAGE_READ,
+	[VM_WRITE | VM_READ]				= PAGE_READ,
+	[VM_EXEC]					= PAGE_READ,
+	[VM_EXEC | VM_READ]				= PAGE_READ,
+	[VM_EXEC | VM_WRITE]				= PAGE_READ,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_READ,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READ,
+	[VM_SHARED | VM_WRITE]				= PAGE_WRITE,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_WRITE,
+	[VM_SHARED | VM_EXEC]				= PAGE_READ,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READ,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_WRITE,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_WRITE
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
