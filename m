From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 15 Nov 2017 15:26:57 +0000
Subject: [PATCH] arc: Flush and invalidate caches on start
In-Reply-To: <1504197268.3799.8.camel@synopsys.com>
References: <20170831142158.27245-1-abrodkin@synopsys.com>
 <7a5267e3-c012-7bfd-ced2-cfaa3f47524a@synopsys.com>
 <1504197268.3799.8.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510759616.29843.39.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2017-08-31@16:34 +0000, Alexey Brodkin wrote:
> Hi Vineet,
> 
> On Thu, 2017-08-31@09:31 -0700, Vineet Gupta wrote:
> > 
> > On 08/31/2017 07:22 AM, Alexey Brodkin wrote:
> > > 
> > > 
> > > This is useful to make sure no stale data exists in caches after bootloaders.
> > > The worst thing could be some lines of cache were locked in a bootloader
> > > for example during DDR recalibration and never unlocked. This may lead
> > > to really unpredictable issues later down the line.
> > > 
> > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > > ---
> > > ? arch/arc/kernel/head.S | 16 ++++++++++++++++
> > > ? 1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
> > > index 8b90d25a15cc..04e28b664183 100644
> > > --- a/arch/arc/kernel/head.S
> > > +++ b/arch/arc/kernel/head.S
> > > @@ -34,6 +34,10 @@
> > > ? #endif
> > > ??	sr	r5, [ARC_REG_IC_CTRL]
> > > ??
> > > +	; Invalidate entire I$
> > > +	mov	r5, 1
> > > +	sr	r5, [ARC_REG_IC_IVIC]
> > > +
> > > ? 1:
> > > ??	lr	r5, [ARC_REG_DC_BCR]
> > > ??	breq????r5, 0, 1f		; D$ doesn't exist
> > > @@ -46,6 +50,18 @@
> > > ? #endif
> > > ??	sr	r5, [ARC_REG_DC_CTRL]
> > > ??
> > > +	; Flush entire D$
> > > +	mov	r5, 1
> > > +	sr	r5, [ARC_REG_DC_FLSH]
> > > +	; Wait for flush operation to complete
> > > +1:
> > > +	lr	r5, [ARC_REG_DC_CTRL]
> > > +	bbit1	r5, DC_CTRL_FLUSH_STATUS, 1b

Looking more at this stuff I think that on that early stage there's no point
in flushing of D$, moreover it could be dangerous as if there's some garbage in there it
will contaminate DDR with good data.

> > > +	; Invalidate entire D$
> > > +	mov	r5, 1
> > > +	sr	r5, [ARC_REG_DC_IVDC]
> > > +
> > 
> > AFAIK uboot already flushes the caches before handing control over to kernel - so?
> > why do we need it here.
> > If uboot is locking lines, it needs to fix that and not penalize the general case?
> > with or w/o uboot !
> 
> U-Boot indeed flushes caches.. but doesn't invalidate them!
> And only invalidation unlocks locked lines.
> 
> That indeed should be added in U-Boot but I'd say above stuff doesn't
> influence a lot code size or execution time while makes system more fool-proof.

As for invalidation that IMHO is really important especially for I$.
See even if we do proper invalidation of both caches in say U-Boot but keep caches
enabled at least the last I$ line that contained last "jump" instruction will left
in the cache. And now if we're unlucky enough we may execute code that overlaps location
of that last "jump" and instead of expected instruction freshly loaded from DDR we'll execute
garbage left-over.

Note this is not just a theory, we hit that problem trying to execute U-Boot from u-Boot
(not kidding - we do self-upgrade that way).

Similar idea could be valid for D$ even though not very likely but still...
Given code in U-boot writen in C even in between dcache_flush() and icache_invalidate()
might happen some data accesses hidden in implementations of those functions.
In fact currently we do checks if SLC exist in those functions and that check is done
via polling a global var, so for sure some LD instructions are executed there.

That said if my explanation now makes more sense I'd be willing to send a v2 with
invalidation of all caches (I$, D$ and SLC).

-Alexey
