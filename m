From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 17 Jul 2019 17:45:52 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <57076361ad37f4fe7a5584643ae47adf30a99d35.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <BN6PR1201MB0035E304FF25609CBCACBD09B6C90@BN6PR1201MB0035.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

On 7/17/19 8:09 AM, Eugeniy Paltsev wrote:
>>> +/* Halt system on fatal error to make debug easier */
>>> +#define arc_jl_fatal(format...)						\
>>> +({									\
>>> +	pr_err(JUMPLABEL_ERR format);					\
>>> +	BUG();								\
>> Does it make sense to bring down the whole system vs. failing and returning.
>> I see there is no error propagation to core code, but still.
> I totally agree with Peter, and I prefer to stop the system on this errors. Here is few arguments:
> All this checks can't be toggle in system operating normally and only may be caused by bad code generation (or some code/data corruption):
> 1) We got our instruction to patch unaligned by 4 bytes (despite the fact that we used '.balign 4' to align it)
> 2) We got branch offset unaligned (which means that we calculate it wrong at build time or corrupt it in run time)
> 3) We got branch offset which not fits into s25. As this is offset inside one function (inside one 'if' statement actually) we newer get such huge
> offset in real life if code generation is ok.

I understand that. But AFAIKR in implementation arc_jl_fatal() gets called before
we have done the actual code patching and/or flushing the caches to that effect.
So harm has been done just yet. We just need to make sure that any book-keeping of
true/false is not yet done or unrolled.

> If we only warn to log and return we will face with compromised kernel flow later.
> I.E. it could be 'if' statement in kernel text which is switched to wrong state: the condition is true but we take the false branch.
> And It will be the issue which is much more difficult to debug.
>
> Does it sound reasonably?

I'm still not convinced that by hitting the _fatal() we are in some inconsistent
state already. But if u feel strongly lets keep it.

>
> If you really don't want to have BUG here, I can make it conditionally enabled

Not a good idea. It is unconditionally present or not. Not something in between.

> in depend on CONFIG_ARC_STATIC_KEYS_DEBUG as I want to have it enabled at least on ARC development platforms.
