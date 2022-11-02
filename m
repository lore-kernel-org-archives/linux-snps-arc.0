Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA82C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Nov 2022 03:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AH7qF0AlG/ucJIsLNW4Y6YGxEHCH4RJlQwcFYCTjcB8=; b=IOo8N6f6G6+1JR
	wJeMbJIm2/1WBaCa79HR5vLLKH3pa0CB70cfr6q0HPao/qz9g0oIOB9viZj1lLnBHGVamUxKCkOhA
	N0MCz4Ed0Jqft7Bp8CSBPmIRHMZZntcnsmSBlsZUoizYpS7/EhbjWV0wGDU/k43j4UdZGApPFQJba
	LSReI3dVM559+ySWsJ8Nf8fuFidc+3tRriBc5G01EwFrsjLcCkF9lC9vG78tQhC+pDONVRUlrlhXK
	+lYhPTRJwE58tanspof2ED76H9aHM1ksJ8p2WYMyhB1Q9myBEPO11fx6ZaFFuy2fsKqL7Sme/qyVf
	wCF/Z+oLaXd+piHYJHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq4eo-0088qF-H3; Wed, 02 Nov 2022 03:43:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq4el-0088pZ-6L
	for linux-snps-arc@lists.infradead.org; Wed, 02 Nov 2022 03:43:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D8CCEB8205C;
	Wed,  2 Nov 2022 03:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A8EC433D7;
	Wed,  2 Nov 2022 03:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667360588;
	bh=EGgt/f4egVDDTJ1p5uzb0miQFFnQ4Z5q5N2Epy+h1h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sQOrrLfxywjUeSYRF/2+opNseCuYNDUQ//33oY9/xCQWg4php9Su0+5wOqoF5KJp2
	 DDH2S909h+PdJZPkUjr/AQMmI3hVJAMa2lQbq8POjViSgF8Wkz9G5VV1i7h1renH4A
	 DmPR1pdyy0qGeCOu6MRWYBMyQDU1xTNsOx1ii5fw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 37/60] arc: iounmap() arg is volatile
Date: Wed,  2 Nov 2022 03:34:58 +0100
Message-Id: <20221102022052.291402518@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102022051.081761052@linuxfoundation.org>
References: <20221102022051.081761052@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_204311_384871_97FF05B5 
X-CRM114-Status: GOOD (  14.84  )
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit c44f15c1c09481d50fd33478ebb5b8284f8f5edb ]

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
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/include/asm/io.h | 2 +-
 arch/arc/mm/ioremap.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index 2f39d9b3886e..19d0cab60a39 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -35,7 +35,7 @@ static inline void ioport_unmap(void __iomem *addr)
 {
 }
 
-extern void iounmap(const void __iomem *addr);
+extern void iounmap(const volatile void __iomem *addr);
 
 #define ioremap_nocache(phy, sz)	ioremap(phy, sz)
 #define ioremap_wc(phy, sz)		ioremap(phy, sz)
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 9881bd740ccc..0719b1280ef8 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -95,7 +95,7 @@ void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
 EXPORT_SYMBOL(ioremap_prot);
 
 
-void iounmap(const void __iomem *addr)
+void iounmap(const volatile void __iomem *addr)
 {
 	/* weird double cast to handle phys_addr_t > 32 bits */
 	if (arc_uncached_addr_space((phys_addr_t)(u32)addr))
-- 
2.35.1




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
