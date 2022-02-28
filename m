Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D19C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Feb 2022 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufjIPRrWlm7Dozn0Y7Qa7t+7O1L+eAS5iZ1rZp/+X1k=; b=WXmA5JfVvrXyKb
	n1I/zp24U93QVQmxCrt1L2IeUN+gjG3LYPwuCBmnL/LFMqx5Asfq+dXKqfVr1iJfkb7VckBrc+/zu
	Illcjqa8XmmIvUMMAuDGgEOfdmWrIchz6MPYkMTdYxSL1kgk0WoIa1ok5UkFvrx6aeVIYSZ2ucgGI
	FUNHk6Bto2F07zcRJ2rRc9a7oXOriEVXd+LsbDtUj2PJrJ6jDS40pznQqz0viLoeNVA2HglMlN0SA
	YrsJoUVLJG3i7pstifWskkuMnk2nwL8V3LZDsidVLkHi0SskRMLKeHj8S63s7jb8wFg8AFoC/SZ72
	YU/u++m2xDoAfU9CTZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOdpS-00BgNM-S7; Mon, 28 Feb 2022 11:04:34 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdcM-00BYW5-KU; Mon, 28 Feb 2022 10:51:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0089B1063;
 Mon, 28 Feb 2022 02:51:02 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD8333F73D;
 Mon, 28 Feb 2022 02:50:53 -0800 (PST)
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
 linux-arch@vger.kernel.org, Richard Henderson <rth@twiddle.net>
Subject: [PATCH V3 16/30] alpha/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 28 Feb 2022 16:17:39 +0530
Message-Id: <1646045273-9343-17-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_025102_804981_C71C5941 
X-CRM114-Status: UNSURE (   8.99  )
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

Cc: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/alpha/Kconfig               |  1 +
 arch/alpha/include/asm/pgtable.h | 17 ---------------
 arch/alpha/mm/init.c             | 37 ++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 4e87783c90ad..73e82fe5c770 100644
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
index 02f0429f1068..9fb5e9d10bb6 100644
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
index f6114d03357c..2e78008b2553 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -280,3 +280,40 @@ mem_init(void)
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
 	memblock_free_all();
 }
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return _PAGE_P(_PAGE_FOE | _PAGE_FOW | _PAGE_FOR);
+	case VM_READ:
+		return _PAGE_P(_PAGE_FOE | _PAGE_FOW);
+	case VM_WRITE:
+	case VM_WRITE | VM_READ:
+		return _PAGE_P(_PAGE_FOE);
+	case VM_EXEC:
+		return _PAGE_P(_PAGE_FOW | _PAGE_FOR);
+	case VM_EXEC | VM_READ:
+		return _PAGE_P(_PAGE_FOW);
+	case VM_EXEC | VM_WRITE:
+	case VM_EXEC | VM_WRITE | VM_READ:
+		return _PAGE_P(0);
+	case VM_SHARED:
+		return _PAGE_S(_PAGE_FOE | _PAGE_FOW | _PAGE_FOR);
+	case VM_SHARED | VM_READ:
+		return _PAGE_S(_PAGE_FOE | _PAGE_FOW);
+	case VM_SHARED | VM_WRITE:
+	case VM_SHARED | VM_WRITE | VM_READ:
+		return _PAGE_S(_PAGE_FOE);
+	case VM_SHARED | VM_EXEC:
+		return _PAGE_S(_PAGE_FOW | _PAGE_FOR);
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return _PAGE_S(_PAGE_FOW);
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
+		return _PAGE_S(0);
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
