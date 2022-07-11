Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2FCC43334
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Jul 2022 07:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRF4nLV1kiqX6zLB38isxx/HErGeizqYDpZvX5S/0sQ=; b=SOFRGVrWZpoyfN
	E7SyLFUDkrmrCt0L/00NZjkupCjss+N1m5vJZNWrWm7tfmWxljvw8MBlvC6MabbBln840KwbffvMq
	1H+B1hO8yuF7RlfVdKxRLks0Y2LOPHyG0STit//Lo0MEMAXTb34fE/qcZZZXaiPR4J7ia2ZTqi4Pj
	StQUkSVWSSiM4BW4H0F+0X3in9ENs3KXG+SUGY/Jd8iHokYL08UrD/YdE7xXx5BYdudmudxEt5VOg
	cer566VSjNeC5nRtDOsy/B8EgYtpwtifWTazEojM9fVNQvE4yBWoXpaTEd4BTULNMk4fXys3OoPbH
	6iA+Js1cJhm/7kBm32yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnbL-00Gfj5-2P; Mon, 11 Jul 2022 07:13:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnWC-00Gboh-OH; Mon, 11 Jul 2022 07:07:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD592168F;
	Mon, 11 Jul 2022 00:07:43 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.45.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6B083F70D;
	Mon, 11 Jul 2022 00:07:35 -0700 (PDT)
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
	Jonas Bonn <jonas@southpole.se>,
	Stafford Horne <shorne@gmail.com>
Subject: [PATCH V7 10/26] openrisc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 11 Jul 2022 12:35:44 +0530
Message-Id: <20220711070600.2378316-11-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711070600.2378316-1-anshuman.khandual@arm.com>
References: <20220711070600.2378316-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_000744_929975_6F2E1C94 
X-CRM114-Status: UNSURE (   9.03  )
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

Cc: Jonas Bonn <jonas@southpole.se>
Cc: openrisc@lists.librecores.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/openrisc/Kconfig               |  1 +
 arch/openrisc/include/asm/pgtable.h | 18 ------------------
 arch/openrisc/mm/init.c             | 20 ++++++++++++++++++++
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index e814df4c483c..fe0dfb50eb86 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -10,6 +10,7 @@ config OPENRISC
 	select ARCH_HAS_DMA_SET_UNCACHED
 	select ARCH_HAS_DMA_CLEAR_UNCACHED
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select COMMON_CLK
 	select OF
 	select OF_EARLY_FLATTREE
diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index c3abbf71e09f..dcae8aea132f 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -176,24 +176,6 @@ extern void paging_init(void);
 	__pgprot(_PAGE_ALL | _PAGE_SRE | _PAGE_SWE \
 		 | _PAGE_SHARED | _PAGE_DIRTY | _PAGE_EXEC | _PAGE_CI)
 
-#define __P000	PAGE_NONE
-#define __P001	PAGE_READONLY_X
-#define __P010	PAGE_COPY
-#define __P011	PAGE_COPY_X
-#define __P100	PAGE_READONLY
-#define __P101	PAGE_READONLY_X
-#define __P110	PAGE_COPY
-#define __P111	PAGE_COPY_X
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READONLY_X
-#define __S010	PAGE_SHARED
-#define __S011	PAGE_SHARED_X
-#define __S100	PAGE_READONLY
-#define __S101	PAGE_READONLY_X
-#define __S110	PAGE_SHARED
-#define __S111	PAGE_SHARED_X
-
 /* zero page used for uninitialized stuff */
 extern unsigned long empty_zero_page[2048];
 #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index 3a021ab6f1ae..d531ab82be12 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -208,3 +208,23 @@ void __init mem_init(void)
 	mem_init_done = 1;
 	return;
 }
+
+static const pgprot_t protection_map[16] = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY_X,
+	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE | VM_READ]				= PAGE_COPY_X,
+	[VM_EXEC]					= PAGE_READONLY,
+	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY_X,
+	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED_X,
+	[VM_SHARED | VM_EXEC]				= PAGE_READONLY,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
