Return-Path: <SRS0=62Of=YK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53944ECE58E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Oct 2019 17:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE252089C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Oct 2019 17:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q+w/JUAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE252089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTFxrLPJDkX7wrldYfZxpL0HURV2zrDGYgqHJ6IU9LU=; b=q+w/JUAKiKVe+8
	U3PGtuggcVE1AFq1nc1/x3ZR4KhFNhEk3QXDLFWrPCMsffhw7g9xrNQAF6iHXKLDBzfOmbV15xEhi
	zZf+0kaHxlApNxVXGjDV0rn5VYpgbxfy8BuxuUw8jdcoD8lPTrwSQkPBI0F5xZ7fhGsut80acbOOi
	PgbdWxo3rqt0FXkeSh04sn9ruCCl6H98Fw/7IIoyDEB6bL5fR81MjiKCeObQMUbDQDoHDbiPx6lfX
	A02+MZQsd+pvKfim6BFVi+pv2q8fjQf6AbNDXFDXQiZ9O9/UgXnmv+o5vMcsgl8cuuD9Lkc7Xkv+J
	5qmQr2gpWqYkcbcz2SyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLA2S-0002Up-22; Thu, 17 Oct 2019 17:58:16 +0000
Received: from [2001:4bb8:18c:d7b:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL9rR-0006Oi-4E; Thu, 17 Oct 2019 17:46:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 20/21] csky: remove ioremap_cache
Date: Thu, 17 Oct 2019 19:45:53 +0200
Message-Id: <20191017174554.29840-21-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017174554.29840-1-hch@lst.de>
References: <20191017174554.29840-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

No driver that can be used on csky uses ioremap_cache, and this
interface has been deprecated in favor of memremap.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/csky/include/asm/io.h | 2 --
 arch/csky/mm/ioremap.c     | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/arch/csky/include/asm/io.h b/arch/csky/include/asm/io.h
index a4b9fb616faa..f572605d5ad5 100644
--- a/arch/csky/include/asm/io.h
+++ b/arch/csky/include/asm/io.h
@@ -36,13 +36,11 @@
 /*
  * I/O memory mapping functions.
  */
-extern void __iomem *ioremap_cache(phys_addr_t addr, size_t size);
 extern void __iomem *__ioremap(phys_addr_t addr, size_t size, pgprot_t prot);
 extern void iounmap(void *addr);
 
 #define ioremap(addr, size)		__ioremap((addr), (size), pgprot_noncached(PAGE_KERNEL))
 #define ioremap_wc(addr, size)		__ioremap((addr), (size), pgprot_writecombine(PAGE_KERNEL))
-#define ioremap_cache			ioremap_cache
 
 #include <asm-generic/io.h>
 
diff --git a/arch/csky/mm/ioremap.c b/arch/csky/mm/ioremap.c
index e13cd3497628..ae78256a56fd 100644
--- a/arch/csky/mm/ioremap.c
+++ b/arch/csky/mm/ioremap.c
@@ -44,13 +44,6 @@ void __iomem *__ioremap(phys_addr_t phys_addr, size_t size, pgprot_t prot)
 }
 EXPORT_SYMBOL(__ioremap);
 
-void __iomem *ioremap_cache(phys_addr_t phys_addr, size_t size)
-{
-	return __ioremap_caller(phys_addr, size, PAGE_KERNEL,
-				__builtin_return_address(0));
-}
-EXPORT_SYMBOL(ioremap_cache);
-
 void iounmap(void __iomem *addr)
 {
 	vunmap((void *)((unsigned long)addr & PAGE_MASK));
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
