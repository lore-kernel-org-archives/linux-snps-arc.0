From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 17 Jul 2019 18:54:59 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <BN6PR1201MB0035E304FF25609CBCACBD09B6C90@BN6PR1201MB0035.namprd12.prod.outlook.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <57076361ad37f4fe7a5584643ae47adf30a99d35.camel@synopsys.com>
 <BN6PR1201MB0035E304FF25609CBCACBD09B6C90@BN6PR1201MB0035.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <401bc54416a106141b0ec785bfd9198ed56a84d8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2019-07-17@17:45 +0000, Vineet Gupta wrote:
> On 7/17/19 8:09 AM, Eugeniy Paltsev wrote:
> > > > +/* Halt system on fatal error to make debug easier */
> > > > +#define arc_jl_fatal(format...)						\
> > > > +({									\
> > > > +	pr_err(JUMPLABEL_ERR format);					\
> > > > +	BUG();								\
> > > Does it make sense to bring down the whole system vs. failing and returning.
> > > I see there is no error propagation to core code, but still.
> > I totally agree with Peter, and I prefer to stop the system on this errors. Here is few arguments:
> > All this checks can't be toggle in system operating normally and only may be caused by bad code generation (or some code/data corruption):
> > 1) We got our instruction to patch unaligned by 4 bytes (despite the fact that we used '.balign 4' to align it)
> > 2) We got branch offset unaligned (which means that we calculate it wrong at build time or corrupt it in run time)
> > 3) We got branch offset which not fits into s25. As this is offset inside one function (inside one 'if' statement actually) we newer get such huge
> > offset in real life if code generation is ok.
> 
> I understand that. But AFAIKR in implementation arc_jl_fatal() gets called before
> we have done the actual code patching and/or flushing the caches

Correct.

>  to that effect.
> So harm has been done just yet. We just need to make sure that any book-keeping of
> true/false is not yet done or unrolled.

Can you describe your proposal in more detail?

Be noted that in case (2) or (3) we know that we are not able to generate correct instruction for replace existing one. And we don't know anything
about the real cause.
So what we can do here besides that we warn about it?

-We can halt the system to make debug easy (which I propose)
-We can generate invalid instruction.
-We can just skip this patching. In that case we'll end with some 'if' statements [in kernel code] working incorrectly. I really don't want to debug
this.

Given that we'll never face with this asserts in any consistent state I don't see any reason why we shouldn't simply call BUG() here.

> 
> > If we only warn to log and return we will face with compromised kernel flow later.
> > I.E. it could be 'if' statement in kernel text which is switched to wrong state: the condition is true but we take the false branch.
> > And It will be the issue which is much more difficult to debug.
> > 
> > Does it sound reasonably?
> 
> I'm still not convinced that by hitting the _fatal() we are in some inconsistent
> state already. But if u feel strongly lets keep it.
> 
> > If you really don't want to have BUG here, I can make it conditionally enabled
> 
> Not a good idea. It is unconditionally present or not. Not something in between.
> 
> > in depend on CONFIG_ARC_STATIC_KEYS_DEBUG as I want to have it enabled at least on ARC development platforms.
> 
> 
-- 
 Eugeniy Paltsev
