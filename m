Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5ACC43334
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Jun 2022 05:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCMMzM/U0Jk/qZ89G2GAgQCMiSlVWdcfgahdnHz2+P8=; b=wFvaX3eqlh8nyE
	lHEEQF8a2mQrsoLiOC0kwiIYYzFdRfwxbXU5eoYrKHPpTPCe7rwJZJnMCSHS7s2eB21HGAD9ftlgJ
	WAeF07UvVDogVBJK5qcRYoCsL3cAf6GlcBRRzvV5buaJYFZUP7OdcFnoO0qOGl9H5Qv2Oo4XAA51A
	qUIXP5tw9Cf+5quIWwAHQjgGsEm3006FgicJ/h2Jo3oN88FaQUybBGqUejsAStJv3EddV4gT6wtg3
	BeI4SxGkYnUc+XEXuEzP903jczhHhzTw2u6weIDQWxCWbE1B1rzbDtgtvNxiV8ewuocV7tTj6JupO
	MS/lvFo1F1jeV0OifhSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5gxk-00FYdK-9B; Mon, 27 Jun 2022 05:07:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5grG-00FTq5-OF; Mon, 27 Jun 2022 05:00:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2DD615DB;
	Sun, 26 Jun 2022 22:00:21 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.42.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14D433F5A1;
	Sun, 26 Jun 2022 22:00:13 -0700 (PDT)
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
	Chris Zankel <chris@zankel.net>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V5 11/26] xtensa/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 27 Jun 2022 10:28:18 +0530
Message-Id: <20220627045833.1590055-12-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627045833.1590055-1-anshuman.khandual@arm.com>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_220022_919051_A6CD976F 
X-CRM114-Status: UNSURE (   9.44  )
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

Cc: Chris Zankel <chris@zankel.net>
Cc: Guo Ren <guoren@kernel.org>
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/xtensa/Kconfig               |  1 +
 arch/xtensa/include/asm/pgtable.h | 18 ------------------
 arch/xtensa/mm/init.c             | 20 ++++++++++++++++++++
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 0b0f0172cced..4c0d83520ff1 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -11,6 +11,7 @@ config XTENSA
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_HAS_STRNCPY_FROM_USER if !KASAN
 	select ARCH_HAS_STRNLEN_USER
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 0a91376131c5..e0d5531ae00d 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -200,24 +200,6 @@
  * What follows is the closest we can get by reasonable means..
  * See linux/mm/mmap.c for protection_map[] array that uses these definitions.
  */
-#define __P000	PAGE_NONE		/* private --- */
-#define __P001	PAGE_READONLY		/* private --r */
-#define __P010	PAGE_COPY		/* private -w- */
-#define __P011	PAGE_COPY		/* private -wr */
-#define __P100	PAGE_READONLY_EXEC	/* private x-- */
-#define __P101	PAGE_READONLY_EXEC	/* private x-r */
-#define __P110	PAGE_COPY_EXEC		/* private xw- */
-#define __P111	PAGE_COPY_EXEC		/* private xwr */
-
-#define __S000	PAGE_NONE		/* shared  --- */
-#define __S001	PAGE_READONLY		/* shared  --r */
-#define __S010	PAGE_SHARED		/* shared  -w- */
-#define __S011	PAGE_SHARED		/* shared  -wr */
-#define __S100	PAGE_READONLY_EXEC	/* shared  x-- */
-#define __S101	PAGE_READONLY_EXEC	/* shared  x-r */
-#define __S110	PAGE_SHARED_EXEC	/* shared  xw- */
-#define __S111	PAGE_SHARED_EXEC	/* shared  xwr */
-
 #ifndef __ASSEMBLY__
 
 #define pte_ERROR(e) \
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index 6a32b2cf2718..fb830ec8183c 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -216,3 +216,23 @@ static int __init parse_memmap_opt(char *str)
 	return 0;
 }
 early_param("memmap", parse_memmap_opt);
+
+static const pgprot_t protection_map[16] = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY,
+	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE | VM_READ]				= PAGE_COPY,
+	[VM_EXEC]					= PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_READ]				= PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY_EXEC,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_EXEC,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_EXEC
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
