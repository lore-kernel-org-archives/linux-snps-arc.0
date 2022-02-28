Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DAEC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Feb 2022 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWjNQD9osk3eS9yq42iVYfruwPJ/+VkrdUeDC+YJGzk=; b=v+dTjL2pQDe+YE
	vYM4Rzw1i0jyJ2jMITYgNDo57I4n0bx+tJQZQH/iIcwS7XSxn9HWD0Il231NtT8aG/OwJgv1pCVvV
	MBg/1ICS/ZQLooKe0giNmqi8TF8dealyo6mbw+exJm9hKsy1GrtJdJcVCwzYBxzsK5l41cSBQLwus
	UBqz2Frrn/AAfZmgug5fnjuigT/bZtT5W3aoXApzSEbfnwpzm0cwnOjobIEXLmRdItbchHjVLWb9V
	AFRnF9lCTZalqf6ykqIUjHBpozMHBermfsaoc88dkzW90jETaA/G8mUsf9KprupUJVu3rrumo0TfH
	561KdGCyEbcCn1Do1+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOdjA-00Bd2Y-8w; Mon, 28 Feb 2022 10:58:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdbf-00BY3d-CW; Mon, 28 Feb 2022 10:50:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D633511FB;
 Mon, 28 Feb 2022 02:50:18 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 479283F73D;
 Mon, 28 Feb 2022 02:50:11 -0800 (PST)
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
Subject: [PATCH V3 11/30] mm/mmap: Drop protection_map[]
Date: Mon, 28 Feb 2022 16:17:34 +0530
Message-Id: <1646045273-9343-12-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_025019_613348_CC8D28F9 
X-CRM114-Status: GOOD (  13.68  )
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

There are no other users for protection_map[]. Hence just drop this array
construct and instead define __vm_get_page_prot() which will provide page
protection map based on vm_flags combination switch.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/gpu/drm/drm_vm.c |  4 +--
 include/linux/mm.h       |  6 ----
 mm/mmap.c                | 63 ++++++++++++++++++++++++++--------------
 3 files changed, 44 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index e957d4851dc0..14862df7532f 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -482,7 +482,7 @@ static int drm_mmap_dma(struct file *filp, struct vm_area_struct *vma)
 #else
 		/* Ye gads this is ugly.  With more thought
 		   we could move this up higher and use
-		   `protection_map' instead.  */
+		   `vm_get_page_prot()' instead.  */
 		vma->vm_page_prot =
 		    __pgprot(pte_val
 			     (pte_wrprotect
@@ -566,7 +566,7 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
 #else
 		/* Ye gads this is ugly.  With more thought
 		   we could move this up higher and use
-		   `protection_map' instead.  */
+		   `vm_get_page_prot()' instead.  */
 		vma->vm_page_prot =
 		    __pgprot(pte_val
 			     (pte_wrprotect
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 213cc569b192..ff74bd2d7850 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -418,12 +418,6 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 #define VM_FLAGS_CLEAR	(ARCH_VM_PKEY_FLAGS | VM_ARCH_CLEAR)
 
-/*
- * mapping from the currently active vm_flags protection bits (the
- * low four bits) to a page protection mask..
- */
-extern pgprot_t protection_map[16];
-
 /*
  * The default fault flags that should be used by most of the
  * arch-specific page fault handlers.
diff --git a/mm/mmap.c b/mm/mmap.c
index f2310f6e7466..78eeac277a80 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -102,24 +102,6 @@ static void unmap_region(struct mm_struct *mm,
  *								w: (no) no
  *								x: (yes) yes
  */
-pgprot_t protection_map[16] __ro_after_init = {
-	[VM_NONE]					= __P000,
-	[VM_READ]					= __P001,
-	[VM_WRITE]					= __P010,
-	[VM_WRITE | VM_READ]				= __P011,
-	[VM_EXEC]					= __P100,
-	[VM_EXEC | VM_READ]				= __P101,
-	[VM_EXEC | VM_WRITE]				= __P110,
-	[VM_EXEC | VM_WRITE | VM_READ]			= __P111,
-	[VM_SHARED]					= __S000,
-	[VM_SHARED | VM_READ]				= __S001,
-	[VM_SHARED | VM_WRITE]				= __S010,
-	[VM_SHARED | VM_WRITE | VM_READ]		= __S011,
-	[VM_SHARED | VM_EXEC]				= __S100,
-	[VM_SHARED | VM_EXEC | VM_READ]			= __S101,
-	[VM_SHARED | VM_EXEC | VM_WRITE]		= __S110,
-	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __S111
-};
 
 #ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
 static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
@@ -128,10 +110,49 @@ static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
 }
 #endif
 
+static inline pgprot_t __vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return __P000;
+	case VM_READ:
+		return __P001;
+	case VM_WRITE:
+		return __P010;
+	case VM_READ | VM_WRITE:
+		return __P011;
+	case VM_EXEC:
+		return __P100;
+	case VM_EXEC | VM_READ:
+		return __P101;
+	case VM_EXEC | VM_WRITE:
+		return __P110;
+	case VM_EXEC | VM_READ | VM_WRITE:
+		return __P111;
+	case VM_SHARED:
+		return __S000;
+	case VM_SHARED | VM_READ:
+		return __S001;
+	case VM_SHARED | VM_WRITE:
+		return __S010;
+	case VM_SHARED | VM_READ | VM_WRITE:
+		return __S011;
+	case VM_SHARED | VM_EXEC:
+		return __S100;
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return __S101;
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+		return __S110;
+	case VM_SHARED | VM_EXEC | VM_READ | VM_WRITE:
+		return __S111;
+	default:
+		BUILD_BUG();
+	}
+}
+
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
-				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
+	pgprot_t ret = __pgprot(pgprot_val(__vm_get_page_prot(vm_flags)) |
 			pgprot_val(arch_vm_get_page_prot(vm_flags)));
 
 	return arch_filter_pgprot(ret);
@@ -1684,7 +1705,7 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
 /*
  * Some shared mappings will want the pages marked read-only
  * to track write events. If so, we'll downgrade vm_page_prot
- * to the private version (using protection_map[] without the
+ * to the private version (using vm_get_page_prot() without the
  * VM_SHARED bit).
  */
 int vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
