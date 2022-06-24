Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D885C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 04:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxYmGhWYh0IlvKn+SIRbppdh0i7fQYJwkhfHNtcudSU=; b=cuMhPet/2ho72o
	aP/g2+iwJsSPD+ginQfc8vAEhhPWok1Bl2uRzFuH865Jb+fHIZum1KqxTNH4Din7Ub7K7ysuKpNyP
	T3r20chjUbOGVeaZec2KOtgntdc8m5T5Xn1NyG0HsmtIIHQ1b3k7/u0UGhYov7jF7n5bIKz40x3x8
	TT2xRp0z0lxUearc4J9tpHaxmL5nWKprSwwMNc5h4DC9fjr+C+K+ZEdljBuvrh8PBFaOFUrax6cKA
	MLottIUsQTCkj33T/vXAa5B4xfNIvRvtIwW+tlJWnMI01Ds9aA3ih+ivgRsFqy/fCxUe0H5HGMq/E
	wRHIPTVPU4GvKnNRHy5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bKi-000LHJ-G0; Fri, 24 Jun 2022 04:54:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bCZ-000FaK-63; Fri, 24 Jun 2022 04:45:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13757169C;
	Thu, 23 Jun 2022 21:45:50 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04DE13F66F;
	Thu, 23 Jun 2022 21:45:42 -0700 (PDT)
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
	Richard Henderson <rth@twiddle.net>
Subject: [PATCH V4 14/26] alpha/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Fri, 24 Jun 2022 10:13:27 +0530
Message-Id: <20220624044339.1533882-15-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624044339.1533882-1-anshuman.khandual@arm.com>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214551_383450_35BFC81E 
X-CRM114-Status: UNSURE (   8.55  )
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

Cc: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/alpha/Kconfig               |  1 +
 arch/alpha/include/asm/pgtable.h | 17 -----------------
 arch/alpha/mm/init.c             | 22 ++++++++++++++++++++++
 3 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 7d0d26b5b3f5..db1c8b329461 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -2,6 +2,7 @@
 config ALPHA
 	bool
 	default y
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 170451fde043..3ea9661c09ff 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -116,23 +116,6 @@ struct vm_area_struct;
  * arch/alpha/mm/fault.c)
  */
 	/* xwr */
-#define __P000	_PAGE_P(_PAGE_FOE | _PAGE_FOW | _PAGE_FOR)
-#define __P001	_PAGE_P(_PAGE_FOE | _PAGE_FOW)
-#define __P010	_PAGE_P(_PAGE_FOE)
-#define __P011	_PAGE_P(_PAGE_FOE)
-#define __P100	_PAGE_P(_PAGE_FOW | _PAGE_FOR)
-#define __P101	_PAGE_P(_PAGE_FOW)
-#define __P110	_PAGE_P(0)
-#define __P111	_PAGE_P(0)
-
-#define __S000	_PAGE_S(_PAGE_FOE | _PAGE_FOW | _PAGE_FOR)
-#define __S001	_PAGE_S(_PAGE_FOE | _PAGE_FOW)
-#define __S010	_PAGE_S(_PAGE_FOE)
-#define __S011	_PAGE_S(_PAGE_FOE)
-#define __S100	_PAGE_S(_PAGE_FOW | _PAGE_FOR)
-#define __S101	_PAGE_S(_PAGE_FOW)
-#define __S110	_PAGE_S(0)
-#define __S111	_PAGE_S(0)
 
 /*
  * pgprot_noncached() is only for infiniband pci support, and a real
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 7511723b7669..a2350b2f44d0 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -280,3 +280,25 @@ mem_init(void)
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
 	memblock_free_all();
 }
+
+static pgprot_t protection_map[16] __ro_after_init = {
+	[VM_NONE]					= _PAGE_P(_PAGE_FOE | _PAGE_FOW |
+								  _PAGE_FOR),
+	[VM_READ]					= _PAGE_P(_PAGE_FOE | _PAGE_FOW),
+	[VM_WRITE]					= _PAGE_P(_PAGE_FOE),
+	[VM_WRITE | VM_READ]				= _PAGE_P(_PAGE_FOE),
+	[VM_EXEC]					= _PAGE_P(_PAGE_FOW | _PAGE_FOR),
+	[VM_EXEC | VM_READ]				= _PAGE_P(_PAGE_FOW),
+	[VM_EXEC | VM_WRITE]				= _PAGE_P(0),
+	[VM_EXEC | VM_WRITE | VM_READ]			= _PAGE_P(0),
+	[VM_SHARED]					= _PAGE_S(_PAGE_FOE | _PAGE_FOW |
+								  _PAGE_FOR),
+	[VM_SHARED | VM_READ]				= _PAGE_S(_PAGE_FOE | _PAGE_FOW),
+	[VM_SHARED | VM_WRITE]				= _PAGE_S(_PAGE_FOE),
+	[VM_SHARED | VM_WRITE | VM_READ]		= _PAGE_S(_PAGE_FOE),
+	[VM_SHARED | VM_EXEC]				= _PAGE_S(_PAGE_FOW | _PAGE_FOR),
+	[VM_SHARED | VM_EXEC | VM_READ]			= _PAGE_S(_PAGE_FOW),
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= _PAGE_S(0),
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= _PAGE_S(0)
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
