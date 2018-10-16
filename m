From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 16 Oct 2018 17:27:34 +0000
Subject: [PATCH] ARC: IOC: panic if kernel was started with previously
 enabled IOC
References: <20181004131212.16405-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B0AE414@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/04/2018 06:12 AM, Eugeniy Paltsev wrote:
> Disabling and reconfiguring of IOC are quite a tricky actions because
> nobody knows what happens if there're IOC-ahndled tarnsactions in flight
> when we're disabling IOC.
>
> And the problem is external DMA masters [that were initialized and set
> in a bootlaoder that was executed before we got here] might continue
> to send data to memory even at this point and we have no way to prevent
> that.
>
> That said it's much safer to not enable IOC at all anywhere before Linux
> kernel.
>
> As we can build u-boot with IOC support (mostly for debugging purposes)
> let's check that kernel was started with disabled IOC regardless of
> our plans to use it or not.
>
> Also while I'm at it, replace hardcoded bits in ARC_REG_IO_COH_PARTIAL
> and ARC_REG_IO_COH_ENABLE registers by definitions.
>
> Inspired by: https://lkml.org/lkml/2018/1/19/557
>

Applied with updated changelog !

-Vineet
