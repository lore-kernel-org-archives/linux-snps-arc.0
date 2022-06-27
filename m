Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50460CCA487
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Jun 2022 05:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vOcKXSN1zrIbJUfOBemdHAfa4xuS6Omp+AYzPdlt10=; b=tBqApffu8WAUEW
	ND1g35K1gKFjr+P+vkUeNgH9MlAwzZCmiDv+nRFUELeb5M7C+8ayPhdqUsp3MWY/DMOuOD7Vhw8/U
	F9SXiEo7uiEtyXJc5hVSLJKDXZwdw+YsGrU0Z+xufD76jTMldQtmuSnnNKc78+D1zQl9xviWvi7Oq
	PqZoJknT6ZV2HoqRP34AoSXord0ZO46mClw7L9lpqnVvvRYqesl7kot9b5RxSiaxL01Aodpa1IIw9
	CQ+gkZXwuxZge7vdAqofExi9J/wNyppC415sDEFjGOea9F4Bq0jr7HtmnqWA51hWAQo5KDlZkQvXM
	H8NkrgALFVdReNKOvetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5grd-00FU9R-VD; Mon, 27 Jun 2022 05:00:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5gqD-00FSwV-5H; Mon, 27 Jun 2022 04:59:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D2C6139F;
	Sun, 26 Jun 2022 21:59:16 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.42.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BC3F3F5A1;
	Sun, 26 Jun 2022 21:59:07 -0700 (PDT)
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH V5 03/26] powerpc/mm: Move protection_map[] inside the platform
Date: Mon, 27 Jun 2022 10:28:10 +0530
Message-Id: <20220627045833.1590055-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627045833.1590055-1-anshuman.khandual@arm.com>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_215917_341323_584F3F23 
X-CRM114-Status: UNSURE (   9.19  )
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

This moves protection_map[] inside the platform and while here, also enable
ARCH_HAS_VM_GET_PAGE_PROT on 32 bit and nohash 64 (aka book3e/64) platforms
via DECLARE_VM_GET_PAGE_PROT.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/powerpc/Kconfig               |  2 +-
 arch/powerpc/include/asm/pgtable.h | 20 +-------------------
 arch/powerpc/mm/pgtable.c          | 24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c2ce2e60c8f0..1035d172c7dd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -140,7 +140,7 @@ config PPC
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
-	select ARCH_HAS_VM_GET_PAGE_PROT	if PPC_BOOK3S_64
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index d564d0ecd4cd..33f4bf8d22b0 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -20,25 +20,6 @@ struct mm_struct;
 #include <asm/nohash/pgtable.h>
 #endif /* !CONFIG_PPC_BOOK3S */
 
-/* Note due to the way vm flags are laid out, the bits are XWR */
-#define __P000	PAGE_NONE
-#define __P001	PAGE_READONLY
-#define __P010	PAGE_COPY
-#define __P011	PAGE_COPY
-#define __P100	PAGE_READONLY_X
-#define __P101	PAGE_READONLY_X
-#define __P110	PAGE_COPY_X
-#define __P111	PAGE_COPY_X
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READONLY
-#define __S010	PAGE_SHARED
-#define __S011	PAGE_SHARED
-#define __S100	PAGE_READONLY_X
-#define __S101	PAGE_READONLY_X
-#define __S110	PAGE_SHARED_X
-#define __S111	PAGE_SHARED_X
-
 #ifndef __ASSEMBLY__
 
 #ifndef MAX_PTRS_PER_PGD
@@ -79,6 +60,7 @@ extern void paging_init(void);
 void poking_init(void);
 
 extern unsigned long ioremap_bot;
+extern const pgprot_t protection_map[16];
 
 /*
  * kern_addr_valid is intended to indicate whether an address is a valid
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index e6166b71d36d..cb2dcdb18f8e 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -472,3 +472,27 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	return ret_pte;
 }
 EXPORT_SYMBOL_GPL(__find_linux_pte);
+
+/* Note due to the way vm flags are laid out, the bits are XWR */
+const pgprot_t protection_map[16] = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY,
+	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE | VM_READ]				= PAGE_COPY,
+	[VM_EXEC]					= PAGE_READONLY_X,
+	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY_X,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_X,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_X,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
+};
+
+#ifndef CONFIG_PPC_BOOK3S_64
+DECLARE_VM_GET_PAGE_PROT
+#endif
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
