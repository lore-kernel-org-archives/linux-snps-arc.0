From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 21 Dec 2018 09:36:03 -0800
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <alpine.DEB.2.21.1812211426060.30727@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182243320.30183@digraph.polyomino.org.uk>
 <db17a8c2-fdbf-4956-f710-ad4a9d9b6501@synopsys.com>
 <alpine.DEB.2.21.1812182349510.30183@digraph.polyomino.org.uk>
 <0f83e63b-dc21-0809-9295-1dde08ab3cc7@synopsys.com>
 <alpine.DEB.2.21.1812211426060.30727@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a598fc2a-c8d9-ca5e-9497-12d44a919d1c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/21/18 6:32 AM, Joseph Myers wrote:
> On Fri, 21 Dec 2018, Vineet Gupta wrote:
> 
>> is due to linkage of a generic libgcc routine fp-bit.c
> 
> I'd suggest moving from fp-bit to soft-fp in libgcc (soft-fp is a lot 
> faster, see the 2006 GCC Summit proceedings, though of course you may wish 
> to do your own benchmarking on ARC), which would probably avoid that issue 

It seems the we have "assisted" soft-fp: hand tweaked assembler written originally
by Joern, so he and/or Claudiu can advise on that. Although the asm was tweaked
for prev core/micro-architecture it should likely be faster than generic "C" code
I presume.

> (though if very concerned about about code size, soft-fp is a bit larger).  

Not for glibc :-) (uClibc is a different story, but it seems with largers RAMs and
disks size is kind of becoming moot unless deeply embedded.

> But the "?" in localplt.data would still make sense as long as the GCC 
> versions using fp-bit there are supported for building the ARC glibc port.

Right, added that already.
