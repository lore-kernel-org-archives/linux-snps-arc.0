Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E66C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Nov 2022 03:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLJjse3tKkOBVx7JQ0+Ckb8Mi6F1I7fCM4Baespw3p0=; b=LjbWJb22bns85a
	OwRnd9RNGAs08fCfWLR1uZHEbjkZW+QZbpqOLeRmrUa98YVbHLVX1Lec3J63+anh3RXt+bFAoXJD4
	kiCLFvhEBC0vPxHtSU0JtI5vTi0oKOE9uaIcCoq/AEYwL4asgza4nWuvc1gTwnmHgz54d1ronQIGo
	2PjZn3gFndltSc1BGetJck6qwfN3ju7KfJsHcX3oE0KHXEf/wwg6r+34CiIqmCXHsm7AwPLyF2f3y
	FdC3xSoRyN9ptTX9bcvUzV44mACHiECr5GkQALiZ7aqosmRxdTZ2rJMXLAvMXuKWJ082CfbL047Fj
	a3YeJd31LEPy6kgDGmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq42m-0084Dk-6l; Wed, 02 Nov 2022 03:03:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq42k-0084Co-2V
	for linux-snps-arc@lists.infradead.org; Wed, 02 Nov 2022 03:03:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96355617BB;
	Wed,  2 Nov 2022 03:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DF8C433D6;
	Wed,  2 Nov 2022 03:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667358233;
	bh=CjB4e7CrSciOuOmpnSiScNQNWexByrTz+zopxFmQbrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xYTeOYTG0aHo26RHins6Yc7RuTUWoZtD0eGN2luMJqKCXPYRpVmaOmAnpyYJwIE85
	 1WjcyheXtnF3tmcsDJNMiKIUc1C4Cu3FaPLjDn6kV7D8mb1PNzGROWeGy7eDqnzPfH
	 JQrubSWh4oZ637SnGIJz8iAtymVxc/MEIyLGpotM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 063/132] arc: iounmap() arg is volatile
Date: Wed,  2 Nov 2022 03:32:49 +0100
Message-Id: <20221102022101.261962386@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102022059.593236470@linuxfoundation.org>
References: <20221102022059.593236470@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_200354_159241_43E4CA59 
X-CRM114-Status: GOOD (  15.00  )
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
index 8f777d6441a5..80347382a380 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -32,7 +32,7 @@ static inline void ioport_unmap(void __iomem *addr)
 {
 }
 
-extern void iounmap(const void __iomem *addr);
+extern void iounmap(const volatile void __iomem *addr);
 
 /*
  * io{read,write}{16,32}be() macros
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 0ee75aca6e10..712c2311daef 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -94,7 +94,7 @@ void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
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
