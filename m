Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4496C761A6
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vX7hWqoxgncTX4lpp8pLG6yCC8Fz9+ucRO1RefW5Qc4=; b=fNds3I+R7fqDDl
	g9/5EqJrYAh0uFXM6LKwYtIuiBj6g/599tSE6Kri1PM77bs3m8vjFEKoLi50H+pxEyZoCS1EA+N8Z
	wN6wamiVPgm08XdKBuS0GmHmSl6rIRjMFaovRTZ5FEpMjis8vRisMslrkhOm5dN5oX0UDcAJBSnsC
	kd9VGvzxN4K+M9yf538dGXRAcff/DCl3j3KImxItf8Iyy0S2QYm5BkC8QDDRwf7NDOeaIVKhXpRFh
	QrCSLjClVzpBLiAsRtq/Y+1KDZkbVW/pZz7rQGGea4WBpxUzr5Psv7M1TNSHFPEDVSj2vFNfx2RxT
	nRqXWHr5w91/cXPKaDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglm0-00AsVf-1L;
	Mon, 27 Mar 2023 12:16:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgllI-00ArtK-1c;
	Mon, 27 Mar 2023 12:15:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 19650B81184;
	Mon, 27 Mar 2023 12:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FBDC433A0;
	Mon, 27 Mar 2023 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919341;
	bh=uohG58os+YPGsAoIvHYZEyGIjYTpK/zcJikKrAX9FPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hBanRUO40otZWpiIlwJ2ahlYI2/SU8zPpLT3Qw57jJE40woaJrRwcvRFQpLc/CmtF
	 0htU6ckgOgXVZH2DE+dJDcgxfjuUFxw2l8Pn5C7OdFGFsmKKCazqxQQraKNSB0q9Xu
	 8oHDYMJBaw55+tzbreH4Ndmiz3clXO5/H+FcYDQe1iQ34jySEQMALNvOHQCQFHA7Lk
	 5/v6eq8R2opwH5aOlgYkRDsOvBF62H+KLqxeGyv9U6ps8rklWRlmbETlf8xD0OymSe
	 8y75Z9XzlD5evRjJOnI7bZLIIgFEQA8+P2HCk/nt22ZXSqKgj7kPcjr6CG0psnqbOe
	 EFkVwSkNAqLQw==
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
Subject: [PATCH 12/21] mips: dma-mapping: split out cache operation logic
Date: Mon, 27 Mar 2023 14:13:08 +0200
Message-Id: <20230327121317.4081816-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051544_854975_EA778CC1 
X-CRM114-Status: GOOD (  15.47  )
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

The mips arch_sync_dma_for_device()/arch_sync_dma_for_cpu() functions
behave the same way as on other architectures, but in order to unify
the implementations, the code needs to be rearranged to pick the type
of cache operation in the outermost function.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/mm/dma-noncoherent.c | 75 ++++++++++++++--------------------
 1 file changed, 30 insertions(+), 45 deletions(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index b4350faf4f1e..b9d68bcc5d53 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -54,50 +54,13 @@ void *arch_dma_set_uncached(void *addr, size_t size)
 	return (void *)(__pa(addr) + UNCAC_BASE);
 }
 
-static inline void dma_sync_virt_for_device(void *addr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		dma_cache_wback((unsigned long)addr, size);
-		break;
-	case DMA_FROM_DEVICE:
-		dma_cache_inv((unsigned long)addr, size);
-		break;
-	case DMA_BIDIRECTIONAL:
-		if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
-		    cpu_needs_post_dma_flush())
-			dma_cache_wback((unsigned long)addr, size);
-		else
-			dma_cache_wback_inv((unsigned long)addr, size);
-		break;
-	default:
-		BUG();
-	}
-}
-
-static inline void dma_sync_virt_for_cpu(void *addr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		break;
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		dma_cache_inv((unsigned long)addr, size);
-		break;
-	default:
-		BUG();
-	}
-}
-
 /*
  * A single sg entry may refer to multiple physically contiguous pages.  But
  * we still need to process highmem pages individually.  If highmem is not
  * configured then the bulk of this loop gets optimized out.
  */
 static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir, bool for_device)
+		void(*cache_op)(unsigned long start, unsigned long size))
 {
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned long offset = paddr & ~PAGE_MASK;
@@ -113,10 +76,7 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 		}
 
 		addr = kmap_atomic(page);
-		if (for_device)
-			dma_sync_virt_for_device(addr + offset, len, dir);
-		else
-			dma_sync_virt_for_cpu(addr + offset, len, dir);
+		cache_op((unsigned long)addr + offset, len);
 		kunmap_atomic(addr);
 
 		offset = 0;
@@ -128,15 +88,40 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dma_sync_phys(paddr, size, dir, true);
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		dma_sync_phys(paddr, size, _dma_cache_wback);
+		break;
+	case DMA_FROM_DEVICE:
+		dma_sync_phys(paddr, size, _dma_cache_inv);
+		break;
+	case DMA_BIDIRECTIONAL:
+		if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
+		    cpu_needs_post_dma_flush())
+			dma_sync_phys(paddr, size, _dma_cache_wback);
+		else
+			dma_sync_phys(paddr, size, _dma_cache_wback_inv);
+		break;
+	default:
+		break;
+	}
 }
 
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	if (cpu_needs_post_dma_flush())
-		dma_sync_phys(paddr, size, dir, false);
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		if (cpu_needs_post_dma_flush())
+			dma_sync_phys(paddr, size, _dma_cache_inv);
+		break;
+	default:
+		break;
+	}
 }
 #endif
 
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
