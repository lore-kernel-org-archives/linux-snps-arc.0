From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 24 Nov 2015 09:46:40 +0000
Subject: + arc-convert-to-dma_map_ops.patch added to -mm tree
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org>
 <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
 <20151124075047.GA29572@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D3928@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 24 November 2015 01:20 PM, hch@lst.de wrote:
> Hi Vineet,
>
> the original version went through the buildbot, which succeeded.  It seems
> like the official buildbot does not support arc, and might benefit from
> helping to set up an arc environment. 

I have in the past asked kisskb service folks - but haven't heard back from them.
Stephan, Michael could you please add ARC toolchain to kisskb build service. I can
buy you guys a beer (or some other beverage of choice) next time we meet :-)

>  However in the meantime Guenther
> send me output from his buildbot and I sent a fix for arc.

Ok - perhaps Guenter didn't CC me and hence I didn't see you fix.

Thx for doing this series BTW, I was meaning to do this myself as some customers
asked for using dma_attr_t etc for their upcoming platform.

-Vineet
