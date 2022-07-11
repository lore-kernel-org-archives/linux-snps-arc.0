Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98EEC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Jul 2022 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4zdGHoK+kOoo4QsbIa1kYN2Bu35CYgHkOLV0IRZy2E=; b=dI28iJ7FcWzDjP
	zkR2m4OSjTpqvsc1AzYvM6xm+3dBRpcpR6pva8mL66OO2MwrOxXte+mA1H1ufJmAtGe+jUPeigmZq
	rr8JxbSYsP3Ugv9al6L1MicLthVhGXcvtDTe1v75emWDpjPyMAZ+uZyGf81Mi+/mtn7KJOV6fcLsZ
	ZF08TZ3KiVsMIM1Tb1aGhZgpLBzbjViZcKsVDIJXbrybZd7KEK/6+Fq21casQxQVfIZhbA3Ru5X5r
	VGLE9SkQXw29EN7ScucfFjqHkR8mvyFBjiioIcGCRCLR4YWo+RCFqEJMC7zUCcCCmcPkTGVUgK1hY
	VyKH/SbuSmJu+RfHREHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnVk-00GbQ7-Bp; Mon, 11 Jul 2022 07:07:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnV7-00Gauj-ES; Mon, 11 Jul 2022 07:06:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82AB2150C;
	Mon, 11 Jul 2022 00:06:36 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.45.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4EB43F70D;
	Mon, 11 Jul 2022 00:06:28 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Date: Mon, 11 Jul 2022 12:35:36 +0530
Message-Id: <20220711070600.2378316-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711070600.2378316-1-anshuman.khandual@arm.com>
References: <20220711070600.2378316-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_000637_618848_09649C9C 
X-CRM114-Status: GOOD (  11.95  )
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

This just converts the generic vm_get_page_prot() implementation into a new
macro i.e DECLARE_VM_GET_PAGE_PROT which later can be used across platforms
when enabling them with ARCH_HAS_VM_GET_PAGE_PROT. This does not create any
functional change.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/pgtable.h | 28 ++++++++++++++++++++++++++++
 mm/mmap.c               | 26 +-------------------------
 2 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 3cdc16cfd867..014ee8f0fbaa 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1689,4 +1689,32 @@ typedef unsigned int pgtbl_mod_mask;
 #define MAX_PTRS_PER_P4D PTRS_PER_P4D
 #endif
 
+/* description of effects of mapping type and prot in current implementation.
+ * this is due to the limited x86 page protection hardware.  The expected
+ * behavior is in parens:
+ *
+ * map_type	prot
+ *		PROT_NONE	PROT_READ	PROT_WRITE	PROT_EXEC
+ * MAP_SHARED	r: (no) no	r: (yes) yes	r: (no) yes	r: (no) yes
+ *		w: (no) no	w: (no) no	w: (yes) yes	w: (no) no
+ *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
+ *
+ * MAP_PRIVATE	r: (no) no	r: (yes) yes	r: (no) yes	r: (no) yes
+ *		w: (no) no	w: (no) no	w: (copy) copy	w: (no) no
+ *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
+ *
+ * On arm64, PROT_EXEC has the following behaviour for both MAP_SHARED and
+ * MAP_PRIVATE (with Enhanced PAN supported):
+ *								r: (no) no
+ *								w: (no) no
+ *								x: (yes) yes
+ */
+#define DECLARE_VM_GET_PAGE_PROT					\
+pgprot_t vm_get_page_prot(unsigned long vm_flags)			\
+{									\
+		return protection_map[vm_flags &			\
+			(VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)];	\
+}									\
+EXPORT_SYMBOL(vm_get_page_prot);
+
 #endif /* _LINUX_PGTABLE_H */
diff --git a/mm/mmap.c b/mm/mmap.c
index b01f0280bda2..b46d5e931bb3 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -81,26 +81,6 @@ static void unmap_region(struct mm_struct *mm,
 		struct vm_area_struct *vma, struct vm_area_struct *prev,
 		unsigned long start, unsigned long end);
 
-/* description of effects of mapping type and prot in current implementation.
- * this is due to the limited x86 page protection hardware.  The expected
- * behavior is in parens:
- *
- * map_type	prot
- *		PROT_NONE	PROT_READ	PROT_WRITE	PROT_EXEC
- * MAP_SHARED	r: (no) no	r: (yes) yes	r: (no) yes	r: (no) yes
- *		w: (no) no	w: (no) no	w: (yes) yes	w: (no) no
- *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
- *
- * MAP_PRIVATE	r: (no) no	r: (yes) yes	r: (no) yes	r: (no) yes
- *		w: (no) no	w: (no) no	w: (copy) copy	w: (no) no
- *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
- *
- * On arm64, PROT_EXEC has the following behaviour for both MAP_SHARED and
- * MAP_PRIVATE (with Enhanced PAN supported):
- *								r: (no) no
- *								w: (no) no
- *								x: (yes) yes
- */
 #ifdef __P000
 pgprot_t protection_map[16] __ro_after_init = {
 	[VM_NONE]					= __P000,
@@ -123,11 +103,7 @@ pgprot_t protection_map[16] __ro_after_init = {
 #endif
 
 #ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
-pgprot_t vm_get_page_prot(unsigned long vm_flags)
-{
-	return protection_map[vm_flags & (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)];
-}
-EXPORT_SYMBOL(vm_get_page_prot);
+DECLARE_VM_GET_PAGE_PROT
 #endif	/* CONFIG_ARCH_HAS_VM_GET_PAGE_PROT */
 
 static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
