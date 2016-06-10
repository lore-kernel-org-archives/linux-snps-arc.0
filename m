From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 10 Jun 2016 10:55:52 +0000
Subject: [PATCH v4 43/44] dma-mapping: Remove dma_get_attr
References: <1465553521-27303-1-git-send-email-k.kozlowski@samsung.com>
 <1465553521-27303-44-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501069390A9@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 10 June 2016 03:44 PM, Krzysztof Kozlowski wrote:
> After switching DMA attributes to unsigned long it is easier to just
> compare the bits.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
> [for avr32]
> Acked-by: Hans-Christian Noren Egtvedt <egtvedt at samfundet.no>

Acked-by: Vineet Gupta <vgupta at synopsys.com>   #for arch/arc
