Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25C2C77B62
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJWdAqK5KHW+fPqqokZ5n9eBbN6Jy6nFtB98dBXgDMo=; b=YHGzSzPLouXArO
	KZxOvL7rkmyRUms5QS7xCSTXCtEVJnt9fbJQT7FktlrEajWa7vBTYDm1LD+5Gh2vn+0y2DAvyPEnj
	P29b+uFy9Cp71ZUirVEvPPgTWndvPvPxJ3p8940Les6rFLXaK0jOK+HTNy59AJsmfwnAIT8AXXs1r
	yVRo+vlynMTNS0/RM13bmsnr1eECFwO0crmxdnDUk6VpH7aDd61HUYz/FbeIx1/628PoJX8gmdKbX
	9473xKm5LXrJkcLV2eZUtEojDxVKshwcmSk8dpoP/z6gKZI2OCNAQNGMg/STCrSMtpnvieqIWiQVb
	znmizg5L4usibjJujxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgll4-00AriK-0M;
	Mon, 27 Mar 2023 12:15:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglkb-00ArKp-0k;
	Mon, 27 Mar 2023 12:15:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C83ABB81158;
	Mon, 27 Mar 2023 12:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660FDC4331E;
	Mon, 27 Mar 2023 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919298;
	bh=Y+wx0FiQgLjkqhPKxtczgrowoCTrPuzhrrVdIO/KSAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPGniWUcV5VUAZiOWzIY5/EsUqYQgyEzxjQ8UMeF3Al20/Hh61j9pc8T9PS2mzH4N
	 RSYd/J7YHPH5Nmfk7XsUSK79nWPo+dGlRYvhxWqnqg+N+CIjbuT/Wb2iRTjyp1l0YE
	 q3AT+X8nNFF6xSpGl06sKKOZy0e/LCKNsDpUgC07vuwopI9ykgcvXa2bBFGYOjVaGl
	 X5PV9Eydwk0GTrNzStCQUtT6ovd3xxwDRfs6NRHuZY4OjKijI2Z6KdM95ztBnGcDwK
	 5HPw8DEJ4VDkMTWgdZ8nt+6QlnfKBn6oiVjPRF9H4yYTieJdfpVbSHx8IkThq5gzbA
	 lsa0aYW1Hchqw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org
Subject: [PATCH 07/21] powerpc: dma-mapping: always clean cache in _for_device() op
Date: Mon, 27 Mar 2023 14:13:03 +0200
Message-Id: <20230327121317.4081816-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051501_604501_D8D8087D 
X-CRM114-Status: GOOD (  20.61  )
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

From: Arnd Bergmann <arnd@arndb.de>

The powerpc implementation of arch_sync_dma_for_device() is unique in that
it sometimes performs a full flush for the arch_sync_dma_for_device(paddr,
size, DMA_FROM_DEVICE) operation when the address is unaligned, but
otherwise invalidates the caches.

Since the _for_cpu() counterpart has to invalidate the cache already
in order to avoid stale data from prefetching, this operation only really
needs to ensure that there are no dirty cache lines, which can be done
using either invalidation or cleaning the cache, but not necessarily
both.

Most architectures traditionally go for invalidation here, but as
Will Deacon points out, this can leak old data to user space if
a DMA is started but the device ends up not actually filling the
entire buffer, see the link below.

The same argument applies to DMA_BIDIRECTIONAL transfers. Using
a cache-clean operation is the safe choice here, followed by
invalidating the cache after the DMA to get rid of stale data
that was prefetched before the completion of the DMA.

Link: https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/dma-noncoherent.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index e108cacf877f..00e59a4faa2b 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -104,26 +104,7 @@ static void __dma_phys_op(phys_addr_t paddr, size_t size, enum dma_cache_op op)
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	switch (direction) {
-	case DMA_NONE:
-		BUG();
-	case DMA_FROM_DEVICE:
-		/*
-		 * invalidate only when cache-line aligned otherwise there is
-		 * the potential for discarding uncommitted data from the cache
-		 */
-		if ((start | end) & (L1_CACHE_BYTES - 1))
-			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
-		else
-			__dma_phys_op(start, end, DMA_CACHE_INVAL);
-		break;
-	case DMA_TO_DEVICE:		/* writeback only */
-		__dma_phys_op(start, end, DMA_CACHE_CLEAN);
-		break;
-	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
-		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
-		break;
-	}
+	__dma_phys_op(start, end, DMA_CACHE_CLEAN);
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
