Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17693C00140
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Aug 2022 02:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OkRnuq3Afb9vQYV14HG54t0HVnJr+8t50fHOtoicjHA=; b=dDfeEJfKnh5W7b
	VYNdBmax5DkDQihaeREU/y3YYg9/P90vddhNbV2JbTjGYxrcFKaN4ZiICtCyOFZvE6CXkZy1Brwdx
	wpF1QytZUPQCSVWoDEbsLZFlZTq2uwiMnyHRrYvQDvjkOf4m9b2sE6GqALCZKYA9ZoAJGj6e5hBp1
	CjdFo0YdLqTLwZCLAbJ9MNkQxkcf64aUB+73OWQFwgaiP6A9F07jt/sswiOADO92rr15lOAvNn3/W
	2lSvkoICKU/7mEJQc5dXRH3Izqdw8rVskXaeOskNzDa8pySLqR9CBWKU5OavvdoVHZt9hBH9/N1/Y
	1RT0XQF+ss24B5Qbgy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLyMI-004NGY-ON; Thu, 11 Aug 2022 02:55:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLyMD-004NDt-8j; Thu, 11 Aug 2022 02:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Jzyo+iYNgVUkHsSusX0d5oO/AbbInRuXxWwwfsFl1po=; b=ZqxVPXAEAP/xp/3NjgEuHOtLun
	zvmhs7xH4BdT4AkW0Bav+iJj02F7JGZAwBLvPG15NSkduXYK4U/WuhFRASPFxdNPu14ldNi1MS2qq
	QrFpUSzoB3vvqgZYMdvnEEWH8lbbG/M7B26Sq6gj+5HYfroc0DIgSR6K4BHFKbSBuXvBFLQwbEuHz
	LuaCinGXUt00HmckdUJvJa9upNaCMl06yyCq8ZYlJNE2XfJK1fhRtYju8eUHN0PmIkxSylBYas6HP
	WaQJF9sHCyJf7t+hykbC6H671oXeiz7NR5Qhfvjtn6T1yL4Gdp+urbmb5UvoyZQG0PF496lff/46Y
	gFM99onA==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLyMA-0000ID-VO; Thu, 11 Aug 2022 02:55:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: align iounmap() argument with other architectures
Date: Wed, 10 Aug 2022 19:55:30 -0700
Message-Id: <20220811025530.2484-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
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

Add 'volatile' to iounmap()'s argument to prevent build warnings.
This make it the same as other major architectures.

Example (one of many):
drivers/scsi/aacraid/nark.c: In function 'aac_nark_ioremap':
drivers/scsi/aacraid/nark.c:36:28: error: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [-Werror=discarded-qualifiers]
   36 |                 iounmap(dev->base);
In file included from ../include/linux/io.h:13,
                 from ../include/linux/irq.h:20,
                 from ../include/asm-generic/hardirq.h:17,
                 from ./arch/arc/include/generated/asm/hardirq.h:1,
                 from ../include/linux/hardirq.h:11,
                 from ../include/linux/interrupt.h:11,
                 from ../include/linux/pci.h:38,
                 from ../drivers/scsi/aacraid/nark.c:18:
arch/arc/include/asm/io.h:35:41: note: expected 'const void *' but argument is of type 'volatile void *'
   35 | extern void iounmap(const void __iomem *addr);

Fixes: 1162b0701b14 ("ARC: I/O and DMA Mappings")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/include/asm/io.h |    2 +-
 arch/arc/mm/ioremap.c     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -32,7 +32,7 @@ static inline void ioport_unmap(void __i
 {
 }
 
-extern void iounmap(const void __iomem *addr);
+extern void iounmap(const volatile void __iomem *addr);
 
 /*
  * io{read,write}{16,32}be() macros
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -94,7 +94,7 @@ void __iomem *ioremap_prot(phys_addr_t p
 EXPORT_SYMBOL(ioremap_prot);
 
 
-void iounmap(const void __iomem *addr)
+void iounmap(const volatile void __iomem *addr)
 {
 	/* weird double cast to handle phys_addr_t > 32 bits */
 	if (arc_uncached_addr_space((phys_addr_t)(u32)addr))

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
