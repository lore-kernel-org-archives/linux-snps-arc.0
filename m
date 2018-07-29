From: davem@davemloft.net (David Miller)
Date: Sun, 29 Jul 2018 12:35:10 -0700 (PDT)
Subject: [PATCH] NET: stmmac: align DMA stuff to largest cache line length
In-Reply-To: <20180726120537.4664-1-Eugeniy.Paltsev@synopsys.com>
References: <20180726120537.4664-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180729.123510.1847228041867717113.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Date: Thu, 26 Jul 2018 15:05:37 +0300

> As for today STMMAC_ALIGN macro (which is used to align DMA stuff)
> relies on L1 line length (L1_CACHE_BYTES).
> This isn't correct in case of system with several cache levels
> which might have L1 cache line length smaller than L2 line. This
> can lead to sharing one cache line between DMA buffer and other
> data, so we can lose this data while invalidate DMA buffer before
> DMA transaction.
> 
> Fix that by using SMP_CACHE_BYTES instead of L1_CACHE_BYTES for
> aligning.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

This is definitely an improvement, so applied and queued up for
-stable.

There is also dma_get_cache_alignment(), so maybe we can eventually
use that here instead.
