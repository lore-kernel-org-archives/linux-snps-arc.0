Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F343EC7619A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk6tvu0x/HuH5ef/bnNoo8R68Dd89PLQI081WizI49U=; b=gG7ffK0ik3CJUG
	w69zG0tUb3yfML1QFw/YtC6/eHh2fY765v+EIiqRksaa9IVzjBD1IsZwhVetuJgXoFdu3JCf51stx
	DgJOC2d22pRfRAnTrsuTUjG/WQcXI+TZlMPVVBUVvBa7TEyxfOtTVFWsBQiVJCbBVqsv9GN8JIpI/
	wS3a9kImLTgfiOfpt3gM0cN2Flbtv3evUeQwiHI8Om3QabzUevBlgk15FFyQFb06fTX3zXN0kMslf
	rrLwKIfc/pFUPnSVm0UpngYODLUe8JOp0Ke8hMofcY+/bYsFcYAweCdSTbNHmb1ZYE0NVflIQISmM
	0V2MvYuv9SJsbR4EBXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglkR-00ArES-0W;
	Mon, 27 Mar 2023 12:14:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglk9-00Ar2m-1M;
	Mon, 27 Mar 2023 12:14:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD90D611ED;
	Mon, 27 Mar 2023 12:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9C0C433EF;
	Mon, 27 Mar 2023 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919272;
	bh=ZhYG8JNUwjljPv9OKiF3eMGP7VJHxmj1d7o6guSf4No=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PBdwMSfV6WhGkWO4GD6yfcHOXcUpefrDC/+txqBn1K1TXjh6vtxTQLHjgNJ0FEkt0
	 8kEYArEe0oN6TTz55A/ouqhYMm5G10akCJmXzW/muCfT8GBSGN5Uni+3VEARUH4Auc
	 H3B65ricYeSXsGj53UrQTCcr95NZtYK/45G5qbsvcFbKhYxNglRYB3Jv/RHrFzHtks
	 DVdr6HivllSdF2l5dgd1hATA9JZvKqwXHc1koDjA6e60zts4nydXjlN/RqoC6otSSa
	 Tq0Qb2MNzDbHG7RwE+Edr/TKARawLeFdDNo+IyVrlawBJzvWe5xP0tuqDo6AiiQKTk
	 Trtj2/d6VSosQ==
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
Subject: [PATCH 04/21] microblaze: dma-mapping: skip extra DMA flushes
Date: Mon, 27 Mar 2023 14:13:00 +0200
Message-Id: <20230327121317.4081816-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051433_563082_9B47865A 
X-CRM114-Status: GOOD (  13.54  )
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

The microblaze dma_sync_* implementation uses the same function
for both _for_cpu() and _for_device(), which is inconsistent
with other architectures and slightly more expensive.

Split it up into separate functions and skip the parts that
are not needed:

 - on dma_sync_*_for_cpu(..., DMA_TO_DEVICE), skip the second
   writeback, which does nothing.

 - on dma_sync_*_for_cpu(..., DMA_BIDIRECTIONAL), only invalidate
   the cache to clear out cache lines that got loaded speculatively,
   but skip the extraneous writeback.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/microblaze/kernel/dma.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/microblaze/kernel/dma.c b/arch/microblaze/kernel/dma.c
index 04d091ade417..b4c4e45fd45e 100644
--- a/arch/microblaze/kernel/dma.c
+++ b/arch/microblaze/kernel/dma.c
@@ -14,8 +14,8 @@
 #include <linux/bug.h>
 #include <asm/cacheflush.h>
 
-static void __dma_sync(phys_addr_t paddr, size_t size,
-		enum dma_data_direction direction)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
 {
 	switch (direction) {
 	case DMA_TO_DEVICE:
@@ -30,14 +30,16 @@ static void __dma_sync(phys_addr_t paddr, size_t size,
 	}
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_sync(paddr, size, dir);
-}
-
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	__dma_sync(paddr, size, dir);
-}
+	switch (direction) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_BIDIRECTIONAL:
+	case DMA_FROM_DEVICE:
+		invalidate_dcache_range(paddr, paddr + size);
+		break;
+	default:
+		BUG();
+	}}
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
