From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 15 Jun 2018 16:30:01 +0000
Subject: [PATCH 08/21] udl-kms: avoid prefetch
In-Reply-To: <alpine.LRH.2.02.1806061138080.7464@file01.intranet.prod.int.rdu2.redhat.com>
References: <20180603144053.875668929@twibright.com>
 <20180603144221.959741603@twibright.com>
 <d07eb94b8b20a7b9f57f341a51cdcdbb91a60175.camel@synopsys.com>
 <alpine.LRH.2.02.1806051123300.7248@file01.intranet.prod.int.rdu2.redhat.com>
 <fad12efd7a0f93e1dd6de5e7bf0c45832e6d74ea.camel@synopsys.com>
 <alpine.LRH.2.02.1806061138080.7464@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c00416da8a1fd5bb3678b5eb6148fcc631848367.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Mikulas,

On Wed, 2018-06-06@11:46 -0400, Mikulas Patocka wrote:
> 
> On Wed, 6 Jun 2018, Alexey Brodkin wrote:
> 
> > Hi Mikulas,
> > 
> > On Tue, 2018-06-05@11:30 -0400, Mikulas Patocka wrote:
> > > 
> > > On Tue, 5 Jun 2018, Alexey Brodkin wrote:
> > > 
> > > > Hi Mikulas,
> > > > 
> > > > On Sun, 2018-06-03@16:41 +0200, Mikulas Patocka wrote:
> > > > > Modern processors can detect linear memory accesses and prefetch data
> > > > > automatically, so there's no need to use prefetch.
> > > > 
> > > > Not each and every CPU that's capable of running Linux has prefetch
> > > > functionality :)
> > > > 
> > > > Still read-on...
> > > > 
> > > > > Signed-off-by: Mikulas Patocka <mpatocka at redhat.com>
> > > > > 
> > > > > ---
> > > > >  drivers/gpu/drm/udl/udl_transfer.c |    7 -------
> > > > >  1 file changed, 7 deletions(-)
> > > > > 
> > > > > Index: linux-4.16.12/drivers/gpu/drm/udl/udl_transfer.c
> > > > > ===================================================================
> > > > > --- linux-4.16.12.orig/drivers/gpu/drm/udl/udl_transfer.c	2018-05-31 14:48:12.000000000 +0200
> > > > > +++ linux-4.16.12/drivers/gpu/drm/udl/udl_transfer.c	2018-05-31 14:48:12.000000000 +0200
> > > > > @@ -13,7 +13,6 @@
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/slab.h>
> > > > >  #include <linux/fb.h>
> > > > > -#include <linux/prefetch.h>
> > > > >  #include <asm/unaligned.h>
> > > > >  
> > > > >  #include <drm/drmP.h>
> > > > > @@ -51,9 +50,6 @@ static int udl_trim_hline(const u8 *bbac
> > > > >  	int start = width;
> > > > >  	int end = width;
> > > > >  
> > > > > -	prefetch((void *) front);
> > > > > -	prefetch((void *) back);
> > > > 
> > > > AFAIK prefetcher fetches new data according to a known history... i.e. based on previously
> > > > used pattern we'll trying to get the next batch of data.
> > > > 
> > > > But the code above is in the very beginning of the data processing routine where
> > > > prefetcher doesn't yet have any history to know what and where to prefetch.
> > > > 
> > > > So I'd say this particular usage is good.
> > > > At least those prefetches shouldn't hurt because typically it
> > > > would be just 1 instruction if those exist or nothing if CPU/compiler doesn't
> > > > support it.
> > > 
> > > See this post https://urldefense.proofpoint.com/v2/url?u=https-3A__lwn.net_Articles_444336_&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl
> > > 656e
> > > ViXO7breS55ytWkhpk5R81I&m=a5RaqJtvajFkM1hL7bOKD5jV7cpFfTvG2Y1cYCdBPd0&s=w0W8wFtAgENp8TE6RzdPGhdKRasJc_otIn08V0EkgrY&e= where they measured that 
> > > prefetch hurts performance. Prefetch shouldn't be used unless you have a 
> > > proof that it improves performance.
> > > 
> > > The problem is that the prefetch instruction causes stalls in the pipeline 
> > > when it encounters TLB miss and the automatic prefetcher doesn't.
> > 
> > Wow, thanks for the link.
> > I didn't know about that subtle issue with prefetch instructions on ARM and x86.
> > 
> > So OK in case of UDL these prefetches anyways make not not much sense I guess and there's
> > something worse still, see what I've got from WandBoard Quad running kmscube [1] application
> > with help of perf utility:
> > --------------------------->8-------------------------
> > # Overhead  Command  Shared Object            Symbol 
> > # ........  .......  .......................  ........................................
> > #
> >     92.93%  kmscube  [kernel.kallsyms]        [k] udl_render_hline
> >      2.51%  kmscube  [kernel.kallsyms]        [k] __divsi3
> >      0.33%  kmscube  [kernel.kallsyms]        [k] _raw_spin_unlock_irqrestore
> >      0.22%  kmscube  [kernel.kallsyms]        [k] lock_acquire
> >      0.19%  kmscube  [kernel.kallsyms]        [k] _raw_spin_unlock_irq
> >      0.17%  kmscube  [kernel.kallsyms]        [k] udl_handle_damage
> >      0.12%  kmscube  [kernel.kallsyms]        [k] v7_dma_clean_range
> >      0.11%  kmscube  [kernel.kallsyms]        [k] l2c210_clean_range
> >      0.06%  kmscube  [kernel.kallsyms]        [k] __memzero
> > --------------------------->8-------------------------
> > 
> > That said it's not even USB 2.0 which is a bottle-neck but
> > computations in the udl_render_hline().
> > 
> > 
> > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__cgit.freedesktop.org_mesa_kmscube_&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl65
> > 6eViXO7breS55ytWkhpk5R81I&m=pj60-2aLQeePuzK_lo0lQ1j9GenwSnjZ6UmI3r_nbBU&s=JMUk3_YdOpEQTbIyAs0hGvbUgNRhn4ytlIaJ9iE_Lbk&e=
> > 
> > -Alexey
> 
> Try this patch 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__people.redhat.com_-7Empatocka_patches_kernel_udl_udlkms-2Davoid-2Ddivision.patch&d=DwIBAg&c=DPL6
> _X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=pj60-
> 2aLQeePuzK_lo0lQ1j9GenwSnjZ6UmI3r_nbBU&s=HNJmAaDh2uo9wtYsChwu_TpeOY5PmkUDpicFArzK3wE&e=
> 
> It is doing a lot of divisions - and WandBoard has Cortex-A9, that doesn't 
> have division instruction.

Looks like that patch makes not that much of a difference.

Below are results of perf.

Without patch:
----------------------------->8-------------------------------------------
 91.46% kmscube  [kernel.kallsyms]        [k] udl_render_hline
 2.15%  kmscube  [kernel.kallsyms]        [k] __divsi3
 1.09%  kmscube  [kernel.kallsyms]        [k] mmioset
 0.48%  kmscube  [kernel.kallsyms]        [k] _raw_spin_unlock_irq
 0.48%  kmscube  [kernel.kallsyms]        [k] v7_dma_clean_range
 0.34%  kmscube  [kernel.kallsyms]        [k] _raw_spin_unlock_irqrestore
 0.28%  kmscube  [kernel.kallsyms]        [k] l2c210_clean_range
 0.25%  kmscube  [kernel.kallsyms]        [k] shmem_getpage_gfp.constprop.4
 0.18%  kmscube  [kernel.kallsyms]        [k] lock_acquire

With patch:
----------------------------->8-------------------------------------------
 94.81% kmscube  [kernel.kallsyms]        [k] udl_render_hline
 0.88%  kmscube  [kernel.kallsyms]        [k] mmioset
 0.44%  kmscube  [kernel.kallsyms]        [k] _raw_spin_unlock_irq
 0.38%  kmscube  [kernel.kallsyms]        [k] v7_dma_clean_range
 0.33%  kmscube  [kernel.kallsyms]        [k] _raw_spin_unlock_irqrestore
 0.22%  kmscube  [kernel.kallsyms]        [k] l2c210_clean_range
 0.16%  kmscube  [kernel.kallsyms]        [k] shmem_getpage_gfp.constprop.4
 0.16%  kmscube  [kernel.kallsyms]        [k] udl_handle_damage
 0.16%  kmscube  [kernel.kallsyms]        [k] lock_acquire
----------------------------->8-------------------------------------------

There is no mode __divsi3 function in perf results, so patch works.
But this function was just ~2% of overall overhead.

-Alexey
