Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E64C76195
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8g8qK84aozYhcZ85cs73Ih7WUpCi4WVzhKm2v+Ph5z8=; b=wmFIHgnn+rMuRg
	Q62EAt80nIn4v/j9VbC1rO9Cx45+Qe/bRokv0gq0k9DpWjHMvyzqbxBcONAex42yiBQTPScTcqJWz
	0yStfSzLSbeea6UWaIVu34xprtjgHn0IRfWIwQL4JiHrpKWbXSdzcz31p74fvOY1whgwqMNhR2DYe
	asdjvLtj9sw+cGTnJ8cNTcjznvdcUrjQesj5k48GNLdJdFfsKwfgifgsByfOmhv6lyUR2yMw3fHSg
	1qy+UrFpt/EmLmW5zQqK3OVhrntzY6/Lb3/qpE8iCvpEuGFIkLA8GBqXYLdOU3irVmNmZchC/ye8J
	nBMwul0Ym1AJPIA9m1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglmI-00Askf-0J;
	Mon, 27 Mar 2023 12:16:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgllR-00As0I-0u;
	Mon, 27 Mar 2023 12:15:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6BE7B80D0C;
	Mon, 27 Mar 2023 12:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C656C4339B;
	Mon, 27 Mar 2023 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919350;
	bh=WcyJUuclgspkZHSwVclV5Jksx+zy3hY89ahpztaj0hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gF/2rqKM1LHnyfHfzF1g693XZNfrbHBqd2oKlgoQ2jGFc8xTOws4qsH2njENSW1Si
	 OGeqBCL1Lt3BSCm5fmGZhO1H6HKEoKzetUEYMk3Soh/1yhM8nZtCol16EHntqcT8Er
	 pM+o9uzAgZL1iYBAWUy3z6yGzIeoUU0K+TXymgHYz7EqbCIvcrn8MMo6RRjBuEtKTx
	 6l+8vcM3FOZ1WkoHQ1Wlf6+gyjrHJP0Ci4xI/sPZptxVi/W3OXZggPcMTH3OeaOXte
	 UVzqZh+or7dDyFm/ogv6Vz88DYJfSiZ34SmQ2duChP+VAO1veqEJjztWBBm3dd9c41
	 y9Yt0CcmM/sAw==
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
Subject: [PATCH 13/21] arc: dma-mapping: skip invalidating before bidirectional DMA
Date: Mon, 27 Mar 2023 14:13:09 +0200
Message-Id: <20230327121317.4081816-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051553_681774_E6C4B908 
X-CRM114-Status: GOOD (  14.79  )
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

Some architectures that need to invalidate buffers after bidirectional
DMA because of speculative prefetching only do a simpler writeback
before that DMA, while architectures that don't need to do the second
invalidate tend to have a combined writeback+invalidate before the
DMA.

arc is one of the architectures that does both, which seems unnecessary.

Change it to behave like arm/arm64/xtensa instead, and use just a
writeback before the DMA when we do the invalidate afterwards.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/mm/dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 2a7fbbb83b70..ddb96786f765 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -40,7 +40,7 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
  *          |----------------------------------------------------------------
  * TO_DEV   |   writeback        writeback      |   none          none
  * FROM_DEV |   invalidate       invalidate     |   invalidate*   invalidate*
- * BIDIR    |   writeback+inv    writeback+inv  |   invalidate    invalidate
+ * BIDIR    |   writeback        writeback      |   invalidate    invalidate
  *
  *     [*] needed for CPU speculative prefetches
  *
@@ -61,7 +61,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		break;
 
 	case DMA_BIDIRECTIONAL:
-		dma_cache_wback_inv(paddr, size);
+		dma_cache_wback(paddr, size);
 		break;
 
 	default:
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
