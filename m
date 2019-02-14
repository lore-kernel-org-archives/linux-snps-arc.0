From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 14 Feb 2019 12:05:47 +0000
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <20190214110813.GK32494@hirez.programming.kicks-ass.net>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
 <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
 <20190214103140.GG32494@hirez.programming.kicks-ass.net>
 <4881796E12491D4BB15146FE0209CE64681DB122@DE02WEMBXB.internal.synopsys.com>
 <20190214110813.GK32494@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE64681DB202@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces at lists.infradead.org> On Behalf Of Peter Zijlstra
> Sent: Thursday, February 14, 2019 2:08 PM
> To: Alexey Brodkin <alexey.brodkin at synopsys.com>
> Cc: Mark Rutland <mark.rutland at arm.com>; Vineet Gupta <vineet.gupta1 at synopsys.com>; linux-
> kernel at vger.kernel.org; stable at vger.kernel.org; David Laight <David.Laight at ACULAB.COM>; Arnd Bergmann
> <arnd.bergmann at linaro.org>; linux-snps-arc at lists.infradead.org
> Subject: Re: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
> 
> On Thu, Feb 14, 2019@10:44:49AM +0000, Alexey Brodkin wrote:
> > > On Wed, Feb 13, 2019@03:23:36PM -0800, Vineet Gupta wrote:
> > > > On 2/13/19 4:56 AM, Peter Zijlstra wrote:
> > > > >
> > > > > Personally I think u64 and company should already force natural
> > > > > alignment; but alas.
> > > >
> > > > But there is an ISA/ABI angle here too. e.g. On 32-bit ARC, LDD (load double) is
> > > > allowed to take a 32-bit aligned address to load a register pair. Thus all u64
> > > > need not be 64-bit aligned (unless attribute aligned 8 etc) hence the relaxation
> > > > in ABI (alignment of long long is 4). You could certainly argue that we end up
> > > > undoing some of it anyways by defining things like ARCH_KMALLOC_MINALIGN to 8, but
> > > > still...
> > >
> > > So what happens if the data is then split across two cachelines; will a
> > > STD vs LDD still be single-copy-atomic? I don't _think_ we rely on that
> > > for > sizeof(unsigned long), with the obvious exception of atomic64_t,
> > > but yuck...
> >
> > STD & LDD are simple store/load instructions so there's no problem for
> > their 64-bit data to be from 2 subsequent cache lines as well as 2 pages
> > (if we're that unlucky). Or you mean something else?
> 
> u64 x;
> 
> WRITE_ONCE(x, 0x1111111100000000);
> WRITE_ONCE(x, 0x0000000011111111);
> 
> vs
> 
> t = READ_ONCE(x);
> 
> is t allowed to be 0x1111111111111111 ?
> 
> If the data is split between two cachelines, the hardware must do
> something very funny to avoid that.
> 
> single-copy-atomicity requires that to never happen; IOW no load or
> store tearing. You must observe 'whole' values, no mixing.
> 
> Linux requires READ_ONCE()/WRITE_ONCE() to be single-copy-atomic for
> <=sizeof(unsigned long) and atomic*_read()/atomic*_set() for all atomic
> types. Your atomic64_t alignment should ensure this is so.

Thanks for explanation!

I'm not completely sure about single-copy-atomic for our LDD/STD instructions
(need to check with HW guys) but given above requirement:
---------------------------->8--------------------------
READ_ONCE()/WRITE_ONCE() to be single-copy-atomic for <=sizeof(unsigned long)
---------------------------->8--------------------------
that's OK for them (LDD/STD) to not follow this, right? As they are obviously
longer than "unsigned long".

Though I'm wondering if READ_ONCE()/WRITE_ONCE() could be used on 64-bit data
even on 32-bit arches?

Now as for LLOCKD/SCONDD which implement single instruction 64-bit atomics require
double-word alignment and so cannot possible span between cache lines.

So what am I missing here?

> So while I think we're fine, I do find hardware instructions that tear
> yuck (yah, I know, x86...)
> 
> > > So even though it is allowed by the chip; does it really make sense to
> > > use this?
> >
> > It gives performance benefits when dealing with either 64-bit or even
> > larger buffers, see how we use it in our string routines like here [1].
> >
> > [1] https://urldefense.proofpoint.com/v2/url?u=https-
> 3A__git.kernel.org_pub_scm_linux_kernel_git_torvalds_linux.git_tree_arch_arc_lib_memset-2Darchs.S-
> 23n81&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=m60hCzPFQMtxeg
> 9HR5zZOJcRFMs6WLFJNSc6TNDqd4Y&s=Tapp7zbAmYYaTIaO5yKM0yUKfnaURFxdr56TS-JappQ&e=
> 
> That doesn't require the ABI alignment crud.

I'm not saying it has something to do with our ABI - that's just how we use it.

-Alexey
