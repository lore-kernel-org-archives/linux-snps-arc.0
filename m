From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 20 Jun 2019 09:52:24 +0200
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190620075224.GT3419@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Jun 19, 2019@11:55:41PM +0000, Vineet Gupta wrote:
> On 6/19/19 1:12 AM, Peter Zijlstra wrote:

> >>> +static inline u32 arc_gen_nop(void)
> >>> +{
> >>> +	/* 1x 32bit NOP in middle endian */
> > I dare not ask...
> 
> :-) The public PRM is being worked on for *real* so this will be remedied in a few
> months at best.
> 
> Short answer is it specifies how instruction stream is laid out in code memory for
> efficient next PC decoding given that ARC can freely intermix 2, 4, 6, 8 byte
> instruction fragments w/o any restrictions.
> 
> Consier SWI insn encoding: per PRM is
> 
> 31                                     0
> --------------------------------------------------------------
> 00100    010    01    101111    0    000    000000    111111
> --------------------------------------------------------------
> 
> In regular little endian notation, in memory it would have looked as
> 
> 31                  0
>  0x22    0x6F    0x00    0x3F 
>   b3     b2      b1      b0
> 
> However in middle endian format, the 2 short words are flipped
> 
> 31                   0
> 0x00    0x3F   0x22     0x6F   
>   b1     b0      b3       b2

I'm probably missing something here. I understand the I-fetch likes 2
byte chunks, but I'm not sure I understand how you end up with middle
endian.

With everything little endian, everything seems just fine. If you load
the first 2 byte at offset 0, you get the first 2 bytes of the
instruction.

If OTOH your arch big endian, and you were to load the first two bytes
at offset 0, you get the top two.

So this middle endian scheme, only seems to make sense if you're
otherwise big endian. But AFAICT ARC is bi-endian and the jump-label
patch under condsideration is explicitly !CPU_ENDIAN_BE32 -- which
suggests the instruction stream is sensitive to the endian selection.

Anyway, I was just 'surprised' at seeing middle endian mentioned,
curiosity killed the cat and all that :-)
