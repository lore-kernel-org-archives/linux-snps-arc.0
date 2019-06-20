From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Jun 2019 13:49:48 -0700
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <20190620075224.GT3419@hirez.programming.kicks-ass.net>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
 <20190620075224.GT3419@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9192bd26-5f34-dcbf-8552-2f474866a31e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 6/20/19 12:52 AM, Peter Zijlstra wrote:
> 
> With everything little endian, everything seems just fine. If you load
> the first 2 byte at offset 0, you get the first 2 bytes of the
> instruction.

It has to do with the instruction encoding scheme and what part of instruction has
the major opcode/subopcode etc. For a canonical 4 byte instruction they happen to
be in the upper 16 bits (for some hardware efficiency reasons unknown to me). So
when a 2 byte insn follows a 4 byte, a 4 byte fetch already tells it what the 2nd
instruction opcode is and whether it is a 2, 4, 6 or 8 byte insn.


> 
> If OTOH your arch big endian, and you were to load the first two bytes
> at offset 0, you get the top two.
> 
> So this middle endian scheme, only seems to make sense if you're
> otherwise big endian.

Insn encoding is always middl eendina - irrespective of endianness.

> But AFAICT ARC is bi-endian and the jump-label
> patch under condsideration is explicitly !CPU_ENDIAN_BE32 -- which
> suggests the instruction stream is sensitive to the endian selection.

Nope they are not directly related. Likely the difference is when we patch the
instruction to memory it is written as data so might need some endian swap. Not
really rocket science. Perhaps it saves some testing effort etc.
Also we don't seem to have any customers interested in BE these days.

> Anyway, I was just 'surprised' at seeing middle endian mentioned,
> curiosity killed the cat and all that :-)

Curiosity may certainly kill cats, but on lkml curiosity is almost always a good
thing both for the enquirer and enquiree ;-)
