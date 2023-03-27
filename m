Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEA1C77B6F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsFHvM+L1/vN2jw+1lrrH+AYiTRKTRc/qsK53En3VmM=; b=hlAxM4hWg9xDkU
	zX3GxoEozWJOFTwHJbDN04VeR/yoHOtkw4Ts+c+KRUgmEK8dx/5/HQm0dDTUXEHuQRM7E5250U8Y5
	+hPa/AqHtmMaRqtsVfG5UpY+3uiS/2ZphLc8m28mwXRZ4utBnmoi+TPPmFr9sSkO3JUXxdrtvE8xS
	SwLrEwK/9W2vOMnhCtobsBsguq4us1+X+SDjUKFo4srxuNenDvHKsQVA47+I6z8OgPVF7ZmtIzK1h
	Xhb5n6JUccH2C6WAxVNhFav6cQ5rquyX42eYubQ2UbcRKDSJCk5D1BGy0T1E9VHirw9NrThYsrwt+
	DIJ4yH7PQMJFzuGbYqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglla-00As9A-10;
	Mon, 27 Mar 2023 12:16:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglkz-00AreK-0d;
	Mon, 27 Mar 2023 12:15:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A573B611CE;
	Mon, 27 Mar 2023 12:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A3DC433A4;
	Mon, 27 Mar 2023 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919324;
	bh=X7ixDT/eME8zr2M/ikt5bC5rQoS3uASy2IlC1ftIdSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y2ffntjZwCcvJ7ZjcddqfIzivLJJTiZqbCBMhicCNOoftlZSKr8SZk1bt+v6QBdJ3
	 AqWhwmcTeaS96y4RUjpqI9FGKTqNfAOz/7RBt+ymuWQLCwljPJr+H8JgdNwFdqMXwE
	 J72tIuLXAnxcA7lDtjwg32UTtKQ0DkssHKQnBWYb3L+gXkApRayP0Mte6XTqD4QU75
	 zUBFdzaO9TiPGVooVFe2U07En2yoiRB9h1tj51608yH2BmWke6vfUVRIXO9jhZyAf0
	 Nifety/7HWh8t+jBWCaVsZT7PH2v1d96plBTbAk5HzBMivkiokDHTCIu3jr6mGkPTw
	 a3+V9R9fKm3ag==
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
Subject: [PATCH 10/21] csky: dma-mapping: skip invalidating before DMA from device
Date: Mon, 27 Mar 2023 14:13:06 +0200
Message-Id: <20230327121317.4081816-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051525_339805_721CFB2E 
X-CRM114-Status: GOOD (  13.01  )
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

csky is the only architecture that does a full flush for the
dma_sync_*_for_device(..., DMA_FROM_DEVICE) operation. The requirement
is only make sure there are no dirty cache lines for the buffer,
which can be either done through an invalidate operation (as on most
architectures including arm32, mips and arc), or a writeback (as on
arm64 and riscv). The cache also has to be invalidated eventually but
csky already does that after the transfer.

Use a 'clean' operation here for consistency with arm64 and riscv.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/mm/dma-mapping.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
index 82447029feb4..c90f912e2822 100644
--- a/arch/csky/mm/dma-mapping.c
+++ b/arch/csky/mm/dma-mapping.c
@@ -60,11 +60,9 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 {
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		cache_op(paddr, size, dma_wb_range);
-		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		cache_op(paddr, size, dma_wbinv_range);
+		cache_op(paddr, size, dma_wb_range);
 		break;
 	default:
 		BUG();
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
