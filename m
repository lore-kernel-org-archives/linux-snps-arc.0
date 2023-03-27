Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A751C76195
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQG9YmF2bGT5yo1UoN6Gmg9B2rXwyKTApv39sFkz9VY=; b=d7aaQHtnfIYtG+
	91qnTICoda3gmtVlOpmEnQ54s0eLfqqhnICLiNm5FVaqiXNm3C6yc+5RNPhV5HtTHdJDELvMrND22
	yIT6rl0x4tyub/umUaaYQBRr0BgAt/3OngT7UzTrHzCMfAjZje0Q2P5Qsjd1S0LBZYSm7MY5NIE6F
	vyVPn563PNA5MuUrG4Yip/KyXLFHnw/za5xPjVvat3kMr278GX2kCeU1Hi7LoTyIkf7WboQr7Xq90
	qd/f3SK+jEj9HaR+d+8aw+boDxokpMNdvbeBRwZKnrErrNJpsAwj/YiabAi/4wiFFciJMFr5XoG3G
	+KoUZjU6W2OhxvrfU0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgllE-00Arqz-20;
	Mon, 27 Mar 2023 12:15:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglkh-00ArQE-2i;
	Mon, 27 Mar 2023 12:15:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65B2E611EE;
	Mon, 27 Mar 2023 12:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A790C4339E;
	Mon, 27 Mar 2023 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919307;
	bh=p+eG9OtxIwlFEHuBl1BynARl6RQHBxG84PbOJSDaMSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7yTj16MC4QC0lUkI+OlRgN70GEfUAXZsHUm34awwsfDq+uuBVpGn8XzMpAYzrKep
	 rzfZf9IvuTrt/evwGGuCXfuT5QwwzcXZODB9YgjYpxv0iZgT9rwRfHG1vVFKHMnR80
	 WkjKXapkPoQqpX0z8bvvlpG0YOBt+p7Spw/IdU0XpPUFOYiASiKd39EeZPyxyEYUJn
	 9ZY055tF4c7BVKMQhNCmNKfo+NgnV/grwYyrPuAwvgV7tJNlhsepLbNs91InZGtrtI
	 0UOObEmqhXtHeujJTAybyrsno6jtIGCIZbfee+GXSUa8z2HvG7G/GO5AeAihPvul14
	 jCOgl+Q3LDa9w==
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
Subject: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
Date: Mon, 27 Mar 2023 14:13:04 +0200
Message-Id: <20230327121317.4081816-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051507_921967_1CEFB6A4 
X-CRM114-Status: GOOD (  14.90  )
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

No other architecture intentionally writes back dirty cache lines into
a buffer that a device has just finished writing into. If the cache is
clean, this has no effect at all, but if a cacheline in the buffer has
actually been written by the CPU,  there is a drive bug that is likely
made worse by overwriting that buffer.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/mm/dma-noncoherent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..640f4c496d26 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
 		break;
 	default:
 		break;
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
