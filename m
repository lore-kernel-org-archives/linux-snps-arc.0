Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DF5C77B61
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfYc/CFMVvzJ/AabKjzho+Sxa8LNjhAhgpwixagYtKg=; b=ctzhcVp3ieG+Mw
	gXjqn2hv4RDYQAMOgl6R3/69i/BvaekSqNKQGXCYsBKspHuzB7V38i8w8LuhOdPmRo2b6RiOY/yVe
	Mi3GvTK7ddZ1oePc/QGmHinuUEuylvDQq9sZIAwx18X3ho6Kffenr/w48kImoRHMB1lOFKH1YZ5/4
	BHFab7HzS6+oAL4qb7n7N6tMbFDY7DshqmVjqenkWTxeZ34WLanOJI8oVb29CLeYGEcx6Aek2YdPW
	MIr9manp2VgXZ1NYsCsxUVsQH8CmzQxgNHtdocN1NFzZ2nBMnnnl9NO+F7RbEh/frfUzyOJkILU5i
	sKRG/9nwYSBoUcU8E+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgln4-00AtMT-1y;
	Mon, 27 Mar 2023 12:17:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglli-00AsFf-27;
	Mon, 27 Mar 2023 12:16:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1CE8CB81189;
	Mon, 27 Mar 2023 12:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F899C433EF;
	Mon, 27 Mar 2023 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919367;
	bh=YBtSO0RmdwE2AW1zN7HUJxa9NfwhIOXNCN8O+lzIRNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UN64uPXQtdeLkLg4dn09AzIarAchhb4d1x34/SjwyiZWrDrJBuSzm2pjxivirdXOH
	 jDWvdVBlPURZiAbbZkwr+j/acZdOxZqq6cGIPFvZdjZpd4mtJpLB9c6+CCJIpq7WlT
	 yKwLGhptYzLT9fUIHqk5I/wF2qbPA7Jz2AgpBslZNOD+sEJ3MsZmMDIhBSPTN1n5u3
	 xeD/9JePzosgXXiQzUg8ldJpqSjwUr9LKOTYJUPw5exVgHkbXy8JjWNj5CwfmVQvWQ
	 Tf5G78NWWF9z4lJFW3lBVqt8Ks2rBF4G8TjU0+Ep1wg2uWq1/XkSNqoo9R0+XEHkMt
	 ETlJDU59jGtbg==
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
Subject: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches before DMA
Date: Mon, 27 Mar 2023 14:13:11 +0200
Message-Id: <20230327121317.4081816-16-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051610_989244_54D9E1D4 
X-CRM114-Status: GOOD (  15.10  )
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

Most ARM CPUs can have write-back caches and that require
cache management to be done in the dma_sync_*_for_device()
operation. This is typically done in both writeback and
writethrough mode.

The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
(arm920t, arm940t) implementations are the exception here,
and only do the cache management after the DMA is complete,
in the dma_sync_*_for_cpu() operation.

Change this for consistency with the other platforms. This
should have no user visible effect.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/cache-v4.S   | 8 ++++----
 arch/arm/mm/cache-v4wt.S | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index 7787057e4990..e2b104876340 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -117,23 +117,23 @@ ENTRY(v4_dma_flush_range)
 	ret	lr
 
 /*
- *	dma_unmap_area(start, size, dir)
+ *	dma_map_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4_dma_unmap_area)
+ENTRY(v4_dma_map_area)
 	teq	r2, #DMA_TO_DEVICE
 	bne	v4_dma_flush_range
 	/* FALLTHROUGH */
 
 /*
- *	dma_map_area(start, size, dir)
+ *	dma_unmap_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4_dma_map_area)
+ENTRY(v4_dma_unmap_area)
 	ret	lr
 ENDPROC(v4_dma_unmap_area)
 ENDPROC(v4_dma_map_area)
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index 0b290c25a99d..652218752f88 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -172,24 +172,24 @@ v4wt_dma_inv_range:
 	.equ	v4wt_dma_flush_range, v4wt_dma_inv_range
 
 /*
- *	dma_unmap_area(start, size, dir)
+ *	dma_map_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wt_dma_unmap_area)
+ENTRY(v4wt_dma_map_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_TO_DEVICE
 	bne	v4wt_dma_inv_range
 	/* FALLTHROUGH */
 
 /*
- *	dma_map_area(start, size, dir)
+ *	dma_unmap_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wt_dma_map_area)
+ENTRY(v4wt_dma_unmap_area)
 	ret	lr
 ENDPROC(v4wt_dma_unmap_area)
 ENDPROC(v4wt_dma_map_area)
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
