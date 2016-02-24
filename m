From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 24 Feb 2016 14:10:43 +0000
Subject: [PATCH] arc: make sure __delay() never gets executed with 0 loops
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8BD8E@us01wembx1.internal.synopsys.com>
References: <1455554267-23886-1-git-send-email-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8BD8E@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456323043.3392.30.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2016-02-24@05:05 +0000, Vineet Gupta wrote:
> On Monday 15 February 2016 10:07 PM, Alexey Brodkin wrote:
> > Current implementation of __delay() function uses so-called
> > zero-delay loops. And the only condition to exit that loop is
> > LP_COUNT (loop count register) = 1 (but not 0 as it might be easily
> > imagined).
> 
> So u can fix this better by doing a lp.nz, but....
> 
> > So if our calculation of "loops" gives 0 (and that is pretty possible
> > given result of multiplication being >> 32) then zero-delay loop
> > mechanism starts with LP_COUNT=0 and it ends up decrementing LP_COUNT
> > while staying in the loop effectively producing close to infinite delay
> > instead of very short one.
> > 
> > I bumped into it with AXS101 + external DDR controller and caches
> > disabled. In that case I've got very small
> > loops_per_jiffy=0xf00:
> 
> I understand this gives you grief, but the code is doing exactly what it is asked to.
> Since the system is slow, You are getting only 0xf00 (3840) loop iterations in 10ms.
> So if you want say a delay of 1 micro-sec, you will need to loop for 3840 / 10000
> ~ 0 loops
> 
> This all assumes our lpj computation is correct - otherwise that needs fixing too.
> 
> Anyways I think for genuine cases where the number of loops is indeed computed to
> 0 because caller was passing too small a value, it is better to wait for looong
> time to catch the bugger rather than silently returning. This is one of the cases
> where disease is better than the cure !

Ok, but see delays (even those for just a few usecs) might be justified by
hardware requirements (i.e. some peripheral need at least 10 usecs between this
and tat operations). So one driver will attempt to use completely correct value
for delay but on slow hardware (or especially in simulation) we'll get kernel
virtually stuck for no obvious reason.

So frankly I don't like proposal to keep existing implementation.
And solution with "lp.nz" looks much better to me.

-Alexey
