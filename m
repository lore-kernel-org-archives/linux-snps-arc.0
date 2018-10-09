From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 9 Oct 2018 12:23:18 +0000
Subject: [PATCH] ARC: IOC: panic if kernel was started with previously
 enabled IOC
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B09B9EF@us01wembx1.internal.synopsys.com>
References: <20181004131212.16405-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B09B9EF@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1539087798.23085.29.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2018-10-05@22:56 +0000, Vineet Gupta wrote:
> On 10/04/2018 06:12 AM, Eugeniy Paltsev wrote:
> >  
> > diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> > index f2701c13a66b..ee7b63e9c5e3 100644
> > --- a/arch/arc/mm/cache.c
> > +++ b/arch/arc/mm/cache.c
> > @@ -1144,6 +1144,25 @@ noinline void __init arc_ioc_setup(void)
> >  {
> >  	unsigned int ioc_base, mem_sz;
> >  
> > +	/*
> > +	 * Disabling and reconfiguring of IOC are quite a tricky actions because
> > +	 * nobody knows what happens if there're IOC-ahndled tarnsactions in
> > +	 * flight when we're disabling IOC.
> > +	 *
> > +	 * And the problem is external DMA masters [that were initialized and
> > +	 * set in a bootlaoder that was executed before we got here] might
> > +	 * continue to send data to memory even at this point and we have
> > +	 * no way to prevent that.
> > +	 *
> > +	 * That said it's much safer to not enable IOC at all anywhere before
> > +	 * Linux kernel.
> > +	 */
> > +	if (read_aux_reg(ARC_REG_IO_COH_ENABLE) & ARC_IO_COH_ENABLE_BIT)
> > +		panic("kernel was started with previously enabled IOC!\n");
> 
> While I understand the needs, this seems excessive, should we warm the user,
> instead of panic ? Did you run into specific issue to warrant this !

Yes we've run into this.
Remember, we have IOC disabled (actually 'not enabled') in most of HSDK linux demos
(https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot-demos/releases)

So we faced several times that this demos crashes different weird ways when we
accidentally launch them using old u-boot (which enables IOC by default!)

As we don't want to forcibly disable IOC during linux launch
(https://lkml.org/lkml/2018/1/19/557) 
I guess panic is what we need here.

> OTOH in recent past more than 1 person ran into some hsdk uboot shenanigans, where
> we had to upgrade the uboot to get it working with prebuit images - is that what
> you are trying to prevent here - panic early instead of random user errors / hangs
> later ?

Yes, I prefer to panic early instead of random errors / crashes later.
The problem with warning here is that it isn't very clear / easy to match warning
message with some random error.

> -Vineet
-- 
 Eugeniy Paltsev
