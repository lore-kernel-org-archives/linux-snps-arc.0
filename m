Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B2DC43334
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Jun 2022 05:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDMtTgsKi741wiUdp0lQ/gYdH94fFNN7j8ulwhF8/QY=; b=XHWT+Vyd8TKoEu
	eaSdYxdGjdhCWx4LraZwNXKX2VnwlIoRDLd1N8Aqr2iFObMq77ss/UNatq9JzH9xT8FO8NLP6g5kH
	yj8GvvX1/dA1UOHuWfalTdR6XkChPjnaoYF3QpTUdBugZoadkpo71VkWZZ3sa7WDjuNzEyMq8JKmS
	FPc839IOwmyhd9k6rb5wbK5ytKofCHz/1qxEc7KmDjE91FuuzMxoDq08JA9uoZbCPF2No1JbyUCYI
	dk4m42zmYut67SHt37SI88Bvk7axvyodBT+LrHBfHhBQtNf8IzfMAzhFWEi7ey2T1NUZpZcMNWVZN
	v2AKknIORSo++AWmAq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6me3-00FAjS-El; Thu, 30 Jun 2022 05:23:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6mZ3-00F7Xx-RA; Thu, 30 Jun 2022 05:18:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFF6F175D;
	Wed, 29 Jun 2022 22:18:04 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 824DB3F66F;
	Wed, 29 Jun 2022 22:17:56 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: hch@infradead.org,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH V6 09/26] loongarch/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Thu, 30 Jun 2022 10:46:13 +0530
Message-Id: <20220630051630.1718927-10-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630051630.1718927-1-anshuman.khandual@arm.com>
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_221806_104420_43842E4E 
X-CRM114-Status: UNSURE (   8.05  )
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

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/loongarch/Kconfig                    |  1 +
 arch/loongarch/include/asm/pgtable-bits.h | 19 ----------
 arch/loongarch/mm/cache.c                 | 46 +++++++++++++++++++++++
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1920d52653b4..fd07b8e760ee 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -9,6 +9,7 @@ config LOONGARCH
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 3badd112d9ab..9ca147a29bab 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -83,25 +83,6 @@
 				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_SUC)
 #define PAGE_KERNEL_WUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
 				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC)
-
-#define __P000 __pgprot(_CACHE_CC | _PAGE_USER | _PAGE_PROTNONE | _PAGE_NO_EXEC | _PAGE_NO_READ)
-#define __P001 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __P010 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __P011 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __P100 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __P101 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __P110 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __P111 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-
-#define __S000 __pgprot(_CACHE_CC | _PAGE_USER | _PAGE_PROTNONE | _PAGE_NO_EXEC | _PAGE_NO_READ)
-#define __S001 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __S010 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE)
-#define __S011 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE)
-#define __S100 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __S101 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __S110 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_WRITE)
-#define __S111 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_WRITE)
-
 #ifndef __ASSEMBLY__
 
 #define pgprot_noncached pgprot_noncached
diff --git a/arch/loongarch/mm/cache.c b/arch/loongarch/mm/cache.c
index 9e5ce5aa73f7..e8c68dcf6ab2 100644
--- a/arch/loongarch/mm/cache.c
+++ b/arch/loongarch/mm/cache.c
@@ -139,3 +139,49 @@ void cpu_cache_init(void)
 
 	shm_align_mask = PAGE_SIZE - 1;
 }
+
+static const pgprot_t protection_map[16] = {
+	[VM_NONE]					= __pgprot(_CACHE_CC | _PAGE_USER |
+								   _PAGE_PROTNONE | _PAGE_NO_EXEC |
+								   _PAGE_NO_READ),
+	[VM_READ]					= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_WRITE]					= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_WRITE | VM_READ]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_EXEC]					= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_EXEC | VM_READ]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_EXEC | VM_WRITE]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_EXEC | VM_WRITE | VM_READ]			= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_SHARED]					= __pgprot(_CACHE_CC | _PAGE_USER |
+								   _PAGE_PROTNONE | _PAGE_NO_EXEC |
+								   _PAGE_NO_READ),
+	[VM_SHARED | VM_READ]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_SHARED | VM_WRITE]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC | _PAGE_WRITE),
+	[VM_SHARED | VM_WRITE | VM_READ]		= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC | _PAGE_WRITE),
+	[VM_SHARED | VM_EXEC]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_SHARED | VM_EXEC | VM_READ]			= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_WRITE),
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_WRITE)
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
