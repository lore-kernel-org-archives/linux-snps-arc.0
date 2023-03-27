Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8239AC76195
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MSbAw1o5jrU/QWrbRzPx542wI+O8k+mnWGdFvjSRpg=; b=hJYxiUSBKkxtv4
	Evk5xhGLZPFM7A+MPuNA8MQ3FJuK5BnwFiUGIpU7I/Un5irvx4xwoEB8yh4HjH6D0uqzpm+lH8nQS
	30bnkvxlwyQUVEmP02TjUvZkxKNpgUp+UhS2CGmUOP9/lRGJOk8bD2htlSdVnFpNkvJQqYicOCecG
	IhzzEW0cKdL9j0NGxYkUGCepXMGlXWn7xA9B76+hlpftUCSP2l9OMfRr+RTxaHX5l9aiguTpIN1me
	99vLF+7U/1J/MLVEJH8jK4wpCS8lr53R/EYQwzCprIvU0qptpMtlBN0kCtqtXWedIEzyW6RepOq+Y
	O0a4rlisT5iR3BybUDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglk5-00Ar0X-2I;
	Mon, 27 Mar 2023 12:14:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgljs-00AqsK-2t;
	Mon, 27 Mar 2023 12:14:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E406F611E4;
	Mon, 27 Mar 2023 12:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CE2C433A0;
	Mon, 27 Mar 2023 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919255;
	bh=5/cbd11rgdZqe98FqIk/+syngKp9Hy8AwsMD312+wVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fI64KM8c/Ekdiv2ZKC9IycZF7Z2nU1AzPzgqokBHDE9VzldOQyySG0AudPk5QPofj
	 KAKyhzuHamSmO3zl8PCYGHrnv/203MoC5ecW0OjEqVJXXqlBlkvMLUmkWssApHxxv2
	 Nle0M09VxMvwHkFtDoEoZZpkFdiqCr9l1gU8/Flrgm0ruvonqEUiwE55/I56ExeNoX
	 WEmup8vMT0HfEzIuq/Zd5NckCFP+2d9Yrt6tk6M/3Yd774PQBapWJuZm2ObMbJ+u0A
	 XjUj222I9wl7wwTdyN+au9fLk6dq48OfUVC/8hF0sIbpcUutGH1P8vbg+6qI4iIj1V
	 LMbvRTLfiHWVg==
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
Subject: [PATCH 02/21] xtensa: dma-mapping: use normal cache invalidation rules
Date: Mon, 27 Mar 2023 14:12:58 +0200
Message-Id: <20230327121317.4081816-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051417_028759_769087F3 
X-CRM114-Status: GOOD (  18.44  )
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

xtensa is one of the platforms that has both write-back and write-through
caches, and needs to account for both in its DMA mapping operations.

It does this through a set of operations that is different from any
architecture. This is not a problem by itself, but it makes it rather
hard to figure out whether this is correct or not, and to unify this
implementation with the others.

Change the semantics to the usual ones for non-speculating CPUs:

 - On DMA_TO_DEVICE, call __flush_dcache_range() to perform the
   writeback even on writethrough caches, where this is a nop.

 - On DMA_FROM_DEVICE, invalidate the mapping before the DMA rather
   than afterwards.

 - On DMA_BIDIRECTIONAL, combine the pre-writeback with the
   post-invalidate into a call to __flush_invalidate_dcache_range()
   that turns into a simple invalidate on writeback caches.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/xtensa/Kconfig                  |  1 -
 arch/xtensa/include/asm/cacheflush.h |  6 +++---
 arch/xtensa/kernel/pci-dma.c         | 29 +++++-----------------------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index bcb0c5d2abc2..b938bacbb9af 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -8,7 +8,6 @@ config XTENSA
 	select ARCH_HAS_DMA_PREP_COHERENT if MMU
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
-	select ARCH_HAS_SYNC_DMA_FOR_CPU if MMU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if MMU
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_HAS_STRNCPY_FROM_USER if !KASAN
diff --git a/arch/xtensa/include/asm/cacheflush.h b/arch/xtensa/include/asm/cacheflush.h
index 7b4359312c25..2f645d25565a 100644
--- a/arch/xtensa/include/asm/cacheflush.h
+++ b/arch/xtensa/include/asm/cacheflush.h
@@ -61,9 +61,9 @@ static inline void __flush_dcache_page(unsigned long va)
 static inline void __flush_dcache_range(unsigned long va, unsigned long sz)
 {
 }
-# define __flush_invalidate_dcache_all()	__invalidate_dcache_all()
-# define __flush_invalidate_dcache_page(p)	__invalidate_dcache_page(p)
-# define __flush_invalidate_dcache_range(p,s)	__invalidate_dcache_range(p,s)
+# define __flush_invalidate_dcache_all		__invalidate_dcache_all
+# define __flush_invalidate_dcache_page		__invalidate_dcache_page
+# define __flush_invalidate_dcache_range	__invalidate_dcache_range
 #endif
 
 #if defined(CONFIG_MMU) && (DCACHE_WAY_SIZE > PAGE_SIZE)
diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index 94955caa4488..ff3bf015eca4 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -43,38 +43,19 @@ static void do_cache_op(phys_addr_t paddr, size_t size,
 		}
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
 	switch (dir) {
-	case DMA_BIDIRECTIONAL:
+	case DMA_TO_DEVICE:
+		do_cache_op(paddr, size, __flush_dcache_range);
+		break;
 	case DMA_FROM_DEVICE:
 		do_cache_op(paddr, size, __invalidate_dcache_range);
 		break;
-
-	case DMA_NONE:
-		BUG();
-		break;
-
-	default:
-		break;
-	}
-}
-
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
 	case DMA_BIDIRECTIONAL:
-	case DMA_TO_DEVICE:
-		if (XCHAL_DCACHE_IS_WRITEBACK)
-			do_cache_op(paddr, size, __flush_dcache_range);
+		do_cache_op(paddr, size, __flush_invalidate_dcache_range);
 		break;
-
-	case DMA_NONE:
-		BUG();
-		break;
-
 	default:
 		break;
 	}
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
