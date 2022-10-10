Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C52BC433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Oct 2022 02:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VC8Ww6uXl+pIFd8GLbcjCxsOzxhSYgGFQF7bmZVQYSg=; b=J7HhJ4kwrsCWgk
	9PUJFc5oYB3l1Yeg2uSV9i2cO5vTm9o+NgcwIbl2/rfq7YmYAocL1CtLCbF/F7LJaNV2EkcowQU+6
	E+AyXVJ1Qs+YLZK4jHIKjBxllcKQhd+EViIsMJM5QwvUJp2Co98ruiRUVoAtmvhVJxqKrmP5uThHg
	W7OXA41WXBACHV/FtMHVFsQvfUOJkgI40mJCNiDVhskkhKla1y0r8G48ipcUUDtYF+hv/IrLejoxZ
	eSr09OQ6wNXlJhxYg/ydcRhC4p5/+ndGeZQBRVEKs85Amo39WaE0FK8xj+bAQGLJqMq3WcdCwAPth
	ISD4AkMZwzplEGeS057Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohiXG-00GlaZ-IH; Mon, 10 Oct 2022 02:28:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohiXE-00GlaL-T4; Mon, 10 Oct 2022 02:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bW00+3CNMe4I7RwtZMffKEyycBp1VFQ01aFjOTkzmCc=; b=TFadtXSx5e8TK+GkPBm3cRbAP/
	QO5L999z2KcZ6BXBlH1ztfy2uR/T/zWT0H4HSXGPnCK2gHQXJyqHWCNhj6Y7+rIdQKEudS1ul8/yk
	vL3CMe0gXDHK7SvcjUEYc13a2/wGjmlDmUsL5F41knHs9mgtcrAd7eQe2v9q+EvFRVHbrK5Vx8Ofk
	Xen52aKkZQt2SvkTCkQ2KLOxE6gPbEYJR5ahggCliramY9Q1dpDW0ViiR3hZoERz6FE8/WrTq6uK2
	nvggi/siXcFTO7d3pRPoMDkEqb2eUMwxSg37MsDAJSY07rhOfUvY3+q1awyRkFSuECK25JuGEMFK7
	LLbKTP2g==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohiXG-003sr6-Gg; Mon, 10 Oct 2022 02:28:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] arc: iounmap() arg is volatile
Date: Sun,  9 Oct 2022 19:28:46 -0700
Message-Id: <20221010022846.20101-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
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

Placates these warnings: (12 such warnings)

../drivers/video/fbdev/riva/fbdev.c: In function 'rivafb_probe':
../drivers/video/fbdev/riva/fbdev.c:2067:42: error: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [-Werror=discarded-qualifiers]
 2067 |                 iounmap(default_par->riva.PRAMIN);

Fixes: 1162b0701b14b ("ARC: I/O and DMA Mappings")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>
---
v2: add Arnd to Cc: list

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
