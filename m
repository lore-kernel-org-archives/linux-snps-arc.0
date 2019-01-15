From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 15 Jan 2019 16:58:17 +0000
Subject: [PATCH 1/2] ARCv2: LIB: memeset: fix doing prefetchw outside of
 buffer
References: <20190114151649.32726-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501464272C9@US01WEMBX2.internal.synopsys.com>
 <1547553603.24248.49.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642748E@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/15/19 4:00 AM, Eugeniy Paltsev wrote:
>>> -#ifdef PREALLOC_NOT_AVAIL
>>> -	prefetchw [r3, 64]	;Prefetch the next write location
>>> -#else
>>> -	prealloc  [r3, 64]
>>> -#endif
>>> +	PREALLOC_INSTR([r3, 64]) ;Prefetch the next write location
>> These are not solving the issue - I'd break this up and move these bits to your
>> next patch.
> Actually these are solving another issue - current implementation may call
> 'prealloc' instruction for L1 cache line which doesn't fully belongs to
> memeset area in case of 128B L1 D$ line length. As the 'prealloc' fill cache line
> with zeros this leads to data corruption.
>
> So I would better keep these changes in this 'fix' patch.

Fair enough. Although technically it is different bug which we haven't actually
hit, found by code review.

> BTW, I've forgot again to add Cc: stable at vger.kernel.org, could you add it for me,
> when applying patch?
> Thanks.

Yes, I did that already !

-Vineet
