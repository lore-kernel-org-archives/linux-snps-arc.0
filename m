Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DC8C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Jun 2022 05:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VemsnI25K6WgRafDDmXIqBK5PyP6wcUDl5uZ3QsnKFo=; b=Vq9j9nygZ0n2ox
	/pLlGco22RTbE1dn0kdAb8PT99MaERMrpqryg1rOUVtAUjd4sbleXCmEmLI51A4ZMTsHd+i2X7sVf
	fqB1QWyNATQXCsg9bJv99rM7mO5HRlz9g7fd4q5dBoJkss5bhX71Eq6xZ64m5qBGa5jKZ26KVg2Sh
	+M89iPXzxmYa75JUs/liuORlZPZ5ecxDLROdNfR0Q9DLiBadzqZBKJ+w0i8hP9W3e5292Ep3HWPXz
	DfCF1uTItGJgjnA+/wS2jxbaT8iDfldhfsPybckHk/VZvfHRTspmAhANHe9BWYI9Qdy1mCzinYBvF
	yzrI7bxsPxiKe1NIw1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5h4T-00FdBt-J7; Mon, 27 Jun 2022 05:14:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5gsB-00FUbj-Ng; Mon, 27 Jun 2022 05:01:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEB68168F;
	Sun, 26 Jun 2022 22:01:18 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.42.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 723713F5A1;
	Sun, 26 Jun 2022 22:01:11 -0700 (PDT)
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
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH V5 18/26] s390/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 27 Jun 2022 10:28:25 +0530
Message-Id: <20220627045833.1590055-19-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627045833.1590055-1-anshuman.khandual@arm.com>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_220119_936789_63D74CEC 
X-CRM114-Status: UNSURE (   7.81  )
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

Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/s390/Kconfig               |  1 +
 arch/s390/include/asm/pgtable.h | 17 -----------------
 arch/s390/mm/mmap.c             | 20 ++++++++++++++++++++
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 91c0b80a8bf0..c4481377ca83 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -81,6 +81,7 @@ config S390
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_VDSO_DATA
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_INLINE_READ_LOCK
 	select ARCH_INLINE_READ_LOCK_BH
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index a397b072a580..c63a05b5368a 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -424,23 +424,6 @@ static inline int is_module_addr(void *addr)
  * implies read permission.
  */
          /*xwr*/
-#define __P000	PAGE_NONE
-#define __P001	PAGE_RO
-#define __P010	PAGE_RO
-#define __P011	PAGE_RO
-#define __P100	PAGE_RX
-#define __P101	PAGE_RX
-#define __P110	PAGE_RX
-#define __P111	PAGE_RX
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_RO
-#define __S010	PAGE_RW
-#define __S011	PAGE_RW
-#define __S100	PAGE_RX
-#define __S101	PAGE_RX
-#define __S110	PAGE_RWX
-#define __S111	PAGE_RWX
 
 /*
  * Segment entry (large page) protection definitions.
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index d545f5c39f7e..5980ce348832 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -188,3 +188,23 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
 		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
 	}
 }
+
+static const pgprot_t protection_map[16] = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_RO,
+	[VM_WRITE]					= PAGE_RO,
+	[VM_WRITE | VM_READ]				= PAGE_RO,
+	[VM_EXEC]					= PAGE_RX,
+	[VM_EXEC | VM_READ]				= PAGE_RX,
+	[VM_EXEC | VM_WRITE]				= PAGE_RX,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_RX,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_RO,
+	[VM_SHARED | VM_WRITE]				= PAGE_RW,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_RW,
+	[VM_SHARED | VM_EXEC]				= PAGE_RX,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_RX,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_RWX,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_RWX
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
